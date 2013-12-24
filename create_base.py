#!/usr/bin/python
# -*- coding: utf-8 -*-

from peewee import *
from models import Post

database = SqliteDatabase('snippy_base.db')


database.connect()


def create_tables():
    Post.create_table(fail_silently=True)
    return None


create_tables()
print 'the database is created'