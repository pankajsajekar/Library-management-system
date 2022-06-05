from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.forms import EmailInput, TextInput, PasswordInput

from adminpanel_app.models import User


class AddBookForm(forms.Form):
    bookname = forms.CharField()
    bookcoverimage = forms.FileField(required=False)
    bookauthorname = forms.CharField()
    bookdescription = forms.CharField(widget=forms.Textarea)
    bookpdf = forms.FileField(required=False)

class SignUpForm(UserCreationForm):
    password1 = forms.CharField(widget=PasswordInput(attrs={'class': 'form-control'}))
    password2 = forms.CharField(widget=PasswordInput(attrs={'class': 'form-control'}))

    class Meta:
        model = User
        fields = ['first_name', 'last_name', 'email', 'password1', 'password2']

        widgets = {

            "first_name": TextInput(
                attrs={
                    "class": "form-control"
                }),
            "last_name": TextInput(
                attrs={
                    "class": "form-control"
                }),
            "email": EmailInput(
                attrs={
                    "class": "form-control",
                    "type": "email"
                }),

        }
