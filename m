Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE6D4F0528
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 16:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790613450; cv=none; b=CX0FQ373dQ+NAozo5Fe2r/4UNvfuz+VRysMMjw96hgq/5lsB6iFGXemeK29prsskBEnFtG+sPGxEQzCsXp5QdwUWETj6nqCGI4L76Mvv0FBXBaj7igEjQn/zopyorZOu6Wq1U9nFrrEDG2sQ3LlASz9dM2Yio1WGDn7kO140ieI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790613450; c=relaxed/simple;
	bh=2j3L38B9bVW4xmB1fQnAjzLeIRp/do902mCL+cFPQn8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=odgFLQW0q5CgPGmNVBpAW5OD2VxNK7O8HrfZgvywpGGbgrlN/wuMPixcU2jj22QbXdIPGtc5Ok4iuPCWztzenLmQR0yMPqLLz17O3FP/5CTargi9HW4SNxUYQYew7CowHtmfc07FZ3CL4mS+jORGDgSaHGgMTj2VDannpZP4PBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KJE3V6Pc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K2mEwh2q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KJE3V6Pc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K2mEwh2q"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEe3Jt2298472
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 16:37:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lz5SxMHcV3mEG3tF/NrmVjwM3bUT5s1HvTWeTrC5Idc=; b=KJE3V6PcxhxQEUkG
	dKmJfjfPNkyZK2Aw4Zn1HTvWUkAADewHTou/5mOOZWknQpAb8rMnPM77MYikG32E
	yxAviDBSt46XEEhSZMLoA2DXd020lER+Ib7yBAhGBRVd5lGy7cdJS+sUWkT1RVI3
	XetJSGaG3XWc46BDFPr7G5nAYWbuxKWj23AA6ZNagCie1GkQhrzpFIvFhCfAoWDO
	ItHrmUX3tRntZOtOeoOe21qHzOCQIddWoF06niDZKEkEc0tTc52Y7EVkS35n1hDA
	8pRXWyYH/KeezVnsCbOiHUvuCoYJnnAMz5jQ+GV9SNBq2QngkL62J4a3Y9q3kvFE
	RxhiPQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynb6hsnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 16:37:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a1de6d5c3so823398685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 09:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790613447; x=1791218247; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lz5SxMHcV3mEG3tF/NrmVjwM3bUT5s1HvTWeTrC5Idc=;
        b=K2mEwh2qz/ghLzEY76TasdaoZM6rqUylGRWbBOMD+mYTSksDj0l+2MpaL/V8KxgFvG
         ato9xD0TfWwIsbX57lQlNlPbE5tpIASuLqP7wOjFOEBqTVqdvijKPXjPAmran80gtcEC
         fAtsnqVWMj9QRwwbEjIexSjn4O/gB9r8xCTd5ecngL5o5pzb4s1+datm2dwOQo5xchxu
         wSsQSF39Gk1H4Ceao+tJXXvW7kffG8vrQ4kSEBAO7S09jHbm5yLkbGNlz58cD3hae09g
         V/B+w4+Frq0oE5/hNrlamtp+xjva6I8BrOoNXKsrQPKZpoOgy9PKe2AoULPKDcyYoLyM
         +K6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790613447; x=1791218247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lz5SxMHcV3mEG3tF/NrmVjwM3bUT5s1HvTWeTrC5Idc=;
        b=Wj7byffs/ldKVqg+WLRlKGAMc7SlAK3qq89RAB/agjcKUq0lUFpwzhNl1OK2hXBnGz
         6eyiPNsJQG3mTVVRx2M2KavVvI4dSnovtCPoItUAUppPikM56VBPhXZcNa6IDgv/5lxt
         KRETjwsfwf7ODOSPOmgsqa9W8moLbIeVjmpRZZssqliVaQ82ZoYywY7D+tYsveGrKksV
         HOWNE32YCcKEOqPpO6OnqEgGpgoLNZemiOMEMDoz9hcmw1NDyAS98DT4Y+HqA/DrDArw
         p9uCgBgFwUuFghl42LN91UOwGL4xWVSzY8YbqC9Iw1NwNcNQ/w6dJ3mvPb1PC4raTKz/
         O3Rw==
