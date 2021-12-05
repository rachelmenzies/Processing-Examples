// TO DO
// - select difficulty on welcome screen (3x2, 4x4, 5x5)
// - add a leaderboard after game complete (use txt file to store data - use score or time to complete?)
// - add a "play again" button to return to the game
// - if unattended for 2 minutes, reset the game to welcome screen


// -------------------------------------------------
// Global Variables
// -------------------------------------------------

// for card class and data within the cards
Card[] cards = new Card[6];
int[] xPos = {500, 700, 900, 500, 700, 900};
int[] yPos = {150, 150, 150, 450, 450, 450};
IntList cardValues = new IntList();  // initial values on cards (see function to add to list)
ArrayList<Card> cardsSelected = new ArrayList<Card>();

// for flip cards back button
int flipX = 710;
int flipY = 40;
int flipW = 150;
int flipH = 75;
Boolean displayFlipButton = false;

// score counter
int score = 0;

// check if game is finished
Boolean gameComplete;

// states
String state = "Game";

// fonts
PFont markerFont;

// design and positioning
color red = color(255, 50, 50);
color blue = color(88, 113, 234);
int left_x = 150;
int left_y = 75;
int rect_x = left_x*2;
int welcomeX;
int welcomeY = 500;
int finalY = 800;

// transitions
Boolean transitionToGame = false;

// -------------------------------------------------
// SETUP
// -------------------------------------------------

void setup() {
  size(1400, 900);
  textAlign(CENTER, CENTER);
  markerFont = loadFont("MarkerFelt-Thin-48.vlw");
  welcomeX = rect_x + (width-rect_x)/2;

  // set up card values and shuffle the deck
  addCardValues();
  cardValues.shuffle();

  // set up Card objects
  for (int i = 0; i < cards.length; i++) {
    cards[i] = new Card(i, xPos[i], yPos[i], cardValues.get(i));
  }
}


// -------------------------------------------------
// DRAW
// -------------------------------------------------

void draw() {

  //
  // Welcome
  //

  if (state.equals("Welcome")) {
    displaySidebar();
    displayBackground();

    // welcome text
    fill(red);
    text("Click anywhere to start", welcomeX, welcomeY);

    // activated when welcome screen is clicked
    // move instructions up and off the screen
    if (transitionToGame) {
      welcomeY = welcomeY - 3;
    }

    // when instructions are off the screen, end transition and move to game
    if (welcomeY < -60) {
      transitionToGame = false;
      state = "Game";
    }
  }

  //
  // Game
  //

  if (state.equals("Game")) {
    displaySidebar();
    displayBackground();
    displayInstructions();


    displayCards();
    displayScore();
    if (displayFlipButton) {
      displayFlipBackButton();
    }

  }

  //
  // Transition to leaderboard
  //

  if (state.equals("TransitionToLeaderboard")) {
    displayCards();
    finalY = finalY - 3;
    noStroke();
    fill(blue);
    int xPos = left_x*2;
    rect(xPos, finalY, width-xPos, 1450);
    
    if(finalY < 0){
      state="Leaderboard";
    }
 
  }
  
  //
  // Leaderboard
  //

  if (state.equals("Leaderboard")) {
    int xPos = left_x*2;
    fill(blue);
    rect(xPos, 0, width-xPos, 1450);
    fill(red);
    text("Leaderboard goes here", welcomeX, welcomeY);
  }
  
  
  
}


// -------------------------------------------------
//  display interface components
// -------------------------------------------------

void displayCards() {
  for (int i = 0; i < cards.length; i++) {
    cards[i].display();
  }
}

void displayScore() {
  fill(blue);
  textFont(markerFont, 60);
  text(score, left_x, 720);
}

void displayFlipBackButton() {
  stroke(0);
  strokeWeight(1);
  fill(0);
  rect(flipX, flipY, flipW, flipH);
  fill(255);
  textSize(20);
  text("Flip Cards Back", flipX+(flipW/2), flipY+(flipH/2));
}

