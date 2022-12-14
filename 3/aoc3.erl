-module(aoc3).
-export([part1/0, part2/0]).

part1() ->
    {ok, Device} = file:open("input.txt", read),
    Lines = string:split(get_all_lines(Device), "\n", all),
    ListOfTuples = lists:delete({[], []}, lists:map(fun(A) -> get_compartments(A) end, Lines)),
    Hest = lists:map(fun({A, B}) -> find_common_item({A, B}, "") end, ListOfTuples),
    Result = lists:foldl(fun(A, Score) -> Score + compute_score(A) end, 0, Hest),
    Result.

part2() ->
    {ok, Device} = file:open("input.txt", read),
    Lines = string:split(get_all_lines(Device), "\n", all),
    Groups = create_badge_groups(Lines, []),
    Hest = lists:map(fun([F, S, T]) -> find_common_item3({F, S, T}, "") end, Groups),
    Result = lists:foldl(fun(A, Score) -> Score + compute_score(A) end, 0, Hest),
    Result.
   
create_badge_groups([[]], Result) ->
    Result;
create_badge_groups([H, H2, H3 | T], Result) ->
    create_badge_groups(T, [[H,H2,H3]]++Result).
    
    
    

get_all_lines(Device) ->
    case io:get_line(Device, "") of
	eof -> "";
	Line -> Line ++ get_all_lines(Device)
    end.

get_compartments(String) ->
    StrLength = string:length(String),
    Test = string:slice(String, 0, round(StrLength/2)),
    Fest = string:slice(String, round(StrLength/2)),
    {Test, Fest}.

find_common_item({[], _}, Item) ->
    Item;
find_common_item({[Fh | Ft], Second}, Item) ->
    case lists:member(Fh, Second) of
	true -> find_common_item({[], Second}, Fh);
	false -> find_common_item({Ft, Second}, "")
    end.

find_common_item3({[], _, _}, Item) ->
    Item;
find_common_item3({[Fh | Ft], Second, Third}, Item) ->
    case lists:member(Fh, Second) of
	true -> case lists:member(Fh, Third) of
                    true -> find_common_item3({[], Second, Third}, Fh);
                    false -> find_common_item3({Ft, Second, Third}, "")
                end;
	false -> find_common_item3({Ft, Second, Third}, "")
    end.
   
compute_score(Common) ->
    case Common of
	65 -> 27;
	66 -> 28;
	67 -> 29;
	68 -> 30;
	69 -> 31;
	70 -> 32;
	71 -> 33;
	72 -> 34;
	73 -> 35;
	74 -> 36;
	75 -> 37;
	76 -> 38;
	77 -> 39;
	78 -> 40;
	79 -> 41;
	80 -> 42;
	81 -> 43;
	82 -> 44;
	83 -> 45;
	84 -> 46;
	85 -> 47;
	86 -> 48;
	87 -> 49;
	88 -> 50;
	89 -> 51;
	90 -> 52;
        97 -> 1;
	98 -> 2;
	99 -> 3;
	100 -> 4;
	101 -> 5;
	102 -> 6;
	103 -> 7;
	104 -> 8;
	105 -> 9;
	106 -> 10;
	107 -> 11;
	108 -> 12;
	109 -> 13;
	110 -> 14;
	111 -> 15;
	112 -> 16;
	113 -> 17;
	114 -> 18;
	115 -> 19;
	116 -> 20;
	117 -> 21;
	118 -> 22;
	119 -> 23;
	120 -> 24;
	121 -> 25;
	122 -> 26;
	_ -> 10000
    end.
	    


