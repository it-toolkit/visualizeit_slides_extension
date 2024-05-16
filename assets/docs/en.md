# Slides extension

This is the slides extension usage doc.

## Available commands

### create-slides

### show-slides


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