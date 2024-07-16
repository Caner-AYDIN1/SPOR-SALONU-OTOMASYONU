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
	<form name="frm1" method="post" action="adreslerYeni.asp">
	<tr>
		<td width="120px">ID</td>
		<td><input type="text" value="Otomatik atanacakt�r..." ReadOnly></td>
	</tr>
	<tr>
		<td>Cadde</td>
		<td><input type="text" name="Cadde"></td>
	</tr>
	<tr>
		<td>Sokak</td>
		<td><input type="text" name="Sokak"></td>
	</tr>
	<tr>
		<td>Mahalle</td>
		<td><input type="text" name="Mahalle"></td>
	</tr>
	<tr>
		<td>Bina No</td>
		<td><input type="text" name="BinaNo"></td>
	</tr>
	<tr>
		<td>Daire No</td>
		<td><input type="text" name="DaireNo"></td>
	</tr>
	<tr>
		<td>Il</td>
		<td>
			<select name="Il">
				<script>
					const iller = ["ADANA", "ADIYAMAN", "AFYONKARAH�SAR", "A�RI", "AKSARAY", "AMASYA", "ANKARA", "ANTALYA", "ARDAHAN", "ARTV�N", "AYDIN", "BALIKES�R", "BARTIN", "BATMAN", "BAYBURT", "B�LEC�K", "B�NG�L", "B�TL�S", "BOLU", "BURDUR", "BURSA", "�ANAKKALE", "�ANKIRI", "�ORUM", "DEN�ZL�", "D�YARBAKIR", "D�ZCE", "ED�RNE", "ELAZI�", "ERZ�NCAN", "ERZURUM", "ESK��EH�R", "GAZ�ANTEP", "G�RESUN", "G�M��HANE", "HAKK�R�", "HATAY", "I�DIR", "ISPARTA", "�STANBUL", "�ZM�R", "KAHRAMANMARA�", "KARAB�K", "KARAMAN", "KARS", "KASTAMONU", "KAYSER�", "KIRIKKALE", "KIRKLAREL�", "KIR�EH�R", "K�L�S", "KOCAEL�", "KONYA", "K�TAHYA", "MALATYA", "MAN�SA", "MARD�N", "MERS�N", "MU�LA", "MU�", "NEV�EH�R", "N��DE", "ORDU", "OSMAN�YE", "R�ZE", "SAKARYA", "SAMSUN", "S��RT", "S�NOP", "S�VAS", "�ANLIURFA", "�IRNAK", "TEK�RDA�", "TOKAT", "TRABZON", "TUNCEL�", "U�AK", "VAN", "YALOVA", "YOZGAT", "ZONGULDAK"];
					for (i1=1;i1<=iller.length;i1++)
						document.write("<option value='"+iller[i1]+"'>"+iller[i1]);
				</script>
			</select>
		</td>
	</tr>
	<tr>
		<td>Ilce</td>
		<td><input type="text" name="Ilce"></td>
	</tr>
	<!--<tr>
		<td>Il</td>
		<td><input type="text" name="Il"></td>
	</tr>-->
	<tr>
		<td>Posta Kodu</td>
		<td><input type="text" name="PostaKodu"></td>
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
<%Set rs= conn.Execute("SELECT * FROM ADRESLER")%>
<table width="800px" cellspacing="3px" align="center">
	<tr height="25px" style="font-weight: bold;">
		<td bgcolor="888888">ID</td>
		<td bgcolor="888888">Cadde</td>
		<td bgcolor="888888">Sokak</td>
		<td bgcolor="888888">Mahalle</td>
		<td bgcolor="888888">Bina No</td>
		<td bgcolor="888888">Daire No</td>
		<td bgcolor="888888">Il</td>
		<td bgcolor="888888">Ilce</td>
		<td bgcolor="888888">Posta Kodu</td>
		<td bgcolor="888888">Silme islemi</td>
		<td bgcolor="888888">Guncelleme islemi</td>
	</tr>
	<%Do while Not rs.eof%>
	<tr height="20px">
		<td><%=rs("ID")%></td>
		<td><%=rs("Cadde")%></td>
		<td><%=rs("Sokak")%></td>
		<td><%=rs("Mahalle")%></td>
		<td><%=rs("BinaNo")%></td>
		<td><%=rs("DaireNo")%></td>
		<td><%=rs("Il")%></td>
		<td><%=rs("Ilce")%></td>
		<td><%=rs("PostaKodu")%></td>
		<td><a href="adreslerSil.asp?ID=<%=rs("ID")%>">Sil</a></td>
		<td><a href="adreslerGuncelle1.asp?ID=<%=rs("ID")%>">Guncelle</a></td>
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