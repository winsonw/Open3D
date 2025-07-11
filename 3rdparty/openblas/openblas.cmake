include(ExternalProject)

if(LINUX_AARCH64 OR APPLE_AARCH64)
    set(OPENBLAS_TARGET "ARMV8")
else()
    set(OPENBLAS_TARGET "NEHALEM")
endif()

ExternalProject_Add(
    ext_openblas
    PREFIX openblas
        URL https://github.com/OpenMathLib/OpenBLAS/releases/download/v0.3.29/OpenBLAS-0.3.29.tar.gz
        URL_HASH SHA256=38240eee1b29e2bde47ebb5d61160207dc68668a54cac62c076bb5032013b1eb
    DOWNLOAD_DIR "${OPEN3D_THIRD_PARTY_DOWNLOAD_DIR}/openblas"
    CMAKE_ARGS
        ${ExternalProject_CMAKE_ARGS}
        -DTARGET=${OPENBLAS_TARGET}
        -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>
    BUILD_BYPRODUCTS
        <INSTALL_DIR>/${Open3D_INSTALL_LIB_DIR}/${CMAKE_STATIC_LIBRARY_PREFIX}${lib_name}${lib_suffix}${CMAKE_STATIC_LIBRARY_SUFFIX}
)

ExternalProject_Get_Property(ext_openblas INSTALL_DIR)
set(OPENBLAS_INCLUDE_DIR ${INSTALL_DIR}/include/openblas/) # "/" is critical.
set(OPENBLAS_LIB_DIR ${INSTALL_DIR}/${Open3D_INSTALL_LIB_DIR})
set(OPENBLAS_LIBRARIES openblas)

message(STATUS "OPENBLAS_INCLUDE_DIR: ${OPENBLAS_INCLUDE_DIR}")
message(STATUS "OPENBLAS_LIB_DIR ${OPENBLAS_LIB_DIR}")
message(STATUS "OPENBLAS_LIBRARIES: ${OPENBLAS_LIBRARIES}")
