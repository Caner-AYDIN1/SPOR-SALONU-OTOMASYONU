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
<%Set rs= conn.Execute("SELECT * FROM KUTUPHANE WHERE ID=" & ID )%>

<form name="frm1" method="post" action="kutuphaneGuncelle2.asp">
<table cellspacing="1px" align="center">
	<tr>
		<td width="100px">ID</td>
		<td><input name="ID" type="text" value="<%=rs("ID")%>" Readonly></td>
	</tr>
	<tr>
		<td>KutuphaneAd</td>
		<td><input name="KutuphaneAd" value="<%=rs("KutuphaneAd")%>" type="text"></td>
	</tr>
	<tr>
		<td>AdresId</td>
		<td>
			<%Set rsTmp= conn.Execute("SELECT ID, (Mahalle&' M. '&Cadde&' C. '&Sokak& ' S.') AS AdresDetay FROM ADRESLER")%>
			<select name="AdresId">
			<%Do while Not rsTmp.eof%>
				<%if rsTmp("ID")=rs("AdresId") then%>
					<option value='<%=rsTmp("ID")%>' selected><%=rsTmp("ID")%> / <%=rsTmp("AdresDetay")%>
				<%else%>
					<option value='<%=rsTmp("ID")%>'><%=rsTmp("ID")%> / <%=rsTmp("AdresDetay")%>
				<%end if%>
				<%rsTmp.MoveNext
			Loop%>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="Submit" value="G�ncelle"><input type="Reset" value="Temizle"></td>
	</tr>
</table>
</form>
</body>
</html>