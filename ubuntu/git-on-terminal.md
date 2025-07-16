# Mostrar branch no terminal

> Pré-requisito: Linux ubuntu com bash

Para ficar com a branch sendo mostrada no terminal nesse padrão:

```bash
# stanley@stanley-notebook:~/projects/noah (master) $
```

Acessar o arquivo do bash:

```bash
nano ~/.bashrc
```

Adicionar essas linhas no final do arquivo

```bash
parse_git_branch() {
  git branch 2>/dev/null | grep '\*' | sed 's/* //'
}

export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[01;33m\] (\$(parse_git_branch))\[\033[00m\] \$ "
```

Recarregar as configurações

```bash
source ~/.bashrc
```

