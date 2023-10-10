# DBT Project

This project utilizes DBT (Data Build Tool) for transforming, testing, and documenting our data sets. DBT is a contemporary tool that allows for the writing, documentation, and execution of SQL transformations on data warehouses.

## Configuration via YML

The primary configuration for our DBT project is facilitated through a `.yml` file. This file encompasses metadata, settings, and other vital information for the proper functioning of our transformations.

## Queries and Models

The main queries executed through DBT can be found within the `models` directory. Each file inside the `models` directory represents a specific model, be it a table or a view. These models are constructed using pure SQL, leveraging DBT's capability to compile these files in a specific sequence to ensure dependencies between models are aptly resolved.

### Directory Structure:

dbt_project/
dbt_project.yml # Project configuration file
models/ # Directory containing all SQL models
... # Various .sql files with model definitions

## Conclusion

By using DBT and its file-based structure, we're able to maintain a version-controlled, testable, and documented rendition of our data transformations. DBT's code-centric approach renders our transformations transparent, reusable, and collaboration-friendly. The YML-based structuring, coupled with the organized model directory, ensures clarity and comprehensibility.

