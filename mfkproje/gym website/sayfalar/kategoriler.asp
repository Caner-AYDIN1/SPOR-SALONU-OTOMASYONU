<%response.charset = "windows-1254"
response.charset = "iso-8859-9"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
	<link rel="stylesheet" type="text/css" href="stil.css">
</head>

<body topmargin="100px">
<table width="350px" cellspacing="3px" align="center" >
	<form name="frm1" method="post" action="kategorilerYeni.asp">
	<tr>
		<td width="150px">ID</td>
		<td><input type="text" value="Otomatik atanacaktir..." ReadOnly></td>
	</tr>
	<tr >
		<td>Ekipman Kategori</td>
		<td>
        <select name="EkipmanKategori" id="EkipmanKategori" required>
            <option value="">Seciniz</option>
            <option value="Fitness ve Kondisyon">Fitness ve Kondisyon</option>
            <option value="Sporcu Aksesuarlari">Sporcu Aksesuarlari</option>
            <option value="Brans Sporlari">Brans Sporlari</option>
            <option value="Vucut Gelistirme Aletleri">Vucut Gelistirme Aletleri</option>
            <option value="Dambillar ve Agirlik Plakalari">Dambillar ve Agirlik Plakalari</option>
			<option value="Makineler">Makineler</option>
        </select>
		</td>
	</tr>
	<tr >
		<td>Ekipman Marka</td>
		<td>
        <select name="EkipmanMarka" id="EkipmanMarka" required>
            <option value="">Seciniz</option>
            <option value="Decathlon">Decathlon</option>
            <option value="Avessa">Avessa</option>
            <option value="Delta">Delta</option>
            <option value="LIVEPRO ">LIVEPRO </option>
            <option value="Dambilcim ">Dambilcim </option>
            <option value="Esi Fitness ">Esi Fitness </option>
            <option value="Dynamic ">Dynamic </option>
			<option value="Aydin Sport ">Aydin Sport </option>
        </select>
		</td>
	</tr>
	<tr >
		<td>Ekipman Adi</td>
		<td>
        <select name="EkipmanAdi" id="EkipmanAdi" required>
            <option value="">Seciniz</option>
            <option value="Dambillar ">Dambillar </option>
            <option value=" Agirlik Plakalari"> Agirlik Plakalari</option>
			<option value="Barfix Aleti cubugu ">Barfix Aleti cubugu </option>
            <option value="Halter Bari">Halter Bari</option>
            <option value="Fitness Eldiveni">Fitness Eldiveni</option> 
			<option value="Agirlik Kemeri ">Agirlik Kemeri </option>
            <option value="Atlama ipi">Atlama ipi</option>
            <option value="Kosu Bandi">Kosu Bandi</option>
            <option value="able Crossover">Cable Crossover</option>
			<option value="Biceps Curl">Biceps Curl</option>
			<option value="Squat Machine">Squat Machine</option>
			
        </select>
		</td>
	</tr>
	<tr >
		<td>Ekipman Beden</td>
		<td>
        <select name="EkipmanBeden" id="EkipmanBeden" required>
            <option value="">Seciniz</option>
			<option value="Beden Yok">Beden Yok</option>
            <option value="S">S Beden</option>
            <option value="M">M Beden</option>
            <option value="L">L Beden</option>
            <option value="XL">XL Beden</option>
            <option value="2XL">2XL Beden</option>
            <option value="XS">XS Beden</option>
            
        </select>
		</td>
	</tr>
	<tr >
		<td>Ekipman Agirlik(KG)</td>
		<td>
        <select name="EkipmanAgirlik" id="EkipmanAgirlik" required>
            <option value="">Seciniz</option>
			<option value="Agirlik Yok">Agirlik Yok</option>
            <option value="1">1KG</option>
            <option value="2">2KG</option>
            <option value="5">5KG</option>
            <option value="10">10KG</option>
            <option value="20">20KG</option>
            <option value="8">8KG</option>
            <option value="6">6KG</option>
        </select>
		</td>
	</tr>
	<tr >
		<td>Ekipman Uzunluk(CM)</td>
		<td>
        <select name="EkipmanUzunluk" id="EkipmanUzunluk" required>
            <option value="">Seciniz</option>
			<option value="Uzunluk Yok">Uzunluk Yok</option>
            <option value="100">100CM</option>
            <option value="50">50CM</option>
            <option value="80">80CM</option>
            <option value="150">150CM</option>
            <option value="200">200CM</option>
            
        </select>
		</td>
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
<%Set rs= conn.Execute("SELECT * FROM EKIPMAN")%>
<table width="1000px" cellspacing="3px" align="center" >
	<tr height="25px" style="font-weight: bold;">
		<td bgcolor="888888">ID</td>
		<td bgcolor="888888">Ekipman Kategori</td>
		<td bgcolor="888888">Ekipman Marka</td>
		<td bgcolor="888888">Ekipman Adi</td>
		<td bgcolor="888888">Ekipman Beden</td>
		<td bgcolor="888888">Ekipman Agirlik</td>
		<td bgcolor="888888">Ekipman Uzunluk</td>
		<td bgcolor="888888">Silme islemi</td>
		<td bgcolor="888888">Guncelleme islemi</td>
	</tr>
	<%Do while Not rs.eof%>
	<tr height="20px">
		<td><%=rs("ID")%></td>
		<td><%=rs("EkipmanKategori")%></td>
		<td><%=rs("EkipmanMarka")%></td>
		<td><%=rs("EkipmanAdi")%></td>
		<td><%=rs("EkipmanBeden")%></td>
		<td><%=rs("EkipmanAgirlik")%></td>
		<td><%=rs("EkipmanUzunluk")%></td>
		
		<td><a href="kategorilerSil.asp?ID=<%=rs("ID")%>">Sil</a></td>
		<td><a href="kategorilerGuncelle1.asp?ID=<%=rs("ID")%>">Guncelle</a></td>
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