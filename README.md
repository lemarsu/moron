== moron

<tt>moron</tt> is a proxy to serve git repositories over ssh.

== DESCRIPTION

<tt>moron</tt> can force your ssh server to handle only git requests. You can
allow your users to pull or push, but not to login or to do scp or sftp.

== FEATURES

* No other unix account creation to handle a new commiter.
* Chroot to a directory to limit access of the repository server.
* All configurations of public keys are done by pushing a git archive.

Later :
* Can allow read, write or none access to a repository on group and user basis.

== SYNOPSIS

Create a +user+ account

  # groupadd git
  # useradd -g git -m git
  # passwd -d git

Upload your first ssh key to the server somewhere the git account can access,
like /tmp. Then, launch moron-init under git account

  # su - git
  $ moron-init /tmp/sshkey.pub

This will create a moron-admin.git archive and will put it in ~/repositories by
default. If you want to put the archive root somewhere else, add the option -d,
i.e.:

  $ moron-init /tmp/sshkey.pub -d /var/git_repositories

You should now be able to fetch your archive. On your client host (any host
that have the private key of the public key you tell moron-init about):

  $ git clone git@git.server.org:moron-admin.git
  $ cd moron-admin

== MORON-ADMIN ARCHIVE

The archive has this hierachy:

  moron-admin/
  moron-admin/moron.conf
  moron-admin/keydir/
  moron-admin/keydir/user_name/
  moron-admin/keydir/user_name/key-one.pub

The moron.conf doesn't do anything yet. It will be used certainly in the next
release of moron. It will be in this file that you'll configure access to the
repositories.

The keydir folder contains folders of ssh public keys. To add a new user,
create a directory with the user name, put the ssh key in it, add the new file
to git, commit, push and that's it.

The user is represented by a folder and not directly the public keyfile. That
way, if you, like me, have multiple computers with differents keys, you can put
them all in the same folder and will share the same access. This is *not* to be
used to create groups. The groups will be handled by moron.conf.

For now, as the moron.conf is ignored, users have no meanings. Later, moron
will be able to limit access on groups or user basis.

== USAGE

For creating a new archive, simply push your repository.

If your have at least done those 3 actions,

  $ git init
  $ git add .
  $ git commit -m 'First import'

you can now push your repository :

  $ git remote add origin git@git.server.org:path/to/my/repository.git
  $ git push origin master

Voila. You've pushed your first repository.

All other actions, like renaming, moving or deleting a repository, you need to
log on the server and do it manually.

== CREDITS

LeMarsu <ch dot ruelle at lemarsu dot com>

== LICENSE

See file COPYING.
