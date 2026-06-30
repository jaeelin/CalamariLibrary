local Input = {}

function Input:Create(Context: {}, Settings: {}, Flag: string)
	local KeybindFunctions = { Settings = Settings, IgnoreConfig = false, Class = "Keybind" }

	local keybind = Instance.new("Frame")
	keybind.Name = "Keybind"
	keybind.AutomaticSize = Enum.AutomaticSize.Y
	keybind.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	keybind.BackgroundTransparency = 1
	keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
	keybind.BorderSizePixel = 0
	keybind.Size = UDim2.new(1, 0, 0, 38)
	keybind.Parent = Context.Section

	local keybind_name = Instance.new("TextLabel")
	keybind_name.Name = "KeybindName"
	keybind_name.FontFace = Font.new(Context.Variables.Storage.Assets.InterFont)
	keybind_name.Text = KeybindFunctions.Settings.Name
	keybind_name.RichText = true
	keybind_name.TextSize = 13
	keybind_name.TextTransparency = 0.5
	keybind_name.TextTruncate = Enum.TextTruncate.AtEnd
	keybind_name.TextXAlignment = Enum.TextXAlignment.Left
	keybind_name.TextYAlignment = Enum.TextYAlignment.Top
	keybind_name.AnchorPoint = Vector2.new(0, 0.5)
	keybind_name.AutomaticSize = Enum.AutomaticSize.XY
	keybind_name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	keybind_name.BackgroundTransparency = 1
	keybind_name.BorderColor3 = Color3.fromRGB(0, 0, 0)
	keybind_name.BorderSizePixel = 0
	keybind_name.Position = UDim2.fromScale(0, 0.5)
	keybind_name.Parent = keybind

	Context.RegisterThemed(keybind_name, "TextColor3", "Text")

	local binder_box = Instance.new("TextBox")
	binder_box.Name = "BinderBox"
	binder_box.CursorPosition = -1
	binder_box.FontFace = Font.new(Context.Variables.Storage.Assets.InterFont)
	binder_box.PlaceholderText = "..."
	binder_box.Text = ""
	binder_box.TextColor3 = Color3.fromRGB(255, 255, 255)
	binder_box.TextSize = 12
	binder_box.TextTransparency = 0.1
	binder_box.AnchorPoint = Vector2.new(1, 0.5)
	binder_box.AutomaticSize = Enum.AutomaticSize.X
	binder_box.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	binder_box.BackgroundTransparency = 0.95
	binder_box.BorderColor3 = Color3.fromRGB(0, 0, 0)
	binder_box.BorderSizePixel = 0
	binder_box.ClipsDescendants = true
	binder_box.LayoutOrder = 1
	binder_box.Position = UDim2.fromScale(1, 0.5)
	binder_box.Size = UDim2.fromOffset(21, 21)
	binder_box.Parent = keybind

	local binder_box_corner = Instance.new("UICorner")
	binder_box_corner.Name = "BinderBoxUICorner"
	binder_box_corner.CornerRadius = UDim.new(0, 4)
	binder_box_corner.Parent = binder_box

	local binder_box_stroke = Instance.new("UIStroke")
	binder_box_stroke.Name = "BinderBoxUIStroke"
	binder_box_stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	binder_box_stroke.Color = Color3.fromRGB(255, 255, 255)
	binder_box_stroke.Transparency = 0.9
	binder_box_stroke.Parent = binder_box

	local binder_box_padding = Instance.new("UIPadding")
	binder_box_padding.Name = "BinderBoxUIPadding"
	binder_box_padding.PaddingLeft = UDim.new(0, 5)
	binder_box_padding.PaddingRight = UDim.new(0, 5)
	binder_box_padding.Parent = binder_box

	local binder_box_constraint = Instance.new("UISizeConstraint")
	binder_box_constraint.Name = "BinderBoxUISizeConstraint"
	binder_box_constraint.Parent = binder_box

	local focused
	local binding = false
	local reset = false
	local binded = KeybindFunctions.Settings.Default

	KeybindFunctions.Binded = binded

	local function ResetFocus()
		focused = false
		binding = false
		binder_box:ReleaseFocus()
	end

	if binded then
		binder_box.Text = binded.Name
	end

	binder_box.Focused:Connect(function()
		focused = true
	end)

	binder_box.FocusLost:Connect(function()
		focused = false
	end)

	local KeybindBegan = Context.Services.UserInputService.InputBegan:Connect(function(Input: InputObject, GameProcessed: boolean)
		if focused and not binding then
			binding = true

			local Event
			Event = Context.Services.UserInputService.InputBegan:Connect(function(Input: InputObject)
				if KeybindFunctions.Settings.Blacklist and (table.find(KeybindFunctions.KeybindFunctions.Settings.Blacklist, Input.KeyCode) or table.find(KeybindFunctions.Settings.Blacklist, Input.UserInputType)) then
					binder_box:ReleaseFocus()
					ResetFocus()
					Event:Disconnect()
					return
				end

				if Input.UserInputType == Enum.UserInputType.Keyboard then
					binded = Input.KeyCode
					KeybindFunctions.Binded = binded
					binder_box.Text = Input.KeyCode.Name
				elseif Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.MouseButton2 then
					binded = Input.UserInputType
					KeybindFunctions.Binded = binded
					binder_box.Text = Input.UserInputType.Name
				end

				if KeybindFunctions.Settings.OnBinded then
					KeybindFunctions.Settings.OnBinded(binded)
				end

				reset = true
				ResetFocus()
				Event:Disconnect()
			end)
		else
			if GameProcessed then return end

			if not reset and (Input.KeyCode == binded or Input.UserInputType == binded) then
				if KeybindFunctions.Settings.Callback then
					KeybindFunctions.Settings.Callback(binded)
				end

				if KeybindFunctions.Settings.OnBindHeld then
					KeybindFunctions.Settings.OnBindHeld(true, binded)
				end
			else
				reset = false
			end
		end
	end)

	table.insert(Context.Connections, KeybindBegan)

	local KeybindEnded = Context.Services.UserInputService.InputEnded:Connect(function(Input: InputObject)
		if not focused and not binding then
			if Input.KeyCode == binded or Input.UserInputType == binded then
				if Settings.OnBindHeld then
					Settings.OnBindHeld(false, binded)
				end
			end
		end
	end)

	table.insert(Context.Connections, KeybindEnded)

	function KeybindFunctions:Bind(Key: Enum)
		binded = Key
		KeybindFunctions.Binded = binded
		binder_box.Text = Key.Name
	end

	function KeybindFunctions:Unbind()
		binded = nil
		KeybindFunctions.Binded = binded
		binder_box.Text = ""
	end

	function KeybindFunctions:GetBind()
		return binded
	end

	function KeybindFunctions:UpdateName(Name: string)
		keybind_name = Name
	end

	function KeybindFunctions:SetVisibility(State: boolean)
		keybind.Visible = State
	end

	if Flag then
		Context.Options[Flag] = KeybindFunctions
	end

	return KeybindFunctions
end

return Input