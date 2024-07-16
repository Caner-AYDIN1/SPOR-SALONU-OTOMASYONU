function kayitOl() {
    var Ad = document.getElementById('Ad').value;
    var EPosta = document.getElementById('EPosta').value;
    var Sifre = document.getElementById('Sifre').value;

    // Alanların boş olup olmadığını kontrol et
    if (Ad === "" || EPosta === "" || Sifre === "") {
        alert("Lütfen tüm alanları doldurun.");
        return; // Boş alanlar varsa işlemi sonlandır
    }

    // Alanlar doluysa isteği gönder
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "kaydet.asp", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
            window.location.href = "index.html"; // HTML sayfasına yönlendir
        }
    };
      xhr.send("Ad=" + encodeURIComponent(Ad) + "&EPosta=" + encodeURIComponent(EPosta) + "&Sifre=" + encodeURIComponent(Sifre));
}

function kayit() {
    var EPosta = document.getElementById('EPosta').value;
    var Sifre = document.getElementById('Sifre').value;

    // Alanların boş olup olmadığını kontrol et
    if (EPosta === "" || Sifre === "") {
        alert("Lütfen tüm alanları doldurun.");
        return; // Boş alanlar varsa işlemi sonlandır
    }

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "giris.asp", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
            if(xhr.responseText === "Giriş başarılı!") {
                window.location.href = "anasayfa.html"; // Giriş başarılıysa anasayfaya yönlendir
            } else {
                alert("Kullanıcı adı veya şifre yanlış!"); 
            }
        }
    };
    xhr.send("EPosta=" + encodeURIComponent(EPosta) + "&Sifre=" + encodeURIComponent(Sifre));
}
