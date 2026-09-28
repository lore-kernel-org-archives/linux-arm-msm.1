Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2A04EFFBF
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 16:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790613447; cv=none; b=g6KQY3zAEFNfSYtw7BlZq+WI7o7PWrHPTosrlNHVuSiQH3vMY1tAe3Tl2uor2HPGKtIDnmlKqI21RaMf8baEjEczjSp4O9enoidib2uyub/47/WfsZTK8jPfi6JosVZVL2SomLBwtQuOqFA+x0a3tds/yzcX9cybbXlCtQFiffI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790613447; c=relaxed/simple;
	bh=8mPzzD2hnNyHm5q/BijcmSzzMQ1oNaUHkqeiDyYLXik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d5Eyrrc/Tq6RZtdWN8/oaRVYSf54nW83aNhgCLhsvzr2pomH9AYHY7+yA+i85PD/Blw4WHAAa8Tc5hY6WPXx0b3wH4cbo12SRIJ+b+w7mDWiDRJL/UbuKq5JYlwaPJmaIlpjCeKnGdP4xUtSSgceqZ7dq/Scne5d2iFJuaBuZ3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m4ilIpUk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JjzIhrwR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m4ilIpUk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JjzIhrwR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEe6FK1647285
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 16:37:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OOyxc28yCeoKN8IIez4bm43LAy5QpdgvjEs3QWsuxMc=; b=m4ilIpUkUAr/fTU5
	ItdFkAy7RYJHX8AGBRJcQVxieTosoLN2pXn7qz8kmwZQlQ0oAhzFNreK/wsKTf9V
	v5zMi6tEaIHbHqxMFrLtbL9c3Qvz6CC9iQr+tm3XGvfKc/W2IihwbjqN+/+2zOXl
	5ckpnoqXX9cddlU1/ZJ/57FkGdK4g0JBjVorAVvOAEcwizlBTja6KSpgYjHrXLc/
	h3x0w7WbjhlU+hvmF+INQnpzmzniZODSNH78zIQlPRCxbqUXz1c59hpx4n2Ot3xm
	smL/LJuUNpScevcwbWCffI8/ywWZ+YSptmtk0Cx7KIgI02bUxch2gDn/5PbVVvNi
	offHjQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynbc1rnh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 16:37:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-530f5e827c6so76268471cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 09:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790613444; x=1791218244; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OOyxc28yCeoKN8IIez4bm43LAy5QpdgvjEs3QWsuxMc=;
        b=JjzIhrwRLJPK54yZubau6SgTxUXoIJ6Tc21vSpRA5l7SNiPv90Qc4nvQSKeYwTd2fY
         bbUJ10TqEGZZUesxjpGCJiM8nKhIPH6BPSuA+/dndGHy0Ap806wvNV6IruH45//0q3MC
         zHm0MkpfBC9LBL3VXF8CYHe3gRvCNt3glAZAIRo0eFRXS+Pxew4XSQ24P1WDontlgOzn
         p5SJLtg8sFuQZjHbF69exsZ9biuqoNVdoakzESaX2lYhsgdJdGy1dWA3aXDy9DGUuQil
         ynOlsAnxtF7BrbWbFmcR/BMCwcjZQDCkLZIaeecoUuV8awC6IEB19ZowZL1d2ZohksYZ
         WIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790613444; x=1791218244;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OOyxc28yCeoKN8IIez4bm43LAy5QpdgvjEs3QWsuxMc=;
        b=NbfCWElZbV5DHd2nJY6jDbTjRwVAMp0aEkfWrL+nw4EsY4fw/EFgtWRuZ3erUkpajg
         s6CZZ4a9gPJsOktj6Rb/FK5xEqw15OcFACcDQeHYKkM25+3fTqZJVlYuLXjEuvIcw0c1
         RSryJqJ/GhYD5Q1YMewN4e7jEfj+jFXxa/MLhPMy6wAy7WY8AyqQZ4z8y1CDIOmKrFHr
         3Swuw9rMAK/O0emm5d0mEp5z6SHm0TaY2rkZBE+LDvq5j1cqASUoSpEVVxVfFGGYVVgk
         qz0wT/bUojtLA9BhxdWkpCrHFdJWl6YntwuWt2whfeQh7DQa8q2O0I4WOApljQ3KW1Rl
         yqfw==
X-Gm-Message-State: AFuF++lVprJSUN+e9Pt35uz1/Hoa3K2DYlpc8tICbNTKDUhfgiD+5e9Q
	6bx2agNmdgYQN/ijLOZbEO9YiDyaNcx/SMWyn10R9PVbxBpGSPBouk9V6TZGmHNxyLTjS3Haf0O
	psDTTYeD47dl/Bl8afZuoxrDzdaCKtthPBvSa4ZF6G+nhkWIV1MjdwA8sU8cxpkZ/usY4
