<%response.charset = "windows-1254"
response.charset = "iso-8859-9"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
	<link rel="stylesheet" type="text/css" href="../stil.css">
</head>

<%
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt.mdb")
%>
<body topmargin="100px">
<%ID=request.queryString("ID")%>
<%Set rs= conn.Execute("SELECT EmanetTarihi,TeslimTarihi,KitapID,KitapAd,YayinTarihi,UyeID,(Ad & ' ' & Soyad)AS UyeDetay,KutuphaneID,KutuphaneAd AS KutuphaneDetay FROM ((EMANET LEFT JOIN KITAPLAR ON EMANET.KitapID=KITAPLAR.ID) LEFT JOIN UYELER ON EMANET.UyeID=UYELER.ID) LEFT JOIN KUTUPHANE ON EMANET.KutuphaneID=KUTUPHANE.ID WHERE UyeID=" & ID)%>
<table width="1200px" cellspacing="1px" align="center">
	<tr height="25px" style="font-weight: bold;">
		<td bgcolor="888888">EmanetTarihi</td>
		<td bgcolor="888888">TeslimTarihi</td>
		<td bgcolor="888888">KitapID</td>
		<td bgcolor="888888">KitapAd</td>
		<td bgcolor="888888">YayinTarihi</td>
		<td bgcolor="888888">UyeID</td>
		<td bgcolor="888888">UyeDetay</td>
		<td bgcolor="888888">KutuphaneID</td>
		<td bgcolor="888888">KutuphaneDetay</td>
	</tr>
	<%Do while Not rs.eof%>
	<tr height="20px">
		<td><%=rs("EmanetTarihi")%></td>
		<td><%=rs("TeslimTarihi")%></td>
		<td><%=rs("KitapID")%></td>
		<td><%=rs("KitapAd")%></td>
		<td><%=rs("YayinTarihi")%></td>
		<td><%=rs("UyeID")%></td>
		<td><%=rs("UyeDetay")%></td>
		<td><%=rs("KutuphaneID")%></td>
		<td><%=rs("KutuphaneDetay")%></td>
	</tr>
	<%rs.MoveNext
	Loop%>
</table>
	
<%rs.close
Set rs=nothing
conn.close
set conn=nothing%>
</body>
</html>