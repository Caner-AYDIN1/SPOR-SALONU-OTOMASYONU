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
<%Set rs= conn.Execute("SELECT * FROM TAKVIYE WHERE ID=" & ID )%>

<form name="frm1" method="post" action="takviyeGuncelle2.asp">
<table cellspacing="3px" align="center" >
	<tr>
		<td width="100px">ID</td>
		<td><input name="ID" type="text" value="<%=rs("ID")%>" Readonly></td>
	</tr>
	<tr>
		<td>Takviye Marka</td>
		<td>
			<select name="TakviyeMarka">
				<script>
					const takviye = ["Seciniz", "Hard Line", "Big Joy", "Olimp", "Weider", "POWERTECH", "Multipower", "Supplementler"];
					var il ='<%= rs("TakviyeMarka")%>';
					for (i1=1;i1<=takviye.length;i1++)
						if (takviye[i1]!=il)
							document.write("<option value='"+takviye[i1]+"'>"+takviye[i1]);
						else
							document.write("<option value='"+takviye[i1]+"' selected>"+takviye[i1]);
				</script>
			</select>	
		</td>
	</tr>
	<tr>
		<td>Takviye Adi</td>
		<td>
			<select name="TakviyeAdi">
				<script>
					const takviy = ["Seciniz", "Protein Bar", "Creatine", "Whey Protein Biskuvi", "Protein Tozu", "Vegan Protein Bar", "Whey Protein Tozu", "Gainer"];
					var il ='<%= rs("TakviyeAdi")%>';
					for (i1=1;i1<=takviye.length;i1++)
						if (takviy[i1]!=il)
							document.write("<option value='"+takviy[i1]+"'>"+takviy[i1]);
						else
							document.write("<option value='"+takviy[i1]+"' selected>"+takviy[i1]);
				</script>
			</select>	
		</td>
	</tr>
	
	<tr>
		<td>TakviyeAroma</td>
		<td>
			<select name="TakviyeAroma">
				<script>
					const takvi = ["Seciniz", "Biskuvi", "Cikolatali", "Cilekli", "Muz", "Aromasiz", "Limonlu", "Portakal", "Orman Meyveleri", "Yaban Mersini"];
					var il ='<%= rs("TakviyeAroma")%>';
					for (i1=1;i1<=takvi.length;i1++)
						if (takvi[i1]!=il)
							document.write("<option value='"+takvi[i1]+"'>"+takvi[i1]);
						else
							document.write("<option value='"+takvi[i1]+"' selected>"+takvi[i1]);
				</script>
			</select>	
		</td>
	</tr>
	<tr>
		<td>Takviye Gram</td>
		<td><input name="TakviyeGram" value="<%=rs("TakviyeGram")%>" type="text"></td>
	</tr>
	<tr>
		<td>Takviye Adet</td>
		<td><input name="TakviyeAdet" value="<%=rs("TakviyeAdet")%>" type="text"></td>
	</tr>
	<tr>
		<td>Takviye Ucret</td>
		<td><input name="TakviyeUcret" value="<%=rs("TakviyeUcret")%>" type="text"></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="Submit" value="Guncelle"><input type="Reset" value="Temizle"></td>
	</tr>
</table>
</form>
</body>
</html>