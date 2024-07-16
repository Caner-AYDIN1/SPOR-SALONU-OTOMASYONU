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
<table width="300px" cellspacing="1px" align="center">
	<form name="frm1" method="post" action="kutuphaneYeni.asp">
	<tr>
		<td width="120px">ID</td>
		<td><input type="text" value="Otomatik atanacaktýr..." ReadOnly></td>
	</tr>
	<tr>
		<td>KutuphaneAd</td>
		<td><input type="text" name="KutuphaneAd"></td>
	</tr>
	<tr>
		<td>AdresId</td>
		<td>
			<%Set rs= conn.Execute("SELECT ID, (Mahalle&' M. '&Cadde&' C. '&Sokak& ' S.') AS AdresDetay FROM ADRESLER")%>
			<select name="AdresId">
			<%Do while Not rs.eof%>
				<option value='<%=rs("ID")%>'><%=rs("ID")%> / <%=rs("AdresDetay")%>
				<%rs.MoveNext
			Loop%>
			</select>
		</td>
	</tr>
	<tr align="center">
		<td colspan="2"><input type="Submit" value="Kaydet"><input type="Reset" value="Temizle"></td>
	</tr>
	</form>
</table><br><br>

<%Set rs= conn.Execute("SELECT * FROM KUTUPHANE")%>
<table width="800px" cellspacing="1px" align="center">
	<tr height="25px" style="font-weight: bold;">
		<td bgcolor="888888">ID</td>
		<td bgcolor="888888">KutuphaneAd</td>
		<td bgcolor="888888">AdresId</td>
		<td bgcolor="888888">AdresDetay</td>
		<td bgcolor="888888">Silme Ýþlemi</td>
		<td bgcolor="888888">Güncelleme Ýþlemi</td>
	</tr>
	<%Do while Not rs.eof%>
	<tr height="20px">
		<td><%=rs("ID")%></td>
		<td><%=rs("KutuphaneAd")%></td>
		<td><%=rs("AdresId")%></td>
		<td>
			<%Set rsTmp= conn.Execute("SELECT (Mahalle&' M. '&Cadde&' C. '&Sokak& ' S.')AS AdresDetay FROM ADRESLER WHERE ID=" & rs("AdresId"))%>
			<%Do while Not rsTmp.eof%>
				<%=rsTmp("AdresDetay")%>
				<%rsTmp.MoveNext
			Loop
			rsTmp.close
			Set rsTmp=nothing%>
		</td>
		<td><a href="kutuphaneSil.asp?ID=<%=rs("ID")%>">Sil</a></td>
		<td><a href="kutuphaneGuncelle1.asp?ID=<%=rs("ID")%>">Güncelle</a></td>
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