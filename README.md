coinbase-tip-discourse
======================

A [Discourse](http://discourse.org) plugin to embed a [Coinbase tip](https://www.coinbase.com/tip) button into each post.

Installation
============

* Run `rake plugin:install repo=http://github.com/coinbase/coinbase-tip-discourse` in your discourse directory
* In development mode, run `rake assets:clean`
* In production, recompile your assets: `rake assets:precompile`

Configuration
=============

1. Add 'tip' as the first entry under `Admin > Settings > Basic Setup > post menu`.
2. Add a custom field named `Coinbase Username` under `Admin > Customize > User Fields`. Set it to be a Text Field and to be editable after signup.
3. Have your users set the `Coinbase Username` parameter in their Discourse user preferences to the public username set in their Coinbase account.
4. Profit.
