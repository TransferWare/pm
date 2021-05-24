CREATE OR REPLACE PACKAGE BODY "XXYSS_ADMIN"."PM_CFG" IS
-- Local data

-- v$statname.statistic#
v_last_statistic# number := null;
-- v$statname.name
v_last_name varchar2(64) := null;

/*
|| Local procedures
*/

procedure set_cfg_value
(
	i_db in pm_config.db%type
,	i_cfg_nr in pm_config.cfg_nr%type
,	i_description in pm_config.description%type
,	i_value in pm_config.value%type
)
is
begin
	insert
	into	pm_config
	(
		db
	,	cfg_nr
	,	description
	,	value
	)
	values
	(
		i_db
	,	i_cfg_nr
	,	i_description
	,	i_value
	);
exception
	when	dup_val_on_index
	then
		update	pm_config cfg
		set	cfg.value = i_value
		where	cfg.db = i_db
		and	cfg.cfg_nr = i_cfg_nr;
end	set_cfg_value;

function get_cfg_value
(
	i_db in pm_config.db%type
,	i_cfg_nr in pm_config.cfg_nr%type
)
return	pm_config.value%type
is
	cursor	c_cfg
	is
		select	cfg.value
		from	pm_config cfg
		where	cfg.db = i_db
		and	cfg.cfg_nr = i_cfg_nr;

	v_value	pm_config.value%type;
begin
	open	c_cfg;
	fetch	c_cfg
	into	v_value;
	if	c_cfg%notfound
	then
		close	c_cfg;
		return	null;
	else
		close	c_cfg;
		return	v_value;
	end if;
exception
	when	others
	then
		return	null;
end	get_cfg_value;

/*
|| Global procedures
*/

-- Get statistic #
function get_statistic#( i_name in varchar2 )
return number
is
        v_cursor sys_refcursor;
	v_value number;
begin
	if	v_last_name = i_name
	then
		null;
	else
		v_last_name := i_name;

		open 	v_cursor for '
			select	statistic#
			from	v$statname sta
			where	sta.name = :1'
          	using i_name;

		fetch	v_cursor
		into	v_last_statistic#;

		if	v_cursor%notfound
		then
			v_last_statistic# := null;
			close	v_cursor;
		else
			close	v_cursor;
		end if;
	end if;

	return	v_last_statistic#;
exception
	when	others
	then
		if	v_cursor%isopen
		then
			close	v_cursor;
		end if;
		return	null;
end	get_statistic#;

/* return either the (value of) keyword Name or Revision */
function version
return varchar2
is
	v_keyword varchar2(100) := NULL;
	v_length integer;
	v_pos integer;
	v_result v_keyword%type := NULL;
begin
	for nr in 1..2
	loop
		if	nr = 1
		then
			v_keyword := '$Name$';
			v_length := 9; /* length with a ':  ' after Name */
		else
			v_keyword := '$Revision: 1204 $';
			v_length := 13; /* length with a ':  ' after Revision */
		end if;

		v_pos := instr( v_keyword, ':' );
		      /* If the characters following keyword are ':  ' then skip */
		if ( v_pos > 0 and length(v_keyword) > v_length )
		then
			v_result := substr( v_keyword, v_pos + 2, length( v_keyword ) - v_length );
			exit;
		end if;
	end loop;

	return	v_result;
exception
	when	others
	then
		return	NULL;
end	version;

end pm_cfg;
/

