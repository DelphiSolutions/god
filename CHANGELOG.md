God Cookbook Changelog
=======================
1.3.2 - 03/10/2015
------------------
### Improvement
* Master god config file should be not have executable bit set

1.3.1 - 03/06/2015
------------------
### Bug Fix
* Should not use `return` statements inside LWRPs, causes local jump errors

### Dependency update
* upstart 1.2.0 -> 1.2.1, for bug fix

1.3.0 - 03/05/2015
------------------
### Dependency update
* upstart 1.1.1 -> 1.2.0, for bug fix

1.2.0 - 03/05/2015
------------------
### Dependency update
* upstart 1.0.0 -> 1.1.1, for compatibility with ubuntu 12.04

1.1.0 - 02/19/2015
------------------
### Breaking Changes
* Removed definition for creating watches. Use LWRP instead.

### Improvements
* Added LWRP for creating and deleting god services
* Brought it up to standard

### Cookbook Dependency Updates
* upstart 0.3.3 -> 1.0.0

1.0.2
-----
* [COOK-2264] - pin runit dependency

## v1.0.0:

* Current public release.
