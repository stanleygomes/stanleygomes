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
  git rev-parse --abbrev-ref HEAD 2>/dev/null | grep -v HEAD
}

export PS1="🚀  \[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$(branch=\$(parse_git_branch); [ -n \"\$branch\" ] && echo \" (\[\033[01;33m\]\$branch\[\033[00m\])\") \$ "
```

Recarregar as configurações

```bash
source ~/.bashrc
```

