# Valei-me São Francisco

Aplicativo desenvolvido no Hackfest de olho n'água (17-19/03/2017) que investiga
os serviços de esgotamento sanitário e abastecimento de água nas cidades contempladas
pela transposição do rio São Francisco.

## Desenvolvimento

### Requisitos

#### nodeJS
É necessária a instalação do [nodeJS](https://nodejs.org/) com o seu gerenciador de pacotes [npm](https://www.npmjs.com/). Como este projeto usa [Sass](http://sass-lang.com/) como pre-processador CSS, também é necessário do [compass](http://compass-style.org/):

```
sudo apt-get install nodejs
sudo apt-get install npm
# O comando abaixo só é necessário quando o comando <node> não é encontrado
sudo ln -s /usr/bin/nodejs /usr/bin/node

sudo apt-get install ruby-full
sudo gem update --system
sudo gem install compass
```

Também é necessário o **grunt-cli** e **bower** instalados no ambiente:

```
sudo npm install -g grunt-cli bower
```

Por fim, para instalar as dependencias do projeto, utiliza-se o **npm** e o **bower**.
```
cd <caminho_do_projeto>
npm install
bower install
```

#### Ruby (gem compass)

Para instalar o Ruby, [esse](https://gorails.com/setup/ubuntu/16.10#ruby) tutorial
funciona bem.

Já para instalar o compass faça

```
gem install compass
rbenv rehash (Se você optou com instalar o Ruby com rbenv)
```

### Rodandod

Para rodar o preview da aplicação, use o comando `grunt serve`.

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


