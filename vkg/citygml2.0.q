[QueryItem="building_address"]
PREFIX : <http://cui.unige.ch/citygml/2.0/>
PREFIX bldg: <http://www.opengis.net/citygml/building/2.0/>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

# Q1: Get building addresses
SELECT *
{
?x bldg:address ?address_id .
?address_id rdfs:label ?address_label .
FILTER(CONTAINS(?address_label, "Koidu tänav")) .
# EPSG 3301 used
?address_id geo:asWKT ?address_geom .
# We do have street numbers, however the ontology is missing the properties to map to
}
[QueryItem="buildings_over_40m"]
PREFIX : <http://cui.unige.ch/citygml/2.0/>
PREFIX bldg: <http://www.opengis.net/citygml/building/2.0/>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

# Q2: Get buildings over 40m
SELECT *
{
?x a bldg:Building .
?x bldg:measuredHeight ?buildingHeight .
# Get buildings over 40 meters
FILTER(?buildingHeight > 40) .
?x bldg:address ?address_id .
?address_id rdfs:label ?address_label .

# EPSG 3301 used
?address_id geo:asWKT ?address_geom .

}
[QueryItem="buildings_lod2"]
PREFIX : <http://cui.unige.ch/citygml/2.0/>
PREFIX bldg: <http://www.opengis.net/citygml/building/2.0/>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>
PREFIX grp: <http://www.opengis.net/citygml/cityobjectgroup/2.0/>
PREFIX gml: <http://www.opengis.net/gml/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

# Q3: Get all surfaces of all buildings
SELECT *
{
?x a gml:Geometry .
?x geo:asWKT ?geom .
?x grp:parent ?parent .
?building bldg:lod2MultiSurface ?parent .
?building bldg:address ?address_id .
?address_id rdfs:label ?address_label .

}
[QueryItem="buildings_lod2_within_polygon"]
PREFIX : <http://cui.unige.ch/citygml/2.0/>
PREFIX bldg: <http://www.opengis.net/citygml/building/2.0/>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>
PREFIX grp: <http://www.opengis.net/citygml/cityobjectgroup/2.0/>
PREFIX gml: <http://www.opengis.net/gml/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

# Q4: Get all surfaces of buildings, for building inside polygon
SELECT * {
?x a gml:Geometry .
?x geo:asWKT ?geom .
?x grp:parent ?parent .
?building bldg:lod2MultiSurface ?parent .
?building bldg:address ?address_id .
?address_id rdfs:label ?address_label .

# Filter central city area
FILTER(geof:sfContains("POLYGON Z((658583.690603 6474844.005105, 659561.886381 6474844.005105, 659561.886381 6474057.080539, 658583.690603 6474057.080539))"^^geo:asWKT, ?beta)) .
}


[QueryItem="total surfaces by building"]
PREFIX : <http://cui.unige.ch/citygml/2.0/>
PREFIX bldg: <http://www.opengis.net/citygml/building/2.0/>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>
PREFIX grp: <http://www.opengis.net/citygml/cityobjectgroup/2.0/>
PREFIX gml: <http://www.opengis.net/gml/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

# Q5: Get all surfaces of buildings, rank by most surfaces
SELECT ?building ?address_label (COUNT(?geom) AS ?count) {
?x a gml:Geometry .
?x geo:asWKT ?geom .
?x grp:parent ?parent .
?building bldg:lod2MultiSurface ?parent .
?building bldg:address ?address_id .
?address_id rdfs:label ?address_label .

# Filter central city area
FILTER(geof:sfContains("POLYGON Z((658583.690603 6474844.005105, 659561.886381 6474844.005105, 659561.886381 6474057.080539, 658583.690603 6474057.080539))"^^geo:asWKT, ?beta)) .
}
GROUP BY ?building ?address_label
ORDER BY DESC(?count)


[QueryItem="average number of surfaces by building"]
PREFIX : <http://cui.unige.ch/citygml/2.0/>
PREFIX bldg: <http://www.opengis.net/citygml/building/2.0/>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>
PREFIX grp: <http://www.opengis.net/citygml/cityobjectgroup/2.0/>
PREFIX gml: <http://www.opengis.net/gml/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

# Q6: Get all surfaces of buildings, rank by most surfaces
SELECT (AVG(?count) ?avg_surfaces_per_building) {
SELECT ?building ?address_label (COUNT(?geom) AS ?count) {
?x a gml:Geometry .
?x geo:asWKT ?geom .
?x grp:parent ?parent .
?building bldg:lod2MultiSurface ?parent .
?building bldg:address ?address_id .
?address_id rdfs:label ?address_label .

# Filter central city area
FILTER(geof:sfContains("POLYGON Z((658583.690603 6474844.005105, 659561.886381 6474844.005105, 659561.886381 6474057.080539, 658583.690603 6474057.080539))"^^geo:asWKT, ?beta)) .
}
GROUP BY ?building
}

[QueryItem="average number of surfaces by building"]
PREFIX : <http://cui.unige.ch/citygml/2.0/>
PREFIX bldg: <http://www.opengis.net/citygml/building/2.0/>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>
PREFIX grp: <http://www.opengis.net/citygml/cityobjectgroup/2.0/>
PREFIX gml: <http://www.opengis.net/gml/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

# Q7: Get total buildings in area

SELECT (COUNT(DISTINCT ?building) AS ?total_buildings) {
?x a gml:Geometry .
?x geo:asWKT ?geom .
?x grp:parent ?parent .
?building bldg:lod2MultiSurface ?parent .
?building bldg:address ?address_id .
?address_id rdfs:label ?address_label .

# Filter central city area
FILTER(geof:sfContains("POLYGON Z((658583.690603 6474844.005105, 659561.886381 6474844.005105, 659561.886381 6474057.080539, 658583.690603 6474057.080539))"^^geo:asWKT, ?beta)) .
}
