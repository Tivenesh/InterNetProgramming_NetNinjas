package com.example.DBService;

import java.util.ArrayList;
import java.util.List;
import com.example.model.Client;

public class ClientList {
    
    private static List<Client> clients = new ArrayList<>();

    public static void add(Client client) {
        clients.add(client);
    }

    public static List<Client> getClients() {
        return new ArrayList<>(clients);
    }

    public static Client getClientDetail(String name) {
        for (Client client : clients) {
            if (client.getName().equalsIgnoreCase(name)) {
                return client;
            }
        }
        return null; 
    }

    public static boolean updateClient(String name, Client updatedClient) {
        for (int i = 0; i < clients.size(); i++) {
            Client client = clients.get(i);
            if (client.getName().equalsIgnoreCase(name)) {
                clients.set(i, updatedClient);
                return true;
            }
        }
        return false; 
    }

    public static boolean deleteClient(String name) {
        return clients.removeIf(client -> client.getName().equalsIgnoreCase(name));
    }
}
