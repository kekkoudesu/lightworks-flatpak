# Lightworks Flatpak

Following [some discussion on the LWKS
forum](https://forum.lwks.com/threads/lightworks-as-a-flatpak.250870/), I
decided to create a Flatpak package based on the `.deb` package. This repository
contains the manifest for that package.

It's been working great for me so far. If you're brave enough to test it,
please report any bugs you find on [this issue
tracker!](https://github.com/kekkoudesu/lightworks-flatpak/issues)

## Install this Flatpak

Download the `lightworks.flatpak` bundle file from the [Releases
page](https://github.com/kekkoudesu/lightworks-flatpak/releases/latest) and
double click it to install with GNOME Software or KDE Discover.

Or run:

```
flatpak install lightworks.flatpak
```

### Decklink Support

I've bundled the Blackmagic Libraries with the Flatpak package, which seems to
work for users with Decklinks.

If you have a Decklink, install [this
flatpak](https://github.com/kekkoudesu/lightworks-flatpak/releases/download/v0.2/lightworks-decklink.flatpak).

All Flatpaks produced moving forward will contain the Blackmagic Libraries for
Decklink compatibility by default; there won't be a separate Flatpak.

#### Building With Decklink Support

When building this package, you need to download the Blackmagic libraries to the
same directory, available at this link:
https://www.blackmagicdesign.com/support/download/b97e55f37a0042fbacd234971d8c93ed/Linux

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
