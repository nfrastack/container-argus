## 1.5.16 2024-04-23 <dave at tiredofit dot ca>

   ### Added
      - Release Argus 0.17.3


## 1.5.15 2024-04-15 <dave at tiredofit dot ca>

   ### Added
      - Release Argus 0.17.2


## 1.5.14 2024-04-14 <dave at tiredofit dot ca>

   ### Added
      - Release Argus 0.17.1


## 1.5.13 2024-04-14 <dave at tiredofit dot ca>

   ### Added
      - Release Argus 0.17.0


## 1.5.12 2024-02-24 <dave at tiredofit dot ca>

   ### Added
      - Argus 0.16.0


## 1.5.11 2024-01-17 <dave at tiredofit dot ca>

   ### Added
      - Release Argus 0.15.2


## 1.5.10 2024-01-12 <dave at tiredofit dot ca>

   ### Added
      - Release Argus 0.15.1


## 1.5.9 2024-01-09 <dave at tiredofit dot ca>

   ### Added
      - Release Argus 0.15.0


## 1.5.8 2024-01-06 <dave at tiredofit dot ca>

   ### Added
      - Argus 0.14.0
      - Alpine 3.19 Base


## 1.5.7 2023-09-12 <dave at tiredofit dot ca>

   ### Added
      - Argus 0.13.3


## 1.5.6 2023-07-19 <dave at tiredofit dot ca>

   ### Added
      - Release Argus 0.13.2


## 1.5.5 2023-07-19 <dave at tiredofit dot ca>

   ### Added
      - Release Argus 0.13.1


## 1.5.4 2023-07-11 <dave at tiredofit dot ca>

   ### Added
      - Release Argus 0.13.0


## 1.5.3 2023-06-19 <dave at tiredofit dot ca>

   ### Changed
      - Argus 0.12.1


## 1.5.2 2023-06-01 <dave at tiredofit dot ca>

   ### Added
      - Release Argus 0.12.0


## 1.5.1 2023-05-10 <dave at tiredofit dot ca>

   ### Changed
      - Alpine 3.18 base


## 1.5.0 2023-04-26 <dave at tiredofit dot ca>

   ### Added
      - Add support for _FILE environment variables


## 1.4.1 2023-03-18 <dave at tiredofit dot ca>

   ### Changed
      - Fix mismatch between DEFAULT_SERVICE_LATEST_VERSION_ACCESS_TOKEN


## 1.4.0 2023-03-16 <dave at tiredofit dot ca>

   ### Added
      - Add capability to serve /images/ from the Nginx configuration (/www/html/images)


## 1.3.0 2023-02-09 <dave at tiredofit dot ca>

   ### Added
      - Add DEFAULT_SERVICE_CHECK_INTERVAL environment variable
      - Add DEFAULT_SERVICE_LATEST_VERSION_ACCESS_TOKEN environment variable


## 1.2.3 2023-01-13 <dave at tiredofit dot ca>

   ### Added
      - Argus 0.11.1


## 1.2.2 2023-01-12 <dave at tiredofit dot ca>

   ### Changed
      - Fix for config watchdog


## 1.2.1 2023-01-11 <dave at tiredofit dot ca>

   ### Changed
      - Remove /build-assets from final container


## 1.2.0 2023-01-06 <dave at tiredofit dot ca>

   ### Added
      - Add build-assets directory for doing customizations upon building Dockerfile
      - Introduce custom_files capability to overlay files in filesystem upon container start
      - Introduce custom_scripts capability to execute scripts in container before process starts


## 1.1.0 2023-01-05 <dave at tiredofit dot ca>

   ### Added
      - Add RESTART_ON_CONFIG_CHANGE environment variable to detect configuration file changes

   ### Changed
      - Update examples
      - Change nginx reverse proxy configuration to better support HTTP 1.1 / WSS


## 1.0.0 2023-01-05 <dave at tiredofit dot ca>

   ### Added
      - Initial Release
      - Auto configuration Support
      - Argus 0.11.0
      - Nginx Reverse Proxy embedded for better authentication and options


