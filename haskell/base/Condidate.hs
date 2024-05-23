import qualified Data.Map as Map

data Grade = F | D | C | B | A
    deriving (Eq, Ord, Enum, Show, Read)
data Degree = HS | BA | MS | PhD
    deriving (Eq, Ord, Enum, Show, Read)

data Condidate = Condidate {
    condidateId :: Int,
    codeReview :: Grade,
    cultureFit :: Grade,
    education :: Degree
} deriving Show

viable :: Condidate -> Bool
viable condidate = and tests
    where 
        tests = [testCodind, testCultureFit, testEducation]
        testCodind = codeReview condidate > B
        testCultureFit = cultureFit condidate > C
        testEducation = education condidate >= MS

myCond1 :: Condidate
myCond1 = Condidate {
    condidateId = 1,
    codeReview  = A,
    cultureFit  = B,
    education   = PhD
}

myCond2 :: Condidate
myCond2 = Condidate {
    condidateId = 2,
    codeReview  = B,
    cultureFit  = F,
    education   = MS
}

myCondList :: [Condidate]
myCondList = [myCond1, myCond2]

myCondMap :: Map.Map Int Condidate
myCondMap = Map.fromList [(1, myCond1), (2, myCond2)]

readCondidate :: IO Condidate
readCondidate = do
    putStrLn "ID:"
    cId <- read <$> getLine
    putStrLn "Code review:"
    cCodeReview <- read <$> getLine
    putStrLn "Culture fit:"
    cCultureFit <- read <$> getLine
    putStrLn "Education:"
    cEducation <- read <$> getLine
    pure Condidate {
        condidateId = cId,
        codeReview  = cCodeReview,
        cultureFit  = cCultureFit,
        education   = cEducation
    }

readAndVirifyCondidate :: Monad m => m Condidate -> m String
readAndVirifyCondidate condidates = do
    condidate <- condidates
    let passed = viable condidate
    let statement = if   passed
                    then "OK"
                    else "Fail"
    pure statement
