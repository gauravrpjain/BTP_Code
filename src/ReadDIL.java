/**
 * 
 */

/**
 * @author Popo
 *
 */
public class ReadDIL {
	String fileName;
	String[] paramList;
public ReadDIL(String file_Name){
	super();
	fileName = file_Name;
}
/**
 * Return the parameters in the file i.e. it has dist vs time or d(l)/dt vs time etc
 * 
 * The actual method is still to be written
 * 
 */
String[] getParamList(){
	String[] a = {"a","b"};
	paramList = a; // just for now, so that I remember what to do
	return paramList;
}

int getParamPosition(String param_code){
	//searches for the param code in file, returen no; -1 if param not there
	return 0;
}

void go_to_next(int param_position,double value){
	//from current cursor position go to next occurance of the following value for the given parameter
}
void go_to_first(int param_position,double value){
	//from starting position go to first occurance of the following value for the given parameter
}
/**
 * Need to add the following:
 * Issue: output structure
 * 1. Read till ( all the params) 
 * 2. Read till (just a few params)
 * 3. Read Line
 */
}
