Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FB43B38AE
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 09:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788167509; cv=none; b=r+yNemDgkjqUuTCW5cahha7Nel2O3ZIviAGR12l5pkGOzu/6TIO10fTEIMWxErMPDU8jkhCxdamVRiwEzbYB4k93vjXVT7ar6FWvBFbfaFiYdyA0i142DjKBBFgNsxLMrhJEykH/yN5NXsUaOsMAttAePIhA9D4cqQoF3CyP9Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788167509; c=relaxed/simple;
	bh=o+jYyzlg8w6Vj1pZlgtY5tR/vJJUA5BKv5OoEtt35DY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IPq3tFRlt/IIRUg9z2GlFUdllK272qfpa/EmsUZkFh1X2A6kDA/uWxaasRGcFpfJk41bXmyklsa5scbW8wTGr41+fXUafqEefygajxzJ+GUb8gA3BMHCaTKQ5lw3IKtHsI58zWhu9gqEnSU2Y+/685uwxvGHvjjl8wLpVZpsAzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gY1NWNzq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EDsvsoIm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gY1NWNzq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EDsvsoIm"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xaSk3427321
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 09:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pTFxysWPYnAyH9B0lSkLtR
	KDIKix6AuMwIdf5deV7ZI=; b=gY1NWNzqL+GeA0qKbfIUvyzIRyY0fN/8rmuZrU
	5R3JL/ViNtMLTw/xNx1beOO6cE6IZqY6Kq2cHxhmwNSuAegWkaFvqO5aPKp0eDRl
	trAss62XMZUu4u5P+T3YZlXdINFH8l0+dw1eGu2rCQMwIzLByy8U6lMdt1304F/7
	yiJdZ3djja+4u1HGgoYXhIV59CVAJAjaRVI9C3v9xW03dTlben/ASXcb+CtUfcOL
	CoVm0nm+HSsYg+2kZI0pQLmo9QdBWf/MBs/LlHgRA80S0zDscbCQFJfkencw5sCt
	WFYKVlQ3ETfAKH+/HQYcYuVZqROIBpuX/GYumpmA8pnfDAtw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd4pm8ku9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 09:11:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93922c75037so199187485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 02:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788167506; x=1788772306; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pTFxysWPYnAyH9B0lSkLtRKDIKix6AuMwIdf5deV7ZI=;
        b=EDsvsoImf4zXthwhbsd7Hl1I+oN4J5XzupvslnoEE4X3Bkux8goH1kDF95UlZSm9co
         D/urhY8fWj7XthFeg9JagO0NdrDPY8Mm/dyGPU5Z75DsX0G1F5s3zI2CdgSmg4bQhDdP
         Q3DisL/taGbVzRC/xP2HwdGAc5QTsWJtF/fttd4ZPipgXUbgWf3BbOxaECNlsWTMaCwE
         HtqYysc9Cg3n0whw7ySIS3VdTTZvUjFKM6jfY/eejS11IUFDU15LAKtgPmMpD7CzF35k
         PIXWhiPCSRTisVrZWNlzq03gc/L5JlHGt+RfppxGwgOnuZULwbPG+1Jsp1kqmmobjBh2
         lG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788167506; x=1788772306;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pTFxysWPYnAyH9B0lSkLtRKDIKix6AuMwIdf5deV7ZI=;
        b=MufCMBRRjiEKOXWMXBYOG7azxYuc2GYgULDMmR5/7Gmhgdf6Xn9Q2XTcsMmb3ZchZa
         Zdz+DQe1qQQnAKa/PQ1prVIix/pHm0511HH+1OIiBqa0+4gIuQVIAr2Q+2exnIopLgp+
         diBy9Eq+CwYuGkgF8h9hcxdffcRs8HHVfgMF4BNEu76qjoC55r49V0aXSFFAGoVzEXTz
         wa9CZ4pywv+8lN18ypsY4EFFYlG+vHrPJExPplLiCHYiKYvJrzl063MsLyYTDRaKlzqw
         QCKEJbpTcs5fXojK6XzZ2HW2SY80SMrGguUKR46QKHZGMOxrSTp4voEHrdr9IXjwhlJv
         BoiA==
