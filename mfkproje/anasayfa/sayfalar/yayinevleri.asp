<%response.charset = "windows-1254"
response.charset = "iso-8859-9"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
	<link rel="stylesheet" type="text/css" href="../stil.css">
</head>

<body topmargin="100px">
<table width="300px" cellspacing="1px" align="center">
	<form name="frm1" method="post" action="yayinevleriYeni.asp">
	<tr>
		<td width="120px">ID</td>
		<td><input type="text" value="Otomatik atanacaktýr..." ReadOnly></td>
	</tr>
	<tr>
		<td>Yayinevleri Adi</td>
		<td><input type="text" name="YayinEviAdi"></td>
	</tr>
	<tr align="center">
		<td colspan="2"><input type="Submit" value="Kaydet"><input type="Reset" value="Temizle"></td>
	</tr>
	</form>
</table><br><br>

<%
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt.mdb")
%>
<%Set rs= conn.Execute("SELECT * FROM YAYINEVLERI")%>
<table width="500px" cellspacing="1px" align="center">
	<tr height="25px" style="font-weight: bold;">
		<td bgcolor="888888">ID</td>
		<td bgcolor="888888">YayinEviAdi</td>
		<td bgcolor="888888">Silme Ýþlemi</td>
		<td bgcolor="888888">Güncelleme Ýþlemi</td>
	</tr>
	<%Do while Not rs.eof%>
	<tr height="20px">
		<td><%=rs("ID")%></td>
		<td><%=rs("YayinEviAdi")%></td>
		<td><a href="yayinevleriSil.asp?ID=<%=rs("ID")%>">Sil</a></td>
		<td><a href="yayinevleriGuncelle1.asp?ID=<%=rs("ID")%>">Güncelle</a></td>
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