# Version

This action computes a semnatic version number based on existing tags.
The version number is exposed as an env var `VERSION` and as an output `version`.

The version is created by bumping the patch version of the latest existing tag.
If you specify a command that computes a minumum version number that is greater than the patch bump version, the former is used.

## Usage

```yaml
      - name: pre-commit
        uses: markushinz/actions/version@<version>
        # with:
        #   minimum_version_command: echo "1.2.3"
```
