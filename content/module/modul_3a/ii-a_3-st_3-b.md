**DDP-Bildung**

**Standards II-a\_3-ST\_3-b:**

***Dateiformate für die Übermittlung der Forschungsdaten-Dateien***

Versionierungshistorie
======================

  Version   Typ        Datum                                       erstellende Person   
  --------- ---------- ------------------------------------------- -------------------- --------------------
  1\.       20201204   Ursprungsdokument                           04.12.2020           jks/sen
                       Review                                      14.12.2020           sen / aks / mk /tr
            20201215   Überarbeitung nach Review                   15.12.2020           jks
                       ergänzt                                     15.12.2020           mk
            20201218   Einführung umgeschrieben                    18.12.2020           sen
                       Durchsicht (keine Änderungen/Ergänzungen)   18.01.2021           ag
            20210126   Überarbeitung nach Review                   26.01.2021           jks
            20210210   Workshop-Review                             10.02.2021           Db, hk, jn

Standards zu den Dateiformaten für die Übermittlung der Forschungsdaten-Dateien
===============================================================================

Grundsätzlich sollten Daten für die die Archivierung in offenen, in der
Forschungsgemeinschaft weit verbreiteten Dateiformate übergeben werden.
Offene Dateiformate erhöhen die Zugänglichkeit der Forschungsdaten und
erlauben es, sie ohne Zahlung von Gebühren und sonstigen Restriktionen
(z. B. patent- oder urheberrechtlicher Art) zu verwenden.

Offene Dateiformate können zum einen nicht-proprietär sein, wie etwa
textbasierte (Komma-, Tabulator- oder Spaltengetrennten) Formate, die
gemeinsam mit einer Setup-Datei zum Einlesen der Daten in verschiedene
Softwarepakete übergeben werden sollten.

Offene Dateiformate können aber auch für proprietäre Formate gegeben
sein, wenn diese Formate in einer nicht-proprietären Software
verarbeitet werden können. So lassen sich beispielsweise das SPSS-
Format *sav* oder das STATA-Format *dta* in der nicht-proprietären
Software *R* verarbeiten.

Zur Beurteilung u. a. der Offenheit verschiedener Dateiformate siehe:
[[https://kost-ceco.ch/cms/bewertung.html]{.underline}](https://kost-ceco.ch/cms/bewertung.html).

Schließlich sollten Forschende die Vorgaben einschlägiger Repositorien
hinsichtlich präferierter bzw. akzeptierter Dateiformate beachten und
diese von Beginn an in der Aufbereitung und Dokumentation ihrer Daten
berücksichtigen.

Für die Archivierung von Forschungsdaten werden z. B. vom VerbundFDB
(Gemeinschaftsprojekt der GESIS, des DIPF und des IQB) folgende
Dateiformate empfohlen:

+----------------------+----------------------+----------------------+
| **Datentyp **        | **Bevorzugte         | **Akzeptierte        |
|                      | Formate **           | Formate **           |
+======================+======================+======================+
| Datensätze           | -   R (\*.Rdata,     | -   OpenDocument     |
|                      |     .Rda, .Rds)      |     Tabellendokument |
|                      |                      |     (\*.ods)         |
|                      | -   Extensible       |                      |
|                      |     Markup Language  | -   *MS Excel        |
|                      |     (\*xml)          |     (\*.xlsx,        |
|                      |                      |     \*.xls)*         |
|                      | ```{=html}           |                      |
|                      | <!-- -->             | -   csv-Formate ohne |
|                      | ```                  |     zusätzliche      |
|                      | -   Tabulator-,      |     Dat              |
|                      |     Komma- oder      | endefinitionsdateien |
|                      |                      |     (Setup, Syntax,  |
|                      |    Spalten-getrennte |     Command file)    |
|                      |     Textdatei        |                      |
|                      |     ("csv") mit      | -   *MS Access       |
|                      |     zusätzlicher     |     (\*.mdb,         |
|                      |     Setup-Datei      |     \*.accdb)*       |
|                      |     (setup, command  |                      |
|                      |     oder syntax file | -   *Column          |
|                      |     für SPSS, Stata, |     Binary-Format*   |
|                      |     SAS usw.) mit    |                      |
|                      |     entsprechenden   | -   *Card-Image      |
|                      |                      |     Format*          |
|                      |    Datendefinitionen |                      |
|                      |                      | -                    |
|                      |   (Variablennamen u. |                      |
|                      |     -label, fehlende |                      |
|                      |     Werte etc.).     |                      |
|                      |                      |                      |
|                      | -   *SPSS Portable   |                      |
|                      |     (\*.por)*        |                      |
|                      |                      |                      |
|                      | -   *SPSS (\*.sav)*  |                      |
|                      |                      |                      |
|                      | -   *STATA (\*.dta)* |                      |
|                      |                      |                      |
|                      | -   *SAS Transport   |                      |
|                      |     (\*.sas)*        |                      |
+----------------------+----------------------+----------------------+
| Textdateien          | -   PDF/A (\*.pdf)   | -   OpenDocument     |
|                      |                      |     Textdokument     |
|                      | -   Plain            |     (\*.odt)         |
|                      |     Text-Formate     |                      |
|                      |     (ASCII)          | -   PDF (\*.pdf)     |
|                      |                      |                      |
|                      |                      | -   *MS Word         |
|                      |                      |     (\*.docx,        |
|                      |                      |     \*.doc)*         |
|                      |                      |                      |
|                      |                      | -   HTML (\*.htm,    |
|                      |                      |     \*.html)         |
|                      |                      |                      |
|                      |                      | -   RichTextFormat   |
|                      |                      |     (\*.rtf)         |
+----------------------+----------------------+----------------------+
|                      |                      | -   Extensible       |
|                      |                      |     Markup Language  |
|                      |                      |     (\*xml)          |
+----------------------+----------------------+----------------------+
| Bilder               | -   *TIFF Version 6  | -   *JPEG (\*.jpg,   |
|                      |     unkomprimiert    |     \*jpeg)*         |
|                      |     (\*.tif)*        |                      |
|                      |                      | -   PNG (\*.png)     |
|                      |                      |                      |
|                      |                      | -   PDF/A, PDF       |
|                      |                      |     (\*.pdf)         |
+----------------------+----------------------+----------------------+
|                      |                      | -   *GIF (\*.gif)*   |
|                      |                      |                      |
|                      |                      | -   *BMP (\*.bmp)*   |
+----------------------+----------------------+----------------------+
| Audio                | -   MPEG-1 Audio     | -   *Wave Audio      |
|                      |     Layer 3 (\*.mp3) |     Format WAV       |
|                      |                      |     (\*.wav)*        |
+----------------------+----------------------+----------------------+
| Video                | -   MPEG-2 (\*.mpg)  | -   *Audio Video     |
|                      |                      |     Interleave AVI   |
|                      |                      |     (\*.avi)*        |
|                      |                      |                      |
|                      |                      | -   *Windows Media   |
|                      |                      |     Video WMV        |
|                      |                      |     (\*.wmv)*        |
+----------------------+----------------------+----------------------+
|                      | -   *MPEG-4          |                      |
|                      |     (\*.mp4)*        |                      |
+----------------------+----------------------+----------------------+
| Basierend auf        | Stand letzte         |                      |
| https://www.f        | Aktualisierung:      |                      |
| orschungsdaten-bildu | 07.07.2017           |                      |
| ng.de/formate?la=de  |                      |                      |
+----------------------+----------------------+----------------------+
