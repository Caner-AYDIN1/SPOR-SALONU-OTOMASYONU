<%response.charset = "windows-1254"
response.charset = "iso-8859-9"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
	<link rel="stylesheet" type="text/css" href="../stil.css">
</head>

<body topmargin="100px">
<%EmanetTarihi=request.queryString("EmanetTarihi")
TeslimTarihi=request.queryString("TeslimTarihi")
KitapID=request.queryString("KitapID")
UyeID=request.queryString("UyeID")
KutuphaneID=request.queryString("KutuphaneID")%>

<%if Len(TeslimTarihi)=0 then%>
	<%Set conn = Server.CreateObject("ADODB.Connection")
	conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt.mdb")%>
	<%Set rs= conn.Execute("DELETE FROM EMANET WHERE EmanetTarihi='" & EmanetTarihi & "' AND KitapID=" & KitapID & " AND UyeID=" & UyeID & " AND KutuphaneID=" & KutuphaneID)%>
	<script>
		alert("Kayýt Silinmiþtir...");
		window.location="emanet.asp";
	</script>
<%else%>
	<script>
		alert("Teslim Edilen Kitap Silinemez...\nAncak Güncelleme Yapýlabilir...");
		window.location="emanet.asp";
	</script>
<%end if%>
</body>
</html>