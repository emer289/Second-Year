
// Java implementation of Dijkstra's Algorithm
// using Priority Queue
import java.io.File;
import java.io.FileNotFoundException;
import java.util.*;

public class CompetitionDijkstra {
	static final int METERS_TO_KM = 1000;
	private double dist[];
	private Set<Integer> settled;
	private PriorityQueue<Node> pq;
	int V=0; // Number of vertices
	List<List<Node>> adj;
	int source = 2;
	Scanner scanner;
	int streets = 0;
	double[][] streetInfo = null;
	int z = 0;
	int sA;
	int sB;
	int sC;
	double maxD;
	int time;
	int minS;

	CompetitionDijkstra(String filename, int sA, int sB, int sC) {
		this.sA = sA;
		this.sB = sB;
		this.sC = sC;
		if (filename != null) {
			try {
				scanner = new Scanner(new File(filename));
				//if (scanner.hasNextDouble()) {
					V = scanner.nextInt();
					streets = scanner.nextInt();
					streetInfo = new double[(int) streets][3];
					for (; z < streets; z++) {//&& scanner.hasNextDouble()
						for (int j = 0; j < 3; j++) {
							streetInfo[z][j] = scanner.nextDouble();
						}
					}
				//}
			} catch (FileNotFoundException s) {
				System.out.println("File does Not Exist Please Try Again: ");
			}
			if (V > 0 ) {//&& z == streets
				adj = new ArrayList<List<Node>>();

				for (int i = 0; i < V; i++) {
					List<Node> item = new ArrayList<Node>();
					adj.add(item);
				}

				int get;
				int index;
				double value;
				for (int k = 0; k < streets; k++) {
					for (int j = 0; j < 3; j++) {
						get = (int) streetInfo[k][j++];
						index = (int) streetInfo[k][j++];
						value = streetInfo[k][j];
						adj.get(get).add(new Node(index, value));

					}
				}

				dist = new double[V];

			}
		}
	}
//code taken from GeeksforGeeks
	void dijkstra(List<List<Node>> adj, int src) {
		// this.adj = adj;
		pq = new PriorityQueue<Node>(V, new Node());
		settled = new HashSet<Integer>();
		for (int i = 0; i < V; i++)
			dist[i] = Integer.MAX_VALUE;

		// Add source node to the priority queue
		pq.add(new Node(src, 0));

		// Distance to the source is 0
		dist[src] = 0;
		while (settled.size() != V) {

			// remove the minimum distance node
			// from the priority queue
			int u = pq.remove().node;

			// adding the node whose distance is
			// finalized
			settled.add(u);
			if (adj.get(u).size() != 0)
				e_Neighbours(u);
			else
				break;
		}
	}

	void e_Neighbours(int u) {
		double edgeDistance = -1;
		double newDistance = -1;

		// All the neighbors of v
		for (int i = 0; i < adj.get(u).size(); i++) {
			Node v = adj.get(u).get(i);

			// If current node hasn't already been processed
			if (!settled.contains(v.node)) {
				edgeDistance = v.cost;
				newDistance = dist[u] + edgeDistance;

				// If new distance is cheaper in cost
				if (newDistance < dist[v.node])
					dist[v.node] = newDistance;

				// Add the current node to the queue
				pq.add(new Node(v.node, dist[v.node]));
			}
		}
	}

	public int timeRequiredforCompetition() {
		time = -1;
	if (V == 0 ) {//|| z != streets
			return -1;
		}
		if ((50 <= sA && 50 <= sB && 50 <= sC && sA <= 100 && sB <= 100 && sC <= 100) ) {//&& (V != 0 && streets != 0)
			for (int j = 0; j < V; j++) {
				dijkstra(adj, j);

				System.out.println("The shorted path from node :");
				for (int i = 0; i < dist.length; i++) {
					System.out.println(j + " to " + i + " is " + dist[i]);

					if (maxD < dist[i] && dist[i] != Integer.MAX_VALUE) {
						maxD = dist[i];
					}
					if (dist[i] == Integer.MAX_VALUE) {
						return -1;
					}

				}
				System.out.println(" maxD is " + maxD);
			}

			// get slowest pace
			if (sA < sB && sA < sC) {
				minS = sA;
			} else if (sB < sA && sB < sC) {
				minS = sB;
			} else {
				minS = sC;
			}
			//*1000 to go from meters to km
			if (maxD * METERS_TO_KM % minS == 0) {
				time = (int) ((maxD * METERS_TO_KM) / minS);
			} else {
				time = (int) (((maxD * METERS_TO_KM) / minS) + 1);
			}
			System.out.println("distance is " + maxD);
			System.out.println("speed is " + minS);

		}
		System.out.println("time is " + time);
		return time;
	}

	
}

class Node implements Comparator<Node> {
	public int node;
	public double cost;

	public Node() {
	}

	public Node(int node, double cost) {
		this.node = node;
		this.cost = cost;
	}

	@Override
	public int compare(Node node1, Node node2) {
		if (node1.cost < node2.cost)
			return -1;
		if (node1.cost > node2.cost)
			return 1;
		return 0;
	}
}
