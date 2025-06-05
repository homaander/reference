Компиляция
`ghc a.hs`
Компиляци с наилучшей оптимизацией и потоками
`ghc -O2 rpar.hs -threaded`

### RTS
Запуск с 2 ядрами
`./book/rpar +RTS -N2 -RTS`
Вывод времени
`./book/rpar +RTS -N2 -s -RTS`
Вывод журнала для threadscope
`./book/rpar +RTS -N2 -s -l -RTS`


# Интерактивная консоль (ghci):
`ghci`
`ghci> :help`
`ghci> :type <expr>`

Repeat last command
`ghci> :`

Многострочная команда:
```
ghci> :{
  -- commands
:}
```

Выход
:q
