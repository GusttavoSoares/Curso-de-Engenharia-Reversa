#include <windows.h>

int main(void) {
    
    // Se estiver rodando fora do debugger, o c�digo vai acontecer, caso contr�rio, n�o vai. (� poss�vel reverter isso, deixando zero no debug)
    if (!IsDebuggerPresent()) { 
        MessageBox(NULL,
                "Malware rodando",
                "Info",
                MB_OK | MB_ICONINFORMATION );
        // O MB_OK e MB_ICONINFORMATION j� foi definido na biblioteca do windows, � o mesmo que digitar o valor
        }
        return 0;
}
