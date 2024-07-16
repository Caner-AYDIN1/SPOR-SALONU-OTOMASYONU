<%response.charset = "windows-1254"
response.charset = "iso-8859-9"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
	<link rel="stylesheet" type="text/css" href="../stil.css">
</head>

<body topmargin="100px">
<%ID=request.queryString("ID")%>

<%Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt.mdb")%>
<%Set rs= conn.Execute("SELECT * FROM KATEGORILER WHERE ID=" & ID )%>

<form name="frm1" method="post" action="kategorilerGuncelle2.asp">
<table cellspacing="1px" align="center">
	<tr>
		<td width="100px">ID</td>
		<td><input name="ID" type="text" value="<%=rs("ID")%>" Readonly></td>
	</tr>
	<tr>
		<td>KategoriAdi</td>
		<td><input name="KategoriAdi" value="<%=rs("KategoriAdi")%>" type="text"></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="Submit" value="Güncelle"><input type="Reset" value="Temizle"></td>
	</tr>
</table>
</form>
</body>
</html>