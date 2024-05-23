robot (name, attack, hp) = \message -> message (name, attack, hp)

killerRobot = robot ("Bob", 15, 40)
gentleGiant = robot ("Jack", 20, 30)

name   (r, _, _) = r
attack (_, r, _) = r
hp     (_, _, r) = r

getName   aRobot = aRobot name
getAttack aRobot = aRobot attack
getHP     aRobot = aRobot hp
getAllHP list = map (\aRobot -> getHP aRobot) list


printRobot aRobot = aRobot (\(n, a, h) -> n ++ " A: " ++ (show a) ++ " H: " ++ (show h))

setName   aRobot newV = aRobot (\(_, b, c) -> robot (newV, b, c))
setAttack aRobot newV = aRobot (\(a, _, c) -> robot (a, newV, c))
setHP     aRobot newV = aRobot (\(a, b, _) -> robot (a, b, newV))

damage aRobot attackDamage = aRobot (\(n, a, h) -> robot (n, a, h - attackDamage))

fight aRobot dRobot = damage dRobot attackDamage
    where attackDamage = if getHP aRobot > 10
                         then getAttack aRobot
                         else 0

gentleGiantRound1 = fight killerRobot gentleGiant
killerRobotRound1 = fight gentleGiantRound1 killerRobot

gentleGiantRound2 = fight killerRobotRound1 gentleGiantRound1
killerRobotRound2 = fight gentleGiantRound2 killerRobotRound1

gentleGiantRound3 = fight killerRobotRound2 gentleGiantRound2
killerRobotRound3 = fight gentleGiantRound3 killerRobotRound2




