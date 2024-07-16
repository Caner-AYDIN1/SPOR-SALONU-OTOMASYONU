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
TakviyeMarka=request.Form("TakviyeMarka")
TakviyeAdi=request.Form("TakviyeAdi")
TakviyeAroma=request.Form("TakviyeAroma")
TakviyeGram=request.Form("TakviyeGram")
TakviyeAdet=request.Form("TakviyeAdet")
TakviyeUcret=request.Form("TakviyeUcret")%>

<%Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt.mdb")%>
<%Set rs= conn.Execute("UPDATE TAKVIYE SET TakviyeMarka='" & TakviyeMarka & "',TakviyeAdi='" & TakviyeAdi & "',TakviyeAroma='" & TakviyeAroma & "',TakviyeGram='" & TakviyeGram & "',TakviyeAdet='" & TakviyeAdet & "',TakviyeUcret='" & TakviyeUcret & "' WHERE ID=" & ID)%>

<script>
	alert("Kayit Guncellenmistir...");
	window.location="takviye.asp";
</script>
</body>
</html>