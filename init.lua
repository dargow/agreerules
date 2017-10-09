Enable_type_text_to_accept= true
Enable_Only_1_language= false
Default_language_number= 1

privs_to_grant={"shout","interact","home","spawn"}


--default languages: english=1, spanish=2, france=3,germany=4

-- Add "," between the rules





arok_text={
	{
		"English",
		"Continue",
		"Yes!",
		"No",
		"Do you accept the server rules?",
		"I agree the rules",
		"",
		"Type the key phrase to play, then press Continue",
		"You have to agree the rules to play this server. You are welcome back to next time",
		"\nNow you can play!",
		"Welcome to the server,",
		" ",
		"Server Rules:\n\n No griefing\n No trolling\n No spam\n No swearing or bad names\n No stealing or steal people's usernames\n No hacking\n No ask for admin privs or admin stuff\n Type /rules to see this again\n\n Type 'I agree the rules' in bottom field if you agree this rules",
		"Cancel",
		"Welcome,",
		"		Welcome to Server!",
	},
	{
		"Espanol",
		"Continuar",
		"Si!",
		"No",
		"Se aceptan las reglas del servidor?",
		"Acepto las reglas",
		"",
		"Escriba la clave que desempenar, a continuacion, pulse Continuar",
		"Tendra que aceptar las reglas para jugar a este servidor. Eres bienvenido de nuevo a la proxima vez",
		"\n¡Ahora puedes jugar!",
		"Bienvenido al servidor,",
		"",
		"Reglas del servidor:\n\n No griefing\n No trolling\n No spam\n No jurar o mal nombres\n No robar o robar los nombres de usuario de la gente\n No hacking\n No preguntar por admin privs o admin cosas\n Tipo /rules para ver esto de nuevo\n\n Tipo 'Acepto las reglas' en el campo inferior si está de acuerdo estas reglas",
		"Cancelar",
		"Bienvenido",
		"		Bienvenido a Server!",
	},
	{
		"Francais",
		"Continuer",
		"Oui!",
		"Non",
		"Acceptez-vous les regles du serveur?",
		"J'accepte les regles",
		"Taper dans la zone de texte: ",
		"Tapez la cle a jouer, puis appuyez sur Continuer",
		"Vous devez accepter les règles pour jouer ce serveur. Vous êtes les bienvenus à la prochaine fois",
		"\nMaintenant, vous pouvez jouer!",
		"Bienvenue sur le serveur,",
		"",
		"Règles du serveur:\n\n Pas de tromperie\n Pas de trolling\n Pas de spam\n Pas d'assermentation ou de mauvais noms\n Pas de vol ou de vol des noms d'utilisateurs\n Pas de piratage\n Type /rules pour le voir à nouveau\n\n Tapez 'J'accepte les regles' dans le champ inférieur si vous acceptez ces règles",
		"Annuler",
		"Bienvenue",
		"		Bienvenue à Server!",
	},
	{
		"Deutsch",
		"Fortsetzen",
		"Ja!",
		"Nein",
		"Haben Sie die Server-Regeln akzeptieren?",
		"Ich akzeptiere die regeln",
		"Geben Sie diese in das Textfeld ein: ",
		"Geben Sie den Schlussel zu spielen, drucken Sie weiter",
		"Sie mussen die Regeln akzeptieren diesen Server zu spielen. Sie sind willkommen in das nachste Mal wieder",
		"\nJetzt kannst du spielen!",
		"Willkommen auf dem Server,",
		"",
		"Server Regeln:\n\n Kein Griefing\n Kein Trolling\n Kein Spam\n Kein Fluchen oder schlechte Namen\n Kein Diebstahl oder Diebstahl von Benutzernamen\n Kein Hacking\n Keine Fragen nach Admin-Priv\n Geben Sie /rules ein, um dies erneut zu sehen.\n\n Geben Sie 'Ich akzeptiere die regeln' im unteren Feld zu, wenn Sie diesen Regeln zustimmen",
		"Stornieren",
		"Herzlich willkommen",
		"		Willkommen auf dem Server!",
	},
	{
		"Русский",
		"Продолжить",
		"Да!",
		"Нет",
		"Вы принимаете правила сервера?",
		"Я принимаю правила",
		"",
		"Введите кодовую фразу для игры, затем нажмите Продолжить.",
		"Вы должны принять правила сервера. Попробуйте ещё раз.",
		"\nТеперь вы можете играть!",
		"Добро пожаловать на сервер,",
		" ",
		"Правила сервера:\n\n Не разрушать чужие постройки\n Не тролить\n Не спамить\n Не использовать ругательные или плохие имена\n Не использовать чужие ники\n Не пытаться взламывать сервер\n Не спрашивать админ привелегии и вещи\n Напишите /rules чтобы посмотрель правила снова\n\n Напишите фразу 'Я принимаю правила' в поле ниже если вы с ними согласны",
		"Отмена",
		"Добро пожаловать,",
		"		Добро пожаловать на Server!",
	},
}
agreerules_form=""
function create_agreerules_form(i)
	local form="size[10,8;] "
	local aot="," .. arok_text[i][7]
	local doacc="," .. arok_text[i][5]
	if Enable_type_text_to_accept==true then
		aot=aot ..",".. arok_text[i][6]
		doacc=""
	else aot="" end
