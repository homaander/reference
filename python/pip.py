# pip install colorama

from colorama import init
from colorama import Fore, Back, Style

init()

print( Back.GREEN )
print( Fore.RED )

# Телеграм
# pip install pyTelegramBotAPI
import telebot

bot = telebot.TeleBot("token")


# Метиоцентр
# pip install pyowm

# Компиляця
# pip install pyinstaller
# pyinstaller -F app.py
