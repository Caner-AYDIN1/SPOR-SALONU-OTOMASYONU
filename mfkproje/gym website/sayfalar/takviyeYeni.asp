<%response.charset = "windows-1254"
response.charset = "iso-8859-9"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
	<link rel="stylesheet" type="text/css" href="../stil.css">
</head>

<body topmargin="100px">
<%TakviyeMarka=request.form("TakviyeMarka")%>
<%TakviyeAdi=request.form("TakviyeAdi")%>
<%TakviyeAroma=request.form("TakviyeAroma")%>
<%TakviyeGram=request.form("TakviyeGram")%>
<%TakviyeAdet=request.form("TakviyeAdet")%>
<%TakviyeUcret=request.form("TakviyeUcret")%>

<%Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt.mdb")%>
<%Set rs= conn.Execute("INSERT INTO TAKVIYE(TakviyeMarka,TakviyeAdi,TakviyeAroma,TakviyeGram,TakviyeAdet,TakviyeUcret) VALUES('" & TakviyeMarka & "','" & TakviyeAdi & "','" & TakviyeAroma & "'," & TakviyeGram & "," & TakviyeAdet & "," & TakviyeUcret & ")")%>

<script>
	alert("Kayit Eklenmistir...");
	window.location="takviye.asp";
</script>
</body>
</html>