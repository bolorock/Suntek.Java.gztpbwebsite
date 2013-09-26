package pic;
/*
 * To change this template, choose Tools | Templates * and open the template in
 * the editor.
 */

import java.awt.BasicStroke;

import java.awt.Color;
import java.awt.Font;

import java.awt.Graphics;
import java.awt.Graphics2D;

import java.awt.geom.AffineTransform;

import java.awt.geom.Line2D;

import java.awt.image.BufferedImage;

import java.io.ByteArrayInputStream;

import java.io.ByteArrayOutputStream;

import java.io.IOException;

import java.util.Random;

import javax.imageio.ImageIO;

import javax.imageio.stream.ImageOutputStream;

/**
 * 
 * 
 * 
 * @author zyong
 * 
 *        验证码
 */

public class CheckCode {

	/**
	 * 
	 *创建一个随机数对象
	 */

	Random random = new Random();

	/**
	 * 
	 *生成的字符集
	 */

	private final String character = "0ABC1DEF2GHI3JKL4MNO5PQR6ST7UV8WX9YZ";

	/**
	 * 
	 *返回生成后的图片字符
	 */

	private String checkCode;

	/**
	 * 
	 * 设置生成图片的宽度,默认为65
	 */

	private int width = 65;

	/**
	 * 
	 * 设置生成图片的高度,默认为25
	 */

	private int height = 25;

	/**
	 * 
	 * 设置图片的类型,默认为BufferedImage.TYPE_INT_RGB
	 */

	private int imageType = BufferedImage.TYPE_INT_RGB;

	/**
	 * 
	 * 
	 * 
	 * @return生成图片后的字符
	 */

	public String getCheckCode() {

		return checkCode;

	}

	/**
	 * 
	 * 
	 * 
	 * @return图片的高度
	 */

	public int getHeight() {

		return height;

	}

	/**
	 * 
	 * 
	 * 
	 * @param height图片的高度
	 */

	public void setHeight(int height) {

		this.height = height;

	}

	/**
	 * 
	 * 
	 * 
	 * @return图片的宽度
	 */

	public int getWidth() {

		return width;

	}

	/**
	 * 
	 * 
	 * 
	 * @param width图片的宽度
	 */

	public void setWidth(int width) {

		this.width = width;

	}

	/**
	 * 
	 * 
	 * 
	 * @return图片类型
	 */

	public int getImageType() {

		return imageType;

	}

	/**
	 * 
	 * 
	 * 
	 * @param imageType图片类型
	 */

	public void setImageType(int imageType) {

		this.imageType = imageType;

	}

	/**
	 * 
	 * 
	 * 
	 * @return生成一张图片
	 */

	public ByteArrayInputStream buildImage() {

		BufferedImage image = new BufferedImage(this.width, this.height, this.imageType);

		Graphics g = image.getGraphics();

		Graphics2D g2d = (Graphics2D) g;

		g.setColor(this.getColor(200, 250));

		g.fillRect(0, 0, this.width, this.height);

		g.setFont(new Font("Times New Roman", Font.BOLD, 17));

		g.setColor(this.getColor(180, 200));

		/*
		 * 绘制100条干扰线
		 */

		for (int i = 0; i < 100; i++) {

			int x1 = random.nextInt(this.width);

			int y1 = random.nextInt(this.height);

			int x2 = random.nextInt(this.width - 3);

			int y2 = random.nextInt(this.height - 3);

			BasicStroke bs = new BasicStroke(2f, BasicStroke.CAP_BUTT, BasicStroke.JOIN_BEVEL);

			Line2D line = new Line2D.Double(x1, y1, x2, y2);

			g2d.setStroke(bs);

			g2d.draw(line);

			g.setColor(getColor(180, 222));

		}

		StringBuffer codeStr = new StringBuffer();

		for (int i = 0; i < 4; i++) {

			char c = character.charAt(random.nextInt(36));

			codeStr.append(c);

			Color color = new Color(20 + random.nextInt(110), 20 + random.nextInt(110), 20 + random.nextInt(110));

			g.setColor(color); /* 随机文字,旋转文字到指定角度 */

			AffineTransform trans = new AffineTransform();

			trans.rotate(random.nextInt(10) * i + 3, 5);

			float scaleSize = random.nextFloat() + 0.5f;

			if (scaleSize < 0.8 || scaleSize > 1.1f) {

				scaleSize = 1f;

			}

			trans.scale(scaleSize, scaleSize);
			g2d.setTransform(trans);

			g.drawString(String.valueOf(c), 15 * i + 6, 9);

		}

		this.checkCode = codeStr.toString();
		g.dispose();

		ByteArrayInputStream inputStream = null;

		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();

		try {

			ImageOutputStream imgOutput = ImageIO.createImageOutputStream(outputStream);

			ImageIO.write(image, "JPEG", imgOutput);

			imgOutput.close();

			inputStream = new ByteArrayInputStream(outputStream.toByteArray());

			outputStream.close();

		} catch (IOException e) {

			e.printStackTrace();

		}

		return inputStream;

	}

	/**
	 * 
	 * 利用随机数，随机生成一个Color颜色的对象
	 * 
	 * @param fc
	 * 
	 * @param bc
	 * 
	 * @return颜色对象
	 */

	private Color getColor(int fc, int bc) {

		if (fc > 255) {

			fc = 255;

		}

		if (bc > 255) {

			bc = 255;

		}

		int r = fc + random.nextInt(bc - fc);

		int g = fc + random.nextInt(bc - fc);

		int b = fc + random.nextInt(bc - fc);

		return new Color(r, g, b);

	}

}