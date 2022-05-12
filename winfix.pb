ProcedureDLL.l AttachProcess(hInstance.l)
	Global ddraw.l = 0
EndProcedure


ProcedureDLL.l DetachProcess(hInstance.l)
EndProcedure


ProcedureDLL.l CompatData(type.l, val.l)
	Protected proc.l
	
	If ddraw=0
		ddraw = LoadLibrary_("ddraw.dll")
	EndIf
	If ddraw<>0
		proc = GetProcAddress_ (ddraw, "SetAppCompatData")
		If proc<>0
			CallFunctionFast(proc, type, val)
			ProcedureReturn 1
		EndIf
	EndIf
	ProcedureReturn 0
EndProcedure
