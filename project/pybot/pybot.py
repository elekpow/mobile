import telebot
import random

from random import choice

from telebot import types

token ="6696862257:AAHYLZIyWbaHREKGr5eLpFY-gRG1GAQLz-A"

bot = telebot.TeleBot(token)

RANDOM_TASKS = ["Записаться на путь в нетологию","Написать Гвидо письмо","помыть машину" ]

HELP ="""
/help - напечатать! справку по программе
/add - добавить! задачу в список(название задачи заправшиваем у пользователя)
/show - напечатать! все добавленные задачи
/print - вывести! по нескольким датам
/random - добавлять! случайную задачу на дату Сегодня
"""

HELP_BOT="""

pip3 install --user pytelegrambotapi


"""



tasks = {}


#функция
def add_todo(date,task):
    if date in tasks:
         tasks[date].append(task)
    else:
         tasks[date] = []
         tasks[date].append(task)



@bot.message_handler(commands=["help"])
def help(message):
    bot.send_message(message.chat.id, HELP)


@bot.message_handler(commands=["add"])
def add(message):
    try:
        command = message.text.split(maxsplit=2)
        data = command[1] #дата
        task = command[2] #задача

        cat = task.split('@') #category
        text = cat[0] #text
        cat1 = cat[1] #text

        try:
            bot.send_message(message.chat.id,text)

            add_todo(data, task)
            text = "Задача " + text +" в категории: " + "@" + cat1 + " добавлена на дату " + data
            bot.send_message(message.chat.id, text)

        except IndexError:
            bot.send_message(message.chat.id," error не выбрана категория")

    except IndexError:
       print(message.text + " error ")
       bot.send_message(message.chat.id,message.text + " ? а дальше что ?")

@bot.message_handler(commands=["random"])
def random_add(message):

    date = "сегодня"
    task = random.choice(RANDOM_TASKS)
    add_todo(date, task)
    text = "Задача " + task + " добавлена на дату " + date
    bot.send_message(message.chat.id, text)

@bot.message_handler(commands=["show"])
def show(message): #message.text = /print <date>
    try:

        command = message.text.split(maxsplit=1)
        date = command[1].lower()
        text = ""

        if date in tasks:
            text = "Дата: " + date.upper() + "\n"
            bot.send_message(message.chat.id, text)
            for task in tasks[date]:
                task1 = "[] " + task + "\n"
                bot.send_message(message.chat.id, task1)
        else:
            text = "Задач на эту дату нет"
            bot.send_message(message.chat.id, text)

    except IndexError:
       print(message.text + " error ")
       bot.send_message(message.chat.id,message.text + " введите дату")


@bot.message_handler(commands=["print"])
def show(message):
    try:
        command = message.text.split()
        date1 = command[1]
        command = message.text.split(maxsplit=1)
        date1 = command[1].replace(' ','').split(",")

        for key in date1:
            #print(key)
            for task in tasks[key]:
                cat1 =  task.split('@')
                text1 = "на дату: " + key
                bot.send_message(message.chat.id, text1)
                bot.send_message(message.chat.id, str('@') + str(cat1[1]) + " " + str(cat1[0]))

    except IndexError:
       print(message.text + " error ")
       bot.send_message(message.chat.id,message.text + " можно ввести несколько дат через запятую")


# постоянно обращается к серверам телеграм
bot.polling(non_stop=True)
