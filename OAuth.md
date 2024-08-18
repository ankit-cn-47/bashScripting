OAuth (Open Authorization) is an open standard for access delegation, commonly used as a way to grant websites or applications limited access to a user's information without exposing the user's credentials. It’s widely used in scenarios where a user wants to give a third-party application permission to access their data on another platform (e.g., allowing a social media app to access your photos stored on a cloud service).
Key Concepts

    Resource Owner (User):
        The user who owns the data or resources that a third-party application wants to access.

    Client (Application):
        The application or service that requests access to the user's resources. This is the third-party app that needs permission to act on behalf of the user.

    Authorization Server:
        The server that authenticates the user and issues access tokens to the client. It handles the user login and consent, and it generates the access tokens.

    Resource Server:
        The server that hosts the protected resources (e.g., user data). It verifies the access token and serves the requested resources to the client.

    Access Token:
        A token issued by the authorization server that the client uses to access the user’s resources on the resource server. Access tokens have a limited lifetime and specific scope.

    Refresh Token:
        A token that can be used to obtain a new access token without requiring the user to log in again. It is often long-lived and used when the access token expires.

OAuth Flow

OAuth defines several grant types, which are different ways to obtain an access token. The most common flow is the Authorization Code Grant flow, which involves a few steps:
1. Authorization Request:

    The client directs the user to the authorization server with a request that includes details like the client ID, requested permissions (scopes), and a redirect URI.

http

GET /authorize?response_type=code&client_id=client_id&redirect_uri=https://client.example.com/cb&scope=read

2. User Authentication and Consent:

    The user is prompted to log in (if not already authenticated) and is asked to consent to the permissions requested by the client.

3. Authorization Code Issuance:

    If the user consents, the authorization server redirects the user back to the client’s redirect URI with an authorization code.

http

https://client.example.com/cb?code=authorization_code

4. Token Exchange:

    The client exchanges the authorization code for an access token by making a request to the authorization server’s token endpoint. The request includes the client ID, client secret, authorization code, and redirect URI.

http

POST /token
grant_type=authorization_code&
code=authorization_code&
redirect_uri=https://client.example.com/cb&
client_id=client_id&
client_secret=client_secret

5. Access Token Issuance:

    The authorization server validates the authorization code and issues an access token (and possibly a refresh token) to the client.

json

{
  "access_token": "access_token",
  "token_type": "Bearer",
  "expires_in": 3600,
  "refresh_token": "refresh_token"
}

6. Access Resource:

    The client uses the access token to make authorized requests to the resource server to access the user’s data.

http

GET /resource
Authorization: Bearer access_token

Grant Types in OAuth

    Authorization Code Grant:
        Used in server-side applications where the client is a web server. It’s the most secure because the client secret is not exposed in the browser.

    Implicit Grant:
        Used in browser-based applications (e.g., single-page apps) where the access token is returned directly to the client without an authorization code. It’s less secure since the token is exposed in the browser.

    Client Credentials Grant:
        Used when the client itself (not on behalf of a user) needs to access resources. Common in machine-to-machine (M2M) scenarios.

    Resource Owner Password Credentials Grant:
        Used when the user provides their username and password directly to the client (less secure, typically used in legacy applications).

    Refresh Token Grant:
        Used to obtain a new access token using a refresh token when the original access token expires.

OAuth Scopes

Scopes define what access the client is requesting on behalf of the user. For example, a scope might specify read-only access to a user’s email or write access to their calendar. The user is asked to consent to these scopes during the authorization step.
OAuth Tokens

    Access Token: A short-lived token that the client uses to access the user's data.
    Refresh Token: A long-lived token used to obtain new access tokens without requiring the user to log in again.

Security Considerations

    Token Expiry: Access tokens should have a short lifetime to limit the risk if the token is compromised.
    HTTPS: All OAuth interactions should happen over HTTPS to prevent token interception.
    State Parameter: When initiating the OAuth flow, a state parameter should be used to prevent cross-site request forgery (CSRF) attacks.

Use Cases

    Third-Party App Integration: Allowing users to authorize third-party applications to access their data on platforms like Google, Facebook, or GitHub.
    API Authorization: Securing access to APIs by issuing tokens to clients.
    Single Sign-On (SSO): Enabling users to log in once and gain access to multiple services.

OAuth vs. SAML

    OAuth is focused on authorization, allowing third-party applications to act on behalf of the user.
    SAML is focused on authentication, enabling single sign-on (SSO) in enterprise environments.

Summary

OAuth is a widely-used standard for delegating access to resources without sharing credentials. It’s integral to modern web and mobile applications, enabling secure third-party access to user data across different platforms.