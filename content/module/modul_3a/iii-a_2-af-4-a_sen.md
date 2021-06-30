**DDP-Bildung**

**Anwendungsfall III-a-4-a:**

***Implementierung einer eigenen Back-Up-Strategie***

Versionierungshistorie
======================

+---------+----------+------------------------------+--------------------+-----+
| Version | Typ      | Datum                        | erstellende Person |     |
+=========+==========+==============================+====================+=====+
| 1\.     | 20210118 | Ursprungsdokument            | 18.01.2021         | sen |
+---------+----------+------------------------------+--------------------+-----+
| 2       |          | Review                       | 19.01.2021         | mk  |
|         |          |                              |                    |     |
|         |          |                              | 25.01.2021         | tr  |
+---------+----------+------------------------------+--------------------+-----+
| 3       | 20210128 | Überarbeitung nach Review    | 28.01.2021         | sen |
+---------+----------+------------------------------+--------------------+-----+
|         |          | Ergänzung                    | 28.01.2021         | mk  |
+---------+----------+------------------------------+--------------------+-----+
| 4       | 20210201 | Überarbeitung nach Ergänzung | 01.02.2021         | sen |
+---------+----------+------------------------------+--------------------+-----+
|         |          |                              |                    |     |
+---------+----------+------------------------------+--------------------+-----+

Ausgangsbeispiel
================

Zur Umsetzung eines gemeinsamen Promotionsprojekts erhalten zwei
Stipendiat\*innen eine Förderung durch eine private Stiftung. Ausgaben
für Infrastrukturmaßnahmen sind von dieser finanziellen Förderung
explizit ausgenommen. Darüber hinaus sind die Promovierenden nicht in
eine bestehende institutionelle Infrastruktur eingebunden, d. h. ihnen
werden beispielsweise keine Büroräume oder Serverbereiche zum Speichern
von Daten und Dateien zur Verfügung gestellt. Zwar erlaubt die Stiftung
die Nutzung eines stiftungseigenen Cloud-Systems zum Austauschen von
Dateien zwischen den Promovierenden, für das Cloud-System bestehen
jedoch keine Back-Up-Verfahren. Analog entsprechen auch die
institutionellen Back-Up-Prozesse des Netzwerks der Hochschule der
Promovierenden nicht den Bedarfen des Projekts (siehe hierzu auch
***Standard 4-a im vorliegenden Modul***). Folglich müssen die beiden
Promovierenden im Rahmen ihres Projekts eine eigne Back-Up-Strategie
entwickeln und im Projektverlauf konsistent umsetzen. Diese wird im
Rahmen der Projektorganisation schriftlich fixiert.

Projektinterne Vereinbarung zur Erstellung von Back-Ups im Projektverlauf
=========================================================================

Im gesamten Projektverlauf wird ein Speichervolumen im mittleren
einstelligen Gigabyte-Bereich erwartet. Die Projektbeteiligten einigen
sich aufgrund dieses relativ geringen Speichervolumens auf die Sicherung
des gesamten Arbeitsverzeichnisses in den Back-Ups (anstelle einzelner,
ausgewählter Dateien).

Das gesamte Arbeitsverzeichnis des Projekts wird im Cloud-System der
Stiftung gesichert und bearbeitet. Pro Woche werden insgesamt vier
Sicherungskopien dieses Arbeitsverzeichnisses an zwei unterschiedlichen
Wochentagen erstellt:

1.  Die ersten beiden Sicherungskopien werden jeden Mittwoch durch die
    > beteiligte Person A erstellt; eine der beiden Sicherungskopien
    > erfolgt auf dem privaten Rechner der Person A, die zweite
    > Sicherungskopie wird extern auf einem USB-Stick gespeichert, der
    > bei Person A zu Hause gelagert wird.

2.  Die beiden verbleibenden wöchentlichen Sicherungskopien erfolgen
    jeden Freitag durch die beteiligte Person B und werden ebenfalls zum
    einem auf dem Privatrechner der Person B sowie zum anderen auf einem
    USB-Stick gespeichert, der zu Hause bei Person B gelagert wird.

Bei der Erstellung der Back-Ups gilt:

a)  Zum Schutz personenbezogener und sensibler Informationen im Projekt
    (siehe hierzu auch ***Modul III.b) Schutz personenbezogener Daten im
    Projekt***) erstellen die Beteiligten zunächst einen verschlüsselten
    Zip-Ordner des Arbeitsverzeichnisses mittels *7Zip* (siehe
    ***weiterführende Ressourcen*** im vorliegenden Modul); das Passwort
    zum Ver- bzw. Entschlüsseln der Dateien entspricht den
    Vereinbarungen der Projektbeteiligten vom 13.11.2020.

b)  Der verschlüsselte Zip-Ordner wird dann auf dem Privatrechner und
    dem USB-Stick der erstellenden Person gespeichert und mittels
    *CheckSum* (siehe ***weiterführende Ressourcen*** im vorliegenden
    Modul) mit der Ausgangsdatei (Zip-Ordner im Cloud-System der
    Stiftung) verglichen (Kontrolle der Datenintegrität); der Zip-ordner
    im Cloud-System ist daraufhin wieder zu löschen.

c)  Die Beteiligten bewahren die beiden letzten (von ihnen erstellten)
    Sicherungskopien auf ihrem Privatrechner bzw. dem USB-Stick auf
    (geschätztes notwendiges Speichervolumen auf den Privatrechnern und
    den USB-Sticks jeweils ca. 10 bis 15 GB). Um die um die notwendigen
    Speicherkapazitäten für die Back-Ups gering zu halten, werden ältere
    Sicherungskopien auf

    I.  den Privatrechnern vernichtet (siehe hierzu auch Punkt e) der
        Vereinbarung),

    II. dem USB-Sticks gelöscht (siehe hierzu auch Punkt f) der
        Vereinbarung).

d)  Das Erstellen der Sicherungskopien liegt in der Verantwortung der
    beteiligten Person A (mittwochs) bzw. der Person B (freitags); im
    Falle der Abwesenheit einer/s Beteiligten übernimmt die jeweils
    andere Person die anfallenden Sicherungskopien der/s Abwesenden.

e)  Zum Schutz personenbezogener und sensibler Informationen im Projekt
    (siehe hierzu auch ***Modul III.b) Schutz personenbezogener Daten im
    Projekt***) werden die Daten auf den Festplatten der Privatrechner
    am Projektende durch Überschreiben der Dateien mittels *Eraser*
    (siehe ***weiterführende Ressourcen*** in diesem Modul) vernichtet.

f)  Um technischen Defekten vorzubeugen werden die zur Sicherung
    genutzten USB-Stick alle 6 Monate durch neue USB-Sticks (32GB)
    ersetzt. Die veralteten USB-Stick werden neu formatiert, um die
    darauf befindlichen Dateien endgültig zu vernichten.

Zum Ende des ersten Projektjahres vereinbaren die beiden
Projektbeteiligten eine Evaluierung und ggf. Anpassung dieses
Back-Up-Prozesses.
