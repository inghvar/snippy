#!/usr/bin/python
# -*- coding: utf-8 -*-

from peewee import *


database = SqliteDatabase('snippy_base.db')


class BaseModel(Model):
    class Meta:
        database = database


class Post(BaseModel):
    title = CharField(max_length=25,null=False)
    content = TextField()
    pub_date = DateTimeField()

    
    class Meta:
        order_by = ('-pub_date',)






