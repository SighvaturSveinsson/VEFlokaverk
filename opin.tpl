<link rel="stylesheet" type="text/css" href="styles.css">
<meta charset="utf-8">
% import pymysql
% conn = pymysql.connect(host='tsuts.tskoli.is', port=3306, user='1809003730', passwd='mypassword',db='1809003730_veflokaverkefni')
% cur = conn.cursor()
% cur.execute("SELECT * FROM todo")
<h1>To Do listi</h1>
<div>
<a href='/nytt' class="button">Bæta við nýju ToDo</a>
<a href='/opid' class="button">Sýna bara opin ToDo</a>
<a href='/lokad' class="button">Sýna bara lokuð ToDo</a>
</div>
<table id="customers">
  	<thead>
  		<tr>
  			<th scope="col">ToDo</th>
    		<th scope="col">Status</th>
    		<th scope="col">Lýsing</th>
    		<th scope="col">Opna/Loka ToDo</th>
    		<th scope="col">Breyta ToDo</th>
    		<th scope="col">Eyða ToDo</th>
  		</tr>
  	</thead>
  	<tbody>
	  	<tr>
		% for i in cur:
		%	id = i[0]
		% 	todo  = i[1]
		% 	status = i[2]
		% 	lysing = i[3]

		%	if status == 1:
		%		stada = "Opið"
				<td>{{todo}}</td>
		    	<td>{{stada}}</td>
		    	<td>{{lysing}}</td>
		    	<td><a href='/buid/{{id}}'>Buinn með ToDo</a></td>
		    	<td><a href='/breyt/{{id}}'>Breyta ToDo</a></td>
		   		<td><a href='/eyda/{{id}}'>Eyða ToDo</a><br></td>
		%	end
	  	</tr>
	 	%end
  	</tbody>
</table>