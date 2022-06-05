from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
from django.http import HttpResponse
from django.shortcuts import render, redirect

# Create your views here.
from adminpanel_app.forms import AddBookForm, SignUpForm
from adminpanel_app.models import AddBook


def index(request):
    allbook_obj = AddBook.objects.all()
    context = {'allbook_obj': allbook_obj}
    return render(request, 'index.html', context)

# def signin(request):
#     form = SignUpForm()
#     if request.method == "POST":
#         form = SignUpForm(request.POST)
#         if form.is_valid():
#             print("signup")
#             email = form.cleaned_data['adminemail']
#             password = form.cleaned_data['adminpass']
#             print(email, password)
#             return redirect('retrievebooks')
#     context = {'form': form}
#     return render(request, 'adminpanel/signin.html', context)

def signup(request):
    form = SignUpForm()

    if request.method == 'POST':
        form = SignUpForm(request.POST, request.FILES)
        if form.is_valid():
            newform = form.save(commit=False)

            newform.save()
            """newform.is_staff = True
            newform.save()"""
            return redirect('signin')
    context = {'form': form, }
    return render(request, 'adminpanel/signup.html', context)

def retrievebooks(request):
    allbook_obj = AddBook.objects.all()
    context = {'allbook_obj': allbook_obj}
    return render(request, 'adminpanel/retrievebooks.html', context)


def addnewbook(request):
    addbookform = AddBookForm()
    if request.method == "POST":
        addbookform = AddBookForm(request.POST, request.FILES)
        print(bool(addbookform.is_valid()))
        if addbookform.is_valid():
            bookname = addbookform.cleaned_data['bookname']
            bookcoverimage = addbookform.cleaned_data['bookcoverimage']
            bookauthorname = addbookform.cleaned_data['bookauthorname']
            bookdescription = addbookform.cleaned_data['bookdescription']
            bookpdf = addbookform.cleaned_data['bookpdf']
            addbook_obj = AddBook.objects.create()
            addbook_obj.bookname = bookname
            addbook_obj.bookcoverimage = bookcoverimage
            addbook_obj.bookauthorname = bookauthorname
            addbook_obj.bookdescription = bookdescription
            addbook_obj.bookpdf = bookpdf
            addbook_obj.save()
            return redirect('retrievebooks')
    context = {'addbookform':addbookform}
    return render(request, 'adminpanel/addnewbook.html', context)

def editbook(request, id):
    edit_obj = AddBook.objects.get(id=id)
    initialize_data = {
        'bookname': edit_obj.bookname,
        'bookcoverimage': edit_obj.bookcoverimage,
        'bookauthorname': edit_obj.bookauthorname,
        'bookdescription': edit_obj.bookdescription,
        'bookpdf': edit_obj.bookpdf,
    }
    editbookform = AddBookForm(initial=initialize_data)
    if request.method == "POST":
        editbookform = AddBookForm(request.POST, request.FILES)
        print(bool(editbookform.is_valid()))
        if editbookform.is_valid():
            print("pass")
            print(edit_obj.bookname)
            print(edit_obj.bookauthorname)
            edit_obj.bookname = editbookform.cleaned_data['bookname']
            edit_obj.bookcoverimage = editbookform.cleaned_data['bookcoverimage']
            edit_obj.bookauthorname = editbookform.cleaned_data['bookauthorname']
            edit_obj.bookdescription = editbookform.cleaned_data['bookdescription']
            edit_obj.bookpdf = editbookform.cleaned_data['bookpdf']
            edit_obj.save()
            print(editbookform.cleaned_data['bookname'],editbookform.cleaned_data['bookauthorname'],)
            print(edit_obj.bookname)
            print(edit_obj.bookauthorname)
            return redirect('retrievebooks')
        else:
            print(editbookform.errors)
    context = {'editbookform': editbookform, 'edit_obj': edit_obj }
    return render(request, 'adminpanel/editbook.html', context)


def deletebook(request, id):
    delete_obj = AddBook.objects.get(id=id)
    delete_obj.delete()
    return redirect('retrievebooks')

def signin(request):
    if request.user.is_authenticated:
        return redirect('index')
    else:
        if request.method == 'POST':
            loginEmail = request.POST.get('loginEmail')
            loginPassword = request.POST.get('loginPassword')
            print(loginEmail,loginPassword)
            user = authenticate(request, username=loginEmail, password=loginPassword)

            """try:
                user = User.objects.get(email=loginEmail)
            except:
                user = None
            else:
                if user.check_password(loginPassword):
                    user = user
                else:
                    user = None"""
            print(user)
            if user is not None:
                login(request, user)
                return redirect('retrievebooks')
            else:
                messages.info(request, 'username or password is incorrect')

        return render(request, 'adminpanel/signin.html')


def signout(request):
    logout(request)
    return redirect('signin')

