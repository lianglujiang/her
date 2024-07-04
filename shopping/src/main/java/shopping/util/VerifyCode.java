package shopping.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class VerifyCode{
	static String s = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz";
	private static int width = 60;
	private static int height = 22;
	private static int len = 30; //������
	public static void getVerifyCode(HttpServletRequest request, HttpServletResponse response){
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		
		BufferedImage image = new BufferedImage(width, height,BufferedImage.TYPE_INT_RGB);
		Graphics g = image.getGraphics();
		Random random = new Random();
		g.setColor(getRandColor(220, 250));
		g.fillRect(0, 0, width, height);
		g.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		g.draw3DRect(0, 0, width - 2, height - 2, true);
		g.setColor(getRandColor(160, 200));
		for (int i = 0; i < len ; i++) {
			int x = random.nextInt(width);
			int y = random.nextInt(height);
			int x1 = random.nextInt(12);
			int y1 = random.nextInt(12);
			g.drawLine(x, y, x + x1, y + y1);
		}
		String sRand = "";
		
		for (int i = 0; i < 4; i++) {
			char rand = s.charAt(random.nextInt(s.length()));
			sRand += rand;
			g.setColor(new Color(20 + random.nextInt(110), random.nextInt(110),random.nextInt(110)));
			g.drawString(String.valueOf(rand), 13 * i + 6, 16);
		}

		request.getSession().setAttribute("VerifyCode", sRand);
		g.dispose();

		ServletOutputStream output;
		try {
			output = response.getOutputStream();
			ImageIO.write(image, "JPEG", output);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static Color getRandColor(int fc, int bc) {
		Random random = new Random();
		if (fc > 255) fc = 255;
		if (bc > 255) bc = 255;
		int r = fc + random.nextInt(bc - fc);
		int g = fc + random.nextInt(bc - fc);
		int b = fc + random.nextInt(bc - fc);
		return new Color(r, g, b);
	}
};
