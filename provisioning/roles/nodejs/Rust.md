# Programming Languages

## ASDF

```python
- name: Clone asdf repository
  git:
    repo: git@github.com:asdf-vm/asdf.git
    dest: "~/.asdf"
    version: v0.7.4
```

## Use ASDF

### Go Programming Language

```python
- name: Add golang plugin to asdf
  command: "${HOME}/.asdf/bin/asdf plugin-add golang"
  register: golang_add
  failed_when: golang_add == 2

- name: Install golang {{go_version}} with asdf
  command: "${HOME}/.asdf/bin/asdf install golang {{item}}"
  loop: "{{go_versions}}"

- name: Set global version for golang to {{go_versions[0]}}
  command: "${HOME}/.asdf/bin/asdf global golang {{go_versions[0]}}"
```

## References

* [asdf version manager]()
