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
<%Set rs= conn.Execute("SELECT * FROM EKIPMAN WHERE ID=" & ID )%>

<form name="frm1" method="post" action="kategorilerGuncelle2.asp" >
<table cellspacing="3px" align="center" >
	<tr >
		<td width="150px">ID</td>
		<td><input name="ID" type="text" value="<%=rs("ID")%>" Readonly></td>
	</tr>
	<tr>
		<td>Ekipman Kategori</td>
		<td>
			<select name="EkipmanKategori">
				<script>
					const Ekipman = ["Seciniz", "Fitness ve Kondisyon", "Sporcu Aksesuarlari", "Brans Sporlari", "Vucut Gelistirme Aletleri", "Dambillar ve Agirlik Plakalari", "Makineler"];
					var il ='<%= rs("EkipmanKategori")%>';
					for (i1=1;i1<=Ekipman.length;i1++)
						if (Ekipman[i1]!=il)
							document.write("<option value='"+Ekipman[i1]+"'>"+Ekipman[i1]);
						else
							document.write("<option value='"+Ekipman[i1]+"' selected>"+Ekipman[i1]);
				</script>
			</select>	
		</td>
	</tr>
	<tr>
		<td>Ekipman Marka</td>
		<td>
			<select name="EkipmanMarka">
				<script>
					const Ekipma = ["Seciniz", "Decathlon", "Avessa", "Delta", "LIVEPRO", "Dambilcim", "Esi Fitness", "Dynamic", "Aydin Sport"];
					var il ='<%= rs("EkipmanMarka")%>';
					for (i1=1;i1<=Ekipma.length;i1++)
						if (Ekipma[i1]!=il)
							document.write("<option value='"+Ekipma[i1]+"'>"+Ekipma[i1]);
						else
							document.write("<option value='"+Ekipma[i1]+"' selected>"+Ekipma[i1]);
				</script>
			</select>	
		</td>
	</tr>
	<tr>
		<td>Ekipman Adi</td>
		<td>
			<select name="EkipmanAdi">
				<script>
					const Ekipm = ["Seciniz", "Dambillar", "Agirlik Plakalari", "Barfix Aleti cubugu", "Halter Bari", "Fitness Eldiveni", "Agirlik Kemeri", "Atlama ipi", "Cable Crossover", "Biceps Curl", "Squat Machine"];
					var il ='<%= rs("EkipmanAdi")%>';
					for (i1=1;i1<=Ekipm.length;i1++)
						if (Ekipm[i1]!=il)
							document.write("<option value='"+Ekipm[i1]+"'>"+Ekipm[i1]);
						else
							document.write("<option value='"+Ekipm[i1]+"' selected>"+Ekipm[i1]);
				</script>
			</select>	
		</td>
	</tr>
	<tr>
		<td>Ekipman Beden</td>
		<td>
			<select name="EkipmanBeden">
				<script>
					const Ek = ["Seciniz", "Beden Yok", "S", "M", "L", "XL", "2XL", "XS"];
					var il ='<%= rs("EkipmanBeden")%>';
					for (i1=1;i1<=Ek.length;i1++)
						if (Ek[i1]!=il)
							document.write("<option value='"+Ek[i1]+"'>"+Ek[i1]);
						else
							document.write("<option value='"+Ek[i1]+"' selected>"+Ek[i1]);
				</script>
			</select>	
		</td>
	</tr>
	<tr>
		<td>Ekipman Agirlik(KG)</td>
		<td>
			<select name="EkipmanAgirlik">
				<script>
					const Ekip = ["Seciniz", "Agirlik Yok", "1", "2", "5", "10", "20", "8", "6"];
					var il ='<%= rs("EkipmanAgirlik")%>';
					for (i1=1;i1<=Ekip.length;i1++)
						if (Ekip[i1]!=il)
							document.write("<option value='"+Ekip[i1]+"'>"+Ekip[i1]);
						else
							document.write("<option value='"+Ekip[i1]+"' selected>"+Ekip[i1]);
				</script>
			</select>	
		</td>
	</tr>
	<tr>
		<td>Ekipman Uzunluk(CM)</td>
		<td>
			<select name="EkipmanUzunluk">
				<script>
					const Eki = ["Seciniz" ,"uzunluk Yok", "100", "50", "80", "150", "200"];
					var il ='<%= rs("EkipmanUzunluk")%>';
					for (i1=1;i1<=Eki.length;i1++)
						if (Eki[i1]!=il)
							document.write("<option value='"+Eki[i1]+"'>"+Eki[i1]);
						else
							document.write("<option value='"+Eki[i1]+"' selected>"+Eki[i1]);
				</script>
			</select>	
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="Submit" value="Guncelle"><input type="Reset" value="Temizle"></td>
	</tr>
</table>
</form>
</body>
</html>