# Lightworks Flatpak

Following [some discussion on the LWKS
forum](https://forum.lwks.com/threads/lightworks-as-a-flatpak.250870/), I
decided to create a Flatpak package based on the `.deb` package. This repository
contains the manifest for that package.

It's been working great for me so far. If you're brave enough to test it,
please report any bugs you find on [this issue
tracker!](https://github.com/kekkoudesu/lightworks-flatpak/issues)

## Install this Flatpak

Download the `lightworks.flatpak` bundle file from the [Releases page](https://github.com/kekkoudesu/lightworks-flatpak/releases/latest) and run:

```
flatpak install lightworks.flatpak
```

### Decklink Support (?)

I don't have a Decklink device to test, but I've bundled the Blackmagic
Libraries with the Flatpak package. Loading the libDeckLinkAPI.so file with
`LD_PRELOAD` seems to make the errors go away, but I don't know if it will
actually lead Lightworks to load and use the Decklink if it's detected on the
system.

If you have a Decklink, please give [this
flatpak](https://github.com/kekkoudesu/lightworks-flatpak/releases/download/v0.2/lightworks-decklink.flatpak)
a try. Please let me know if it actually works through [this
issue](https://github.com/kekkoudesu/lightworks-flatpak/issues/1).

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
flatpak run --command=sh --devel com.lwks.Lightworks
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
