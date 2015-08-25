Setup Eclipse with PHPUnit, MakeGood, and XDebug
================================================

Posted on [March 24,
2014](https://eefic.wordpress.com/2014/03/24/setup-eclipse-with-phpunit-makegood-and-xdebug/ "8:57 pm")
by
[rongxin1989](https://eefic.wordpress.com/author/rongxin1989/ "View all posts by rongxin1989")

Unit testing and debugging are essential to developing a robust software
system or module. As a fan of Eclipse, I was curious: how do I combine
all these functions together in Eclipse? While trying to set up an ideal
program development environment with all these components on my Mac
system, I searched online and tried to follow a lot of tutorials, and
ran into numerous strange problems. After rounds and rounds of tweaking,
I finally figured out how to make these components seamlessly work
together. Here is my solution.

System used for this tutorial:  Mac OS X 10.8. Assuming you already have
MAMP and XDebug installed.

For Mac OS X versions prior to 10.8, please first install pear and
XDebug by referring to this wonderful blog (only follow the sections
related to pear and
xdebug):[ http://www.newmediacampaigns.com/page/install-pear-phpunit-xdebug-on-macosx-snow-leopard](//www.newmediacampaigns.com/page/install-pear-phpunit-xdebug-on-macosx-snow-leopard " http://www.newmediacampaigns.com/page/install-pear-phpunit-xdebug-on-macosx-snow-leopard")

For **Ubuntu**, see this definitive guide:
[http://chrisrogers.me.uk/blog/eclipse-phpunit-xdebug-makegood-and-ubuntu-php-unit-testing/](http://chrisrogers.me.uk/blog/eclipse-phpunit-xdebug-makegood-and-ubuntu-php-unit-testing/).
After you go through the procedure, you would also need to run the
following commands.

```
sudo pear channel-discover pear.symfony.com
sudo pear install pear.symfony.com/Yaml
sudo pear upgrade-all
```

* * * * *

Without further due, let’s get started!

Step 1: install pear:
---------------------

-   In terminal, go to any folder (e.g., cd \~/)
    -   Run:**curl -O
        [http://pear.php.net/go-pear.phar](http://pear.php.net/go-pear.phar)**
    -   Run:**sudo php -d detect\_unicode=0 go-pear.phar**
-   When prompted with the installation locations,
    -   change the “1. Installation base” setting to **/usr/local/pear**
    -   change the “4. Binary directory” setting to **/usr/bin**
    -   change the “5. PHP code directory (\$php\_dir)” setting
        to**/usr/share/php**
-   When prompted “**Would you like to alter php.ini
    \</private/etc/php.ini\>? [Y/n]** “, hit Y.
-   Run: sudo vim /etc/php.ini
    -   Make sure that you have a line like this:
        “include\_path=”.:/usr/share/php”
-   Reference:
    -   [http://pear.php.net/manual/en/installation.getting.php](http://pear.php.net/manual/en/installation.getting.php)
    -   [http://stackoverflow.com/questions/5334251/where-do-pear-packages-normally-get-installed](http://stackoverflow.com/questions/5334251/where-do-pear-packages-normally-get-installed)
    -   [http://mhorner.blogspot.com/2011/09/installing-phps-pear-on-macos-lion.html](http://mhorner.blogspot.com/2011/09/installing-phps-pear-on-macos-lion.html)
    -   [http://tyler.io/2008/01/how-to-install-pear-in-mac-os-x-leopard/](http://tyler.io/2008/01/how-to-install-pear-in-mac-os-x-leopard/)

Step 2: install PHPUnit
-----------------------

 

-   In terminal, go to any folder (e.g., cd \~/)
-   Run: **sudo pear config-set auto\_discover 1**
-   Run: **sudo pear install –alldeps pear.phpunit.de/PHPUnit**
    -   It may indicate “installation failed” If you have already
        installed phpunit, in this case you can first uninstall it by
        running the following command before installing it: **sudo pear
        uninstall pear.phpunit.de/PHPUnit**
-   Run: **sudo pear install phpunit/DbUnit**
-   Reference:
    -   [http://phpunit.de/manual/current/en/installation.html](http://phpunit.de/manual/current/en/installation.html)

Step 3: install Eclipse
-----------------------

-   Go to
    [http://www.eclipse.org/downloads/](http://www.eclipse.org/downloads/)
    and download the latest Eclipse Standard version.
-   Unzip it, and move the generated eclipse directory to /Applications/
-   Open /Applications/eclipse/eclipse.app, and select keep it in dock
    in the launch bar if you would like

Step 4: install Eclipse plugins
-------------------------------

-   In Eclipse, go to menu, select Help \> Install New Software
-   First check everything on the bottom (e.g., “Show only the latest
    versions of available software”
-   In “Work with”, choose something like “Kepler –
    [http://download.eclipse.org/releases/kepler&\#8221](http://download.eclipse.org/releases/kepler&#8221);,
    then install the following plugins
    -   Programming Languages:
        -   PHP Development Tools (PDT)
    -   Web, XML, Java EE and … Tools
        -   Eclipse Web Developer Tools
-   Click “Next”, “Next”, then accept all licence agreements
-   When prompted, restart Eclipse

Step 5: install MakeGood
------------------------

-   In Eclipse, go to menu, select Help \> Install New Software
-   Select “work with”:
    [http://eclipse.piece-framework.com/](http://eclipse.piece-framework.com/)
-   Select MakeGood to install
-   When prompted to select if you trust the external source, select yes
-   When prompted, restart Eclipse

Step 6: Setup Eclipse and MakeGood for UnitTesting
--------------------------------------------------

-   Eclipse -\> Preference
    -   PHP \> PHP Executables:
        -   Name: PHP CLI
        -   Executable Path: /etc/bin/php  (in terminal, use “which php”
            to find the actual path)
        -   PHP ini file: /etc/php.ini  (yours might be in a different
            location, in terminal, run ‘php -i | grep “php.ini” ‘ and
            check from the result, look for a line that looks like
            “Configuration File (php.ini) Path =\> /etc”)
        -   SAPI Type: CLI
        -   PHP Debugger: XDebug
-   PHP \> Debug:
    -   PHP Debugger: XDebug
    -   Server: anything
    -   PHP Executable: PHP CLI (if it shows nothing, restart Eclipse
        and check again)
    -   Enable CLI Debug, check.
    -   Uncheck “Break at First Line”
-   PHP \> PHP Libraries:
    -   New:
        -   name it “PEAR”
        -   Check “Add to environment”
    -   Add external folder
        -   select: /usr/share/php
-   Your Project -\> Properties (For metrics, I already did this step)
    -   PHP Include Path: add library -\> User Library -\> PEAR
    -   MakeGood
        -   Add test folder (could be any folder)
        -   PHPUnit -\> set xml, refer to [this
            page](http://www.phpunit.de/manual/current/en/appendixes.configuration.html)
            for instructions. If you do not add this, it also works.
-   Reference:
    [http://chrisrogers.me.uk/blog/eclipse-phpunit-xdebug-makegood-and-ubuntu-php-unit-testing/](http://chrisrogers.me.uk/blog/eclipse-phpunit-xdebug-makegood-and-ubuntu-php-unit-testing/)

Step 7: Some additional settings
--------------------------------

You also need add the following things to the end of your current
php.ini

    xdebug.remote_enable=on
    xdebug.remote_host="localhost"
    xdebug.remote_port=10000
    xdebug.remote_handler="dbgp"

And then restart MAMP servers.

Step 8: Open MakeGood
---------------------

-   In menu, select Window -\> Show View -\> Other -\> MakeGood
-   If you are lucky, you should be able to see “Waiting for a test
    run…” displayed in MakeGood
-   If you get an error like “PHPUnit\_Framework\_TestCase not
    available, fix…”, then the Eclipse may need to refresh its index on
    included libraries. To clean up and rebuild index, do the following
    -   In your project property -\> PHP Include Path -\> Library,
        remove the user library.
    -   Close Eclipse
    -   In terminal, cd into your Eclipse workspace
    -   Run rm .metadata/.plugins/org.eclipse.dltk.core.index.sql.h2/\*
    -   Open Eclipse
    -   Wait for a few minutes before the index rebuilding is done (you
        may be able to the status bar on the bottom right showing that
        index is building).
    -   In your project property -\> PHP Include Path -\> Library, add
        your user library back on.
-   Reference:
    [https://github.com/piece/makegood/issues/17](https://github.com/piece/makegood/issues/17)

Notes:
------

-   By default, PHPUnit will run all tests whenever you save your file.
    Turn this feature off by clicking on the “power” button on the top
    right of the MakeGood view.

Happy unit testing!

If you still have any question, please feel free to leave a comment
below and I will do my best to help you figure it out!
