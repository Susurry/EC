extends GenericProp

func _ready() -> void:
	onInteract.connect(onGenericPropInteract)
	onInteract.connect(_onRadiatorInteract)

func _onRadiatorInteract() :
	print("je suis un radiateur :D")
