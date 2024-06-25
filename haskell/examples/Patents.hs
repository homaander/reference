module Patents where

type FirstName  = String
type MiddleName = String
type LastName   = String

type Age    = Int
type Height = Int
type Widht  = Int

data Name = Name FirstName LastName
            | NameWithMiddle FirstName MiddleName LastName

data Sex = Male | Female

data RhType = Pos | Neg
data ABOType = A | B | AB | O
data BloodType = BloodType ABOType RhType

-- data Patient = Patient Name Sex Age Height Widht BloodType
data Patient = Patient {
      name      :: Name
    , sex       :: Sex
    , age       :: Age
    , height    :: Height
    , weight    :: Widht
    , bloodType :: BloodType
    }

showName :: Name -> String
showName (Name f l) = f ++ " " ++ l
showName (NameWithMiddle f m l) = f ++ " " ++ m ++ " " ++ l  

sexInitial :: Sex -> Char
sexInitial Male = 'M'
sexInitial Female = 'F'

showRh :: RhType -> String
showRh Pos = "+"
showRh Neg = "-"

showABO :: ABOType -> String
showABO A  = "A"
showABO B  = "B"
showABO AB = "AB"
showABO O  = "O"

showBloodType :: BloodType -> String
showBloodType (BloodType abo rh) = showABO abo ++ showRh rh

canDonateTo :: BloodType -> BloodType -> Bool
canDonateTo (BloodType O _) _  = True
canDonateTo _ (BloodType AB _) = True
canDonateTo (BloodType A _) (BloodType A _)  = True
canDonateTo (BloodType B _) (BloodType B _)  = True
canDonateTo _ _ = False

johnDoe :: Patient
johnDoe = Patient (Name "John" "Doe") Male 43 188 92 (BloodType AB Pos)

johnDoe2 :: Patient

janeSmith :: Patient
janeSmith = Patient (NameWithMiddle "Jane" "Elisabet" "Smith") Female 24 150 40 (BloodType A Neg)


-- patientInfo :: PatientName -> Age -> Height -> String
-- patientInfo patientName age height = name ++ " " ++ ageHeight
--     where name = getFirstName patientName ++ ", " ++ getLastName patientName
--           ageHeight = "(Age: " ++ show age ++ "; Height: " ++ show height ++ "sm)"

johnDoe2 = Patient {
      name      = Name "John" "Doe"
    , sex       = Male
    , age       = 43
    , height    = 188
    , weight    = 92
    , bloodType = BloodType AB Pos
    }

getJohnDoe2Age :: Age
getJohnDoe2Age = age johnDoe2

newJohnDoe2 :: Patient
newJohnDoe2 = johnDoe2 { age = 44 }