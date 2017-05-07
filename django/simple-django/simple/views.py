from django.shortcuts import render

# Create your views here.
def hello(request):
    me = {'name':'honux', 'age': 25}
    return render(request, 'simple/hello.html', { 'data': me })
