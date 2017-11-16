#Sighvatur Sveinsson

from bottle import route, run, debug, template, request, static_file, error, redirect
import pymysql
import codecs

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
    cur.execute("SELECT count(*) FROM todo")
    teljari2 = cur.fetchone()
    teljari = teljari2[0]
    teljari += 1
    conn.commit()
    return redirect('/')


@route('/breyta/<no:int>', method='POST')
def edit_item(no):
    cur.execute("UPDATE todo SET task = ?, WHERE id LIKE ?", (edit, no))
    conn.commit()

    return '<p>The item number %s was successfully updated</p>' % no

@route('/buid/<no:int>')
def buid(no):
    cur.execute("UPDATE todo SET status = ? WHREE id LIKE ?", (0,no))
    return redirect('/')

@route('/eyda/<no:int>')
def eyda(no):
    cur.execute("DELETE todo WHREE id LIKE ?", (no))
    return redirect('/')

@error(404)
def mistake404(code):
    return 'Sorry, this page does not exist!'


run(debug=True)