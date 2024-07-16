<%response.charset = "windows-1254"
response.charset = "iso-8859-9"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
	<link rel="stylesheet" type="text/css" href="stil.css">
</head>

<body topmargin="100px">
<table width="300px" cellspacing="3px" align="center">
	<form name="frm1" method="post" action="hocalarYeni.asp">
	<tr>
		<td width="120px">ID</td>
		<td><input type="text" value="Otomatik Atanacaktir..." ReadOnly></td>
	</tr>
	<tr>
		<td>Hoca Ad</td>
		<td><input type="text" name="HocaAd"></td>
	</tr>
	<tr>
		<td>Hoca Soyad</td>
		<td><input type="text" name="HocaSoyad"></td>
	</tr>
	<tr>
		<td>Cinsiyet</td>
		<td>
			<input type="radio" name="Cinsiyet" value="0">Erkek
			<input type="radio" name="Cinsiyet" value="1">Kadin
		</td>
	</tr>
	 
	<tr>
		<td>Telefon</td>
		<td><input type="text" name="Telefon"></td>
	</tr>
	<tr>
		<td>EPosta</td>
		<td><input type="text" name="EPosta"></td>
	</tr>
	<tr align="center">
		<td colspan="2"><input type="Submit" value="Kaydet"><input type="Reset" value="Temizle"></td>
	</tr>
	</form>
</table><br><br>

<%Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt.mdb")%>
<%Set rs= conn.Execute("SELECT * FROM HOCALAR")%>
<table width="800px" cellspacing="3px" align="center">
	<tr height="25px" style="font-weight: bold;">
		<td bgcolor="888888">ID</td>
		<td bgcolor="888888">Hoca Ad</td>
		<td bgcolor="888888">Hoca Soyad</td>
		<td bgcolor="888888">Hoca Ad Soyad</td>
		<td bgcolor="888888">Cinsiyet</td>
		
		<td bgcolor="888888"width="70">Telefon</td>
		<td bgcolor="888888">EPosta</td>
		<td bgcolor="888888" width="40">Silme islemi</td>
		<td bgcolor="888888"width="50">Guncelleme islemi</td>
	</tr>
	<%Do while Not rs.eof%>
	<tr height="20px">
		<td><%=rs("ID")%></td>
		<td><%=rs("HocaAd")%></td>
		<td><%=rs("HocaSoyad")%></td>
		<td><%=rs("HocaAd")&" "&rs("HocaSoyad")%></td>
		<td>
			<%if rs("Cinsiyet")=0 then%>
				ERKEK
			<%else%>
				KADIN
			<%end if%>
		</td>
		
		<td><%=rs("Telefon")%></td>
		<td><%=rs("EPosta")%></td>
		
		<td><a href="hocalarSil.asp?ID=<%=rs("ID")%>">Sil</a></td>
		<td><a href="hocalarGuncelle1.asp?ID=<%=rs("ID")%>">Guncelle</a></td>
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