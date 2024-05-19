areaPerDiametr :: Double -> Double
areaPerDiametr size = pi * (size / 2)^2

type Pizza = (Double, Double)

costPerCm :: Pizza -> Double
costPerCm (size, cost) = cost / areaPerDiametr size

comparePizzas :: Pizza -> Pizza -> Pizza
comparePizzas p1 p2 = if costPC1 < costPC2
                      then p1
                      else p2
    where
        costPC1 = costPerCm p1
        costPC2 = costPerCm p2

resultText :: Pizza -> String
resultText (size, cost) = mconcat ["Result: ", show size, " Price: ", show priceSize]
    where priceSize = costPerCm (size, cost)

main :: IO ()
main = do
    putStrLn "P1 size:"
    p1size <- getLine
    putStrLn "P1 price:"
    p1price <- getLine
    putStrLn "P2 size:"
    p2size <- getLine
    putStrLn "P2 price:"
    p2price <- getLine
    let result = comparePizzas (read p1size, read p1price) (read p2size, read p2price)
    putStrLn (resultText result)
