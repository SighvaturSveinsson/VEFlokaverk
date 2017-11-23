#Sighvatur Sveinsson

from bottle import route, run, debug, template, request, static_file, error, redirect
import pymysql

conn = pymysql.connect(host='tsuts.tskoli.is', port=3306, user='1809003730', passwd='mypassword',db='1809003730_veflokaverkefni')
cur = conn.cursor()

@route('/static/<skraarnafn>')
def static_skrar(skraarnafn):
    return static_file(skraarnafn, root='./static')

@error(404)
def villa(error):
    return "<h1>Villa: Þessi síða er ekki til</h1>"

@route('/')
def root():
    return template('template.tpl')

@route('/nytt')
def nytt_ToDo():
    return template('nytt.tpl')

@route('/new', method='POST')
def nytt_ToDo2():
    todo = request.forms.get('todo')
    cur.execute("INSERT INTO todo VALUES (%s, %s)", (todo,1))
    conn.commit()
    return redirect('/')

@route('/breyt/<no>')
def nytt_ToDo(no):
    return template('breyta.tpl',no=no)

@route('/breyta/<no>', method='POST')
def edit_item(no):
    edit = request.forms.get('todo')
    cur.execute("UPDATE todo SET todo = %s WHERE todo = %s", (edit, no))
    conn.commit()
    return redirect('/')

@route('/buid/<no>')
def buid(no):
    cur.execute("UPDATE todo SET status = %s WHREE todo = %s", (0,no))
    conn.commit()
    return redirect('/')

@route('/eyda/<no>')
def eyda(no):
    cur.execute("DELETE FROM todo WHERE todo = %s", (no))
    conn.commit()
    return redirect('/')

run(debug=True)