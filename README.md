DieselNote
=======

This is a simple proof of concept Ruby internal DSL.  It combines ideas and examples found in CodeSchool's Ruby Bits 2, Metaprogramming Ruby, Destroy All Software, Practicing Ruby, and various other places.

The goal was to make a small DSL in Ruby for adding and displaying song information.

Usage
-----

```
require 'diesel_note'

song('Dear Prudence') { {artist: 'The Beatles', album: 'The White Album'} }
find_artist('The Beatles') { puts show_info }
```

Dynamic Attributes
------------------

A song requires a Title at minimum, but any other attribute can be added dynamically.

Dynamic Finder
--------------

Similar to ActiveRecord, DieselNote supports dynamic #find methods for any previously defined attribute.

```
find_artist('The Beatles') { puts show_info }
find_title('The White Album') { puts show_info }
