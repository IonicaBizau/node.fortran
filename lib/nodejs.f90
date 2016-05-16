      !-----------------------------------------------------------------!
      ! This is a Node.js bridge for Fortran.                           !
      ! Using this module you can run Node.js in your Fortran programs. !
      !-----------------------------------------------------------------!
      module nodejs
      implicit none

      contains
         ! Runs a Node.js snippet.
         subroutine runNodejs(code, waitForProcess)
            character (len=*)::code
            character (len=10000)::command
            logical::waitForProcess
            command = 'node -e "' // code // '"'
            call execute_command_line (command, wait=waitForProcess)
         end subroutine runNodejs

         ! Runs a Node.js file.
         subroutine runNodejsPath(path, waitForProcess)
            character (len=*)::path
            character (len=1000)::command
            logical::waitForProcess
            command = 'node "' // path // '"'
            call execute_command_line (command, wait=waitForProcess)
         end subroutine runNodejsPath

      end module nodejs

