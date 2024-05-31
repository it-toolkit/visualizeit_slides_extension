# Slides extension

This is the slides extension usage doc.

Extension id: `slides`

## Available commands

### create-slideshow

This command creates an empty slide model ready to be configured with slides.

> Use this command in the script initialization section.

### add-title-slide

This command add a simple title slide. The title will be shown centered. 

> Use this command in the script initialization section.

#### Arguments

| Name     | Type            | Position | Required | Default value | Description |
|----------|-----------------|----------|----------|---------------|-------------|
| title    | string          | 0        | true     | -             | -           |
| subtitle | optional string | 1        | false    | null          | -           |

### add-fullscreen-image-slide

This command add a slide with a fullscreen background image.

> Use this command in the script initialization section.

#### Arguments

| Name      | Type            | Position | Required | Default value | Description |
|-----------|-----------------|----------|----------|---------------|-------------|
| imageUrl  | string          | 0        | true     | -             | -           |
| alignment | string          | 1        | false    | center        | -           |
| title     | optional string | 2        | false    | null          | -           |
| subtitle  | optional string | 3        | false    | null          | -           |

### add-bullets-slide

This command add a slide with a bullet list. The bullets can be presented animated or not.

> Use this command in the script initialization section.

#### Arguments

| Name           | Type            | Position | Required | Default value | Description |
|----------------|-----------------|----------|----------|---------------|-------------|
| bullets        | string array    | 0        | true     | -             | -           |
| bulletByBullet | boolean         | 1        | false    | true          | -           |
| imageUrl       | optional string | 2        | false    | null          | -           |
| title          | optional string | 3        | false    | null          | -           |
| subtitle       | optional string | 4        | false    | null          | -           |

### add-code-slide

This command add a slide with a animated code transitions. The slide can contain one or more
code fragments and will transition between them using a simple animation.

> Use this command in the script initialization section.

#### Arguments

| Name           | Type            | Position | Required | Default value | Description                                                         |
|----------------|-----------------|----------|----------|---------------|---------------------------------------------------------------------|
| formatted-code | string array    | 0        | true     | -             | To highlight some lines, start the code string with `###1,2,...###` |
| language       | string          | 1        | false    | dart          | Supported languages: yaml / dart                                    |
| title          | optional string | 2        | false    | null          | -                                                                   |
| subtitle       | optional string | 3        | false    | null          | -                                                                   |

### show-slides

This command start the slide show. 

> Use this command in the script transitions section.