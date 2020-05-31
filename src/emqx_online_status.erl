%%%-------------------------------------------------------------------
%%% @author yqfclid 
%%% @copyright  yqfclid (yqf@blackbird)
%%% @doc
%%%
%%% @end
%%% Created :  2020-05-31 16:13:49
%%%-------------------------------------------------------------------
-module(emqx_online_status).
-author("yqfclid").

-export([load/1, unload/1]).
-export([login/3, logout/3]).

load(_) ->
    emqx:hook('client.connected', {?MODULE, login, []}),
    ok.

unload(_) ->
    ok.



login(A, B, C) ->
    io:format("login ~p ~p ~p ~n", [A, B, C]),
    ok.

logout(_, _, _) ->
    ok.
