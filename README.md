# Proyecto web integrado

## Pasos para usar git

### Crear cuenta en github

```
https://github.com/join?source=header
```

### descargar git https://gitforwindows.org/ Abir terminal de git en el directorio donde vamos a trabajar y ejecutan lo siguiente:

```
ssh-keygen -t rsa -b 4096 -C "tuCorreoDeGithub@example.com"
```

### Luego ejecutar comando en el terminal y el resultado enviar a mi correo ronaldfox2015@gmail.com esto es para darles permiso al repocitorio

```
cat ~/.ssh/id_rsa.pub
```

### Despues de de confirmar tu accesso por ronaldfox2015@gmail.com ejecuta

```
git clone git@github.com:ronaldfox2015/proyecto-web-java-utp.git
```
o este ultimo te pidira usuario y pasword del github
```
git clone https://github.com/ronaldfox2015/proyecto-web-java-utp.git
```

## Pasos para subir cambio en git con github

### paso uno :

revisar si tienes un cambio con el siguiente comamdo

```
git status
```

 ![alt text](https://drive.google.com/file/d/1bxXL3_x2ZlVRNsiN54x64o1aAXXYXLJn/view?usp=sharing)

### paso dos realizando el commit :

si es que tienes un cambio te saldra un listado con color rojo indicando que hay cambio en tu repocitorio

 ![alt text](https://drive.google.com/file/d/1bxXL3_x2ZlVRNsiN54x64o1aAXXYXLJn/view)

si es el caso ejecutar este comamdo para subir los cambios

```
git commit -am "en este sitio va un comentario referente al cambio que has realizado"
```

 ![alt text](https://drive.google.com/file/d/1xKKcJrfxalWQzP8EsY-inZ--QueDXRw6/view)


realizando la instruccion commit solo es que guardas el cambio a nivel de tu pc no en la nube si quieres que se suba al repocitorio y lo puedan ver los demas ejecutas lo siguiente :

```
git push origin master
```

 ![alt text](https://drive.google.com/file/d/1ziRKXnRqfM3s5hkX3t3NpMMPWRHjSnVL/view)

