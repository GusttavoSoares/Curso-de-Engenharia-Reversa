#include <windows.h>

int main(void) {
    
    // Se estiver rodando fora do debugger, o código será executado; caso contrário, não será. (é possível reverter isso, deixando zero no debug)
    if (!IsDebuggerPresent()) { 
        MessageBox(NULL,
                "Malware rodando",
                "Info",
                MB_OK | MB_ICONINFORMATION );
        // O MB_OK e MB_ICONINFORMATION já foi definido na biblioteca do windows, é o mesmo que digitar o valor
        }
        return 0;
}
