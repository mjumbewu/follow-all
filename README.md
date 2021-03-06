Follow All
==========
Follow All allows you to enter the name of any public Twitter list and follow
all the members of that list.

Screenshot
----------
![Follow All](https://github.com/codeforamerica/follow-all/raw/master/screenshot.png "Follow All")

Continuous Integration
----------------------
[![Build Status](http://travis-ci.org/codeforamerica/follow-all.png)](http://travis-ci.org/codeforamerica/follow-all)

Demo
----
You can see a running version of the application at
[http://follow-all.heroku.com](http://follow-all.heroku.com).

Installation
------------
    git clone git://github.com/codeforamerica/follow-all.git
    cd follow-all
    bundle install

Usage
-----
Running your own instance of Follow All requires you to [register an app with
Twitter](http://dev.twitter.com/apps) to obtain OAuth credentials. Once you
obtain credentials, substitute your consumer key and secret into the command
below.

    CONSUMER_KEY=abc CONSUMER_SECRET=123 rails server

Contributing
------------
In the spirit of [free software](http://www.fsf.org/licensing/essays/free-sw.html), **everyone** is encouraged to help improve this project.

Here are some ways *you* can contribute:

* by using alpha, beta, and prerelease versions
* by reporting bugs
* by suggesting new features
* by writing or editing documentation
* by writing specifications
* by writing code (**no patch is too small**: fix typos, add comments, clean up inconsistent whitespace)
* by refactoring code
* by closing [issues](https://github.com/codeforamerica/follow-all/issues)
* by reviewing patches
* [financially](https://secure.codeforamerica.org/page/contribute)

Submitting an Issue
-------------------
We use the [GitHub issue tracker](https://github.com/codeforamerica/follow-all/issues) to track bugs and
features. Before submitting a bug report or feature request, check to make sure it hasn't already
been submitted. You can indicate support for an existing issuse by voting it up. When submitting a
bug report, please include a [Gist](https://gist.github.com/) that includes a stack trace and any
details that may be necessary to reproduce the bug, including your gem version, Ruby version, and
operating system. Ideally, a bug report should include a pull request with failing specs.

Submitting a Pull Request
-------------------------
1. Fork the project.
2. Create a topic branch.
3. Implement your feature or bug fix.
4. Add tests for your feature or bug fix.
5. Run <tt>bundle exec rake test</tt>. If your changes are not 100% covered, go back to step 4.
6. Commit and push your changes.
7. Submit a pull request. Please do not include changes to the gemspec or version file. (If you want to create your own version for some reason, please do so in a separate commit.)

Copyright
---------
Copyright (c) 2011 Code for America.
See [LICENSE](https://github.com/codeforamerica/follow-all/blob/master/LICENSE.md) for details.
