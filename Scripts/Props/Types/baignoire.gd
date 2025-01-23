extends GenericProp

func _ready() -> void:
	onInteract.connect(onGenericPropInteract)
	onInteract.connect(_onBathtubInteract)

func _onBathtubInteract() :
	print("moi je suis une baignoire")