X-Gm-Message-State: AFuF++kNOF8vT0yM1JUGLtUpXNvHgcUS0TksQDLETBGqi/lkk83VAkZN
	vnU+80LQO9aA8V40Co85hj7jVrjhUvYFljj2mgHqYlLmtlQ2fmS1A4rwA4xcCCOS9sB/uwqphCS
	m69W5WWU0qgxfjOmSApRyEDtcMIMo1ZJ2RiDMH8daS3dv7fgwobnwZeeZBl81avQVcFxW
X-Gm-Gg: AYBFou09d4iPiu41exWAJFsJ8hBl6PHuHh+AsN1X6Nd43Ce62jC6Xwi2YkqnDMpUOx3
	A4ApFRE27UMNcvj/i2oOaIZpt3yRI0bRClnLpTYGyfypvcsb/oBaFO7G6y+5usUBXTJEH7LboGj
	nFGtPQrQrIXf5kyW/CeYKw9Mc7cEkmcX9LyDGx6KbrECItWxa9NUHgxg1SqcbYv1QxdDkbeCqOG
	H/DF+IoWmWp9LyHCSzZ4v5irXLq3ygVRNMOWrNUBD5b/jcYhAD/+KRQsgTJXpooQ6XbJGIJf23K
	NzCl+LwcCGgiitiO9ZTLZ0LFYssF61Yz5M2Vufkrbuism0QvktM9ny5LL5zoLqDhPeY1RFZhA0X
	SKD6PYkhB
X-Received: by 2002:a05:620a:1a1c:b0:93c:7e56:92ac with SMTP id af79cd13be357-93c7e5695f6mr519458385a.12.1790613447023;
        Mon, 28 Sep 2026 09:37:27 -0700 (PDT)
X-Received: by 2002:a05:620a:1a1c:b0:93c:7e56:92ac with SMTP id af79cd13be357-93c7e5695f6mr519450285a.12.1790613446347;
        Mon, 28 Sep 2026 09:37:26 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a6456f8sm28442084f8f.26.2026.09.28.09.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 09:37:25 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 19:36:54 +0300
