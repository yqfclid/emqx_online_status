%%%-------------------------------------------------------------------
%% @doc emqx_online_status public API
%% @end
%%%-------------------------------------------------------------------

-module(emqx_online_status_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    emqx_online_status:load([]),
    start_redis_pool(),
    io:format("emqx_online_status start ~n"),
    emqx_online_status_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
start_redis_pool() ->
    ok.