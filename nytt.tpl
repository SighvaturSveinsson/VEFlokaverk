<link rel="stylesheet" type="text/css" href="styles.css">
<meta charset="utf-8">
<form action="/new" method="POST" accept-charset='ISO-8859-1'>
<fieldset>
	<label>
		<p>Nýtt ToDo<br>
		<input type="text" name="todo" required></p>
	</label>
	<label>
		<p>Lýsing ToDo (aukalegt)<br>
		<textarea name="texti"></textarea></p>
	</label>
	<input type="submit" name="submit" value="Bæta við" >
</fieldset>
</form>