X-Gm-Gg: AYBFou3mhN2FO1hSVduhi82wmY9zysgASPe95zSMueyM6v8oROpYEAXMf3mFHjcc4Wq
	e8+y7Po2xqeh/QKg+EEutuvJv2728DUhSEZMjhfiFxZhTnEII3XycjQBiakLCDcOtFwvPWigeuy
	AEtM7DvQm74KQTOjureJ0eBA+AfVdTXs2QVQi1JaS6K8fuVEtJZ5zdVVF8A5VMJpidOKFe+UPrb
	6Y8JObMzeU5i40YoIc6FE5j/Vh1Rl8LytvtG+2f00+bqASWPHMoSHXnYZP5hmu+qRLoMlAU4I1I
	h3BuDCu7GcTRmIO8SQovwry2Bga0lOXfi55927WF8qtYG8PTp1W486eE8o+0+rklLz9snw5iE+X
	hIVMszR29
X-Received: by 2002:a05:620a:488f:b0:939:761c:4f59 with SMTP id af79cd13be357-93c43bbddddmr2195447585a.16.1790613443723;
        Mon, 28 Sep 2026 09:37:23 -0700 (PDT)
X-Received: by 2002:a05:620a:488f:b0:939:761c:4f59 with SMTP id af79cd13be357-93c43bbddddmr2195277485a.16.1790613427788;
        Mon, 28 Sep 2026 09:37:07 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a6456f8sm28442084f8f.26.2026.09.28.09.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 09:37:07 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 19:36:52 +0300
Subject: [PATCH v3 3/5] arm64: dts: qcom: eliza: Separate common CQS SoM
 and eMMC configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-dts-qcom-eliza-add-ufs-variant-v3-3-9a2fdbf6baf2@oss.qualcomm.com>
References: <20260928-dts-qcom-eliza-add-ufs-variant-v3-0-9a2fdbf6baf2@oss.qualcomm.com>
In-Reply-To: <20260928-dts-qcom-eliza-add-ufs-variant-v3-0-9a2fdbf6baf2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=5197;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=8mPzzD2hnNyHm5q/BijcmSzzMQ1oNaUHkqeiDyYLXik=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqupenbMfIraHKeLFVebhRiEhrHPHFgNpP76kWj
 4FLqZjlYAaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarqXpwAKCRAbX0TJAJUV
 Vps7D/4hxB7xj2lD2rftsY046jldkVXksBqpxiZw0Ql+V8rrKesbqXYbCRbpysicCRZJAA8vG5l
 s+JFLkgM/6W6dKzwKc8H5SIQ4Hohn8DhUR7JRzwhDKMW8MKdPuYfO93LZCNge8K3Y7qboiwfzCu
 WecjJiJREun8+9oR3GCVmeO1kfqyCdG7At5jkZ3k+4CSjiLuUxKjmLRCjJ6jgMyZf6HzlZasYA4
 F69kPmBxASqa0Rv4HI6itBFIcR9SsKbT/6wGL5aIYj5NgGaQEulb9g3/ZjKDmxWEIWVRfFpPIXZ
 J5w70SIKo3gQg37RjMBl6top53FhuAsykED1oFGKRfRyX2LD8yUVxaxJnkGAd0j/+YeulyaFpUd
 0eZ+P+83XTpGIDhLJAch135VNy1IaycmPDCDcujrITSBGKNrkZF/4gjvg6GJHpM5GZ7NAF5mpHv
 QXwQA+5GKQQGBepc7CxrFeCI6Iw+nGSduXT3OZJMa6uhUBHekZdVqfhXHk/Pij9CT3hyjyDpT+6
 xnGniGav/XAqpVSWnfTfre/Z6l+bj8HkkUpKkaeNxxq6rEOJmwxauIzfBpxw45CyzsWrcWwfgR3
 mzNQrMwGA4b9aaVoIP1CnsKcg7zXKequZoHUiHa8U8H7Lb1psUMwq0ytt4YlNb1qRkwgRHt/f/D
 SGeitDbia141jTw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=Sq4Fe/O0 c=1 sm=1 tr=0 ts=6aba97c4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=FfUMhDFI_infzSTnTwkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 2mwT8Lf8iZXJ9qz5Wr2AWNJtr1D1Yw7y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2NiBTYWx0ZWRfXwE3qsbc/7Itn
 LOVL8oUE/wBDQM+b8NrVIXYmUaZOlbfiy+0ZOHApS4gw7kELTfNojl/+1N7G5w9z9QrwuwlC3tV
 x59wBbrIYKpkIpeZBr49CJWJlFhL0OJjwqIFo+7Fo79tUXYkioovjEdKGMEZxKZ6Ri01ZUH208o
 seTMo6pyuX7H2EPVdomLHaHT5i9t7Nad4vi+eIyKAVXG+9AlOCraWnHVRS/INgJ8dryuiZHFlXR
 j11FNlSvbzwSDZNU8FamvQhq8Z7pUH3B9+NVj3d9+3sQYRLnSolbgtAiTWh/sn0zPa5RZ/4bDY7
 ZEmlN64luYlFV9ZbZLss+Tdk6UQl0twWxp7g4F+P89kRsGHhDzYeLdMZMMIIBD5YKOF/CkSk2Yd
 XvE2t6vqS2/vwPrhhjonoZ74zSGSwgKHWyGOhEiFQpLr0ocRf83xa6eJj5a7QQ496ItWar8jBcn
 CzCjQz2raws1sycWBtA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2NiBTYWx0ZWRfX+cXUOLMSrXwJ
 H5jrNDa/alO/7zs699nHJtNowB5a5zIs6H5mYP8JyoFMUopMxklC88rin3MEhh0SoSggsd9Vl3s
 fz5aYGCKq2JuM7qpH/d5CQ19dhOyCE8=
