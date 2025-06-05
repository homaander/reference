# Скачать stack
sudo curl -sSL https://get.haskellstack.org/ | sh

# Запустить интерактивную среду
stack ghci

# Обновить stack
stack upgrade

# Установить библиотеку
stack install <lib>

# Новый проект
stack new <name> <lib>

# Собрать проект
stack build

# Запустить файл
stack runghc app/helloworld.hs

# Выполнить комманду
stack exec ghc-pkg -- list

stack ghc -- book/rpar.hs -O2 -threaded
stack run -- +RTS -N2 -s -RTS