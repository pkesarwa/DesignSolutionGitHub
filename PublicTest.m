classdef PublicTest < matlab.unittest.TestCase

    properties(Abstract,ClassSetupParameter)
         mFilePath
    end

    properties
        currFilePath
    end
 
    methods (TestClassSetup)
        function basicClassSetup(test,mFilePath)
            test.currFilePath = mFilePath.filePath;
        end
    end

     methods (Test)
         function VerifyNoProhibitedCommands(test)
             % Check for the presence of each prohibited command ["close all", "clear all", "bdclose all"]
            fileContent = fileread(test.currFilePath);
            prohibitedCommands = ["close all", "clear all", "bdclose all"];
           
            for command = prohibitedCommands
                test.verifyFalse(contains(fileContent, command), ...
                    sprintf('The file %s contains the prohibited command: %s', test.currFilePath, command));
            end
        end
     end 
end