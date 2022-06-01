# Seattle Lushootseed

Seattle Lushootseed is an application for Android designed to provide an accessible entry into Lushootseed and its history in the Seattle area.
Throughout the past few decades, many people have spent a large amount of time and effort in preserving the Lushootseed language, but much of this
work is buried deeply in the internet, and most of it is largely unaccessible unless one is willing to dive deep into the language on their own.

Features:
- An explanation of the Lushootseed alphabet and its various sounds
- A list of vocabulary words that is not hardcoded and flexible to updates (see CONTRIBUTE file)
- A simple flashcard feature to practice the vocabulary terms
- An interactive map of the Seattle area displaying various Lushootseed place names
- Information about the history of the Lushootseed language


FAQ:

Q: "How can I contribute to the vocabulary words?"
A: All you need to do is edit the vocab.json file - see CONTRIBUTE file for details!

Q: "Why is this being made in a physics/game engine?"
A: When I started work on this project, I wanted to leave open the possibility of including more interactive language-learning activities or games
geared towards children. After some thought I instead decided to give the app a focus on simplicity and accessibility, but I already had the footprint in
Godot. Godot's UI system is already servicable and can easily be exported to Android devices, so I figure there is not much reason to switch. In the future I
may disable the 3D to reduce some unneeded bulk, but it is not a huge deal and would only save a few MBs anyways.
