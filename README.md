
# Prueba Técnica Stratia

Esta es una prueba técnica realizada con Ruby on Rails. Se trata de un sistema de gestion de tareas basico, en el cual se puede encontrar con un CRUD para los proyectos y sus tareas. Tambien cuenta con el registro de usuarios nuevos 


## Requisitos Previos

 
- Ruby 3.2.4
- Rails 7.1.3.4
- PostgreSQL
- Node >= 18



## Instalación

Clonar repositorio:

```bash
  git clone https://github.com/DemianVelisCanulao/PruebaRubyOnRails.git
```

Instalar dependecias de Ruby:
```bash
  bundle install
```
## Configuración BD
- Copiar el archivo config/database.yml y configurar los datos de tu base de datos en config/database.yml.
- Crear la base de datos y ejecutar las migraciones:
```bash
    rails db:create
    rails db:migrate
```
## Iniciar Servidor Local

```bash
rails server
```