[![Build Status](https://travis-ci.org/hughbric/translator_server.svg?branch=master)](https://travis-ci.org/hughbric/translator_server)
[![Coverage Status](https://coveralls.io/repos/github/hughbric/translator_server/badge.svg?branch=master)](https://coveralls.io/github/hughbric/translator_server?branch=master)

# Translator

A backend server that translates terms into pig-latin. It is deployed on Heroku.

The URL:  
[https://trans-late.herokuapp.com/](https://trans-late.herokuapp.com/)

The frontend React repository can be found [here](https://github.com/hughbric/translator_frontend) - which is deployed on Netlify [here](https://vigorous-blackwell-e2069e.netlify.com/)

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
- Wrap API route in v1.
