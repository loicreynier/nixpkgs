{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  numpy,
  pythonOlder,
  scipy,
  uv-build,
}:

buildPythonPackage rec {
  pname = "dmsuite";
  version = "0.3.0-unstable-2025-07-11";
  pyproject = true;

  disabled = pythonOlder "3.9";

  src = fetchFromGitHub {
    owner = "labrosse";
    repo = pname;
    rev = "fb263d1902b0709fcf069fd2af0d4e5876f5e6ce";
    hash = "sha256-wMFSc6t9JHxopXhXwX7OYx+JUz8c2OZepaYnQYthi2s=";
  };

  nativeBuildInputs = [
    uv-build
  ];

  dependencies = [
    numpy
    scipy
  ];

  pythonImportsCheck = [ "dmsuite" ];

  meta = {
    description = "Scientific library providing a collection of spectral collocation differentiation matrices";
    homepage = "https://github.com/labrosse/dmsuite";
    changelog = "https://github.com/labrosse/dmsuite/releases/tag/v${version}";
    license = lib.licenses.gpl2;
    maintainers = with lib.maintainers; [ loicreynier ];
  };
}
