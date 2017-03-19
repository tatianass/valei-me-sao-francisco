# valei-me-sao-francisco

This project is generated with [yo angular generator](https://github.com/yeoman/generator-angular)
version 0.16.0.

## Build & development

Run `grunt` for building and `grunt serve` for preview.

## Testing

Running `grunt test` will run the unit tests with karma.


## Generating data
The next steps were made in ArcGIS and R:

# From ArcGIS
1. Open 'valei_me.mxd' in ArcGIS
2. Right click on the map;
3. Choose 'Open Attribute Table';
4. Click on 'Table Options' (left side on top);
5. Choose 'Export'
6. Click on 'Browse' button
7. In 'Save as type' choose 'Text File'
8. Save with <your file name>.csv.

PS: 
- Most of the data was obtained using join between the shape and others csv files. See (1) Right click on the map; (2) 'Join and Relate'; (3) 'Join...'
- You can also delete any field that you are not going to use before export: Right click on the table column and 'Delete Field'
- When loading your csv in ArcGIS, don't forgot to check the data types: Right click on the table column and 'Properties'.

# From R
Just use the 'script.R' in scripts folder.