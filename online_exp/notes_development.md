Notes for experiment development (together with Maarten van Heuvel)
======================================================


Questions to Maarten
--------------------

- Data: download, format etc.
- Why max number of characters = 29? Doesn't work for via-task
- For via task, a validation regex that has two alternatives: 1) "X" (case insensitive) or 2) a string that starts with the 2 first words in the stimuli, e.g. "Zij sluipen" (again case insensitive). The error message is: "Please fill in the entire sentence or X if there is no good completion"
- From the feature task currently one can go back to the instructions. However, then all the information typed is lost. Can this be prevented? Otherwise better disable function to go back?
- How to deal with reloading the final slide "Einde van het experiment" when it's finished? It's important for testing, but should not be there when run for real
- The fields "Nieuw veld" and "Volgende" overlap and that looks ugly -- increase the space between them
- Something off with Exp in Firefox - not working properly


To do - Frinex
--------------

### Guillermo

- Comment out the "Repeat anew" button at the end.


### Maarten



To do - experiment setup
-----------------------

- Counterbalancing: Make sure it works, e.g. sending the right link
- Add actual DURATION estimate + PAYMENT to the consent form
- Instructions: add "This is the last task." before via-task
- Add Lilia Risman's instrument verbs


To add later on (after pilot)
-----------------------------

- Catch trials?
- Perhaps we should add to the instructions for the feature generation task (or perhaps on the screen after the consent form) that participants should not look up the definitions of the verbs in the dictionary. It seems self-evident, but it may be wise to say anyway. And if you want to be able to filter out participants who did check the dictionary, you could add a question at the end to ask if they used a dictionary or not. (But in that case, make sure to add that they will be paid regardless of their answer, or they’ll be more likely to lie. This is something my PhD supervisor does in her online experiments.)
