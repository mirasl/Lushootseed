# Seattle Lushootseed

Seattle Lushootseed is an application for Android designed to provide an accessible entry into Lushootseed and its history in the Seattle area.
Throughout the past few decades, many people have spent a large amount of time and effort in preserving the Lushootseed language, but much of this
work is buried deeply in the internet, and most of it is largely unaccessible unless one is willing to dive deep into the language on their own.

# Screenshots

![Screenshot_20241009-134445](https://github.com/user-attachments/assets/5312e954-0c3b-4035-9d1b-581387cb2da5)
![Screenshot_20241009-134436](https://github.com/user-attachments/assets/06900b92-9418-485b-bcd2-99519eb63f32)
![Screenshot_20241009-134409](https://github.com/user-attachments/assets/3088e5f1-84ab-4c24-8f5d-95ff93144512)
![Screenshot_20241009-134358](https://github.com/user-attachments/assets/04621de6-280f-4a0b-a1b5-e589b8ed1d00)
![Screenshot_20241009-134352](https://github.com/user-attachments/assets/43c569e3-f966-4e98-83f9-9d033af56a14)


# Features:
- An explanation of the Lushootseed alphabet and its various sounds
- A list of vocabulary words that is not hardcoded and flexible to updates (see CONTRIBUTE file)
- A simple flashcard feature to practice the vocabulary terms
- An interactive map of the Seattle area displaying various Lushootseed place names
- Information about the history of the Lushootseed language

# Installation:
The app can be installed on any android device by downloading the APK from the releases tab.

Google Play has recently gotten stingy about the Play Store servers. As a result, Seattle Lushootseed is no longer available on the play store.

This is a great demonstration of why it's necessary to preserve both media and languages, and is exactly why I open-sourced Seattle Lushootseed in the first place. Rest assured, as long as I'm alive, this repository isn't going anywhere ;)

# FAQ:

Q: "How can I contribute to the vocabulary words?"
A: All you need to do is edit the vocab.json file - see CONTRIBUTE file for details!

Q: "Why is this being made in a physics/game engine?"
A: When I started work on this project, I wanted to leave open the possibility of including more interactive language-learning activities or games
geared towards children. After some thought I instead decided to give the app a focus on simplicity and accessibility, but I already had the footprint in
Godot. Godot's UI system is already servicable and can easily be exported to Android devices, so I figure there is not much reason to switch. In the future I
may disable the 3D to reduce some unneeded bulk, but it is not a huge deal and would only save a few MBs anyways.
