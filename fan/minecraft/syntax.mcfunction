# Координаты <x> <y> <z>
	#  [-]<x>  [-]<y>  [-]<z> - Статические
	# ~[-]<x> ~[-]<y> ~[-]<z> - Относительные
	# ^[-]<x> ^[-]<y> ^[-]<d> - Локальные (взгляд): d - дальность

# Диапозоны <range>
 	# @e[distance=1   ]  - Ровно 1
	# @e[distance=1.. ]  - От 1 и больше
	# @e[distance=1..2]  - От 1 до 2
	# @e[distance=..2 ]  - До 2


# Выборки <selector>
	# Формат: @<глобальный селектор>[<свойство>=<значение>...]

	# @a - Все игроки
	# @e - Все сущьности
	# @p - Ближайший игрок
	# @s - Исполнитель комманды

	kill @e[type=minecraft:pig]
		# Тип сущьности
			# type=minecraft:pig  - Тип равен
			# type=!minecraft:pig - Тип равен

		# Режим игрока
			# gamemode=creative

		# Уровень опыта
			# level=<range>

		# Поворот вверх вниз
			# x_rotation=<range>
		# Поворот враво влево
			# y_rotation=<range>

		# Координата, относительно которой будут выполнятся остальные селекторы
			# x=<x>
			# y=<y>
			# z=<z>

		# Размеры облости
			# dx=<a>
			# dy=<a>
			# dz=<a>
		# Радиус (вместо размера)
			# distance=<range>

		# Имя (CousomName)
			# name=<name>
		# Тег
			# tag=<a>
		# Комманда
			# team=<team_id>

		# Значение скорборда
			# scores={<a>=<range>[, ...]}

		# NBT
			# nbt=<nbt>

		# Сортировка
			# sort=
					# nearest    # Ближайшие
					# furthest   # Дальние
					# arbitrary  # По списку загрузки
					# random     # Случайные

		# Лимит сущьности
			# limit=<range>



# Аттрибуты [attr]
	# minecraft:piston[fasing=[north|east|south|west|up|down]] - Направление

	# Поршень
		# minecraft:piston[extended=[true|false]]              - Сработавший

	# minecraft:tnt[unstable=true]                             - Взрыв при ломании



# Путь <path> к NBT свойству
	# Item.tag.Enchantmens  - Прямой путь
	# Inventory[5]			- Элемент массива
	# Inventory[{Slot:5b}]  - Элемент-объект массива, по свойству



# NBT <nbt>

# Text: "text", text_object, array
# Text object
{
	# Текст
	"text": "hello world",

	# Внешний вид
	# Цвет
	"color": "red",
	"color": "#0000FF",
	# Жирный текст
	"bold": true,
	# Курсив
	"italic": true,
	# Подчёркнутый
	"underlined": true,
	# Зачёркнутый
	"strikethrough": true,
	# Нечитаемый
	"obfuscated": true,

	# Сохраняет текущие настройки которые можно дополнять
	"extra": [
		# <Text>
	]

	# Интерактивные
	# Вывести значения скорборда, не работает с entity
	"score":
	{
		# Имя сущьности, при * - каждому своё
		"name":"*",
		"name":"@p",
		# Имя скорборда
		"objective":"obj"
	}

	# Вывести имена всех сущьностей входящих в селектор
	"selector":"@e",

	# Вывод кнопки, котороя вызывает инвентарь
	"keybind": "key.inventory",

	# Вставить в текст значения из NBT, нужно доп свойство
	"nbt":"CustomName",

	# Выбор, откуда будет братьтя NBT
	# Блок
	"block":"-5 4 7",
	# Сущьнсть
	"entity":"@e[sort=nearest,limit=1]",
	# JSON переменная
	"storage":"minecraft:<var>",

	# Если текст JSON, Вывести как json
	"interpret":true,

	# События текста
	# Вставить в чат при Shift+ЛКМ на текст
		"insertion": <text>,

	# Событие при клике на текст
	"clickEvent":
	{
		# Открыть ссылку в value
		"action":"open_url",
		"value":"https://vk.com",

		# Выполнить команду
		"action":"run_command",
		"value":"say 1",

		# Вставить в чат команду
		"action":"suggest_command",
		"value":"/say 1",

		# Скопировать значение в буфер обмена
		"action":"copy_to_clipboard",
		"value":"pass",

		# В книге. открывает стриницу из value
		"action":"change_page",
		"value":"1",
	}

	# При наведении
	"hoverEvent":
	{
		# Показать текст
		"action":"show_text"
		"contents": <Text>

		# Описание предмета
		"action":"show_item",
		"contents":
		{
			"id":"minecraft:diamond",
			"count":10,
			"tag":"{nbt}"
		}

		# Сущьность
		"action":"show_entity",
		"contents":			
		{
			"id":"UUID"
			"type":"minecraft:pig",
			"name": <text>
		}
	}
}

