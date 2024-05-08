# Lightworks Flatpak

Following [some discussion on the LWKS
forum](https://forum.lwks.com/threads/lightworks-as-a-flatpak.250870/), I
decided to create a Flatpak package based on the `.deb` package. This repository
contains the manifest for that package.

From my (brief) testing, it seems to work fine so far. If you're brave enough to
test it, please report any bugs you find on [this issue
tracker!](https://github.com/kekkoudesu/lightworks-flatpak/issues)

## Install this Flatpak

Download the `lightworks.flatpak` bundle file from the Releases page and run:

```
flatpak install lightworks.flatpak
```

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

### Build a `.flatpak` Bundle

After building the Flatpak with `flatpak-builder`, export the build:

```
flatpak build-export export build-dir
```

Now create the bundle:

```
flatpak build-bundle export lightworks.flatpak com.lwks.Lightworks --runtime-repo=https://flathub.org/repo/flathub.flatpakrepo
```
