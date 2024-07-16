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
<%Set rs= conn.Execute("SELECT * FROM HOCALAR WHERE ID=" & ID )%>

<form name="frm1" method="post" action="hocalarGuncelle2.asp">
<table cellspacing="3px" align="center">
	<tr>
		<td width="100px">ID</td>
		<td><input name="ID" type="text" value="<%=rs("ID")%>" Readonly></td>
	</tr>
	<tr>
		<td>HocaAd</td>
		<td><input name="HocaAd" value="<%=rs("HocaAd")%>" type="text"></td>
	</tr>
	<tr>
		<td>HocaSoyad</td>
		<td><input name="HocaSoyad" value="<%=rs("HocaSoyad")%>" type="text"></td>
	</tr>
	<tr>
		<td>Cinsiyet</td>
		<td>
			<%if rs("Cinsiyet")=0 then%>
				<input name="Cinsiyet" value="0" type="radio" checked>Erkek
				<input name="Cinsiyet" value="1" type="radio">Kadın
			<%else%>
				<input name="Cinsiyet" value="0" type="radio">Erkek
				<input name="Cinsiyet" value="1" type="radio" checked>Kadın
			<%end if%>
		</td>
	</tr>
	
		<td>Telefon</td>
		<td><input name="Telefon" value="<%=rs("Telefon")%>" type="text"></td>
	</tr>
	<tr>
		<td>EPosta</td>
		<td><input name="EPosta" value="<%=rs("EPosta")%>" type="text"></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="Submit" value="Guncelle"><input type="Reset" value="Temizle"></td>
	</tr>
</table>
</form>
</body>
</html>