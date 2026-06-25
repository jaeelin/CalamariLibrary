local Controls = {}

local ControlSettings = {
	Sizes = { Enabled = UDim2.fromOffset(8, 8), Disabled = UDim2.fromOffset(7, 7) },
	Transparencies = { Enabled = 0, Disabled = 1 }
}

local function ApplyState(Context: {}, Button: Instance, Enabled: boolean)
	local size = Enabled and ControlSettings.Sizes.Enabled or ControlSettings.Sizes.Disabled
	local transparency = Enabled and ControlSettings.Transparencies.Enabled or ControlSettings.Transparencies.Disabled

	Button.Size = size
	Button.BackgroundTransparency = transparency
	Button.Active = Enabled
	Button.Interactable = Enabled

	for _, child in next, Button:GetChildren() do
		if child:IsA("UIStroke") then
			child.Transparency = transparency
		end
	end

	if not Enabled then
		Context.Stroke:Clone().Parent = Button
	end
end


function Controls:Init(Context: {})
	ApplyState(Context, Context.Maximize, false)

	local controls_list = {Context.Exit, Context.Minimize}

	for _, button in next, controls_list do
		local enabled = true

		if Context.Settings.DisabledWindowControls and table.find(Context.Settings.DisabledWindowControls, button.Name) then
			enabled = false
		end

		ApplyState(Context, button, enabled)
	end
end

return Controls