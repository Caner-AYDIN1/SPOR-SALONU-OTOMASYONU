<%response.charset = "windows-1254"
response.charset = "iso-8859-9"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
	<link rel="stylesheet" type="text/css" href="../stil.css">
</head>
	
<body topmargin="100px">
<%ID=request.Form("ID")
EkipmanKategori=request.Form("EkipmanKategori")
EkipmanMarka=request.Form("EkipmanMarka")
EkipmanAdi=request.Form("EkipmanAdi")
EkipmanBeden=request.Form("EkipmanBeden")
EkipmanAgirlik=request.Form("EkipmanAgirlik")
EkipmanUzunluk=request.Form("EkipmanUzunluk")

%>

<%Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt.mdb")%>
<%Set rs= conn.Execute("UPDATE EKIPMAN SET EkipmanKategori='" & EkipmanKategori & "',EkipmanMarka='" & EkipmanMarka & "',EkipmanAdi='" & EkipmanAdi & "',EkipmanBeden='" & EkipmanBeden & "',EkipmanAgirlik='" & EkipmanAgirlik & "',EkipmanUzunluk='" & EkipmanUzunluk & "' WHERE ID=" & ID)%>

<script>
	alert("Kayıt Guncellenmistir...");
	window.location="kategoriler.asp";
</script>
</body>
</html>