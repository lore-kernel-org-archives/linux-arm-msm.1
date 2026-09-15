Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAAE4AD7E1
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 12:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473834; cv=none; b=mSrhTL1/pJFXrbyfnAasLZfuUbAEiTdAb+kzL87jFwezrXOJSrG+s6MtRpLaRRRxGLG4hbtoj7SPXflC2D3I99oFa4qoIFlHZHg1+k3wdiI2eSFen+8RAYJ9O2f+k+IEYZtgJVA/BfA6FXuqKn/xrVvmxWWWhDQ0YggDDGAJp14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473834; c=relaxed/simple;
	bh=Vu/qOKjDSCHMscpTGAgvAhSIJKvZ6VpKbHq8SJagBkI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BAR5KwpS3qh0jk9KaONASdpRASIcrcmS0pj6u1ZpUT3eidEWn5ZoGQulJCW6z/cvybr+5Iuj3ogURMT4H3jD1GFTQqmdW8S9R1TqhuyzzuRlqfI38zXomEsDJ383KPc+aLxQtGCA7K5fvzcnJJU0hElSPWxYgjdzl83NZFJLFmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZVRD+Y2b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JKuqjDVR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZVRD+Y2b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JKuqjDVR"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9h8v32086809
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 12:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vWuTRuraK8gbjCwKph/KhRyuid2F8Jq/XlcU3WwTW9g=; b=ZVRD+Y2bPjQVE5iJ
	H/XvtgJ9LxWybZBmkZ9p4c+7FMkVs/TqZdVvDiRAJpEqKJIdcfPePmkWOe8zdcgZ
	+NSYB2o7MnwKiB32DcKkgn2yeoK0WsLNNo1bS0gBmpna3VDOmzj3U2St9L3AZVjG
	iE8ec/yt/0tYurKip4NF2l8nxUIpnU9PLDWn0eCFA9/1/PJRev8fdqWoyGT3mYE2
	7cQrFUXfx9FvCJGKO6kTYZVNPjh3v+Vj7mOuK9A6pht4ta5wdfqN3rjxPv6mDJfm
	JIG0V+mydkol0abgVaJMl9G8rZIZ22qKl2aluR/AKo+G8iSh3atGgoU3rHD1102W
	rddahQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq1qp9ab0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 12:03:51 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c7d2076f8aso755692e0c.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 05:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789473831; x=1790078631; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vWuTRuraK8gbjCwKph/KhRyuid2F8Jq/XlcU3WwTW9g=;
        b=JKuqjDVRbdEJHPTkohI8ly2u/FGkEL2VtQuPlZLTFnL95FRuOINixwTT5bvA+8s3c0
         gJydWhm0BvTxAKLQ7TlYcPpDKofBY3gHaht3Cz6bZZsqRvUc5iRtawYmuUJB7DvRXbG5
         KiCq450+C6Yi3oZW4WJSdjcOTk5QmEmJoe36kk5rSUEYmmo+a3OFEioBLKDta9E/0KjC
         KnP032ymXoTKGnVu7X6xD+GUUz1IyMm2hOsKxyyMsblx8+kslOk9ZHR6iDaaWN8MLGI4
         wJNlXQA8LD3xCO1e104Ih9fYpcrQ5zkLjScz7+YK29Af63rBN/gQHp4lrLMaIvbZxnhe
         kOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789473831; x=1790078631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vWuTRuraK8gbjCwKph/KhRyuid2F8Jq/XlcU3WwTW9g=;
        b=MmUywpI9c0iSkQ5q/YK8aFdnH0HOixa7+KjmjEnXx2FHw6eStRa3bOK4wXOe1jaVcS
         bD1/iPLnlf7jM4dpw3usiV+R8LPxcIi4grf3Amy7QG0s99Y9krRPp+dFo4f36ZDXERH1
         1Hhs0xLsfSqgL0Yg+sJrVUerk2OyV0/ZvZu7KJwoYGeYCPjWx8GoflinZeV4HoxDfCgw
         94lawqlvCvMcuQKvt1LWaxYDW90MTlj1ja6F+zGXhjiBV8pF6/2Tr91WYBDbKt+SF1Pn
         8ukOeKBuLMD4cWfGZAM9flytt4LS5AeAHZu9n1GlKUaxBjZasqJbeQwb1+5SfOOTlMR9
         2jyg==
