package shopping.action;

import java.io.*;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class FileUploadAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private File file;
	private String fileFileName;
	private String fileFileContentType;

	private String message = "���ѳɹ��ϴ��ļ�";

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getFileFileContentType() {
		return fileFileContentType;
	}

	public void setFileFileContentType(String fileFileContentType) {
		this.fileFileContentType = fileFileContentType;
	}

	@SuppressWarnings("deprecation")
	@Override
	public String execute() throws Exception {
		//System.out.println("---------------1---------------");
		HttpServletRequest request = ServletActionContext.getRequest();
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		String path = request.getRealPath("/upload");
		try {
			File f = this.getFile();
			if (this.getFileFileName().endsWith(".exe")) {
				message = "�Բ���,���ϴ����ļ���ʽ������!!!";
				return ERROR;
			}
			FileInputStream inputStream = new FileInputStream(f);
			FileOutputStream outputStream = new FileOutputStream(path + "/"
					+ this.getFileFileName());
			byte[] buf = new byte[1024];
			int length = 0;
			while ((length = inputStream.read(buf)) != -1) {
				outputStream.write(buf, 0, length);
			}
			inputStream.close();
			outputStream.flush();
			String picUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/upload/"+this.getFileFileName();
			String json = "{picUrl:\"" + picUrl + "\"}";
			System.out.println(json);
			writer.print(json);
			
		} catch (Exception e) {
			e.printStackTrace();
			//message = "�Բ���,�ļ��ϴ�ʧ����!!!!";
			writer.print("{");		
			writer.print("error:�Բ���,�ļ��ϴ�ʧ����!!!!");
			writer.print("}");
		}
		return null;
	}
}
