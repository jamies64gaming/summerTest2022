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

void setup(){
  fullScreen();
  colorMode(HSB);
  
  GenderList();
  NameList();
  randomizer();
  f = createFont("Arial",16,true);

  CWidth = width/2;
  CHeight = height/2;
}


void eyeSort(){
   if( eyes % 2 == 0){
    startE = 1;
    eyes++;
  }
  else{
    startE = 0;
  } 
}
void NameList(){
  nameList = new StringList();
  nameList.append("Jerry");
  nameList.append("Jamie");
  nameList.append("Jacob");
  nameList.append("John");
  nameList.append("Joe Bloggs");
}
void GenderList(){
  genderList = new StringList();
  genderList.append("m");
  genderList.append("f");
  genderList.append("h");
  genderList.append("n");
}

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

void Limbs(){
  line(CWidth-bodySize,bodyLocation,CWidth+bodySize,bodyLocation);
}

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

void Name(){
  textFont(f,36);
  fill(colour);
  textAlign(CENTER);
  text(name,CWidth,CHeight*1.8);
}

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

void mouseClicked() {
  randomizer();
}

void draw(){
  stroke(colour);
  strokeWeight(2);
  fill(0);
  println(name);
  background(0);
  Body();
}
