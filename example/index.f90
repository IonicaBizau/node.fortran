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
