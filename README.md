# Installation and Documentation Generation

This guide will walk you through the process of installing the necessary components for our project and generating documentation using Sphinx.

## Installation

To get started, you'll need to install Sphinx along with any dependencies our project requires. You can do this by running the following commands:

```
pip install sphinx numpy 
sudo apt install make 
```

Generate the documentation for our project. This involves a few steps:

1. Navigate to the `docs` directory in your project.
2. Run the command `make html` to generate the HTML documentation.
3. Once the generation is complete, you can find the HTML files in `docs/build/html`. Open the `index.html` file in a web browser to view the documentation.
