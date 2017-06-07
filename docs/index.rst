.. redmine_tweaks documentation master file, created by
   sphinx-quickstart on Sat Apr 23 16:31:21 2016.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

.. _Redmine: https://www.redmine.org
.. _Ruby: https://www.ruby-lang.org
.. _PluginGemfile: https://github.com/alphanodes/redmine_tweaks/blob/master/PluginGemfile

Welcome to Redmine Tweaks Plugin
================================

Tweaks for wiki and content including new macros for `Redmine`_.

THIS PLUGIN IS NOT LONGER SUPPORTED, PLEASE USE SUCCESSOR PLUGIN `Additionals <https://github.com/alphanodes/additionals>`_.

If your Redmine version is older then 3.0, use this plugin. Otherwise use `Additionals <https://github.com/alphanodes/additionals>`_.

Requirements
------------

+--------------------+----------------------+
| `Redmine`_ version | >= 2.6.0             |
+--------------------+----------------------+
| `Ruby`_ version    | >= 2.1.5             |
+--------------------+----------------------+
| Gem packages       | see `PluginGemfile`_ |
+--------------------+----------------------+


Installation
------------

Install ``redmine_tweaks`` plugin for `Redmine`_.

.. code-block:: bash

  $ cd $REDMINE_ROOT
  $ git clone git://github.com/alphanodes/redmine_tweaks.git plugins/redmine_tweaks
  $ bundle install --without development test
  $
  $ # if you want to use smiley/emoji legacy support, you have to put emoji icons to
  $ # $REDMINE_ROOT/public/images/emoji
  $ # To obtain image files, run the gemoji extract command on macOS Sierra or later:
  $ bundle exec gemoji extract public/images/emoji
  $
  $ # if you to not have macOS, you can put these files manually to $REDMINE_ROOT/public/images/emoji
  $ # see https://github.com/github/gemoji for more infos

Restart your application server (apache with passenger, nginx with passenger, unicorn, puma, etc.) and ``redmine_tweaks`` is ready to use.

Features
--------

* use "Project guide" on project overview page
* global header for all projects
* global footer for all projects
* welcome text for login page
* global sidebar content support
* set info message above new ticket (e.g. for guidelines)
* Wiki macros for: date, Gihub gist, issues, members, projects slideshare, twitter, reddit, tradingview, cryptocompare, user, youtube and vimeo
* option to remove "my page" from top menu
* customize "Help" url in top menu
* customize top menu items
* disable (hide) modules for projects
* open external urls in new window
* smiley/emoji legacy support
* anonymize referrer for external urls
* Hide role in project memberbox
* Configurable issue rules

  * closing issue with open sub issues
  * change assigned_to automatically, if issue status changes
  * assigned_to has changed, but status change is required, too


.. toctree::
    :maxdepth: 2

    manual
    macros
    new_feature
    changelog
