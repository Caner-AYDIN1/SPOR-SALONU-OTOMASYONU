<%
Dim conn, rs, Ad, EPosta, Sifre
' Form verilerini al
Ad = Trim(Request.Form("Ad"))
EPosta = Trim(Request.Form("EPosta"))
Sifre = Trim(Request.Form("Sifre"))
' Alanların boş olup olmadığını kontrol et
If Ad = "" Or EPosta = "" Or Sifre = "" Then
    Response.Write "Lütfen tüm alanları doldurun."
    Response.End ' İşlemi sonlandır
End If
' Veritabanına bağlan
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("tt.mdb")
' SQL sorgusunu hazırla ve verileri kaydet
sql = "INSERT INTO UYELER (Ad, EPosta, Sifre) VALUES ('" & Ad & "', '" & EPosta & "', '" & Sifre & "')"
Set rs =conn.Execute(sql)
Response.Write "Kayit basariyla yapildi."
' Veritabanı bağlantısını kapat
conn.Close
%>
