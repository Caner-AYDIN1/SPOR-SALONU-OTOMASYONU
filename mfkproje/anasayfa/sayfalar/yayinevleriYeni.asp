<%response.charset = "windows-1254"
response.charset = "iso-8859-9"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
	<link rel="stylesheet" type="text/css" href="../stil.css">
</head>

<body topmargin="100px">
<%YayinEviAdi=request.form("YayinEviAdi")%>

<%Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt.mdb")%>
<%Set rs= conn.Execute("INSERT INTO YAYINEVLERI(YayinEviAdi) VALUES('" & YayinEviAdi & "')")%>

<script>
	alert("Kayýt Eklenmiþtir...");
	window.location="yayinevleri.asp";
</script>
</body>
</html>