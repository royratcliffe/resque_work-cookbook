Description
===========

Runs Resque workers using God. The workers execute within a Rails environment,
as a Rake task. The task loads the Rails environment then performs Resque work.

Requirements
============

Depends on the [god cookbook](https://github.com/royratcliffe/god-cookbook).

Usage
=====

Run the cookbook's default recipe. It looks for Rails applications at `/srv`.
If you install such applications using the [`application_ruby`
cookbook](https://github.com/royratcliffe/application_ruby-cookbook), they
typically appear at `/srv` as a subfolder; although you can actually locate
them anywhere. The `resque_work` cookbook looks for such applications and adds
god-based Resque workers for each one.
