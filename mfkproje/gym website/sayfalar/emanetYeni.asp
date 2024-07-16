<%response.charset = "windows-1254"
response.charset = "iso-8859-9"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
	<link rel="stylesheet" type="text/css" href="../stil.css">
</head>

<body topmargin="100px">
<%EmanetTarihi=request.form("EmanetTarihi")
KitapId=request.form("KitapId")
UyeId=request.form("UyeId")
KutuphaneId=request.form("KutuphaneId")%>

<%Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt.mdb")%>
<%Set rs= conn.Execute("SELECT EmanetTarihi FROM EMANET WHERE IsNull(TeslimTarihi) AND KitapId=" & KitapId & " AND UyeId=" & UyeId)%>
<%dim syc
syc=0
Do while Not rs.eof
	syc=1%>
	<script>
		alert("Bu Kitap Bu Üye Tarafýndan Daha Önce Alýnmýþ ve Teslim Edilmemiþtir...");
		window.location="emanet.asp";
	</script>
<%rs.MoveNext
Loop%>

<%if syc=0 then%>
	<%Set rs= conn.Execute("INSERT INTO EMANET(EmanetTarihi,KitapID,UyeID,KutuphaneID) VALUES('" & EmanetTarihi & "'," & KitapID & "," & UyeID & "," & KutuphaneID & ")")%>
<%end if%>
<script>
	alert("Kayýt Eklenmiþtir...");
	window.location="emanet.asp";
</script>
</body>
</html>