# cinemapedia

# Dev
1. Copy the __.env.template__ file and rename to __.env__
```
cp .env.template .env
```

2. Change the env variable values, to get the API Key see the next link. [The MovieDB](https://www.themoviedb.org/settings/api)

3. Execute the next command when make changes in the entities:

```
dart run build_runner build
```