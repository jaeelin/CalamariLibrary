local Toggle = {}

function Toggle:Create(Context: {}, Settings: {}, Flag: string)
	local ToggleFunctions = { Settings = Settings, IgnoreConfig = false, Class = "Toggle" }
	
	local Enabled = ToggleFunctions.Settings.Default

	local toggle = Instance.new("Frame")
	toggle.Name = "Toggle"
	toggle.AutomaticSize = Enum.AutomaticSize.Y
	toggle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	toggle.BackgroundTransparency = 1
	toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	toggle.BorderSizePixel = 0
	toggle.Size = UDim2.new(1, 0, 0, 38)
	toggle.Parent = Context.Section

	local toggle_name = Instance.new("TextLabel")
	toggle_name.Name = "ToggleName"
	toggle_name.FontFace = Font.new(Context.Variables.Storage.Assets.InterFont)
	toggle_name.Text = ToggleFunctions.Settings.Name
	toggle_name.RichText = true
	toggle_name.TextSize = 13
	toggle_name.TextTransparency = 0.5
	toggle_name.TextTruncate = Enum.TextTruncate.AtEnd
	toggle_name.TextXAlignment = Enum.TextXAlignment.Left
	toggle_name.TextYAlignment = Enum.TextYAlignment.Top
	toggle_name.AnchorPoint = Vector2.new(0, 0.5)
	toggle_name.AutomaticSize = Enum.AutomaticSize.Y
	toggle_name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	toggle_name.BackgroundTransparency = 1
	toggle_name.BorderColor3 = Color3.fromRGB(0, 0, 0)
	toggle_name.BorderSizePixel = 0
	toggle_name.Position = UDim2.fromScale(0, 0.5)
	toggle_name.Size = UDim2.new(1, -50, 0, 0)
	toggle_name.Parent = toggle

	Context.RegisterThemed(toggle_name, "TextColor3", "Text")

	local toggle_button = Instance.new("ImageButton")
	toggle_button.Name = "Toggle"
	toggle_button.Image = Context.Variables.Storage.Assets.ToggleBackground
	toggle_button.ImageColor3 = Color3.fromRGB(87, 86, 86)
	toggle_button.AutoButtonColor = false
	toggle_button.AnchorPoint = Vector2.new(1, 0.5)
	toggle_button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	toggle_button.BackgroundTransparency = 1
	toggle_button.BorderColor3 = Color3.fromRGB(0, 0, 0)
	toggle_button.BorderSizePixel = 0
	toggle_button.Position = UDim2.fromScale(1, 0.5)
	toggle_button.Size = UDim2.fromOffset(41, 21)
	toggle_button.ImageTransparency = 0.5
	toggle_button.Parent = toggle

	local toggle_padding = Instance.new("UIPadding")
	toggle_padding.Name = "ToggleUIPadding"
	toggle_padding.PaddingBottom = UDim.new(0, 1)
	toggle_padding.PaddingLeft = UDim.new(0, -2)
	toggle_padding.PaddingRight = UDim.new(0, 3)
	toggle_padding.PaddingTop = UDim.new(0, 1)
	toggle_padding.Parent = toggle_button

	local toggler_head = Instance.new("ImageLabel")
	toggler_head.Name = "TogglerHead"
	toggler_head.Image = Context.Variables.Storage.Assets.TogglerHead
	toggler_head.ImageColor3 = Color3.fromRGB(255, 255, 255)
	toggler_head.AnchorPoint = Vector2.new(1, 0.5)
	toggler_head.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	toggler_head.BackgroundTransparency = 1
	toggler_head.BorderColor3 = Color3.fromRGB(0, 0, 0)
	toggler_head.BorderSizePixel = 0
	toggler_head.Position = UDim2.fromScale(0.5, 0.5)
	toggler_head.Size = UDim2.fromOffset(15, 15)
	toggler_head.ZIndex = 2
	toggler_head.Parent = toggle_button
	toggler_head.ImageTransparency = 0.8
	
	local ToggleColor = {
		Enabled = Context.Variables.Storage.Themes[Context.Variables.CurrentTheme].Toggle,
		Disabled = Color3.fromRGB(255,255,255)
	}

	local TweenSettings = {
		Info = TweenInfo.new(0.15, Enum.EasingStyle.Quad),
		EnabledPosition = UDim2.new(1, 0, 0.5, 0),
		DisabledPosition = UDim2.new(0.5, 0, 0.5, 0),
	}

	local function NewState(State: boolean, Callback: () -> ())
		local transparency_values = State and {0, 0}or {0.5, 0.85}
		local position = State and TweenSettings.EnabledPosition or TweenSettings.DisabledPosition
		local color = State and ToggleColor.Enabled or ToggleColor.Disabled

		Context.Tween(toggle_button, TweenSettings.Info, {
			ImageTransparency = transparency_values[1]
		}):Play()

		Context.Tween(toggler_head, TweenSettings.Info, {
			ImageTransparency = transparency_values[2]
		}):Play()

		Context.Tween(toggler_head, TweenSettings.Info, {
			Position = position,
			ImageColor3 = color
		}):Play()

		ToggleFunctions.State = State
		
		if Callback then
			Callback(Enabled)
		end
	end

	Context.RegisterThemeCallback(function()
		ToggleColor.Enabled = Context.Variables.Storage.Themes[Context.Variables.CurrentTheme].Toggle

		NewState(ToggleFunctions.State)
	end)
	
	toggle_button.MouseButton1Click:Connect(function()
		Enabled = not Enabled

		NewState(Enabled, ToggleFunctions.Settings.Callback)
	end)

	function ToggleFunctions:Toggle()
		Enabled = not Enabled
		
		NewState(Enabled, ToggleFunctions.Settings.Callback)
	end
	
	function ToggleFunctions:UpdateState(State: boolean)
		Enabled = State
		
		NewState(Enabled, ToggleFunctions.Settings.Callback)
	end
	
	function ToggleFunctions:GetState()
		return Enabled
	end
	
	function ToggleFunctions:UpdateName(Name: string)
		toggle_name.Text = Name
	end
	
	function ToggleFunctions:SetVisibility(State: boolean)
		toggle.Visible = State
	end

	if Flag then
		Context.Options[Flag] = ToggleFunctions
	end
	
	NewState(Enabled)
	
	return ToggleFunctions
end

return Toggle