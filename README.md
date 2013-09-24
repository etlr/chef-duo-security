duo-security Cookbook
=====================
This cookbook is used to install and configure duosecurity's login_duo application which enables two factor authentication on your servers.

You can find the manual installation/configuration steps here:
 https://www.duosecurity.com/docs/duounix

Caveats
-------
- This cookbook has been tested on Debian 6.0.4 and 7.0, several Ubuntu platforms, as well as CentOS and RHEL.

Note: This cookbook does not currently work on Ubuntu 9.04.

Requirements
------------
-This cookbook requires the openssh cookbook for the ssh configuration portion.
-This cookbook requires the build-essential cookbook. Certain OS's can require package dependencies and may vary depending on which version of the OS you are running.
-This cookbook installs the following libraries: libssl-dev and libpam-dev.

#### packages
- `libssl-dev` - Duo Security requires that this package be installed.
- `libpam-dev` - Duo Security requires that this package be installed.

Attributes
----------
This cookbook uses several default attributes for the installation/configuration of duo security's duo_unix app.
You can override these default attributes through direct node attributes if you would like.
It may be beneficial to use your own node attributes for different environments -- for example: a group of database servers with their own roles.

I recommend that you use a different 'integration' for each environment that you use in your infrastructure.

More on integrations here: https://www.duosecurity.com/docs/getting_started

#### duo-security/attributes/default.rb
default['duosecurity']['ikey']
default['duosecurity']['skey']
default['duosecurity']['host']

default['openssh']['server']['force_command']

default['duosecurity']['duo_unix']['url']

The version and checksum attributes are currently static to make sure you are downloading the correct file.
If you want the latest version of duo_unix, you'll need to increment the version number here as well as grab the correct checksum;
default['duosecurity']['duo_unix']['version']
default['duosecurity']['duo_unix']['checksum']

if platform?("ubuntu", "debian")
  default['duosecurity']['config_dir']
elsif platform?("redhat", "centos",  "fedora")
  default['duosecurity']['config_dir']
end


Usage
-----
#### duo-security::default
There is only one cookbook at this time. This automates all the two-factor authentication things for you.

e.g.
Just include `duo-security` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[duo-security]"
  ]
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Author:: [Eli Taylor] (<etaylor@kickbackpoints.com>)
IRC:: Liquid-- on freenode

Copyright 2013, KickBack Points, LLC

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

