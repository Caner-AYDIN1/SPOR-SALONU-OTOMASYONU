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
Ad=request.form("Ad")
Soyad=request.form("Soyad")
Cinsiyet=request.form("Cinsiyet")
Telefon=request.form("Telefon")
EPosta=request.form("EPosta")
AdresId=request.form("AdresId")%>

<%Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt.mdb")%>
<%Set rs= conn.Execute("UPDATE UYELER SET Ad='" & Ad &"',Soyad='" & Soyad &"',Cinsiyet='" & Cinsiyet &"',Telefon=" & Telefon &",EPosta='" & EPosta &"',AdresId=" & AdresId &" WHERE ID=" & ID)%>

<script>
	alert("Kayýt Güncellenmiþtir...");
	window.location="uyeler.asp";
</script>
</body>
</html>