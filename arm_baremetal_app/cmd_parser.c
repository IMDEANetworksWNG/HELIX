#include "cmd_parser.h"
#include "tools.h"
#include "gpio_driver.h"

convData_t cmdArrgs[MAX_CMD_VALS]; /* array of argument of typedef  convData_t */
convData_t data_cmdArrgs[MAX_CMD_VALS]; /* array of argument of typedef  convData_t */


extern int setNCOfreq(convData_t* cmdArrgs);
extern int setNyquistZone(convData_t* cmdArrgs);
extern int setQMCsettings(convData_t* cmdArrgs);
int writeReg(convData_t* cmdArrgs);
int readReg(convData_t* cmdArrgs);
extern int setFreezeCal(convData_t* cmdArrgs);
extern int triggerTX(convData_t* cmdArrgs);
extern int triggerRX(convData_t* cmdArrgs);
extern int loadSSB(convData_t* cmdArrgs);
extern int changeTXsplit(convData_t* cmdArrgs);
extern int changeRXsplit(convData_t* cmdArrgs);
extern int enableRX(convData_t* cmdArrgs);
extern void configUDPServer(convData_t* cmdArrgs);
void initPlatform();

CMDSTRUCT cmdtab[] = {
	{"initPlatform","","",*initPlatform},
	{"setNCOfreq","<Type> <PDth>", "uuudi", *setNCOfreq},
	{"setNyquistZone","<Type> <PDth> <Type> <PDth>", "uuuu", *setNyquistZone},
	{"setQMCsettings","<Type> <PDth> <Type> <PDth> <PDth>", "uuuud", *setQMCsettings},
	{"writeReg","<address> <value>", "li", *writeReg},
	{"readReg","<address>", "l", *readReg},
	{"setFreezeCal","<Type>", "i", *setFreezeCal},
	{"triggerTX","<Type>", "u", *triggerTX},
	{"triggerRX","<Type>", "uuuuu", *triggerRX},
	{"loadSSB","<Type>", "u", *loadSSB},
	{"changeTXsplit","<Type>", "u", *changeTXsplit},
	{"changeRXsplit","<Type>", "u", *changeRXsplit},
	{"enableRX","<Type>", "u", *enableRX},
	{"configUDPServer","<Type>", "uu", *configUDPServer}


};


/****Register Functions****/

void initPlatform(){
	char fw_version [4]="1.0";

	set_gpio(LBM_START_PIN +GPIO_BANK_OFFSET,0);
	set_gpio(HARD_RESET_TX_GPIO_PIN+GPIO_BANK_OFFSET,1);
	set_gpio(HARD_RESET_RX_GPIO_PIN+GPIO_BANK_OFFSET,1);
	usleep(10);
	set_gpio(HARD_RESET_TX_GPIO_PIN+GPIO_BANK_OFFSET,0);
	set_gpio(HARD_RESET_RX_GPIO_PIN+GPIO_BANK_OFFSET,0);

	sendUDPcmd(*(u32*)fw_version);
}


int writeReg(convData_t* cmdArrgs){
	u64 address=cmdArrgs[0].l;
	int32_t value=cmdArrgs[1].i;

	printf("Address:%x Value:%u\n",address,value);
	Xil_Out32(address, (u32)value);

	return SUCCESS;
}

int readReg(convData_t* cmdArrgs){
	u64 address=cmdArrgs[0].l;
	u32 value=Xil_In32(address);
	printf("Address:%x Value:%u\n",address,value);
	sendUDPcmd(value);
	return SUCCESS;
}
/************************** Function Definitions *****************************/


/*
*  Parse command arguments and detect if the number of argument is as as
* expected by the received command
*/
int cmdParseArg(char *strPtr, int cmdIdx) {

	char argType[MAX_CMD_VALS]; /* local copy of cmdtab[cmdIdx].argType */
	char token[] = " ,\t\n\r";  /* token used by strtok to split string */
	strcpy(argType, cmdtab[cmdIdx].argType); /* local copy size is ensured to
	match within the parent function
	cmdParse */

	/* Remove command name from strPtr and preserve arguments and \r\n or \n */
	strPtr = strtok(strPtr, token);
	strPtr = strtok(NULL, "");

	//printf("Arguments: %s Length: %d\n", strPtr,strlen(strPtr));

	/* Parse the arguments based on the expected data type from this functions
	* 'type_string' */
	for (int idx = 0; idx < strlen(argType); idx++) {
		/* Next characters following the last argument is expected to be \r\n or \n
		*/
		if (strPtr == NULL || ((*strPtr == '\r') || (*strPtr == '\n'))) {
			/* 0 indicates invalid number of arguments to the parent function */
			return 0;
			} else {
			if (argType[idx] == 'i')
				cmdArrgs[idx].i = strtol(strPtr, &strPtr, 0);
			if (argType[idx] == 'u')
				cmdArrgs[idx].u = strtoul(strPtr, &strPtr, 0);
			if (argType[idx] == 'd')
				cmdArrgs[idx].d = strtod(strPtr, &strPtr);
			if (argType[idx] == 'l')
				cmdArrgs[idx].l = strtoull(strPtr, &strPtr, 0);
			if (argType[idx] == 'b')  {
				strPtr = strtok(strPtr, token);
				strcpy(cmdArrgs[idx].b, strPtr);
				strPtr = strtok(NULL, "");
			}
		}
	}
		return 1;
}


int cmdParse(char *strPtr) {
	char token[] = " ,\t\n\r"; /* character used to split the string into substrings */
	char *cmdPtr;   /* Pointer to the command */
	int cmdIdx;     /* index of the received command in the array cmdtab */
	int foundCmd;   /* Set if a defined command is found */
	char strLocal[BUF_MAX_LEN]; /* local copy of input string */
	int validNumArg; /* set to 1 if the the number of arguents received match the
	expected number of argument for current command */
	void (*func)();  /* pointer to the  function to execute */
	int status = 0;

	validNumArg = 0; /* initialize valid number of argument to zero */
	cmdIdx = 0;      /* initialize command index to 0 */
	foundCmd = 0;    /* initialize command index to 0 */

	/* make local copy of strPtr */
	strcpy(strLocal, strPtr);

	/* command extracted from the input string (local copy of the string is used
	* to preserve the input string strPtr) */
	cmdPtr = strtok(strLocal, " ");

	/* check if the received command is valid and the number of arguments received
	* is as expected by the command */
	if (cmdPtr != NULL) {
		/* update txstrPtr with the received command name */
		//strcat(txstrPtr, cmdPtr);

		for (int i = 0; *cmdtab[i].cmdString; i++) {
			/* check for valid command name */
			if (!strcasecmp(cmdPtr, cmdtab[i].cmdString)) {
				func = cmdtab[i].cmdFunc;
				foundCmd = 1; /* found a defined command */
				cmdIdx =
				i; /* record command id, index location of the received command in
				cmdtab */
			}
		}
		/* check if a command is found */
		if (foundCmd) {
			/* parse arguments and check for valid number of arguments */
			validNumArg = cmdParseArg(strPtr, cmdIdx);

			/* check is a valid number of arguments is received */
			if (validNumArg) {
				/* execute command */
				(*func)(cmdArrgs);
				/* return status of command execution */
				if (status != SUCCESS) {
					return ERROR_EXECUTE;
				} else {
				return SUCCESS;
				}
			} else {
			/* return invalid number of arguments as a status */
			return ERROR_NUM_ARGS;
			}
		} else {
		/* command not found */
		return ERROR_CMD_UNDEF;
		}
	} else {
	return SUCCESS;
	}
}



