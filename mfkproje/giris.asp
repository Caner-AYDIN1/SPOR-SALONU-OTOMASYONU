<%
Dim conn, rs, EPosta, Sifre
' Form verilerini al
EPosta = Trim(Request.Form("EPosta"))
Sifre = Trim(Request.Form("Sifre"))
' Alanların boş olup olmadığını kontrol et
' Veritabanına bağlan
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("tt.mdb")
' SQL sorgusunu hazırla
sql = "SELECT * FROM UYELER WHERE EPosta='" & EPosta & "' AND Sifre='" & Sifre & "'"
' Sorguyu çalıştır ve sonuçları al
Set rs = conn.Execute(sql)
' Eğer sonuçlar varsa ve kullanıcı doğru bilgileri girdiyse
If Not rs.EOF Then
    ' Giriş başarılı, yeni bir sayfaya yönlendir
    Response.Redirect "gym website/index.html"
Else
    ' Kullanıcı bilgileri yanlış, hata mesajı göster
    Response.Write "Hatali Kullanici Adi Veya Sifre."
End If
' Veritabanı bağlantısını kapat
conn.Close
%>