# Entitys
{
	id: "minecraft:skeleton",
	# Слайм, размер
	Size: 10,
	# Неподвижный 
	NoAI: 1b,
	# Не издаёт звуков
	Silent: 1,
	# Список тегов
	Tags: [
		# tags
	]
	# Анимация для faling_block
	Motion:[<x>,<y>,<z>],
	# Список пасажиров
	Passengers: [
		# <Entitys>
	]
	# Предметы в руках
	HandItems:[
		{<...Item>},
		{<...Item>}
	]
	# Броня
	ArmorItems:[
		{<...Item>},
		{<...Item>},
		{<...Item>},
		{<...Item>}
	]
	# Имя
	CustomName: <text>,
	CustomNameVisible: 1b,

	# Здоровье
	Health: 25.0f,
}

	# Blocks
		{
			# Сундук
				Items: [
					{
						Slot: 0,
						# ...Item
					}
				]

			# Табличка
				Text1: <Text>
				Text2: <Text>
				Text3: <Text>
				Text4: <Text>

			# Стенд
				# Невидимость
					Invisible: 1,
				# Невесомость
					NoGravity: 1,
				# Показать руки
					ShowArms: 1,
				# Скрыть плиту
					NoBasePlate: 1,
				#
					Small: 1,
				#
					Marker: 1,
				#
					Rotation: [0.0f, 0.0f],
		}

	# Item 
		{
			# id предмета
				id: 'minecraft:diamond',
			# Колличество
				Count: 2,
			# Теги
				tag: <Item Tags>
		}

	# Item Tags
		{
			# Повреждение
				Damage: 10,

			# Зачарование
				Enchantments:
				[
					{
						id:"minecraft:sharpness",
						lvl:12
					}
				],

			# Отображение
				display: 
				{
					# JSON название
						Name: 
							# <Text>

					# Массив строк описания
						Lore: [
							# <Text>
						]
				}

			# Атрибуты
				AttributeModifiers:
				[
					{
						AttributeName:"<attribute>",
						Name:"name",
						Amount:20.0,
						Operation:0,
						UUID:[I; 1, 1, 1, 1]
					}
				]

			# Для player_head скин игрока на голову
				SkullOwner: 'nickname';
			# Неломаемый
				Unbreakable: 1b,
			# Что можно им сломать
				CanDestroy: ["id or tag", ...],
			# Колличество тиков до поднятия предмета. 32767 - нельзя поднять
				PickupDelay: 100,
			# Возраст предмета, при 6000 будет удалён. значение -327676
				Age: -100,

			# Block Item
				# На что можно поставить блок
					CanPlaceOn: ["id or tag", ...],
				# Данные блока
					BlockEntityTag: <Block>

			# Маски
				#  1 - Enchantments
				#  2 - Attributes modifiers
				#  4 - Unbreakable
				#  8 - CanDestroy
				# 16 - CanPlaceOn
				# 32 - Остальное
					HideFlags: 4
		}


