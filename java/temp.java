public class StringPerformance {
    public static double mkLongStr(int len)
    {
        long start = System.nanoTime();
        
        String str = "";        
        for(int i=0 ; i < len ; i++)    str += "a";
        
        long end = System.nanoTime();
        return (end-start)/(double)1_000_000_000;
    }
    
    public static double mkLongStrBuffer(int len)
    {
        long start = System.nanoTime();
        
        StringBuffer sb = new StringBuffer();
        for(int i=0 ; i < len ; i++)    sb.append("a");
        
        long end = System.nanoTime();
        return (end-start)/(double)1_000_000_000;
    }
    
    public static double mkLongStrBuilder(int len)
    {
        long start = System.nanoTime();
        
        StringBuilder sb = new StringBuilder();
        for(int i=0 ; i < len ; i++)    sb.append("a");
        
        long end = System.nanoTime();
        return (end-start)/(double)1_000_000_000;
    }
    
    public static void main(String[] args) {
        int[] lenList = new int[]{10_000, 20_000, 40_000, 80_000, 160_000, 320_000, 640_000, 
                                    1_280_000, 2_560_000, 5_120_000, 10_240_000, 20_480_000, 40_960_000, 81_920_000, 163_840_000};
        
        for(int len : lenList)
        {
// System.out.println("String\t" + len + "\t" + mkLongStr(len));
            System.out.println("StringBuffer\t" + len + "\t" + mkLongStrBuffer(len));
            System.out.println("StringBuilder\t" + len + "\t" + mkLongStrBuilder(len));
        }
    }
}
