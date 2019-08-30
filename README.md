# Translator

A backend server that translates terms into pig-latin.

## API

`GET /`  
Returns all terms.  

`GET /terms/[:id]`  
Returns term.  

`POST /terms`  
Content-Type: application/json  
Body: { "term":"example" }  

`DELETE /terms/[:id]`  
Deletes a term.  

`PUT /terms/[:id]`  
Updates a term.  

## Todos

- Setup whitelist.
- Wrap API in v1.
