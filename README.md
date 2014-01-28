#puppet-nslcd

####Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What Nslcd affects](#what-nslcd-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with Nslcd](#beginning-with-Nslcd)
4. [Usage](#usage)
5. [Limitations](#limitations)
6. [TODOs](#TODOs)

##Overview

This small nslcd module manages the nslcd service.

Written for Puppet >= 3.4.0.

##Module Description

See [Overview](#overview) for now.

##Setup

###What Nslcd affects

* nslcd :-) 

###Setup Requirements

Nothing special.
	
###Beginning with Nslcd	

Simply include it.

##Usage

Just include the module by 

```puppet
include nslcd
```

Configure it through hiera or declare it resource-like with the parameters set, e.g.:

```puppet
class { 'nslcd':
  ...
}
```

##Limitations:

Debian like systems. 
Tested on:

* Debian 7

Puppet Version >= 3.4.0, due to specific hiera usage.

##TODOs:

* Make it work on RedHat like systems.
