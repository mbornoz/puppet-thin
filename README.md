# Thin Puppet Module

This module manages [Thin](http://code.macournoyer.com/thin/) application server.

## Usage

You can install Thin as a web server in two ways, based on package management system (default behavior) or with gem packages:

    include thin # or class {'thin': package_type => 'package'}

or

    class {'thin': package_type => 'gem'}

The definition thin::app offers an easy way to configure and start your Rails application:

    thin::app {'myapp':
      ensure  => present,
      address => 'localhost',
      port    => '3001',
      chdir   => '/opt/myapp',
      user    => 'myapp',
      group   => 'myapp',
      rackup  => "/opt/myapp/config.ru",
      require => ...
    }

## Contributing

Please report bugs and feature request using [GitHub issue
tracker](https://github.com/camptocamp/puppet-thin/issues).

For pull requests, it is very much appreciated to check your Puppet manifest
with [puppet-lint](https://github.com/rodjek/puppet-lint) to follow the recommended Puppet style guidelines from the
[Puppet Labs style guide](http://docs.puppetlabs.com/guides/style_guide.html).

## License

Copyright (c) 2012 <mailto:puppet@camptocamp.com> All rights reserved.

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
    
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
