from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/kaydet', methods=['POST'])
def kaydet():
    Ad = request.form.get('Ad')
    EPosta = request.form.get('EPosta')
    Sifre = request.form.get('Sifre')

    # Alanların boş olup olmadığını kontrol et
    if not Ad or not EPosta or not Sifre:
        return "Lütfen tüm alanları doldurun.", 400

    # Veritabanına kaydetme işlemi burada gerçekleştirilecek
    # Örneğin, SQLite kullanarak
    import sqlite3
    conn = sqlite3.connect('veritabani.db')
    cursor = conn.cursor()
    cursor.execute("INSERT INTO UYELER (Ad, EPosta, Sifre) VALUES (?, ?, ?)", (Ad, EPosta, Sifre))
    conn.commit()
    conn.close()

    return "Kayıt başarılı!", 200

if __name__ == '__main__':
    app.run(debug=True)