# Комманды
	# Выдать предмет
		give <selector> <id>[attr] <nbt>

	#
		clear <selector> <id><nbt>

	#
		replaceitem

	#
		reciept

	#
		summon <id> <x> <y> <z> <nbt>

	#
		title

	#
		bossbar

	# Игровой режим
		gamemode creative
		gamemode spectator
		gamemode survival

	# Игровые правила
		gamerule

	# Опыт
		experience

	#
		effect

	#
		enchant

	#
		say

	#
		msg

	# Вывод JSON текста
		tellraw <selector> <Text>

	#
		setblock <x> <y> <z> <id>[attr]<nbt>

	#
		fill

	# attribute
		attribute <selector> minecraft:generic.max_health modifier add 0-0-0-0-0 test 1 add


	# function <path>:[<path>/]<function> [if|unless <selector>]
		function all:say
		function all:other/say if @s



	# team
		team list

		team add <id> <json_name>
		team remove <id>
		team empty <id>

		team join <id> <selector>
		team leave <id> <slector>

		team modyfy <id> color gold



	# tag
		# Список всех тегов у <selector>
			tag <selector> list
		# 
			tag <selector> add <name>
		#
			tag <selector> remove <name>



	# execute
		# Выполнить из точки
			execute positioned <x> <y> <z> ... run ...
		# Ноклон головы
			execute rotated ~30 ~ 
		# Округление координаты
			execute aligin [x][y][z]
		# Относительно позиции
			execute at <selector>
		# Относительно имени
			execute as <selector>
		# Выбрать измерение
			execute in minecraft:overworld
			execute in minecraft:the_nether
			execute in minecraft:the_end
		# Относитеьно глаз
			execute anchored eyes
		# Относитеьно ног
			execute anchored eyes

		# execute if (execute unless - для отрицания)
			# Если на <x> <y> <z> стоит <id> {<nbt>}
				execute if block <x> <y> <z> <id>{<nbt>} ... run ...
			# Если облости равны
				execute if blocks <x> <y> <z> <sx> <sy> <sz> <x2> <y2> <z2> all ... run ...
			# Если облатсть накладывается на 2
				execute if blocks <x> <y> <z> <sx> <sy> <sz> <x2> <y2> <z2> masked ... run ...
			# Если есть сущьность
				execute if entity <selector> ... run ...
			# Если значение <a> у <selector> входит в диопозон
				execute if score <selector> <a> matches 1.. ... run ...
			# Если условие истинное
				execute if score <selector> <a> > <selector2> ... run ...
				execute if score <selector> <a> <= <selector2> ... run ...
			# Если выбранная сущьность содержит свойство
				execute if data entity <selector> <path>
			# Если блок содержит свойство
				execute if data block  <x> <y> <z> <path>
			# Если сработает предикат
				execute if predicate <path>:<predicate>

		# execute store
			# Сохранить результат выполнения команды
				execute store result ...
			# Сохранить количество верных выполнений команды
				execute store success ...

			# В nbt блока по пути <path> типа <type> умнеженное на <scale>
				execute store result block <x> <y> <z> <path> <type> <scale> ... run ...
			# В значение <a> у <slector> умнеженное на <scale>
				execute store result score <selector> <a> <scale> ... run ...
			# В переменную
				execute store result storage minrcraft:<var> <path> <type> <scale> ... run ...



	# scoreboard
		# scoreboard objectives
			# Создать счётчик незавищущий ни от чего
				scoreboard objectives add <a> dummy
			# Отобразить чтётчик
				scoreboard objectives setdisplay sidebar <a>

		# scoreboard players
			# Узнать все значения <selector>
				scoreboard players list <selector>
			# Узнать все значение <a> у <selector>
				scoreboard players set <selector> <a>
			# Установить значение <a> у <selector> на 1
				scoreboard players set <selector> <a>
	 		# Добавить к переменной <a> 1 у <selector>
				scoreboard players add <selector> <a>
			# Удалить значение <a> или все значения у <selector>
				scoreboard players reset <selector> [<a>]
	 		# Отнять от переменной <a> 1 у <selector>
				scoreboard players remove <selector> <a>
			# Прировнять <а> у <selector> к <b> у <selector2>
				scoreboard players operation <selector> <a> = <selector2> <b>
			# Отнять <b> у <selector2> от <a> у <selector> и записать в <a> у <selector>
				scoreboard players operation <selector> <a> [-|+|/|*|%]= <selector2> <b>

			# Проверка на соответствие диопозона (сигнал на компоратор)
				scoreboard players test <selector> <a> <min> <max>



	# data
		# data get - Получить NBT
			# Блока
				data get block <x> <y> <z>
			# Сущьность
				data get entity <selector> <path>
			# JSON переменной
				data get starage <a> <path>

		# data merge - Добовление NBT
			# В блок
				data merge block <x> <y> <z> {Items:[{id:"minecraft:diamond", Count:1}]}
			# В Сущьность
				data merge entity <selector> {CustomNameVisible:1}
			# В JSON переменную
				data merge storage minecraft:<var> {ok:1}

		# data remove - Удалить NBT свойство
			# Блока
				data remove block <x> <y> <z> <path>
			# Сущьность
				data remove entity <selector> <path>
			# JSON переменной
				data remove starage <a> <path>

		# data modyfy - Добавить NBT
			# Добавить <val> в начало списка
				data modyfy entity <selector> <path> prepend value <val>
			# Скопировать <path2> из <selector2> и вставить в конец списка <path> у <selector>
				data modyfy entity <selector> <path> append from entity <selector2> <path2>
			# Скопировать <path2> из <selector2> и вставить под индексом <index> в <path> у <selector>
				data modyfy entity <selector> <path> insert <index> from entity <selector2> <path2>
			# Полностью заменменить <path> у <selector> на <path2> у <selector2>
				data modyfy entity <selector> <path> set from entity <selector2> <path2>
			# Скопировать Теги из <path2> у <selector2> и вставить в <path> у <selector> ничего не удаляя
				data modyfy entity <selector> <path> merge from entity <selector2> <path2>

# Примеры
	 