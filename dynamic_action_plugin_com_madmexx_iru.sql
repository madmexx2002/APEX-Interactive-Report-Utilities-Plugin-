prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_200100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2020.03.31'
,p_release=>'20.1.0.00.13'
,p_default_workspace_id=>4100336638023588
,p_default_application_id=>113
,p_default_id_offset=>0
,p_default_owner=>'MARK'
);
end;
/
 
prompt APPLICATION 113 - MadMexx Sample Application
--
-- Application Export:
--   Application:     113
--   Name:            MadMexx Sample Application
--   Date and Time:   16:05 Saturday January 8, 2022
--   Exported By:     MARK
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 236300576547683413
--   Manifest End
--   Version:         20.1.0.00.13
--   Instance ID:     600155217090744
--

begin
  -- replace components
  wwv_flow_api.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/dynamic_action/com_madmexx_iru
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(236300576547683413)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'COM.MADMEXX.IRU'
,p_display_name=>'Interactive Report Utilities'
,p_category=>'INIT'
,p_supported_ui_types=>'DESKTOP'
,p_javascript_file_urls=>'#PLUGIN_FILES#js/ir#MIN#.js'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function render ',
'  ( p_dynamic_action in apex_plugin.t_dynamic_action',
'  , p_plugin         in apex_plugin.t_plugin ',
'  )',
'return apex_plugin.t_dynamic_action_render_result',
'as',
'    l_result     apex_plugin.t_dynamic_action_render_result;',
'    ',
'    -- Custom attributes',
'    l_attribute1 p_dynamic_action.attribute_01%type := p_dynamic_action.attribute_01;',
'    l_attribute2 p_dynamic_action.attribute_02%type := p_dynamic_action.attribute_02;',
'    l_attribute3 p_dynamic_action.attribute_03%type := p_dynamic_action.attribute_03;',
'    l_attribute4 p_dynamic_action.attribute_03%type := p_dynamic_action.attribute_04;',
'    l_attribute5 p_dynamic_action.attribute_03%type := p_dynamic_action.attribute_05;',
'',
'begin',
'    ',
'    -- Debug',
'    if apex_application.g_debug ',
'    then',
'        apex_plugin_util.debug_dynamic_action',
'          ( p_plugin         => p_plugin',
'          , p_dynamic_action => p_dynamic_action',
'          );',
'    end if;',
'',
'    -- Load javascript',
'    /*',
'    APEX_JAVASCRIPT.ADD_LIBRARY(',
'        P_NAME                   => ''js/ir'',',
'        P_CHECK_TO_ADD_MINIFIED  => TRUE,',
'        P_DIRECTORY              => P_PLUGIN.FILE_PREFIX,',
'        P_KEY                    => ''com.madmexx.iru.ir''',
'    );',
'    */',
'    -- Call the function with the specific region id',
'    l_result.javascript_function := ''function(){',
'            caller($(this)[0].action.affectedRegionId,"'' || l_attribute1 || ''","'' || l_attribute2 || ''","'' || l_attribute3 || ''","'' || l_attribute4 ||''","'' || l_attribute5 || ''");',
'        }'';',
'',
'    return l_result;',
'    ',
'end render;'))
,p_api_version=>2
,p_render_function=>'render'
,p_standard_attributes=>'REGION'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1'
,p_about_url=>'https://github.com/madmexx2002/APEX-Interactive-Report-Utilities-Plugin'
,p_plugin_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'MIT License',
'',
'Copyright (c) 2022 Mark Lenzer',
'',
'Permission is hereby granted, free of charge, to any person obtaining a copy',
'of this software and associated documentation files (the "Software"), to deal',
'in the Software without restriction, including without limitation the rights',
'to use, copy, modify, merge, publish, distribute, sublicense, and/or sell',
'copies of the Software, and to permit persons to whom the Software is',
'furnished to do so, subject to the following conditions:',
'',
'The above copyright notice and this permission notice shall be included in all',
'copies or substantial portions of the Software.',
'',
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR',
'IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,',
'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE',
'AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER',
'LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,',
'OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE',
'SOFTWARE.'))
,p_files_version=>77
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(236300834694683423)
,p_plugin_id=>wwv_flow_api.id(236300576547683413)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Highlight Search'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(236301199311683424)
,p_plugin_id=>wwv_flow_api.id(236300576547683413)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Pagination'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(237000635724730276)
,p_plugin_id=>wwv_flow_api.id(236300576547683413)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>15
,p_prompt=>'Highlight Search Color'
,p_attribute_type=>'COLOR'
,p_is_required=>true
,p_default_value=>'#f5df69'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(236300834694683423)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(184801387293720331)
,p_plugin_id=>wwv_flow_api.id(236300576547683413)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Highlight Row'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(184900209847730424)
,p_plugin_id=>wwv_flow_api.id(236300576547683413)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Highlight Row Color'
,p_attribute_type=>'COLOR'
,p_is_required=>true
,p_default_value=>'#A6C0CC'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(184801387293720331)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '4D4954204C6963656E73650D0A0D0A436F70797269676874202863292032303232204D61726B204C656E7A65720D0A0D0A5065726D697373696F6E20697320686572656279206772616E7465642C2066726565206F66206368617267652C20746F20616E';
wwv_flow_api.g_varchar2_table(2) := '7920706572736F6E206F627461696E696E67206120636F70790D0A6F66207468697320736F66747761726520616E64206173736F63696174656420646F63756D656E746174696F6E2066696C657320287468652022536F66747761726522292C20746F20';
wwv_flow_api.g_varchar2_table(3) := '6465616C0D0A696E2074686520536F66747761726520776974686F7574207265737472696374696F6E2C20696E636C7564696E6720776974686F7574206C696D69746174696F6E20746865207269676874730D0A746F207573652C20636F70792C206D6F';
wwv_flow_api.g_varchar2_table(4) := '646966792C206D657267652C207075626C6973682C20646973747269627574652C207375626C6963656E73652C20616E642F6F722073656C6C0D0A636F70696573206F662074686520536F6674776172652C20616E6420746F207065726D697420706572';
wwv_flow_api.g_varchar2_table(5) := '736F6E7320746F2077686F6D2074686520536F6674776172652069730D0A6675726E697368656420746F20646F20736F2C207375626A65637420746F2074686520666F6C6C6F77696E6720636F6E646974696F6E733A0D0A0D0A5468652061626F766520';
wwv_flow_api.g_varchar2_table(6) := '636F70797269676874206E6F7469636520616E642074686973207065726D697373696F6E206E6F74696365207368616C6C20626520696E636C7564656420696E20616C6C0D0A636F70696573206F72207375627374616E7469616C20706F7274696F6E73';
wwv_flow_api.g_varchar2_table(7) := '206F662074686520536F6674776172652E0D0A0D0A54484520534F4654574152452049532050524F564944454420224153204953222C20574954484F55542057415252414E5459204F4620414E59204B494E442C2045585052455353204F520D0A494D50';
wwv_flow_api.g_varchar2_table(8) := '4C4945442C20494E434C5544494E4720425554204E4F54204C494D4954454420544F205448452057415252414E54494553204F46204D45524348414E544142494C4954592C0D0A4649544E45535320464F52204120504152544943554C41522050555250';
wwv_flow_api.g_varchar2_table(9) := '4F534520414E44204E4F4E494E4652494E47454D454E542E20494E204E4F204556454E54205348414C4C205448450D0A415554484F5253204F5220434F5059524947485420484F4C44455253204245204C4941424C4520464F5220414E5920434C41494D';
wwv_flow_api.g_varchar2_table(10) := '2C2044414D41474553204F52204F544845520D0A4C494142494C4954592C205748455448455220494E20414E20414354494F4E204F4620434F4E54524143542C20544F5254204F52204F54484552574953452C2041524953494E472046524F4D2C0D0A4F';
wwv_flow_api.g_varchar2_table(11) := '5554204F46204F5220494E20434F4E4E454354494F4E20574954482054484520534F465457415245204F522054484520555345204F52204F54484552204445414C494E475320494E205448450D0A534F4654574152452E0D0A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(120706323998668741)
,p_plugin_id=>wwv_flow_api.id(236300576547683413)
,p_file_name=>'LICENSE'
,p_mime_type=>'application/octet-stream'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A2A0D0A202A204066756E6374696F6E2043616C6C207468652072656C617465642066756E6374696F6E730D0A202A2040706172616D207B242874686973295B305D2E616374696F6E2E6166666563746564526567696F6E49647D20705F6166666563';
wwv_flow_api.g_varchar2_table(2) := '746564526567696F6E4964200D0A202A2040706172616D207B59206F72204E7D20705F61747472696231200D0A202A2040706172616D207B59206F72204E7D20705F61747472696232200D0A202A2040706172616D207B48455820436F6C6F7220436F64';
wwv_flow_api.g_varchar2_table(3) := '657D20705F61747472696233200D0A202A2040706172616D207B59206F72204E7D20705F61747472696234200D0A202A2040706172616D207B48455820436F6C6F7220436F64657D20705F61747472696235200D0A202A2F0D0A2066756E6374696F6E20';
wwv_flow_api.g_varchar2_table(4) := '63616C6C657228705F6166666563746564526567696F6E49642C20705F617474726962312C20705F617474726962322C20705F617474726962332C20705F617474726962342C20705F6174747269623529207B0D0A20202020636F6E736F6C652E696E66';
wwv_flow_api.g_varchar2_table(5) := '6F2827496E746572616374697665205265706F7274205574696C206C6F6164656420666F7220726567696F6E3A2027202B20705F6166666563746564526567696F6E4964293B0D0A2020202069662028705F61747472696231203D3D3D2027592729207B';
wwv_flow_api.g_varchar2_table(6) := '0D0A2020202020202020486967686C6967687453656172636828705F6166666563746564526567696F6E49642C20705F61747472696233293B0D0A202020207D0D0A2020202069662028705F61747472696232203D3D3D2027592729207B0D0A20202020';
wwv_flow_api.g_varchar2_table(7) := '20202020506167696E6174696F6E28705F6166666563746564526567696F6E4964293B0D0A202020207D0D0A2020202069662028705F61747472696234203D3D3D2027592729207B0D0A2020202020202020636F6E736F6C652E6C6F672827486967686C';
wwv_flow_api.g_varchar2_table(8) := '69676874526F7727293B0D0A2020202020202020617065782E6A517565727928617065782E6750616765436F6E7465787424292E6F6E2827617065787265616479656E64272C2066756E6374696F6E20286529207B0D0A20202020202020202020202063';
wwv_flow_api.g_varchar2_table(9) := '6F6E736F6C652E696E666F2827417065785265616479456E6427293B0D0A202020202020202020202020486967686C69676874526F7728705F6166666563746564526567696F6E49642C20705F61747472696235293B0D0A20202020202020207D293B0D';
wwv_flow_api.g_varchar2_table(10) := '0A20202020202020200D0A202020207D202020200D0A7D0D0A0D0A2F2A2A0D0A202A204066756E6374696F6E20486967686C696768745365617263680D0A202A20406465736372697074696F6E2020486967686C696768742073656172636820666F7220';
wwv_flow_api.g_varchar2_table(11) := '496E746572616374697665205265706F72740D0A202A2040706172616D20705F496E7465726163746976655265706F727420496E746572616374697665205265706F7274205374617469632049440D0A202A2F0D0A66756E6374696F6E20486967686C69';
wwv_flow_api.g_varchar2_table(12) := '67687453656172636828705F496E7465726163746976655265706F72742C20705F436F6C6F7229207B0D0A202020202F2F204372656174652064796E616D6963204B657975702048616E646C65720D0A202020202428272327202B20705F496E74657261';
wwv_flow_api.g_varchar2_table(13) := '63746976655265706F7274292E6B657975702866756E6374696F6E20286529207B0D0A202020202020202069662028652E7461726765742E6964203D3D20705F496E7465726163746976655265706F7274202B20275F7365617263685F6669656C642729';
wwv_flow_api.g_varchar2_table(14) := '207B0D0A202020202020202020202020765F736561726368203D202428272327202B20705F496E7465726163746976655265706F7274202B20275F7365617263685F6669656C6427292E76616C28293B0D0A202020202020202020202020765F73656172';
wwv_flow_api.g_varchar2_table(15) := '6368203D20765F7365617263682E746F4C6F7765724361736528293B0D0A20202020202020202020202077696E646F775B705F496E7465726163746976655265706F7274202B20275F736561726368275D203D20765F7365617263683B0D0A2020202020';
wwv_flow_api.g_varchar2_table(16) := '20202020202020486967686C6967687443656C6C28705F496E7465726163746976655265706F72742C2077696E646F775B705F496E7465726163746976655265706F7274202B20275F736561726368275D2C2027686967686C696768742D646174612729';
wwv_flow_api.g_varchar2_table(17) := '3B0D0A20202020202020207D0D0A202020207D293B0D0A0D0A202020202F2F204372656174652048616E646C657220666F72204166746572526566726573680D0A20202020617065782E6A517565727928272327202B20705F496E746572616374697665';
wwv_flow_api.g_varchar2_table(18) := '5265706F7274292E6F6E282761706578616674657272656672657368272C2066756E6374696F6E202829207B0D0A2020202020202020636F6E736F6C652E6C6F67282761706578616674657272656672657368203D3E20486967686C6967687453656172';
wwv_flow_api.g_varchar2_table(19) := '636827293B0D0A2020202020202020486967686C6967687443656C6C28705F496E7465726163746976655265706F72742C2077696E646F775B705F496E7465726163746976655265706F7274202B20275F736561726368275D2C2027686967686C696768';
wwv_flow_api.g_varchar2_table(20) := '742D6461746127293B0D0A202020207D293B0D0A0D0A202020202F2F2043726561746520636C61737320666F7220686967686C69676874207374796C650D0A20202020696E7365727443535328272327202B20705F496E7465726163746976655265706F';
wwv_flow_api.g_varchar2_table(21) := '7274202B27202E686967686C696768742D64617461207B6261636B67726F756E642D636F6C6F723A2027202B20705F436F6C6F72202B202721696D706F7274616E747D27293B0D0A0D0A202020202F2F20436C656172206C6F63616C20676C6F62616C54';
wwv_flow_api.g_varchar2_table(22) := '6869730D0A2020202077696E646F775B705F496E7465726163746976655265706F7274202B20275F736561726368275D203D206E756C6C3B0D0A7D0D0A0D0A2F2A2A0D0A202A204066756E6374696F6E20496E6A6563742061204353532072756C652069';
wwv_flow_api.g_varchar2_table(23) := '6E746F2074686520646F63756D656E740D0A202A2040706172616D20705F435353200D0A202A2F0D0A66756E6374696F6E20696E7365727443535328705F43535329207B0D0A202020202F2F204372656174652061204353532052756C6520616E642061';
wwv_flow_api.g_varchar2_table(24) := '646420746F2074686520646F6D0D0A20202020766172207374796C65203D20646F63756D656E742E637265617465456C656D656E7428277374796C6527293B0D0A20202020646F63756D656E742E686561642E617070656E644368696C64287374796C65';
wwv_flow_api.g_varchar2_table(25) := '293B0D0A202020207374796C652E73686565742E696E7365727452756C6528705F435353293B0D0A7D0D0A2F2A2A0D0A202A204066756E6374696F6E20486967686C6967687443656C6C0D0A202A20406465736372697074696F6E20486967686C696768';
wwv_flow_api.g_varchar2_table(26) := '74205461626C650D0A202A2F0D0A66756E6374696F6E20486967686C6967687443656C6C28705F5461626C652C20705F5365617263682C20705F436C61737329207B0D0A20202020636F6E736F6C652E6C6F672827486967686C6967687443656C6C203D';
wwv_flow_api.g_varchar2_table(27) := '3E2027202B20705F5461626C65293B0D0A202020202428272327202B20705F5461626C65202B202720746427292E656163682866756E6374696F6E202829207B0D0A20202020202020202F2F206765742074686520646174612066726F6D204952206365';
wwv_flow_api.g_varchar2_table(28) := '6C6C20616E64206D616B6520697420746F206C6F77657220636173650D0A202020202020202063656C6C44617461203D20242874686973292E7465787428293B0D0A202020202020202063656C6C44617461203D2063656C6C446174612E746F4C6F7765';
wwv_flow_api.g_varchar2_table(29) := '724361736528293B0D0A0D0A20202020202020202F2F2073656172636820495220736561726368206669656C642076616C756520776974682049522063656C6C20646174610D0A202020202020202063656C6C44617461203D2063656C6C446174612E73';
wwv_flow_api.g_varchar2_table(30) := '656172636828705F536561726368293B0D0A0D0A20202020202020202F2F20696620616E79206D6174636820666F756E6420696E2049522063656C6C73207468656E206164642074686520636C617373200D0A2020202020202020696620282863656C6C';
wwv_flow_api.g_varchar2_table(31) := '4461746120213D20272D3127207C7C2063656C6C44617461203D3D20302920262620705F53656172636820213D20272729207B0D0A202020202020202020202020242874686973292E636C6F736573742827746427292E616464436C61737328705F436C';
wwv_flow_api.g_varchar2_table(32) := '617373293B0D0A20202020202020207D0D0A20202020202020202F2F206966206E6F206D6174636820666F756E6420696E2049522063656C6C73207468656E2072656D6F76652074686520636C6173730D0A2020202020202020656C7365206966202863';
wwv_flow_api.g_varchar2_table(33) := '656C6C44617461203D3D20272D312729207B0D0A202020202020202020202020242874686973292E636C6F736573742827746427292E72656D6F7665436C61737328705F436C617373293B0D0A20202020202020207D20656C73650D0A20202020202020';
wwv_flow_api.g_varchar2_table(34) := '2020202020242874686973292E636C6F736573742827746427292E72656D6F7665436C61737328705F436C617373293B0D0A202020207D293B0D0A7D0D0A0D0A2F2A2A0D0A202A204066756E6374696F6E20486967686C69676874526F770D0A202A2040';
wwv_flow_api.g_varchar2_table(35) := '6465736372697074696F6E20486967686C696768742061207461626C6520726F77206F6E20636C69636B0D0A202A2040706172616D207B4066756E6374696F6E7D20705F496E7465726163746976655265706F7274200D0A202A2040706172616D207B2A';
wwv_flow_api.g_varchar2_table(36) := '7D20705F486967686C69676874436F6C6F72200D0A202A2F0D0A66756E6374696F6E20486967686C69676874526F7728705F496E7465726163746976655265706F72742C20705F486967686C69676874436F6C6F7229207B0D0A202020202F2F20496E73';
wwv_flow_api.g_varchar2_table(37) := '657274204353532072756C650D0A20202020696E7365727443535328272327202B20705F496E7465726163746976655265706F7274202B2027202E686967686C696768742D726F77207B6261636B67726F756E642D636F6C6F723A2027202B20705F4869';
wwv_flow_api.g_varchar2_table(38) := '67686C69676874436F6C6F72202B202721696D706F7274616E743B7D27293B0D0A20202020242827626F647927292E6F6E2827636C69636B272C272327202B20705F496E7465726163746976655265706F7274202B2027207472272C202866756E637469';
wwv_flow_api.g_varchar2_table(39) := '6F6E2865297B0D0A20202020202020202428272E686967686C696768742D726F7727292E72656D6F7665436C6173732827686967686C696768742D726F7727293B0D0A20202020202020202428652E63757272656E74546172676574292E6368696C6472';
wwv_flow_api.g_varchar2_table(40) := '656E2827746427292E616464436C6173732827686967686C696768742D726F7727293B0D0A20202020202020202F2F202428652E63757272656E74546172676574292E66696E6428276127295B305D2E636C69636B28293B0D0A202020207D29290D0A7D';
wwv_flow_api.g_varchar2_table(41) := '0D0A0D0A2F2A2A0D0A202A204066756E6374696F6E20506167696E6174696F6E0D0A202A20406465736372697074696F6E20496E697420637265617465506167696E6174696F6E206576656E742068616E646C6572730D0A202A2040706172616D20705F';
wwv_flow_api.g_varchar2_table(42) := '496E7465726163746976655265706F727420496E746572616374697665205265706F7274205374617469632049440D0A202A2F0D0A66756E6374696F6E20506167696E6174696F6E28705F496E7465726163746976655265706F727429207B0D0A202020';
wwv_flow_api.g_varchar2_table(43) := '20617065782E6A517565727928617065782E6750616765436F6E7465787424292E6F6E2827617065787265616479656E64272C2066756E6374696F6E20286529207B0D0A2020202020202020636F6E736F6C652E696E666F282741706578526561647945';
wwv_flow_api.g_varchar2_table(44) := '6E6427293B0D0A2020202020202020637265617465506167696E6174696F6E28705F496E7465726163746976655265706F7274293B0D0A202020207D293B0D0A0D0A20202020617065782E6A517565727928272327202B20705F496E7465726163746976';
wwv_flow_api.g_varchar2_table(45) := '655265706F7274292E6F6E282761706578616674657272656672657368272C2066756E6374696F6E202829207B0D0A2020202020202020636F6E736F6C652E696E666F28274170657841667465725265667265736827293B0D0A20202020202020206372';
wwv_flow_api.g_varchar2_table(46) := '65617465506167696E6174696F6E28705F496E7465726163746976655265706F7274293B0D0A202020207D293B0D0A7D0D0A0D0A2F2A2A0D0A202A204066756E6374696F6E20637265617465506167696E6174696F6E0D0A202A20406465736372697074';
wwv_flow_api.g_varchar2_table(47) := '696F6E202043726561746520427574746F6E7320666F7220706167696E6174696F6E20696E20746865206D656E7562617220666F7220496E746572616374697665205265706F72740D0A202A2040706172616D20705F496E746572616374697665526570';
wwv_flow_api.g_varchar2_table(48) := '6F727420496E746572616374697665205265706F7274205374617469632049440D0A202A2F0D0A66756E6374696F6E20637265617465506167696E6174696F6E28705F496E7465726163746976655265706F727429207B0D0A20202020636F6E736F6C65';
wwv_flow_api.g_varchar2_table(49) := '2E696E666F2827637265617465506167696E6174696F6E27293B0D0A0D0A202020202F2A20506C6163652077686572652074686520627574746F6E732077696C6C2062652063726561746564202E612D4952522D627574746F6E73202A2F0D0A20202020';
wwv_flow_api.g_varchar2_table(50) := '6C65742074656D705F746172676574203D20272E612D4952522D616374696F6E73273B0D0A202020202F2A204E657720427574746F6E73202A2F0D0A202020206C65742074656D705F427574746F6E5F70726576203D20273C627574746F6E20636C6173';
wwv_flow_api.g_varchar2_table(51) := '733D22742D427574746F6E20742D427574746F6E2D2D6E6F4C6162656C20742D427574746F6E2D2D69636F6E20742D427574746F6E2D2D7061644C65667422206F6E636C69636B3D22766F69642830293B2220747970653D22627574746F6E222069643D';
wwv_flow_api.g_varchar2_table(52) := '2227202B20705F496E7465726163746976655265706F7274202B20275F62746E5F7072657622207469746C653D2250726576696F757320506167652220617269612D6C6162656C3D2250726576696F75732050616765223E3C7370616E20636C6173733D';
wwv_flow_api.g_varchar2_table(53) := '22742D49636F6E2066612066612D63686576726F6E2D6C6566742220617269612D68696464656E3D2274727565223E3C2F7370616E3E3C2F627574746F6E3E273B0D0A202020206C65742074656D705F427574746F6E5F6E657874203D20273C62757474';
wwv_flow_api.g_varchar2_table(54) := '6F6E20636C6173733D22742D427574746F6E20742D427574746F6E2D2D6E6F4C6162656C20742D427574746F6E2D2D69636F6E22206F6E636C69636B3D22766F69642830293B2220747970653D22627574746F6E222069643D2227202B20705F496E7465';
wwv_flow_api.g_varchar2_table(55) := '726163746976655265706F7274202B20275F62746E5F6E65787422207469746C653D224E65787420506167652220617269612D6C6162656C3D224E6578742050616765223E3C7370616E20636C6173733D22742D49636F6E2066612066612D6368657672';
wwv_flow_api.g_varchar2_table(56) := '6F6E2D72696768742220617269612D68696464656E3D2274727565223E3C2F7370616E3E3C2F627574746F6E3E273B0D0A202020202F2A20506167696E6174696F6E20427574746F6E73202A2F0D0A202020206C65742049525F506167696E6174696F6E';
wwv_flow_api.g_varchar2_table(57) := '5F4E657874203D20272327202B20705F496E7465726163746976655265706F7274202B2027206C692E612D4952522D706167696E6174696F6E2D6974656D3A6E74682D6368696C6428332920627574746F6E273B0D0A202020206C65742049525F506167';
wwv_flow_api.g_varchar2_table(58) := '696E6174696F6E5F50726576203D20272327202B20705F496E7465726163746976655265706F7274202B2027206C692E612D4952522D706167696E6174696F6E2D6974656D3A6E74682D6368696C6428312920627574746F6E273B0D0A0D0A202020202F';
wwv_flow_api.g_varchar2_table(59) := '2F20417070656E642050726576696F757320427574746F6E20746F20646F6D0D0A202020202428272327202B20705F496E7465726163746976655265706F7274202B20272027202B2074656D705F746172676574292E617070656E642874656D705F4275';
wwv_flow_api.g_varchar2_table(60) := '74746F6E5F70726576290D0A0D0A202020202F2F2041646420436C69636B2048616E646C65720D0A202020202428272327202B20705F496E7465726163746976655265706F7274202B20275F62746E5F7072657627292E62696E642827636C69636B272C';
wwv_flow_api.g_varchar2_table(61) := '2066756E6374696F6E202829207B0D0A2020202020202020242849525F506167696E6174696F6E5F50726576292E636C69636B28293B0D0A202020207D293B0D0A0D0A202020202F2F2044697361626C6520427574746F6E2069662050726576696F7573';
wwv_flow_api.g_varchar2_table(62) := '20427574746F6E2069736E27742072656E64657265640D0A2020202069662028242849525F506167696E6174696F6E5F50726576292E6C656E677468203D3D3D203029207B0D0A2020202020202020617065782E6974656D28705F496E74657261637469';
wwv_flow_api.g_varchar2_table(63) := '76655265706F7274202B20275F62746E5F7072657627292E64697361626C6528293B0D0A202020207D0D0A0D0A202020202F2F20417070656E64204E65787420427574746F6E20746F20646F6D0D0A202020202428272327202B20705F496E7465726163';
wwv_flow_api.g_varchar2_table(64) := '746976655265706F7274202B20272027202B2074656D705F746172676574292E617070656E642874656D705F427574746F6E5F6E657874293B0D0A0D0A202020202F2F2041646420436C69636B2048616E646C65720D0A202020202428272327202B2070';
wwv_flow_api.g_varchar2_table(65) := '5F496E7465726163746976655265706F7274202B20275F62746E5F6E65787427292E62696E642827636C69636B272C2066756E6374696F6E202829207B0D0A2020202020202020242849525F506167696E6174696F6E5F4E657874292E636C69636B2829';
wwv_flow_api.g_varchar2_table(66) := '3B0D0A202020207D293B0D0A0D0A202020202F2F2044697361626C6520427574746F6E2069662050726576696F757320427574746F6E2069736E27742072656E64657265640D0A2020202069662028242849525F506167696E6174696F6E5F4E65787429';
wwv_flow_api.g_varchar2_table(67) := '2E6C656E677468203D3D3D203029207B0D0A2020202020202020617065782E6974656D28705F496E7465726163746976655265706F7274202B20275F62746E5F6E65787427292E64697361626C6528293B0D0A202020207D0D0A7D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(185300858943973500)
,p_plugin_id=>wwv_flow_api.id(236300576547683413)
,p_file_name=>'js/ir.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '66756E6374696F6E2063616C6C657228742C652C612C6E2C692C6F297B2259223D3D3D652626486967686C6967687453656172636828742C6E292C2259223D3D3D612626506167696E6174696F6E2874292C2259223D3D3D692626617065782E6A517565';
wwv_flow_api.g_varchar2_table(2) := '727928617065782E6750616765436F6E7465787424292E6F6E2822617065787265616479656E64222C2866756E6374696F6E2865297B486967686C69676874526F7728742C6F297D29297D66756E6374696F6E20486967686C6967687453656172636828';
wwv_flow_api.g_varchar2_table(3) := '742C65297B24282223222B74292E6B65797570282866756E6374696F6E2865297B652E7461726765742E69643D3D742B225F7365617263685F6669656C6422262628765F7365617263683D24282223222B742B225F7365617263685F6669656C6422292E';
wwv_flow_api.g_varchar2_table(4) := '76616C28292C765F7365617263683D765F7365617263682E746F4C6F7765724361736528292C77696E646F775B742B225F736561726368225D3D765F7365617263682C486967686C6967687443656C6C28742C77696E646F775B742B225F736561726368';
wwv_flow_api.g_varchar2_table(5) := '225D2C22686967686C696768742D646174612229297D29292C617065782E6A5175657279282223222B74292E6F6E282261706578616674657272656672657368222C2866756E6374696F6E28297B486967686C6967687443656C6C28742C77696E646F77';
wwv_flow_api.g_varchar2_table(6) := '5B742B225F736561726368225D2C22686967686C696768742D6461746122297D29292C696E73657274435353282223222B742B22202E686967686C696768742D64617461207B6261636B67726F756E642D636F6C6F723A20222B652B2221696D706F7274';
wwv_flow_api.g_varchar2_table(7) := '616E747D22292C77696E646F775B742B225F736561726368225D3D6E756C6C7D66756E6374696F6E20696E736572744353532874297B76617220653D646F63756D656E742E637265617465456C656D656E7428227374796C6522293B646F63756D656E74';
wwv_flow_api.g_varchar2_table(8) := '2E686561642E617070656E644368696C642865292C652E73686565742E696E7365727452756C652874297D66756E6374696F6E20486967686C6967687443656C6C28742C652C61297B24282223222B742B2220746422292E65616368282866756E637469';
wwv_flow_api.g_varchar2_table(9) := '6F6E28297B63656C6C446174613D242874686973292E7465787428292C63656C6C446174613D63656C6C446174612E746F4C6F7765724361736528292C63656C6C446174613D63656C6C446174612E7365617263682865292C222D31223D3D63656C6C44';
wwv_flow_api.g_varchar2_table(10) := '617461262630213D63656C6C446174617C7C22223D3D653F2863656C6C446174612C242874686973292E636C6F736573742822746422292E72656D6F7665436C617373286129293A242874686973292E636C6F736573742822746422292E616464436C61';
wwv_flow_api.g_varchar2_table(11) := '73732861297D29297D66756E6374696F6E20486967686C69676874526F7728742C65297B696E73657274435353282223222B742B22202E686967686C696768742D726F77207B6261636B67726F756E642D636F6C6F723A20222B652B2221696D706F7274';
wwv_flow_api.g_varchar2_table(12) := '616E743B7D22292C242822626F647922292E6F6E2822636C69636B222C2223222B742B22207472222C2866756E6374696F6E2874297B2428222E686967686C696768742D726F7722292E72656D6F7665436C6173732822686967686C696768742D726F77';
wwv_flow_api.g_varchar2_table(13) := '22292C2428742E63757272656E74546172676574292E6368696C6472656E2822746422292E616464436C6173732822686967686C696768742D726F7722297D29297D66756E6374696F6E20506167696E6174696F6E2874297B617065782E6A5175657279';
wwv_flow_api.g_varchar2_table(14) := '28617065782E6750616765436F6E7465787424292E6F6E2822617065787265616479656E64222C2866756E6374696F6E2865297B637265617465506167696E6174696F6E2874297D29292C617065782E6A5175657279282223222B74292E6F6E28226170';
wwv_flow_api.g_varchar2_table(15) := '6578616674657272656672657368222C2866756E6374696F6E28297B637265617465506167696E6174696F6E2874297D29297D66756E6374696F6E20637265617465506167696E6174696F6E2874297B6C657420653D222E612D4952522D616374696F6E';
wwv_flow_api.g_varchar2_table(16) := '73222C613D273C627574746F6E20636C6173733D22742D427574746F6E20742D427574746F6E2D2D6E6F4C6162656C20742D427574746F6E2D2D69636F6E20742D427574746F6E2D2D7061644C65667422206F6E636C69636B3D22766F69642830293B22';
wwv_flow_api.g_varchar2_table(17) := '20747970653D22627574746F6E222069643D22272B742B275F62746E5F7072657622207469746C653D2250726576696F757320506167652220617269612D6C6162656C3D2250726576696F75732050616765223E3C7370616E20636C6173733D22742D49';
wwv_flow_api.g_varchar2_table(18) := '636F6E2066612066612D63686576726F6E2D6C6566742220617269612D68696464656E3D2274727565223E3C2F7370616E3E3C2F627574746F6E3E272C6E3D273C627574746F6E20636C6173733D22742D427574746F6E20742D427574746F6E2D2D6E6F';
wwv_flow_api.g_varchar2_table(19) := '4C6162656C20742D427574746F6E2D2D69636F6E22206F6E636C69636B3D22766F69642830293B2220747970653D22627574746F6E222069643D22272B742B275F62746E5F6E65787422207469746C653D224E65787420506167652220617269612D6C61';
wwv_flow_api.g_varchar2_table(20) := '62656C3D224E6578742050616765223E3C7370616E20636C6173733D22742D49636F6E2066612066612D63686576726F6E2D72696768742220617269612D68696464656E3D2274727565223E3C2F7370616E3E3C2F627574746F6E3E272C693D2223222B';
wwv_flow_api.g_varchar2_table(21) := '742B22206C692E612D4952522D706167696E6174696F6E2D6974656D3A6E74682D6368696C6428332920627574746F6E222C6F3D2223222B742B22206C692E612D4952522D706167696E6174696F6E2D6974656D3A6E74682D6368696C64283129206275';
wwv_flow_api.g_varchar2_table(22) := '74746F6E223B24282223222B742B2220222B65292E617070656E642861292C24282223222B742B225F62746E5F7072657622292E62696E642822636C69636B222C2866756E6374696F6E28297B24286F292E636C69636B28297D29292C303D3D3D24286F';
wwv_flow_api.g_varchar2_table(23) := '292E6C656E6774682626617065782E6974656D28742B225F62746E5F7072657622292E64697361626C6528292C24282223222B742B2220222B65292E617070656E64286E292C24282223222B742B225F62746E5F6E65787422292E62696E642822636C69';
wwv_flow_api.g_varchar2_table(24) := '636B222C2866756E6374696F6E28297B242869292E636C69636B28297D29292C303D3D3D242869292E6C656E6774682626617065782E6974656D28742B225F62746E5F6E65787422292E64697361626C6528297D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(185301192015973509)
,p_plugin_id=>wwv_flow_api.id(236300576547683413)
,p_file_name=>'js/ir.min.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