X-Forwarded-Encrypted: i=1; AHgh+RoDSKoJjtPE0rAllCuPTAM9OCL85354LICFbojUPA70Tgur4fwnxM3fuLv0kWNBi/0Wt7hcAziZ0nYu5h+H@vger.kernel.org
X-Gm-Message-State: AFuF++lMulf/BumLB6nNFcVmEU3T6C5HYMI7Sw5Y9vpvFR30gBquerPu
	HIAF3ht3YyDtsvaJehSFCQzLA4/dcl1UYV0+N5uXXXxFTCvhScQcWRz7ACMwnfZusOT8eDRSdG0
	URFr3VOtqjlJqzTjfrHYldZtXApkZEdzAPz6HO+B6mgyCvESGLveZWRtgqL/6xLrAPNE9
X-Gm-Gg: AR+sD13B85ZDG6lg9syqFVqod/QrTXGWoZzuEYfPPBSZ1Fj8lT+YqYiccHYMNwPTI+q
	EGGA4o6HauvpZBfs4bxY7cPkmDqDpB21Ct2gyMGp18RGU1T1TQS3a40hjf9F43TIBfZPvgRr9B/
	SXX/rfDdgfKdRpdcACkmp74QilMnCXGR465P01FCONJiRWhSFMpcyiOVqL7e+jY+HmcNp/v8KxN
	SwvKC6vYbApBPRw2b2b+2mR/kE/CafRogvYxsACH6m8muvwT0H2UdfRIvkc9BurzBEcym2g5hLG
	juEw3ePhGJXZrnmNZQUpq+Dk00XhG+6WPSVMt+ZD+ht7IP+WJmM25QeLXhskRKjezv2iACxMZxP
	S96Bgbw==
X-Received: by 2002:a05:620a:8298:b0:92e:fd2c:6a26 with SMTP id af79cd13be357-939138ae185mr1964027685a.24.1788167505652;
        Mon, 31 Aug 2026 02:11:45 -0700 (PDT)
X-Received: by 2002:a05:620a:8298:b0:92e:fd2c:6a26 with SMTP id af79cd13be357-939138ae185mr1964022385a.24.1788167504967;
        Mon, 31 Aug 2026 02:11:44 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48436646548sm10430394f8f.37.2026.08.31.02.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:11:44 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 12:11:36 +0300
Subject: [PATCH] arm64: dts: qcom: glymur-crd: Mark the EC reset gpio as
 reserved
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-dts-qcom-glymur-crd-reserve-ec-reset-gpio-v1-1-4a9da88755d4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEdFlWoC/yWNQQ6CMBAAv0L27CYUSVG/YjzIdq1rhMK2EAnh7
 1a8zVxmVoiswhEuxQrKs0QJfRZzKICe994zissOVVnZ8nQ06FLEkUKH/r10kyKpQ+VcmRmZdkz
 oBwlYt2eybGzTEEHuDcoP+eyv6+3vcWpfTOk3gG37AoRxTWWNAAAA
