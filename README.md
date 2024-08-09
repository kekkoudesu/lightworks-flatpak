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

### Got a Decklink? Install the BlackmagicLibs Extension too!

First, you should build the Lightworks Flatpak package. Make sure to uninstall any existing Lightworks packages with:

```
flatpak uninstall com.lwks.Lightworks
```

Install Flatpak Builder; it's usually available in your distribution's repositories.

Install org.freedesktop.Sdk//23.08:

```
flatpak install org.freedesktop.Sdk//23.08
```

Clone this repository:

```
git clone --recurse-submodules https://github.com/kekkoudesu/lightworks-flatpak.git
```

Move into the lightworks Flatpak directory:

```
cd lightworks-flatpak
```

Build and install the Lightworks package:

```
flatpak-builder build-dir --install --user --force-clean com.lwks.Lightworks.yaml
```

Download Desktop Video from the [Blackmagic
site](https://www.blackmagicdesign.com/support/download/b97e55f37a0042fbacd234971d8c93ed/Linux)
(click Download Only in the bottom left) to the `lightworks-flatpak` directory you just cloned.

Build and install the BlackMagicLibs extension:

```
flatpak-builder build-dir --install --user --force-clean com.lwks.Lightworks.BlackMagicLibs.json
```

Run Lightworks:

```
flatpak run -u com.lwks.Lightworks
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
