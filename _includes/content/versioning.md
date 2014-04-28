#  Versioning

In order to maintain dependencies, backward compatibility, and merges from pull requests, we follow the [Semantic Versioning](http://semver.org) guidelines. 

This means, each release gets pegged using the `<major>.<minor>.<patch>` format. It also means each release adheres strictly to the following guidelines:

* Breaking backward compatibility bumps the major and resets the minor and patch
* Adding new features or enhancements without breaking backward compatibility bumps the minor and resets the patch
* Bug fixes and miscellaneous changes bumps the patch