X-Change-ID: 20260831-dts-qcom-glymur-crd-reserve-ec-reset-gpio-4b9c6e1677cc
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1145;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=o+jYyzlg8w6Vj1pZlgtY5tR/vJJUA5BKv5OoEtt35DY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqlUVOxiTFmMIjzCLgCb6bDprOrtqWD0Za2bFXb
 95l5lFu1BCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapVFTgAKCRAbX0TJAJUV
 VpAHD/4jvqsNB2Ow9c5ppviefuwFIE5I75hMFPh4fMDeVR/u7I18zphh/5vj2GMiRNYneQX4wSd
 xsdKQo+VZtPI04bu0zaxqLT42Kq7Pt83dwZNGJKsoR4FMsFboaGh1CSYWBr3/3YkUysj6g1hC87
 smmVcBryx1CkGWKSpS5Xgydfj1I2ZmGFsg+RePdU12rKAW2WKMy6okzYLnchy6908/RLmDja8Rb
 wdSNTixhQIhaecCSzGGnI9lINYQ+vN0+3qUxSy1qVYaz6GYS0MUwEdh7G5iQiOA3dzZT23Oqna8
 R+8Fl7XmJKTuzQJZ2NoDJME1tutilXEEjMp4EFNp6Bd7AGljxez9XpXjfPZWwMvVVosmZGRrB68
 36VqKWNaqqRbZn0syjOTMxyivb8vIvRWnzxFR55hI/HMdB9e9J8EUDpnZWvTPd/yb4GESXxIhXE
 sohyiyYWCFY1BKJJzKLOe2SMhaqT6yq9aiYyYOG8slh1M22IcX6+eQsPZaM9TMo8uaalLtnYugM
 U2aDr5WJFnHueO9KtRg6kqMx3kJCRvewRx5zIz9ZVb/92Slx6rUK8jvzGKVCzwGBlTQPqMDiQQY
 l2cc/dHp27C9l+JKbn5/Q/qiQCd/mwS9hc2jf0K4Acm37w18O/sydGvgs25zpKj9SyN11LmX9aP
 aA33ZUwl6FwuSvA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: p0EazOKxdFYMGAF_H86Znyvg4vozgrBj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3OCBTYWx0ZWRfX0Cfhml85WoOQ
 IgXH1ktS3TurHXOWbJeEmxQG4OWYUbHtSFeFJh2rzIzTm6/3jhd2Nk3ou0uX/ooNIQkvcV3uQ6F
 e18EfpLtokJvlS5BdZBVP5JXCbIZzkdjIijwYTh1O88N0yATnvS0awGcCi+VXNQPN2ggxHWLZGs
 uAa7niBNtUyhtn6M9FduLmb88x3d7cqy005KvMPHwhzUuWcUvjYJ4ZqOSyPHwDO9uLxU7KXOtJl
 J6hf5/q6S86lAvfhLQr7Qy4HKaGZxt0UioXQ/g3EWdIDUr4Tu8v7d4rZUfD4uZlv0DfTvbETzbB
 RBkbNsGeJPVsbkAZJUK8DBjmnc34jB3ZUCb53Yyl3NPAaqG9LaG+lZJRbe5tZPoD24iAJ5xzYWA
 ZF3sEo6yucpJIut0kKDC3XP2H9qFOxnI4jqJpSC7NdMY7KamKkl2L6KOGySS5YziWD3zjJEGyfG
 FMIYS/NRZgqfS8BehIg==
X-Proofpoint-GUID: p0EazOKxdFYMGAF_H86Znyvg4vozgrBj
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3OCBTYWx0ZWRfX8BB80vzEFN6R
 n3t2weEPH3Z1mswv6AQmKRjPNDq0MwmtFytxXoKh6k2nlcl7M97BNWdRJaVUl8nR+m3vFnESiJ2
 +I66PPQ4z1YQulUP0A01/7H+quvEWwI=
X-Authority-Analysis: v=2.4 cv=GbQnWwXL c=1 sm=1 tr=0 ts=6a954552 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=NjM4XxsBxMxLkyKWBQUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310078

GPIO 65 from TLMM is used by the Embedded Controller as its reset line.
Reserve it to prevent Linux from requesting or reconfiguring it.

Fixes: 9314c6ecace1 ("arm64: dts: qcom: glymur: Enable Glymur CRD board support")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index e27c697e3170..4df3ccfee106 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -963,7 +963,8 @@ &remoteproc_soccp {
 &tlmm {
 	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
 			       <10 2>, /* OOB UART */
-			       <44 4>; /* Security SPI (TPM) */
+			       <44 4>, /* Security SPI (TPM) */
+			       <65 1>; /* EC reset */
 
 	edp_bl_en: edp-bl-en-state {
 		pins = "gpio18";

---
base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326
change-id: 20260831-dts-qcom-glymur-crd-reserve-ec-reset-gpio-4b9c6e1677cc

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

