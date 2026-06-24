local Utilities = {}

function Utilities:Tween(Context: {}, Instance: Instance, Info: TweenInfo, Table: {})
	return Context.Services.TweenService:Create(Instance, Info, Table)
end

function Utilities:RegisterThemed(Context: {}, Instance: Instance, Property: string, Key: string)
	table.insert(Context.Variables.ThemedElements, {
		instance = Instance,
		property = Property,
		key = Key
	})

	Instance[Property] = Context.Themes[Context.Variables.CurrentTheme][Key]
end

function Utilities:RegisterThemeCallback(Context: {}, Callback: () -> ())
	table.insert(Context.Variables.ThemedCallbacks, Callback)
	Callback(Context.Variables.CurrentTheme)
end

return Utilities