#Инициализация проекта
#!/bin/bash
script_name=$0
#Имя проекта
projectName=$1
#Имя репозитория
repositoryName=$2
#Корневая папка проекта
rootPath="./"
#Создание папки для исходников проекта
if [ ! -d ${rootPath}source ]; then
 mkdir ${rootPath}source;
fi
#Создание рабочей директории
if [ ! -d ${rootPath}web_${projectName} ]; then
  mkdir ${rootPath}web_${projectName};
fi
#Клонирование репозитория проекта
cd ${rootPath}web_${projectName}
#Инициализация нового репозитория

if [ ! -d ${rootPath}WebPackAndGulp ]; then
  git clone "https://github.com/abaddonGIT/WebPackAndGulp.git"
  cp -R WebPackAndGulp/. ./
fi
#Удалею директорию репозитория
rm -rf ./WebPackAndGulp
exit 0
