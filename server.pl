:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).

:- http_handler(root(.), home_page, []).

server(Port) :-
    http_server(http_dispatch, [port(Port)]).

home_page(_Request) :-
    format('Content-type: text/html~n~n'),
    format('<html><body><h1>Hello, World!</h1></body></html>').

:- initialization(server(8000)).