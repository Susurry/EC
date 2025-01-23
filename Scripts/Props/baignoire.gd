extends GenericProp


func _init() -> void:
	onInteract.connect(onGenericPropInteract)
	onInteract.connect(_onBathtubInteract)

func _onBathtubInteract() :
	print("moi je suis une baignoire")
