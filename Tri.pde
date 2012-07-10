class Tri
{
  int numPoints = 0;
  int pt, destPt, newDestPt;
  PVector[] points = new PVector[numPoints];
  PVector[] targetPoints = new PVector[numPoints];
  PVector newDest;
  ArrayList crosses;
  float ease;
  color col;
  float r, g, b, a;
  boolean crossDisplayed = true;
  boolean vert;

  Tri(ArrayList cr, float ea, color c)
  {
    crosses = cr;
    ease = map(speed, 0, 40, .1, .2);
    col = c;
    r = red(col);
    g = green(col);
    b = blue(col);
    a = map(humidity, 0, 100, .1, 200);
    vert = true;
  }

  ////inizializzazione del triangolo - viene chiamata solo all'avvio
  void init() 
  {      
    for (int i = 0; i < numPoints; i++) 
    { 
      ////seleziono un incrocio a caso di partenza e di destinazione
      ////controllo di non aver beccato lo stesso punto per non avere due vertici coincidenti
      int pt = int(random(0, crosses.size()));
      int destPt = int(random(0, crosses.size()));
      while (destPt == pt)
      {
        destPt = int(random(0, crosses.size()));
      }
      points[i] = (PVector) crosses.get(pt);
      targetPoints[i] = (PVector) crosses.get(destPt);
    }
  }


  void display() 
  {
    for (int i = 0; i < numPoints; i++) 
    { 
      ////calcolo la distanza verticale e orizzontale tra punto di partenza e arrivo
      float xdist = targetPoints[i].x - points[i].x;
      float ydist = targetPoints[i].y - points[i].y;
      ////mi muovo dal punto di partenza al punto di arrivo incrementando in rapporto all'accellerazione     
      points[i].x += xdist * ease;    
      points[i].y += ydist * ease;
      ////calcolo la distanza assoluta (vettore)
      float distance = xdist*xdist + ydist*ydist;
      ////se la distanza assoluta è minore di 2 (soglia arbitraria)
      if (distance < 2) 
      {      
        ////il punto di partenza prende le coordinate di quello di arrivo
        points[i].x = targetPoints[i].x;      
        points[i].y = targetPoints[i].y;
        noLoop();
        stroke(255);
        strokeWeight(1);
        line(0,points[i].y,width,points[i].y);
        line(points[i].x,0,points[i].x, height);
        ////decido casualmente se lo spostamento successivo sarà verticale o orizzontale (50/50)
        float rnd = random(0, 1);
        boolean orz;
        if (rnd < .5)
        {
          orz = true;
        }
        else
        {
          orz = false;
        }
        ////////////segnaposto per eventuale check del punto trovato
        ////calcolo le nuove x e y di destinazione tramite la funzione decideDirection che ritorna un PVector
        targetPoints[i].x = decideDirection(orz, points[i].x, points[i].y).x;      
        targetPoints[i].y = decideDirection(orz, points[i].x, points[i].y).y;
        loop();
      }
    }

    ////questo pezzo di codice è il vero e proprio display (cioè la visualizzazione pura) 
    beginShape(TRIANGLES);
    noStroke();
    fill(r, g, b, a);
    for (int i = 0; i < numPoints; i++)
    {
      vertex(points[i].x, points[i].y);
      if (crossDisplayed)
      {
        stroke(255);
        displayCross(points[i].x, points[i].y, 1, 5);
      }
    }
    endShape();
    ////fine display
  }

  PVector decideDirection(boolean o, float sx, float sy)
  {
    ////creo un'arraylist per contenere i possibili punti di destinazione
    ArrayList possibles = new ArrayList();
    ////se in display è stato deciso di andare in orizzontale
    if (o)
    {
      ////ciclo tra tutti gli incroci
      for (int i=0; i<crosses.size(); i++)
      {
        PVector v = (PVector) crosses.get(i);
        ////se la x dell'incrocio selezionato nel ciclo è uguale a quella del punto in cui mi trovo e contemporaneamente la y è diversa da quella del punto in cui mi trovo 
        if (v.x == sx && v.y != sy)
        {
          ////aggiungo all'arraylist degli incroci di destinazione possibili solo quegli incroci che hanno la mia stessa x e y diversa
          possibles.add(v);
        }
      }
    }
    else
    {
      for (int i=0; i<crosses.size(); i++)
      {
        PVector v = (PVector) crosses.get(i);
        if (v.y == sy && v.x != sx)
        {
          possibles.add(v);
        }
      }
    }
    ////creo un numero random per scegliere nell'arraylist delle possibili destinazioni una destinazione random
    int rndPossibleCross = int(random(0, possibles.size()-1));
    try
    {
      ////se tutto ok seleziono la nuova destinazione
      newDest = (PVector) possibles.get(rndPossibleCross);
    }
    catch (Exception e)
    {
      ////altrimenti prendo come destinazione il primo incrocio della griglia
      newDest = (PVector) crosses.get(0);
    }
    ////ritorno il PVector della nuova destinazione
    return newDest;
  }

  void displayCross(float x, float y, int w, int crdim) 
  {
    strokeCap(SQUARE);
    strokeWeight(w);
    line(x + crdim, y, x - crdim, y);
    line(x, y - crdim, x, y + crdim);
    noStroke();
  }

  void fadeIn()
  {
    while (a<=map (humidity, 0, 100, 0, 200))
    {
      a+=.00001;
    }
  }


  void fadeOut()
  {
    while (a>=0)
    {
      a-=.00001;
    }
  }

  void setCol(color c)
  {
    r = red(c);
    g = green(c);
    b = blue(c);
  }

  void setEase(float ea)
  {
    ease = map(speed, 0, 40, 0, .2);
  }
}

