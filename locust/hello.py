import time
from locust import HttpUser, task

class QuickstartUser(HttpUser):

    @task
    def hello_world(self):
        self.client.get(
            "boostcamp-2020/",
            headers = {"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjE2ODcwMiwicG9zc2Vzc2lvbkNhbXAiOm51bGwsImdpdGh1YmlkIjoiaG9udXg3NyIsImRpc3BsYXlOYW1lIjoiSG9udXgiLCJlbWFpbCI6ImhvbnV4NzdAZ21haWwuY29tIiwicHJvZmlsZVBob3RvIjoiaHR0cHM6Ly9hdmF0YXJzMS5naXRodWJ1c2VyY29udGVudC5jb20vdS8yMTY4NzAyP3Y9NCIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTYwODA4MzcwMywiZXhwIjoxNjEwNjc1NzAzLCJpc3MiOiJjb2Rlc3F1YWQua3IiLCJzdWIiOiJVc2VySW5mbyJ9.hzFSeZUrHGLXiH-dQ_Y8Oi_JIHLH3UnmwdVPmdHvO4Q""https://lucas.codesquad.kr/boostcamp-2020/"}
        );

    @task(3)
    def view_item(self):
        for item_id in range(2):
            self.client.get(f"/item?id={item_id}", name="/item")
            time.sleep(1)

    def on_start(self):
        self.token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjE2ODcwMiwicG9zc2Vzc2lvbkNhbXAiOm51bGwsImdpdGh1YmlkIjoiaG9udXg3NyIsImRpc3BsYXlOYW1lIjoiSG9udXgiLCJlbWFpbCI6ImhvbnV4NzdAZ21haWwuY29tIiwicHJvZmlsZVBob3RvIjoiaHR0cHM6Ly9hdmF0YXJzMS5naXRodWJ1c2VyY29udGVudC5jb20vdS8yMTY4NzAyP3Y9NCIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTYwODA4MzcwMywiZXhwIjoxNjEwNjc1NzAzLCJpc3MiOiJjb2Rlc3F1YWQua3IiLCJzdWIiOiJVc2VySW5mbyJ9.hzFSeZUrHGLXiH-dQ_Y8Oi_JIHLH3UnmwdVPmdHvO4Q"
        self.client = HttpBrowser("https://lucas.codesquad.kr");