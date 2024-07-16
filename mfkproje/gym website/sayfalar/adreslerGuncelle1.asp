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
<%Set rs= conn.Execute("SELECT * FROM ADRESLER WHERE ID=" & ID )%>

<form name="frm1" method="post" action="adreslerGuncelle2.asp">
<table cellspacing="3px" align="center">
	<tr>
		<td width="100px">ID</td>
		<td><input name="ID" type="text" value="<%=rs("ID")%>" Readonly></td>
	</tr>
	<tr>
		<td>Cadde</td>
		<td><input name="Cadde" value="<%=rs("Cadde")%>" type="text"></td>
	</tr>
	<tr>
		<td>Sokak</td>
		<td><input name="Sokak" value="<%=rs("Sokak")%>" type="text"></td>
	</tr>
	<tr>
		<td>Mahalle</td>
		<td><input name="Mahalle" value="<%=rs("Mahalle")%>" type="text"></td>
	</tr>
	<tr>
		<td>BinaNo</td>
		<td><input name="BinaNo" value="<%=rs("BinaNo")%>" type="text"></td>
	</tr>
	<tr>
		<td>DaireNo</td>
		<td><input name="DaireNo" value="<%=rs("DaireNo")%>" type="text"></td>
	</tr>
	<tr>
		<td>Il</td>
		<td>
			<select name="Il">
				<script>
					const iller = ["ADANA", "ADIYAMAN", "AFYONKARAH�SAR", "A�RI", "AKSARAY", "AMASYA", "ANKARA", "ANTALYA", "ARDAHAN", "ARTV�N", "AYDIN", "BALIKES�R", "BARTIN", "BATMAN", "BAYBURT", "B�LEC�K", "B�NG�L", "B�TL�S", "BOLU", "BURDUR", "BURSA", "�ANAKKALE", "�ANKIRI", "�ORUM", "DEN�ZL�", "D�YARBAKIR", "D�ZCE", "ED�RNE", "ELAZI�", "ERZ�NCAN", "ERZURUM", "ESK��EH�R", "GAZ�ANTEP", "G�RESUN", "G�M��HANE", "HAKK�R�", "HATAY", "I�DIR", "ISPARTA", "�STANBUL", "�ZM�R", "KAHRAMANMARA�", "KARAB�K", "KARAMAN", "KARS", "KASTAMONU", "KAYSER�", "KIRIKKALE", "KIRKLAREL�", "KIR�EH�R", "K�L�S", "KOCAEL�", "KONYA", "K�TAHYA", "MALATYA", "MAN�SA", "MARD�N", "MERS�N", "MU�LA", "MU�", "NEV�EH�R", "N��DE", "ORDU", "OSMAN�YE", "R�ZE", "SAKARYA", "SAMSUN", "S��RT", "S�NOP", "S�VAS", "�ANLIURFA", "�IRNAK", "TEK�RDA�", "TOKAT", "TRABZON", "TUNCEL�", "U�AK", "VAN", "YALOVA", "YOZGAT", "ZONGULDAK"];
					var il ='<%= rs("Il")%>';
					for (i1=1;i1<=iller.length;i1++)
						if (iller[i1]!=il)
							document.write("<option value='"+iller[i1]+"'>"+iller[i1]);
						else
							document.write("<option value='"+iller[i1]+"' selected>"+iller[i1]);
				</script>
			</select>	
		</td>
	</tr>
	
	<tr>
		<td>Ilce</td>
		<td><input name="Ilce" value="<%=rs("Ilce")%>" type="text"></td>
	</tr>
	<tr>
		<td>Posta Kodu</td>
		<td><input name="PostaKodu" value="<%=rs("PostaKodu")%>" type="text"></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="Submit" value="Guncelle"><input type="Reset" value="Temizle"></td>
	</tr>
</table>
</form>
</body>
</html>