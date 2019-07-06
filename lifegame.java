package cod4;

import java.util.Random;
import java.util.concurrent.TimeUnit;

public class Cod4 {

    public static void main(String[] args) throws InterruptedException {
        Cod4 cod = new Cod4();
        cod.init();
        cod.show();
        while(true){
        TimeUnit.SECONDS.sleep(1);
        cod.update();
        cod.show();
        }
    }
    public void init() {
        Random rnd = new Random();
        for(int i=0;i<map.length;i++){
            for(int j = 0; j < map[0].length; j++) {
                map[i][j] = rnd.nextInt(2);
            }
        }
    }

    public void show() {
        for(int i = 0; i < map.length; i++){
            for(int j = 0; j < map[0].length; j++){
                System.out.print(map[i][j] ==1 ? "■":"□" );
            }
            System.out.println("");
        }
                    System.out.println("");
    }

    public void update () {

        for(int i=0; i<map.length; i++){
            for(int j = 0; j < map[0].length; j++){
                int count =0;
                for(int di = -1; di <= 1; di++){
                    for(int dj =-1;dj <=1;dj++){
                        if(di == 0 && dj == 0) continue;
                        count += map[(di+i+map.length)%map.length][(dj+j+map[0].length)%map[0].length]%2;

                    }
                }
                if(count == 3) {
                    map[i][j] |= 2 ;
                } else if(map[i][j] == 1 && count == 2){
                    map[i][j] |= 2;
                }
            }
        }
        for(int i = 0; i < map.length; i++) {
            for(int j = 0; j < map[0].length; j++){
                map[i][j] >>= 1;
            }
        }
    }

    int[][] map = new int[15][15];


}
