# NSFW (Not Safe For Work) Category Plugin for NodeBB 1.x.x

A simple plugin NodeBB that displays a confirm box with a 'not safe for work' warning when entering in a specific category.

![Preview](https://i.imgur.com/jDxUPgh.png)

## Dependencies :

**This plugin does not require any special dependency.** This only uses pure JavaScript and a bit of jQuery. It also uses some FontAwesome icons for a better design.
But with all this already in NodeBB by default, there are no dependencies to install beforehand, in order to use this plugin.

## Setup :

* Go to your NodeBB root;
* Stop your NodeBB using `./nodebb stop`;
* Run `npm install jtsimoes/nodebb-plugin-nsfw` or copy this repository into `node_modules` folder;
* Start your NodeBB using `./nodebb start`;
* Enable the plugin on the ACP plugin page;
* Restart and rebuild your NodeBB;
* Done.

## Config :

**The default category ID is 28.** I will make this customizable in the future if you need to change it, for now it's necessary to fork this repository and change the variable `nsfwCategoryId` in the file `main.js` itself. Feel free to also change the messages and the actions that the confirm buttons does.

## To-Do List :

-  [ ]  Add a config page on ACP to change script variables;
-  [ ]  Add support for more than one category;
-  [ ]  Set a cooldown to avoid display the confirm every time.

## Changelog :

### [v1.0.0](https://github.com/jtsimoes/nodebb-plugin-nsfw/releases/tag/v1.0.0) (13/01/2019)
* Initial version.

Thanks to https://community.nodebb.org/user/psychobunny for the original snippet.
