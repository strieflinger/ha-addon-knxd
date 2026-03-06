# Home Assistant Add-on: KNXD daemon

[![License][license-shield]](LICENSE.md)

Bridge a USB or TPUART KNX interface to KNXnet/IP tunneling using [knxd](https://github.com/knxd/knxd).

## Installation

1. Add this repository to your Home Assistant add-on store:
   `https://github.com/strieflinger/ha-addon-knxd`
2. Install the **KNXD daemon** add-on.
3. Configure the options (see below), then start the add-on.

## Configuration

| Option | Default | Description |
|--------|---------|-------------|
| `interface` | `tpuart` | knxd driver to use: `tpuart` or `usb` |
| `device` | _(required)_ | Path to the KNX interface, e.g. `/dev/serial/by-id/usb-…`. If left empty the add-on logs all available devices and exits. |
| `address` | `7.0.100` | KNX individual address for the knxd daemon itself |
| `client_address` | `7.0.200:10` | Address range for tunnel clients (start:count) |
| `custom_config` | _(empty)_ | Full knxd.ini content to use instead of the generated config |

## Hardware

Any USB or TPUART KNX interface supported by knxd should work (e.g. Weinzierl USB, MDT SCN-USBR.02, Busware TUL).

Check the add-on log on first start — if `device` is not set it will list all detected serial devices by-id path to help you pick the right one.

## Contributing

Use [Conventional Commits](https://www.conventionalcommits.org/) for commit messages:

| Prefix | Before 1.0.0 | From 1.0.0 |
|--------|-------------|------------|
| `fix:` | patch bump (0.1.0 → 0.1.1) | patch bump (1.0.0 → 1.0.1) |
| `feat:` | minor bump (0.1.0 → 0.2.0) | minor bump (1.0.0 → 1.1.0) |
| `feat!:` / `BREAKING CHANGE:` | minor bump (0.1.0 → 0.2.0) | major bump (1.0.0 → 2.0.0) |
| `chore:`, `docs:`, `refactor:` | no version bump | no version bump |

## Attribution

Based on [palhaland/addon-knxd](https://github.com/palhaland/addon-knxd).

[license-shield]: https://img.shields.io/github/license/strieflinger/ha-addon-knxd.svg
