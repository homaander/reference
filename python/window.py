# sudo apt install python-tk

from tkinter import *

root = Tk()

root.title('App')
root.geometry('611x511')

canvas = Canvas(root, width=611, height=511, bg='#FFF')
canvas.pack()
canvas.pack(side='right')


# Линия
canvas.create_line(0, 0, 0, 100, width=1, fill='blue')

# Линия со стрелкой
canvas.create_line(6, 6, 6, 506, width=2, fill='#000', arrow=FIRST)
canvas.create_line(6, 256, 606, 256, width=2, fill='#000', arrow=LAST)

# Текст
canvas.create_text(0, 0, text='hello world', fill='black')

# Удаление
line = canvas.create_line(0, 0, 0, 100, width=1, fill='black')
canvas.delete(line)



# Наименование
label_name = Label(root, text='Введите имя:')
label_name.place(x=0, y=10)
label_name['text'] = 'OK'

# Получить размеры
root.update()
print(label_name.winfo_width())
print(label_name.winfo_height())

# Координаты относительно окна
print(label_name.winfo_rootx())
print(label_name.winfo_rooty())

# Поле для ввода
name_entry = Entry(root)
name_entry.place(x=30, y=10)

# Кнопка
def func(a):
    pass

but = Button(root, text='Show')
but.bind('<Button-1>', lambda event: func(name_entry.get()) )
but.place(x=100, y=100)


root.mainloop()
