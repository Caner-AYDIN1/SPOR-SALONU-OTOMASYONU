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
HocaAd=request.Form("HocaAd")
HocaSoyad=request.Form("HocaSoyad")
Cinsiyet=request.form("Cinsiyet")

Telefon=request.Form("Telefon")
EPosta=request.Form("EPosta")
%>

<%Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt.mdb")%>
<%Set rs= conn.Execute("UPDATE HOCALAR SET HocaAd='" & HocaAd & "', HocaSoyad='" & HocaSoyad & "',Cinsiyet='" & Cinsiyet &"',Telefon=" & Telefon &",EPosta='" & EPosta &"' WHERE ID=" & ID)%>

<script>
	alert("Kayıt Guncellenmistir...");
	window.location="hocalar.asp";
</script>
</body>
</html>