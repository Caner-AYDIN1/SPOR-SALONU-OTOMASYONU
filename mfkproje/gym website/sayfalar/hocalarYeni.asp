<%response.charset = "windows-1254"
response.charset = "iso-8859-9"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
	<link rel="stylesheet" type="text/css" href="../stil.css">
</head>

<body topmargin="100px">
<%HocaAd=request.form("HocaAd")
HocaSoyad=request.form("HocaSoyad")
Cinsiyet=request.form("Cinsiyet")

Telefon=request.form("Telefon")
EPosta=request.form("EPosta")

%>

<%Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt.mdb")%>
<%Set rs= conn.Execute("INSERT INTO HOCALAR(HocaAd, HocaSoyad, Cinsiyet, Telefon,EPosta) VALUES('" & HocaAd & "','" & HocaSoyad & "','" & Cinsiyet & "'," & Telefon & ",'" & EPosta & "')")%>

<script>
	alert("Kayıt Eklenmistir...");
	window.location="hocalar.asp";
</script>
</body>
</html>