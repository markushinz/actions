# workflow-mutex

> The current implementation uses GitHub draft releases which do not garantuee release name uniqueness.
  Therefore, this workflow can only drastically reduce the likelihood of parallel workflow runs but not fully prevent them.

This action tries (!) to synchronize workflow runs.
It blocks subsequent workflow steps while a GitHub release "lock" exists (giving up after approx. 10 min).
If no release "lock" exists, it gets created and subsequent workflow steps are executed.
Finally, the release "locks" gets deleted.

This action is implemented as a Docker container action as composite actions do not support post steps.

## Usage

```yaml
      - name: Workflow Mutex
        # if: ${{ github.event_name == 'push' && github.ref == 'refs/heads/main' }}
        uses: markushinz/actions/workflow-mutex@<version>
```
