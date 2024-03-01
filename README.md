# README

Instructivo para comenzar a utilizar la API REST
¡Bienvenido a la API REST para transacciones! Sigue estos pasos para empezar a utilizarla:

Correr las migraciones: 
Ejecuta el siguiente comando para migrar la base de datos: rake db:migrate

Correr el seed: 
Utiliza el comando a continuación para sembrar la base de datos con datos iniciales, incluyendo la configuración del tipo de moneda USD, que servirá como la moneda base para el sistema y la BTC para interactuar: rails db:seed
Esto asegurará que tengamos una moneda base configurada para comenzar a trabajar.

Iniciar el servicio: Para poner en marcha nuestra API, ejecuta el siguiente comando: rails s

Crear un usuario: Es necesario crear un usuario para obtener un token de autenticación y así poder utilizar la API. Puedes crear un usuario utilizando los endpoints proporcionados.

Explorar los endpoints: Consulta la documentación a continuación para obtener una explicación detallada de los endpoints disponibles en la API.
Almacenada en el proyecto con el nombre de "swagger.yaml" en la carpeta config y pegarla en el SwaggerEditor que es donde fue armada(https://editor-next.swagger.io/)

Aclaraciones Generales:
Comentarios en el código: Puedes encontrar comentarios en el código que explican situaciones específicas debido al alcance de la API.

Protección del dinero: La API no posee protección del dinero en caso de falla u otros escenarios.

Detalle de las transacciones: Aunque las transacciones se realizan utilizando siglas como BTC y USD, en la presentación se muestran con identificadores. Esto se debe a que no se consideró esencial mostrar los detalles completos de las transacciones en este ejercicio.

Presentación de datos: En caso de necesitar presentar los datos de alguna manera específica, se puede utilizar una gema como Jbuilder o un serializador para cada clase.

Funcionalidades no implementadas: La capacidad de ingresar y retirar dinero no se ha modelado en la API. Los usuarios comienzan con un saldo inicial de 10.000 dólares y este se va actualizando conforme realizan transacciones.