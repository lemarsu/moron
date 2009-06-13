= moron Changelog

=== Version 0.5.0

* Renamed from git-ssh to moron
* moron-hook has been rewritten to use git gem. Pushing keys won't need a temporary directory anymore.
* Added git dependency.

=== Version 0.4.0

* Added creation on demand of repositories
* Default folder is now ~/repositories. If a folder is specified, there won't be a folder "reposiories" in it.
* git-ssh-init has a much better output.

=== Version 0.3.0

* Added a git-ssh-init command
* Added a git-ssh-hook called on post-update hook
* Adding keys can be done via git (a la gitosis)

=== Version 0.2.0

* Added a little documentation
* Added a version command line option

=== Version 0.1.0

* Initial public release
