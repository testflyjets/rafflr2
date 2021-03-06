module RaffleHelper

  def next_round_js
    js  = "// Kick things off; the process function will kick off each\n"
    js << "// subsequent round after all the special effects are complete.\n"
    js << "setTimeout(next_round, 3000);\n"
	js << "// alert('play original');\n"
    js << "soundManager.onload = function() { playMusic('/songs/original.mp3'); }\n"
    js << "\n"
    js << "function next_round() {\n"
    js << "  // Controller will call the remove_user function with the next user id\n"
    js << "  new Ajax.Request('" + url_for(:action => 'raffle', :id => @raffle) + "',\n"
    js << "    {\n"
    js << "      asynchronous:true,\n"
    js << "      evalScripts:true\n"
    js << "    }\n"
    js << "  );\n"
    js << "}\n"
    js << "\n"
    js << "function remove_user(user_id) {\n"
    js << "  process(user_id, next_round);\n"
    js << "}\n"

  end
end

