# CHANGELOG


## v0.3.0 (2025-05-11)

### Bug Fixes

- Add initial README.md with project overview, installation, and usage instructions
  ([`f3d09f2`](https://github.com/Danielcmc100/versoes_python/commit/f3d09f2f3b462002849c6de9c0ddb057fe01f116))

- Correct comment formatting in Jenkinsfile for clarity
  ([`d50ff7c`](https://github.com/Danielcmc100/versoes_python/commit/d50ff7cd76cda21deaf63e3327198da8ae747dec))

- Improve comments and ensure correct branch checkout in Jenkinsfile for semantic release
  ([`d22e875`](https://github.com/Danielcmc100/versoes_python/commit/d22e87570ac39cc86b3bbf8f76c01248e7d680c3))

- Remove redundant git configuration for semantic-release in Jenkinsfile
  ([`819208c`](https://github.com/Danielcmc100/versoes_python/commit/819208cf42004a3f58fdc479356a814d348dd4e1))

- Simplifies and cleans up CI release pipeline
  ([`3e37cd1`](https://github.com/Danielcmc100/versoes_python/commit/3e37cd1a8cc6a9aaa49895e0d460a5bc5f6c7d9e))

Removes redundant dry-run stage and unused environment variables. Consolidates credential usage for
  releases and trims legacy comments for a more maintainable and straightforward pipeline.

### Chores

- Add Dockerfile and docker-compose for Jenkins setup
  ([`7739027`](https://github.com/Danielcmc100/versoes_python/commit/7739027086883a81056eff4c019814115c8efce7))

- Add Git installation to Dockerfile for Jenkins setup
  ([`ab2db6d`](https://github.com/Danielcmc100/versoes_python/commit/ab2db6dd7d59701c80cb3ef4b0c2b24514aad829))

- Clear repo_dir path in pyproject.toml for better portability
  ([`f4cb50b`](https://github.com/Danielcmc100/versoes_python/commit/f4cb50b1d02fde29d9ccbb92527822463322057e))

- Correct environment variable name from GITHUB_TOKEN to GH_TOKEN in Jenkinsfile
  ([`b3642d7`](https://github.com/Danielcmc100/versoes_python/commit/b3642d715a9b23855bf0c8a45dfc374e53e081ec))

- Removes redundant checkout stage from pipeline
  ([`f883703`](https://github.com/Danielcmc100/versoes_python/commit/f8837036a28820746b254c42d203807dd9cf2b81))

Simplifies CI workflow by eliminating the separate checkout step, assuming source retrieval is
  handled elsewhere or deemed unnecessary.

### Features

- Correct formatting in project description in README.md
  ([`f8986d0`](https://github.com/Danielcmc100/versoes_python/commit/f8986d0326e90757cdfc33f3d7a5cfd412e2118b))

- Enhance Jenkinsfile with semantic release stages for PR checks and publishing
  ([`93d427e`](https://github.com/Danielcmc100/versoes_python/commit/93d427e1af81df69d240066dea3c459efdfba6eb))


## v0.2.0 (2025-05-08)

### Features

- Updates greeting message for feature enhancement
  ([`3e6c42d`](https://github.com/Danielcmc100/versoes_python/commit/3e6c42d3602ccaa22930095214cbdeacdbb90c09))

Modifies the output message to reflect feature progression and improve user clarity during
  execution.

- Updates greeting message to version 4
  ([`805ce38`](https://github.com/Danielcmc100/versoes_python/commit/805ce38cf5ccef4ae6758c4414e6e69c5c261140))

Increments version number in greeting output to reflect the latest release.


## v0.1.0 (2025-05-08)

### Features

- Updates semantic release token config and resets version
  ([`1434d34`](https://github.com/Danielcmc100/versoes_python/commit/1434d3436676ff418f960584dbd9f6d351fa8eb1))

Moves the remote token configuration inline for clarity and compatibility. Resets the package
  version to 0.0.0 to prepare for initial release and versioning automation.


## v0.0.0 (2025-05-08)
