# Комментарий
<#
    Монгострочный
    Комментарий
#>

# Разрешить выполнения скриптов без подписи:
Set-ExecutionPolicy RemoteSigned

# Можно оставить по умолчанию "Только подписанные" или подписывать самому:
Set-ExecutionPolicy AllSigned
# Создаём сертификат:
New-SelfSignedCertificate -CertStoreLocation 'cert:\currentuser\my' -KeyUsage CertSign -Subject 'H_ROOT' -Type CodeSigningCert
$cert_root = @(Get-ChildItem 'cert:\currentuser\my' -CodeSigningCert)[0]
New-SelfSignedCertificate -CertStoreLocation 'cert:\currentuser\my' -Signer $cert_root -Subject 'H_SUB' -Type CodeSigningCert
$cert_sub  = @(Get-ChildItem 'cert:\currentuser\my' -CodeSigningCert)[1]

# Подписать скрипт с помошью SUB сертификата:
# Можно подписывать и ROOT, но SUB но можно к одному корневому добовлть много подсертификатов, а в доверянные скопировать только корневой
Set-AuthenticodeSignature .\App.ps1 $cert_sub
Get-AuthenticodeSignature .\App.ps1

# Добавить сертификат коммандами:
Export-Certificate -FilePath cert.cer -Cert $cert_root
Import-Certificate -FilePath cert.cer -CertStoreLocation 'cert:\currentuser\root'


# Так же можно сделать это руками:
# Посмотреть / Удалить:
# Win + R -> 'mmc'
# Файл -> Добавить или удалить оснастку... -> Сертификаты -> Добавить -> Моя учётная запись

# Сертификат:               'Личное' -> 'Сертификаты'
# Домавим в доверянные:     'Доверенные корневые центры сертификации' -> 'Сертификаты'




# Подключение модулей
Import-Module '.\module.psm1' # Загружаем инструменты, отданные модулем через Export-ModuleMember

Get-Help
Get-Command -Name Test-F -Syntax
(Get-Command -Name Test-F).Parameters.Keys


# Эмитация нажатия кнопки
$wshell = New-Object -ComObject WScript.Shell;
$wshell.SendKeys("~")


# Буфер обмена
Set-Clipboard "str"
$str = Get-Clipboard


# URL Запрос (iwr)
$headers =  @{ "Content-Type"="value" }

$body = @{ "user"="Andrew" }

$resp = Invoke-WebRequest -Method 'POST' -Uri "http://url.com" -Headers $headers -Body $body
$data = ConvertFrom-Json $resp.Content


# Вывод на экран форматирования

# Цвет
Write-Host -BackgroundColor Red -ForegroundColor Blue -NoNewline $num 
# Данные через пробел или запятую, будус соеденины сепаратором
Write-Host -Separator ", " 1,2,3,4,5

# Ввод данных
$str = Read-Host "Enter name"
# Ввод пароля:
$str = Read-Host "Enter pass" -AsSecureString

# Пауза по времени
Start-Sleep 10.5

# Очистить строку
Clear-Host

# Файлы
# Запись
$str > 'test.txt'                                # Перепись
$str | Out-File 'filename.txt'                   # <-

$str >> 'test.txt'                               # Дозаписать
$str | Out-File 'filename.txt' -Append           # <-

$arr > 'teest.txt'                               # Записать массив строк

$str | Out-Null                                  # Удалить вывод

# Чтение
$arr = Get-Content 'filename.txt'                 # Прочитать все строки файла
$arr = Get-Content 'filename.txt' -TotalCount 10  # Читать 10 строк


# Переменные [тип]([атрибут проверки]...)$имя = значение
# Глобальные переменные
$global:var = 'hello'
$function:help

# Типы данных
# Жёсткая типизиция
[int] $a = [int] $str + 1

# Числа
[int] $num = 10
[long] $num = 10000000

# Число с пловающей запятой
[double] $num = 1.2222222

# Символ
[char] $c = 'q'
[char] $c = 0x253b
[char] $c = 196

# Логическая
[bool] $b = $true
[bool] $b = $false

