---
title: PearTree
permalink: peartree.html
sidebar: beast_sidebar
tags: [programs]
keywords: software, peartree, beast, figtree
last_updated: April 11, 2026
toc: false
folder: beast/programs
---

{% include icon-callout.html file='icons/peartree-icon.png' content='PearTree is a browser-based phylogenetic tree viewer for exploring and annotating evolutionary trees. It is the successor to <a href="figtree">FigTree</a>, rewritten as a modern, zero-install web application.' %}

PearTree runs entirely in the browser with no server required, and can also be installed as a native desktop app on macOS, Windows, and Linux. It is developed by the [ARTIC Network](https://artic.network/) and supported by the Wellcome Trust and the Bill & Melinda Gates Foundation.

### Web App

PearTree can be used directly online — no installation needed. Open any NEXUS or Newick tree file directly from your browser by visiting:

[https://peartree.live](https://peartree.live)

### Downloading

Pre-built installers for macOS (universal), Windows, and Linux are available from the GitHub releases page:

[https://github.com/artic-network/peartree/releases/latest](https://github.com/artic-network/peartree/releases/latest)

### Features

- Zero-install web application — runs entirely in the browser.
- Opens NEXUS and Newick format tree files.
- Available as a native desktop app for macOS, Windows, and Linux.
- Visualises annotation data stored in NEXUS metacomments (e.g. from [TreeAnnotator](treeannotator)).
- Drag-and-drop file loading.
- Can be embedded in reports and dashboards as a single self-contained JavaScript bundle.

### Embedding PearTree

PearTree can be embedded in any HTML page using the self-contained JavaScript bundle included with each release, or loaded directly from GitHub Pages:

```html
<script src="https://peartree.live/peartree.bundle.min.js"></script>
<script>
  PearTreeEmbed.embed({
    container: 'my-tree',
    treeUrl:   'data/my.tree',
    height:    '600px',
  });
</script>
```

See the [embedded API reference](https://github.com/artic-network/peartree/blob/main/embedded-api.md) for full documentation.

{% include links.html %}