--	form=form.."dropdown[-0.1,-0.1;10.5,1;rules;" .. arok_text[i][13].. ", " .. arok_text[i][16].. "," .. aot .. doacc .. ";1]"
	form=form.."textarea[0.4,0.3;9.8,5.3;rules;" ..minetest.formspec_escape(arok_text[i][16]).. "; "..minetest.formspec_escape(arok_text[i][13])..";1]"

	if Enable_type_text_to_accept==true then
	form=form.." field[0.5,6;9.5,2;text;" .. arok_text[i][8]..";]"
	form=form.." button_exit[2,7;2,2;yes;" .. arok_text[i][2].. "]"
	form=form.." button[4,7;2,2;no;" .. arok_text[i][14] .. "]"
	else
	form=form.." button_exit[2,4;2,2;yes;" .. arok_text[i][3] .. "]"
	form=form.." button[4,4;2,2;no;".. arok_text[i][4] .."]"
	end

	form=form.." field[0,0;0,0;lang;;" .. i .."]"
	if Enable_Only_1_language==false then
		local cpos=0
		for ii = 1, #arok_text, 1 do
			form=form.." button_exit[" ..cpos ..",4.5;2,2;lang" .. (ii) .. ";" .. arok_text[ii][1] .. "]"
			cpos=cpos+2
		end
	end
	agreerules_form=form
end

minetest.register_on_player_receive_fields(function(player, form, pressed)

	if form== "AgreeRulesYesNoForm" then
		local name=player:get_player_name()
		local privs = minetest.get_player_privs(name)
		local i=tonumber(pressed.lang)
		if i==nil then
			i=Default_language_number
		end

		if pressed.lang1 or pressed.lang2 or pressed.lang3 or pressed.lang4 or pressed.lang5 then
			local n=1
			if pressed.lang2 then n=2 end
			if pressed.lang3 then n=3 end
			if pressed.lang4 then n=4 end
			if pressed.lang5 then n=5 end
			minetest.after((0.1), function(n)
				create_agreerules_form(n)
				return minetest.show_formspec(name, "AgreeRulesYesNoForm",agreerules_form)
			end, n)
			return true
		end

		if not (pressed.no or pressed.quit) and (pressed.rules or (pressed.text~="" and pressed.text~=arok_text[i][6])) then
			minetest.after((0.1), function(i)
				create_agreerules_form(i)
				return minetest.show_formspec(name, "AgreeRulesYesNoForm",agreerules_form)
			end, i)
			return true
		end

		if (pressed.no or pressed.quit) and not (pressed.yes or pressed.key_enter) then
			return minetest.kick_player(name,arok_text[i][9])
		end

		if Enable_type_text_to_accept==true then
			if pressed.text~=arok_text[i][6] then
			minetest.after((0.1), function(i)
				create_agreerules_form(i)
				return minetest.show_formspec(name, "AgreeRulesYesNoForm",agreerules_form)
			end, i)
			return true
			end
		end

		for i, v in pairs(privs_to_grant) do
			privs[v]=true
		end
		minetest.set_player_privs(name, privs)
		minetest.chat_send_player(name,arok_text[i][15] .." "..name.. " " .. arok_text[i][10])
		minetest.chat_send_all(arok_text[Default_language_number][11] .." "..name.." " .. arok_text[Default_language_number][12])
	end
end)

minetest.register_on_joinplayer(function(player)
	if minetest.check_player_privs(player:get_player_name(), {interact=true})==false then
		create_agreerules_form(Default_language_number)
		minetest.show_formspec(player:get_player_name(), "AgreeRulesYesNoForm",agreerules_form)
	end
end)

minetest.register_chatcommand("rules", {
	params = "",
	description = "Rules",
	func = function(name, param)
	create_agreerules_form(Default_language_number)
	minetest.after((0.1), function()
		return minetest.show_formspec(name, "AgreeRulesYesNoForm",agreerules_form)
	end)
end})
