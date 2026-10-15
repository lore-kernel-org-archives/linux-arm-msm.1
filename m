Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838483DBD65
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 02:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792031885; cv=none; b=c4iD9oIs1fsAwx9jXsKUqJsoo4seFQW+sHakUQmiSU2oiHdYi28tsAsSlhFbD8VevuvmYP26ym6Rf4Mjh2EDanh+YDyiRwHaJOlPuNPkibbJIzLkKAzwLwPJAVB3SaATPynu5dbERoY8/fHHz4kHjXbLRgBrWrA5P4kV12LklgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792031885; c=relaxed/simple;
	bh=oi9/on91d449GBYTbEf2yNhdCy70ROE/FhkTuGYATnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b8Uh1iVqMc05KE1ZP2UVos2Jr/LES7gAY+oXrBeIK+tiPQeph+ZxAoN3piSIhzsC5iWYsc3SKDxcBYpy/26/h4ICIeHB6Z2C2GxIPWfLq/2VsNAE+wxF9G8dD3I/SmSpzd0+VowJEXdXLtrZ2p7Q21AwuyWTHPe6zjXcr2OcTX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ey/EWuNH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iafZEPYr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ey/EWuNH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iafZEPYr"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ENKFug1682633
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 02:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nuw13GmJWWJ
	/fBXgiSVGJlvBByWQxl2GyouAKaNRy1E=; b=ey/EWuNHd+L6SyedsOI0NPbBap6
	+KqKJP2UGJhuvf4ZTpqEd1w+GDoHzgb33Et5JNN6KdhjJKm8J8aOS5ZjFzKXvGs1
	4e+qMfjkhAUL1qnhEBUQgPHPGy+kSLHrqARAPKDzOpS8l/twN2Uk4NQ96T5/Cj9o
	geYfz3TIyTMBQilh4rNcPJQooyz5M2p+nFZEh3lQ2rr6o4aQbHLT/irnmd9fuYO5
	qGvgjFKWYf4uPjmQPxBBsL3xXTxwklzOFnpN4LzdUePQNgQ1kJ9iQBgHFzCd62sH
	M2v1dF62m62Ezd/M9hxepRNdNgn4fNNxyYTJQcB/B0XesH445o6tZ3Up/uQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacb028ca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 02:38:00 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-151ba226e1bso5518373c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 19:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792031880; x=1792636680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nuw13GmJWWJ/fBXgiSVGJlvBByWQxl2GyouAKaNRy1E=;
        b=iafZEPYrk4eLtxuKu8oBQ7n8j96JDqqXmc4t/GqksXfD2HWcrO2vAdIyEndB57jiKG
         MbIq7GU8gPaElzO2f/zgJuZzCc1dfvkL/Hi1rjVfiE9vBKyBIqvTvo3lxorVhimlYtVg
         VG7Akmj3lJYHe4Yxp0T+FQ4wO7ZlS+Y2vGVqf136CsupvrVg1WA8zPVek458d8dXldgc
         BKNQ/x/h6WGG5PzsWdixkFRDFXu4DFc6FQh22lWiFHCs431MW4D4it8T+v6PY+If/Klc
         HZ6gQanIVavidBlgI+m/0Nt2CavFccm7REID3tWHHTH2ATHLEVxQfC8c9dfdMHXN6N3z
         ZqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792031880; x=1792636680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nuw13GmJWWJ/fBXgiSVGJlvBByWQxl2GyouAKaNRy1E=;
        b=E4Z/j9midgevfP7MXw16n0D5uoVtJxDteoNGc35jdUgva5HSM1qNlmY0vwTgJ1eIUD
         Ovfx6Mqe906ox2/MKI+1HrF3ueGzem1d6jFHZkxweVr3jaw9ZKB5zGrnLFoJy51mlBBg
         Ap0wb3BPtZ9NVxhwYDCci3A9qkY/WCjyvnCMi9qfUnTKiFsO0W3lis12YISPw2vJhe9e
         NYH9pzCspBo9iOd+/OTwRrcTJe97XF6uJcOKFuEqTRQXhfaB/BNXvjh1HLQ8vrn6sBao
         xSCMTZ8Eb5pFoKzcn3gvn/bP9fKHFIJTJulU+gPe4lUMhgYJvCOcKaPdDGpsFcfsCF0M
         NaQg==
X-Forwarded-Encrypted: i=1; AKwUvByAy9Z+Ibi0ZIcGH84oEoytq25KMthaBiELvhezXWnLMhdfWng7wtafUgtIaHNscVta6qrwgTeA6T9l9vIz@vger.kernel.org
X-Gm-Message-State: AFq9FYIDBs6K/YZ0+mERgvIahx++w33YYR5JUK26wmVfUBuCPEgiKuUn
	WiGvjCBtRZULH05pE4VCW3qt4pYdN7OT0zwHwLlzpkZoYAxX38PmohqzPYZozf4Sbw4hlcvxr/g
	tY6ZQcWEih9HIlaUBXuUlTIKWmIA8eArMGTSZtC7F2TDiBvePUizg+NwetU+sRvw+OCgA
