Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5096C3EA973
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 08:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788509818; cv=none; b=lNlIGA1m3JxbmRLlAnM2b2eCJ0yVAKKtNgYHYwmy8Ai5Duc/+x3wlEdsKMrtL1zBSoiDIfFyIZA62YrbFxWtQ2Ues+NaWMiwXujZ1/hbMRB3qdKmK9oRtpnjR7+WY16tpioU9Sfy4gODnDPlnaD047HOtPat5BU0s520uAI8U/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788509818; c=relaxed/simple;
	bh=ptZWnJPGtzHL79lHolwBn482KqUEBqLUheFhRCtIrZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aLb1R8TH/7HUExsbK7YiA/N7g3MUvlx5zu6pkyXQo0gDCl0JkKcG+C5+IHFOI4iZm09ihmRBPvpg2CfoN0pgGu8nZX/0G4fOi4H6x5dhpzo8yV53qIdBJlXkJNqKiOk+AZV6CBHmOKHPnj/TPeofjkJaGnnseTwGjYX218t7yfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bRPvPFOr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZBs5P6AY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bRPvPFOr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZBs5P6AY"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847mmSn4111289
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Sep 2026 08:16:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=518KmdipQNd
	vmYVmyhlAWQh2d3AIWOsckA3kSE5DLtk=; b=bRPvPFOrN68RluQYU1mpk4CQYIe
	YDWpFdfIG5XajAehmBKCuvjz5mEKsxXeif9vIyYKXG4RdtMVksMmiskyYtVnQF8T
	vJzAhz81BBwf6bIh6q0zXLfcOvzS/7COkXdt4DRp4zigo+MlgXq0ZMGOA+7Y3v0J
	FgzfickZkUb1gXu6BYnOcD/NT9RSNTFSQOWpCPcGjrKRDJkTgEwUhckv4rQ2ZU/x
	Fgwiom2FaTVvGun1oUidT6tkNOA5X2/CjKrbkUDujIGU2O3AjaPqrjbMex544xyu
	z3vOBtSer6/yAD31u2hErpR9daj09cI08ad9Dpkg4/kNuLJT+w/hcYv2G1A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf9b1c98g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 08:16:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso976054a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 01:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788509814; x=1789114614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=518KmdipQNdvmYVmyhlAWQh2d3AIWOsckA3kSE5DLtk=;
        b=ZBs5P6AY2pyJplUPWP04oVR+bxrw2Mm0OfScQXxaWcdL/sdAd9nFQP5pRJXy8p6xOm
         7YnLufQ+xB+3Z+9FziaObtJ1PLV3Xk8aNzSMWzcMsz/27T7+/MtnrEk3HdwK6+L7EpJD
         v3T/16Yccja72HvFMWnKqra7+3nJwzUAiFNmMRBjbBoQLPM7dpuEzXnuC77CEDjPs23t
         niGB5iuQTwfRTEq0i86bRubd2OFpCo+iUn4+4tAgvxAFbtGocb5cTWPKeRDXynYuVkJP
         PasyJ8q02/q486DlKdJjqcCRloqvSCAlYO0c/0VAwbVMsSLYaMY0IluyI8ybPN8Anv/N
         XQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788509814; x=1789114614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=518KmdipQNdvmYVmyhlAWQh2d3AIWOsckA3kSE5DLtk=;
        b=F4+K4qGVERzXtc4yp0CSwXrE2O5oZIKr8MH330hzj2NGRebTHhso8heYWYpwY7aMyC
         KiiXXh0AsnurrzuXSbC6I1YZRnJIyrGZX630s4+gnPwxu6Rl0u/P6NvWgwtFtc/nrHrV
         HC/XS24pFH6D4ViDpHc4Cw/BIljS/2DcWDTfmtTkbXDZ/3Gj7uQCzTMbVP8pqOZbftNd
         dtjnWF1JG0Y79wL41a+q60LOBiSNv0bSM40KNoZxLrDqfmqOtEUa4NT2UPN5bY/fsJR9
         DYcwUhqzQ6CI4DAdpYwG3fZNRAp/GVPEFspSMr7wjVuRJoYAwhb8/I78GkLPlC4kMCIE
         8uCA==
