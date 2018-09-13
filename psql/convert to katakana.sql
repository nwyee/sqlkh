--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

CREATE FUNCTION public.han_zen_case(text) RETURNS text
    LANGUAGE plpgsql
    AS $_$declare

	input_text alias for $1;

	result text;

	zen varchar[] = ARRAY['ガ', 'ギ', 'グ', 'ゲ', 'ゴ', 'ザ', 'ジ', 'ズ', 'ゼ', 'ゾ', 'ダ', 'ヂ', 'ヅ', 'デ', 'ド', 'バ', 'ビ', 'ブ', 'ベ', 'ボ', 'パ', 'ピ', 'プ', 'ペ', 'ポ', 'ヴ'];

    han varchar[] = ARRAY['ｶﾞ', 'ｷﾞ', 'ｸﾞ', 'ｹﾞ', 'ｺﾞ', 'ｻﾞ', 'ｼﾞ', 'ｽﾞ', 'ｾﾞ', 'ｿﾞ', 'ﾀﾞ', 'ﾁﾞ', 'ﾂﾞ', 'ﾃﾞ', 'ﾄﾞ', 'ﾊﾞ', 'ﾋﾞ', 'ﾌﾞ', 'ﾍﾞ', 'ﾎﾞ', 'ﾊﾟ', 'ﾋﾟ', 'ﾌﾟ', 'ﾍﾟ', 'ﾎﾟ', 'ｳﾞ'];

	hankaku text = 'ｱｲｳｴｵｶｷｸｹｺｻｼｽｾｿﾀﾁﾂﾃﾄﾅﾆﾇﾈﾉﾊﾋﾌﾍﾎﾏﾐﾑﾒﾓﾔﾕﾖﾗﾘﾙﾚﾛﾜｦﾝｧｨｩｪｫｬｭｮｯｰ';

	zenkaku text = 'アイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤユヨラリルレロワヲンァィゥェォャュョッー';

	hiragana text = 'あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやゆよらりるれろわをんぁぃぅぇぉっゃゅょ';

	katakana text = 'アイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤユヨラリルレロワヲンァィゥェォッャュョ';

	daku_hira text = 'がぎぐげござじずぜぞだぢづでどばびぶべぼぱぴぷぺぽ';

	daku_kana text = 'ガギグゲゴザジズゼゾダヂヅデドバビブベボパピプペポ';

    

begin

	result = input_text;

	if input_text is null or input_text = '' then

		return input_text;

	end if;



	for i in 1..array_length(zen,1) loop

		result = replace(result,han[i],zen[i]);

	end loop;

	

	result = translate(result,hankaku||hiragana||daku_hira,zenkaku||katakana||daku_kana);

	return result;

end;$_$;


ALTER FUNCTION public.han_zen_case(text) OWNER TO postgres;
