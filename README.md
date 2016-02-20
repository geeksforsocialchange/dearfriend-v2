# Dear Friend

Code base for Dear Friend using [Phil Lennon's](http://iampjl.co.uk) fantastic [Foley](http://github.com/fephil/foley)

## Install

* Install Node 4 LTS or 5 stable (preferred),
* Run in Terminal: `npm i gulp-cli -g` (Gulp does not need to be installed globally),
* Navigate to the workflow folder in command line Terminal,
* Run: `npm i`.

Please note, there are a large amount of development dependencies to install due to the 'all in one' nature of this workflow. It could possibly take several minutes to install the modules.

### Optional Installs

The following plugins for Atom are recommended but not required:

* editorconfig,
* linter,
* linter-handlebars,
* linter-js-standard,
* linter-stylelint,
* tabs-to-spaces.

## Usage

Run these tasks in your command line Terminal:

`gulp [--production] [--debug]`

`gulp deploy [--production] [--debug]`

`gulp auditcode`

* The `gulp` task builds the website, watches for changes and starts up a sever,
* The `gulp deploy` task builds the website without watching for changes or running the server,
* The `gulp auditcode` task runs various linting on the project source files.
* The `--production` flag builds minified assets with no sourcemaps,
* The `--debug` flag shows the files being created in each task (if the task has a pipe).
