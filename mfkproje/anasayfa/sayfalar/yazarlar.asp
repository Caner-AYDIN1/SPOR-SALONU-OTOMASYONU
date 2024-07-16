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
	<form name="frm1" method="post" action="yazarlarYeni.asp">
	<tr>
		<td width="120px">ID</td>
		<td><input type="text" value="Otomatik atanacaktýr..." ReadOnly></td>
	</tr>
	<tr>
		<td>Yazar Ad</td>
		<td><input type="text" name="YazarAd"></td>
	</tr>
	<tr>
		<td>Yazar Soyad</td>
		<td><input type="text" name="YazarSoyad"></td>
	</tr>
	<tr align="center">
		<td colspan="2"><input type="Submit" value="Kaydet"><input type="Reset" value="Temizle"></td>
	</tr>
	</form>
</table><br><br>

<%Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt.mdb")%>
<%Set rs= conn.Execute("SELECT * FROM YAZARLAR")%>
<table width="800px" cellspacing="1px" align="center">
	<tr height="25px" style="font-weight: bold;">
		<td bgcolor="888888">ID</td>
		<td bgcolor="888888">Yazar Ad</td>
		<td bgcolor="888888">Yazar Soyad</td>
		<td bgcolor="888888">Yazar Ad Soyad</td>
		<td bgcolor="888888">Yazar Kitaplarý<br>Kitap Ad / Yýl / YayýnEvi</td>
		<td bgcolor="888888">Silme Ýþlemi</td>
		<td bgcolor="888888">Güncelleme Ýþlemi</td>
	</tr>
	<%Do while Not rs.eof%>
	<tr height="20px">
		<td><%=rs("ID")%></td>
		<td><%=rs("YazarAd")%></td>
		<td><%=rs("YazarSoyad")%></td>
		<td><%=rs("YazarAd")&" "&rs("YazarSoyad")%></td>
		<td>
			<%Set conn = Server.CreateObject("ADODB.Connection")
			conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt.mdb")%>
			<%Set rsTmp= conn.Execute("SELECT KitapAd,YayinTarihi,YayinEviAdi FROM (KITAPLAR LEFT JOIN KITAPLARYAZARLAR ON KITAPLAR.ID=KITAPLARYAZARLAR.KitapId) LEFT JOIN YAYINEVLERI ON KITAPLAR.YayinEviId=YAYINEVLERI.ID WHERE YazarId=" & rs("ID"))%>
			<table cellspacing="0px" align="left">
			<%Do while Not rsTmp.eof%>
				<tr>
					<td width="150px"><%=rsTmp("KitapAd")%></td><td width="50px"><%=Right(rsTmp("YayinTarihi"),4)%></td><td width="75px"><%=rsTmp("YayinEviAdi")%></td>
				</tr>
				<%rsTmp.MoveNext
			Loop%>
			</table>
		</td>
		<td><a href="yazarlarSil.asp?ID=<%=rs("ID")%>">Sil</a></td>
		<td><a href="yazarlarGuncelle1.asp?ID=<%=rs("ID")%>">Güncelle</a></td>
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