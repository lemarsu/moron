== moron

<tt>moron</tt> is a proxy to serve git repositories over ssh.

== DESCRIPTION

<tt>moron</tt> can force your ssh server to handle only git requests. You can
allow your users to pull or push, but not to login or to do scf or sftp.

== FEATURES

* No other account creation to handle a new commiter.
* Can chroot to a directory to limit access of the repository server.

Later :
* Can allow read, write or none access to a repository on a user basis.

== SYNOPSIS

Create a +user+ account

  # groupadd git
  # useradd -g git -h /var/git -m git
  # passwd

You need to put a strong password that you can immediately forget.

Prepare for ssh keys

  # mkdir ~git/.ssh
  # touch ~git/.ssh/authorized_keys
  # chown -R git:git ~git/.ssh
  # chmod 700 ~git/.ssh

When you have to add a key in the <tt>~git/.ssh/authorized_keys</tt>, simply add at the beginning of the line :

  command="/usr/bin/moron -r /var/git lemarsu"

For example:

  command="/usr/bin/moron -r /var/git lemarsu" ssh-dss ... lemarsu@zorglub

The <tt>-r</tt> option ask <tt>moron</tt> to chroot the folder <tt>/var/git</tt>. This way, the
users cannot get away from the directory of repositories.

== CREDITS

LeMarsu <ch dot ruelle at lemarsu dot com>

== LICENSE

See file COPYING.