Subject: [PATCH v3 5/5] arm64: dts: qcom: eliza: Add CQS EVK UFS variant
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-dts-qcom-eliza-add-ufs-variant-v3-5-9a2fdbf6baf2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2030;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=2j3L38B9bVW4xmB1fQnAjzLeIRp/do902mCL+cFPQn8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqupepfSxPs48wFQxURcelCaqeD+3jr2uPZKySy
 XhjcVsPDV2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarqXqQAKCRAbX0TJAJUV
 Vn2UEACy/d46e2EPltwpX88m+MSHFRw8M/4ojVJzI5q8HJjT1kcYYWpU7KYsmRHtENBfX/Z19pl
 BbuLBuNCLi0kpLhjZvFm1k8OC6p+h2wGA7vEuyAPiBkNAaBfy/fygc3Ln0+31q8CjIdFMAVayBI
 Ekl6QKW69LsDcQ4c2XkJHB5CjkKsudLRkVQWS6dyHCCXlplPuBtP4DwZFEsMsoeu9iAkoJaYoA9
 6flL5ZB1lYbNCe7Z/kg6y3D7U2psn8M806h+JW7IEyQE6GuntPrYgSvOodZkgi489AA2zEMJOzI
 /CpOQ9GULC/3DM3FPDhjh9hMPFIMwuLU1Ii96izuA3sL1lotoKblsD8faeMXQqBV99U4xBiSfUP
 SKIatlhQjIBK2i6XyrTLCCIUD4VrRdPVYbpf7GskZs55EJYElJFLzhBMdXizqvdapuSOnXXKzmh
 ovl67LOsWq6SVu94pLK6ckC+tZwWvuliaDAYZk1o7ftTGFbF4C8SXM/ZvIrc7BCPJl0sCyL7f2Z
 cWNRCslzbxI62lAjSJJIA431o/UewqiCrPcPqVIk7oYAtBRmMJIZNWFdHo/Mf9jyL1Do5GVtQHa
 uvuvfpJetvTx14Mw3Xnt5lGEmIxoHjPFmn6/YIAWuFuPReSagNCpMEM9oKPcDDyLvtShfFKHTpk
 ouUYvmHllQ+W4eA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2NiBTYWx0ZWRfXxtPY8fZj/XKZ
 lz/d4+TIZL34oSvYvC+xGp2I2MWjHodijJyYlvuHl8eycKClrU+alUOUrrz1vN4ju/lGyIxOc5V
 IdgacnJeNCiLJ3tkq66kCwQECYuQJPaB3nKLxWepmNC490ZqhN40iRuUHny0KXlDjs0CfQQjyWU
 Cp0pGs29m3yjmKPsCDddzST+UooH43jNsRu6kzbujrgV1DRnVTT2JpnTgAMubDwUbZBtrl9l5g1
 7xI/pdCMp7hPNzOl8TNQPWKO+/hKsfg3b6Enga5ZE0Y9lpZPqGNDh8ZejtC+BCyJ1ykAk/INu8E
 UtBuAJfpZUPcsfKAFIcjvbRSeG+6nBcyqXXmg3CJY7U8n5pJQcUZnbYnTceVZc0bo3S/gSg1qYR
 cTMXqOvmg/3TQyYlFKZZZjex0dmVe5gnCToadwjHEey1HK5D++92UgDaVFxBhLVitqYrlI4y8B0
 QscFQI4PkC2vE6PwP0g==
X-Authority-Analysis: v=2.4 cv=K+e3jCWI c=1 sm=1 tr=0 ts=6aba97c7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=LXAihBi0aqfjOys30EYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2NiBTYWx0ZWRfX/ksiZhveLYAs
 XLSlWkm/qD6Av4UDdbUw6Ozz+DMHTqcDYEsPa66jo03f15wSBqI/mUz7MZRN7DF3YVx6lWzpgAU
 SAk64JLtl3PNwHRugr5PQMBp6BZU8ow=
X-Proofpoint-ORIG-GUID: SgnDbtpZYypD4T1jQgOG_Am4aqDzU4KZ
X-Proofpoint-GUID: SgnDbtpZYypD4T1jQgOG_Am4aqDzU4KZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280066

The Eliza EVK carrier can be populated with the UFS-equipped CQS SoM,
but the existing EVK DTS describes only the eMMC-equipped assembly.
The carrier board itself is the same for both storage variants.

Describe the UFS-equipped assembly by combining the UFS SoM include
with the shared Eliza EVK carrier description. Give it a separate DTB
and the UFS-specific compatible strings so it can be selected for the
corresponding SoM.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile              |  1 +
 arch/arm64/boot/dts/qcom/eliza-cqs-evk-ufs.dts | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 3b3ee21999fd..a1fb4e7862ff 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -15,6 +15,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-ufs.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a14-ux3407na.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a16-ux3607oa.dtb
diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk-ufs.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk-ufs.dts
new file mode 100644
index 000000000000..41239874ee82
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-evk-ufs.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "eliza-cqs-som-ufs.dtsi"
+#include "eliza-evk.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Eliza CQS EVK (UFS)";
+	compatible = "qcom,eliza-cqs-evk-ufs",
+		     "qcom,eliza-cqs-evk",
+		     "qcom,eliza-cqs-som-ufs",
+		     "qcom,eliza-cqs-som",
+		     "qcom,eliza";
+};

-- 
2.54.0

