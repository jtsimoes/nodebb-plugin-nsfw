# NSFW (Not Safe For Work) Category Plugin for NodeBB 1.x.x

A simple plugin NodeBB that displays a confirm box with a 'not safe for work' warning when entering in a specific category.

[Screenshot goes here]

## Setup :

* Go to your NodeBB root;
* Stop your NodeBB using `./nodebb stop`;
* Run `npm install jtsimoes/nodebb-plugin-nsfw`;
* Start your NodeBB using `./nodebb start`;
* Enable the plugin on the ACP plugin page;
* Restart and rebuild your NodeBB;
* Done.

## Config :

The default category ID is 28. I will make this customizable in the future if you need to change it, for now it's necessary to fork this repository and change the variable `nsfwCategoryId` in the file `main.js` itself.
Feel free to change the messages and the actions that the confirm buttons does.

## To-Do List :

-  [ ]  Add a config page on ACP to change script variables;
-  [ ]  Add support for more than one category;
-  [ ]  Set a cooldown to avoid display the confirm every time.

Thanks to https://community.nodebb.org/user/psychobunny for the original snippet.