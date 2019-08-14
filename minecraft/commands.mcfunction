# Относительне (для исполнителя) координаты xyz (прибавить/отнять к относителльным координатам)
#    ~
#    ~1
#    ~-1
# Пример (координаты исполнителя 0 0 0)
#    ~ ~3 ~-2
# будут читатся как (0 0+3 0-2)=(0 3 -2)

# Координаты взгляда исполнителя (горизонт. смещение, вертикал. смещение, смешение вперёд)
#    ^
#    ^1
#    ^-1

# + добавить 1.6 к вертикальным координатам (майнкрафт думает, что глаза находятся на уровне ног)
# tp ^ ^1.6 ^10


# Селекторы сущьностей
#    @a - Все игроки
#    @p - Ближайший игрок
#    @r - Случайный игрок
#    @s - Исполнитель
#    @e - Все entity (Животные, Лежащие предметы, Игроки, Вагонетки, Лодки)

#    [
#        Тип сущьностей (равен\не равен)
#            type=pig
#            type=!player
#
#        Растояние до сущьностей (ровно\больше\меньше\в интервале)
#            distance=2
#            distance=2..
#            distance=..10
#            distance=2..10
#
#        Тег сушьности
#            tag=friend
#
#        Сортировка сушьностей (от самых дальних\самых ближайших\случайно)
#            sort=
#            sort=nearest
#            sort=random
#
#        Максимальное количество сущьностей
#            limit=1
#
#        Проверка содержания NBT
#            nbt={}
#
#        Проверка очков        
#            scores={IQ=1}
#            scores={IQ=1..2}
#            scores={IQ=1..}
#    ]

# Отправить личное сообщение
    msg friend HEllo
# Отправить сообщение
    say Hello
# Имитировать действие
    me Упал

# Телепортация
    #  На координаты
        tp 0 ~ 0
    # К человеку
        tp friend
    # Человека к человеку
        tp friend @s
    # К случайному мобу
        tp @e[sort=random,limit=1]

# Выдать предмет
    give @a minecraft:dirt 1
    give @a minecraft:dirt{nbt} 1

# Очистить инвентарь
    clear @a

# Установить режим игры
    # Креатив
        gamemode creative @a

# Установить сложность
    difficulty peaceful
    difficulty easy
    difficulty normal
    difficulty hard

# Изменить правила игры
    # Сохранить инвентарь при смерти
        gamerule keepInventory true
    # Вечный день
        gamerule doDaylightCycle false
    # Не меняется погода
        gamerule doWeatherCycle false
    # Не спавнятся мобы
        gamerule doMobSpawning false
    # Не выпадает лут из мобов
        gamerule doMobLoot false
    # Нет вывода действий в консоль
        gamerule commandBlockOutput false
    # Огонь не распростроняется
        gamerule doFireTick false
    # Не выпадают блоки
        gamerule doTileDrops false
    # Мобы не ломают блоки
        gamerule mobGriefing false
    # Скорость рандомных событий (Например рост ростений)
        gamerule randomTickSpeed 6

# Установить погоду
    weather clear

# Время
    # Установить время
        time set day
    # Запросить время
        # Получить время
            time query daytime
        # Время в игре
            time query gametime

# Установить точку появления игроков
    setworldspawn ~ ~ ~

# Точка возраждения игрока
    spawnpoint @p ~ ~ ~

# Эфекты
    # Дать эффект
        effect give @a blindness
    # Убрать эффекты
        efftct clear @a

# Зачаровать предмет в руках (если его можно зачаровать)
    enchant @a minecraft:sharpness 2

# Опыт
    # Установить уровень\очки
        xp set @p 1 levels
        xp set @p 1 points
    # Добавить уровень\очки
        xp add @p 1 levels
        xp add @p 1 points
    # Узнать количество уровней\очкоы
        xp query @p levels

# Проиграть эффект на координате xyz c разбросом whl скоростью speed количеством count и видно из далека
    particle happy_villager [x] [y] [z] [w] [h] [l] [speed] [count] force

    # для dust можно задать цвет rgb и размер
        particle dust [r] [g] [b] [size] [x] [y] [z] [xd] [yd] [zd] [count]
