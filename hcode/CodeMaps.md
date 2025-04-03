*Карты кодирования*
```haskell
--Int
  -- 5 значные
    -- Def:
      (map . map) (fromLetter 10) ["00001","00001","00001","00009","00001"]
    -- HCode:
      (map . map) (fromLetter 10) ["00091","00910","09100","91000","10000"]
    -- Offsets: [2, 12342, 18740, 752, 1]

  -- 4 значные
    -- Def:
      (map . map) (fromLetter 10) ["0001","0001","0010","0001"]
    -- HCode:
      (map . map) (fromLetter 10) ["0091","0910","9100","1000"]
    -- Offsets: [2,368,1,1]

  -- 3 значные
    -- Def:
      (map . map) (fromLetter 10) ["001","001","001"]
    -- HCode:
      (map . map) (fromLetter 10) ["091","910","100"]
    -- Offsets: [2,193,1]

-- HNums16
  -- 5 значные
    -- Def:
      (map . map) (fromLetter 16) ["00001","00011","00100","00010","00001"]
    -- HCode:
      (map . map) (fromLetter 16) ["000F1","00F10","0F100","F1000","10000"]
    -- Offsets: [2,2,1,1,1]
  
  -- 4 значные
    -- Def:
      (map . map) (fromLetter 16) ["0001","0011","0010","0001"]
    -- HCode:
      (map . map) (fromLetter 16) ["00F1","0F10","F100","1000"]
    -- Offsets: [2,2,1,1]
  
  -- 3 значные
    -- Def:
      (map . map) (fromLetter 16) ["001","010","001"]
    -- HCode:
      (map . map) (fromLetter 16) ["0F1","F10","100"]
    -- Offsets: [2,1,1]

-- HNumsL
  -- 5 значные
    -- Def:
      (map . map) (fromLetter 37) ["00001","00001","00001","0000_","00001"]
    -- HCode:
      (map . map) (fromLetter 37) ["000_1","00_10","0_100","_1000","10000"]
    -- Offsets: [2, 50655, 1924853, 50692, 1]

  -- 4 значные 
    -- Def:
      (map . map) (fromLetter 37) ["0001","0011","0010","0001"]
    -- HCode:
      (map . map) (fromLetter 37) ["00_1","0_10","_100","1000"]
    -- Offsets: [1, 2, 1, 1]

  -- 3 значные
    -- Def:
      (map . map) (fromLetter 37) ["001","001","001"]
    -- HCode:
      (map . map) (fromLetter 37)["0_1","_10","100"]
    -- Offsets: [2, 39, 1]
```