Notes for experiment development (together with Maarten van Heuvel)
======================================================


Questions to Maarten
--------------------

- Data
  - Can I delete all previous data or create a new tagpair data file? Or is it simpler to filter out dates earlier than X once I start collecting data?
- From the feature task currently one can go back to the instructions. However, then all the information typed is lost. Can this be prevented? Otherwise better disable function to go back?
- How to deal with reloading the final slide "Einde van het experiment" when it's finished? It's important for testing, but should not be there when run for real
- The fields "Nieuw veld" and "Volgende" overlap and that looks ugly -- increase the space between them
- Something off with Exp in Firefox - not working properly


To do - Frinex
--------------

### Guillermo

- Comment out the "Repeat anew" (opnieuw beginnen) button at the end.
- Space between "Niewu veld" and "volgende"
- Be able to go back to instructions from all tasks (currently not possible for NegationTask)
- Small answer field for NegationTask
- Remove ExpOrder field from experiment and provide it in the link


### Maarten



To do - experiment setup
-----------------------

- Counterbalancing: Make sure it works, e.g. sending the right link
- Add actual DURATION estimate + PAYMENT to the consent form
- Add Lilia Risman's instrument verbs
- Final slide: change Eva's for my email in "Stuur dit nummer in een e-mail naar de experimentleider Eva Poort: Eva.Poort@mpi.nl"


To add later on (after pilot)
-----------------------------

- Catch trials?
- Instructions: add "This is the last task." before via-task
- Instructions: Add "Well done for this task, now we move on to the next..."


Things that would be nice but perhaps too dificult to implement?
------------------------------------------------------

- For via task, a validation regex that has two alternatives: 1) "X" (case insensitive) or 2) a string that starts with the 2 first words in the stimuli, e.g. "Zij sluipen" (again case insensitive). The error message is: "Please fill in the entire sentence or X if there is no good completion"

