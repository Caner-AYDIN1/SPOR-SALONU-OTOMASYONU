<%response.charset = "windows-1254"
response.charset = "iso-8859-9"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
	<link rel="stylesheet" type="text/css" href="../stil.css">
</head>

<body topmargin="100px">
<%EmanetTarihi=request.Form("EmanetTarihi")
TeslimTarihi=request.Form("TeslimTarihi")
KitapId=request.Form("KitapId")
UyeID=request.Form("UyeID")
KutuphaneID=request.Form("KutuphaneID")%>

<%Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt.mdb")%>
<%Set rs= conn.Execute("UPDATE EMANET SET TeslimTarihi='" & TeslimTarihi &"' WHERE EmanetTarihi='" & EmanetTarihi &"' AND KitapId=" & KitapId &" AND UyeID=" & UyeID &" AND KutuphaneID=" & KutuphaneID)%>

<script>
	alert("Kayýt Güncellenmiþtir...");
	window.location="emanet.asp";
</script>
</body>
</html>