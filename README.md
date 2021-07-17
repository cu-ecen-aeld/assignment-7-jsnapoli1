# Overview

This repository contains assignment starter code for buildroot based assignments for the course Advanced Embedded Software Design, ECEN 5713.

It also contains instructions related to modifying your buildroot project to use with supported hardware platforms. See [this wiki page](https://github.com/cu-ecen-5013/buildroot-assignments-base/wiki/Supported-Hardware) for details.

## Assignment 4 Part 2 Summary

### Architecture-level updates
- Added a complete Buildroot external tree interface (`external.desc`, `Config.in`, `external.mk`) under `base_external` using `project_base` as the external name.
- Completed the `aesd-assignments` package integration using Buildroot `generic-package` + git site method over SSH, including installation of `writer`, `finder.sh`, `tester.sh`, and `finder-test.sh` into `/usr/bin`.
- Added host automation scripts to standardize clean/configure/build/boot workflows:
  - `clean.sh` for `distclean`
  - `configure-ssh-build.sh` for menuconfig-driven SSH image setup + validation + build
  - `boot-test-cycle.sh` for full clean/build/build/boot orchestration
- Updated build policy to use `${HOME}`-relative cache/download paths (`BR2_DL_DIR=${HOME}/.dl`, `${HOME}/.buildroot-ccache`) to improve rebuild speed and portability.

### Work log (hash + date)
- `1e30a17` — 2026-02-07 — Baseline repository state with buildroot submodule registration.
- `f476c87` — 2026-02-07 — Added external package integration, finder test script behavior updates, and assignment automation/report artifacts.

## Assignment 5 Part 1 Summary

### Architecture-level updates
- Extended `aesd-assignments` Buildroot package build rules to compile both `finder-app` and `server` with `TARGET_CONFIGURE_OPTS`, ensuring `aesdsocket` is cross-compiled for the target architecture.
- Extended install rules to stage `aesdsocket` at `/usr/bin/aesdsocket` and register `aesdsocket-start-stop` as `/etc/init.d/S99aesdsocket` for boot-time service management.
- Updated `runqemu.sh` networking to keep SSH passthrough (`10022 -> 22`) and add socket forwarding (`9000 -> 9000`) so host tools can reach the VM service directly.
- Added assignment planning and review artifacts (`plan-assignment5-part1.md`, `code-review-assignment5-part1.md`) documenting pseudocode-driven implementation and engineering rationale.

### Work log (hash + date)
- `d5fc178` — 2026-02-14 — Implemented assignment 5 part 1 package, QEMU forwarding, and technical planning/review documentation.

### Codex Links:
https://chatgpt.com/s/cd_69928af6840c819186a4e668113ca0b0

---

ldd3: Linux Device Drivers 3 examples updated to work with recent kernels

# About

Linux Device Drivers 3 (http://lwn.net/Kernel/LDD3/) book is now a few years
old and most of the example drivers do not compile in recent kernels.

This project aims to keep LDD3 example drivers up-to-date with recent kernels.

The original code can be found at: http://examples.oreilly.com/9780596005900/

# Compiling

The example drivers should compile against latest Linus Torvalds kernel tree:
* git://git.kernel.org/pub/scm/linux/kernel/git/sfr/linux-next.git

To compile the drivers against a specific tree (for example Linus tree):
```
$ git clone git://github.com/martinezjavier/ldd3.git
$ git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
$ export KERNELDIR=/path/to/linux
$ cd ldd3
$ make
```

Bugs, comments or patches: See https://github.com/martinezjavier/ldd3/issues

# Latest Tested Kernel Builds

The kernel builds below are the versions most recently tested/supported

* Ubuntu 18.04 kernel as of July 2020: 5.4.0-42-generic
* Ubuntu 20.04 kernel as of July 2021: 5.4.0-73-generic
* Yocto poky warrior branch kernel for qemu aarch64 builds: 5.0.19
* Yocto poky hardknott branch kernel for qemu aarch64 builds: 5.10.46
* Buildroot 2019.05 kernel for qemu builds: 4.9.16
* Buildroot 2021.02 kernel for qemu builds: 5.10
* Alpine 3.13 kernel as of May 2021: 5.10.29-lts, see [here](https://github.com/ericwq/gccIDE/wiki/ldd3-project) for detail.


# Eclipse Integration

Eclipse CDT integration is provided by symlinking the correct linux source directory with the ./linux_source_cdt symlink.
The .project and .cproject files were setup using instructions in [this link](https://wiki.eclipse.org/HowTo_use_the_CDT_to_navigate_Linux_kernel_source)
and assuming a symlink is setup in the local project directory to point to relevant kernel headers

This can be done on a system with kernel headers installed using:
```
ln -s /usr/src/linux-headers-`uname -r`/ linux_source_cdt
```
