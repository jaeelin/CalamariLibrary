local Button = {}

function Button:Create(Context: {}, Settings: {}, Flag: string)
	local ButtonFunctions = {Settings = Settings}

	local button = Instance.new("Frame")
	button.Name = "Button"
	button.AutomaticSize = Enum.AutomaticSize.Y
	button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	button.BackgroundTransparency = 1
	button.BorderColor3 = Color3.fromRGB(0, 0, 0)
	button.BorderSizePixel = 0
	button.Size = UDim2.new(1, 0, 0, 38)
	button.Parent = Context.Section

	local button_interact = Instance.new("TextButton")
	button_interact.Name = "ButtonInteract"
	button_interact.FontFace = Font.new(Context.Variables.Storage.Assets.InterFont)
	button_interact.RichText = true
	button_interact.TextSize = 13
	button_interact.TextTransparency = 0.5
	button_interact.TextTruncate = Enum.TextTruncate.AtEnd
	button_interact.TextXAlignment = Enum.TextXAlignment.Left
	button_interact.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	button_interact.BackgroundTransparency = 1
	button_interact.BorderColor3 = Color3.fromRGB(0, 0, 0)
	button_interact.BorderSizePixel = 0
	button_interact.Size = UDim2.fromScale(1, 1)
	button_interact.Parent = button
	button_interact.Text = ButtonFunctions.Settings.Name

	Context.RegisterThemed(button_interact, "TextColor3", "Text")

	local button_image = Instance.new("ImageLabel")
	button_image.Name = "button_image"
	button_image.Image = Context.Variables.Storage.Assets.ButtonImage
	button_image.ImageTransparency = 0.5
	button_image.AnchorPoint = Vector2.new(1, 0.5)
	button_image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	button_image.BackgroundTransparency = 1
	button_image.BorderColor3 = Color3.fromRGB(0, 0, 0)
	button_image.BorderSizePixel = 0
	button_image.Position = UDim2.fromScale(1, 0.5)
	button_image.Size = UDim2.fromOffset(15, 15)
	button_image.Parent = button

	Context.RegisterThemed(button_image, "ImageColor3", "DropdownIndicator")

	local TweenSettings = {
		DefaultTransparency = 0.5,
		HoverTransparency = 0.3,

		EasingStyle = Enum.EasingStyle.Sine
	}

	button_interact.MouseEnter:Connect(function()
		Context.Tween(button_interact, TweenInfo.new(0.2, TweenSettings.EasingStyle), {TextTransparency = TweenSettings.HoverTransparency}):Play()
		Context.Tween(button_image, TweenInfo.new(0.2, TweenSettings.EasingStyle), {ImageTransparency = TweenSettings.HoverTransparency}):Play()
	end)

	button_interact.MouseLeave:Connect(function()
		Context.Tween(button_interact, TweenInfo.new(0.2, TweenSettings.EasingStyle), {TextTransparency = TweenSettings.DefaultTransparency}):Play()
		Context.Tween(button_image, TweenInfo.new(0.2, TweenSettings.EasingStyle), {ImageTransparency = TweenSettings.DefaultTransparency}):Play()
	end)

	button_interact.MouseButton1Click:Connect(function()
		if ButtonFunctions.Settings.Callback then
			ButtonFunctions.Settings.Callback()
		end
	end)

	function ButtonFunctions:UpdateName(Name: string)
		button_interact.Text = Name
	end

	function ButtonFunctions:SetVisibility(State: boolean)
		button.Visible = State
	end

	if Flag then
		Calamari.Options[Flag] = ButtonFunctions
	end

	return ButtonFunctions
end

return Button