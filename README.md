= Reporter =

The reporter is a small event machine which runs a set of plugins by waiting on a timer, then forking them, and exeuting whatever
the plugin wants to do.

The plugin execute call should return a blob of data which is sent as a metric to the truestack backend.

== Usage ==
The gemfile should list all of the plugins which are to be run.

Plugins should have their dependencies specified in their gem descriptions.
A base plugin is to be provided on github which can be forked and then used.

We can plan on simply converting scoutapp plugins => truestack  plugins as the time comes. They are simple.

Do we restrict plugins to only those which have the right version? Possibly, depending on how the reporter advances in development.

== TODO ==
Can we kill a subprocess fork if it takes too long? I hope so!

Plugins can be detected because our Gem will be a module, with 'included(base)' defined, which then
adds the base to an array of classes.  Reporter will just iterate over them.
