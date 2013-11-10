## AllAboard

[![Build Status](https://travis-ci.org/dpetersen/all_aboard.png)](https://travis-ci.org/dpetersen/all_aboard)
[![Code Climate](https://codeclimate.com/repos/5259b55e56b1024eb101b9fa/badges/64bbc8eb7bbce95c915a/gpa.png)](https://codeclimate.com/repos/5259b55e56b1024eb101b9fa/feed)

A (work in progress) flexible status board as a Rails engine.

**All Aboard?  What does that even mean?**  It's a status board engine on Rails.  Give me a break.  All the good names are taken.

#### TODO:

  * Document the overridden helper around permissions that you have to do, along with the fact that it sort of executes in the Engine's constants, so some stuff might not work so hot.
  * Document how you have to tell AllAboard what redis to use.
  * Document styling your source.  The name (without Source suffix, underscored) of the source and the perspective will be styles on the perspective assignments.  So you can style your whole source generically, and specific perspectives.  You should ALWAYS include the source name in the perspective styles so you don't collide with another source with the same perspective name.  You can target specific dimensions because those are classes, too.
