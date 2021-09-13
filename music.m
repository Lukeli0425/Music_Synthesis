function varargout = music(varargin)
% MUSIC MATLAB code for music.fig

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @music_OpeningFcn, ...
                   'gui_OutputFcn',  @music_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before music is made visible.
function music_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to music (see VARARGIN)

% Choose default command line output for music
handles.output = hObject;
global music;
global score;
global note;
global u;
global tune;
global mode;
global note_len;
global filename;
filename = 'music.wav';
music = [];
score = [];
note = 1;
n1 = findobj(0,'tag','note_1');
set(n1,'value',1);
tune = 'c';
c = findobj(0,'tag','C_button');
set(c,'value',1);
note_len = 1;
l4 = findobj(0,'tag','note_length_4');
set(l4,'value',1);
mode = 1;
m1 = findobj(0,'tag','choose_style_1');
set(m1,'value',1);
u = 0;
none = findobj(0,'tag','none_button');
set(none,'value',1);

% Update handles structure
guidata(hObject, handles);
% UIWAIT makes music wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = music_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in play_button.
function play_button_Callback(hObject, eventdata, handles)

global music;
fs = 8000;
sound(music,fs); % 播放音乐
guidata(hObject,handles);


% --- Executes on button press in choose_style_1.
function choose_style_1_Callback(hObject, eventdata, handles)

global mode;
mode = 1;
set(hObject,'value',1);
cs2 = findobj(0,'tag','choose_style_2');
cs3 = findobj(0,'tag','choose_style_3');
cs4 = findobj(0,'tag','choose_style_4');
cs5 = findobj(0,'tag','choose_style_5');
set(cs2,'value',0);
set(cs3,'value',0);
set(cs4,'value',0);
set(cs5,'value',0);
guidata(hObject,handles);


% --- Executes on button press in choose_style_2.
function choose_style_2_Callback(hObject, eventdata, handles)

global mode;
mode = 2;
set(hObject,'value',1);
cs1 = findobj(0,'tag','choose_style_1');
cs3 = findobj(0,'tag','choose_style_3');
cs4 = findobj(0,'tag','choose_style_4');
cs5 = findobj(0,'tag','choose_style_5');
set(cs1,'value',0);
set(cs3,'value',0);
set(cs4,'value',0);
set(cs5,'value',0);
guidata(hObject,handles);


% --- Executes on button press in choose_style_3.
function choose_style_3_Callback(hObject, eventdata, handles)

global mode;
mode = 3;
set(hObject,'value',1);
cs1 = findobj(0,'tag','choose_style_1');
cs2 = findobj(0,'tag','choose_style_2');
cs4 = findobj(0,'tag','choose_style_4');
cs5 = findobj(0,'tag','choose_style_5');
set(cs1,'value',0);
set(cs2,'value',0);
set(cs4,'value',0);
set(cs5,'value',0);
guidata(hObject,handles);


% --- Executes on button press in choose_style_4.
function choose_style_4_Callback(hObject, eventdata, handles)

global mode;
mode = 4;
set(hObject,'value',1);
cs1 = findobj(0,'tag','choose_style_1');
cs2 = findobj(0,'tag','choose_style_2');
cs3 = findobj(0,'tag','choose_style_3');
cs5 = findobj(0,'tag','choose_style_5');
set(cs1,'value',0);
set(cs2,'value',0);
set(cs3,'value',0);
set(cs5,'value',0);
guidata(hObject,handles);


% --- Executes on button press in choose_style_5.
function choose_style_5_Callback(hObject, eventdata, handles)

global mode;
mode = 5;
set(hObject,'value',1);
cs1 = findobj(0,'tag','choose_style_1');
cs2 = findobj(0,'tag','choose_style_2');
cs3 = findobj(0,'tag','choose_style_3');
cs4 = findobj(0,'tag','choose_style_4');
set(cs1,'value',0);
set(cs2,'value',0);
set(cs3,'value',0);
set(cs4,'value',0);
guidata(hObject,handles);
% Hint: get(hObject,'Value') returns toggle state of choose_style_5


% --- Executes on button press in note_length_8.
function note_length_8_Callback(hObject, eventdata, handles)

global note_len;
note_len = 0.5;
set(hObject,'value',1);
nl4 = findobj(0,'tag','note_length_4');
nl2 = findobj(0,'tag','note_length_2');
set(nl4,'value',0);
set(nl2,'value',0);
guidata(hObject,handles);
% Hint: get(hObject,'Value') returns toggle state of note_length_8


% --- Executes on button press in note_length_2.
function note_length_2_Callback(hObject, eventdata, handles)

global note_len;
note_len = 2;
set(hObject,'value',1);
nl8 = findobj(0,'tag','note_length_8');
nl4 = findobj(0,'tag','note_length_4');
set(nl4,'value',0);
set(nl8,'value',0);
guidata(hObject,handles);

