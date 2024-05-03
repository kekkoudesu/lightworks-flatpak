# Lightworks Flatpak

Following [some discussion on the LWKS
forum](https://forum.lwks.com/threads/lightworks-as-a-flatpak.250870/), I
attempted to create a Flatpak package as a proof-of-concept. This repository
contains the manifest for that package.

This package is based on the .deb package distributed by LWKS. It extracts the
files and pulls them into the Flatpak sandbox.

It is still in-progress.

## Current Progress

* Many of the dependencies Lightworks requires to function have been made
  available in the Flatpak sandbox. A few dependencies may be missing, but more
  testing needs to be done in order to find out.
* Doesn't launch due to `ntcardvt` looking for `strings.txt` (and other files)
  at `/usr/share/lightworks`. It shouldn't do this; it should look in the
  directories specified by `$XDG_DATA_DIRS`, which includes `/app/lib` when in
  the Flatpak sandbox. This change needs to be implemented by Lightworks, as
  `/usr/share` is not writable inside the Flatpak sandbox.

## Building & Developing the Flatpak Package

You need Flatpak Builder.

To build the package:

```
flatpak-builder build-dir --force-clean com.lwks.Lightworks.yaml
```

To install the package:

```
flatpak-builder build-dir --user --install --force-clean com.lwks.Lightworks.yaml
```

To run the package:

```
flatpak run com.lwks.Lightworks
```

To get a shell within the Flatpak sandbox for debugging purposes:

```
flatpak --command=sh --devel com.lwks.Lightworks
```
