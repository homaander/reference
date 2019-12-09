#!/bin/sh
#!/bin/bash

chmod u+x script.sh


a=10
b=20

sum=$((a + b))

a_str="Hello"
b_str="world"

com=$(ls)

# Вывод
	echo "lol";
	echo -e "\e[1;45m lol \e[0m"
	echo $a

	# Код возврата последней команды
	echo $?
	echo $USER

# Условия
	if grep $user_name /etc/passwd
	then
		echo "OK"
	fi

	# Сравнение цифр
	# -eq ->  ==
	# -gt ->  >
	# -ge ->  >=
	# -lt ->  <
	# -le ->  <=
	# -ne ->  !=

	if [ $a -eq $b ]
	then
		echo "OK"
	elif [ $a -gt $b ]
	then
		echo "ERR"
	else 
		echo "LOL"
	fi

	# Сравнение строк

	if [ $a_str = $b_str ]
	then
		echo "OK"
	elif [ $a_str > $b_str ]
	then
		echo "ERR"
	else 
		echo "LOL"
	fi

# Циклы
for item in 1 2 3 lol "hello world"
do
	echo "$item элемент"
done

IFS="\n"
for line in $(cat "data.txt")
do done

for ((i=0; i <= 10; i++))
do done


exit 0

grep

# Создать папку
mkdir my_dir

# Перейти в папку
cd my_dir
# Поднятся на каталог выше
cd ..

# Список файлов и папок
ls

# Переименовать файл
mv a b

# Скопировать файл
cp ../a b

# Содержимое файла
cat

# Разбить вывод постранично
cat | less

pwd
