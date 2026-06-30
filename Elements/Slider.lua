local Slider = {}

function Slider:Create(Context: {}, Settings: {}, Flag: string)
	local SliderFunctions = { Settings = Settings, IgnoreConfig = false, Class = "Slider" }

	local slider = Instance.new("Frame")
	slider.Name = "Slider"
	slider.AutomaticSize = Enum.AutomaticSize.Y
	slider.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	slider.BackgroundTransparency = 1
	slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
	slider.BorderSizePixel = 0
	slider.Size = UDim2.new(1, 0, 0, 38)
	slider.Parent = Context.Section

	local slider_name = Instance.new("TextLabel")
	slider_name.Name = "SliderName"
	slider_name.FontFace = Font.new(Context.Variables.Storage.Assets.InterFont)
	slider_name.Text = SliderFunctions.Settings.Name
	slider_name.RichText = true
	slider_name.TextSize = 13
	slider_name.TextTransparency = 0.5
	slider_name.TextTruncate = Enum.TextTruncate.AtEnd
	slider_name.TextXAlignment = Enum.TextXAlignment.Left
	slider_name.TextYAlignment = Enum.TextYAlignment.Top
	slider_name.AnchorPoint = Vector2.new(0, 0.5)
	slider_name.AutomaticSize = Enum.AutomaticSize.XY
	slider_name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	slider_name.BackgroundTransparency = 1
	slider_name.BorderColor3 = Color3.fromRGB(0, 0, 0)
	slider_name.BorderSizePixel = 0
	slider_name.Position = UDim2.fromScale(1.3e-07, 0.5)
	slider_name.Parent = slider

	Context.RegisterThemed(slider_name, "TextColor3", "Text")

	local slider_elements = Instance.new("Frame")
	slider_elements.Name = "SliderElements"
	slider_elements.AnchorPoint = Vector2.new(1, 0)
	slider_elements.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	slider_elements.BackgroundTransparency = 1
	slider_elements.BorderColor3 = Color3.fromRGB(0, 0, 0)
	slider_elements.BorderSizePixel = 0
	slider_elements.Position = UDim2.fromScale(1, 0)
	slider_elements.Size = UDim2.fromScale(1, 1)
	slider_elements.Parent = slider

	local slider_value = Instance.new("TextBox")
	slider_value.Name = "SliderValue"
	slider_value.FontFace = Font.new(Context.Variables.Storage.Assets.InterFont)
	slider_value.TextSize = 12
	slider_value.TextTransparency = 0.1
	--slider_value.TextTruncate = Enum.TextTruncate.AtEnd
	slider_value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	slider_value.BackgroundTransparency = 0.95
	slider_value.BorderColor3 = Color3.fromRGB(0, 0, 0)
	slider_value.BorderSizePixel = 0
	slider_value.LayoutOrder = 1
	slider_value.Position = UDim2.fromScale(-0.0789, 0.171)
	slider_value.Size = UDim2.fromOffset(41, 21)
	slider_value.ClipsDescendants = true
	slider_value.Parent = slider_elements

	Context.RegisterThemed(slider_value, "TextColor3", "Text")

	local slider_value_corner = Instance.new("UICorner")
	slider_value_corner.Name = "SliderValueUICorner"
	slider_value_corner.CornerRadius = UDim.new(0, 4)
	slider_value_corner.Parent = slider_value

	local slider_value_stroke = Instance.new("UIStroke")
	slider_value_stroke.Name = "SliderValueUIStroke"
	slider_value_stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	slider_value_stroke.Color = Color3.fromRGB(255, 255, 255)
	slider_value_stroke.Transparency = 0.9
	slider_value_stroke.Parent = slider_value

	local slider_value_padding = Instance.new("UIPadding")
	slider_value_padding.Name = "SliderValueUIPadding"
	slider_value_padding.PaddingLeft = UDim.new(0, 2)
	slider_value_padding.PaddingRight = UDim.new(0, 2)
	slider_value_padding.Parent = slider_value

	local slider_elements_list_layout = Instance.new("UIListLayout")
	slider_elements_list_layout.Name = "SliderElementsUIListLayout"
	slider_elements_list_layout.Padding = UDim.new(0, 20)
	slider_elements_list_layout.FillDirection = Enum.FillDirection.Horizontal
	slider_elements_list_layout.HorizontalAlignment = Enum.HorizontalAlignment.Right
	slider_elements_list_layout.SortOrder = Enum.SortOrder.LayoutOrder
	slider_elements_list_layout.VerticalAlignment = Enum.VerticalAlignment.Center
	slider_elements_list_layout.Parent = slider_elements

	local slider_bar = Instance.new("ImageLabel")
	slider_bar.Name = "SliderBar"
	slider_bar.Image = Context.Variables.Storage.Assets.Sliderbar
	slider_bar.ImageColor3 = Color3.fromRGB(87, 86, 86)
	slider_bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	slider_bar.BackgroundTransparency = 1
	slider_bar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	slider_bar.BorderSizePixel = 0
	slider_bar.Position = UDim2.fromScale(0.219, 0.457)
	slider_bar.Size = UDim2.fromOffset(123, 3)
	slider_bar.Parent = slider_elements

	local slider_head = Instance.new("ImageButton")
	slider_head.Name = "SliderHead"
	slider_head.Image = Context.Variables.Storage.Assets.Sliderhead
	slider_head.AnchorPoint = Vector2.new(0.5, 0.5)
	slider_head.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	slider_head.BackgroundTransparency = 1
	slider_head.BorderColor3 = Color3.fromRGB(0, 0, 0)
	slider_head.BorderSizePixel = 0
	slider_head.Position = UDim2.fromScale(1, 0.5)
	slider_head.Size = UDim2.fromOffset(12, 12)
	slider_head.Parent = slider_bar

	Context.RegisterThemed(slider_head, "ImageColor3", "Slider")

	local slider_elements_padding = Instance.new("UIPadding")
	slider_elements_padding.Name = "SliderElementsUIPadding"
	slider_elements_padding.PaddingTop = UDim.new(0, 3)
	slider_elements_padding.Parent = slider_elements

	local dragging = false

	local DisplayMethods = {
		Hundredths = function(slider_value)
			return string.format("%.2f", slider_value)
		end,

		Tenths = function(slider_value)
			return string.format("%.1f", slider_value)
		end,

		Round = function(slider_value, precision)
			if precision then
				return string.format("%." .. precision .. "f", slider_value)
			else
				return tostring(math.round(slider_value))
			end
		end,

		Degrees = function(slider_value, precision)
			local formattedValue = precision and string.format("%." .. precision .. "f", slider_value) or tostring(slider_value)
			return formattedValue .. "°"
		end,

		Percent = function(slider_value, precision)
			local percentage = (slider_value - SliderFunctions.Settings.Minimum) / (SliderFunctions.Settings.Maximum - SliderFunctions.Settings.Minimum) * 100
			return precision and string.format("%." .. precision .. "f", percentage) .. "%" or tostring(math.round(percentage)) .. "%"
		end,

		Value = function(slider_value, precision)
			return precision and string.format("%." .. precision .. "f", slider_value) or tostring(slider_value)
		end
	}

	local ValueDisplayMethod = DisplayMethods[SliderFunctions.Settings.DisplayMethod] or DisplayMethods.Value
	
	local final_value

	local function SetValue(Value: any, IgnoreCallback: boolean)
		local position_scale

		if typeof(Value) == "Instance" then
			position_scale = math.clamp((Value.Position.X - slider_bar.AbsolutePosition.X) / slider_bar.AbsoluteSize.X, 0, 1)
		elseif typeof(Value) == "Vector2" then
			position_scale = math.clamp((Value.X - slider_bar.AbsolutePosition.X) / slider_bar.AbsoluteSize.X, 0, 1)
		elseif typeof(Value) == "number" then
			position_scale = (Value - SliderFunctions.Settings.Minimum) /(SliderFunctions.Settings.Maximum - SliderFunctions.Settings.Minimum)
		end

		local pos = UDim2.new(position_scale, 0, 0.5, 0)
		
		slider_head.Position = pos

		final_value = position_scale * (SliderFunctions.Settings.Maximum - SliderFunctions.Settings.Minimum) + SliderFunctions.Settings.Minimum

		slider_value.Text = (Settings.Prefix or "") .. ValueDisplayMethod(final_value, SliderFunctions.Settings.Precision) .. (Settings.Suffix or "")

		if not IgnoreCallback and SliderFunctions.Settings.Callback then
			task.spawn(function()
				SliderFunctions.Settings.Callback(final_value)
			end)
		end

		SliderFunctions.Value = final_value
	end

	SetValue(SliderFunctions.Settings.Default, true)

	slider_head.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			SetValue(input)
		end
	end)

	slider_head.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = false

			if SliderFunctions.Settings.onInputComplete then
				SliderFunctions.Settings.onInputComplete(final_value)
			end
		end
	end)

	slider_value.FocusLost:Connect(function()
		local input_text = slider_value.Text
		local value, is_percent = input_text:match("^(%-?%d+%.?%d*)(%%?)$")

		if value then
			value = tonumber(value)
			is_percent = is_percent == "%"

			if is_percent then
				value = SliderFunctions.Settings.Minimum + (value / 100) * (SliderFunctions.Settings.Maximum - SliderFunctions.Settings.Minimum)
			end

			local new_value = math.clamp(value, SliderFunctions.Settings.Minimum, SliderFunctions.Settings.Maximum)
			
			SetValue(new_value)
		else
			slider_value.Text = ValueDisplayMethod(slider_value)
		end

		if SliderFunctions.Settings.onInputComplete then
			SliderFunctions.Settings.onInputComplete(final_value)
		end
	end)

	Context.IASContext.SliderAction.StateChanged:Connect(function(Position: Vector2)
		if not dragging then
			return
		end

		SetValue(Position)
	end)

	local function UpdateBarSize()
		local padding = slider_elements_list_layout.Padding.Offset
		local slider_value_width = slider_value.AbsoluteSize.X
		local slider_name_width = slider_name.AbsoluteSize.X
		local total_width = slider_elements.AbsoluteSize.X

		local bar_width = (slider_elements.AbsoluteSize.X - (padding + slider_value_width + slider_name_width + 20)) / Context.BaseScale.Scale

		slider_bar.Size = UDim2.new(slider_bar.Size.X.Scale, bar_width, slider_bar.Size.Y.Scale, slider_bar.Size.Y.Offset)
	end

	UpdateBarSize()

	slider_name:GetPropertyChangedSignal("AbsoluteSize"):Connect(UpdateBarSize)

	Context.Section:GetPropertyChangedSignal("AbsoluteSize"):Connect(UpdateBarSize)

	function SliderFunctions:UpdateName(Name: string)
		slider_name = Name
	end

	function SliderFunctions:SetVisibility(State: boolean)
		slider.Visible = State
	end

	function SliderFunctions:UpdateValue(Value: any)
		SetValue(tonumber(Value), true)
	end

	function SliderFunctions:GetValue()
		return final_value
	end

	if Flag then
		Context.Options[Flag] = SliderFunctions
	end

	return SliderFunctions
end 

return Slider