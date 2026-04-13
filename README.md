
# Emvicy Installers 

## Overview

- [Emvicy2 `ddev`](#emvicy2ddev)

---

## Emvicy2 `ddev` <a id="emvicy2ddev"></a>

_🛈 This command installs Emvicy2 at the location where it gets called and configures and runs it as a ddev project._  
~~~bash
bash <(curl -s https://raw.githubusercontent.com/emvicy/Installers/refs/heads/main/Emvicy_2.x_ddev.sh);
~~~

A bash prompt will ask for:

- (primary) Module Name
- Project Name

**disclaimer**
- I do not accept responsibility for any damage, errors or anything whatsoever caused by running or using this script.
- You use this script at your own risk.


**Example**

_Module Name=`Foo`, Project Name=`Emvicy_2.x_Foo`_  
~~~
Emvicy_2.x_Foo
    application
    config
    modules
        Foo
    public
~~~
- will be at least callable via ddev like `https://emvicy-2.x-foo.ddev.site`

**Includes**

- All official _stable_ modules are included and ready to use  
  - Email https://github.com/emvicy/Email
  - Idolon https://github.com/emvicy/Idolon
  - OpenApi https://github.com/emvicy/OpenApi
  - Paginator https://github.com/emvicy/Paginator
  - Phormix https://github.com/emvicy/Phormix
  - Ws https://github.com/emvicy/Ws
- All 3rd party libraries are getting installed during that process. 

**Requirements**

- git
- docker
- ddev
- bash
- curl

Find out more about <a href="https://ddev.com/" target="_blank">ddev</a> and how to install. If you are not yet familiar with this great tool, I highly recommend that you take a look at it. It will make your development much easier.
