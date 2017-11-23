<link rel="stylesheet" type="text/css" href="styles.css">
<meta charset="utf-8">
<a href='/nytt'>Bæta við nýju ToDo</a><br>
<table class="col-2-3">
  	<thead>
  		<tr>
  			<th scope="col">ToDo</th>
    		<th scope="col">Status</th>
    		<th scope="col">Lýsing</th>
  		</tr>
  	</thead>
  	<tbody>
	  	<tr>
% import pymysql
% conn = pymysql.connect(host='tsuts.tskoli.is', port=3306, user='1809003730', passwd='mypassword',db='1809003730_veflokaverkefni')
% cur = conn.cursor()
% cur.execute("SELECT * FROM todo")
		% for i in cur:
		% 	todo  = i[1]
		% 	status = i[2]
		% 	lysing = i[3]
	    	<td>{{todo}}</td>
	    	<td>{{status}}</td>
	    	<td>{{lysing}}</td>
	    	<td><a href='/buid/{{todo}}'>Buinn með ToDo</a></td>
	    	<td><a href='/breyt/{{todo}}'>Breyta ToDo</a></td>
	   		<td><a href='/eyda/{{todo}}'>Eyða ToDo</a><br></td>
	   		
	  	</tr>
	 	%end
  	</tbody>
</table>