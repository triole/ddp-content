**DDP-Bildung**

**Anwendungsfall III-a-3-c:**

***Versionierung von Daten und Begleitmaterialien***

Versionierungshistorie
======================

+---------+----------+---------------------------+--------------------+-----+
| Version | Typ      | Datum                     | erstellende Person |     |
+=========+==========+===========================+====================+=====+
| 1\.     | 20201218 | Ursprungsdokument         | 18.12.2020         | sen |
+---------+----------+---------------------------+--------------------+-----+
| 2       |          | Review                    | 05.01.2021         | mk  |
|         |          |                           |                    |     |
|         |          |                           | 15.01.2021         | tr  |
|         |          |                           |                    |     |
|         |          |                           | 27.01.2021         | hk  |
+---------+----------+---------------------------+--------------------+-----+
| 3       | 20210128 | Überarbeitung nach Review | 28.01.2021         | sen |
+---------+----------+---------------------------+--------------------+-----+
|         |          |                           |                    |     |
+---------+----------+---------------------------+--------------------+-----+
|         |          |                           |                    |     |
+---------+----------+---------------------------+--------------------+-----+
|         |          |                           |                    |     |
+---------+----------+---------------------------+--------------------+-----+

Ausgangsbeispiel
================

In einem Forschungsprojekt werden im Rahmen der allgemeinen
Projektorganisation Regeln zur Versionierung von Dateien festgelegt und
als Teil der Regeln zur Speicherung, Benennung und Versionierung im
Projekt verschriftlicht. Diese Regeln betreffen auch die im Projekt
generierten und genutzten Daten und ihre Begleitmaterialien.

Versionierung von Daten und Begleitmaterialien
==============================================

### *Wie wird versioniert?*

Die Version einer Datei wird über das Datum des Erstellens bzw.
Bearbeitens festgehalten. Dabei gilt:

1.  Die Datumsnennung erfolgt im Format *JJJJMMTT*, mit JJJJ =
    > vierstellige Jahreszahl, MM = zweistellige Monatszahl und TT =
    > zweistellige Tageszahl, also z. B. *20201231* für den 31.
    > Dezember 2020.

2.  Werden mehrere Dateien an einem Tag erstellt, so ist bei den
    > nachfolgenden Versionen an das Datum zusätzlich eine
    > aufwärtszählende Nummerierung, getrennt durch einen Bindestrich,
    > anzuhängen, beginnend bei „-2", also z. B. *20201231-2* für die
    > zweite, erstellte Version am 31.12.2020; die Version ohne
    > Datumszusatz gilt dann automatisch als erste Version des
    > jeweiligen Tages.

### *Wo wird versioniert?*

Die Versionierung der Datei erfolgt

1.  direkt im Dateinamen und bildet entsprechend den Projektregeln zur
    > Benennung von Dateien das Präfix des Dateinamens, getrennt durch
    > einen Unterstrich vom Stamm des Dateinamens, also z. B.
    > *20201231-2\_;*

2.  zusätzlich wird die Versionierung in Datensätzen (Datenmatrizen) als
    > Variable „version" im string-Format gespeichert bzw. in
    > Transkripten, Codebüchern und anderen Dokumenten in einer
    > Versionierungshistorie (siehe nachfolgende Vorlage zur
    > Versionierungshistorie) auf der ersten Seite des jeweiligen
    > Dokuments festgehalten.

### *Wann wird eine neue Version erstellt?*

Die Regeln zur Versionierung legen fest, dass für jede Bearbeitung einer
Datei, die an einem Tag vorgenommen wird, eine neue Version zu erstellen
ist. Werden also durch eine projektbeteiligte Person an einem Tag
mehrere Änderungen an einer Datei durchgeführt, wird erst eine neue
Version mit dem aktuellen Datum als Präfix erstellt *20201231-* und dann
bei jeder folgenden Änderung eine weitere neue Version *20201231-2,
20201231-3* usw. Diese Regel gilt, gleichgültig ob es sich dabei um
kleine Änderungen, wie etwa das Verbessern von Rechtschreibfehlern in z.
B. Variablenlabels, oder um große Änderungen handelt, die aus den
vorherigen Versionen der Datei nicht ohne weiteres wieder herzuleiten
sind, wie etwa das Zuspielen neuer Fälle in einem Datensatz.

### *Vorlage zur Versionierungshistorie für Dokumente*

  Version   Überarbeitung      Datum   erstellende Person
  --------- ------------------ ------- --------------------
            Ausgangsdokument           
                                       
                                       
                                       
                                       

mit:

-   *Version*: Versionierungsnummer des Dokuments nach den obigen
    Vorschriften,

-   Überarbeitung: kurze (stichpunktartige) Beschreibung der
    vorgenommenen Bearbeitungen im Vgl. zur vorherigen Version des
    Dokuments,

-   *Datum*: Datum der Bearbeitung,

-   *erstellende Person*: Akronym der bearbeitenden Person, die eine
    neue Version angelegt hat.
