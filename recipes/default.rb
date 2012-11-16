#
# Cookbook Name:: resque_work
# Recipe:: default
#
# Copyright 2012, Pioneering Software, United Kingdom
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'god'

# Identify the Resque worker applications. Do this in an automatic way. Expect applications to live in a folder. By default look for them at /srv. If a folder matches the pattern /srv/APP_NAME/current, then assume that it contains a Rails app needing some Resque work! Beware of backups; move them out of the /srv folder.
Dir["/srv/*/current"].each do |rails_root|
  app_name = ::File.basename(::File.dirname(rails_root))
  god_monitor "#{app_name}_resque" do
    config "resque.god.erb"
    max_memory 150
    cpu 50
    rails_root rails_root
    app_name app_name
  end
end
