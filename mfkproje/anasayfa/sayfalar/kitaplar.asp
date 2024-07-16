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
	<form name="frm1" method="post" action="kitaplarYeni.asp">
	<tr>
		<td width="120px">ID</td>
		<td><input type="text" value="Otomatik atanacaktýr..." ReadOnly></td>
	</tr>
	<tr>
		<td>ISBN</td>
		<td><input type="text" name="ISBN"></td>
	</tr>
	<tr>
		<td>KitapAd</td>
		<td><input type="text" name="KitapAd"></td>
	</tr>
	<tr>
		<td>YayinTarihi</td>
		<td><input type="text" name="YayinTarihi"></td>
	</tr>
	<tr>
		<td>SayfaSayisi</td>
		<td><input type="text" name="SayfaSayisi"></td>
	</tr>
	<tr>
		<td>YayinEviId</td>
		<td>
		
		<%Set rs= conn.Execute("SELECT * FROM YAYINEVLERI")%>		
			<select name="Il">
			<%Do while Not rs.eof%>
				<option value='<%=rs("ID")%>'><%=rs("ID")%> / <%=rs("YayinEviAdi")%>
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

<%Set rs= conn.Execute("SELECT * FROM KITAPLAR LEFT JOIN YAYINEVLERI ON KITAPLAR.YayinEviId=YAYINEVLERI.ID")%>
<table width="800px" cellspacing="1px" align="center">
	<tr height="25px" style="font-weight: bold;">
		<td bgcolor="888888">ID</td>
		<td bgcolor="888888">ISBN</td>
		<td bgcolor="888888">KitapAd</td>
		<td bgcolor="888888">YayinTarihi</td>
		<td bgcolor="888888">SayfaSayisi</td>
		<td bgcolor="888888">YayinEviId</td>
		<td bgcolor="888888">YayinEviDetay</td>
		<td bgcolor="888888">Silme Ýþlemi</td>
		<td bgcolor="888888">Güncelleme Ýþlemi</td>
	</tr>
	<%Do while Not rs.eof%>
	<tr height="20px">
		<td><%=rs("KITAPLAR.ID")%></td>
		<td><%=rs("ISBN")%></td>
		<td><%=rs("KitapAd")%></td>
		<td><%=rs("YayinTarihi")%></td>
		<td><%=rs("SayfaSayisi")%></td>
		<td><%=rs("YayinEviId")%></td>
		<td><%=rs("YayinEviAdi")%></td>
		<!--<td><a href="kitaplarSil.asp?ID=<%=rs("KITAPLAR.ID")%>">Sil</a></td>
		<td><a href="kitaplarGuncelle1.asp?ID=<%=rs("KITAPLAR.ID")%>">Güncelle</a></td>-->
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