# Проиграть звук
    playsound block.anvil.land master @p ~ ~ ~10


# Коменды
    # Создать команду
        team add red

    # Список игроков в команде
        team list red
        team empty red
        team remove red
        team join red
        team leave red

    team modify red friendlyFire false
    team modify red color false



# Теги
    # Список тегов у игрока
        tag @p list
    # Добавить тег игроку
        tag @p add pass
    # Удалить тег у игрока
        tag @p remove pass



# Поставить блок на координату
    setblock [x] [y] [z] minecraft:diamond_block
    setblock ~ ~ ~ minecraft:acacia_stairs[facing=east,half=top,shape=outer_left,waterlogged=true]

# Заполнение
    # Заполнить область блоками
        fill [x] [y] [z] [x2] [y2] [z2] minecraft:dirt
    # Заменить блок воздуха на землю
        fill [x] [y] [z] [x2] [y2] [z2] minecraft:dirt replace minecraft:air
    # Заполнить область пустой коробкой со стенками из блока земли
        fill [x] [y] [z] [x2] [y2] [z2] minecraft:dirt hollow
    # Заполнить блоками только воздух
        fill [x] [y] [z] [x2] [y2] [z2] minecraft:dirt keep
    # Заполнить блоками только воздух но зтенки запонить полностью
        fill [x] [y] [z] [x2] [y2] [z2] minecraft:dirt outline

# Скопировать облость и поставить её в точку, где будет распологатся наименьший по всем координатам
# угол этой облости
    clone [x1] [y1] [z1] [x2] [y2] [z2] [x] [y] [z]

    # Вставить несмотря на пересечение зон копирования и вставки
        clone [x1] [y1] [z1] [x2] [y2] [z2] [x] [y] [z] replace force
    # Удалить копируемый объект после клонирования
        clone [x1] [y1] [z1] [x2] [y2] [z2] [x] [y] [z] replace move

# Скопировать только блоки определённого типа
    clone [x1] [y1] [z1] [x2] [y2] [z2] [x] [y] [z] filtered minecraft:stone
# Скопиповать все блоки кроме воздуха
    clone [x1] [y1] [z1] [x2] [y2] [z2] [x] [y] [z] masked normal

    # Вставить несмотря на пересечение зон копирования и вставки
        clone [x1] [y1] [z1] [x2] [y2] [z2] [x] [y] [z] masked force
    # Удалить копируемый объект после клонирования
        clone [x1] [y1] [z1] [x2] [y2] [z2] [x] [y] [z] masked move

# Сообщение на экран
    title @a title {"text":"Hello","color":"red","italic":"false"}
    title @a title [{"text":"Red","color":"red"}{"text":"Red","color":"red"}]



bossbar create bbid {"text":"Привет"}
bossbar set minecraft:bbid players @a
bossbar set minecraft:bbid color red
bossbar set minecraft:bbid max 100
bossbar set minecraft:bbid value 10
bossbar set minecraft:bbid style notched_6
bossbar set minecraft:bbid visible notched_6



# Scorebord
    scoreboard objectives add IQ dummy
    scoreboard objectives add Use minecraft.used:

    scoreboard objectives setdisplay sidebar IQ
    scoreboard players set @p IQ 1
    scoreboard players add @p IQ 1
    scoreboard players remove @p IQ 1
    scoreboard players reset @p IQ
    scoreboard players list @p

    scoreboard players test @p IQ 1 80

    scoreboard players operation @p Money -= @p Price

    scoreboard objectives add trig trigger
    scoreboard players enable trig

# Одноразовое задание очков
    trigger add 10
    trigger set 11



