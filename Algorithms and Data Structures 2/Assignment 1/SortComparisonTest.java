import static org.junit.Assert.*;

import java.util.Arrays;
import java.util.Scanner;
import java.util.concurrent.TimeUnit;
import java.io.File;
import java.io.FileNotFoundException;

import org.junit.Test;
import org.junit.rules.*;
import org.junit.Ignore;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

/*
 * results in nano seconds
 * 									Insert		Selection		Quick		Merge
 * 1000 random:						5430.699	7765.273		520.133		669.305
 * 10000 random:					62510.938	45238.899		1299.465	2,065.715
 * 1000 numbers reversed:			1296.575	474.718			1295.141	206.323
 * 1000 numbers sorted:				199.996		375.777			351.736		137.342
 * 1000 duplicate numbers:			437.027		396.599			65.842		176.0039
 * 1000 nearly ordered numbers:		345.208		322.329			69.737		183.13
 * 
 * 								
 * 
 * */

//-------------------------------------------------------------------------
/**
 *  Test class for SortComparison.java
 *
 *  @author
 *  @version HT 2020
 */
@RunWith(JUnit4.class)
public class SortComparisonTest
{
    //~ Constructor ........................................................
    @Test
    public void testConstructor()
    {
        new SortComparison();
    }

    //~ Public Methods ........................................................

    // ----------------------------------------------------------
    /**
     * Check that the methods work for empty arrays
     */
    @Test
    public void testEmpty()
    {
    	double[] a = new double[3];
    	SortComparison b = new SortComparison();
    	b.insertionSort(a);
    	assertEquals("Checking insertionSort with an empty array", "[0.0, 0.0, 0.0]", Arrays.toString(a));
    	b.selectionSort(a);
    	assertEquals("Checking selectionSort with an empty array", "[0.0, 0.0, 0.0]", Arrays.toString(a));
    	b.mergeSort(a);
    	assertEquals("Checking mergeSort with an empty array", "[0.0, 0.0, 0.0]", Arrays.toString(a));
    	b.quickSort(a);
    	assertEquals("Checking quickSort with an empty array", "[0.0, 0.0, 0.0]", Arrays.toString(a));
 	
    }
    
    @Test
    public void testOneElement()
    {
    	double[] a = {2};
    	SortComparison b = new SortComparison();
    	b.insertionSort(a);
    	assertEquals("Checking insertionSort with an empty array", "[2.0]", Arrays.toString(a));
    	b.selectionSort(a);
    	assertEquals("Checking selectionSort with an empty array", "[2.0]", Arrays.toString(a));
    	b.mergeSort(a);
    	assertEquals("Checking mergeSort with an empty array", "[2.0]", Arrays.toString(a));
    	b.quickSort(a);
    	assertEquals("Checking quickSort with an empty array", "[2.0]", Arrays.toString(a));
 	
    }
    
    
    @Test
    public void testMultipleElements()
    {
    	SortComparison b = new SortComparison();
    	double[] a = {2, 8.6, 5, 8, 12.9, 37, 104.7, 90};
    	b.insertionSort(a);
    	assertEquals("Checking insertionSort with an array", "[2.0, 5.0, 8.0, 8.6, 12.9, 37.0, 90.0, 104.7]", Arrays.toString(a));
    	
    	double[] c = {2, 8.6, 5, 8, 12.9, 37, 104.7, 90};
    	b.selectionSort(c);
    	assertEquals("Checking selectionSort with an  array", "[2.0, 5.0, 8.0, 8.6, 12.9, 37.0, 90.0, 104.7]", Arrays.toString(c));
    	
    	double[] d = {2, 8.6, 5, 8, 12.9, 37, 104.7, 90};
    	b.mergeSort(d);
    	assertEquals("Checking mergeSort with an array", "[2.0, 5.0, 8.0, 8.6, 12.9, 37.0, 90.0, 104.7]", Arrays.toString(d));
    	
    	double[] f = {2, 8.6, 5, 8, 12.9, 37, 104.7, 90};
    	b.quickSort(f);
    	assertEquals("Checking quickSort with an array", "[2.0, 5.0, 8.0, 8.6, 12.9, 37.0, 90.0, 104.7]", Arrays.toString(f));
    	
    	//elements ordered for quicksort
    	double[] g = {2.0, 5.0, 8.0, 8.6, 12.9, 37.0, 90.0, 104.7};
    	b.quickSort(g);
    	assertEquals("Checking quickSort with an array", "[2.0, 5.0, 8.0, 8.6, 12.9, 37.0, 90.0, 104.7]", Arrays.toString(g));
    	
    	//elements ordered reverse  for quicksort
    	double[] z = {104.7, 90.0, 37.0, 12.9, 8.6, 8.0, 5.0, 2.0};
    	b.quickSort(z);
    	assertEquals("Checking quickSort with an array", "[2.0, 5.0, 8.0, 8.6, 12.9, 37.0, 90.0, 104.7]", Arrays.toString(z));
 	
    }

