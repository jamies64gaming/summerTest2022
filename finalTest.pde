//variables
int lenght;
boolean limbs;
String gender;
int eyes;
String name;
color colour;

float bodySize = 50;
float bodyLocation;
int startE;

float CWidth;
float CHeight;

PFont f;

StringList genderList;
StringList nameList;

//setup
void setup(){
  //color mode and screen
  fullScreen();
  colorMode(HSB);
  
  //initialising the lists
  GenderList();
  NameList();
  
  //getting initial randomization
  randomizer();
  
  //creating font
  f = createFont("Arial",16,true);

  //getting variables for height and width
  CWidth = width/2;
  CHeight = height/2;
}


//checking to see if the eyes should be offset
void eyeSort(){
   if( eyes % 2 == 0){
    startE = 1;
    eyes++;
  }
  else{
    startE = 0;
  } 
}

//init name list
void NameList(){
  nameList = new StringList();
  nameList.append("Jerry");
  nameList.append("Jamie");
  nameList.append("Jacob");
  nameList.append("John");
  nameList.append("Joe Bloggs");
}

//init genderlist
void GenderList(){
  genderList = new StringList();
  genderList.append("m");
  genderList.append("f");
  genderList.append("h");
  genderList.append("n");
}

//randomize values
void randomizer(){
  lenght = int(random(1,11));
  
  if(random(0,1) > .5){
    limbs = true;
  }else{
    limbs = false;
  }
  
  gender = genderList.get(int(random(0,4)));
  
  eyes = int(random(0,10));
  
  eyeSort();
  
  name = nameList.get(int(random(0,5)));
  
  colour = color(int(random(0, 255)), int(255), int(255));
}

//draw limbs
void Limbs(){
  line(CWidth-bodySize,bodyLocation,CWidth+bodySize,bodyLocation);
}

//draw different gender attributes
void Gender(){
  if(gender == "f"){
   circle(CWidth,bodyLocation,bodySize/2);
  }else if(gender == "m"){
    line(CWidth, bodyLocation + bodySize/2, CWidth, bodyLocation + bodySize/1.2);
    circle(CWidth,bodyLocation + bodySize/1.2,bodySize/4);
  }else if(gender == "h"){
    circle(CWidth,bodyLocation,bodySize/2);
    line(CWidth, bodyLocation + bodySize/2, CWidth, bodyLocation + bodySize/1.2);
    circle(CWidth,bodyLocation + bodySize/1.2,bodySize/4);
  }
}

//draw the eyes
void Eyes(){
  for(int e = startE; e < eyes; e++){
    if( e % 2 == 0){
      line(CWidth, bodyLocation, CWidth - e * bodySize/10, bodyLocation-bodySize + e * bodySize/10);
      circle(CWidth - e * bodySize/10, bodyLocation-bodySize + e * bodySize/10,10);
    }
    else{
      e ++;
      line(CWidth, bodyLocation, CWidth + e * bodySize/10, bodyLocation-bodySize + e * bodySize/10);
      circle(CWidth + e * bodySize/10, bodyLocation-bodySize + e * bodySize/10,10);
      e--;
    }
  }
}

//draw the name
void Name(){
  textFont(f,36);
  fill(colour);
  textAlign(CENTER);
  text(name,CWidth,CHeight*1.8);
}

//draw the everything and body
void Body(){
  for(int i = 0; i < lenght; i++){
    bodyLocation = (i*bodySize) + CHeight/2;
    if(limbs && i != 0){
      Limbs();
    }
    
    if(eyes != 0 && i == 0){
      Eyes();
    }
    
    circle(CWidth,bodyLocation,bodySize);
  }
  Gender();
  Name();
}

//randomize if mouse clicked
void mouseClicked() {
  randomizer();
}

void draw(){
  //set color and no fill
  stroke(colour);
  strokeWeight(2);
  fill(0);
  
  //reset background
  background(0);
  
  //call functions
  Body();
}
