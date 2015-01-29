
import java.awt.BorderLayout;
import java.awt.Component;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JSplitPane;
import javax.swing.JTextField;
import javax.swing.JTextPane;
import javax.swing.JToolBar;
import javax.swing.SwingConstants;

public class Window {
	private JFrame frame;
	private JTextPane textSaida;
	
	/**
	 * Create the application.
	 */
	public Window() {
		initialize();
		frame.setVisible(true);
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setBounds(100, 100, 800, 600);
		frame.setTitle("Busca indices");
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(new BorderLayout(0, 0));
		
//		JSplitPane splitPane = new JSplitPane();
//		splitPane.setResizeWeight(0.5);
//		splitPane.setOneTouchExpandable(true);
//		splitPane.setAutoscrolls(true);
//		splitPane.setToolTipText("");
//		frame.getContentPane().add(splitPane, BorderLayout.CENTER);
//		
//		final JTextPane textEntrada = new JTextPane() {
//			@Override
//			public boolean getScrollableTracksViewportWidth() {
//				return (getSize().width < getParent().getSize().width);
//			}
//			@Override
//			public void setSize(Dimension d) {
//				if (d.width < getParent().getSize().width) {
//					d.width = getParent().getSize().width;
//				}
//				super.setSize(d);
//			}
//		};
//		textEntrada.setEditable(false);
//		JScrollPane scrollEntrada = new JScrollPane(textEntrada);
//		scrollEntrada.setAutoscrolls(true);
//		splitPane.setLeftComponent(scrollEntrada);
		
		textSaida = new JTextPane() {
			@Override
			public boolean getScrollableTracksViewportWidth() {
				return (getSize().width < getParent().getSize().width);
			}
			@Override
			public void setSize(Dimension d) {
				if (d.width < getParent().getSize().width) {
					d.width = getParent().getSize().width;
				}
				super.setSize(d);
			}
		};
		textSaida.setEditable(false);
//		JScrollPane scrollSaida = new JScrollPane(textSaida);
//		scrollSaida.setAutoscrolls(true);
//		splitPane.setRightComponent(scrollSaida);
		frame.getContentPane().add(textSaida);
		
		JToolBar toolBar = new JToolBar();
		toolBar.setFont(new Font("Dialog", Font.BOLD, 10));
		toolBar.setRollover(true);
		toolBar.setInheritsPopupMenu(true);
		toolBar.setAlignmentX(Component.LEFT_ALIGNMENT);
		toolBar.setOrientation(SwingConstants.HORIZONTAL);
		frame.getContentPane().add(toolBar, BorderLayout.NORTH);
		
		JButton btnResetar = new JButton("Limpar");
		btnResetar.setMargin(new Insets(2, 2, 2, 2));
		btnResetar.setFont(new Font("Dialog", Font.BOLD, 10));
		btnResetar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
//				textEntrada.setText("");
				textSaida.setText("");
			}
		});
		toolBar.add(btnResetar);
		
		JButton btnGerar1 = new JButton("Gerar indice busca binaria");
		btnGerar1.setMargin(new Insets(2, 2, 2, 2));
		btnGerar1.setFont(new Font("Dialog", Font.BOLD, 10));
		btnGerar1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				long startTime = System.currentTimeMillis();
				
				SequencialIndexadoIndice i = new SequencialIndexadoIndice();
				i.makeIndex();
				appendPane(textSaida, "Indice busca binaria gerado");
				
				long endTime = System.currentTimeMillis();
				showTime(endTime - startTime);
			}
		});
		toolBar.add(btnGerar1);
		
		JButton btnGerar2 = new JButton("Gerar indice acesso direto");
		btnGerar2.setMargin(new Insets(2, 2, 2, 2));
		btnGerar2.setFont(new Font("Dialog", Font.BOLD, 10));
		btnGerar2.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				long startTime = System.currentTimeMillis();
				
				AcessoDiretoIndice i = new AcessoDiretoIndice();
				i.makeIndex();
				appendPane(textSaida, "Indice acesso direto gerado");

				long endTime = System.currentTimeMillis();
				showTime(endTime - startTime);
			}
		});
		toolBar.add(btnGerar2);
		
		final JTextField txtBusca = new JTextField();
		toolBar.add(txtBusca);

		JButton btnBusca = new JButton("Busca binaria");
		btnBusca.setMargin(new Insets(2, 2, 2, 2));
		btnBusca.setFont(new Font("Dialog", Font.BOLD, 10));
		btnBusca.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				long startTime = System.currentTimeMillis();
				
				SequencialIndexadoBusca b = new SequencialIndexadoBusca();
				String res = b.find(Integer.parseInt(txtBusca.getText()));
				appendPane(textSaida, res);

				long endTime = System.currentTimeMillis();
				showTime(endTime - startTime);
			}
		});
		toolBar.add(btnBusca);

		JButton btnBusca2 = new JButton("Busca acesso direto");
		btnBusca2.setMargin(new Insets(2, 2, 2, 2));
		btnBusca2.setFont(new Font("Dialog", Font.BOLD, 10));
		btnBusca2.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				long startTime = System.currentTimeMillis();
				
				AcessoDiretoBusca b = new AcessoDiretoBusca();
				String res = b.find(Integer.parseInt(txtBusca.getText()));
				appendPane(textSaida, res);

				long endTime = System.currentTimeMillis();
				showTime(endTime - startTime);
			}
		});
		toolBar.add(btnBusca2);
		
	}
	
	public void appendPane(JTextPane textPane, String text){
		textPane.setText(textPane.getText()+text+"\n");
	}
	
	public void showTime(long ms){
		double segundos = ms / 1000.00;
		appendPane(textSaida, "Tempo: "+segundos+" s / "+ms+" ms");
	}
}
