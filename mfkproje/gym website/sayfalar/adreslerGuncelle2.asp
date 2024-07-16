<%response.charset = "windows-1254"
response.charset = "iso-8859-9"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
	<link rel="stylesheet" type="text/css" href="../stil.css">
</head>

<body topmargin="100px">
<%ID=request.Form("ID")
Cadde=request.form("Cadde")
Sokak=request.form("Sokak")
Mahalle=request.form("Mahalle")
BinaNo=request.form("BinaNo")
DaireNo=request.form("DaireNo")
Il=request.form("Il")
Ilce=request.form("Ilce")
PostaKodu=request.form("PostaKodu")%>

<%Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt.mdb")%>
<%Set rs= conn.Execute("UPDATE ADRESLER SET Cadde='" & Cadde &"',Sokak='" & Sokak &"',Mahalle='" & Mahalle &"',BinaNo=" & BinaNo &",DaireNo=" & DaireNo &",Il='" & Il &"',Ilce='" & Ilce &"',PostaKodu=" & PostaKodu &" WHERE ID=" & ID)%>

<script>
	alert("Kayýt Güncellenmiþtir...");
	window.location="adresler.asp";
</script>
</body>
</html>