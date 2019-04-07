package com.adminlte.commons.utils;

public class GlobalFun {
	/**
	 * 将字节型数组转为16进制字符串
	 * @param src 需要转的字节型数组
	 * @return 16进制字符串
	 */
	public static String bytesToHexString(byte[] src) {
        StringBuilder stringBuilder = new StringBuilder("");
        if (src == null || src.length <= 0) {
            return null;
        }
        for (int i = 0; i < src.length; i++) {
            int v = src[i] & 0xFF;
            String hv = Integer.toHexString(v);
            if (hv.length() < 2) {
                stringBuilder.append(0);
            }
            stringBuilder.append(hv);
        }
        return stringBuilder.toString();
    }
	/**
	 * 将16进制字符串转为字节型数组
	 * @param src
	 * @param len
	 * @return
	 */
    public static byte[] HexString2Bytes(String src,int len)
    {
        if(len%2!=0)
        {
            return null;
        }
        byte[] ret = new byte[len/2];
        byte[] tmp = src.getBytes();
        int i = 0;
        for (i=0;i<len/2; ++i)
        {
            ret[i] = uniteBytes(tmp[i*2],tmp[i*2+1]);
        }
        return ret;
    }

    private static byte uniteBytes(byte src0, byte src1) {
        byte _b0 = Byte.decode("0x" + new String(new byte[]{src0})).byteValue();
        _b0 = (byte) (_b0 << 4);
        byte _b1 = Byte.decode("0x" + new String(new byte[]{src1})).byteValue();
        byte ret = (byte) (_b0 | _b1);
        return ret;
    }

    //byte中取对应为位的值 ，1为true
    public static boolean GetControl(int c, int p)
    {
        boolean out = false;
        switch(p)
        {
            case 1:
                if ( (c & 0x80) == 128)
                {
                    out = true;
                }
                break;
            case 2:
                if ( (c & 0x40) == 64)
                {
                    out = true;
                }
                break;
            case 3:
                if ( (c & 0x20) == 32)
                {
                    out = true;
                }
                break;
            case 4:
                if ( (c & 0x10) == 16)
                {
                    out = true;
                }
                break;
            case 5:
                if ( (c & 0x08) == 8)
                {
                    out = true;
                }
                break;
            case 6:
                if ( (c & 0x04) == 4)
                {
                    out = true;
                }
                break;
            case 7:
                if ( (c & 0x02) == 2)
                {
                    out = true;
                }
                break;
            case 8:
                if ( (c & 0x01) == 1)
                {
                    out = true;
                }
                break;
        }
        return out;
    }
    public static String procIp(String str) //
	{
		String outstr="";
		String ipstr[] =str.split("\\.");
		int i;
		for (i=0; i<4; i++)
		{
			String tmp = Integer.toHexString(Integer.parseInt(ipstr[i]));
			if (tmp.length()<2){
				tmp = "0"+tmp;
			}
			outstr += tmp;
		}
		return outstr;
	}
}
