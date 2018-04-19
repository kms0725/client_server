package p0221;

import java.awt.*;
import java.awt.event.*;
import java.io.*;
import java.net.*;
import javax.swing.*;

public class ChatClient extends JFrame implements ActionListener{
	private BufferedReader in = null;
	private BufferedWriter out = null;
	private ServerSocket listener = null;
	private Socket socket = null;
	private Receiver receiver; // JTextArea를 상속받고 Runnable 인터페이스를 구현한 클래스로서 받은 정보를 담는 객체
	private JTextField sender; // JTextField 객체로서 보내는 정보를 담는 객체
	
	public ChatClient() {
		setTitle("클라이언트 채팅 창");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		Container c = getContentPane();
		//1
		c.setLayout(new BorderLayout()); //BorderLayout  배치관리자의 사용
		receiver = new Receiver();	// 서버에서 받은 메시지를 출력할 컴퍼넌트
		receiver.setEditable(false); // 편집 ㄴㄴ
		
		sender = new JTextField();
		sender.addActionListener(this);
		
		c.add(new JScrollPane(receiver), BorderLayout.CENTER);
		c.add(sender, BorderLayout.SOUTH);
		
		setSize(400, 200);
		setVisible(true);
		
		try {
			setupConnection();
		} catch(IOException e) {
			handleError(e.getMessage());
		}
		
		Thread th = new Thread(receiver); //상대로부터 메시지 수신을 위한 스레드 생성
		th.start();
	}
	private void setupConnection() throws IOException{
		
		socket = new Socket("localhost", 9999);
		//System.out.println("연결됨");
		receiver.append("서버에 연결 완료");
		int pos = receiver.getText().length();
		receiver.setCaretPosition(pos); // caret 포지션을 가장 마지막으로 이동
		
		in = new BufferedReader(new InputStreamReader(socket.getInputStream())); //클라이언트로부터의 입력 스트림
		out = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream())); //클라이언트로의 출력 스트림
	}
	
	private static void handleError(String string) {
		System.out.println(string);
		System.exit(1);
	}
	
	private class Receiver extends JTextArea implements Runnable{
		public void run() {
			String msg = null;
			while(true) {
				try {
					msg = in.readLine();
				}catch(IOException e) {
					handleError(e.getMessage());
				}
				this.append("\n 서버: "+ msg); //받은 문자열을 JTextArea에 출력
				int pos = this.getText().length();
				this.setCaretPosition(pos); // caret 포지션을 가장 마지막으로 이동
			}
		}
	}
	public void actionPerformed(ActionEvent e) { //JTextField에 <Enter>키 처리
		if (e.getSource() == sender) {
			String msg = sender.getText(); //텍스트 필드에서 문자열 얻어옴
			try {
				out.write(msg+"\n");
				out.flush();
				receiver.append("\n클라이언트: " + msg); // JTextArea에 출력
				int pos = receiver.getText().length();
				receiver.setCaretPosition(pos);
				sender.setText(null); // 입력창의 문자열 지움
			} catch (IOException e1) {
				handleError(e1.getMessage());
			}
		}
	}
	public static void main(String[] args) {
		new ChatClient();

	}

}
