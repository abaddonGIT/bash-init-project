#Инициализация проекта
#!/bin/bash
#Красим сообщения
function echocolor() { # $1 = string
    COLOR='\033[1;33m'
    NC='\033[0m'
    printf "${COLOR}$1${NC}\n"
}
#Имя проекта
projectName=$1
#Название конторы
companyName=$2
#Корневая папка проекта
rootPath='/K/'${companyName^^}'/'${projectName}'/'
echocolor 'Создание директорий...';
#Если директории нет, то создать её
if [ ! -d ${rootPath} ]; then
  mkdir ${rootPath};
fi
# #Создание папки для исходников проекта
if [ ! -d ${rootPath}source ]; then
 mkdir ${rootPath}source;
fi
#Создание рабочей директории
if [ ! -d ${rootPath}web_${projectName} ]; then
  mkdir ${rootPath}web_${projectName};
fi
eechocolor 'Клонирование репозитория сборки...'
#Клонирование репозитория проекта
cd ${rootPath}web_${projectName}
#Клонирование репозитория
if [ ! -d ${rootPath}WebPackAndGulp ]; then
  git clone "https://github.com/abaddonGIT/WebPackAndGulp.git"
  cp -R WebPackAndGulp/. ./
fi
#Удалею директорию репозитория
rm -rf ./WebPackAndGulp
#Удаляем файл репозитория для инициализации нового
rm -rf .git
echocolor 'Установка зависимостей...'
#Ставим сборку
npm install
echocolor  'Открытие редактора...'
#Запуск Webstorm в папке проекта
'/K/Program Files (x86)/JetBrains/WebStorm 2017.1/bin/webstorm64.exe' ${rootPath}web_${projectName} &
#Запуск dev server
echocolor 'Запуск dev сервера...'
npm start
exit 0
