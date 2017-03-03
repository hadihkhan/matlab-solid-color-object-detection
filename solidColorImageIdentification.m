function varargout = solidColorImageIdentification(varargin)
% SOLIDCOLORIMAGEIDENTIFICATION MATLAB code for solidColorImageIdentification.fig
%      SOLIDCOLORIMAGEIDENTIFICATION, by itself, creates a new SOLIDCOLORIMAGEIDENTIFICATION or raises the existing
%      singleton*.
%
%      H = SOLIDCOLORIMAGEIDENTIFICATION returns the handle to a new SOLIDCOLORIMAGEIDENTIFICATION or the handle to
%      the existing singleton*.
%
%      SOLIDCOLORIMAGEIDENTIFICATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SOLIDCOLORIMAGEIDENTIFICATION.M with the given input arguments.
%
%      SOLIDCOLORIMAGEIDENTIFICATION('Property','Value',...) creates a new SOLIDCOLORIMAGEIDENTIFICATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before solidColorImageIdentification_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to solidColorImageIdentification_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help solidColorImageIdentification

% Last Modified by GUIDE v2.5 04-Mar-2017 00:37:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @solidColorImageIdentification_OpeningFcn, ...
                   'gui_OutputFcn',  @solidColorImageIdentification_OutputFcn, ...
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


% --- Executes just before solidColorImageIdentification is made visible.
function solidColorImageIdentification_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to solidColorImageIdentification (see VARARGIN)

% Choose default command line output for solidColorImageIdentification
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes solidColorImageIdentification wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = solidColorImageIdentification_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
   [filename pathname] = uigetfile({'*.jpg';'*.bmp'},'File Selector');
   image = strcat(pathname, filename);
   axes(handles.axes1);
   imshow(image)
   set(handles.edit1,'string',filename);
   set(handles.edit2,'string',pathname);
   
   %calculate the greyscale value for the image
    Im = imread(image);
    Gray = rgb2gray(Im);
    axes(handles.axes2)
    imshow(Gray);

    GIm=uint8(zeros(size(Im,1),size(Im,2)));
    binaryImage = zeros(size(Gray));
    for i=1:size(Gray,1)
          for j=1:size(Gray,2)
              pixel(i,j)=Gray(i,j);
              if pixel(i,j) == 255
                new_pixel(i,j) = 255;
              else
                new_pixel(i,j) = 0;
              end
              binaryImage(i,j) = new_pixel(i,j);
          end
    end
    
    axes(handles.axes3)
    imshow(binaryImage);



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