# Execute
    # Запустить команду относительно координат сущьности
        execute at @p run setblock ~ ~ ~ minecraft:diamond_block
    # Запустить команду от имени сущьности
        execute as @p run clear @s
    # Запустить от имени и относительно сущьности
        execute as @p at @s run say 123

    # Изменить отчёт напровления взгляда на глаза
        execute anchored eyes run setblock ^ ^ ^6 diamond_block
    # Точное напровление взгляда на блок
        execute facing 0 0 0 run setblock ^ ^ ^6 diamond_block
    # Точное напровление взгляда на сущьность
        execute entity @e eyes run setblock ^ ^ ^6 diamond_block
    # Повернуть напровление взгляда
        execute rotated ~90 0 run setblock ^ ^ ^6 diamond_block

    # Запустить команду если блок на координатах - камень
        execute if block ~ ~1 ~ minecraft:stone run say OK
    # Запустить коменду если существует сущьность
        execute if entity @e run say OK
    # Запустить, если блоки облости совпадают
        execute if blocks [x1] [y1] [z1] [x2] [y2] [z2] [x] [y] [z] all run say OK
    # Запустить, если все блоки кроме воздуха совпадают
        execute if blocks [x1] [y1] [z1] [x2] [y2] [z2] [x] [y] [z] masked run say OK
    # Запустить, если чёт очеов больше или равен
        execute if score @p Name >= @a Name
    # Запустить, если счёт входит в диапозон
        execute if score @p Name matches 2..5 run say OK

    # Выполнить команду в другом измерении (тп игрока на координаты в аду, деже если он в обычном мире)
        execute in minecraft:overworld run say OK
        execute in minecraft:the_nether run say OK
        execute in minecraft:the_end run say OK

    # Исполняется если условие не выполнено
        execute unless block ~ ~1 ~ minecraft:glass

    # Точные координаты исполнения команды
        execute positioned ~1 ~ ~ run setblock ~ ~ ~ minecraft:dirt

    # Округлить z
        execute at @p align z run say OK
    # Округлить x, y и z
        execute at @p align xyz run say OK

    # Положить строку результата выполнения (OK) в скорборд
        execute store result score @p Name run say OK
    # Положить успошность выполнения (1\0) в скорборд
        execute store success score @p Name run say OK

    # Записать в NBT по адресу Name результат выполнения умноженный на 10
        execute store result entity @p Name short 10 run say 1
        execute store result block 0 0 0 Name byte 10 run say 1
    # Записать результат в боссбар
        execute store result bossbar var value run say 1
        execute store result bossbar var max run say 1



# Data
    data get block ~ ~ ~
    data merge block ~ ~1 ~

    data get entity @e
    data merge entity @e

    data remove entity @e Item.tag.Enchantments

    data modify block entity @e[limit=1b] Item.tag.Enchantments append value {id:"...", lvl:1}
    data modify block entity @e[limit=1b] Item.tag.Enchantments preend value {id:"...", lvl:1}
    data modify block entity @e[limit=1b] Item.tag.Enchantments set value {id:"...", lvl:1}
    data modify block entity @e[limit=1b] Item.tag.Enchantments insert value {id:"...", lvl:1}

    data modify block entity @e[limit=1b] Health prepend from @s Health

    data get entity @e Comp.Tag.mytag
    data get entity @e Comp.Tag.mytag[0]
    data get entity @e Comp.Tag.mytag[{Slot:1b}]


tellraw @a [{"text":"ok","color":"red","clickEvent":{"action":"run_command","value":"/kill @s"}}, ...]
give @p written_book{title:"Book",author:"norm",pages:['JSON text', ...]} 1

# Удалить знания о крафтах из NBT Игрока
    recipe take @s *

