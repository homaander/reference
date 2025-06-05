Инициировать проект
`cabal init`

`cabal build`

`cabal install aeson`

ghci с настройками из cabal файла
`cabal repl`

`cabal unpack ...`

`cabal install --only-dependencies`
`cabal configure`

Запуск
`cabal run`
Запуск с параметром
`cabal run exes -- 1 2 3`

### RTS
`cabal run exes +RTS -s -RTS -O2`
`cabal run hCodeGUI-exe +RTS -s -RTS -O2`