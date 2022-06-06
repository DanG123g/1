extends CanvasLayer

var coins = 0

func _ready():
	
	var coinNode = get_tree().get_root().find_node("Coin2d",true,false)
	coinNode.connect("coinCollected", self, "handleCoinCollected")
	 
	$CoinsCollectedText.text = String(coins)

func handlecoinCollected():
	print("Coin Collected")    
	coins+=1 
	$CoinsCollectedText.text = String(coins)
