SongDSL
=======

This is a simple proof of concept Ruby internal DSL.  It combines ideas and examples found in CodeSchool's Ruby Bits 2, Metaprogramming Ruby, Destroy All Software, Practicing Ruby, and various other places.

The goal was to make a small DSL in Ruby for adding and displaying song information.

Usage
-----

```
add_song 'Dear Prudence' do
  Artist 'The Beatles'
  Album 'The White Album'
  Year 1968
end

find_by_artist('The Beatles') { show_info }
```

Dynamic Attributes
------------------

A song requires a Title at minimum, but any other attribute can be added dynamically.

Dynamic Finder
--------------

Similar to ActiveRecord, SongDSL supports dynamic #find_by methods for any previously defined attribute.

```
find_by_artist('The Beatles') { show_info }
find_by_title('The White Album') { show_info }