X-Gm-Message-State: AFuF++lqn1HNmpA8Z9a271RTIqKzni10HuxMJjn8zi1VJzNL2Ug93e8c
	ae2rjWWrca44DgWeRdhakdSLIg1nFYWYTsRsutrinkc+FIKYydOOwoxdVap2j1DC/BrF+qjzKNF
	qoCNpeMEkoDn2eOMSF/sDQk5+EYyBFDLyy25U2aN+IhiQDdtpjy9ANvp/+zPVGbZ7ES2H
X-Gm-Gg: AYBFou2AuMp1fn+3lYOePt4yDo1jzRKc3PD191GEWM1y6WzZMQn2LeiF8eXzCxormGN
	oioMN3d3cMNGojZKVlTjBiq09jdBP+TwSgeOg4KmJXbfuLiZphVVFk4vIdFfQ/W6HM3yiX+MpOT
	8shAhR+ivVgOBdlzmz1DUtRNZULzCXE3w5oP7XarCChu4RUEvMzufKIOgVvj8Ewt7Yo87lhSkcY
	w7EbogyEVg/b1q/+8wlD9CBiYA2ACKx+jJ2bnEA8os3RAmsxh4hUDcvID4GwIkNpAwoS5nYx2mb
	OSB2XFs14S31Po0YCWncPY0n15o9Tu7bhIt4j7iBfsKh9j9DqLF/O44gLeTq7OSgFXAzZBF/Avw
	GnZbbEEI=
X-Received: by 2002:a05:6122:a019:b0:5c5:924a:4616 with SMTP id 71dfb90a1353d-5c98a192f99mr1610297e0c.0.1789473830372;
        Tue, 15 Sep 2026 05:03:50 -0700 (PDT)
X-Received: by 2002:a05:6122:a019:b0:5c5:924a:4616 with SMTP id 71dfb90a1353d-5c98a192f99mr1610229e0c.0.1789473829888;
        Tue, 15 Sep 2026 05:03:49 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee5csm34247401f8f.20.2026.09.15.05.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:03:48 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 15:03:29 +0300
Subject: [PATCH v2 3/5] arm64: dts: qcom: eliza: Rename existing EVK to
 suggest eMMC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-dts-qcom-eliza-add-ufs-variant-v2-3-86d72a2a8f47@oss.qualcomm.com>
References: <20260915-dts-qcom-eliza-add-ufs-variant-v2-0-86d72a2a8f47@oss.qualcomm.com>
In-Reply-To: <20260915-dts-qcom-eliza-add-ufs-variant-v2-0-86d72a2a8f47@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3153;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Vu/qOKjDSCHMscpTGAgvAhSIJKvZ6VpKbHq8SJagBkI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqTQY7MTaJ1H5EuOPLyj/3LL7yxpZmITDsf9zs
 VLHO6cBf3eJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqk0GAAKCRAbX0TJAJUV
 VuNeEACcy1h9Q4a6CNIPLiRd+nRtKdr8MgGISp9qcoEvyp81UCNnMBVy9F16GVckWQSUlC+IBrl
 D2dPu/OfFyTvqfcZCxcB31H7AtWoknOGN6clWX4t75mo3IjW9TFSkyky/ZNbSwwJwKKKqsMSEFv
 yx3ikZg0Zp3luBPMHS2xmSKqJFnjnM2eiCHzgEpECggFtn0N2rJRIxXhl6449IXjpda/WOAFBbc
 Nst0qhwqJ//CYfUeKnNJ/u/urfFmYozzKbkbfPsnsvGp8syqqVyFCwusGomB/DVFebNjExaLP0t
 UJRDLSjzVckKJvQ+psFpKWPzHxaWwBxJ4zhvWVfu/2RaYiTQFrpDZ6MMgGoH4G4faxyPlQ0NI94
 yhFxaaBiiYBHpD1Jrl44JJNlL4aELPlPozKvTFB4i9G9ktcEX9eemwFDfcG8bjhf0PX1P8HaICt
 eXwxda+yQDOhlFwBqfJ9l19ygRh4YjX+C6NSp2i1BoDqfjyo2fzLNL0PKCFFnP6+saq0F9WYvZD
 +CxrKMPfvZx6dsLnZXQmh65h1AVoW2aEJiwm4FmN7rfCGOr8Hls1pCSAI3SMlo+fvUVuY+D1fsz
 5I7Vdtp+P4BdAU8Er9uuPEJbsqAkPjZEVHDxCvcLo12SRclBgdz1XbkkxXayrvtjxFFMqC05C4l
 mPV6zpizly8a4Rw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE3NCBTYWx0ZWRfX2q+4qfooSIWy
 F0igzr/EnlekNRRrs+2XT8QfrQ4BAjvhWFF4gwEBMIjSwMXgqq7M61s2pjxfqEQ5EPAw9ALoSUR
 G/gHBYJbvW2ubOLfzZi9kW3m2e52S9E=
