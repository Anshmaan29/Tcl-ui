# Verified local launcher build

Built from the saved source using JDK 17, Gradle 8.9, Android SDK platform 34/build-tools 34.0.0. Downloaded SDK/Gradle archives verified against their published SHA-256 checksums. Initial dependency download failed with DNS/TLS errors; the successful retry reused cached dependencies.

Command: `./gradlew --no-daemon --max-workers=4 testReleaseUnitTest lintRelease assembleRelease`.

- Build successful.
- 190 JVM tests; zero failures/errors.
- Android lint: zero errors, 74 warnings from the existing launcher.
- Release APK signed with the local development key: 485,631 bytes (under the 491,520-byte upstream size gate).
- APK SHA-256: `12d53d87ab21032b553fe64a75a810debb0cc7e98c5087267c5ba10c1ee44bee`.
- APK and private signing key are local, excluded from Git. Source/build scripts are saved here.

Installation, real-device launcher screenshots, Home takeover and reboot/remote checks still pending at this checkpoint.
