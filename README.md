## citydb-vkg-demo Tartu
Location: Tartu, Estonia
CRS: EPSG:3301

Ports 7778 and 8002 need to kept free in order run the postgresql database and Ontop.
The image contains a preloaded dataset of Tartu.

Execute the following code to initialize the demo:
```
docker-compose -f docker-compose.tartu.yml up
```
