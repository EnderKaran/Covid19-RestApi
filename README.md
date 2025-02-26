# 🦠 COVID-19 Veri Çekme Uygulaması (Delphi)

Bu basit Delphi uygulaması, bir REST API kullanarak COVID-19 verilerini çeker ve bir listede görüntüler.

## ✨ Özellikler

*   **API'den Veri Çekme:** Belirtilen bir REST API'den COVID-19 ile ilgili verileri (anahtar-değer çiftleri şeklinde) çeker.
*   **Veri Görüntüleme:** Çekilen verileri, bir `TControlList` bileşeni içinde, her bir öğe için bir başlık (key) ve değer (value) gösterecek şekilde görüntüler.
*   **Duruma Göre Simge:**
    *   Ülke "Thailand" ise özel bir simge gösterir.
    *   Anahtar kelime (key) "DEATHS" içeriyorsa farklı bir simge gösterir.
    *   Diğer durumlarda varsayılan bir simge kullanır.
* **Hata Yönetimi:** Basit Exception handling

## 🛠️ Teknoloji Yığını

*   **Dil:** Delphi (Pascal)
*   **Bileşenler:**
    *   `TControlList`: Verileri listelemek için.
    *   `TLabel`: Başlık ve değerleri göstermek için.
    *   `TVirtualImage`: Simge göstermek için.
    *   `TImageCollection`: Simge depolamak için.
    *   `TRESTClient`, `TRESTRequest`, `TRESTResponse`: REST API ile iletişim kurmak için.
* **JSON Kütüphanesi**: `System.JSON`



