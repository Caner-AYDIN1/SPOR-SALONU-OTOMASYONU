<%response.charset = "windows-1254"
response.charset = "iso-8859-9"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
	<link rel="stylesheet" type="text/css" href="stil.css">
</head>

<body topmargin="100px">
<table width="300px" cellspacing="3px" align="center"  >
	<form name="frm1" method="post" action="takviyeYeni.asp">
	<tr >
		<td width="120px">ID</td>
		<td><input type="text" value="Otomatik atanacaktir..." ReadOnly></td>
	</tr>
	<tr >
		<td>Takviye Marka</td>
		<td>
        <select name="TakviyeMarka" id="TakviyeMarka" required>
            <option value="">Seciniz</option>
            <option value="Hard Line">Hard Line</option>
            <option value="Big Joy">Big Joy</option>
            <option value="Olimp">Olimp</option>
            <option value="Weider">Weider</option>
            <option value="POWERTECH">POWERTECH</option>
            <option value="Multipower">Multipower</option>
            <option value="Supplementler">Supplementler</option>
        </select>
		</td>
	</tr>
	<tr>
		<td>Takviye Adi</td>
		<td>
        <select name="TakviyeAdi" id="TakviyeAdi" required>
            <option value="">Seciniz</option>
            <option value="Protein Bar">Protein Bar</option>
            <option value="Creatine">Creatine</option>
            <option value="Whey Protein Biskuvi">Whey Protein Biskuvi</option>
            <option value="Protein Tozu">Protein Tozu</option>
            <option value="Vegan Protein Bar">Vegan Protein Bar</option>
            <option value="Whey Protein Tozu">Whey Protein Tozu</option>
            <option value="Gainer">Gainer</option>
        </select>
		</td>
	</tr>
	<tr>
		<td>Takviye Aroma</td>
		<td>
        <select name="TakviyeAroma" id="TakviyeAroma" required>
            <option value="">Seciniz</option>
            <option value="Biskuvi">Biskuvi</option>
            <option value="Cikolatali">Cikolatali</option>
            <option value="Cilekli">Cilekli</option>
            <option value="Muz">Muz</option>
            <option value="Aromasiz">Aromasiz</option>
            <option value="Limonlu">Limonlu</option>
            <option value="Portakal">Portakal</option>
			<option value="Orman Meyveleri">Orman Meyveleri</option>
			<option value="Yaban Mersini">Yaban Mersini</option>
        </select>
		</td>
	</tr>
	<tr>
		<td>Takviye Gram</td>
		<td><input type="text" name="TakviyeGram"></td>
	</tr>
	<tr>
		<td>Takviye Adet</td>
		<td><input type="text" name="TakviyeAdet"></td>
	</tr>
	<tr>
		<td>Takviye Ucret</td>
		<td><input type="text" name="TakviyeUcret"></td>
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
<%Set rs= conn.Execute("SELECT * FROM TAKVIYE")%>
<table width="800px" cellspacing="3px" align="center" >
	<tr height="25px" style="font-weight: bold;">
		<td bgcolor="888888">ID</td>
		<td bgcolor="888888">TakviyeMarka</td>
		<td bgcolor="888888">TakviyeAdi</td>
		<td bgcolor="888888">TakviyeAroma</td>
		<td bgcolor="888888">TakviyeGram</td>
		<td bgcolor="888888">TakviyeAdet</td>
		<td bgcolor="888888">TakviyeUcret</td>
		<td bgcolor="888888"width="50">Silme islemi</td>
		<td bgcolor="888888"width="50">Guncelleme islemi</td>
	</tr>
	<%Do while Not rs.eof%>
	<tr height="20px">
		<td><%=rs("ID")%></td>
		<td><%=rs("TakviyeMarka")%></td>
		<td><%=rs("TakviyeAdi")%></td>
		<td><%=rs("TakviyeAroma")%></td>
		<td><%=rs("TakviyeGram")%></td>
		<td><%=rs("TakviyeAdet")%></td>
		<td><%=rs("TakviyeUcret")%></td>
		
		<td><a href="takviyeSil.asp?ID=<%=rs("ID")%>">Sil</a></td>
		<td><a href="takviyeGuncelle1.asp?ID=<%=rs("ID")%>">Guncelle</a></td>
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