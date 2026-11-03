# Project X Boston Recovery

Project X Boston Recovery is a Boston-specific GitHub Actions recovery builder for the Motorola Moto G Stylus 5G 2024, codename `boston`.

This repository is configured for a Team Win Recovery Project (TWRP) build using the Boston device tree and defaults for this device.

## Boston defaults

- Recovery type: `twrp`
- Manifest URL: `https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git`
- Manifest branch: `twrp-12.1`
- Device tree URL: `https://github.com/PizzaG/android_device_motorola_boston.git`
- Device tree branch: `TWRP`
- Device path: `device/motorola/boston`
- Device name: `boston`
- Makefile: `twrp_boston`
- Build target: `recovery`
- Builder branding: `Project X Boston • Created by luhhcarrl2x`

## Build branding

The GitHub Actions build logs now print this banner during the recovery build process:

```text
============================================================
 Project X Boston Recovery Builder
 Created by luhhcarrl2x
 Device: boston | TWRP | Motorola Moto G Stylus 5G 2024
============================================================
```

This makes the build logs clearly identify the recovery project and creator while the job is running.

## How to run the build

1. Open the repository on GitHub.
2. Go to the Actions tab.
3. Select `Project X Boston Recovery Builder`.
4. Click `Run workflow`.
5. Leave the Boston defaults as-is and start the workflow.
6. Download the generated recovery image from the release output.

## Notes

- This repository is intentionally optimized for the Motorola Moto G Stylus 5G 2024 (`boston`).
- The actual recovery UI branding also needs to be embedded in the Boston device tree before final packaging.
- The build workflow is the recovery image generator. The final device-specific product branding lives in the TWRP device tree configuration.

---

Project X Boston Recovery
Built for the Motorola Moto G Stylus 5G 2024 (`boston`) recovery community.
