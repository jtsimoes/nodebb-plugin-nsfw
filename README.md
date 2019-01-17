# NSFW (Not Safe For Work) Categories Plugin for NodeBB 1.x.x

A simple NodeBB plugin that displays a confirm box with a 'not safe for work' warning when entering in specific categories.

![Preview](https://i.imgur.com/jDxUPgh.png)

## Dependencies :

**This plugin does not require any special dependency.** This only uses pure JavaScript and a bit of jQuery. It also uses some FontAwesome icons for a better design.
But with all this already in NodeBB by default, there are no dependencies to install beforehand, in order to use this plugin.

## Installation :

1. Install and activate this plugin on the ACP "Plugins" page;
2. Restart and rebuild your NodeBB;
3. Done.

## Configuration :

**The default category ID is 28.** I will make this customizable in the future if you need to change it or add more categories, for now it's necessary to fork this repository and change the array `nsfwCategoriesIds` in the file `main.js` itself. Feel free to also change the messages and the actions that the confirm buttons does.

## To-Do List :

-  [x]  Add support for more than one category;
-  [x]  Set a cooldown to avoid display the confirm every time;
-  [ ]  Add a config page on ACP to change plugin variables.

## Changelog :

### [v1.2.0](https://github.com/jtsimoes/nodebb-plugin-nsfw/releases/tag/v1.2.0) (16/01/2019)
* Added feature to memorize (per session) user's choice to avoid display the confirm every time the user visits any NSFW category.

### [v1.1.0](https://github.com/jtsimoes/nodebb-plugin-nsfw/releases/tag/v1.1.0) (14/01/2019)
* Added support to choose more than one NSFW category.

### [v1.0.0](https://github.com/jtsimoes/nodebb-plugin-nsfw/releases/tag/v1.0.0) (13/01/2019)
* Initial version.

## Suggestions & Bugs :
Please submit all feature requests and bugs in the [Issues section of this repository](https://github.com/jtsimoes/nodebb-plugin-nsfw/issues).

*Thanks to https://community.nodebb.org/user/psychobunny for the original snippet.*
