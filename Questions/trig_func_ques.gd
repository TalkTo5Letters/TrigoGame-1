extends Node
var amplitude
var trigo_func
var period
var phase_shift
var vertical_shift
var B
var X = "x"
var rgen = RandomNumberGenerator.new()
var question
var function 
var choices
var answer
var phase_shift_sign
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func generate_trigo_func():
	amplitude = str(rgen.randi_range(1, 10))
	var trigo_rand = rgen.randi_range(1, 2)
	match trigo_rand:
		1:
			trigo_func = "sin"
		2:
			trigo_func = "cos"
	B = str(rgen.randi_range(1, 4) * 2) 
	var temp_c = int(B)*(rgen.randi_range(1,2)*2)
	period = "2pi/ " + str(B)
	phase_shift = "2pi/" + str(temp_c)
	vertical_shift = str(rgen.randi_range(-5, 5))
	var phase_shift_sign_rng = rgen.randi_range(1, 2)
	if phase_shift_sign_rng == 1:
		phase_shift_sign = "+"
	elif phase_shift_sign_rng == 2:
		phase_shift_sign = "-"
	function = amplitude + trigo_func + "(" + B + "(x" + phase_shift_sign + phase_shift + "))" + vertical_shift
	
func gen_trigo_ques():
	generate_trigo_func()
	var miss_val_rng = rgen.randi_range(1, 8)
	match miss_val_rng:
		1: #Amplitude
			question = "What is the Amplitude of the following function:"  + function
			choices = []
			for i in 3:
				choices.append(str(rgen.randi_range(1, 10)))
			choices.append(amplitude)
			choices.shuffle()
			answer = amplitude
				
		2: #period
			question = "What is the Period of the following function:" + function
			choices = ["2pi/2","2pi/4","2pi/6","2pi/8"]
			answer = period
		3: #phase_shift
			question = "What is the phase shift of the following funcition?" + function
			choices = ["2pi/4","2pi/8","2pi/12","2pi/16","2pi/8","2pi/16","2pi/24","2pi/32"]
			answer = phase_shift
		4: #vertical_shift
			question = "What is the vertical shift of the following funcition?" + function
			choices = []
			for i in 3:
				choices.append(str(rgen.randi_range(-5, 5)))
			choices.append(vertical_shift)
			choices.shuffle()
			answer = vertical_shift
			
			
		5: #left_right
			question = "What direction does the following funciton shift towards to? " + function
			choices = ["right", "left", "none"]
			if phase_shift_sign == "+":
				answer = "left"
			elif phase_shift_sign == "-":
				answer = "right"
		6: #up_down
			question = "What direction does the following funciton shift towards to? " + function
			choices = ["upwards", "downwards", "none"]
			if int(vertical_shift) == 0:
				answer = "none"
			elif int(vertical_shift) > 0:
				answer = "upwards"
			elif int(vertical_shift) < 0:
				answer = "downwards"
		7: #total_height
			question = "What is the total height of the following funciton: " + function
			choices = []
			for i in 3:
				choices.append(str(rgen.randi_range(-10, 5) * 2))
			choices.append(str(int(amplitude) * 2))
			choices.shuffle()
			answer = str(int(amplitude) * 2)
		8: #central_line
			question = "What is the central line of the following funciton: " + function
			choices = []
			for i in 3:
				choices.append(str(rgen.randi_range(-5, 5)))
			choices.append(vertical_shift)
			choices.shuffle()
			answer = vertical_shift
	var quest_data = {
		"type": 1,
		"question": question,
		"choices": choices,
		"answer": answer,
		"damage": 25,
	}
	return quest_data

