#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#  snippy.py
#  
#  Copyright 2013 IHAR ILYIN <luchdvina@gmail.com>
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 3 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#  
#  

#import bottle
import sys
from math import ceil
from bottle import route, run, template, request
from bottle import response , redirect, error, static_file

#import models
from models import Post
from datetime import datetime



from config import *



@route('/static/main.css')
def server_static():
    return static_file('main.css', root='./static')



@route('/static/ckeditor/:path#.*#', name='js')
def server_static(path):
    return static_file(path, root='./static/ckeditor/')

@route('/static/syntaxhighlighter/:path#.*#', name='js')
def server_static(path):
    return static_file(path, root='./static/syntaxhighlighter/')


#number of pages
def numer_page():
    num_post = Post.select().count()
    if num_post%paginate_by==0:
        c = num_post/paginate_by
        listen = [n for n in xrange(c + 1)]
        return listen
    else: 
        num = ceil((num_post/paginate_by) + 0.5)
        num_int = int(num)
        listen = [n for n in xrange(num_int + 1)]
    return listen



@route('/', method='GET')
def index():
        redirect('/login')


#loggen
@route('/login', method=['GET','POST'])
def login():
    username = request.forms.getunicode('username')
    password = request.forms.getunicode('password')
    if (username == USER) and (password == PASSWORD):
        response.set_cookie('admin', username, secret='some-secret-key', max_age=3600) #cookie erstellen        
        redirect('/admin')
    else:
        return template('templates/index.tpl')

#admin site
@route('/admin')
def admin():
    username = request.get_cookie('admin', secret='some-secret-key')
    if username:
        posts = Post.select().limit(paginate_by)
        return template('templates/admin.tpl', posts=posts, sp=numer_page())
    else:
        return template('templates/index.tpl')

#admin_page
@route('/admin_page', method=['GET'])
def number():
    username = request.get_cookie('admin', secret='some-secret-key')
    if username:
        pad = int(request.GET.get('siten','').strip())
        posts = Post.select()        
        for post in posts.paginate(pad, paginate_by):
            postes = posts.paginate(pad, paginate_by)      
        return template('templates/admin_page.tpl', postes=postes, sp=numer_page(), pad=pad)
    else:
        return template('templates/index.tpl')



@route('/content', method=['GET','POST'])
def content():
    username = request.get_cookie('admin', secret='some-secret-key')    
    form = request.forms
    if username:
        if form.editor1:
            title = form.get('title')
            content = form.get('editor1')
            pub_date = datetime.now()
            message = Post(title=title, content=content, pub_date=pub_date)
            message.save()
            redirect ('/admin')
        else:
            return template('templates/content.tpl')
    else:
        redirect('/login')        


#ausloggen
@route('/ausloggen')    
def logout():
    response.set_cookie('admin', '1')
    redirect('/login')


#delete
@route('/delete/<id:int>')
def delete_post(id):
    delete_post = Post.get(Post.id==id)
    delete_post.delete_instance()
    redirect ('/admin')

#edit
@route('/edit/<id:int>', method=['GET', 'POST'])
def edit_post(id):
    username = request.get_cookie('admin', secret='some-secret-key')
    if username:
        if request.forms.update_post:
            edit_post = Post.get(Post.id==id)
            edit_post.title = request.forms.title
            edit_post.content = request.forms.editor1        
            edit_post.save()
            redirect ('/admin')
        else:
            edit_post = Post.get(Post.id==id)
            title = edit_post.title
            content = edit_post.content
            return template('templates/edit_content.tpl', title=title, content=content)
    else:
        redirect('/login')


@error(404)
def error404(error):
    return u'извините, вы запрашиваете несуществующую страницу'




if __name__ == '__main__':
    run(host = HOST, port = PORT, debug = DEBUG)


