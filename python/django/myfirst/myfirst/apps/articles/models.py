from django.db import models

class Article(models.Model):
    title = models.CharField('Название стстьи', max_lenght = 200)
    text  = models.TextField('Текст статьи')
    date  = models.DateTimeField('Дата публикации')
