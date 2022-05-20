[QueryItem="bldg"]
PREFIX : <http://cui.unige.ch/citygml/2.0/>
PREFIX dc: <http://purl.org/dc/elements/1.1/>
PREFIX xs: <http://www.w3.org/2001/XMLSchema>
PREFIX app: <http://www.opengis.net/citygml/appearance/2.0/>
PREFIX dem: <http://www.opengis.net/citygml/relief/2.0/>
PREFIX frn: <http://www.opengis.net/citygml/cityfurniture/2.0/>
PREFIX gen: <http://www.opengis.net/citygml/generics/2.0/>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX gml: <http://www.opengis.net/gml/>
PREFIX grp: <http://www.opengis.net/citygml/cityobjectgroup/2.0/>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX tex: <http://www.opengis.net/citygml/texturedsurface/2.0/>
PREFIX tun: <http://www.opengis.net/citygml/tunnel/2.0/>
PREFIX veg: <http://www.opengis.net/citygml/vegetation/2.0/>
PREFIX wtr: <http://www.opengis.net/citygml/waterbody/2.0/>
PREFIX www: <http://www.w3.org/2001/>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX bldg: <http://www.opengis.net/citygml/building/2.0/>
PREFIX brid: <http://www.opengis.net/citygml/bridge/2.0/>
PREFIX core: <http://www.opengis.net/citygml/2.0/>
PREFIX luse: <http://www.opengis.net/citygml/landuse/2.0/>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX tran: <http://www.opengis.net/citygml/transportation/2.0/>
PREFIX terms: <http://purl.org/dc/terms/>

SELECT * {
?b a bldg:Building .
  ?b bldg:address ?address .
  ?address rdfs:label ?label .
?b bldg:lod2Solid ?solid .
?solid geo:asWKT ?wkt .
}