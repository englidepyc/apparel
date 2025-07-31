# apparel

## Right now

### Progressi:
* ✅ creato semplice db monotabella con drift
### Up Next:
* aggiungere le immagini test e l' icona dell'app
* Capire i permessi in Flutter
* Usare i permessi per scattare foto per i vestiti
* Ottimizzare e upgradare il db:
    * Capire e definire strategie di migrazione e upgrade
* Caricare la struttura multitabella per i vestiti
* Usare i provider per accedere al db anziché passarlo nel widget tree (later)
* Comcinciare a pensare agli outfit

### Cose da rivedere/ usate non capite/ da migliorare
* gestione dei vari errori/casistiche nello snapshot dello StreamBuilder
* controllare i pacchetti con flutter pub outdated, flutter pub upgrade e eventualmente modificare
  pubspec.yaml o aggiornare tutto flutter. Ci sarebbero sti problemi con l'android NDK build.gradle.kts dovrebbe essere 
  ```
  android {
        ndkVersion = "27.0.12077973"
        ...
  }
  ```  
  Provare a sistemare upgradando flutter, modificando file e settings del progetto, infine agendo nativamente
