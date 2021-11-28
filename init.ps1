
function Init-PythonEnvironment {
    python -m venv .venv
}

function Activate-PythonEnvironment {
    $path = Get-ChildItem -Path ./ -Include activate -File -Recurse
    $dirPath = $path.Directory.FullName
    cd $dirPath
    .\activate
}

function Download-PipModules {
    pip install seaborn sklearn scipy matplotlib numpy pandas
    pip install pomegranate pgmpy pyvis kmodes gmr hyperopt imageio deap
}


$Folder = './.venv'

if (Test-Path -Path $Folder) {
    "Virtual Python envirenment already exist"
} else {

    "Creating virtual Python envirenment..."
    Init-PythonEnvironment
    "Virtual Python envirenment created."

    "Activating Python Environment..."
    Activate-PythonEnvironment
    "Python Environment Activated"

    "Installing modules..."
    Download-PipModules
    "Modules have been installed"
}

"The end of the task"