-module(geometry).
-export([test/0,area/1]).

	test()->
		12=area({rectangle,3,4}),
		16=area({square,4}),
		test_worked.
	area({rectangle,Width,Height})->
			Width*Height;
	area({square,Side})->
			Side*Side.
	area(circular,radius) -> 3.1415926*radius*radius.

	area(triangle,Width,Height)	->Width*Height*0.5.

	perimeter(rectangle,Width,Height)->(Width+Height)*2.