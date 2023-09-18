-module(lesson3_task1).
-export([first_word/1]).

first_word(BinText) ->
    first_word(BinText, <<>>).

first_word(<<>>, BinWord) ->
    BinWord;


first_word(<<X:8, Res/binary>>, BinWord) when X =/= 32 ->
    first_word(Res, <<BinWord/binary, X:8>>);

first_word(<<_X:8, _Res/binary>>, BinWord) ->
    BinWord.



-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
first_word_test_() -> [
    ?_assert(first_word(<<"Text to text">>) =:= <<"Text">>),
    ?_assert(first_word(<<"Text">>) =:= <<"Text">>),
    ?_assert(first_word(<<"">>) =:= <<>>)].
-endif.