<%response.charset = "windows-1254"
response.charset = "iso-8859-9"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
	<link rel="stylesheet" type="text/css" href="stil.css">
</head>

<%
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt.mdb")
%>
<body topmargin="100px">
<table width="300px" cellspacing="1px" align="center">
	<form name="frm1" method="post" action="emanetYeni.asp">
	<tr>
		<td>BaslangicTarihi</td>
		<td><input type="text" name="BaşlangıçTarihi" value="<%=date()%>"></td>
	</tr>
	<tr>
		<td>BitisTarihi</td>
		<td><input type="text" name="BitişTarihi" value="<%=date()%>"></td>
	</tr>
		<tr>
		<td>UyeId</td>
		<td>
			<%Set rs= conn.Execute("SELECT ID, (Ad & ' ' & Soyad & ' [' & EPosta & ']') AS UyeDetay FROM UYELER")%>
			<select name="UyeId">
			<%Do while Not rs.eof%>
				<option value='<%=rs("ID")%>'><%=rs("ID")%> / <%=rs("UyeDetay")%>
				<%rs.MoveNext
			Loop%>
			</select>
		</td>
	</tr>
	<tr>
		<td>HocaID</td>
		<td>
			<%Set rs= conn.Execute("SELECT ID, (HocaAd &' ' & HocaSoyad &' ' &EPosta) AS HocaDetay FROM HOCALAR")%>
			<select name="HocaID">
			<%Do while Not rs.eof%>
				<option value='<%=rs("ID")%>'><%=rs("ID")%> / <%=rs("HocaDetay")%>
				<%rs.MoveNext
			Loop%>
			</select>
		</td>
	</tr>

	<tr>
		<td>AdresID</td>
		<td>
			<%Set rs= conn.Execute("SELECT ID, (Mahalle &' .M ' & Cadde &' .C  ' &Sokak&' .S  ' ) AS AdresDetay FROM ADRESLER")%>
			<select name="AdresID">
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

<%Set rsEmanet = conn.Execute("SELECT EMANET.BaşlangıçTarihi, EMANET.BitişTarihi, EMANET.HocaID, HOCALAR.HocaAd, HOCALAR.HocaSoyad, EMANET.UyeID, (UYELER.Ad & ' ' & UYELER.Soyad) AS UyeDetay, EMANET.AdresID, (ADRESLER.Mahalle & ' .M ' & ADRESLER.Cadde & ' .C ' & ADRESLER.Sokak & ' .S ') AS AdresDetay FROM ((EMANET LEFT JOIN HOCALAR ON EMANET.HocaID = HOCALAR.ID) LEFT JOIN UYELER ON EMANET.UyeID = UYELER.ID) LEFT JOIN ADRESLER ON EMANET.AdresID = ADRESLER.ID")%>
<table width="1200px" cellspacing="1px" align="center">
    <tr height="25px" style="font-weight: bold;">
        <td bgcolor="888888">Başlangıç Tarihi</td>
        <td bgcolor="888888">Bitiş Tarihi</td>
        <td bgcolor="888888">Hoca ID</td>
        <td bgcolor="888888">Hoca Ad</td>
        <td bgcolor="888888">Hoca Soyad</td>
        <td bgcolor="888888">Üye ID</td>
        <td bgcolor="888888">Üye Detay</td>
        <td bgcolor="888888">Adres ID</td>
        <td bgcolor="888888">Adres Detay</td>
        <td bgcolor="888888">Silme İşlemi</td>
        <td bgcolor="888888">Güncelleme İşlemi</td>
    </tr>
    <% Do while Not rsEmanet.eof %>
    <tr height="20px">
        <td><%=rsEmanet("BaşlangıçTarihi")%></td>
        <td><%=rsEmanet("BitişTarihi")%></td>
        <td><%=rsEmanet("HocaID")%></td>
        <td><%=rsEmanet("HocaAd")%></td>
        <td><%=rsEmanet("HocaSoyad")%></td>
        <td><%=rsEmanet("UyeID")%></td>
        <td><%=rsEmanet("UyeDetay")%></td>
        <td><%=rsEmanet("AdresID")%></td>
        <td><%=rsEmanet("AdresDetay")%></td>
        <td><a href="emanetSil.asp?BaşlangıçTarihi=<%=rsEmanet("BaşlangıçTarihi")%>&BitişTarihi=<%=rsEmanet("BitişTarihi")%>&HocaID=<%=rsEmanet("HocaID")%>&UyeID=<%=rsEmanet("UyeID")%>&AdresID=<%=rsEmanet("AdresID")%>">Sil</a></td>
        <td><a href="emanetGuncelle1.asp?BaşlangıçTarihi=<%=rsEmanet("BaşlangıçTarihi")%>&BitişTarihi=<%=rsEmanet("BitişTarihi")%>&HocaID=<%=rsEmanet("HocaID")%>&UyeID=<%=rsEmanet("UyeID")%>&AdresID=<%=rsEmanet("AdresID")%>">Güncelle</a></td>
    </tr>
    <% rsEmanet.MoveNext %>
    <% Loop %>
</table>

	
<%rs.close
Set rs=nothing
conn.close
set conn=nothing%>
</body>
</html>