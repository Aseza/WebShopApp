package classes;
//Class to model an Order, with full quantity
public class Order {
    private int freeItemsValue,total,numberOfPieces;
    private String name;

    public String getName() {
        return name;
    }

    public int getNumberOfPieces() {
		return numberOfPieces;
	}

	public int getFreeItemsValue() {
		return freeItemsValue;
	}

	public int getValue() {
		return numberOfPieces;
	}

	public Order(int freeItemsValue, int total, String name,int value) {
        this.freeItemsValue = freeItemsValue;
        this.total = total;
        this.name = name;
        this.numberOfPieces = value;
    }

    public int getfreeItemsValue() {
        return freeItemsValue;
    }

    public int getTotal() {
        return total;
    }


}