X-Forwarded-Encrypted: i=1; AKwUvByPOXFOzSSBu9/Pra07KBNrDjDdqi58JxNK+U8wTQARvhuqaPCvqI/z5S1z52vEZ91jpVqGGwidH0sGtyCX@vger.kernel.org
X-Gm-Message-State: AFuF++n/ligjZExgrHlYXxrJ9uoOgerbPhRuNIKw+AXsvUs2CpCx0NOU
	uIeWFRkONJOOUun73W4hVSGsf3xbluiOJUK/gkbasn6SUdjCqetVduw1aupkITKVodU/dl95Lh/
	ab5j75R1zHogNaBdvr7OQp2E1lP4RjDOk3UxYct3ggcslXcOkcUb1JR7vPWtkUm1fwaaF
X-Gm-Gg: AYBFou0713nI+EmvFoniLvVmMCHHcEMc86oTpi8l67H6sS8af57d1YBallY/ZAH3rq2
	3hMzcPDY38suGP2mG0sYwVd4WfIP4krs8+RKSl1rGQ27D7xBT0ODTT2SCWezjRt3ocTo7z1PtsB
	5VRv1cJ3vM5vqRKwWYpoTadypXn8Or8d8E3RRVrSh3f4DmX29SMSaPSb+V5YP6CfjSXDRXBiHum
	F3yaFbHBUI7rkE7QVwJaXdDWggatR0SGZ9+doFzZiSZpjVy/vhM7DhxS8B3Nfv1i2ukcbowSqil
	3DfRxwsxQ4yYugzPZ+oHU79K9AVth4gTDVKckNzBEPja0udIWTg7mdvcvDUKDfxS/FAtyysDgbv
	KEkh2FBnuKxZbtfl05Na+L/9ua1bDB7aZNmvLJgKfppTO6lXC19CWaGpIgCPk
X-Received: by 2002:a17:90b:4c06:b0:396:b98b:a3c2 with SMTP id 98e67ed59e1d1-39b26116d9fmr5732742a91.8.1788509814202;
        Fri, 04 Sep 2026 01:16:54 -0700 (PDT)
X-Received: by 2002:a17:90b:4c06:b0:396:b98b:a3c2 with SMTP id 98e67ed59e1d1-39b26116d9fmr5732687a91.8.1788509813646;
        Fri, 04 Sep 2026 01:16:53 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm5466648eec.7.2026.09.04.01.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:16:53 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 4/6] arm64: dts: qcom: nord: Add PMAU0102 and PMM8650AU PMIC support
Date: Fri,  4 Sep 2026 16:16:17 +0800
Message-ID: <20260904081619.593602-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
References: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mni2hWInj6xDjBlq7cwCiFXUxTizOEj6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA3NSBTYWx0ZWRfX0LF8zBwttued
 jrQtw5DGzeqIe5lpBz7+ZJ+H/jAyAhJqewz1HLorfBlZjViZnFYa8eYP7Wrcuw3Z3PBtChZmn/T
 89SU0hvr05EmtqRp2wdPpGoQACWFqmU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA3NSBTYWx0ZWRfX3BoqwKmRm2rv
 a2fyr4Xm7oiSrsc1qJQNG2OvZTSe3CNv1bGJ2c9fum9ivmXd/xQvT+bCcohR+3OJHqux3jiXZlm
 ispFeXvNQLuYOo6nY6SaJPoiKCahUqw6NNI1X7VHWbBZ1lNmRHwi8RbU4c/btzR/9xPpuhx1fBk
 dVI2iHaBQNCraLh+wnzfxS9QdfP6mEHUboO03FvECOLff2T1xG1IwRztj+vorLPzMDfN1HXgQMU
 pLYbc6BNa346WuPAyw634nTyX0UEphOiE9Kszy79Q9oMywJKFienT/4Y/iyYfdBafTLFpCCWfOq
 cKoz3+6/uPKNNCm5QaUoegtMOGLo3dpjHVkZGqoVmpJTIr82eJ2pvdqfecn8pPPoNROKiIM0cGL
 BFagjNV3Abhc3SeV5DSv2rQlNuJZWvrHoBVFMxjRhzpZNUYr5czq0NiZ/7tkDiTpoeOtxtsMPmj
 5rDYaHwOg/pZjgwC9Jg==
