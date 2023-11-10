from django.shortcuts import render
from django.views.generic import CreateView, ListView, UpdateView, DeleteView
from django.urls import reverse_lazy
from .models import Post
from .forms import PostForm


class PostListView(ListView):
    model = Post
    template_name = "post_list.html"
    
    # Traduce None (email) value
    def get_queryset(self):
        queryset = super(PostListView, self).get_queryset()
        for obj in queryset:
            if obj.email == None:
                obj.email = 'No e-mail'
        return queryset
    
class PostCreateView(CreateView):
    model = Post
    template_name = "post_create.html"
    form_class = PostForm
    success_url = reverse_lazy('post_list')

    

class PostUpdateView(UpdateView):
    model = Post
    template_name = "post_update.html"
    form_class = PostForm
    success_url = reverse_lazy('post_list')

class PostDeleteView(DeleteView):
    model = Post
    template_name = "post_delete.html"
    success_url = reverse_lazy('post_list')