    /**
     * Check that the methods work for empty arrays
     */

    // TODO: add more tests here. Each line of code and ech decision in Collinear.java should
    // be executed at least once from at least one test.

    // ----------------------------------------------------------
    /**
     *  Main Method.
     *  Use this main method to create the experiments needed to answer the experimental performance questions of this assignment.
     * @throws InterruptedException 
     *
     */
    /*
	public static void main(String[] args) throws InterruptedException {
		
		//for the stopwatch I'm using the Auxiliary files from assignment 1
		
	    Scanner scanNumbers1000;
	    Scanner scanNumbers10000;
	    Scanner scanNumbers1000Duplicates;
	    Scanner scanNumbersNearlyOrdered1000;
	    Scanner scanNumbersReverse1000;
	    Scanner scanNumbersSorted1000;
	    
	    //different array for each sorting algorithm so that 
	    //the array is not sorted by the previous algorithm when the algorithm needs to sort it
	    
	    double[] numbers1000QuickSort = new double[1000];
	    double[] numbers1000MergeSort = new double[1000];
	    double[] numbers1000SelectionSort = new double[1000];
	    double[] numbers1000InsertionSort = new double[1000];
	    
	    double[] numbers10000QuickSort = new double[10000];
	    double[] numbers10000MergeSort = new double[10000];
	    double[] numbers10000SelectionSort = new double[10000];
	    double[] numbers10000InsertionSort = new double[10000];
	    
	    double[] numbers1000DuplicatesQuickSort = new double[1000];
	    double[] numbers1000DuplicatesMergeSort = new double[1000];
	    double[] numbers1000DuplicatesSelectionSort = new double[1000];
	    double[] numbers1000DuplicatesInsertionSort = new double[1000];
	    
	    double[] numbersNearlyOrdered1000QuickSort = new double[1000];
	    double[] numbersNearlyOrdered1000MergeSort = new double[1000];
	    double[] numbersNearlyOrdered1000SelectionSort = new double[1000];
	    double[] numbersNearlyOrdered1000InsertionSort = new double[1000];
	    
	    
	    double[] numbersReverse1000QuickSort = new double[1000];
	    double[] numbersReverse1000MergeSort = new double[1000];
	    double[] numbersReverse1000SelectionSort = new double[1000];
	    double[] numbersReverse1000InsertionSort = new double[1000];
	    
	    double[] numbersSorted1000QuickSort = new double[1000];
	    double[] numbersSorted1000MergeSort = new double[1000];
	    double[] numbersSorted1000SelectionSort = new double[1000];
	    double[] numbersSorted1000InsertionSort = new double[1000];
	    
	    File fileNumbers1000 = new File("src/numbers1000.txt");
	    File fileNumbers10000 = new File("src/numbers10000.txt");
	    File fileNumbers1000Duplicates = new File("src/numbers1000Duplicates.txt");
	    File fileNumbersNearlyOrdered1000 = new File("src/numbersNearlyOrdered1000.txt");
	    File fileNumbersReverse1000 = new File("src/numbersReverse1000.txt");
	    File fileNumbersSorted1000 = new File("src/numbersSorted1000.txt");
	    
	    
	    try {
	        scanNumbers1000 = new Scanner(fileNumbers1000);
	        scanNumbers10000 = new Scanner(fileNumbers10000);
	        scanNumbers1000Duplicates = new Scanner(fileNumbers1000Duplicates);
	        scanNumbersNearlyOrdered1000 = new Scanner(fileNumbersNearlyOrdered1000);
	        scanNumbersReverse1000 = new Scanner(fileNumbersReverse1000);
	        scanNumbersSorted1000 = new Scanner(fileNumbersSorted1000);

	        while(scanNumbers1000.hasNextDouble())
	        {
	            for(int i=0; i<1000; i++) { 
	            	double next = scanNumbers1000.nextDouble();
	            	numbers1000QuickSort[i] = next;
	            	numbers1000MergeSort[i] = next;
	            	numbers1000SelectionSort[i] = next;
	            	numbers1000InsertionSort[i] = next;	
	            }
	        }
	        
	        while(scanNumbers10000.hasNextDouble())
	        {
	            for(int i=0; i<10000; i++) { 
	            	double next = scanNumbers10000.nextDouble();
	            	numbers10000QuickSort[i] = next;
	            	numbers10000MergeSort[i] = next;
	            	numbers10000SelectionSort[i] = next;
	            	numbers10000InsertionSort[i] = next;
	            }
	        }
	        
	        while(scanNumbers1000Duplicates.hasNextDouble())
	        {
	            for(int i=0; i<1000; i++) { 
	            	double next = scanNumbers1000Duplicates.nextDouble();
	            	numbers1000DuplicatesQuickSort[i] = next;
	            	numbers1000DuplicatesMergeSort[i] = next;
	            	numbers1000DuplicatesSelectionSort[i] = next;
	            	numbers1000DuplicatesInsertionSort[i] = next;
	            }
	        }
	        
	        while(scanNumbersNearlyOrdered1000.hasNextDouble())
	        {
	            for(int i=0; i<1000; i++) { 
	            	double next = scanNumbersNearlyOrdered1000.nextDouble();
	            	numbersNearlyOrdered1000QuickSort[i] = next;
	            	numbersNearlyOrdered1000MergeSort[i] = next;
	            	numbersNearlyOrdered1000SelectionSort[i] = next;
	            	numbersNearlyOrdered1000InsertionSort[i] = next;
	            }
	        }
	        
	        while(scanNumbersReverse1000.hasNextDouble())
	        {
	            for(int i=0; i<1000; i++) {
	            	double next = scanNumbersReverse1000.nextDouble();
	            	numbersReverse1000QuickSort[i] = next;
	            	numbersReverse1000MergeSort[i] = next;
	            	numbersReverse1000SelectionSort[i] = next;
	            	numbersReverse1000InsertionSort[i] = next;
	            }
	        }
	        
	        while(scanNumbersSorted1000.hasNextDouble())
	        {
	            for(int i=0; i<1000; i++) { 
	            	double next = scanNumbersSorted1000.nextDouble();
	            	numbersSorted1000QuickSort[i] = next;
	            	numbersSorted1000MergeSort[i] = next;
	            	numbersSorted1000SelectionSort[i] = next;
	            	numbersSorted1000InsertionSort[i] = next;
	            	
	            }
	        }

	    } catch (FileNotFoundException e1) {
	            e1.printStackTrace();
	    }
	    
		SortComparison b = new SortComparison();
		
		//insertion sort
		
		Stopwatch stopwatch0 = new Stopwatch();
		b.insertionSort(numbers1000InsertionSort);
		double elapsedTimeFast0 = stopwatch0.elapsedTime();
		System.out.println("elapsed time for insertion sort with 1000 numbers " + elapsedTimeFast0 + "\n");

		Stopwatch stopwatch1 = new Stopwatch();
		b.insertionSort(numbers10000InsertionSort);
		double elapsedTimeFast1 = stopwatch1.elapsedTime();
		System.out.println("elapsed time for insertion sort with 10000 numbers " + elapsedTimeFast1 + "\n");
		
		Stopwatch stopwatch2 = new Stopwatch();
		b.insertionSort(numbersReverse1000InsertionSort);
		double elapsedTimeFast2 = stopwatch2.elapsedTime();
		System.out.println("elapsed time for insertion sort with 1000 numbers reversed " + elapsedTimeFast2 + "\n");

		Stopwatch stopwatch3 = new Stopwatch();
		b.insertionSort(numbersSorted1000InsertionSort);
		double elapsedTimeFast3 = stopwatch3.elapsedTime();
		System.out.println("elapsed time for insertion sort with 1000 numbers sorted " + elapsedTimeFast3 + "\n");

		Stopwatch stopwatch4 = new Stopwatch();
		b.insertionSort(numbers1000DuplicatesInsertionSort);
		double elapsedTimeFast4 = stopwatch4.elapsedTime();
		System.out.println("elapsed time for insertion sort with 1000 duplicate numbers " + elapsedTimeFast4 + "\n");
		
		Stopwatch stopwatch5 = new Stopwatch();
		b.insertionSort(numbersNearlyOrdered1000InsertionSort);
		double elapsedTimeFast5 = stopwatch5.elapsedTime();
		System.out.println("elapsed time for insertion sort with 1000 nearly ordered numbers " + elapsedTimeFast5 + "\n\n");


		
		//selection sort
		
		Stopwatch stopwatch6 = new Stopwatch();
		b.selectionSort(numbers1000SelectionSort);
		double elapsedTimeFast6 = stopwatch6.elapsedTime();
		System.out.println("elapsed time for selection sort with 1000 numbers " + elapsedTimeFast6 + "\n");

		Stopwatch stopwatch7 = new Stopwatch();
		b.selectionSort(numbers10000SelectionSort);
		double elapsedTimeFast7 = stopwatch7.elapsedTime();
		System.out.println("elapsed time for selection sort with 10000 numbers " + elapsedTimeFast7 + "\n");
		
		Stopwatch stopwatch8 = new Stopwatch();
		b.selectionSort(numbersReverse1000SelectionSort);
		double elapsedTimeFast8 = stopwatch8.elapsedTime();
		System.out.println("elapsed time for selection sort with 1000 numbers reversed " + elapsedTimeFast8 + "\n");

		Stopwatch stopwatch9 = new Stopwatch();
		b.selectionSort(numbersSorted1000SelectionSort);
		double elapsedTimeFast9 = stopwatch9.elapsedTime();
		System.out.println("elapsed time for selection sort with 1000 numbers sorted " + elapsedTimeFast9 + "\n");

		Stopwatch stopwatch10 = new Stopwatch();
		b.selectionSort(numbers1000DuplicatesSelectionSort);
		double elapsedTimeFast10 = stopwatch10.elapsedTime();
		System.out.println("elapsed time for selection sort with 1000 duplicate numbers " + elapsedTimeFast10 + "\n");
		
		Stopwatch stopwatch11 = new Stopwatch();
		b.selectionSort(numbersNearlyOrdered1000SelectionSort);
		double elapsedTimeFast11 = stopwatch11.elapsedTime();
		System.out.println("elapsed time for selection sort with 1000 nearly ordered numbers " + elapsedTimeFast11 + "\n\n");

		
		
		//quicksort
		
		
	
		Stopwatch stopwatch12 = new Stopwatch();
		b.quickSort(numbers1000QuickSort);
		double elapsedTimeFast12 = stopwatch12.elapsedTime();
		System.out.println("elapsed time for quick sort with 1000 numbers " + elapsedTimeFast12 + "\n");

		Stopwatch stopwatch13 = new Stopwatch();
		b.quickSort(numbers10000QuickSort);
		double elapsedTimeFast13 = stopwatch13.elapsedTime();
		System.out.println("elapsed time for quick sort with 10000 numbers " + elapsedTimeFast13 + "\n");
		
		Stopwatch stopwatch14 = new Stopwatch();
		b.quickSort(numbersReverse1000QuickSort);
		double elapsedTimeFast14 = stopwatch14.elapsedTime();
		System.out.println("elapsed time for quick sort with 1000 numbers reversed " + elapsedTimeFast14 + "\n");

		Stopwatch stopwatch15 = new Stopwatch();
		b.quickSort(numbersSorted1000QuickSort);
		double elapsedTimeFast15 = stopwatch15.elapsedTime();
		System.out.println("elapsed time for quick sort with 1000 numbers sorted " + elapsedTimeFast15 + "\n");

		Stopwatch stopwatch16 = new Stopwatch();
		b.quickSort(numbers1000DuplicatesQuickSort);
		double elapsedTimeFast16 = stopwatch16.elapsedTime();
		System.out.println("elapsed time for quick sort with 1000 duplicate numbers " + elapsedTimeFast16 + "\n");
		
		Stopwatch stopwatch17 = new Stopwatch();
		b.quickSort(numbersNearlyOrdered1000QuickSort);
		double elapsedTimeFast17 = stopwatch17.elapsedTime();
		System.out.println("elapsed time for quick sort with 1000 nearly ordered numbers " + elapsedTimeFast17 + "\n\n");

		
		//merge sort
		
		
		Stopwatch stopwatch18 = new Stopwatch();
		b.mergeSort(numbers1000MergeSort);
		double elapsedTimeFast18 = stopwatch18.elapsedTime();
		System.out.println("elapsed time for merge sort with 1000 numbers " + elapsedTimeFast18 + "\n");

		Stopwatch stopwatch19 = new Stopwatch();
		b.mergeSort(numbers10000MergeSort);
		double elapsedTimeFast19 = stopwatch19.elapsedTime();
		System.out.println("elapsed time for merge sort with 10000 numbers " + elapsedTimeFast19 + "\n");
		
		Stopwatch stopwatch20 = new Stopwatch();
		b.mergeSort(numbersReverse1000MergeSort);
		double elapsedTimeFast20 = stopwatch20.elapsedTime();
		System.out.println("elapsed time for merge sort with 1000 numbers reversed " + elapsedTimeFast20 + "\n");

		Stopwatch stopwatch21 = new Stopwatch();
		b.mergeSort(numbersSorted1000MergeSort);
		double elapsedTimeFast21 = stopwatch21.elapsedTime();
		System.out.println("elapsed time for merge sort with 1000 numbers sorted " + elapsedTimeFast21 + "\n");

		Stopwatch stopwatch22 = new Stopwatch();
		b.mergeSort(numbers1000DuplicatesMergeSort);
		double elapsedTimeFast22 = stopwatch22.elapsedTime();
		System.out.println("elapsed time for merge sort with 1000 duplicate numbers " + elapsedTimeFast22 + "\n");
		
		Stopwatch stopwatch23 = new Stopwatch();
		b.mergeSort(numbersNearlyOrdered1000MergeSort);
		double elapsedTimeFast23 = stopwatch23.elapsedTime();
		System.out.println("elapsed time for merge sort with 1000 nearly ordered numbers " + elapsedTimeFast23 + "\n\n");
		
	
	}
	*/

}