% Hint: get(hObject,'Value') returns toggle state of note_length_2


% --- Executes on button press in note_length_4.
function note_length_4_Callback(hObject, eventdata, handles)

global note_len;
note_len = 1;
set(hObject,'value',1);
nl8 = findobj(0,'tag','note_length_8');
nl2 = findobj(0,'tag','note_length_2');
set(nl2,'value',0);
set(nl8,'value',0);
guidata(hObject,handles);
% Hint: get(hObject,'Value') returns toggle state of note_length_4


function muisc_name_Callback(hObject, eventdata, handles)
% hObject    handle to muisc_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of muisc_name as text
%        str2double(get(hObject,'String')) returns contents of muisc_name as a double
global filename;
filename = get(hObject,'String');
filename = [filename,'.wav']; % 文件名
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function muisc_name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to muisc_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in save_music.
function save_music_Callback(hObject, eventdata, handles)

global music;
global score;
global filename;
fs = 8000;
dis = findobj(0,'tag','music_display');
if length(music) == 0
    set(dis,'string','No music input!');
else
    audiowrite(filename,music,fs); % 写出文件
    set(dis,'string',['Music saved to ',filename,'!']);
end
music = [];
score = [];
guidata(hObject,handles);


% --- Executes on button press in clear_button.
function clear_button_Callback(hObject, eventdata, handles)

% 清空乐谱和音乐
global music;
global score;
music = [];
score = [];
dis = findobj(0,'tag','music_display');
set(dis,'string',score);
guidata(hObject,handles);


% --- Executes on button press in add_button.
function add_button_Callback(hObject, eventdata, handles)

global music;
global score;
global note;
global u;
global tune;
global mode;
global note_len;
multiple = [0,2,4,5,7,9,11]; % 一个八度内相对1度频率倍数
if tune == 'c'
    f = 261.63*2^((multiple(note)+u)/12);
elseif tune == 'f'
    f = 349.23*2^((multiple(note)+u)/12);
end
music = [music, get_note(note_len,f,8000,mode)];

if note_len == 1 % 四分音符
    score = [score,num2str(note),'  '];
    dis = findobj(0,'tag','music_display');
    set(dis,'string',score);
elseif note_len == 2 % 二分音符
    score = [score,num2str(note),'- '];
    dis = findobj(0,'tag','music_display');
    set(dis,'string',score);
elseif note_len == 0.5 % 八分音符
    score = [score,num2str(note),'_ '];
    dis = findobj(0,'tag','music_display');
    set(dis,'string',score);
else
    dis = findobj(0,'tag','music_display');
    set(dis,'string',[score,'  Input error']);
end




guidata(hObject,handles);



% --- Executes on button press in C_button.
function C_button_Callback(hObject, eventdata, handles)

global tune;
tune = 'c';
set(hObject,'value',1);
f = findobj(0,'tag','F_button');
set(f,'value',0);
guidata(hObject,handles);
% Hint: get(hObject,'Value') returns toggle state of C_button


% --- Executes on button press in F_button.
function F_button_Callback(hObject, eventdata, handles)

global tune;
tune = 'f';
set(hObject,'value',1);
c = findobj(0,'tag','C_button');
set(c,'value',0);
guidata(hObject,handles);
% Hint: get(hObject,'Value') returns toggle state of F_button


% --- Executes on button press in note_1.
function note_1_Callback(hObject, eventdata, handles)

global note;
note = 1;
set(hObject,'value',1);
n2 = findobj(0,'tag','note_2');
n3 = findobj(0,'tag','note_3');
n4 = findobj(0,'tag','note_4');
n5 = findobj(0,'tag','note_5');
n6 = findobj(0,'tag','note_6');
n7 = findobj(0,'tag','note_7');
set(n2,'value',0);
set(n3,'value',0);
set(n4,'value',0);
set(n5,'value',0);
set(n6,'value',0);
set(n7,'value',0);
guidata(hObject,handles);
% Hint: get(hObject,'Value') returns toggle state of note_1


% --- Executes on button press in note_2.
function note_2_Callback(hObject, eventdata, handles)

global note;
note = 2;
set(hObject,'value',1);
n1 = findobj(0,'tag','note_1');
n3 = findobj(0,'tag','note_3');
n4 = findobj(0,'tag','note_4');
n5 = findobj(0,'tag','note_5');
n6 = findobj(0,'tag','note_6');
n7 = findobj(0,'tag','note_7');
set(n1,'value',0);
set(n3,'value',0);
set(n4,'value',0);
set(n5,'value',0);
set(n6,'value',0);
set(n7,'value',0);
guidata(hObject,handles);
% Hint: get(hObject,'Value') returns toggle state of note_2


% --- Executes on button press in note_3.
function note_3_Callback(hObject, eventdata, handles)

