completely compiled from scratch

offer an environment for software reinstallation from source


get architecture :

gcc -march=native -v -E - < /dev/null 2>&1 | grep cc1


diff -Naur Python-3.10.1.orig/Modules/Setup Python-3.10.1/Modules/Setup
