import java.util.*;

public class LinkStateRouter {

    private String id;
    private Map<String, Integer> linkStateDatabase;
    private Map<String, Integer> shortestPaths;
    private Map<String, String> nextHop;

    public LinkStateRouter(String id) {
        this.id = id;
        this.linkStateDatabase = new HashMap<>();
        this.shortestPaths = new HashMap<>();
        this.nextHop = new HashMap<>();
    }

    public void addLink(String neighborId, int cost) {
        linkStateDatabase.put(neighborId, cost);
    }

    public void calculateShortestPaths(Set<LinkStateRouter> allRouters) {
        for (LinkStateRouter router : allRouters) {
            shortestPaths.put(router.getId(), Integer.MAX_VALUE);
            nextHop.put(router.getId(), null);
        }
        shortestPaths.put(this.id, 0);

        PriorityQueue<Map.Entry<String, Integer>> pq = new PriorityQueue<>(
                Comparator.comparingInt(Map.Entry::getValue));
        pq.add(new AbstractMap.SimpleEntry<>(this.id, 0));

        Set<String> visited = new HashSet<>();

        while (!pq.isEmpty()) {
            Map.Entry<String, Integer> currentEntry = pq.poll();
            String currentRouterId = currentEntry.getKey();
            int currentDistance = currentEntry.getValue();

            if (visited.contains(currentRouterId)) {
                continue;
            }
            visited.add(currentRouterId);

            LinkStateRouter currentRouter = null;
            for (LinkStateRouter r : allRouters) {
                if (r.getId().equals(currentRouterId)) {
                    currentRouter = r;
                    break;
                }
            }

            if (currentRouter == null) continue;

            for (Map.Entry<String, Integer> neighborEntry : currentRouter.getLinkStateDatabase().entrySet()) {
                String neighborId = neighborEntry.getKey();
                int linkCost = neighborEntry.getValue();

                int newDistance = currentDistance + linkCost;

                if (newDistance < shortestPaths.getOrDefault(neighborId, Integer.MAX_VALUE)) {
                    shortestPaths.put(neighborId, newDistance);
                    if (currentRouterId.equals(this.id)) {
                        nextHop.put(neighborId, neighborId);
                    } else {
                        nextHop.put(neighborId, nextHop.get(currentRouterId));
                    }
                    pq.add(new AbstractMap.SimpleEntry<>(neighborId, newDistance));
                }
            }
        }
    }

    public void printRoutingTable() {
        System.out.println("Routing Table for Router " + id + ":");
        for (Map.Entry<String, Integer> entry : shortestPaths.entrySet()) {
            String destination = entry.getKey();
            int distance = entry.getValue();
            String nextHopRouter = nextHop.get(destination);

            if (!destination.equals(this.id)) {
                System.out.println("Destination: " + destination +
                        ", Distance: " + (distance == Integer.MAX_VALUE ? "Infinity" : distance) +
                        ", Next Hop: " + (nextHopRouter == null ? "N/A" : nextHopRouter));
            }
        }
        System.out.println();
    }

    public String getId() {
        return id;
    }

    public Map<String, Integer> getLinkStateDatabase() {
        return linkStateDatabase;
    }

    public static void main(String[] args) {
        LinkStateRouter routerA = new LinkStateRouter("A");
        LinkStateRouter routerB = new LinkStateRouter("B");
        LinkStateRouter routerC = new LinkStateRouter("C");
        LinkStateRouter routerD = new LinkStateRouter("D");

        routerA.addLink("B", 1);
        routerA.addLink("C", 4);

        routerB.addLink("A", 1);
        routerB.addLink("C", 2);
        routerB.addLink("D", 5);

        routerC.addLink("A", 4);
        routerC.addLink("B", 2);
        routerC.addLink("D", 1);

        routerD.addLink("B", 5);
        routerD.addLink("C", 1);

        Set<LinkStateRouter> allRouters = new HashSet<>();
        allRouters.add(routerA);
        allRouters.add(routerB);
        allRouters.add(routerC);
        allRouters.add(routerD);

        for (LinkStateRouter router : allRouters) {
            router.calculateShortestPaths(allRouters);
            router.printRoutingTable();
        }
    }
}