X-Gm-Gg: AYBFou2weBuV6KbxdQQgNJeP8AVyarLGA6Q6sXjp1lJ5HrFVBO0r3ldRQXn/5iNzz2v
	/n8Ucz/PXfiI4v2cPT01XfqBnq2gdHOipNTJdHQ4TEYPINXBWlT22mfEeYt2knQ7zFJ+uxayEr7
	yYbvorRcdCSAsz1XzRglkP0b+qA+0kBzArQOj+Goln+dqhnrmF5TMp5lhqXdvqgrPfuhXFvk47J
	W1DUFQLenVSjJMYNyi2UwFiWbUuYNq7nIwb5ktf51OSN1X9t6XBQEu7ln+HBIsmCLeJ8GOYhSfV
	0BzJcQE4Hl8f+OLzu5z20u/QYcmjKLca9jVk7SDLZYBmx4PsWgBrjdgTM/EA+nhxUt4elV07+DD
	DTtx/tU+dGV8rgp9HkssB0sF5T53X66pxDM1CtkB49Tf/D5j7eNa+t0fX3Kg=
X-Received: by 2002:a05:701b:4212:20b0:168:e942:4e62 with SMTP id a92af1059eb24-16a61789c56mr24356364c88.40.1792031879621;
        Wed, 14 Oct 2026 19:37:59 -0700 (PDT)
X-Received: by 2002:a05:701b:4212:20b0:168:e942:4e62 with SMTP id a92af1059eb24-16a61789c56mr24356325c88.40.1792031878876;
        Wed, 14 Oct 2026 19:37:58 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a42407e7sm51217017c88.15.2026.10.14.19.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:37:58 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 1/7] arm64: dts: qcom: Introduce lemans-embedded.dtsi as a placeholder
Date: Thu, 15 Oct 2026 10:37:05 +0800
Message-ID: <20261015023711.721837-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VKpIDNPX c=1 sm=1 tr=0 ts=6ad03c88 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=5r3D8o42p4VsMVMPxZsA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAxMCBTYWx0ZWRfX5ZmOCVa3GO9B
 ZqubWGQfBv0nxrGsoYV6phHUrCOxsgpFs5S/x6y7SwIsSP9WoOk9QIX74dvxiQj0c1S3TjjtDKi
 if81l4MO8Hi+2k15YOvQeOIEjNIJUPQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAxMCBTYWx0ZWRfX87W5oYekyxSL
 soL3cIvH3XJAfBvcFIlnPRvo4wLvXdBFkNhcU1ol319TRqqxLpFg+/asM4pyKLMlecvqhCYed0l
 pUL9JQux0DnoDPid31nO2byfVHWRIByt0q0CS/mF0hWRJ6IQ7kuGjYXZu7p464xMv/xGIq8vBtl
 fCbdU6uBuetlt92sG6G2W4XULOadqerSj0vtHh97eI4L3vcR+D+YhgbaL4K9I1Fq/r3f82Y6ZPI
 ZN8MQ0VtMVo0NycuVOTXHzCuEZ6KCpE5PFWd8B5XqZjvNNP9J6uCLi26Otw4R6dquzeILmh+0t3
 CevwMafd62dTfUE7bO7uWLLumpbZq+SoWqlorU588h5TL4eZMx7fFBMyLGQjw4yj0Pl1LvUZHiI
 f6otewY+M33dfrVruqOX8JVziAwuRkEoUedwV93vKvROyLKBUsC1QYPwW/2BjHl+Oor5OcLEpsF
 4L0XzwKgzZ0BO7Bh4cw==
X-Proofpoint-ORIG-GUID: s2GEGP7TCSKb3ggzKMh0g7o37YiImsxd
X-Proofpoint-GUID: s2GEGP7TCSKb3ggzKMh0g7o37YiImsxd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150010

Lemans is a Qualcomm SoC family that includes not only the Embedded
variant (IQ9/SA8775P) where platform resources are managed by HLOS, but
also the GearVM variant (SA8255P) where resources are managed by a VM
as SCMI server. The current lemans.dtsi covers the former variant only.
Introduce lemans-embedded.dtsi as a placeholder for now, while later
changes will move Embedded variant settings in there and introduce
GearVM variant support.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi | 6 ++++++
 arch/arm64/boot/dts/qcom/lemans-evk.dts       | 2 +-
 arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts  | 2 +-
 arch/arm64/boot/dts/qcom/qcs9100-ride.dts     | 2 +-
 4 files changed, 9 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi

diff --git a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
new file mode 100644
index 000000000000..80d8c75e4895
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
@@ -0,0 +1,6 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "lemans.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 23cf20f9a178..603a3fa18994 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -10,7 +10,7 @@
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
-#include "lemans.dtsi"
+#include "lemans-embedded.dtsi"
 #include "lemans-pmics.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts b/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
index 7fc2de0d3d5e..a2c70018e571 100644
--- a/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
@@ -4,7 +4,7 @@
  */
 /dts-v1/;
 
-#include "lemans.dtsi"
+#include "lemans-embedded.dtsi"
 #include "lemans-pmics.dtsi"
 
 #include "lemans-ride-common.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/qcs9100-ride.dts b/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
index b0c5fdde56ae..7597b4f27e78 100644
--- a/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
@@ -4,7 +4,7 @@
  */
 /dts-v1/;
 
-#include "lemans.dtsi"
+#include "lemans-embedded.dtsi"
 #include "lemans-pmics.dtsi"
 
 #include "lemans-ride-common.dtsi"
-- 
2.43.0

