/**
 * 
 */
package llvmReader;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

public class Reader {

	public static String folderLocation = "";
	public static HashMap<String, ArrayList<String>> functionMap = new HashMap<String, ArrayList<String>>();
	
	/**
	 * Reads all the file names in the specified folder and stores 
	 * it in a File[] array.
	 * @param folderName, name of folder for the tasks
	 * @return listOfFiles, that is read in the folder, if any
	 */
	public static File[] readFolder(String folderName){	
		File task1Files = new File(folderName);
		File[] listOfFiles = task1Files.listFiles();
		/* Prints all the file names in the folder, if any, for debugging
		for (int i = 0; i < listOfFiles.length; i++) {
			if (listOfFiles[i].isFile()) {
				System.out.println("File " + listOfFiles[i].getName());
			}
		}
		 */
		return listOfFiles;
	}

	/**
	 * Reads the contents of the LL file from the given file name
	 * into a BufferedReader.
	 * @param fileName, name of file for the tasks
	 * @return bf, buffer contents of the file
	 */
	public static BufferedReader readFile(String filename) {
		BufferedReader bf = null;
		try {
			bf = new BufferedReader(new FileReader(folderLocation + "\\" +  filename));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			// Other errors detected
			e.printStackTrace();
		}
		return bf;
	}

	/**
	 * Checks the list of files read and processes the LL files
	 * @param listOfFiles, that is read in the folder, will contain at least 1 file
	 * @return nil
	 */
	private static void processFiles(File[] listOfFiles) {
		// Only take the LL files and ignore the others
		String tempFileName = "";
		String tempFileNameSubstring = "";
		boolean llFlag = false;
		for (int i = 0 ; i < listOfFiles.length ; i++){
			if (listOfFiles[i].isFile()) {
				tempFileName = listOfFiles[i].getName();
				// Checks that the file extension is LL
				tempFileNameSubstring = tempFileName.substring(tempFileName.length() - 2,tempFileName.length());
				if (tempFileNameSubstring.equalsIgnoreCase("ll")) {
					System.out.println("Processing file " +tempFileName );
					// Reset functionTable
					functionMap.clear();
					
					findFunctions(readFile(tempFileName));
					llFlag = true;
				}
			}
		}
		
		if (llFlag == false){
			System.out.println("There are no LL files!");
		}
		// find all functions and store into a table, then trace functions that are called from main.
	}

	/**
	 * Reads each line and find functions
	 * @param bf, contents of the file that is returned from readFile();
	 * @return nil
	 */
	public static void findFunctions(BufferedReader bf) {
		String bfLine = "";
		try {
			while((bfLine = bf.readLine()) != null){
				String[] line = bfLine.split(" ");
				if(isFunction(line[0])){
					addFunction(line);
				} else {
					
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		//printMessages(0,0);
	}
	
	/**
	 * Checks whether the string is a function definition
	 * @param str, first string of the line
	 * @return boolean, whether the string == define
	 */
	public static boolean isFunction(String str) {
		if (str.equals("define")) {
			return true;
		} else {
			return false;
		}
	}
	
	/**
	 * Adds function into the hashtable
	 * @param line, function line
	 * @return 
	 */
	public static void addFunction(String[] line) {
		if (functionMap.containsKey(line[2])){
			System.out.println("Function already exists? Hmm");
		} else {
			ArrayList<String> value = null;
			functionMap.put(line[2], value);
			System.out.println("Added function " + line[2]);
		}
	}
	
	/**
	 * Prints messages regarding the number of deadfunctions found
	 * and lists the functions out
	 * @param bf, contents of the file that is returned from readFile();
	 * @return nil
	 */
	public static void printMessages(int deadfunctions, String[] str){
		if (deadfunctions > 0){
			System.out.println("Number of deadfunctions found, "+deadfunctions);
			System.out.println("Listing deadfunctions: ");
			for (int i = 0; i< str.length; i++){
				System.out.println(str[i]);
			}
		} else {
			System.out.println("There are no dead functions detected!! ");
		}	
	}
	
	/**
	 * Program starts here.
	 * @param args, nothing
	 */
	public static void main(String[] args) {
		File[] files = null;
		
		System.out.println("===== Task 1 =========");
		folderLocation = "./task1";
		files = readFolder(folderLocation);
		if (files.length == 0){
			System.out.println("No files detected!");
		} else {
			processFiles(files);
		}
		System.out.println("===== End Task 1 =====");
		System.out.println("===== Task 2 =========");
		folderLocation = "./task2";
		files = readFolder(folderLocation);
		if (files.length == 0){
			System.out.println("No files detected!");
		} else {
			processFiles(files);
		}
		System.out.println("===== End Task 2 =====");

	}
}