# Пустое значение
[int] $a = $null

# Строки
[string] $str = "str $num"
[string] $str = 'ne $num'
[string] $str = 'a' + [System.Environment]::NewLine

# Спец символы
[string] $str = "`n `" `t"

# Операции со строками
# Земенить $from на $to в $str
$str = $str -replace $from, $to
# Разбить строку в массив с помощью разделителя
$arr = $str -split ","

# Дата
$date = Get-Date
[datetime] $date = '2020-10-10'
[datetime] $date = [datetime]::Today

# Массив
# Создать массив
$arr = "a", "b"
[int[]] $arr = 1, 2, 3, 4
[int[]] $arr = 1..4

# Соединить список в строку
$arr -join ","

# Добавить элемент
$arr += 22

# Полусение данных
# Получить первый элемент
$arr[0]

# Диапозоны выбирают фрагмент между $a и $b
# Получить первые 10 элементов
$arr[0..10]
# Последние 3 элемента
$arr[-3..-1]
# 2,1,0,9
$arr[2..-1]
# Обьединение выборок
$arr[1,2+4..6]

# Ассоциативый массивы
$arr = @{
    Name     = 'Kevin'
    Language = 'PowerShell'
    Age      = 10
}

# Переписывает таблицу в параметры функции "-key val"
Test-Fn @arr

# Обьект Powershell
$arr = @(Get-Process Notepad)   # Получение из комманды
$arr = [PSCustomObject] @{      # Создание
    Name     = 'Kevin'
    Language = 'PowerShell'
    Age      = 10
}

# Анонимные функции
[scriptblock] $a = { # Анонимная функция
    param($p1, $p2)

    Write-Host "p1: $p1"
    Write-Host "p2: $p2"
}

[scriptblock] $b = { # Без аргументов
    $a = 12

    Write-Host "$a"
}

# Вызов
&$a -p2 "First" -p1 "Second"
&$b

# Получить тип переменной
$num.GetType().FullName

# Функции числа
[int] $a = 1
$a. # ...

# Функции строки
[string] $str = "lal"
$str.Length
$str.IndexOf('a')

# Функции массива
[int[]] $arr = 1,2,3,4
$arr.Count                                  # Колличество элементов массива
$arr.ForEach({<# code... #>})               # Перебор


# Добовление аттрибутов
# [type] [attr...] $name = <val>

# Атрибуты проверки
  [AllowNull()]                             # Обязательный аргумент может быть $null (для объектов)
  [ValidateNotNull()]                       # Обязательный аргумент не может быть $null
  [ValidateNotNullOrEmpty()]                # Обязательный аргумент не может быть $null и пустой строкой

  [AllowEmptyString()]                      # Обязательный аргумент может быть пустой строкой
  [AllowEmptyCollection()]                  # Обязательный аргумент может быть пустым массивом

  [ValidateLength(1, 5)]                    # Колличество символов в строке должно быть от 1 до 5
  [ValidateCount(1, 5)]                     # Колличество элементов в массиве должно быть от 1 до 5

  [ValidatePattern('[0-9][0-9]')]           # Регулярное выражение которому должно соответствовать значение

  [ValidateRange(1, 1000)]                  # Число должно быть от 1 до 1000
  [ValidateRange("Positive")]               # Число должно быть > 0
  [ValidateRange("Negative")]               # Число должно быть < 0
  [ValidateRange("NonPositive")]            # Число должно быть <= 0
  [ValidateRange("NonNegative")]            # Число должно быть >= 0

  [ValidateScript({$_ -ge (Get-Date)})]     # Проверка значения скриптом

  [ValidateSet("Low", "Average", "High")]   # Значение должно быть одним из списка
  [ValidateSet([TestList])]                 # Значение должно быть одним из списка динамического массива
                                            # созданного классом "TestList" наследуемого от
                                            # System.Management.Automation.IValidateSetValuesGenerator
                                            # в методе GetValidValues


# Логические операции
# Числа
if ($a -eq $b)  {} # ==
if ($a -ceq $b) {} # == (учитывает регистр)
if ($a -ne $b)  {} # !=
if ($a -gt $b)  {} # >
if ($a -ge $b)  {} # >=
if ($a -lt $b)  {} # <
if ($a -le $b)  {} # <=

# Объединения
if ($flag1 -and $flag2) {} # && (and)
if ($flag1 -or  $flag2) {} # || (or)

# Инверсия
if (-not $false) {}
if (!$false) {}

# В $subsrt - * = любое колличество любых символов
if ($str -like    $substr) {}
if ($str -notlike $substr) {}

# Регулярное выражение
if ($str -match    "^lol[o]*$") {}
if ($str -notmatch $regexp)     {}

# Коллекция содержит элемент
if ($arr -contains    $el) {}
if ($arr -notcontains $el) {}

# Условия
if     ($true) {}
elseif ($true) {}
else           {}

# Циклы
while ($true -or $false) {}

for ($i = 10; $i -lt 10; $i++) {}

foreach ($el in $arr) {}

# Функции
function My-Write-Info {"text"}
# Функция с результатом
function Get-Info {return "text"}

# Вызов
My-Write-Info
info = Get-Info; $info

# Функции с параметрами
# Так
function Test-Minus {
    param (
        [int] $a,
        [int] $b
    )

    return $a - $b
}

function Test-Plus([int] $a, [int] $b) { return $a + $b }

# Функция на вход
function Start-Com([scriptblock] $com) { &$com }

# Вызов
Test-Minus 8 5
Test-Plus 1 2

Test-Minus -b 10 -a 90
Test-Plus  -b 2 -a 1



# Значение по умолчанию
function Test-Minus {
    param (
        [int] $a = 100,
        [int] $b = 100
    )

    return $a - $b
}

function global:Test-Plus([int] $a = 100, [int] $b = 100) { return $a + $b }

# Неограниченные аргументы
function Test-Inf { $args | ForEach-Object { $_ } }

# Переключатель
function Test-Switch {
    param ([switch] $clear)

    if ($clear) {}
    else {}
 }

function Test-Switch([switch] $clear) {
    if ($clear) {}
    else {}
}

Test-Switch
Test-Switch -clear

Test-Switch -clear:$false
Test-Switch -clear:$true


# Сплаттинг (Перенаправить все аргументы в другую функцию)
function Test-SPL { Test-Plus @Args }

# Обработка конвеераd
function Test-OK {
    param ([int] $p1, [int] $p2)

    # Вначале фунции
    begin {
        echo "Begin"
        $storage = 0
    }

    # Обработка
    process {
        echo "Val: $_"
        $storage += $_
    }

    # После обработки
    end {
        echo "End"
        return $storage
    }
}

# Фильтр - как конвеер, но нет begin и end, только process
filter My-F {
    if ($_ -gt 1) {
        $_
    }
}

1,2,3,4,5 | Test-OK
1,2,3,4,5 | My-F



# Расшириная функция (доп стандартные параметры)
function Test-Minus {
    [CmdletBinding()] # Указание расширенной

    param (
        # Для параметров:
        # [attr...] [type] $name

        # Атрибуты:
        [Parameter(Mandatory)]                       # (Или [Parameter(Mandatory=$true)]): Обязательный параметр

        [Parameter(ValueFromPipeline)]               # На вход весь объект конвеера
        [Parameter(ValueFromPipelineByPropertyName)] # На вход свойства "a" из конвеера

        [Parameter(Position=1)]                      # При использованиии без имени, пареметр будет равен 2 аргументу
        [Parameter(ParameterSetName = 'OnlyOne')]    # Название группы параметров (вариации использоания)

        [Parameter(HelpMessage="Первое число")]      # Сообщение, если обязательный аргумент не определён

        [Alias("CN", "MachineName")]                 # Псевдонимы

        [Parameter(Mandatory, Position=0)]           # Несколько параметров
        [Parameter(ValueFromRemainingArguments)]     # Содержмт все параметры, которые не используются
    )

    return $a - $b
}

# Добавить псевдоним
Set-Alias sc Test-Minus
