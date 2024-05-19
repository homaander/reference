import Control.Monad
import Control.Monad.Trans.Select (select)
import Control.Applicative (Alternative)
import GHC.Base (Module)

data Name = Name {namefn :: String, nameln :: String}

instance Show Name where
    show :: Name -> String
    show (Name fn ln) = mconcat [fn, " ", ln]

data GradeLvl = F | D | C | B | A deriving (Show, Eq, Ord, Enum)

data Student = Student {
    studentId :: Int,
    studentGradeLvl :: GradeLvl,
    studentName :: Name 
    } deriving Show

data Teacher = Teacher {
    teacherId :: Int,
    teacherName :: Name
    } deriving Show

data Course = Course {
    courseId :: Int,
    courseTitle :: String,
    courseTeacherId :: Int
    } deriving Show

data Enrollment = Enrollment {
    enrollmentStudentId :: Int,
    enrollmentCourseId :: Int
    } deriving Show

data HINQ m a b = HINQ (m a -> m b) (m a) (m a -> m a) |
                  HINQ_ (m a -> m b) (m a)

students :: [Student]
students = [
    Student 1 A (Name "AA" "BB"),
    Student 2 D (Name "CC" "DD"),
    Student 3 C (Name "EE" "FF"),
    Student 4 A (Name "GG" "HH"),
    Student 5 F (Name "II" "JJ")
    ]


teachers :: [Teacher]
teachers = [
    Teacher 1 (Name "Yarik" "Rick"),
    Teacher 2 (Name "Andrew" "Lox")
    ]

courses :: [Course]
courses = [
    Course 10 "Math" 1,
    Course 11 "Rus" 2
    ]

enrollments :: [Enrollment]
enrollments = [
    Enrollment 2 10,
    Enrollment 3 11,
    Enrollment 4 10,
    Enrollment 2 11
    ]

_select :: Monad m => (a -> b) -> m a -> m b
_select f arr = do
    val <- arr
    return (f val)

_where :: (Monad m, Alternative m) => (a -> Bool) -> m a -> m a
_where ff arr = do
    val <- arr
    guard (ff val)
    return val

_join :: (Monad m, Alternative m, Eq c) => m a -> m b -> (a -> c) -> (b -> c) -> m (a, b)
_join data1 data2 p1 p2 = do
    d1 <- data1
    d2 <- data2
    guard (p1 d1 == p2 d2)
    let dp = (d1, d2)
    return dp


_hinq :: (Monad m, Alternative m) =>
         (m a -> m b) -> m a -> (m a -> m a) ->
         m b
_hinq selectQ joinQ whereQ = selectQ $ whereQ joinQ

runHINQ :: (Monad m, Alternative m) => HINQ m a b -> m b
runHINQ (HINQ selectQ joinQ whereQ) = selectQ $ whereQ joinQ
runHINQ (HINQ_ selectQ joinQ) = selectQ $ _where (const True) joinQ

finalResult :: [Name]
finalResult =
    _hinq (_select (teacherName . fst))
          (_join teachers courses teacherId courseTeacherId)
          (_where ((== "Rus") . courseTitle . snd))

query1 :: HINQ [] (Teacher, Course) Name
query1 =
    HINQ (_select (teacherName . fst))
         (_join teachers courses teacherId courseTeacherId)
         (_where ((== "Rus") . courseTitle . snd))

possibleTeacher :: Maybe Teacher
possibleTeacher = Just $ head teachers

possibleCourse :: Maybe Course
possibleCourse = Just $ head courses

queryMaybe1 :: HINQ Maybe (Teacher, Course) Name
queryMaybe1 =
    HINQ (_select (teacherName . fst))
         (_join possibleTeacher possibleCourse teacherId courseTeacherId)
         (_where ((== "Math") . courseTitle . snd))

queryStudentEnrollment :: HINQ [] (Student, Enrollment) (Name, Int)
queryStudentEnrollment =
    HINQ_ (_select (\(st, en) -> (studentName st, enrollmentCourseId en)))
          (_join students enrollments studentId enrollmentStudentId)