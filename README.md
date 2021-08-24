# render-zips

Render Zcash Improvement Proposals repository with these design goals:

The source ZIPs repository:

- only needs to provide source, not rendered output or other build outputs, and
- only needs to provide ZIP contents, not styling or site-specific presentation info.

This rendering tool:

- can work with the upsteam ZIPs repo (ignoring any committed renders or site-specific presentation),
- is not site-specific and can be used for any number of local renderings, websites, or other presentations,
- always keeps source ZIPs and rendered output cleanly separate on the filesystem, and
- only focuses on rendering, not on deployment such as providing a website.

Site-Specific Presentation and Deployment:

- can customize the renderings to fit the style and layout of the target site needs.

## Implementation

The rendering toolchain lives here. The current supported deployment for the rendering code is via docker to simplify system configuration and consistency across developer and deployment environments. The docker image uses local file system bindings to read ZIP source and write out ZIP renderings.
