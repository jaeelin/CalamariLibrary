local Storage = {}

Storage.Themes = {
	Calamari = {
		Core = Color3.fromRGB(12, 10, 20),
		Divider = Color3.fromRGB(200, 180, 255),
		Text = Color3.fromRGB(235, 225, 255),
		Placeholder = Color3.fromRGB(170, 155, 210),
		DropdownImage = Color3.fromRGB(200, 180, 255),
		DropdownIndicator = Color3.fromRGB(220, 205, 255),
		Global = Color3.fromRGB(220, 205, 255),
		Dragger = Color3.fromRGB(200, 180, 255),
		TabImage = Color3.fromRGB(200, 180, 255),
		TabName = Color3.fromRGB(220, 205, 255),
		Dialogue = Color3.fromRGB(35, 25, 55),
		Toggle = Color3.fromRGB(200, 180, 255),
		Slider = Color3.fromRGB(200, 180, 255)
	},

	["French Exit"] = {
		Core = Color3.fromRGB(28, 20, 32),
		Divider = Color3.fromRGB(215, 110, 140),
		Text = Color3.fromRGB(255, 248, 238),
		Placeholder = Color3.fromRGB(190, 160, 170),
		DropdownImage = Color3.fromRGB(215, 110, 140),
		DropdownIndicator = Color3.fromRGB(240, 180, 200),
		Global = Color3.fromRGB(240, 180, 200),
		Dragger = Color3.fromRGB(215, 110, 140),
		TabImage = Color3.fromRGB(215, 110, 140),
		TabName = Color3.fromRGB(255, 230, 220),
		Dialogue = Color3.fromRGB(55, 30, 45),
		Toggle = Color3.fromRGB(225, 120, 155),
		Slider = Color3.fromRGB(215, 110, 140)
	},

	["Who Really Cares"] = {
		Core = Color3.fromRGB(35, 15, 18),
		Divider = Color3.fromRGB(220, 35, 55),
		Text = Color3.fromRGB(255, 245, 240),
		Placeholder = Color3.fromRGB(190, 130, 140),
		DropdownImage = Color3.fromRGB(220, 35, 55),
		DropdownIndicator = Color3.fromRGB(60, 120, 220),
		Global = Color3.fromRGB(60, 120, 220),
		Dragger = Color3.fromRGB(220, 35, 55),
		TabImage = Color3.fromRGB(220, 35, 55),
		TabName = Color3.fromRGB(255, 220, 215),
		Dialogue = Color3.fromRGB(55, 20, 25),
		Toggle = Color3.fromRGB(230, 45, 65),
		Slider = Color3.fromRGB(60, 120, 220)
	},

	["The Night in Question"] = {
		Core = Color3.fromRGB(12, 14, 22),
		Divider = Color3.fromRGB(120, 150, 255),
		Text = Color3.fromRGB(235, 240, 255),
		Placeholder = Color3.fromRGB(140, 150, 185),
		DropdownImage = Color3.fromRGB(120, 150, 255),
		DropdownIndicator = Color3.fromRGB(180, 200, 255),
		Global = Color3.fromRGB(180, 200, 255),
		Dragger = Color3.fromRGB(120, 150, 255),
		TabImage = Color3.fromRGB(120, 150, 255),
		TabName = Color3.fromRGB(220, 230, 255),
		Dialogue = Color3.fromRGB(22, 28, 45),
		Toggle = Color3.fromRGB(140, 170, 255),
		Slider = Color3.fromRGB(120, 150, 255)
	},

	Nebula = {
		Core = Color3.fromRGB(18, 12, 28),
		Divider = Color3.fromRGB(180, 90, 255),
		Text = Color3.fromRGB(220, 200, 255),
		Placeholder = Color3.fromRGB(150, 130, 190),
		DropdownImage = Color3.fromRGB(180, 90, 255),
		DropdownIndicator = Color3.fromRGB(200, 150, 255),
		Global = Color3.fromRGB(200, 150, 255),
		Dragger = Color3.fromRGB(180, 90, 255),
		TabImage = Color3.fromRGB(180, 90, 255),
		TabName = Color3.fromRGB(200, 150, 255),
		Dialogue = Color3.fromRGB(40, 25, 70),
		Toggle = Color3.fromRGB(200, 120, 255),
		Slider = Color3.fromRGB(180, 90, 255)
	},

	Mint = {
		Core = Color3.fromRGB(20, 30, 25),
		Divider = Color3.fromRGB(150, 255, 200),
		Text = Color3.fromRGB(200, 255, 220),
		Placeholder = Color3.fromRGB(120, 180, 150),
		DropdownImage = Color3.fromRGB(150, 255, 200),
		DropdownIndicator = Color3.fromRGB(120, 220, 170),
		Global = Color3.fromRGB(180, 255, 220),
		Dragger = Color3.fromRGB(150, 255, 200),
		TabImage = Color3.fromRGB(150, 255, 200),
		TabName = Color3.fromRGB(180, 255, 220),
		Dialogue = Color3.fromRGB(35, 55, 45),
		Toggle = Color3.fromRGB(120, 255, 180),
		Slider = Color3.fromRGB(150, 255, 200)
	},

	Abyss = {
		Core = Color3.fromRGB(10, 15, 25),
		Divider = Color3.fromRGB(90, 180, 255),
		Text = Color3.fromRGB(200, 220, 255),
		Placeholder = Color3.fromRGB(120, 150, 190),
		DropdownImage = Color3.fromRGB(90, 180, 255),
		DropdownIndicator = Color3.fromRGB(120, 200, 255),
		Global = Color3.fromRGB(120, 200, 255),
		Dragger = Color3.fromRGB(90, 180, 255),
		TabImage = Color3.fromRGB(90, 180, 255),
		TabName = Color3.fromRGB(120, 200, 255),
		Dialogue = Color3.fromRGB(20, 35, 55),
		Toggle = Color3.fromRGB(70, 160, 255),
		Slider = Color3.fromRGB(90, 180, 255)
	},

	Sakura = {
		Core = Color3.fromRGB(30, 20, 30),
		Divider = Color3.fromRGB(255, 180, 210),
		Text = Color3.fromRGB(255, 210, 230),
		Placeholder = Color3.fromRGB(180, 150, 170),
		DropdownImage = Color3.fromRGB(255, 180, 210),
		DropdownIndicator = Color3.fromRGB(255, 200, 220),
		Global = Color3.fromRGB(255, 200, 220),
		Dragger = Color3.fromRGB(255, 180, 210),
		TabImage = Color3.fromRGB(255, 180, 210),
		TabName = Color3.fromRGB(255, 200, 220),
		Dialogue = Color3.fromRGB(50, 35, 55),
		Toggle = Color3.fromRGB(255, 150, 190),
		Slider = Color3.fromRGB(255, 180, 210)
	},

	Neon = {
		Core = Color3.fromRGB(10, 10, 10),
		Divider = Color3.fromRGB(0, 255, 180),
		Text = Color3.fromRGB(0, 255, 200),
		Placeholder = Color3.fromRGB(0, 180, 150),
		DropdownImage = Color3.fromRGB(0, 255, 180),
		DropdownIndicator = Color3.fromRGB(0, 255, 150),
		Global = Color3.fromRGB(0, 255, 200),
		Dragger = Color3.fromRGB(0, 255, 180),
		TabImage = Color3.fromRGB(0, 255, 180),
		TabName = Color3.fromRGB(0, 255, 200),
		Dialogue = Color3.fromRGB(20, 20, 20),
		Toggle = Color3.fromRGB(0, 255, 150),
		Slider = Color3.fromRGB(0, 255, 180)
	},

	Sunset = {
		Core = Color3.fromRGB(35, 15, 20),
		Divider = Color3.fromRGB(255, 160, 120),
		Text = Color3.fromRGB(255, 210, 190),
		Placeholder = Color3.fromRGB(180, 130, 120),
		DropdownImage = Color3.fromRGB(255, 160, 120),
		DropdownIndicator = Color3.fromRGB(255, 180, 140),
		Global = Color3.fromRGB(255, 180, 140),
		Dragger = Color3.fromRGB(255, 160, 120),
		TabImage = Color3.fromRGB(255, 160, 120),
		TabName = Color3.fromRGB(255, 180, 140),
		Dialogue = Color3.fromRGB(55, 25, 30),
		Toggle = Color3.fromRGB(255, 130, 100),
		Slider = Color3.fromRGB(255, 160, 120)
	},

	Forest = {
		Core = Color3.fromRGB(15, 25, 20),
		Divider = Color3.fromRGB(120, 200, 140),
		Text = Color3.fromRGB(200, 240, 210),
		Placeholder = Color3.fromRGB(120, 160, 130),
		DropdownImage = Color3.fromRGB(120, 200, 140),
		DropdownIndicator = Color3.fromRGB(150, 220, 170),
		Global = Color3.fromRGB(150, 220, 170),
		Dragger = Color3.fromRGB(120, 200, 140),
		TabImage = Color3.fromRGB(120, 200, 140),
		TabName = Color3.fromRGB(150, 220, 170),
		Dialogue = Color3.fromRGB(30, 45, 35),
		Toggle = Color3.fromRGB(100, 180, 130),
		Slider = Color3.fromRGB(120, 200, 140)
	},

	Arctic = {
		Core = Color3.fromRGB(20, 25, 35),
		Divider = Color3.fromRGB(180, 220, 255),
		Text = Color3.fromRGB(220, 240, 255),
		Placeholder = Color3.fromRGB(150, 170, 200),
		DropdownImage = Color3.fromRGB(180, 220, 255),
		DropdownIndicator = Color3.fromRGB(200, 230, 255),
		Global = Color3.fromRGB(200, 230, 255),
		Dragger = Color3.fromRGB(180, 220, 255),
		TabImage = Color3.fromRGB(180, 220, 255),
		TabName = Color3.fromRGB(200, 230, 255),
		Dialogue = Color3.fromRGB(35, 45, 60),
		Toggle = Color3.fromRGB(150, 200, 255),
		Slider = Color3.fromRGB(180, 220, 255)
	},

	Obsidian = {
		Core = Color3.fromRGB(10, 10, 10),
		Divider = Color3.fromRGB(120, 120, 120),
		Text = Color3.fromRGB(220, 220, 220),
		Placeholder = Color3.fromRGB(150, 150, 150),
		DropdownImage = Color3.fromRGB(150, 150, 150),
		DropdownIndicator = Color3.fromRGB(180, 180, 180),
		Global = Color3.fromRGB(200, 200, 200),
		Dragger = Color3.fromRGB(150, 150, 150),
		TabImage = Color3.fromRGB(150, 150, 150),
		TabName = Color3.fromRGB(200, 200, 200),
		Dialogue = Color3.fromRGB(25, 25, 25),
		Toggle = Color3.fromRGB(180, 180, 180),
		Slider = Color3.fromRGB(150, 150, 150)
	},

	Azure = {
		Core = Color3.fromRGB(15, 20, 35),
		Divider = Color3.fromRGB(120, 170, 255),
		Text = Color3.fromRGB(210, 230, 255),
		Placeholder = Color3.fromRGB(140, 160, 200),
		DropdownImage = Color3.fromRGB(120, 170, 255),
		DropdownIndicator = Color3.fromRGB(150, 190, 255),
		Global = Color3.fromRGB(150, 190, 255),
		Dragger = Color3.fromRGB(120, 170, 255),
		TabImage = Color3.fromRGB(120, 170, 255),
		TabName = Color3.fromRGB(150, 190, 255),
		Dialogue = Color3.fromRGB(30, 40, 60),
		Toggle = Color3.fromRGB(100, 150, 255),
		Slider = Color3.fromRGB(120, 170, 255)
	},

	Vaporwave = {
		Core = Color3.fromRGB(25, 15, 35),
		Divider = Color3.fromRGB(255, 120, 200),
		Text = Color3.fromRGB(255, 180, 240),
		Placeholder = Color3.fromRGB(180, 120, 200),
		DropdownImage = Color3.fromRGB(255, 120, 200),
		DropdownIndicator = Color3.fromRGB(120, 220, 255),
		Global = Color3.fromRGB(255, 150, 220),
		Dragger = Color3.fromRGB(255, 120, 200),
		TabImage = Color3.fromRGB(255, 120, 200),
		TabName = Color3.fromRGB(120, 220, 255),
		Dialogue = Color3.fromRGB(40, 25, 60),
		Toggle = Color3.fromRGB(255, 100, 180),
		Slider = Color3.fromRGB(120, 220, 255)
	},

	Terminal = {
		Core = Color3.fromRGB(5, 5, 5),
		Divider = Color3.fromRGB(0, 255, 0),
		Text = Color3.fromRGB(180, 255, 180),
		Placeholder = Color3.fromRGB(90, 150, 90),
		DropdownImage = Color3.fromRGB(0, 255, 0),
		DropdownIndicator = Color3.fromRGB(0, 200, 0),
		Global = Color3.fromRGB(0, 255, 0),
		Dragger = Color3.fromRGB(0, 255, 0),
		TabImage = Color3.fromRGB(0, 255, 0),
		TabName = Color3.fromRGB(0, 255, 0),
		Dialogue = Color3.fromRGB(15, 15, 15),
		Toggle = Color3.fromRGB(0, 255, 0),
		Slider = Color3.fromRGB(0, 255, 0)
	}
}

Storage.Assets = {
	InterFont = "rbxassetid://12187365364",
	UserInfoBlurred = "rbxassetid://18824089198",
	ToggleBackground = "rbxassetid://18772190202",
	TogglerHead = "rbxassetid://18772309008",
	ButtonImage = "rbxassetid://10709791437",
	SearchIcon = "rbxassetid://86737463322606",
	ColorWheel = "rbxassetid://85695059746508",
	ColorTarget = "rbxassetid://73265255323268",
	Grid = "rbxassetid://121484455191370",
	Globe = "rbxassetid://108952102602834",
	Transform = "rbxassetid://90336395745819",
	Dropdown = "rbxassetid://18865373378",
	Sliderbar = "rbxassetid://18772615246",
	Sliderhead = "rbxassetid://18772834246",
}

return Storage