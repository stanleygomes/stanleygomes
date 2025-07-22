# 🔐 O que é OAuth2?

OAuth2 (Open Authorization 2.0) é um protocolo padrão aberto para autorização, que permite que aplicativos de terceiros acessem recursos protegidos de um usuário em outro serviço, sem que o usuário precise compartilhar suas credenciais (como senha). Ele é amplamente utilizado para autenticação e autorização em APIs e aplicações web/mobile.

---

## ⭐ Vantagens do OAuth2

- 🔒 **Segurança:** O usuário não compartilha sua senha com o aplicativo terceiro.
- 🛂 **Delegação de acesso:** Permite conceder permissões específicas a aplicativos, sem expor todos os dados.
- 📱 **Escalabilidade:** Suporta múltiplos tipos de clientes (web, mobile, desktop).
- 📦 **Padronização:** Protocolo amplamente adotado e suportado.
- 😊 **Experiência do usuário:** Login simplificado usando contas já existentes (Google, Facebook, etc).

---

## 🤔 Por que usar OAuth2?

- Permitir que usuários façam login usando contas de outros serviços.
- Proteger APIs e recursos sensíveis.
- Delegar permissões de acesso de forma granular e segura.
- Integrar facilmente com provedores de identidade populares.

---

## 🧑‍💻 Papéis no OAuth2

- 👤 **Resource Owner (Usuário):** Quem possui os dados e autoriza o acesso.
- 🖥️ **Client (Aplicativo):** Quem solicita acesso aos dados do usuário.
- 🏦 **Authorization Server:** Quem autentica o usuário e emite tokens de acesso.
- 🗄️ **Resource Server:** Onde os dados protegidos estão hospedados e são acessados via token.

---

## 🔄 Fluxo Resumido

1. O usuário acessa o aplicativo (Client) e solicita login via OAuth2.
2. O aplicativo redireciona o usuário para o Authorization Server.
3. O usuário autentica e autoriza o acesso.
4. O Authorization Server retorna um código de autorização para o aplicativo.
5. O aplicativo troca o código por um token de acesso.
6. O aplicativo usa o token para acessar recursos protegidos no Resource Server.

### 💻 Exemplos de código (Node.js)

```js
// 1. Redirecionar usuário para autorização
const authUrl = `https://provider.com/oauth2/authorize?response_type=code&client_id=CLIENT_ID&redirect_uri=REDIRECT_URI&scope=profile email`;
res.redirect(authUrl);
```

```js
// 2. Receber o código de autorização e trocar por token
const code = req.query.code;
const tokenResponse = await fetch('https://provider.com/oauth2/token', {
  method: 'POST',
  headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
  body: `grant_type=authorization_code&code=${code}&redirect_uri=REDIRECT_URI&client_id=CLIENT_ID&client_secret=CLIENT_SECRET`
});
const tokens = await tokenResponse.json();
```

```js
// 3. Usar o token para acessar API protegida
const apiResponse = await fetch('https://provider.com/api/userinfo', {
  headers: { Authorization: `Bearer ${tokens.access_token}` }
});
const userInfo = await apiResponse.json();
```

---

🔁 **Refresh Token** é um token especial emitido junto com o access token, usado para obter novos access tokens sem exigir que o usuário faça login novamente. Ele aumenta a segurança e a experiência do usuário, permitindo sessões mais longas sem expor credenciais.

- O refresh token normalmente é enviado para o endpoint `/oauth2/token` com o grant type `refresh_token`.
- O servidor valida o refresh token e retorna um novo access token.
- O uso do refresh token é recomendado para aplicações que precisam de acesso contínuo sem reautenticação.

---

## 🌍 Principais Players e Documentação

- [Google Identity Platform (OAuth2)](https://developers.google.com/identity/protocols/oauth2) 🟢
- [Microsoft Azure Active Directory](https://learn.microsoft.com/en-us/azure/active-directory/develop/v2-oauth2-auth-code-flow) 🔵
- [Auth0](https://auth0.com/docs/get-started/authentication-and-authorization-flow/authorization-code-flow) 🟣
- [Okta](https://developer.okta.com/docs/guides/implement-auth-code-pkce/) 🟠
- [Amazon Cognito](https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-userpools-server-contract-reference.html) 🟡
- [GitHub OAuth](https://docs.github.com/en/apps/oauth-apps/building-oauth-apps/authorizing-oauth-apps) ⚫
- [Facebook Login](https://developers.facebook.com/docs/facebook-login/manually-build-a-login-flow) 🔵
- [Apple Sign In](https://developer.apple.com/documentation/sign_in_with_apple) 🍏

---

Se quiser exemplos de configuração ou fluxos específicos, posso detalhar! 😉


