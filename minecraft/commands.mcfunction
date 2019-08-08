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

    [
        Тип сущьностей (равен\не равен)
            type=pig
            type=!player

        Растояние до сущьностей (ровно\больше\меньше\в интервале)
            distance=2
            distance=2..
            distance=..10
            distance=2..10

        Тег сушьности
            tag=friend

        Сортировка сушьностей (от самых дальних\самых ближайших\случайно)
            sort=
            sort=nearest
            sort=random

        Максимальное количество сущьностей
            limit=1

        Проверка NBT
            nbt={}

        Проверка очков        
            scores={IQ=1}
            scores={IQ=1..2}
            scores={IQ=1..}
    ]

# Телепортация (на координаты\к человеку\человека к человеку\к случайному мобу)
    tp 0 ~ 0
    tp friend
    tp friend @s
    tp @s @e[sort=random,limit=1]

# Выдать предмет
    give @a minecraft:dirt 1
    give @a minecraft:dirt{nbt} 1

# Очистить инвентарь
    clear @a

# Установить режим игры
    # Креатив
        gamemode creative @a

# Изменить правила игры
    # Сохранить инвентарь при смерти
        gamerule keepInventory true

# Установить погоду
    weather clear

# Установить время
    time set day
    time query

setworldspawn
spawnpoint

effect
enchant

team
tag

setblock [x] [y] [z] minecraft:diamond_block

fill [x] [y] [z] [x2] [y2] [z2] minecraft:dirt
fill [x] [y] [z] [x2] [y2] [z2] minecraft:dirt 0 hollow
fill [x] [y] [z] [x2] [y2] [z2] minecraft:dirt 0 replace minecraft:air

clone

particle

say
me

title @a title "Hello"
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

trigger add 10
trigger set 11



# Execute
execute at @p run setblock ~ ~ ~ minecraft:diamond_block
execute as @p run clear @s
execute as @p at @s run say 123

execute if block ~ ~1 ~ minecraft:stone run say OK
execute if entity @e run say OK
execute if blocks [x1] [y1] [z1] [x2] [y2] [z2] [x] [y] [z] all run say OK
execute if blocks [x1] [y1] [z1] [x2] [y2] [z2] [x] [y] [z] masked run say OK
execute if score @p Name >= @a Name
execute if score @p Name matches 2..5 run say OK

# Исполняется если условие не выполнено
    execute unless block ~ ~1 ~ minecraft:glass

# Точные координаты исполнения команды
    execute positioned ~1 ~ ~ run setblock ~ ~ ~ minecraft:dirt

# Округлить z
    execute at @p align z run say OK
# Округлить x, y и z
    execute at @p align xyz run say OK

execute store result score @p Name run say OK
execute store result entity @p Name int 10 run say OK
execute store success



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

# Удалить знания о крафтах из NBT Игрока
    recipe take @s *

 NBT
    Блоки:
        CanPlaceOn:["minecraft:stone"],
        BlockEntityTag:{}
        

    Табличка:
        BlockEntityTag:{
            Text1:'{
                "text":"Go up",
                "clickEvent":{
                    "action":"run_command",
                    "value":"tp @p ~ ~5 ~"
                }
            }'
        }
    
    Сундук:
        Items:[{Slot:0b, id:"...", Count:1b}]

    Предметы:
        Item: {
            id:"",
            Count:10b,

            PickupDelay:-1,
            Age:-32768,

            tag:{
                Damage:1,

                AttributeModifiers: [
                    {
                        AttributeName:"generic.movementSpeed",
                        Name:"generic.movementSpeed",
                        Amount:20,

                        Operation:0,
                        Operation:1,
                        Operation:2,

                        Slot:"",
                        
                        UUIDLeast:1,
                        UUIDMost:1
                    }
                ]

                Enchantments:[{lvl:2s, id:"minecraft:"}],
                Unbreakable:1b,

                CanDestroy: ["minecraft:stone","#minecraft:planks"]

                display: {
                    Name:'{"text":"Hello world","color":"red"}',

                    Name:'{"translate":"gui.toTitle"}',
                    Name:'{"translate":"item.minecraft.diamond"}',
                    
                    Lore:['{"text":"lore"}']

                    Tags:["pass"]
                },

                SkullOwner:"Lololowka",

            }
        }
 
    Все мобы:
        DeathLootTable:"custom/entities/my_loot_table"
        LootTable:"custom/chests/chest_loot_table"

        Time: 1b,
        Motion: [1.0d,1.0d,1.0d],
        Health: 20f,
        Fire: 200s,
   
        CustomName:"{
            \"text\":\"Hell\",
            \"color\":\"black\",
            \"bold\":\"true\",
            \"italic\":\"true\",
            \"obfuscated\":\"true\",
            \"strikethrough\":\"true\"
        }",

        Attributes:[
            {Base:20d, Name:"generic.maxHealth"}
            {Base:20d, Name:"generic.followRange"}
            {Base:20d, Name:"generic.knockbackResistance"}
            {Base:20d, Name:"generic.movementSpeed"}
            {Base:20d, Name:"generic.attackDamage}
            {Base:20d, Name:"generic.armor"}
            {Base:20d, Name:"generic.armorToughness"}
            {Base:20d, Name:"generic.attackKnockback"}
        ]
 
        CustomNameVisible:1b,

        ArmorItems:[{id:""},{id:""},{id:""},{id:""}],
        HandItems:[{id:""},{id:""}],

        ArmorDropChances:[1.0f,...],
        HandDropChances:[1.0f,...],


        Посадить моба на моба:
            Passengers:[{id:"minecraft:creeper"}]

        Дать эффект:
            ActiveEffects:[{id:8,amplifier:1,duration:10}] 
        Неуязвимость:
            Invulnerable: 1b;
        Стоять на месте:
            NoAI: 1b;

    Слайм:
        Size: 1;

    Свинья:
        Saddle: 1b;

    Игрок:
        SelectedItem:{count:1 id:"minecraft:ise"},
        SelectedItemSlot: 0b,

        Inventory:[]
 
    Стойка брони:
        Invisible: 1b,
        Invulnerable: 1b,
        NoBasePlate: 1b,
        NoGravity: 1b,
        ShowArms: 1b,
        Small: 1b,
 
        Rotation: [11f],
        Pose: {
            Body: [45f, 45f, 45f],
            Head: [45f, 45f, 45f],
 
            LeftArm: [45f, 45f, 45f],
            RightArm:  [45f, 45f, 45f],
 
            LeftLeg: [45f, 45f, 45f],
            RightLeg: [45f, 45f, 45f]
        }

# Функции
# Для функций сохратить в world\function\myfunc\walk.mcfunction

reload

datapack list

function myfunc:walk
function myfunc:walk if @a[name=friend]
function myfunc:walk unless @a[name=friend]

gamerule gameLoopFunction myfunc:walk

