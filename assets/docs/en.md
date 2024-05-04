# Fake extension

This is the fake extension usage doc.

## Available commands

### fake-command

This command shows a simple banner widget with a fixed text.

#### Usage example

```
name: "..."
description: "..."
tags: ["..."]
scenes:
  - name: "..."
    extensions: ['fake-extension']
    description: "..."
    initial-state:
      - ...
    transitions:
      - fake-command
```