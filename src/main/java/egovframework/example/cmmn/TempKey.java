package egovframework.example.cmmn;

import java.util.Random;

//0327 최은지 이메일 인증용 최초 생성
public class TempKey {
	
	private boolean lowerCheck;
    private int size;
    
    public String getKey(int size, boolean lowerCheck) {
        this.size = size;
        this.lowerCheck = lowerCheck;
        return randomKey();
    }

    //이메일 발송용 난수 생성
    private String randomKey() {
        Random ran = new Random();
        StringBuffer sb = new StringBuffer();
        int num  = 0;
        do {
            num = ran.nextInt(75) + 48;
            if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
                sb.append((char) num);
            } else {
                continue;
            }
        } while (sb.length() < size);
        if (lowerCheck) {
            return sb.toString().toLowerCase();
        }
        return sb.toString();
    }

}
