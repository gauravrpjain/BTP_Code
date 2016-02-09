/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package btp_code;

/**
 *
 * @author Popo
 */
import java.io.BufferedReader;
import java.io.FileReader;


public class Fit_Curve {

int data;
double tolerence, beta_alpha, beta_theta, beta_alpha_prime, carbon_concentrate, vol_frac_theta_max ;
double[] Temp, relative_length, vol_frac_theta, vol_frac_alpha, vol_frac_alpha_prime;
double[] lattice_parameter = new double[2+3+2];
Fit_Curve(String fileURI){
try{
	BufferedReader input;
        input = new BufferedReader( new FileReader(fileURI));
        String x = input.readLine();
        while(x!= null){
        System.out.println(x);
        x=input.readLine();
        }
        String[] params = input.readLine().split(",");
	System.out.println(params[0].trim());
        data = Integer.parseInt(params[0].trim());
	System.out.println(""+data);
        tolerence = Double.parseDouble(params[1].trim());
	beta_alpha = Double.parseDouble(params[2].trim());
	beta_alpha_prime = Double.parseDouble(params[3].trim());
	beta_theta = Double.parseDouble(params[2].trim());
	carbon_concentrate = Double.parseDouble(params[5].trim());
	vol_frac_theta_max = 0;
	lattice_parameter[0] = 2.8664 - (130*Math.pow(10.0,-4.0)*carbon_concentrate);
	lattice_parameter[1] = 2.8664 + (1191*Math.pow(10,-4)*carbon_concentrate);
	lattice_parameter[2] = 2.8664 - (130*(Math.pow(10,-4))*0.000002);
	lattice_parameter[3] = 2.8664 + (1191*(Math.pow(10,-4))*0.000002);
	lattice_parameter[4] = 4.5234;
	lattice_parameter[5] = 5.0883;
	lattice_parameter[6] = 6.7426;
	Temp = new double[data];
	relative_length = new double[data];
	vol_frac_alpha = new double[data];
	vol_frac_alpha_prime = new double[data];
	vol_frac_theta = new double[data];
		for (int i=0;i<data;i++){
			vol_frac_alpha[i]=vol_frac_theta[i] = 0;
			vol_frac_alpha_prime[i]=1;
		}
	String currLine; String[] values = new String[2];
	int i = 0;
	while(((currLine = input.readLine())!=null)&&(i<data)){
		values = currLine.split(",");
		Temp[i] = Double.parseDouble(values[0]);
		relative_length[i] = Double.parseDouble(values[1]);
		i++;
	}
	input.close();
}
catch(Exception e){
	System.out.println("Error encountered : "+e.toString());
        e.printStackTrace();
}
}

void calibrate_vol_frac(){
	for(int i = 0;i<data;i++){
		vol_frac_alpha[i] = vol_frac_theta[i]* 20.212121;
		vol_frac_alpha_prime[i] = 1-(vol_frac_theta[i]*21.212121);
	}
};

double calc_relative_length(int i){
	double x;
	x = vol_frac_alpha[i]*lattice_parameter[2]*lattice_parameter[2]*lattice_parameter[3]*(Math.pow((1+(beta_alpha*(Temp[i]-25))), 3))/2;
	x += vol_frac_theta[i]*lattice_parameter[4]*lattice_parameter[5]*lattice_parameter[6]*(Math.pow((1+(beta_theta*(Temp[i]-25))), 3))/12;
	x += vol_frac_alpha_prime[i]*lattice_parameter[0]*lattice_parameter[0]*lattice_parameter[1]*(Math.pow((1+(beta_alpha_prime*(Temp[i]-25))), 3))/2;
	x -= lattice_parameter[0]*lattice_parameter[0]*lattice_parameter[1]/2;
	x /= lattice_parameter[0]*lattice_parameter[0]*lattice_parameter[1]/2;
	return x;
}
double find_vol_frac(int i){
	double x = vol_frac_theta[i] = vol_frac_theta_max;
	while (Math.abs(calc_relative_length(i)-relative_length[i])>tolerence){
		x = vol_frac_theta[i] += 0.000001;
		calibrate_vol_frac();
	}
	
	return vol_frac_theta_max = x;
}
 void print_vol_fraction(){
	 int i;
	 System.out.println("Max Vol Fraction of Cementite = "+vol_frac_theta_max);
	 System.out.println("i:Vol Fraction Ferrite:Cementite:Martensite");
	 for(i=0;i<data;i++){
		 System.out.println("For i:"+i+":"+vol_frac_alpha[i]+":"+vol_frac_theta[i]+":"+vol_frac_alpha_prime[i]+",");
	 }
	 
 }
 
 public static void main(String Args[]){
	Fit_Curve HR20 = new Fit_Curve("C:\\Users\\Popo\\Desktop\\Intern & Project\\sbs project\\Project_-_Tempering-2014-07-15\\Project - Tempering\\0.33C Tempering\\650-HR5_950_10M_CR15_RT_HR20_550_20M_CR5_RT.csv");
	for(int i = 0;i<HR20.data;i++){
		HR20.calc_relative_length(i);
	}
	HR20.print_vol_fraction();
 }
}