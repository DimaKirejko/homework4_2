-module(lesson3_task2).
-export([words/1]).

words(BinText) ->
    words(BinText, <<>>, []).


words(<<>>, BinWord, AllBin) ->
    lists:reverse([BinWord | AllBin]);

words(<<X:8, Res/binary>>, BinWord, AllBin) when X =/= 32 ->
    words(Res, <<BinWord/binary, X:8>>, AllBin);

words(<<_X:8, Rest/binary>>, BinWord, AllBin) ->
    words(Rest, <<>>, [BinWord | AllBin]).



-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
words_test_() -> [
    ?_assert(words(<<"Text to text">>) =:= <<"Text">>, <<"to">>, <<"text">>),
    ?_assert(words(<<"Text">>) =:= <<"Text">>),
    ?_assert(words(<<"">>) =:= <<>>)].
-endif.