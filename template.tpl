<link rel="stylesheet" type="text/css" href="static/styles.css">
<meta charset="utf-8">
<a href='/nytt'>Bæta við nýju ToDo</a>
% import pymysql
% conn = pymysql.connect(host='tsuts.tskoli.is', port=3306, user='1809003730', passwd='mypassword',db='1809003730_veflokaverkefni')
% cur = conn.cursor()
% cur.execute("SELECT * FROM todo")
% for i in cur:
% 	todo  = i[0]
% 	status = i[1]
% teljari=0
<div>{{todo}}{{status}}<a href='/breyt/{{todo}}'>Breyta ToDo</a><a href='/eyda/{{todo}}'>Eyða ToDo</a><br></div>
% teljari += 1
