
# node.fortran

 [![Patreon](https://img.shields.io/badge/Support%20me%20on-Patreon-%23e6461a.svg)][patreon] [![PayPal](https://img.shields.io/badge/%24-paypal-f39c12.svg)][paypal-donations] [![AMA](https://img.shields.io/badge/ask%20me-anything-1abc9c.svg)](https://github.com/IonicaBizau/ama) [![Version](https://img.shields.io/npm/v/node.fortran.svg)](https://www.npmjs.com/package/node.fortran) [![Downloads](https://img.shields.io/npm/dt/node.fortran.svg)](https://www.npmjs.com/package/node.fortran) [![Get help on Codementor](https://cdn.codementor.io/badges/get_help_github.svg)](https://www.codementor.io/johnnyb?utm_source=github&utm_medium=button&utm_term=johnnyb&utm_campaign=github)

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


## :moneybag: Donations

Another way to support the development of my open-source modules is
to [set up a recurring donation, via Patreon][patreon]. :rocket:

[PayPal donations][paypal-donations] are appreciated too! Each dollar helps.

Thanks! :heart:


## :sparkles: Related

 - [`fortran`](https://github.com/IonicaBizau/node-fortran)—Fortran bridge for Node.js which allows you to run Fortran code from Node.js.
 - [`cobol`](https://github.com/IonicaBizau/node-cobol)—COBOL bridge for NodeJS which allows you to run COBOL code from NodeJS.
 - [`node.cobol`](https://github.com/IonicaBizau/node.cobol#readme)—Node.js bridge for COBOL which allows you to run Node.js code from COBOL.



## :scroll: License

[MIT][license] © [Ionică Bizău][website]

[patreon]: https://www.patreon.com/ionicabizau
[paypal-donations]: https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=RVXDDLKKLQRJW
[donate-now]: http://i.imgur.com/6cMbHOC.png

[license]: http://showalicense.com/?fullname=Ionic%C4%83%20Biz%C4%83u%20%3Cbizauionica%40gmail.com%3E%20(http%3A%2F%2Fionicabizau.net)&year=2016#license-mit
[website]: http://ionicabizau.net
[contributing]: /CONTRIBUTING.md
[docs]: /DOCUMENTATION.md
