class Griglia
{
  ArrayList lineeOrz;
  ArrayList lineeVrt;
  float orzPos, vertPos;
  int step;
  public ArrayList crosses;

  Griglia(int st)
  {
    lineeOrz = new ArrayList();
    lineeVrt = new ArrayList();
    orzPos = 10;
    vertPos = 10;
    step = 8;
  }

  void update()
  {
  }

  void display()
  {
    for (int i = 0; i<lineeOrz.size(); i++)
    {
      Linea lo = (Linea) lineeOrz.get(i);
      lo.update();
      lo.display();
    }
    for (int i = 0; i<lineeVrt.size(); i++)
    {
      Linea lv = (Linea) lineeVrt.get(i);
      lv.update();
      lv.display();
    }
  }

  void creaLineaOrz(float posO)
  {
    for (int i = 0; i<lineeOrz.size(); i++)
    {
      Linea lo = (Linea) lineeOrz.get(i);
      lo.selected = false;
    }
    lineeOrz.add(new Linea(lineeOrz.size(), "oriz", 0, posO));
  }

  void creaLineaVrt(float posV)
  {
    for (int i = 0; i<lineeVrt.size(); i++)
    {
      Linea lv = (Linea) lineeVrt.get(i);
      lv.selected = false;
    }
    lineeVrt.add(new Linea(lineeVrt.size(), "vert", posV, 0));
  }

  void moveLineaOrz(String dir)
  {
    if (dir == "up")
    {
      for (int i = 0; i<lineeOrz.size(); i++)
      {
        Linea lo = (Linea) lineeOrz.get(i);
        if (lo.selected)
        {
          lo.moveUp(step);
        }
      }
    }
    if (dir == "down")
    {
      for (int i = 0; i<lineeOrz.size(); i++)
      {
        Linea lo = (Linea) lineeOrz.get(i);
        if (lo.selected)
        {
          lo.moveDown(step);
        }
      }
    }
  }

  void moveLineaVert(String dir)
  {
    if (dir == "left")
    {
      for (int i = 0; i<lineeVrt.size(); i++)
      {
        Linea lv = (Linea) lineeVrt.get(i);
        if (lv.selected)
        {
          lv.moveLeft(step);
        }
      }
    }
    if (dir == "right")
    {
      for (int i = 0; i<lineeVrt.size(); i++)
      {
        Linea lv = (Linea) lineeVrt.get(i);
        if (lv.selected)
        {
          lv.moveRight(step);
        }
      }
    }
  }

  void cancLineaOrz()
  {
    for (int i = 0; i<lineeOrz.size(); i++)
    {
      Linea lo = (Linea) lineeOrz.get(i);
      if (lo.selected)
      {
        lineeOrz.remove(lo);
        saveCrosses();
        lo = (Linea) lineeOrz.get(0);
        lo.selected = true;
        break;
      }
    }
  }

  void cancLineaVrt()
  {
    for (int i = 0; i<lineeVrt.size(); i++)
    {
      Linea lv = (Linea) lineeVrt.get(i);
      if (lv.selected)
      {
        lineeVrt.remove(lv);
        saveCrosses();
        lv = (Linea) lineeVrt.get(0);
        lv.selected = true;
        break;
      }
    }
  } 

  void selLineaOrz()
  {
    for (int i = 0; i<lineeOrz.size(); i++)
    {
      Linea lo = (Linea) lineeOrz.get(i);
      int n;
      if (lo.selected)
      {
        if (lo.ID==lineeOrz.size()-1)
        {
          n=0;
        }
        else
        {
          n=i+1;
        }
        Linea nextLo = (Linea) lineeOrz.get(n);
        nextLo.selected = true;
        lo.selected = false;
        break;
      }
    }
  } 

  void selLineaVrt()
  {
    for (int j = 0; j<lineeVrt.size(); j++)
    {
      Linea lv = (Linea) lineeVrt.get(j);
      int m;
      if (lv.selected)
      {
        if (lv.ID==lineeVrt.size()-1)
        {
          m=0;
        }
        else
        {
          m=j+1;
        }
        Linea nextLv = (Linea) lineeVrt.get(m);
        nextLv.selected = true;
        lv.selected = false;
        break;
      }
    }
  }

  ArrayList getCrosses()
  {
    saveCrosses();
    return crosses;
  }

  void saveCrosses()
  {
    crosses = new ArrayList();
    int numCrosses = lineeOrz.size()*lineeVrt.size();
    float tempX, tempY;
    for (int i = 0; i<lineeVrt.size(); i++)
    {
      Linea lv = (Linea) lineeVrt.get(i);
      tempX = lv.x;
      for (int j = 0; j<lineeOrz.size(); j++)
      {
        Linea lo = (Linea) lineeOrz.get(j);
        tempY = lo.y;
        crosses.add(new PVector(tempX, tempY));
      }
    }
    saveFiles();
  }

  void printCrossesCoords()
  {
    for (int i=0; i<crosses.size(); i++)
    {
      PVector p = (PVector) crosses.get(i);
      println (p.x+" - "+p.y);
    }
  }

  void saveFiles()
  {
    String[] linesV = new String[lineeVrt.size()];
    for (int i = 0; i<lineeVrt.size(); i++)
    {
      Linea lv = (Linea) lineeVrt.get(i);
      float tempX = lv.x;
      linesV[i] = tempX+"\t";
    }
    saveStrings("data/linesV.txt", linesV);

    String[] linesO = new String[lineeOrz.size()];
    for (int j = 0; j<lineeOrz.size(); j++)
    {
      Linea lo = (Linea) lineeOrz.get(j);
      float tempY = lo.y;
      linesO[j] = tempY+"\t";
    }
    saveStrings("data/linesO.txt", linesO);
  }

  void loadGrid()
  {
    try
    {
      String[] linesV;
      linesV = loadStrings("data/linesV.txt");
      for (int i=0; i<linesV.length; i++)
      {
        creaLineaVrt(float(linesV[i]));
      }
      String[] linesO;
      linesO = loadStrings("data/linesO.txt");
      for (int j=0; j<linesO.length; j++)
      {
        creaLineaOrz(float(linesO[j]));
      }
    }
    catch (Exception e)
    {
    }
  }

  int getNumOrz()
  {
    return lineeOrz.size();
  }

  int getNumVrt()
  {
    return lineeVrt.size();
  }
}

