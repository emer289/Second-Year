import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

/*
 * 
 * A Contest to Meet (ACM) is a reality TV contest that sets three contestants at three random
 * city intersections. In order to win, the three contestants need all to meet at any intersection
 * of the city as fast as possible.
 * It should be clear that the contestants may arrive at the intersections at different times, in
 * which case, the first to arrive can wait until the others arrive.
 * From an estimated walking speed for each one of the three contestants, ACM wants to determine the
 * minimum time that a live TV broadcast should last to cover their journey regardless of the contestantsâ€™
 * initial positions and the intersection they finally meet. You are hired to help ACM answer this question.
 * You may assume the following:
 *    ï‚· Each contestant walks at a given estimated speed.
 *    ï‚· The city is a collection of intersections in which some pairs are connected by one-way
 * streets that the contestants can use to traverse the city.
 *
 * This class implements the competition using Dijkstra's algorithm
 */

public class CompetitionFloydWarshall {

	/**
	 * @param filename: A filename containing the details of the city road network
	 * @param sA,       sB, sC: speeds for 3 contestants
	 */
	static final int METERS_TO_KM = 1000;
	static final int INFI = Integer.MAX_VALUE;
	int sA;
	private int sB;
	private int sC;

	int V=0;
	int streets;

	private double[][] streetInfo;
	private double[][] graph;
	private double maxD = 0;
	private double minS = 0;
	private int time;
	private Scanner scanner;
	private double[][] dist;
	int i;

	/**
	 * @param filename: A filename containing the details of the city road network
	 * @param sA,       sB, sC: speeds for 3 contestants
	 */
	CompetitionFloydWarshall(String filename, int sA, int sB, int sC) {

		this.sA = sA;
		this.sB = sB;
		this.sC = sC;
		i = 0;
		if (filename != null) {
			try {
				scanner = new Scanner(new File(filename));
				//if (scanner.hasNextDouble()) {
					V = scanner.nextInt();
					streets = scanner.nextInt();
					streetInfo = new double[(int) streets][3];
					for (; i < streets ; i++) {//&& scanner.hasNextDouble()
						for (int j = 0; j < 3; j++) {
							streetInfo[i][j] = scanner.nextDouble();
						}
					}

				//}
			} catch (FileNotFoundException s) {
				System.out.println("File does Not Exist Please Try Again: ");
			}
			if (V > 0 ) {//&& i == streets
				graph = new double[V][V];
				// Initialize the graph
				for (int k = 0; k < V; k++) {
					for (int j = 0; j < V; j++) {
						if (k == j)
							graph[k][j] = 0;
						else
							graph[k][j] = INFI;
					}
				}

				for (int k = 0; k < streetInfo.length; k++) {
					for (int j = 0; j < 3; j++) {
						graph[(int) streetInfo[k][j++]][(int) streetInfo[k][j++]] = streetInfo[k][j];
					}
				}
			}
		}
	}
//code taken from GeeksforGeeks
	void dfloydWarshall(double graph[][]) {
		dist = new double[V][V];
		int i, j, k;

		for (i = 0; i < V; i++)
			for (j = 0; j < V; j++)
				dist[i][j] = graph[i][j];

		for (k = 0; k < V; k++) {

			for (i = 0; i < V; i++) {

				for (j = 0; j < V; j++) {

					if (dist[i][k] + dist[k][j] < dist[i][j])
						dist[i][j] = dist[i][k] + dist[k][j];
				}
			}
		}

		// Print the shortest distance matrix
		printSolution(dist);
	}

	void printSolution(double dist[][]) {
		int max_min = 0;

		for (int i = 0; i < V; ++i) {
			for (int j = 0; j < V; ++j) {
				if (dist[i][j] != INFI && max_min < dist[i][j]) {
					max_min = (int) dist[i][j];
				}
			}
		}
	}

	/**
	 * @return int: minimum minutes that will pass before the three contestants can
	 *         meet
	 */
	public int timeRequiredforCompetition() {
		time = -1;
		if (V == 0 ) {     //|| i != streets
			return -1;
		}
		// the speeds are valid
		if ((50 <= sA && 50 <= sB && 50 <= sC && sA <= 100 && sB <= 100 && sC <= 100)) {// && (V != 0 && streets != 0)
			dist = new double[(int) V][(int) V];

			dfloydWarshall(graph);
			for (int j = 0; j < V; j++) {
				for (int i = 0; i < dist.length; i++) {
					if (maxD < dist[j][i] && dist[j][i] != Integer.MAX_VALUE) {
						maxD = dist[j][i];
					}
				}
			}

			// check for path
			for (int i = 0; i < V; i++) {
				for (int j = 0; j < V; j++) {
					if (dist[i][j] == INFI ) {    //|| dist[j][i] == INFI
						return -1;
					}
				}
			}

			// get slowest pace
			if (sA < sB && sA < sC) {
				minS = sA;
			} else if (sB < sA && sB < sC) {
				minS = sB;
			} else {
				minS = sC;
			}
			
			if (maxD * METERS_TO_KM % minS == 0) {
				time = (int) ((maxD * METERS_TO_KM) / minS);
			} else {
				time = (int) (((maxD * METERS_TO_KM) / minS) + 1);
			}
			System.out.println("distance is " + maxD);
			System.out.println("speed is " + minS);
			System.out.println("time is " + time);
		}
		return (int) time;
	}

	

	 

}