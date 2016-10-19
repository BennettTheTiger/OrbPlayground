//Bennett Schoonerman
//Screen Saver orbs
//10/19/2016
//Here you can customize the parameters of the program --------------------
int orbNumber = 150;
float alphaSpeed = 1.5;
float orbMoveSpeed = .25;
float orbDirectSpeed = .5;
//Here the arrays are declared for the program ----------------------------
float[] orbX;
float[] orbY;
float[] orbSize;
float[] orbAlpha;
int[] orbState;
int[] orbDirection;
//background color vars --------------------------------------------------
int r;
int g;
int b;
void setup() {
  r = int(random(240));
  g = int(random(240));
  b = int(random(240));
  size(1000, 600);
  noStroke();//removes the stroke from the orbs
  //intializes all the arrays
  orbX = new float[orbNumber];
  orbY = new float[orbNumber];
  orbSize = new float[orbNumber];
  orbAlpha = new float[orbNumber];
  orbState = new int[orbNumber];
  orbDirection = new int[orbNumber];
  makeOrbs(orbNumber);
}
//repeatedly calls the other funtions to make the magic happen. 
void draw() {
  r = colorChange(r);
  b = colorChange(b);
  //g = colorChange(g);
  background(r,b,g,100);
  orbTwinkle(orbNumber);
  orbFloat(orbNumber);
}

void makeOrbs(int orbNum) {
  for (int i = 0; i < orbNum; i++) {
    orbX[i] = random(width);
    orbY[i] = random(height);
    orbSize[i] = random(10, 25);
    orbAlpha[i] = random(25, 220);
    orbState[i] = int(random(2));
    orbDirection[i] = int(random(4));
    fill(255, orbAlpha[i]);
    ellipse(orbX[i], orbY[i], orbSize[i], orbSize[i]);
  }
}

void orbTwinkle(int orbNumber) {
  for (int i = 0; i < orbNumber; i++) {
    if (orbState[i] == 1) {
      orbAlpha[i]+= alphaSpeed;
      if (orbAlpha[i] >= 220) {
        orbAlpha[i] -=alphaSpeed+5;
        orbState[i] = 0;
      }//if out of range
    }//if its getting brighter

    else {
      orbAlpha[i]-= alphaSpeed;
      if (orbAlpha[i] <= 20) {
        orbAlpha[i]+=alphaSpeed;
        orbState[i] = 1;
      }//if out of range
    }//if its getting brighter
  }//end of loop
}//end of orb Twinkle

void orbFloat(int orbs) {
  for (int i = 0; i<orbs; i++) {
    orbX[i]+=random(-orbMoveSpeed, orbMoveSpeed);
    orbY[i]+=random(-orbMoveSpeed, orbMoveSpeed);
    orbScatter(i); //This function yields a scattering result
    fill(255, orbAlpha[i]);
    ellipse(orbX[i], orbY[i], orbSize[i], orbSize[i]);
  }
}

void orbScatter(int i) {
  if (orbDirection[i]==0) {
    orbX[i] -= orbDirectSpeed;
    if (orbX[i] <= 0) {
      orbDirection[i] = 1;
    }
  }
  if (orbDirection[i]==1) {
    orbX[i] += orbDirectSpeed;
    if (orbX[i] >= width) {
      orbDirection[i] = 0;
    }
  }
  if (orbDirection[i]==2) {
    orbY[i] -= orbDirectSpeed;
    if (orbY[i] <= 0) {
      orbDirection[i] = 3;
    }
  }
  if (orbDirection[i]==3) {
    orbY[i] += orbDirectSpeed;
    if (orbY[i] >= height) {
      orbDirection[i] = 2;
    }
  }
}

int colorChange(int c){
 
 c += int(random(-3,3));
 if(c>=240){
  c = 120; 
 } 
 return c;
}//end color change