X-Proofpoint-ORIG-GUID: 2mwT8Lf8iZXJ9qz5Wr2AWNJtr1D1Yw7y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280066

The existing CQS SoM description includes its eMMC storage configuration,
while the SoM and EVK filenames and compatibles do not identify the
storage variant. The UFS-equipped CQS SoM uses the same EVK carrier and
shares the rest of the SoM hardware, so duplicating the existing SoM
description would leave two copies of that shared configuration.

Keep the common hardware in eliza-cqs-som.dtsi and move the eMMC
controller configuration and its 1.8 V I/O supply constraint into
eliza-cqs-som-emmc.dtsi. This lets the UFS variant include the common
hardware directly without inheriting and disabling eMMC configuration.

Rename the existing EVK DTS and its compatible strings to identify the
assembly using the eMMC-equipped SoM. The carrier hardware is unchanged.
Neither the CQS SoM nor the EVK assembly has been made publicly available,
so the DTB rename does not affect existing users.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                |  2 +-
 arch/arm64/boot/dts/qcom/eliza-cqs-evk-emmc.dts  | 18 ++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts       | 14 ------------
 arch/arm64/boot/dts/qcom/eliza-cqs-som-emmc.dtsi | 27 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi      | 18 ----------------
 5 files changed, 46 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 7ee7b98994c2..3b3ee21999fd 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -14,7 +14,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a14-ux3407na.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a16-ux3607oa.dtb
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
diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som-emmc.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som-emmc.dtsi
new file mode 100644
index 000000000000..af4ade2d4e45
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som-emmc.dtsi
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "eliza-cqs-som.dtsi"
+
+&sdhc_1 {
+	vmmc-supply = <&vreg_l12b>;
+	vqmmc-supply = <&vreg_l1d>;
+	pinctrl-0 = <&sdc1_default>;
+	pinctrl-1 = <&sdc1_sleep>;
+	pinctrl-names = "default", "sleep";
+	mmc-hs400-1_8v;
+	mmc-hs200-1_8v;
+	non-removable;
+	supports-cqe;
+	no-sdio;
+	no-sd;
+
+	status = "okay";
+};
+
+&vreg_l1d {
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
index 03f9192324c7..a378a500d9e0 100644
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
@@ -278,8 +278,6 @@ regulators-1 {
 
 		vreg_l1d: ldo1 {
 			regulator-name = "vreg_l1d";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
@@ -396,22 +394,6 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
-&sdhc_1 {
-	vmmc-supply = <&vreg_l12b>;
-	vqmmc-supply = <&vreg_l1d>;
-	pinctrl-0 = <&sdc1_default>;
-	pinctrl-1 = <&sdc1_sleep>;
-	pinctrl-names = "default", "sleep";
-	mmc-hs400-1_8v;
-	mmc-hs200-1_8v;
-	non-removable;
-	supports-cqe;
-	no-sdio;
-	no-sd;
-
-	status = "okay";
-};
-
 &tlmm {
 	gpio-reserved-ranges = <20 4>,   /* NFC SPI */
 			       <111 2>,  /* WCN UART1 */

-- 
2.54.0

