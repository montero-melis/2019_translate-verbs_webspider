Notes for experiment development (together with Maarten van Heuvel)
======================================================


Questions to Maarten
--------------------



To do - Frinex
--------------

### Guillermo


### Maarten



To do - experiment setup
-----------------------



To add later on (after pilot)
-----------------------------

- Catch trials?
- Instructions: add "This is the last task." before via-task
- Instructions: Add "Well done for this task, now we move on to the next..."



Things that would be nice but perhaps too dificult to implement?
------------------------------------------------------

- Feature task: Start from answer field at the top?
- For via task, a validation regex that has two alternatives: 1) "X" (case insensitive) or 2) a string that starts with the 2 first words in the stimuli, e.g. "Zij sluipen" (again case insensitive). The error message is: "Please fill in the entire sentence or X if there is no good completion"
- In Feature task: If you go back to the instructions from trial n (pressing the back button), and then move onwards again, then you go to trial n-1; however, what you had previously filled in at n-1 and at n is gone (not intended behaviour?). In contrast, in Other tasks: you move back to n-1 and the typed-in information is still there (intended behaviour). Note that information typed in at trial n is always lost.
- - Perhaps we should add to the instructions for the feature generation task (or perhaps on the screen after the consent form) that participants should not look up the definitions of the verbs in the dictionary. It seems self-evident, but it may be wise to say anyway. And if you want to be able to filter out participants who did check the dictionary, you could add a question at the end to ask if they used a dictionary or not. (But in that case, make sure to add that they will be paid regardless of their answer, or they’ll be more likely to lie. This is something my PhD supervisor does in her online experiments.)




For future REF
--------------

- Remove TaskOrder from info screen: I think this is line 76, <metadataField fieldName="TaskOrder"/>
- Provide TaskOrder in the link --> Add "?TaskOrder=A" or "?TaskOrder=B" at the end. E.g., https://frinexproduction.mpi.nl/association_test/?TaskOrder=B
- Box size of answer fields: setting "hotKey=ENTER" for stimulusFreeText will result in a small box and disable having newlines in the text box (should also cause ENTER to trigger the regex but it doesn't).