X-Authority-Analysis: v=2.4 cv=NNTlPU6g c=1 sm=1 tr=0 ts=6a9a7e77 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=hucZloQI8G6bWT6_XmMA:9 a=U2nuDi6JAHPDsfF0:21 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: mni2hWInj6xDjBlq7cwCiFXUxTizOEj6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040075

From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>

The Nord platform is supplied by two families of PMICs on the SPMI bus:
eight PMAU0102 devices on USIDs 4 to 11, and one PMM8650AU on USID 0.
Add one dtsi per PMIC type, following the established one-file-per-PMIC
convention, and include both of them from nord-rrd.dts.

The eight PMAU0102 instances are labelled pmau0102_e through pmau0102_l
after their board designators. Each one provides a GPIO controller, an
ADC, and an MBG (Master Bandgap) temperature monitor that reads its die
temperature through a DIE_TEMP ADC channel. The monitors use the
qcom,pmau0102-mbg-tm compatible with qcom,pm8775-mbg-tm as fallback, and
each is hooked up to a thermal zone.

PMM8650AU is the same die as PMM8654AU, so pmm8650au_a reuses the
existing pmm8654au ompatibles while the file is named after the part
actually populated on the board. It provides PON with a power key,
a RTC, and a GPIO controller. The resin is described but left disabled,
for boards that wire it up to enable.

Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts        |   2 +
 arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi  | 543 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmm8650au-nord.dtsi |  54 ++
 3 files changed, 599 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmm8650au-nord.dtsi

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index e4c3aee441c2..c547963371b4 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -9,6 +9,8 @@
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "nord-embedded.dtsi"
+#include "pmau0102-nord.dtsi"
+#include "pmm8650au-nord.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. IQ10 RRD";
diff --git a/arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi b/arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi
new file mode 100644
index 000000000000..47ea145f4abb
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi
@@ -0,0 +1,543 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+#include "qcom-adc5-gen3.h"
+
+&spmi_bus {
+	pmau0102_e: pmic@4 {
+		compatible = "qcom,pmau0102", "qcom,spmi-pmic";
+		reg = <0x4 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmau0102_e_mbg_temp: temperature-sensor@d700 {
+			compatible = "qcom,pmau0102-mbg-tm", "qcom,pm8775-mbg-tm";
+			reg = <0xd700>;
+			interrupts-extended = <&spmi_bus 0x4 0xd7 0x0 IRQ_TYPE_EDGE_RISING>;
+			io-channels = <&pmau0102_e_adc ADC5_GEN3_DIE_TEMP(4)>;
+			io-channel-names = "thermal";
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmau0102_e_adc: adc@7200 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x7200>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts-extended = <&spmi_bus 0x4 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+
+			channel@400 {
+				reg = <ADC5_GEN3_REF_GND(4)>;
+				label = "pmau0102_e_ref_gnd";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@401 {
+				reg = <ADC5_GEN3_1P25VREF(4)>;
+				label = "pmau0102_e_vref_1p25";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@403 {
+				reg = <ADC5_GEN3_DIE_TEMP(4)>;
+				label = "pmau0102_e_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+		};
+
+		pmau0102_e_gpios: gpio@8800 {
+			compatible = "qcom,pmau0102-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmau0102_e_gpios 0 0 12>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pmau0102_f: pmic@5 {
+		compatible = "qcom,pmau0102", "qcom,spmi-pmic";
+		reg = <0x5 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmau0102_f_mbg_temp: temperature-sensor@d700 {
+			compatible = "qcom,pmau0102-mbg-tm", "qcom,pm8775-mbg-tm";
+			reg = <0xd700>;
+			interrupts-extended = <&spmi_bus 0x5 0xd7 0x0 IRQ_TYPE_EDGE_RISING>;
+			io-channels = <&pmau0102_f_adc ADC5_GEN3_DIE_TEMP(5)>;
+			io-channel-names = "thermal";
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmau0102_f_adc: adc@7200 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x7200>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts-extended = <&spmi_bus 0x5 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+
+			channel@500 {
+				reg = <ADC5_GEN3_REF_GND(5)>;
+				label = "pmau0102_f_ref_gnd";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@501 {
+				reg = <ADC5_GEN3_1P25VREF(5)>;
+				label = "pmau0102_f_vref_1p25";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@503 {
+				reg = <ADC5_GEN3_DIE_TEMP(5)>;
+				label = "pmau0102_f_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+		};
+
+		pmau0102_f_gpios: gpio@8800 {
+			compatible = "qcom,pmau0102-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmau0102_f_gpios 0 0 12>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pmau0102_g: pmic@6 {
+		compatible = "qcom,pmau0102", "qcom,spmi-pmic";
+		reg = <0x6 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmau0102_g_mbg_temp: temperature-sensor@d700 {
+			compatible = "qcom,pmau0102-mbg-tm", "qcom,pm8775-mbg-tm";
+			reg = <0xd700>;
+			interrupts-extended = <&spmi_bus 0x6 0xd7 0x0 IRQ_TYPE_EDGE_RISING>;
+			io-channels = <&pmau0102_g_adc ADC5_GEN3_DIE_TEMP(6)>;
+			io-channel-names = "thermal";
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmau0102_g_adc: adc@7200 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x7200>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts-extended = <&spmi_bus 0x6 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+
+			channel@600 {
+				reg = <ADC5_GEN3_REF_GND(6)>;
+				label = "pmau0102_g_ref_gnd";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@601 {
+				reg = <ADC5_GEN3_1P25VREF(6)>;
+				label = "pmau0102_g_vref_1p25";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@603 {
+				reg = <ADC5_GEN3_DIE_TEMP(6)>;
+				label = "pmau0102_g_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+		};
+
+		pmau0102_g_gpios: gpio@8800 {
+			compatible = "qcom,pmau0102-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmau0102_g_gpios 0 0 12>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pmau0102_h: pmic@7 {
+		compatible = "qcom,pmau0102", "qcom,spmi-pmic";
+		reg = <0x7 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmau0102_h_mbg_temp: temperature-sensor@d700 {
+			compatible = "qcom,pmau0102-mbg-tm", "qcom,pm8775-mbg-tm";
+			reg = <0xd700>;
+			interrupts-extended = <&spmi_bus 0x7 0xd7 0x0 IRQ_TYPE_EDGE_RISING>;
+			io-channels = <&pmau0102_h_adc ADC5_GEN3_DIE_TEMP(7)>;
+			io-channel-names = "thermal";
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmau0102_h_adc: adc@7200 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x7200>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts-extended = <&spmi_bus 0x7 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+
+			channel@700 {
+				reg = <ADC5_GEN3_REF_GND(7)>;
+				label = "pmau0102_h_ref_gnd";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@701 {
+				reg = <ADC5_GEN3_1P25VREF(7)>;
+				label = "pmau0102_h_vref_1p25";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@703 {
+				reg = <ADC5_GEN3_DIE_TEMP(7)>;
+				label = "pmau0102_h_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+		};
+
+		pmau0102_h_gpios: gpio@8800 {
+			compatible = "qcom,pmau0102-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmau0102_h_gpios 0 0 12>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pmau0102_i: pmic@8 {
+		compatible = "qcom,pmau0102", "qcom,spmi-pmic";
+		reg = <0x8 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmau0102_i_mbg_temp: temperature-sensor@d700 {
+			compatible = "qcom,pmau0102-mbg-tm", "qcom,pm8775-mbg-tm";
+			reg = <0xd700>;
+			interrupts-extended = <&spmi_bus 0x8 0xd7 0x0 IRQ_TYPE_EDGE_RISING>;
+			io-channels = <&pmau0102_i_adc ADC5_GEN3_DIE_TEMP(8)>;
+			io-channel-names = "thermal";
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmau0102_i_adc: adc@7200 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x7200>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts-extended = <&spmi_bus 0x8 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+
+			channel@800 {
+				reg = <ADC5_GEN3_REF_GND(8)>;
+				label = "pmau0102_i_ref_gnd";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@801 {
+				reg = <ADC5_GEN3_1P25VREF(8)>;
+				label = "pmau0102_i_vref_1p25";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@803 {
+				reg = <ADC5_GEN3_DIE_TEMP(8)>;
+				label = "pmau0102_i_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+		};
+
+		pmau0102_i_gpios: gpio@8800 {
+			compatible = "qcom,pmau0102-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmau0102_i_gpios 0 0 12>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pmau0102_j: pmic@9 {
+		compatible = "qcom,pmau0102", "qcom,spmi-pmic";
+		reg = <0x9 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmau0102_j_mbg_temp: temperature-sensor@d700 {
+			compatible = "qcom,pmau0102-mbg-tm", "qcom,pm8775-mbg-tm";
+			reg = <0xd700>;
+			interrupts-extended = <&spmi_bus 0x9 0xd7 0x0 IRQ_TYPE_EDGE_RISING>;
+			io-channels = <&pmau0102_j_adc ADC5_GEN3_DIE_TEMP(9)>;
+			io-channel-names = "thermal";
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmau0102_j_adc: adc@7200 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x7200>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts-extended = <&spmi_bus 0x9 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+
+			channel@900 {
+				reg = <ADC5_GEN3_REF_GND(9)>;
+				label = "pmau0102_j_ref_gnd";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@901 {
+				reg = <ADC5_GEN3_1P25VREF(9)>;
+				label = "pmau0102_j_vref_1p25";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@903 {
+				reg = <ADC5_GEN3_DIE_TEMP(9)>;
+				label = "pmau0102_j_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+		};
+
+		pmau0102_j_gpios: gpio@8800 {
+			compatible = "qcom,pmau0102-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmau0102_j_gpios 0 0 12>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pmau0102_k: pmic@a {
+		compatible = "qcom,pmau0102", "qcom,spmi-pmic";
+		reg = <0xa SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmau0102_k_mbg_temp: temperature-sensor@d700 {
+			compatible = "qcom,pmau0102-mbg-tm", "qcom,pm8775-mbg-tm";
+			reg = <0xd700>;
+			interrupts-extended = <&spmi_bus 0xa 0xd7 0x0 IRQ_TYPE_EDGE_RISING>;
+			io-channels = <&pmau0102_k_adc ADC5_GEN3_DIE_TEMP(0xa)>;
+			io-channel-names = "thermal";
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmau0102_k_adc: adc@7200 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x7200>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts-extended = <&spmi_bus 0xa 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+
+			channel@a00 {
+				reg = <ADC5_GEN3_REF_GND(0xa)>;
+				label = "pmau0102_k_ref_gnd";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@a01 {
+				reg = <ADC5_GEN3_1P25VREF(0xa)>;
+				label = "pmau0102_k_vref_1p25";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@a03 {
+				reg = <ADC5_GEN3_DIE_TEMP(0xa)>;
+				label = "pmau0102_k_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+		};
+
+		pmau0102_k_gpios: gpio@8800 {
+			compatible = "qcom,pmau0102-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmau0102_k_gpios 0 0 12>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pmau0102_l: pmic@b {
+		compatible = "qcom,pmau0102", "qcom,spmi-pmic";
+		reg = <0xb SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmau0102_l_mbg_temp: temperature-sensor@d700 {
+			compatible = "qcom,pmau0102-mbg-tm", "qcom,pm8775-mbg-tm";
+			reg = <0xd700>;
+			interrupts-extended = <&spmi_bus 0xb 0xd7 0x0 IRQ_TYPE_EDGE_RISING>;
+			io-channels = <&pmau0102_l_adc ADC5_GEN3_DIE_TEMP(0xb)>;
+			io-channel-names = "thermal";
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmau0102_l_adc: adc@7200 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x7200>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts-extended = <&spmi_bus 0xb 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+
+			channel@b00 {
+				reg = <ADC5_GEN3_REF_GND(0xb)>;
+				label = "pmau0102_l_ref_gnd";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@b01 {
+				reg = <ADC5_GEN3_1P25VREF(0xb)>;
+				label = "pmau0102_l_vref_1p25";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@b03 {
+				reg = <ADC5_GEN3_DIE_TEMP(0xb)>;
+				label = "pmau0102_l_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+		};
+
+		pmau0102_l_gpios: gpio@8800 {
+			compatible = "qcom,pmau0102-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmau0102_l_gpios 0 0 12>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};
+
+/ {
+	thermal-zones {
+		pmau0102_e_thermal: pmau0102-e-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pmau0102_e_mbg_temp>;
+
+			trips {
+				trip0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		pmau0102_f_thermal: pmau0102-f-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pmau0102_f_mbg_temp>;
+
+			trips {
+				trip0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		pmau0102_g_thermal: pmau0102-g-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pmau0102_g_mbg_temp>;
+
+			trips {
+				trip0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		pmau0102_h_thermal: pmau0102-h-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pmau0102_h_mbg_temp>;
+
+			trips {
+				trip0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		pmau0102_i_thermal: pmau0102-i-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pmau0102_i_mbg_temp>;
+
+			trips {
+				trip0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		pmau0102_j_thermal: pmau0102-j-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pmau0102_j_mbg_temp>;
+
+			trips {
+				trip0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		pmau0102_k_thermal: pmau0102-k-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pmau0102_k_mbg_temp>;
+
+			trips {
+				trip0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		pmau0102_l_thermal: pmau0102-l-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pmau0102_l_mbg_temp>;
+
+			trips {
+				trip0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/pmm8650au-nord.dtsi b/arch/arm64/boot/dts/qcom/pmm8650au-nord.dtsi
new file mode 100644
index 000000000000..1282e5bae591
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmm8650au-nord.dtsi
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+&spmi_bus {
+	pmm8650au_a: pmic@0 {
+		compatible = "qcom,pmm8654au", "qcom,spmi-pmic";
+		reg = <0x0 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmm8650au_a_pon: pon@1200 {
+			compatible = "qcom,pmm8654au-pon", "qcom,pmk8350-pon";
+			reg = <0x1200>, <0x800>;
+			reg-names = "hlos", "pbs";
+
+			pmm8650au_a_pon_pwrkey: pwrkey {
+				compatible = "qcom,pmm8654au-pwrkey", "qcom,pmk8350-pwrkey";
+				interrupts-extended = <&spmi_bus 0x0 0x12 0x7 IRQ_TYPE_EDGE_BOTH>;
+				linux,code = <KEY_POWER>;
+				debounce = <15625>;
+			};
+
+			pmm8650au_a_pon_resin: resin {
+				compatible = "qcom,pmm8654au-resin", "qcom,pmk8350-resin";
+				interrupts-extended = <&spmi_bus 0x0 0x12 0x6 IRQ_TYPE_EDGE_BOTH>;
+				debounce = <15625>;
+				status = "disabled";
+			};
+		};
+
+		pmm8650au_a_rtc: rtc@6100 {
+			compatible = "qcom,pmm8654au-rtc", "qcom,pmk8350-rtc";
+			reg = <0x6100>, <0x6200>;
+			reg-names = "rtc", "alarm";
+			interrupts-extended = <&spmi_bus 0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
+		};
+
+		pmm8650au_a_gpios: gpio@8800 {
+			compatible = "qcom,pmm8654au-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmm8650au_a_gpios 0 0 12>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};
-- 
2.43.0

