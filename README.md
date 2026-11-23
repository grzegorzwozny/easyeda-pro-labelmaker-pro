# Label Maker Pro for EasyEDA Pro

Create PCB silkscreen labels with cutout text for connectors, test points, and board markings. Shape each end, fine-tune the corners, and see the result before placing it on the board.

[Download v1.1.1 (.eext)](https://raw.githubusercontent.com/grzegorzwozny/easyeda-pro-labelmaker-pro/v1.1.1/build/dist/eext-labelmaker-pro_v1.1.1.eext) · [Changelog](CHANGELOG.md)

## See it in action

![Animated Label Maker Pro demo showing independent corner radii, mixed end shapes, bottom-layer mirroring, and the light and dark themes](docs/label-maker-pro-demo.gif)

Watch the label change as you round individual corners, combine flat and curved ends, and switch on bottom silkscreen mirroring. [View the animation on GitHub](https://github.com/grzegorzwozny/easyeda-pro-labelmaker-pro/blob/v1.1.1/docs/label-maker-pro-demo.gif)

## Features

- **Independent corner radii** for the top-left, top-right, bottom-left, and bottom-right corners of flat ends.
- **Live preview** for end shapes, text cutouts, dimensions in mil, and bottom silkscreen mirroring.
- **Typography and sizing** with font weight, local font files, padding, alignment, and three quality profiles.
- **Reusable presets** for consistent labels across a PCB, plus Light and Dark styling that follows EasyEDA Pro.

## Install or update in EasyEDA Pro 3.x

1. Download the `.eext` file at the top of this page or build it locally.
2. In EasyEDA Pro, open **Advanced → Extension Manager → Import** and select the `.eext` file.
3. To update an installed copy, import the new file over it. Under **Installed**, check that **Label Maker Pro 1.1.1** is enabled.
4. Open a PCB and choose **Label Maker → Open Label Maker…**. If **Show in top menu** is off, look under **Advanced**.

The update keeps your settings and presets. Presets from v1.0.0 start with square corners.

## Create a label

1. Set the text, font, weight, padding, and left and right end shapes. Dimensions use mil. **Width** sets a minimum width for the straight central section. Set it to **0** for automatic sizing.
2. Choose a flat end (`|`, `[`, or `]`) and expand **Corner radii (mil)**. Set each available corner independently. Zero leaves it square. Radii above half the label height are limited automatically and the preview shows the result.
3. Choose a silkscreen layer and a quality profile. **Bottom Mirror** horizontally flips the whole label on the bottom layer, including its corners. The live preview shows that orientation as viewed from the top of the PCB.
4. Click **Place Label**, move the label to the desired point on the PCB, and click to place it. Press **Esc** to cancel and return to the settings.

Use **Save As**, **Update**, and **Delete** to manage custom presets. **Load Font File** loads a local font for the current window session.

## Native Dark theme

![Label Maker Pro in EasyEDA Pro 3.2.209 with a dark interface and an ANT-01 label with rounded top corners](docs/label-maker-pro-dark.png)

The screenshot shows the extension running in EasyEDA Pro 3.2.209, with 20 mil radii on both top corners and square bottom corners. [View the full-size screenshot on GitHub](https://github.com/grzegorzwozny/easyeda-pro-labelmaker-pro/blob/v1.1.1/docs/label-maker-pro-dark.png)

## Build from source

With Node.js 20.17 or later:

```sh
npm ci
npm run build
```

The build creates `build/dist/eext-labelmaker-pro_v1.1.1.eext`.

## Extension Marketplace

To submit a new version, open **Extension Management → Upload Extension** on JLCEXT and select the `.eext` file. The marketplace uses the extension UUID to group versions under the same listing. [Official publishing guide](https://prodocs.easyeda.com/en/api/guide/extensions-marketplace.html)
