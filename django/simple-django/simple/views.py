from django.shortcuts import render
from django.views.generic.edit import CreateView
from django.core.urlresolvers import reverse_lazy


from .models import Memo
# Create your views here.
def hello(request):
    me = {'name':'honux', 'age': 25}
    return render(request, 'simple/hello.html', { 'data': me })

def memo(request):
    memos = Memo.objects.all().order_by('-published_date')
    return render(request, 'simple/memo.html', {'memos': memos})

class Write(CreateView):
    model = Memo
    fields = ['name', 'text']
    success_url = reverse_lazy('board')
