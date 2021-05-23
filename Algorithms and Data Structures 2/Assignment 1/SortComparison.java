import java.io.File;
import java.io.FileNotFoundException;
import java.util.Arrays;
import java.util.Scanner;

// -------------------------------------------------------------------------

/**
 *  This class contains static methods that implementing sorting of an array of numbers
 *  using different sort algorithms.
 *
 *  @author Emer Murphy
 *  @version HT 2020
 */

//code taken from lecture slides

 class SortComparison {

    /**
     * Sorts an array of doubles using InsertionSort.
     * This method is static, thus it can be called as SortComparison.sort(a)
     * @param a: An unsorted array of doubles.
     * @return array sorted in ascending order.
     *
     */
    static double [] insertionSort (double a[]){

	    double temp;
	   	for(int i=1; i<a.length; i++) {
	     	//check if the elements before are less
	    	for(int j=i; j>0; j--) { 
	    		if(a[j] < a[j-1]) {
	    			temp = a[j];
	    			a[j] = a[j-1];
	    			a[j-1] = temp;
	    		}
	        }
	    }
    	
    	return a;
    }//end insertionsort
	
	    /**
     * Sorts an array of doubles using Selection Sort.
     * This method is static, thus it can be called as SortComparison.sort(a)
     * @param a: An unsorted array of doubles.
     * @return array sorted in ascending order
     *
     */
    static double [] selectionSort (double a[]){

        //todo: implement the sort
    	
    	int n = a.length;
    	
    	//One by one move boundary of unsorted subarray
    	for(int i=0; i<n-1; i++) {
    		//find the minimum element in unsorted array
    		int min_idx = i;
    		for(int j=i+1; j<n; j++) {
    			if(a[j]<a[min_idx])
    				min_idx = j;
    		}
    		
    		//Swap the found minimum element with the first
    		//element
    		double temp = a[min_idx];
    		a[min_idx] = a[i];
    		a[i] = temp;
    	}
		return a;

    	

    }//end selectionsort

    /**
     * Sorts an array of doubles using Quick Sort.
     * This method is static, thus it can be called as SortComparison.sort(a)
     * @param a: An unsorted array of doubles.
     * @return array sorted in ascending order
     *
     */
    static double [] quickSort (double a[]){
    	recursiveQuick(a, 0, a.length-1);
		return a;
    }
    
    private static void recursiveQuick(double[] a, int lo, int hi) {
    	if(hi <= lo) {
    		return;
    	}
    	int pivotPos = partition(a, lo, hi);
    	recursiveQuick(a, lo, pivotPos-1);
    	recursiveQuick(a, pivotPos+1, hi);
    }
    
    private static int partition(double[] a, int lo, int hi) {
    	int i = lo;
    	int j = hi+1;
    	double pivot = a[lo];
    	while(true) {
    		while(a[++i] < pivot) {
    			if(i == hi) break;
    		}
    		while(pivot < a[--j]) { 
    		}
    		if(i >= j) break;
    		double temp = a[i];
    		a[i] = a[j];
    		a[j] = temp;
    	}
    	a[lo] = a[j];
    	a[j] = pivot;
    	return j;
    	
    	
    }

    /**
     * Sorts an array of doubles using Merge Sort.
     * This method is static, thus it can be called as SortComparison.sort(a)
     * @param a: An unsorted array of doubles.
     * @return array sorted in ascending order
     *
     */
    /**
     * Sorts an array of doubles using iterative implementation of Merge Sort.
     * This method is static, thus it can be called as SortComparison.sort(a)
     *
     * @param a: An unsorted array of doubles.
     * @return after the method returns, the array must be in ascending sorted order.
     */
    
    //top down merge sort

    static double[] mergeSort (double a[]) {
		double[] aux = new double[a.length];
		mergeSort(a, aux, 0, a.length -1);
		return a;

    }
    
    private static void mergeSort(double[] a, double[] aux, int lo, int hi ) {
    	if(hi <= lo) return;
    	int mid = lo + (hi - lo)/2;
    	mergeSort(a,aux,lo,mid);
    	mergeSort(a,aux,mid+1,hi);
    	merge(a,aux,lo,mid,hi);
    }
    
    private static void merge(double[] a, double[] aux, int lo, int mid, int hi) {
    	for(int k=lo; k<= hi; k++) {
    		aux[k]=a[k];
    	}
    	
    	int i=lo, j=mid+1;
    	for(int k=lo; k<=hi; k++) {
    		if	    (i>mid) 				a[k] = aux[j++];
    		else if	(j>hi) 					a[k] = aux[i++];
    		else if (aux[j] < aux[i])		a[k] = aux[j++];
    		else							a[k] = aux[i++];
    	}
    	
    }

    
   

   // public static void main(String[] args) {

        
    //}

 }//end class

