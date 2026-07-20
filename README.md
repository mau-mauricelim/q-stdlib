# q Standard Library

The **q Standard Library** is a community effort to build a shared, open collection of libraries for the q language.

Its goal is simple:

> Write once. Run on any compatible q implementation.

The library is intended to work across multiple q runtimes wherever practical, including:

* KX q
* https://lv1.sh/
* Korze
* PeachQ
* Other compatible q implementations

This project is **implementation-neutral**. It is not owned by any single runtime and aims to strengthen the entire q ecosystem through shared APIs, reusable libraries and common conventions.

## Goals

* Portable libraries that work across q implementations and operating systems (where possible).
* Stable, well-documented APIs.
* Minimal dependencies.
* Comprehensive automated tests.
* Open development and community discussion.
* Permissive licensing suitable for commercial and open-source use.

## Initial Areas

The first modules are expected to include:

* Logging
* HTTP
* Date & time utilities
* Testing
* Help

Additional modules will be proposed and developed as the community grows.

## Compatibility

Wherever possible, libraries should behave consistently across supported runtimes.
A compatibility test suite will help ensure behaviour remains consistent over time.

## Design Principles

* Q is an old language. We will reuse existing frameworks where they exist.
* We will learn and reuse from other languages in similar areas.
* Small, composable modules.
* Consistent naming conventions.
* Backwards compatibility whenever practical.
* Prefer clear APIs over clever ones.
* Optimise for readability and maintainability.

## Contributing

Contributions are welcome.

In particular we're looking for people interested in:

* Library design
* API review
* Documentation
* Compatibility testing
* Performance improvements
* Example applications
* Testing across multiple q implementations

Before implementing a substantial new module, please open a discussion so the API can be reviewed by the community.

## Long-Term Vision

The q language has inspired multiple implementations over the years.

Rather than each implementation reinventing common libraries, this project aims to provide a shared foundation that benefits everyone.

Whether you're using PeachQ, KX q or another compatible implementation, we hope these libraries help make the q ecosystem more portable, more collaborative and easier to build upon.

# Existing Resources

 - https://github.com/BuaBook/kdb-common/tree/master
 - https://github.com/DataIntellectTech/TorQ
 - https://github.com/finos/kdb

Together, we can build an open ecosystem for q.