global note;
note = 3;
set(hObject,'value',1);
n1 = findobj(0,'tag','note_1');
n2 = findobj(0,'tag','note_2');
n4 = findobj(0,'tag','note_4');
n5 = findobj(0,'tag','note_5');
n6 = findobj(0,'tag','note_6');
n7 = findobj(0,'tag','note_7');
set(n1,'value',0);
set(n2,'value',0);
set(n4,'value',0);
set(n5,'value',0);
set(n6,'value',0);
set(n7,'value',0);
guidata(hObject,handles);
% Hint: get(hObject,'Value') returns toggle state of note_3


% --- Executes on button press in note_4.
function note_4_Callback(hObject, eventdata, handles)

global note;
note = 4;
set(hObject,'value',1);
n1 = findobj(0,'tag','note_1');
n2 = findobj(0,'tag','note_2');
n3 = findobj(0,'tag','note_3');
n5 = findobj(0,'tag','note_5');
n6 = findobj(0,'tag','note_6');
n7 = findobj(0,'tag','note_7');
set(n1,'value',0);
set(n2,'value',0);
set(n3,'value',0);
set(n5,'value',0);
set(n6,'value',0);
set(n7,'value',0);
guidata(hObject,handles);


% --- Executes on button press in note_5.
function note_5_Callback(hObject, eventdata, handles)

global note;
note = 5;
set(hObject,'value',1);
n1 = findobj(0,'tag','note_1');
n2 = findobj(0,'tag','note_2');
n3 = findobj(0,'tag','note_3');
n4 = findobj(0,'tag','note_4');
n6 = findobj(0,'tag','note_6');
n7 = findobj(0,'tag','note_7');
set(n1,'value',0);
set(n2,'value',0);
set(n3,'value',0);
set(n4,'value',0);
set(n6,'value',0);
set(n7,'value',0);
guidata(hObject,handles);
% Hint: get(hObject,'Value') returns toggle state of note_5


% --- Executes on button press in note_6.
function note_6_Callback(hObject, eventdata, handles)

global note;
note = 6;
set(hObject,'value',1);
n1 = findobj(0,'tag','note_1');
n2 = findobj(0,'tag','note_2');
n3 = findobj(0,'tag','note_3');
n4 = findobj(0,'tag','note_4');
n5 = findobj(0,'tag','note_5');
n7 = findobj(0,'tag','note_7');
set(n1,'value',0);
set(n2,'value',0);
set(n3,'value',0);
set(n4,'value',0);
set(n5,'value',0);
set(n7,'value',0);
guidata(hObject,handles);
% Hint: get(hObject,'Value') returns toggle state of note_6


% --- Executes on button press in note_7.
function note_7_Callback(hObject, eventdata, handles)
% hObject    handle to note_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global note;
note = 7;
set(hObject,'value',1);
n1 = findobj(0,'tag','note_1');
n2 = findobj(0,'tag','note_2');
n3 = findobj(0,'tag','note_3');
n4 = findobj(0,'tag','note_4');
n5 = findobj(0,'tag','note_5');
n6 = findobj(0,'tag','note_6');
set(n1,'value',0);
set(n2,'value',0);
set(n3,'value',0);
set(n4,'value',0);
set(n5,'value',0);
set(n6,'value',0);
guidata(hObject,handles);
% Hint: get(hObject,'Value') returns toggle state of note_7


% --- Executes on button press in none_button.
function none_button_Callback(hObject, eventdata, handles)

global u; % 标记升降音
u = 0;
set(hObject,'value',1);
down = findobj(0,'tag','down_button');
up = findobj(0,'tag','up_button');
set(down,'value',0);
set(up,'value',0);
guidata(hObject,handles);
% Hint: get(hObject,'Value') returns toggle state of none_button



% --- Executes on button press in up_button.
function up_button_Callback(hObject, eventdata, handles)

global u; % 标记升降音
u = 1;
set(hObject,'value',1);
down = findobj(0,'tag','down_button');
none = findobj(0,'tag','none_button');
set(down,'value',0);
set(none,'value',0);
guidata(hObject,handles);
% Hint: get(hObject,'Value') returns toggle state of up_button


% --- Executes on button press in down_button.
function down_button_Callback(hObject, eventdata, handles)

global u; % 标记升降音
u = -1;
set(hObject,'value',1);
up = findobj(0,'tag','up_button');
none = findobj(0,'tag','none_button');
set(up,'value',0);
set(none,'value',0);
guidata(hObject,handles);
% Hint: get(hObject,'Value') returns toggle state of down_button


% --- Executes on button press in delete_button.
function delete_button_Callback(hObject, eventdata, handles)

global music;
global score;
global note_len;
music = music(1:end-note_len*4000);
score = score(1:end-3);
dis = findobj(0,'tag','music_display');
set(dis,'string',score);
guidata(hObject,handles);
