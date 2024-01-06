# SWE-lib
SWE-lib project is a free to use library for the X-Plane® flight simulator. It is a collaborative effort by members of swedish flightsim community, providing a good range of high quality scenery components for authors to use in their scenery packages.

# How to contribute
Prior to contributing, make sure that every x-plane file typ (imigary excluded) you wish to upload has the following pasted at the bottom of the file:
> Created by *INSERTENAME*
>
> ChangeLog:
>
> *INSERTDATE* - Initial version
### Follow these steps after completing above
1. Clone the repo
2. Add new objects / update objects into the file structure. 
3. (optional) If you wish also include the build files for the library items inside folder **SWE-lib\WorkFiles**
4. Delete old Library.txt file
5. Rebuild the Library.txt file by running the buildXplaneLibrary.ps1 script in powershell shell. You may need to set execution policy to bypass. 

> N1 - Never, ever delete a file or you will brake any dependencies made by others towards those said objects.

> N2 - Once you upload **your** files, they fall under the property of the project. The rights cannot be revoked as that would brake dependencies. This is of course not applicable to uploaded items that may have been stolen.

> N3 - The library has a Two-Level hiarachy structure. Only add a new folder if it is neccessery. 

# License
SWE-lib is licensed under [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc/4.0/?ref=chooser-v1)
In summery, this means:
### You are free to:
> Share — copy and redistribute the material in any medium or format

> Adapt — remix, transform, and build upon the material

The licensor cannot revoke these freedoms as long as you follow the license terms.
### Under the following terms:
> Attribution - You must give appropriate credit , provide a link to the license, and indicate if changes were made . You may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use.

> NonCommercial - You may not use the material for commercial purposes.

> No additional restrictions - You may not apply legal terms or technological measures that legally restrict others from doing anything the license permits.

# Bugs, questions and issues
Use the issue section of the repository to file any outstanding questions or issues.
