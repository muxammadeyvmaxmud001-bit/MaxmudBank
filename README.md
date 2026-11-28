# MaxmudBank

O‘zbekcha maxsus demo banking PWA va Android APK loyihasi.

## Imkoniyatlar

- Demo karta va balans: **25,675,000 so‘m**
- QR, karta va telefon raqami bo‘yicha o‘tkazmalar
- Hisob to‘ldirish, to‘lovlar, transferlar
- Wallet: USD, EUR, RUB
- Ovozli AI yordamchi
- Hisobotlar, kredit va depozit demo
- Dark / Light theme
- PIN, FaceID va 2FA demo ekrani
- Demo karta dizaynlari
- Offline mobil interfeys

> **Muhim:** bu loyiha demo. Haqiqiy karta, real pul, bank yoki IMEI ma’lumotlari uzatilmaydi.

## APK yaratish

1. `Build MaxmudBank APK` workflowini oching.
2. **Actions** → **Build MaxmudBank APK** → **Run workflow** tugmasini bosing.
3. Build tugagach `MaxmudBank-APK` artifactini yuklab oling.
4. APKni telefoningizga o‘rnating.

## Demo ma’lumotlar

- Jami demo balans: **25,675,000 so‘m**
- Demo karta: **8600 1234 5678 4321**
- PIN: `1234`

## Xavfsizlik

Bu ilova real moliyaviy operatsiyalar bajarmaydi. Real kartaga ulash, real to‘lov yoki identifikatsiya ma’lumotlarini kiritmang.

## Ishga tushirish

Brauzerdan `index.html`ni oching:

```bash
python3 -m http.server 8080
