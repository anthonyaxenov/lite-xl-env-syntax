# env syntax support plugin for lite-xl

[Lite-XL](https://lite-xl.com/) is lightweight, fast and customizable open-source code editor.

This plugin adds syntax support for `*.env` files using *very simple* rules.

Unfortunately, in fact `env`-file syntax is more complicated than it seems, so current solution doesn't cover ALL possible syntax combinations.
My goal is to do so somehow in future but I think plugin is already good enought to use in most of basic cases.

Currently available highlighting:
* line and inline comments;
* keys;
* `export`;
* values: 
  * literals: `null`, `true`, `false`, `\n`, `\r`, `\t`, `\f`, `\b`, `\\`, `\"`, `\'`;
  * numerics;
  * strings:
    * one-lined (inside `'...'` or `"..."`) 
    * multiline (inside `"""..."""` or `'''...'''`);
* string interpolation `${myvar}`;

TODO and known issues:
* unquoted string values are not highlighted as string;
  * quotes inside unquoted strings are not escaped (highlighted substring inside not highlighted string);
* in unquoted string values, word + `=` are showed as inlined key;
* inside any quoted strings interpolations and literals are not highlighted;
* numeric values containing more than 1 decimal separator are not highlighted as string;
* literals used as keys must be highlighted as keys, not literals;
* quoted strings used as keys must be highlighted as keys, not strings;
* escaped literals must not be used keys;
* ...

You can use `test.env` file to check how plugin works.

## How to install

To install a plugin:

* Drop `language_env.lua` file in:
    * Linux: `~/.config/lite-xl/plugins/`
    * MacOS: `~/.config/lite-xl/plugins/`
    * Windows: `C:\Users\(username)\.config\lite-xl\plugins\`
* If lite-xl is already opened then save files just press `Ctrl`+`Shift`+`P` => `rst` => `Enter` to reboot editor's core and load plugin immidiately.

## License

[The MIT License](LICENSE)
