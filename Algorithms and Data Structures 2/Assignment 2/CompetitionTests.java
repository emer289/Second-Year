import org.junit.Test;
import static org.junit.Assert.*;

public class CompetitionTests {

	@Test
	public void testDijkstraConstructor() {
		CompetitionDijkstra c = new CompetitionDijkstra("tinyEWD.txt", 60, 50, 55);
		assertEquals("Checking CompetitionDijkstra speed", "60", String.valueOf(c.sA));
		assertEquals("Checking CompetitionDijkstra streets", "15", String.valueOf(c.streets));
		assertEquals("Checking CompetitionDijkstra nodes", "8", String.valueOf(c.V));

	}

	@Test
	public void testDijkstraConstructorForNullFile() {

		CompetitionDijkstra f = new CompetitionDijkstra(null, 50, 80, 60);
		assertEquals("Checking CompetitionDijkstra when file is null ", "-1",
				String.valueOf(f.timeRequiredforCompetition()));

	}


	@Test
	public void testDijkstraInputB() {

		CompetitionDijkstra l = new CompetitionDijkstra("input-B.txt", 60, 70, 84);
        assertEquals("Checking CompetitionDijkstra for input-B ","8334", String.valueOf(l.timeRequiredforCompetition()));

	}
	
	@Test
	public void testDijkstraInvalidSpeed() {

		CompetitionDijkstra l = new CompetitionDijkstra("input-B.txt", 30, 70, 84);
        assertEquals("Checking CompetitionDijkstra for invalid speed ","-1", String.valueOf(l.timeRequiredforCompetition()));

	}

	@Test
	public void testDijkstraInputA() {

		CompetitionDijkstra l = new CompetitionDijkstra("input-A.txt", 60, 70, 84);
        assertEquals("Checking CompetitionDijkstra for input-A ","-1", String.valueOf(l.timeRequiredforCompetition()));

	}
	
	@Test
	public void testDijkstraInputB1() {

		CompetitionDijkstra l = new CompetitionDijkstra("input-B.txt", 70, 60, 84);
        assertEquals("Checking CompetitionDijkstra for input-B ","8334", String.valueOf(l.timeRequiredforCompetition()));

	}
	@Test
	public void testDijkstraInputI() {
		CompetitionDijkstra k = new CompetitionDijkstra("input-I.txt", 84, 70, 60);
      assertEquals("Checking CompetitionDijkstra for input-I.txt ","200", String.valueOf(k.timeRequiredforCompetition()));
	
}
	
	@Test
	public void testDijkstraFakeFile() {
		CompetitionDijkstra k = new CompetitionDijkstra("jdhfkhds", 84, 70, 60);
      assertEquals("Checking CompetitionDijkstra for fake file ","-1", String.valueOf(k.timeRequiredforCompetition()));
	
}
	@Test
	public void testFWConstructor() {
		CompetitionFloydWarshall c = new CompetitionFloydWarshall("tinyEWD.txt", 60, 50, 55);
		assertEquals("Checking CompetitionFloydWarshall speed", "60", String.valueOf(c.sA));
		assertEquals("Checking CompetitionFloydWarshall streets", "15", String.valueOf(c.streets));
		assertEquals("Checking CompetitionFloydWarshall nodes", "8", String.valueOf(c.V));

	}

	@Test
	public void testFWConstructorForNullFile() {
		CompetitionFloydWarshall f = new CompetitionFloydWarshall(null, 50, 80, 60);
		assertEquals("Checking CompetitionFloydWarshall when file is null ", "-1",
				String.valueOf(f.timeRequiredforCompetition()));

	}


	@Test
	public void testFWInputB() {

		CompetitionFloydWarshall l = new CompetitionFloydWarshall("input-B.txt", 60, 70, 84);
        assertEquals("Checking CompetitionFloydWarshall for input-B ","8334", String.valueOf(l.timeRequiredforCompetition()));

	}
	
	@Test
	public void testFWInvalidSpeed() {

		CompetitionFloydWarshall l = new CompetitionFloydWarshall("input-B.txt", 30, 70, 84);
        assertEquals("Checking CompetitionFloydWarshall for invalid speed ","-1", String.valueOf(l.timeRequiredforCompetition()));

	}
	@Test
	public void testFWInputA() {

		CompetitionFloydWarshall l = new CompetitionFloydWarshall("input-A.txt", 60, 70, 84);
        assertEquals("Checking CompetitionFloydWarshall for input-A ","-1", String.valueOf(l.timeRequiredforCompetition()));

	}
	
	@Test
	public void testFWInputB1() {

		CompetitionFloydWarshall l = new CompetitionFloydWarshall("input-B.txt", 70, 60, 84);
        assertEquals("Checking CompetitionFloydWarshall for input-B ","8334", String.valueOf(l.timeRequiredforCompetition()));

	}
	
	@Test
	public void testFWInputI() {
		CompetitionFloydWarshall k = new CompetitionFloydWarshall("input-I.txt", 84, 70, 60);
      assertEquals("Checking CompetitionFloydWarshall for input-I.txt ","200", String.valueOf(k.timeRequiredforCompetition()));
	
}
	@Test
	public void testFWFakeFile() {
		CompetitionFloydWarshall k = new CompetitionFloydWarshall("jdhfkhds", 84, 70, 60);
      assertEquals("Checking CompetitionFloydWarshall for fake file ","-1", String.valueOf(k.timeRequiredforCompetition()));
	
}

}