void displaySidebar() {

  // white sidebar rectangle
  noStroke();
  fill(255);
  rect(0, 0, rect_x, height);

  // text on top of white sidebar rectangle
  fill(red);
  textFont(markerFont, 48);
  text("Oor Wullie", left_x, left_y);
  text("Matching", left_x, left_y+50);
  text("Game", left_x, left_y+100);
}

void displayBackground() {
  fill(0);
  rect(rect_x, 0, width-rect_x, height);
}

void displayInstructions() {
  fill(red);
  textFont(markerFont, 30);
  text("Find matching cards to earn points.", left_x/2, left_y+160, left_x-20, 400);
}


// -------------------------------------------------
//  mouse interaction
// - check if clicked on cards
// - check if clicked on flip cards back button
// -------------------------------------------------

void mouseClicked() {

  if (state.equals("Welcome")) {
    if (mouseX>rect_x && mouseX<width && mouseY>0 && mouseY<height) {
      transitionToGame = true;
    }
  }

  if (state.equals("Game")) {
    // go through the cards
    // check if clicked on a card
    for (int i = 0; i < cards.length; i++) {

      // if within boundaries of a card returns true
      if (cards[i].isClicked()) {

        // no cards currently selected
        if (cardsSelected.size()==0) {
          cardsSelected.add(cards[i]);
          cards[i].setFaceUp();
        }

        // only one card currently selected
        if (cardsSelected.size()==1) {
          if (cardsSelected.get(0).getID() != cards[i].getID()) {
            cardsSelected.add(cards[i]);
            cards[i].setFaceUp();
          }
        }

        // two cards are selected
        // this could have been added in the section just before here
        if (cardsSelected.size()==2) {
          compareCards();
        }
      } // end cards[i].isClicked()
    } // end for


    // check if clicked on "flip back" button
    if (mouseX>flipX && mouseX<flipX+flipW && mouseY>flipY && mouseY<flipY+flipH) {
      flipCardsBack();
    }
  }
}


// -------------------------------------------------
// flip cards back
// - turn selected cards back to face down
// - clear the record of currently selected cards
// -------------------------------------------------

void flipCardsBack() {
  cards[cardsSelected.get(0).getID()].setFaceDown();
  cards[cardsSelected.get(1).getID()].setFaceDown();
  cardsSelected.clear();
  displayFlipButton = false;
  score++;
}


// -------------------------------------------------
// compare selected cards
// - use card values to determine if cards are same
// - if same: set as completed and update score
// - if not same: show flip back button
// -------------------------------------------------

void compareCards() {

  // if selected cards are the same
  if (cardsSelected.get(0).getValue() == cardsSelected.get(1).getValue()) {

    // go through array of cards
    // when match with first or second card, set cards to complete
    for (int i = 0; i < cards.length; i++) {
      if (cards[i].getID() == cardsSelected.get(0).getID()) {
        cards[i].setComplete();
      }
      if (cards[i].getID() == cardsSelected.get(1).getID()) {
        cards[i].setComplete();
      }
    }

    // clear the record of currently selected cards
    cardsSelected.clear();

    // add to score
    score++;

    // check if game has ended                        // *************
    gameComplete = true;
    for (int i = 0; i < cards.length; i++) {
      if (cards[i].getComplete()) {
        // card is marked as complete
      } else {
        gameComplete = false;
      }
    }

    println("Check if complete");

    if (gameComplete) {
      state="TransitionToLeaderboard";
    }
  }

  // if selected cards are not the same
  else {
    displayFlipButton = true;
  }
}


// -------------------------------------------------
// add values for cards to IntList
// can be manually changed here
// ACTION: update to pull from file
//         use table/csv to pull in all required data?
// -------------------------------------------------

void addCardValues() {
  cardValues.append(1);
  cardValues.append(1);
  cardValues.append(2);
  cardValues.append(2);
  cardValues.append(3);
  cardValues.append(3);
}
