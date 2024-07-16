<%response.charset = "windows-1254"
response.charset = "iso-8859-9"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
	<link rel="stylesheet" type="text/css" href="../stil.css">
</head>

<body topmargin="100px">
<%EmanetTarihi=request.queryString("EmanetTarihi")
TeslimTarihi=request.queryString("TeslimTarihi")
KitapId=request.queryString("KitapId")
UyeID=request.queryString("UyeID")
KutuphaneID=request.queryString("KutuphaneID")%>

<%Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt.mdb")%>

<form name="frm1" method="post" action="emanetGuncelle2.asp">
<table cellspacing="1px" align="center">
	<tr>
		<td width="100px">EmanetTarihi</td>
		<td><input name="EmanetTarihi" type="text" value="<%=EmanetTarihi%>" Readonly style="background-color:#bbbbbb"></td>
	</tr>
	<tr>
		<td>TeslimTarihi</td>
		<td><input name="TeslimTarihi" value="<%=TeslimTarihi%>" type="text"></td>
	</tr>
	<tr>
		<td>KitapID</td>
		<td>
		<%Set rs= conn.Execute("SELECT ID, (ISBN &' ' & KitapAd) AS KitapDetay FROM KITAPLAR ORDER BY ID")%>	
		<select name="KitapID" style="background-color:#bbbbbb">
			<%Do while Not rs.eof%>
			<%if rs("ID")=CInt(KitapID) then%>
				<option value="<%=rs("ID")%>"><%=rs("ID")%> / <%=rs("KitapDetay")%>
			<%end if%>
			<%rs.MoveNext
		Loop%>
		</select>
		</td>
	</tr>
	<tr>
		<td>UyeID</td>
		<td>
		<%Set rs= conn.Execute("SELECT ID, (Ad & ' ' & Soyad & ' [' & EPosta & ']') AS UyeDetay FROM UYELER ORDER BY ID")%>
		<select name="UyeID" style="background-color:#bbbbbb">
			<%Do while Not rs.eof%>
			<%if rs("ID")=CInt(UyeID) then%>
				<option value="<%=rs("ID")%>"><%=rs("ID")%> / <%=rs("UyeDetay")%>
			<%end if%>
			<%rs.MoveNext
		Loop%>
		</select>
		</td>
	</tr>
	<tr>
		<td>KutuphaneID</td>
		<td>
		<%Set rs= conn.Execute("SELECT ID, (KutuphaneAd) AS KutuphaneDetay FROM KUTUPHANE ORDER BY ID")%>
		<select name="KutuphaneID" style="background-color:#bbbbbb">
			<%Do while Not rs.eof%>
			<%if rs("ID")=CInt(KutuphaneID) then%>
				<option value="<%=rs("ID")%>"><%=rs("ID")%> / <%=rs("KutuphaneDetay")%>
			<%end if%>
			<%rs.MoveNext
		Loop%>
		</select>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="Submit" value="Güncelle"><input type="Reset" value="Temizle"></td>
	</tr>
</table>
</form>
<%rs.close
Set rs=nothing
conn.close
set conn=nothing%>
</body>
</html>