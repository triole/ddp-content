**DDP-Bildung**

**Standard III-a-3-c:**

***Versionierungsstandard der Data Documentation Initative (DDI)***

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

Versionierungsstandard der Data Documentation Initative (DDI)
=============================================================

Im Rahmen ihrer Bemühungen zur Entwicklung von Metadatenstandards und
Instrumenten zur formalen Beschreibung sozialwissenschaftlicher Daten
hat die *Data Documentation Initiative* (DDI-Alliance) einen Standard
zur Versionierung von Daten etabliert.

Dieser DDI-Versionierungsstandard basiert auf einem dreigliedrigen
aufwärtszählenden Ziffernsystem, dessen Glieder durch einen „."
voneinander getrennt werden, wie z. B. *1.0.0*, die Versionsnummer der
ersten Version eines Datensatzes.

Dabei zeigt

-   die erste Stelle 1. (*major*) große Veränderungen in den Daten an,
    > wie beispielsweise das Hinzuspielen neuer Fälle oder weiterer
    > exogener Informationen, z. B. von Variablen; im Fall einer solch
    > großen Veränderungen wird die *major* Stelle entsprechend aufwärts
    > gezählt, also etwa *2.0.0*;

-   die zweite Stelle 0. (*minor*) kleine Veränderungen in den Daten
    > oder Dateien an, die aus der vorherigen Version der Daten heraus
    > repliziert werden können, wie etwa die Bildung von Indizes auf
    > Basis von in den Daten enthaltenen Informationen bzw. Variablen;
    > im Fall einer solch kleineren Veränderungen wird die *minor*
    > Stelle entsprechend aufwärts gezählt, also etwa *1.1.0*;

-   die dritte Stelle 0 (*revision*) marginale Veränderungen in den
    > Daten an, wie etwa Verbesserungen von Rechtschreibfehlern in
    > Variablen- oder Wertelabels, die keinen Einfluss auf die Daten als
    > solche haben; im Fall einer solch marginaler Veränderungen wird
    > die *revision* Stelle entsprechend aufwärts gezählt, also etwa
    > *1.0.1*.

Der DDI-Versionsstandard gibt somit darüber Auskunft, wie groß die
Veränderung in der aktuellen Version im Vergleich zu Vorgängerversionen
ist. Genaue Regeln dazu, was große, kleine und marginale Veränderungen
sind, müssen durch die Anwendenden schriftlich fixiert werden. Dabei
wird der Standard teilweise auch nur in einer zweigliedrigen Variante
genutzt und die letzte Stelle (revision) weggelassen.

Die jeweilige Versionsnummer der Daten kann beispielsweise im
Dateinamen, den Daten selbst oder den Metadaten der Datei festgehalten
werden. Bei der Nutzung des DDI-Versionierungsstandards in Dateinamen
empfiehlt es sich zudem die Trennzeichen („.") durch Bindestriche („-")
zu ersetzen, um eventuelle Probleme beim Speichern und Öffnen von
Dateien zu vermeiden (siehe auch ***Anwendungsfall III-a-3-b zu
Benennung von Dateien***).

Weitere Informationen zum DDI-Versionierungsstandard finden sich in den
***weiterführenden Ressourcen des vorliegenden Moduls***.
