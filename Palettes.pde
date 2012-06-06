class Palettes {

  color[][] paletteArray = { 
    { // ore 00.00
      color(0,0,255), color(184,2,50), color(195,14,59), color(220,23,77), color(243,57,156)
    }
    , 
    { // ore 01.00
      color(221,17,58), color(161,255,0), color(251,250,247), color(40,213,252), color(21,174,234)
    }
    , 
    { // ore 02.00
      color(109, 229, 18), color(167, 252, 47), color(205, 255, 58), color(241, 255, 115), color(253, 255, 54)
    }
    , 
    { // ore 03.00
      color(56,144,207), color(246,222,51), color(247,44,87), color(255,143,157), color(243,235,152)
    }
    , 
    { // ore 04.00
      color(205,9,9), color(73,9,205), color(153,205,9), color(255,239,2), color(255,2,198)
    }
    , 
    { // ore 05.00
      color(140,43,121), color(46,149,216), color(162,255,110), color(175,201,70), color(125,73,168)
    }
    , 
    { // ore 06.00
      color(109,145,175), color(47,85,125), color(252,246,246), color(196,14,14), color(7,7,7)
    }
    , 
    { // ore 07.00
      color(0,0,0), color(247,184,24), color(186,18,121), color(253,214,5), color(165,28,87)
    }
     , 
    { // ore 08.00
      color(8,183,206), color(105,97,86), color(238,238,238), color(255,81,138), color(202,161,100)
    }
       , 
    { // ore 09.00
      color(2,239,254), color(158,234,231), color(245,240,225), color(51,1,35), color(254,11,66)
    }
    , 
    { // ore 10.00
      color(109, 229, 18), color(167, 252, 47), color(205, 255, 58), color(241, 255, 115), color(253, 255, 54)
    }
    , 
    { // ore 11.00
      color(56,144,207), color(246,222,51), color(247,44,87), color(255,143,157), color(243,235,152)
    }
    , 
    { // ore 12.00
      color(255,221,231), color(198,209,255), color(255,243,247), color(255,252,243), color(253,246,221)
    }
    , 
    { // ore 13.00
      color(17,66,109), color(85,28,69), color(147,92,124), color(240,156,156), color(243,185,171)
    }
    , 
    { // ore 14.00
      color(141,244,255), color(209,255,218), color(166,255,184), color(191,255,150), color(139,255,66)
    }
    , 
    { // ore 15.00
      color(156,233,220), color(161,209,201), color(19,177,189), color(5,127,135), color(78,93,94)
    }
       , 
    { // ore 16.00
      color(217,74,13), color(252,120,63), color(252,243,70), color(244,247,203), color(99,192,170)
    }
    , 
    { // ore 17.00
      color(130,32,34), color(254,88,154), color(194,196,194), color(255,222,4), color(25,152,221)
    }
    , 
    { // ore 18.00
      color(199,255,233), color(246,255,237), color(255,253,240), color(220,255,173), color(221,255,198)
    }
    , 
    { // ore 19.00
      color(76,139,89), color(255,219,242), color(51,213,183), color(213,51,211), color(255,255,255)
    }
    , 
    { // ore 20.00
      color(255,0,173), color(255,186,227), color(0,153,255), color(0,243,255), color(255,255,255)
    }
    , 
    { // ore 21.00
      color(255,170,108), color(255,244,154), color(206,240,150), color(159,222,203), color(235,244,241)
    }
    , 
    { // ore 22.00
      color(254,177,13), color(0,135,234), color(213,247,255), color(188,233,239), color(188,233,239)
    }
    , 
    { // ore 23.00
      color(226,57,5), color(245,204,41), color(111,241,251), color(194,110,36), color(0,0,0)
    }
    , 
    { // ore 24.00
      color(135,45,181), color(100,20,141), color(16,93,165), color(47,129,191), color(135,45,181)
    }
    
  };


  Palettes() {
  }

  color[] getPalette(int i) {

    color[] selectedPalette = paletteArray[i];
    return selectedPalette;
  }
}




