# -*- coding: utf-8 -*-
from celery import Celery


app = Celery('tasks', 
		broker='amqp://project:project@localhost:5672//',
		backend='amqp')

@app.task
def hello():
    return u'hello word'