<%response.charset = "windows-1254"
response.charset = "iso-8859-9"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
	<link rel="stylesheet" type="text/css" href="../stil.css">
</head>

<body topmargin="100px">
<%EkipmanKategori=request.form("EkipmanKategori")%>
<%EkipmanMarka=request.form("EkipmanMarka")%>
<%EkipmanAdi=request.form("EkipmanAdi")%>
<%EkipmanBeden=request.form("EkipmanBeden")%>
<%EkipmanAgirlik=request.form("EkipmanAgirlik")%>
<%EkipmanUzunluk=request.form("EkipmanUzunluk")%>

<%Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt.mdb")%>
<%Set rs= conn.Execute("INSERT INTO EKIPMAN (EkipmanKategori,EkipmanMarka,EkipmanAdi,EkipmanBeden,EkipmanAgirlik,EkipmanUzunluk) VALUES('" & EkipmanKategori & "','" & EkipmanMarka & "','" & EkipmanAdi & "','" & EkipmanBeden & "','" & EkipmanAgirlik & "','" & EkipmanUzunluk & "')")%>

<script>
	alert("Kayit Eklenmistir...");
	window.location="kategoriler.asp";
</script>
</body>
</html>