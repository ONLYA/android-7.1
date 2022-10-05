# android-7.1
Main repository with Android 7.1 releases

## Build
Build with

```
docker build https://github.com/ONLYA/android-7.1.git -t android-7.1
mkdir <PATH to the intended AOSP folder on host>
docker run --rm -it -v <PATH to the intended AOSP folder on host>:/android-7.1:rw android-7.1 bash
```

When it is inside the container bash, run:

```
~/init-repo-android7.sh
~/build.sh
```
