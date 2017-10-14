Enable_type_text_to_accept= true
Enable_Only_1_language= false
Default_language_number= 1

privs_to_grant={"shout","interact","home","fast","spawn","fly"}


--default languages: english=1, spanish=2, france=3,germany=4

-- Add "," between the rules





arok_text={
	{
		"English",
		"Continue",
		"yes",
		"Do you accept the server rules? Type «yes» in the field below",
		"You have to agree the rules to play this server. You are welcome back to next time",
		"\nNow you can play!",
		"Welcome to the server,",
		"Server Rules:\n\n No griefing\n No trolling\n No spam\n No swearing or bad names\n No stealing or steal people's usernames\n No hacking\n No ask for admin privs or admin stuff\n\n Type /rules to see this again",
		"Cancel",
		"Welcome to server!",
	},
	{
		"Espanol",
		"Continuar",
		"si",
		"¿Acepta las reglas del servidor? Escriba «si» en el campo a continuación",
		"Tienes que aceptar las reglas para jugar este servidor. Bienvenido a la próxima vez",
		"\n¡Ahora puedes jugar!",
		"Bienvenido al servidor,",
		"Reglas del servidor:\n\n No griefing\n No trolling\n No spam\n No jurar o mal nombres\n No robar o robar los nombres de usuario de la gente\n No hacking\n No preguntar por admin privs o admin cosas\n\n Tipo /rules para ver esto de nuevo",
		"Cancelar",
		"Bienvenido a server!",
	},
	{
		"Francais",
		"Continuer",
		"oui",
		"Acceptez-vous les règles du serveur? Tapez «oui» dans le champ ci-dessous",
		"Vous devez accepter les règles pour jouer ce serveur. Vous êtes les bienvenus à la prochaine fois",
		"\nMaintenant, vous pouvez jouer!",
		"Bienvenue sur le serveur,",
		"Règles du serveur:\n Pas de tromperie\n Pas de trolling\n Pas de spam\n Pas d'assermentation ou de mauvais noms\n Pas de vol ou de vol des noms d'utilisateurs\n Pas de piratage\n\n Type /rules pour le voir à nouveau",
		"Annuler",
		"Bienvenue à server",
	},
	{
		"Deutsch",
		"Fortsetzen",
		"ja",
		"o Sie akzeptieren die Serverregeln? Geben Sie im Feld «ja» ein",
		"Sie mussen die Regeln akzeptieren diesen Server zu spielen. Sie sind willkommen in das nachste Mal wieder",
		"\nJetzt kannst du spielen!",
		"Willkommen auf dem Server,",
		"Server Regeln:\n\n Kein Griefing\n Kein Trolling\n Kein Spam\n Kein Fluchen oder schlechte Namen\n Kein Diebstahl oder Diebstahl von Benutzernamen\n Kein Hacking\n Keine Fragen nach Admin-Priv\n\n Geben Sie /rules ein, um dies erneut zu sehen.",
		"Stornieren",
		"Willkommen auf dem server",
	},
	{
		"Русский",
		"Продолжить",
		"да",
		"Принимаете ли вы правила сервера? Введите «да» в поле ниже",
		"Вы должны принять правила сервера. Попробуйте ещё раз.",
		"\nТеперь вы можете играть!",
		"Добро пожаловать на сервер,",
		"Правила сервера:\n\n Не разрушать чужие постройки\n Не тролить\n Не спамить\n Не использовать ругательные или плохие имена\n Не использовать чужие ники\n Не пытаться взламывать сервер\n Не спрашивать админ привелегии и вещи\n\n Напишите /rules чтобы посмотреnь правила снова",
		"Отмена",
		"Добро пожаловать на сервер!",
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
	form=form.."textarea[0.4,0.3;9.8,6;rules;" ..minetest.formspec_escape(arok_text[i][10]).. "; "..minetest.formspec_escape(arok_text[i][8])..";1]"

	if Enable_type_text_to_accept==true then
--	form=form.." field[0.5,6;9.5,2;text;" .. arok_text[i][8]..";]"
	form=form.." field[0.4,6.4;9.5,2;text;" .. arok_text[i][4]..";]"
	form=form.." button_exit[0,7;2,2;yes;" .. arok_text[i][2].. "]"
	form=form.." button[2,7;2,2;no;" .. arok_text[i][9] .. "]"
	else
	form=form.." button_exit[2,4;2,2;yes;" .. arok_text[i][3] .. "]"
	form=form.." button[4,4;2,2;no;".. arok_text[i][4] .."]"
	end

	form=form.." field[0,0;0,0;lang;;" .. i .."]"
	if Enable_Only_1_language==false then
		local cpos=0
		for ii = 1, #arok_text, 1 do
			form=form.." button_exit[" ..cpos ..",5;2,2;lang" .. (ii) .. ";" .. arok_text[ii][1] .. "]"
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

		if not (pressed.no or pressed.quit) and (pressed.rules or (pressed.text~="" and pressed.text~=arok_text[i][3])) then
			minetest.after((0.1), function(i)
				create_agreerules_form(i)
				return minetest.show_formspec(name, "AgreeRulesYesNoForm",agreerules_form)
			end, i)
			return true
		end

		if (pressed.no or pressed.quit) and not (pressed.yes or pressed.key_enter) then
			return minetest.kick_player(name,arok_text[i][5])
		end

		if Enable_type_text_to_accept==true then
			if pressed.text~=arok_text[i][3] then
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
		minetest.chat_send_player(name," " .. arok_text[i][6])
		minetest.chat_send_all(arok_text[Default_language_number][7] .." "..name.." ")
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
