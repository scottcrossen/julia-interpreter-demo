push!(LOAD_PATH, ".")
macro tnum()
	return :(testnum += 1)
end
using Lexer
using Error
using JuliaProject9
using Cairo
using Images
testnum = 0
function testNum(num)
	return string(num) * ". "
end
function parseT(str)
	HPInt.parse(Lexer.lex(str))
end
function analyze(str)
	HPInt.analyze(parseT(str))
end
function interpret(str)
	HPInt.calc(analyze(str))
end


test1="(with ((x 1)) x)"
test2="((lambda (x) x) 1)"
println(testNum(@tnum()) * "analyze " * test1)
try
	analyze(parse(Lexer.lex(test1)))
catch
	println("Failed test " * testNum(testnum))
	println(analyze(parse(Lexer.lex(test1))))
end
println(testNum(@tnum()) * "analyze " * test2)
try
	analyze(parse(Lexer.lex(test2))
catch
	println("Failed test " * testNum(testnum))
	println(analyze(parse(Lexer.lex(test2)))
end
try
	if(analyze(parse(Lexer.lex(test1)))==analyze(parse(Lexer.lex(test2)))
		println("Passed tests " * testNum(testnum-1) * " and " * testNum(testnum-1))
	else
		println("Failed test " * testNum(testnum-1) * " and " * testNum(testnum-1))
	end
end
println(testNum(@tnum()) * "calc " * test)
try
	calc(test)
catch
	println("Failed test " * testNum(testnum))
	println(calc(test))
end
println(testNum(@tnum()) * "calc " * test)
try
	calc(test)
catch
	println("Failed test " * testNum(testnum))
	println(calc(test))
end
try
	if(calc(test1)==calc(test2))
		println("Passed tests " * testNum(testnum-1) * " and " * testNum(testnum-1))
	else
		println("Failed test " * testNum(testnum-1) * " and " * testNum(testnum-1))
	end
end


test1="(with ((x 1) (y 2)) y)"
test2="(with ((x 1) (y 2)) y)"
println(testNum(@tnum()) * "analyze " * test1)
try
	analyze(parse(Lexer.lex(test1)))
catch
	println("Failed test " * testNum(testnum))
	println(analyze(parse(Lexer.lex(test1))))
end
println(testNum(@tnum()) * "analyze " * test2)
try
	analyze(parse(Lexer.lex(test2))
catch
	println("Failed test " * testNum(testnum))
	println(analyze(parse(Lexer.lex(test2)))
end
try
	if(analyze(parse(Lexer.lex(test1)))==analyze(parse(Lexer.lex(test2)))
		println("Passed tests " * testNum(testnum-1) * " and " * testNum(testnum-1))
	else
		println("Failed test " * testNum(testnum-1) * " and " * testNum(testnum-1))
	end
end
println(testNum(@tnum()) * "calc " * test)
try
	calc(test)
catch
	println("Failed test " * testNum(testnum))
	println(calc(test))
end
println(testNum(@tnum()) * "calc " * test)
try
	calc(test)
catch
	println("Failed test " * testNum(testnum))
	println(calc(test))
end
try
	if(calc(test1)==calc(test2))
		println("Passed tests " * testNum(testnum-1) * " and " * testNum(testnum-1))
	else
		println("Failed test " * testNum(testnum-1) * " and " * testNum(testnum-1))
	end
end

test="(with ( (base_img (render_text \"Hello\" 25 100)) (swirl (simple_load \"swirl_256.png\")) ) (with ( (ds (drop_shadow base_img)) ) (with ( (tmp4 (+ (* (+ (min ds base_img) (- 1 base_img)) base_img) (* (- 1 base_img) swirl) )) ) (with ( (tmp5 (- 1 (emboss tmp4))) (base_img2 (render_text \"world!\" 5 200)) ) (with ( (is (inner_shadow base_img2)) ) (with ( (tmp6 (max base_img2 (* (- 1 base_img2) is))) ) (with ( (output (min tmp5 tmp6)) ) (simple_save output \"output.png\") ) ) ) ) ) ) )"
println(testNum(@tnum()) * "Sample Hello World")
try
	interpret(test)
catch
	println("Failed to create image from sample code.")
	####### Uncomment below to see trace dump
    	#interpret( test)
end


test="(with ((cat (simple_load \"cat_256.png\"))) (with ((inv (- 1 cat))) (with ( (output (drop_shadow inv)) ) (simple_save output \"output2.png\"))))"
println(testNum(@tnum()) * "Cat picture")
try
	interpret(test)
catch
	println("Failed to create cat image.")
	####### Uncomment below to see trace dump
	#interpret(test)
end