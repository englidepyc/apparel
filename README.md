# apparel

## Right now

### Progressi:
* ✅creato semplice db monotabella con drift
### Up Next:
* ✅ aggiungere le immagini test e l' icona dell'app
* ✅ Usare i provider per accedere al db anziché passarlo nel widget tree (later) (ottimizza anche i tempi di avvio)
* ✅ Capire i permessi in Flutter
* Usare i permessi per scattare foto per i vestiti (e visualizzarle nella schermata)
* Salvare il percorso delle img nel db
* Ottimizzare e upgradare il db:
    * Capire e definire strategie di migrazione e upgrade
    
* Caricare la struttura multitabella per i vestiti
* Comcinciare a pensare agli outfit

### Cose da rivedere/ usate non capite/ da migliorare
* gestione dei vari errori/casistiche nello snapshot dello StreamBuilder
* capire come creare/utilizzare il local.properties oppure settare flutter gradle plugin senza ricorrere direttamente a 
  ```build.gradle.kts
  android {
        ndkVersion = "27.0.12077973"
        ...
  }
  ```

### Scelte
Apro la connessione db con l'async prima di lanciare l'app, tanto la devo aprire sempre (sono 3s)  
