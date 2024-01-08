package com.greensuper.market.namojsp;
import java.util.ArrayList;
import java.util.List;

public class Cart {
    private List<String> items;

    public Cart() {
        this.items = new ArrayList<>();
    }

    public List<String> getItems() {
        return items;
    }

    public void addItem(String itemId) {
        items.add(itemId);
    }

    public void removeItem(String itemId) {
        items.remove(itemId);
    }
}
