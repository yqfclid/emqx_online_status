%%%-------------------------------------------------------------------
%% @doc emqx_online_status top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(emqx_online_status_sup).

-behaviour(supervisor).

-export([start_link/0]).

-export([init/1]).

-define(SERVER, ?MODULE).

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%% sup_flags() = #{strategy => strategy(),         % optional
%%                 intensity => non_neg_integer(), % optional
%%                 period => pos_integer()}        % optional
%% child_spec() = #{id => child_id(),       % mandatory
%%                  start => mfargs(),      % mandatory
%%                  restart => restart(),   % optional
%%                  shutdown => shutdown(), % optional
%%                  type => worker(),       % optional
%%                  modules => modules()}   % optional
init([]) ->
    SupFlags = #{strategy => one_for_all,
                 intensity => 0,
                 period => 1},
    ChildSpecs = [],
    {ok, {SupFlags, ChildSpecs}}.

%% internal functions
% init([]) ->
%     {ok, Server} = application:get_env(?APP, server),
%     {ok, {{one_for_one, 10, 100}, pool_spec(Server)}}.

% pool_spec(Server) ->
%     case proplists:get_value(type, Server) of
%         cluster ->
%             eredis_cluster:start_pool(?APP, Server),
%             [];
%         _ ->
%             [ecpool:pool_spec(?APP, ?APP, emqx_auth_redis_cli, Server)]
%     end.