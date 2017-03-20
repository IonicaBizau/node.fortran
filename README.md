
# node.fortran

 [![Support me on Patreon][badge_patreon]][patreon] [![Buy me a book][badge_amazon]][amazon] [![PayPal][badge_paypal_donate]][paypal-donations] [![Version](https://img.shields.io/npm/v/node.fortran.svg)](https://www.npmjs.com/package/node.fortran) [![Downloads](https://img.shields.io/npm/dt/node.fortran.svg)](https://www.npmjs.com/package/node.fortran)

> Execute Node.js in your Fortran programs.

[![node.fortran](http://i.imgur.com/OszvGVi.png)](#)

You have to install [Node.js](https://nodejs.org/en/) on
your machine. In case you do not have a Fortran compiler,
you can install it by running:
```sh
# Ubuntu
sudo apt-get install gfortran
sudo apt-get install fort77

# OS X
brew install gcc
```

## :clipboard: Example



```fortran
      program nodejs_module_example
      use nodejs

      implicit none

        ! Let's execute a Node.js file
        call runNodejsPath("example/index.js", .false.);
        ! => "Hello from a Node.js file."

        print *, "An HTTP server is going to be started on port 9000."

        ! And now let's execute some Node.js code right here
        call runNodejs("const http = require('http');&
            &http.createServer((req, res) => {&
            &  res.end('Hello World from a Node.js server started&
            & from Fortran!')&
            &}).listen(9000);", .true.);

      end program nodejs_module_example
```

To compile the program, use:
```sh
gfortran path/to/nodejs.f90 your-file.f90
```

## :memo: Documentation

The `nodejs.f90` module exports the following subroutines:
### `runNodejs(code, waitForProcess)`

 - `code` (CHARACTER(len=100000)): The Node.js snippet to execute.
 - `waitForProcess` (logical): If `false`, the Node.js code will be executed in the background.
### `runNodejsFile(file, waitForProcess)`

 - `file` (CHARACTER(len=10000)): The Node.js file path.
 - `waitForProcess` (logical): If `false`, the Node.js code will be executed in the background.

## :yum: How to contribute
Have an idea? Found a bug? See [how to contribute][contributing].


## :sparkling_heart: Support my projects

I open-source almost everything I can, and I try to reply everyone needing help using these projects. Obviously,
this takes time. You can integrate and use these projects in your applications *for free*! You can even change the source code and redistribute (even resell it).

However, if you get some profit from this or just want to encourage me to continue creating stuff, there are few ways you can do it:

 - Starring and sharing the projects you like :rocket:
 - [![PayPal][badge_paypal]][paypal-donations]—You can make one-time donations via PayPal. I'll probably buy a ~~coffee~~ tea. :tea:
 - [![Support me on Patreon][badge_patreon]][patreon]—Set up a recurring monthly donation and you will get interesting news about what I'm doing (things that I don't share with everyone).
 - **Bitcoin**—You can send me bitcoins at this address (or scanning the code below): `1P9BRsmazNQcuyTxEqveUsnf5CERdq35V6`

    ![](https://i.imgur.com/z6OQI95.png)

Thanks! :heart:



## :sparkles: Related

 - [`fortran`](https://github.com/IonicaBizau/node-fortran)—Fortran bridge for Node.js which allows you to run Fortran code from Node.js.
 - [`cobol`](https://github.com/IonicaBizau/node-cobol)—COBOL bridge for NodeJS which allows you to run COBOL code from NodeJS.
 - [`node.cobol`](https://github.com/IonicaBizau/node.cobol#readme)—Node.js bridge for COBOL which allows you to run Node.js code from COBOL.


## :scroll: License

[MIT][license] © [Ionică Bizău][website]

[badge_patreon]: http://ionicabizau.github.io/badges/patreon.svg
[badge_amazon]: http://ionicabizau.github.io/badges/amazon.svg
[badge_paypal]: http://ionicabizau.github.io/badges/paypal.svg
[badge_paypal_donate]: http://ionicabizau.github.io/badges/paypal_donate.svg
[patreon]: https://www.patreon.com/ionicabizau
[amazon]: http://amzn.eu/hRo9sIZ
[paypal-donations]: https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=RVXDDLKKLQRJW
[donate-now]: http://i.imgur.com/6cMbHOC.png

[license]: http://showalicense.com/?fullname=Ionic%C4%83%20Biz%C4%83u%20%3Cbizauionica%40gmail.com%3E%20(https%3A%2F%2Fionicabizau.net)&year=2016#license-mit
[website]: https://ionicabizau.net
[contributing]: /CONTRIBUTING.md
[docs]: /DOCUMENTATION.md
