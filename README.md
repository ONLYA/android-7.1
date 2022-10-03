# android-7.1
Main repository with Android 7.1 releases

## Build
Build with

```
docker build https://github.com/ONLYA/android-7.1.git -t android-7.1
docker run -it -v `pwd`:/host-source android-7.1 bash
```

When it is inside the container bash, run:

```
~/init-repo-android7.sh
~/build.sh
```
