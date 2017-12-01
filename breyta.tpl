<link rel="stylesheet" type="text/css" href="styles.css">
<meta charset="utf-8">
<form action="/breyta/{{no}}" method="POST" accept-charset='ISO-8859-1'>
% import pymysql
% conn = pymysql.connect(host='tsuts.tskoli.is', port=3306, user='1809003730', passwd='mypassword',db='1809003730_veflokaverkefni')
% cur = conn.cursor()
<fieldset>
% cur.execute("SELECT * FROM todo")
% for i in cur:
%	id = i[0]
%	todo1  = i[1]
% 	lysing = i[3]
% 	if id == no:
		<label>
			<p>Breyta ToDo<br>
			<input type="text" name="todo" value="{{todo1}}" required></p>
		</label>
		<label>
			<p>Lýsing ToDo (aukalegt)<br>
			<textarea name="texti">{{lysing}}</textarea></p>
		</label>
		<input type="submit" name="submit" value="Breyta">
% end
% end
</fieldset>
</form>