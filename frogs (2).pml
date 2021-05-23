#define POSITSIONS 5

int frog_stone[POSITSIONS]
bit frogStuck[4];


proctype hop(int frogNum; int direction)
{  
    if 
    :: ( direction == 1 ) ->
          printf( "START FROG %d AT %d GOING RIGHT\n", frogNum, frog_stone[frogNum] );
    :: else ->
          printf( "START FROG %d AT %d GOING LEFT\n", frogNum, frog_stone[frogNum]);
    fi;
    int temp;

     do :: true ->
        atomic{
              if :: (frog_stone[0] == frog_stone[frogNum]+direction || frog_stone[0] == frog_stone[frogNum]+direction+direction) ->
              
                 frogStuck[frogNum%4] = 0;
                 temp = frog_stone[frogNum];
                 frog_stone[frogNum] = frog_stone[0];
                 frog_stone[0] = temp;

                 printf( "MOVE FROG%d FROM %d TO %d\n", frogNum, temp, frog_stone[frogNum]);
                 printf( "EMPTY %d, FROG1@%d, FROG2@%d, FROG3@%d, FROG4@%d\n", frog_stone[0], frog_stone[1], frog_stone[2], frog_stone[3], frog_stone[4]);
          
              :: else -> frogStuck[frogNum%4] = 1;
              fi;

          if :: (!(frogStuck[0] == 1 && frogStuck[1] == 1 && frogStuck[2] == 1 && frogStuck[3] == 1 &&
          (frog_stone[0] != frog_stone[1]+direction || frog_stone[0] != frog_stone[1]+direction+direction) &&  
          (frog_stone[0] != frog_stone[2]+direction || frog_stone[0] != frog_stone[2]+direction+direction) && 
          (frog_stone[0] != frog_stone[3]+direction || frog_stone[0] != frog_stone[3]+direction+direction) && 
          (frog_stone[0] != frog_stone[4]+direction || frog_stone[0] != frog_stone[4]+direction+direction)) ) 
          :: else -> break;
          fi;
        }
        od

}



init{
loop:
atomic{
  frogStuck[4%4]=1;
  frog_stone[0] = 2;
  frog_stone[1] = 1;
  frog_stone[2] = 3;
  frog_stone[3] = 4;
  frog_stone[4] = 5;

  printf( "EMPTY %d, FROG1@%d, FROG2@%d, FROG3@%d, FROG4@%d\n", frog_stone[0], frog_stone[1], frog_stone[2], frog_stone[3], frog_stone[4]);

  run hop(1,1);
  run hop(2,-1);
  run hop(3,-1);
  run hop(4,-1);

}

   (_nr_pr == 1); 
   
   if :: (frog_stone[0] != 4 || frog_stone[1] != 5 ) ->
    goto loop
   :: else ->
    printf( "DONE!\n");
    assert(!(frog_stone[0] == 4 && frog_stone[1] == 5 ));
   fi; 
}