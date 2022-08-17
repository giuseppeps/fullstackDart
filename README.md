curl http://localhost:3000/films

curl -X POST -H "Content-Type: application/json" -d '{"id":2, "title":"AAAAAA"}' http://localhost:8080/films

curl http://localhost:8080/films/2 

curl -X DELETE http://localhost:8080/films/2
