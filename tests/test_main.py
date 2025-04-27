from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)

def test_read_root():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"message": "Hello world"}

def test_hello_name():
    response = client.get("/hello/inigo montoya")
    assert response.status_code == 200
    assert response.json() == {"message": "Hello, inigo montoya!"}

def test_invalid_path():
    response = client.get("/notfound")
    assert response.status_code == 404
