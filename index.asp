﻿<%
'events = array ("Nyaralás","Jön Álmi Niki Évi Krinya karácsonykor","Megyek haza körtézni","Londoni utazás(Nyikos Eszti Anita Boldi)","Bortúra","Megyek Álmihoz","Nyári 2 hetes pihenés ");
'dates = array ("2010-10-30", "2010-12-28", "2011-02-25", "2011-03-16","2011-04-29","2011-05-27", "2011-08-12");	
Dim events, dates
events = array ("Nyaralás","Jön Álmi Niki Évi Krinya karácsonykor","Megyek haza körtézni","Londoni utazás(Nyikos Eszti Anita Boldi)","Bortúra","Megyek Álmihoz és Accához","Nyári 2 hetes pihenés", "Madeira", "Megyek haza karácsonykor","Megyek haza születésnapozni", "Jön Álmi", "Bortúra", "Jön Évi Londonba", "Nyaralok kicsit otthon", "Dublin", "Valencia", "Megyek haza karácsonykor","Megyek haza születésnapozni","Bortúra", "Nyaralok kicsit otthon", "Tenerife", "Álmi Mesi", "Évi", "Iceland", "Megyek haza kulturáltan szórakozni", "Bortúra", "Irány a magyar tenger", "Korfu", "Miami", "Zurich", "Szülihét", "Bergen", "Basel", "Bortura", "Balaton", "Krk", "Álmi Mesi", "Lanzarote", "Szilveszter - Győr", "Amsterdam ... Boat Show ...:)", "Bortúra + pár nap otthon", "Thorpe project", "Azori-szigetek", "Krk", "Stuttgart", "La Palma:)", "Karácsony otthon", "Rab és Magyarország", "Fuerteventura", "Lilla", "Megyek haza karácsonyozni", "Megyek Haza", "Kinga, Wales", "Madeira", "Biáék meglátogatnak", "Megyek haza:)", "Emese", "Ciprus", "Karácsony otthon", "Palau", "Húsvét otthon", "Alicante", "Horvát project", "Stuttgart", "Tenerife", "Karácsony otthon", "Gran Canaria", "Megyek Haza", "Fuerteventura", "Mauritius", "Lanzarote", "Cotswolds", "Megyek haza", "Devon", "Málta", "Barbados", "Fuerteventura", "Haza", "Tenerife", "Madeira", "Majorca", "Megyek haza", "Bali", "Fuerteventura", "Megyek haza", "Lanzarote", "St Lucia", "Tenerife", "Megyek haza", "Azores", "Andorra", "Tenerife", "Tenerife")
dates = array ("2010-10-30", "2010-12-28", "2011-02-25", "2011-03-16","2011-04-29","2011-05-27", "2011-08-12", "2011-10-01", "2011-12-23", "2012-03-02", "2012-04-05", "2012-04-19", "2012-05-31", "2012-06-28", "2012-09-20", "2012-11-23", "2012-12-26", "2013-03-01", "2013-05-03", "2013-07-12", "2013-09-14", "2013-09-28", "2013-10-23", "2013-11-13", "2014-02-22", "2014-04-30", "2014-07-05", "2014-08-23", "2014-11-07", "2014-12-24", "2015-02-27", "2015-04-30", "2015-05-09", "2015-05-21", "2015-06-26", "2015-08-22", "2015-09-16", "2015-09-26", "2015-12-30", "2016-03-18", "2016-04-22", "2016-05-12", "2016-06-04", "2016-07-30", "2016-09-09", "2016-10-08", "2016-12-24", "2017-08-17", "2017-11-04", "2017-12-14", "2017-12-26", "2018-03-17", "2018-03-29", "2018-05-19", "2018-06-15", "2018-06-30", "2018-08-24", "2018-09-29", "2018-12-22", "2019-03-01", "2019-04-19", "2019-05-17", "2019-08-09", "2019-09-13", "2019-10-05", "2019-12-21", "2020-03-14", "2021-03-27", "2021-09-11", "2021-11-04", "2022-03-19", "2022-04-15", "2022-05-28", "2022-06-24", "2022-08-22", "2022-09-07", "2022-12-26", "2023-02-17", "2023-03-03", "2023-04-15", "2023-05-13", "2023-07-01", "2023-09-02", "2023-11-09", "2024-02-16", "2024-03-02", "2024-04-07", "2024-05-09", "2024-07-06", "2024-08-08", "2024-09-21", "2024-12-07", "2025-03-01")

'Response.Write(DateDiff("d","2010-10-31",date()))


'//echo date("Y-m-d");

'function dateDiff($start, $end) {
'	$start_ts = strtotime($start);
'	$end_ts = strtotime($end);
'	$diff = $end_ts - $start_ts;
'	return round($diff / 86400);
'}

%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Robi visszaszámlálója</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style>
body{
	background:url(images/bg.jpg) no-repeat fixed left top #6174B6;
	background-size: 100%;
}
.f_left{
	float:left;
}
.c_both{
	clear:both;
}
.next_event{
	color:#FFF;
	font-size:42px;
	padding-top:8px;
}
.event{
	color:#FFF;
	font-size:36px;
	padding:15px 0px 0px 12px;
}
.day{
	color:red;
}
</style>
</head>
<body>
<div><img src="images/title.png" alt="" /></div>
<%
i = 0
first = 1
for each value in events
'//echo $value." - ".$dates[$i]."<br>";

If (DateDiff("d", date(), dates(i)) >=0) OR (dates(i) = "") Then
	if(first=1) Then
		first = 0
	%>
	<div class="c_both">
		<div class="f_left"><img src="images/events.png" alt="" /></div>
		<div class="f_left next_event">
	<%
		Response.Write(value)
'		if($dates[$i]!="") echo (dateDiff(date("Y-m-d"), $dates[$i]) == 0?' <span class="day">Ma</span>':' <span class="day">'.dateDiff(date("Y-m-d"), $dates[$i]).'</span> nap');
		if(dates(i)<>"") then Response.Write(" <span class=""day"">" & dateDiff("d", date(), dates(i)) & "</span> nap")

	%>
		</div>    
	</div>
	<%

	Else
	%>
	<div class="c_both event">
	<%
		Response.Write(value)
		if(dates(i)<>"") then Response.Write(" <span class=""day"">" & dateDiff("d", date(), dates(i)) & "</span> nap")
	%>
	</div>
	<%	
'	}
	%>
<%
	End If
End If
i = i + 1
next
%>
</body>
</html>