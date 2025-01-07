<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Maklumat Sekolah</title>
    <link rel="stylesheet" href="/TvpssApp/resources/css/superAdminDashboard.css">
</head>
<body>
    <div class="main-container">
        <aside class="sidebar">
            <nav>
                <ul>
                    <li><a href="/TvpssApp/adminstate/dashboard">Dashboard</a></li>
                    <li><a href="/TvpssApp/adminstate/schoolVersion/view" class="active">Informasi Sekolah</a></li>
                </ul>
            </nav>
        </aside>

        <main class="content">
            <header>
                <h1>${school.name} (${school.code})</h1>
            </header>

            <section>
                <h2>A. Info Sekolah</h2>
                <p><strong>Pengawai TVPSS:</strong> ${school.versionStatus}</p>
                <p><strong>Alamat 1:</strong> ${school.address1}</p>
                <p><strong>Alamat 2:</strong> ${school.address2}</p>
                <p><strong>Poskod:</strong> ${school.postcode}</p>
                <p><strong>Negeri:</strong> ${school.state}</p>
                <p><strong>Email:</strong> ${school.email}</p>
            </section>

            <section>
                <h2>B. Info TVPSS Sekolah</h2>
                <p><strong>Logo TVPSS:</strong> <c:choose>
                    <c:when test="${not empty school.logoFilename}">
                        <img src="/resources/static/uploads/school-logos/${school.logoFilename}" alt="Logo" />
                    </c:when>
                    <c:otherwise>
                        Tidak Ada
                    </c:otherwise>
                </c:choose></p>

                <p><strong>Corner/Mini/TV Studio:</strong> ${school.studio ? "ADA" : "TIDAK ADA"}</p>
                <p><strong>Upload di YouTube:</strong> ${school.youtubeUpload ? "ADA" : "TIDAK ADA"}</p>
                <p><strong>Rakaman Dalam Sekolah:</strong> ${school.recordingInSchool ? "ADA" : "TIDAK ADA"}</p>
                <p><strong>Rakaman Dalam dan Luar Sekolah:</strong> ${school.recordingInOutSchool ? "ADA" : "TIDAK ADA"}</p>
                <p><strong>Penggunaan Teknologi Green Screen:</strong> ${school.greenScreenTechnology ? "ADA" : "TIDAK ADA"}</p>
            </section>

            <footer>
                <a href="/TvpssApp/adminstate/schoolVersion/view" class="btn-back">Kembali</a>
            </footer>
        </main>
    </div>
</body>
</html>
