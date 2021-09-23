# Multivariateverfahren_CaseStudy

1. Erlangen Sie ein Verständnis für die Aussagen der Attribute des Datensatzes, sodass Sie diese
inhaltlich interpretieren können.

2. Verschaffen Sie sich einen Überblick über die einzelnen Attribute sowie deren Verteilungen. Unter-
suchen Sie außerdem die Korrelationsstruktur und stellen Sie ihre Erkenntnisse visuell dar.

- Corrgram in R
- Beschreibung von stark und schwach korrelierenden Features

3. Prüfen Sie, ob alle Beobachtungen und Attribute des Datensatzes für weitere Analysen geeignet
sind und entfernen Sie gegebenfalls ungeeignete Zeilen oder Spalten.

- NA's droppen

4. Führen Sie Hauptkomponenten- und Faktoranalysen mit verschiedenen Parametern durch, um
Oberkategorien für die Attribute zu bestimmen. Entscheiden Sie sich anhand der Bewertungskrite-
rien für eine Lösung und kennzeichnen Sie diese. Sie sollten nich mehr als 8 Dimensionen extrahieren.
Eine Interpretation der Dimensionen ist nicht zwingend notwendig.

**Hauptkomponentenanalyse**: 

1. Normierung der Daten (z-Transformation)
2. Berechnung der Kovarianz-/Korrelationsmatrix
3. Berechnung der Hauptkomponenten (als Eigenvektoren der
Kovarianz-/Korrelationsmatrix)
4. Entscheidung über Anzahl zu extrahierender
Hauptkomponenten anhand erklärter Varianz (Eigenwerte
der Kovarianz-/Korrelationsmatrix) mit Hilfe des Scree-Plots
(Elbow-Kriterium) Anteil erklärter Varianz)
5. Projektion der Beobachtungen in den Raum der
Hauptkomponenten über Multiplikation mit der
Ladungsmatrix
6. Visuelle Darstellung und Interpretation der Ergebnisse und
Hauptkomponenten (Bi-plot, Ladungsmatrix)
7. Verwendung der Hauptkomponente für weitere Analysen
(z.B. Hauptkomponentenregression, Machine Learning
Modelle)