X-Authority-Analysis: v=2.4 cv=I4Xw19gg c=1 sm=1 tr=0 ts=6aa93427 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=uCsTHrIaqIeOh9K-tCUA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: UVJJOHPHtN4_Rl05p_gniR5Sww7AQdQW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE3NCBTYWx0ZWRfXzair+egNaPxW
 8xj4iMUWVKUmSSifnxolz2BD5lRggCoTwLcptN/F8zRUO3xqgREgm3LarQ0n3Ej9nY0a/zwNx7j
 VCc0phzhZ1qKRveayCKT+We7zyUmrxJ3rW011BZpWvomhreHnKKljS6Uo9Uilupzc9vKHdN00Tm
 ojLzXnJKRmzJgizGbjrp5FBWnOBetsAPk1T9/5y1lEOeM/CBC+cvzkRHLKkHdRSWdmT8bsdHpcL
 Zszk7GwFSYKaKyOpYtZ07Gyu4h9ivu4pOOo0t0VDNvURXzNI3opwl94UssVQjkM3eus69zCpyI0
 uXSm77VkJMHwNB2AXkqe7fndwc83VE+T8HghXtJ+V2go3VOV9oW/NlEp22s7WbRv78cMVCF0VQl
 CPlW7mJf073LoOi2h0OYXrKWsGzRr0mS57klfhtdgCbSxAdYqFRrc8fTMjh3ErOfjr+YVclgk3O
 khkP173luSzaFwVSWfg==
X-Proofpoint-GUID: UVJJOHPHtN4_Rl05p_gniR5Sww7AQdQW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150174

It turns out that there is a variant of the Eliza SoM EVK that comes
with UFS instead of eMMC.

So let's rename the current Eliza SoM EVK to suggest that it supports eMMC,
and then rename the Eliza CQS EVK to suggest it is also eMMC based.

Also update the compatible for the Eliza CQS EVK to include the eMMC
string, in order to differentiate from UFS variant.

Neither the CQS SoM nor the CQS EVK has been made publicly available, so
renaming the DTB will not affect any users.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                      |  2 +-
 arch/arm64/boot/dts/qcom/eliza-cqs-evk-emmc.dts        | 18 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts             | 14 --------------
 .../{eliza-cqs-som.dtsi => eliza-cqs-som-emmc.dtsi}    |  0
 4 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index d6547fb18edf..ccaca98ad4c8 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -14,7 +14,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a16-ux3607oa.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk-emmc.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk-emmc.dts
new file mode 100644
index 000000000000..36f63dd1637f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-evk-emmc.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "eliza-cqs-som-emmc.dtsi"
+#include "eliza-evk.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Eliza CQS EVK (eMMC)";
+	compatible = "qcom,eliza-cqs-evk-emmc",
+		     "qcom,eliza-cqs-evk",
+		     "qcom,eliza-cqs-som-emmc",
+		     "qcom,eliza-cqs-som",
+		     "qcom,eliza";
+};
diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
deleted file mode 100644
index 43d428a4ed2d..000000000000
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
+++ /dev/null
@@ -1,14 +0,0 @@
-// SPDX-License-Identifier: BSD-3-Clause
-/*
- * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
- */
-
-/dts-v1/;
-
-#include "eliza-cqs-som.dtsi"
-#include "eliza-evk.dtsi"
-
-/ {
-	model = "Qualcomm Technologies, Inc. Eliza CQS EVK";
-	compatible = "qcom,eliza-cqs-evk", "qcom,eliza-cqs-som", "qcom,eliza";
-};
diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som-emmc.dtsi
similarity index 100%
rename from arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
rename to arch/arm64/boot/dts/qcom/eliza-cqs-som-emmc.dtsi

-- 
2.54.0

