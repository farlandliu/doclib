# CMD Lines
###ssh git

```bash
#generate key pair
ssh-keygen -t rsa

git config --global user.name "username"
git config --global user.email "email"

#if want to set email for local dir, omit "global"
git config user.name "john"
git config user.email "john@gmail.com"

#validation after importing ssh key
git git@github.com

git clone git@github.com:name/project

```

###mkdocs & material theme###

- [mkdocs-material-theme][1]
- [mkdocs Documentation][2]
```bash
pip install mkdocs
pip install mkdocs-material

mkdocs serve -a 192.168.0.122:8000S
```
###


  [1]: http://squidfunk.github.io/mkdocs-material/
  [2]: http://www.mkdocs.org/
