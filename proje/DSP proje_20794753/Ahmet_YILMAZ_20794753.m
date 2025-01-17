function varargout = Ahmet_YILMAZ_20794753(varargin)
% AHMET_YILMAZ_20794753 M-file for Ahmet_YILMAZ_20794753.fig
%      AHMET_YILMAZ_20794753, by itself, creates a new AHMET_YILMAZ_20794753 or raises the existing
%      singleton*.
%
%      H = AHMET_YILMAZ_20794753 returns the handle to a new AHMET_YILMAZ_20794753 or the handle to
%      the existing singleton*.
%
%      AHMET_YILMAZ_20794753('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AHMET_YILMAZ_20794753.M with the given input arguments.
%
%      AHMET_YILMAZ_20794753('Property','Value',...) creates a new AHMET_YILMAZ_20794753 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Ahmet_YILMAZ_20794753_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Ahmet_YILMAZ_20794753_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Ahmet_YILMAZ_20794753

% Last Modified by GUIDE v2.5 21-Dec-2010 23:09:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Ahmet_YILMAZ_20794753_OpeningFcn, ...
                   'gui_OutputFcn',  @Ahmet_YILMAZ_20794753_OutputFcn, ...
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


% --- Executes just before Ahmet_YILMAZ_20794753 is made visible.
function Ahmet_YILMAZ_20794753_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Ahmet_YILMAZ_20794753 (see VARARGIN)

% Choose default command line output for Ahmet_YILMAZ_20794753
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Ahmet_YILMAZ_20794753 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Ahmet_YILMAZ_20794753_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
handles.I = imread('C:\Documents and Settings\Administrator\Desktop\DSP proje_20794753\31.jpg');
imshow(handles.I);
axes(handles.axes3);
handles.Y = imread('C:\Documents and Settings\Administrator\Desktop\DSP proje_20794753\logo.jpg');
imshow(handles.Y);
% Get default command line output from handles structure
varargout{1} = handles.output;
guidata(hObject, handles);





% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.R = imnoise(handles.I,'speckle',0.130);
axes(handles.axes2);
imshow(handles.R);
guidata(hObject, handles);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.R = imnoise(handles.I,'salt & pepper',0.130);
axes(handles.axes2);
imshow(handles.R);
guidata(hObject, handles);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.R = imnoise(handles.I,'poisson');
axes(handles.axes2);
imshow(handles.R);
guidata(hObject, handles);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.R = imnoise(handles.I,'gaussian',1,5);
axes(handles.axes2);
imshow(handles.R);
guidata(hObject, handles);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.N = imnoise(handles.I,'gaussian',1,5);
handles.O = imnoise(handles.N,'poisson');
handles.P = imnoise(handles.O,'salt & pepper',0.065);
handles.R = imnoise(handles.P,'speckle',0.130);
axes(handles.axes2);
imshow(handles.R);
guidata(hObject, handles);


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.MI=rgb2gray(handles.R);
mask1=1/9*[1 1 1,1 1 1,1 1 1];
handles.NI=uint8(conv2(double(handles.MI),mask1));
axes(handles.axes4);
imshow(handles.NI);
guidata(hObject, handles);


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.RGB2 = imresize(handles.R, [492 612]);
handles.A=handles.RGB2;% S&P Filtrelenmiş hali
for x=3:1:490
for y=3:1:610
for c=1:3
handles.a=[handles.A(x-1,y,c) handles.A(x-2,y,c)  handles.A(x+1,y,c) handles.A(x+2,y,c)  handles.A(x,y+1,c) handles.A(x,y+2,c)  handles.A(x,y-1,c) handles.A(x,y-2,c ) ];

handles.A(x,y,c)=median(handles.a);
end
end
end
axes(handles.axes4);
imshow(handles.A);
guidata(hObject, handles);
