<link rel="stylesheet" type="text/css" href="styles.css">
<meta charset="utf-8">
<a href='/nytt'>Bæta við nýju ToDo</a>
%for i in data['results']:
%    nafn  = i['eventDateName']
%    mynd = i['imageSource'] 
%    stadsetning = i['eventHallName']
%    dagsetning = i['dateOfShow']