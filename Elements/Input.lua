local Input = {}

function Input:Create(Context: {}, Settings: {}, Flag: string)
	local InputFunctions = { Settings = Settings, IgnoreConfig = false, Class = "Input" }

	local input = Instance.new("Frame")
	input.Name = "Input"
	input.AutomaticSize = Enum.AutomaticSize.Y
	input.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	input.BackgroundTransparency = 1
	input.BorderColor3 = Color3.fromRGB(0, 0, 0)
	input.BorderSizePixel = 0
	input.Size = UDim2.new(1, 0, 0, 38)
	input.Parent = Context.Section

	local input_name = Instance.new("TextLabel")
	input_name.Name = "InputName"
	input_name.FontFace = Font.new(Context.Variables.Storage.Assets.InterFont)
	input_name.Text = InputFunctions.Settings.Name
	input_name.RichText = true
	input_name.TextSize = 13
	input_name.TextTransparency = 0.5
	input_name.TextTruncate = Enum.TextTruncate.AtEnd
	input_name.TextXAlignment = Enum.TextXAlignment.Left
	input_name.TextYAlignment = Enum.TextYAlignment.Top
	input_name.AnchorPoint = Vector2.new(0, 0.5)
	input_name.AutomaticSize = Enum.AutomaticSize.XY
	input_name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	input_name.BackgroundTransparency = 1
	input_name.BorderColor3 = Color3.fromRGB(0, 0, 0)
	input_name.BorderSizePixel = 0
	input_name.Position = UDim2.fromScale(0, 0.5)
	input_name.Parent = input

	Context.RegisterThemed(input_name, "TextColor3", "Text")

	local input_box = Instance.new("TextBox")
	input_box.Name = "InputBox"
	input_box.FontFace = Font.new(Context.Variables.Storage.Assets.InterFont)
	input_box.Text = "Hello world!"
	input_box.TextSize = 12
	input_box.TextTransparency = 0.1
	input_box.AnchorPoint = Vector2.new(1, 0.5)
	input_box.AutomaticSize = Enum.AutomaticSize.X
	input_box.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	input_box.BackgroundTransparency = 0.95
	input_box.BorderColor3 = Color3.fromRGB(0, 0, 0)
	input_box.BorderSizePixel = 0
	input_box.ClipsDescendants = true
	input_box.LayoutOrder = 1
	input_box.Position = UDim2.fromScale(1, 0.5)
	input_box.Size = UDim2.fromOffset(21, 21)
	input_box.TextXAlignment = Enum.TextXAlignment.Right
	input_box.Parent = input

	Context.RegisterThemed(input_box, "TextColor3", "Text")
	Context.RegisterThemed(input_box, "PlaceholderColor3", "Placeholder")

	local input_box_corner = Instance.new("UICorner")
	input_box_corner.Name = "InputBoxUICorner"
	input_box_corner.CornerRadius = UDim.new(0, 4)
	input_box_corner.Parent = input_box

	local input_box_stroke = Instance.new("UIStroke")
	input_box_stroke.Name = "InputBoxUIStroke"
	input_box_stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	input_box_stroke.Color = Color3.fromRGB(255, 255, 255)
	input_box_stroke.Transparency = 0.9
	input_box_stroke.Parent = input_box

	local input_box_padding = Instance.new("UIPadding")
	input_box_padding.Name = "InputBoxUIPadding"
	input_box_padding.PaddingLeft = UDim.new(0, 5)
	input_box_padding.PaddingRight = UDim.new(0, 5)
	input_box_padding.Parent = input_box

	local input_box_constraint = Instance.new("UISizeConstraint")
	input_box_constraint.Name = "InputBoxUISizeConstraint"
	input_box_constraint.Parent = input_box

	local function ApplyLimit(Value: string)
		if InputFunctions.Settings.CharacterLimit then
			return Value:sub(1, InputFunctions.Settings.CharacterLimit)
		end

		return Value
	end

	local CharacterSubs = {
		All = function(Value: string)
			return ApplyLimit(Value)
		end,

		Numeric = function(Value: string)
			local result = Value:match("^%-?%d*$") and Value or Value:gsub("[^%d-]", ""):gsub("(%-)", function(Match: string, Position: number)
				return Position == 1 and Match or ""
			end)

			return ApplyLimit(result)
		end,

		Alphabetic = function(Value: string)
			return ApplyLimit(Value:gsub("[^a-zA-Z ]", ""))
		end,

		AlphaNumeric = function(Value: string)
			return ApplyLimit(Value:gsub("[^a-zA-Z0-9]", ""))
		end,
	}

	local AcceptedCharacters

	if type(InputFunctions.Settings.AcceptedCharacters) == "function" then
		AcceptedCharacters = InputFunctions.Settings.AcceptedCharacters
	else
		AcceptedCharacters = CharacterSubs[InputFunctions.Settings.AcceptedCharacters] or CharacterSubs.All
	end

	input_box.AutomaticSize = Enum.AutomaticSize.X

	local function CheckSize()
		local name_width = input_name.AbsoluteSize.X
		local total_width = input.AbsoluteSize.X

		local max_width = (total_width - name_width - 20) / Context.BaseScale.Scale

		input_box_constraint.MaxSize = Vector2.new(max_width, 9e9)
	end

	CheckSize()

	input_name:GetPropertyChangedSignal("AbsoluteSize"):Connect(CheckSize)

	input_box.FocusLost:Connect(function()
		local input = input_box.Text
		local filtered = AcceptedCharacters(input)

		input_box.Text = filtered

		task.spawn(function()
			if InputFunctions.Settings.Callback then
				InputFunctions.Settings.Callback(filtered)
			end
		end)
	end)

	input_box.Text = InputFunctions.Settings.Default or ""
	input_box.PlaceholderText = InputFunctions.Settings.Placeholder or ""

	input_box:GetPropertyChangedSignal("Text"):Connect(function()
		input_box.Text = AcceptedCharacters(input_box.Text)

		if InputFunctions.Settings.OnChanged then
			InputFunctions.Settings.OnChanged(input_box.Text)
		end

		InputFunctions.Text = input_box.Text
	end)

	function InputFunctions:UpdateName(Name: string)
		input_name.Text = Name
	end

	function InputFunctions:SetVisibility(State: boolean)
		input.Visible = State
	end

	function InputFunctions:GetInput()
		return input_box.Text
	end

	function InputFunctions:UpdatePlaceholder(Placeholder: string)
		input_box.PlaceholderText = Placeholder
	end

	function InputFunctions:UpdateText(Text: string)
		local filtered = AcceptedCharacters(Text)
		input_box.Text = filtered
		InputFunctions.Text = filtered

		task.spawn(function()
			if InputFunctions.Settings.Callback then
				InputFunctions.Settings.Callback(filtered)
			end
		end)
	end

	if Flag then
		Context.Options[Flag] = InputFunctions
	end

	return InputFunctions
end

return Input