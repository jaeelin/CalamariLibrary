local InputActionSystem = {}

local function CreateAction(Context: Instance, Name: string, KeyCode: Enum, ActionType: Enum)
	local action = Instance.new("InputAction")
	action.Name = Name
	action.Type = ActionType
	action.Parent = Context

	local binding = Instance.new("InputBinding")
	binding.KeyCode = KeyCode
	binding.Parent = action

	return action, binding
end

function InputActionSystem:Setup(Context: {})
	local input_context = Instance.new("InputContext")
	input_context.Parent = game.CoreGui
	input_context.Enabled = true

	local ui_toggle_action = CreateAction(
		input_context,
		"UIToggle",
		Context.MenuKeybind,
		Enum.InputActionType.Bool
	)

	local mouse_position = CreateAction(
		input_context,
		"MousePosition",
		Enum.KeyCode.MousePosition,
		Enum.InputActionType.ViewportPosition
	)
	
	local slider_action = CreateAction(
		input_context,
		"SliderAction",
		Enum.KeyCode.MousePosition,
		Enum.InputActionType.ViewportPosition
	)
	
	return {
		InputContext = input_context,
		UIToggleAction = ui_toggle_action,
		MousePosition = mouse_position,
		SliderAction = slider_action
	}
end

return InputActionSystem