# NBT
#    JSON text:
#        {
#            "text":"ok\nok\\",
#            "color":"red",
#            "bold":"true",
#            "italic":"false",
#            "strikethrough":"true",
#            "underlined":"true",
#
#            "translate":"gui.toTitle",
#            "translate":"item.minecraft.diamond",
#
#            "selector":"@p"
#
#            "score":{
#                "name":"friend",
#                "objective":"var"
#            }
#
#            "clickEvent":{
#                "action":"run_command",
#                "action":"suggest_command",
#                "value":"/kill @s"
#            },
#
#            "hoverEvent":{
#                "action":"show_text",
#                "value":"text"
#
#                "action":"show_item",
#                "value":"{id:diamond,Count:1b}"
#            }
#        }
#    Блоки:
#        CanPlaceOn:["stone"],
#        BlockEntityTag:{}
#        
#        Падающий блок:
#            Time: 1,
#            BlockState:{Name:"stone"},
#            DropItem:1
#
#        Табличка:
#            BlockEntityTag:{
#                Text1:'{JSON text}'
#            }
#    
#        Сундук:
#            Items:[{Slot:0b, id:"...", Count:1b}]
#            LootTable:"custom/chests/chest_loot_table"
#
#    Предметы:
#        Item: {
#            id:"",
#            Count:10b,
#
#            PickupDelay:-1,
#            Age:-32768,
#
#            tag:{
#                Damage:1,
#
#                AttributeModifiers: [
#                    {
#                        AttributeName:"generic.movementSpeed",
#                        Name:"generic.movementSpeed",
#                        Amount:20,
#
#                        Operation:0,
#                        Operation:1,
#                        Operation:2,
#
#                        Slot:"",
#                        
#                        UUIDLeast:1,
#                        UUIDMost:1
#                    }
#                ]
#
#                Enchantments:[{lvl:2s, id:"sharpness"}],
#                Unbreakable:1b,
#
#                CanDestroy: ["stone","#minecraft:planks"]
#
#                display: {
#                    Name:'{JSON text}',
#                    
#                    Lore:['JSON text']
#
#                    Tags:["pass"]
#                },
#
#                SkullOwner:"Lololowka",
#
#            }
#        }
# 
#    Все мобы:
#        DeathLootTable:"custom/entities/my_loot_table"
#
#        Time: 1b,
#        Motion: [1.0d,1.0d,1.0d],
#        Health: 20f,
#        Fire: 200s,
#   
#        CustomName:'JSON text',
#
#        Attributes:[
#            {Base:20d, Name:"generic.maxHealth"}
#            {Base:20d, Name:"generic.followRange"}
#            {Base:20d, Name:"generic.knockbackResistance"}
#            {Base:20d, Name:"generic.movementSpeed"}
#            {Base:20d, Name:"generic.attackDamage}
#            {Base:20d, Name:"generic.armor"}
#            {Base:20d, Name:"generic.armorToughness"}
#            {Base:20d, Name:"generic.attackKnockback"}
#        ]
# 
#        CustomNameVisible:1b,
#
#        ArmorItems:[{id:""},{id:""},{id:""},{id:""}],
#        HandItems:[{id:""},{id:""}],
#
#        ArmorDropChances:[1.0f,...],
#        HandDropChances:[1.0f,...],
#
#
#        Посадить моба на моба:
#            Passengers:[{id:"minecraft:creeper"}]
#
#        Дать эффект:
#            ActiveEffects:[{id:8,amplifier:1,duration:10}] 
#        Неуязвимость:
#            Invulnerable: 1b;
#        Стоять на месте:
#            NoAI: 1b;
#
#    Слайм:
#        Size: 1;
#
#    Свинья:
#        Saddle: 1b;
#
#    Игрок:
#        SelectedItem:{count:1 id:"minecraft:ise"},
#        SelectedItemSlot: 0b,
#
#        Inventory:[]
# 
#    Стойка брони:
#        Invisible: 1b,
#        Invulnerable: 1b,
#        NoBasePlate: 1b,
#        NoGravity: 1b,
#        ShowArms: 1b,
#        Small: 1b,
# 
#        Rotation: [11f],
#        Pose: {
#            Body: [45f, 45f, 45f],
#            Head: [45f, 45f, 45f],
# 
#            LeftArm: [45f, 45f, 45f],
#            RightArm:  [45f, 45f, 45f],
# 
#            LeftLeg: [45f, 45f, 45f],
#            RightLeg: [45f, 45f, 45f]
#        }

# Функции
# Для функций сохратить в world\datapacks\my_dp\functions\walk.mcfunction

reload

datapack list
datapack disable lol

function myfunc:walk
function myfunc:walk if @a[name=friend]
function myfunc:walk unless @a[name=friend]

schedule function myfunc:walk

# Добавить в world\datapacks\minecraft\tags\functions\tick для повторения каждую сек
