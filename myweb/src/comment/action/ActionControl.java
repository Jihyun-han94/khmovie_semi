package comment.action;

import comment.action.*;

public class ActionControl {
	private ActionControl() {
		
	}
	private static ActionControl instance = new ActionControl();
	
	public static ActionControl getInstance() {
		return instance;
	}
	
	public Action getAction(String command) {
		Action action = null;
		if (command.equals("comment_write")) {
			action = new CommentWrite();
		}else if (command.equals("comment_edit_delete")) {
			action = new CommentUpdate();
		}else if (command.equals("comment_edit_form")) {
			action = new CommentUpdate();
		}else if (command.equals("comment_edit")) {
			action = new CommentUpdate();
		}else if (command.equals("comment_delete")) {
			action = new CommentDelete();
	}
		return action;
	}

}
