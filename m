Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825261FC0EA
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 12:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786884929; cv=none; b=gcjGr118nRaHTMl/Kjwu9SnYnHBWruCYYyJmZTe/HyeuEnF3tLqsBSOMhIlz2IsiSZRDYVUZ5TFaB8x1VKJfePHdYdwGWZLpvCuwCFb93AKg4pnz0ajMUDz0nb8e5FM/WX2cSuWPh5Nq61GUeG6B7O/j+/bODfDbQoudRJpv04s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786884929; c=relaxed/simple;
	bh=XGTNJbVHXH6mUPiyUU0DAB6T5yTIUEHQNdPB5gy4Zxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bBbdb42HoUYCcSDYuHdl+X81R+n///sP+KgIvu3R3zZE+Lszk8dJwIbxkvJiQbGnAoXWpY//9My+mqzxXswkM2tGL3kka+XpkfOs3UNTDUI257S50Q7/A8atOZb4zHRegG5Q8uYFhDtI+tByFNpQndmEE2N15nU3+1v5x+xCOUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q+afq60I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OvEdLpo2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q+afq60I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OvEdLpo2"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GAgXCR106360
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 12:55:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sb4wpHG3R7L
	lSnSdg5GdtzhojuQali/WgEpyJwumqJo=; b=Q+afq60Irrqdh5YZ/3ZnAzAGWmJ
	aCd5bvCAhKkmWekFPhW370G62MVG3Cqofu0VkS4uGRSpWlCCQ06xe7QjuFP5SB3d
	TmWajteNZ6a2H84bzzj/+Jwh4INm62mmRJb/+LYYohwEUCnS+J5tgbT45N0BZ0Ly
	88t9ZGD1oiQMrEUediczOSVdflmiTx+LBRpSDqdRunMtz2qQnW0ZYOSpmPR6Dyj7
	gx8g8RHTcS79KuK89apw7O2C/yckVLLStF44BaNRNfaGkoOjwizqq6VmhdbbmFgQ
	O4omPCdXKOiP7MZQqnUk9m6ZrvpCHKR1nPtx4diP4el5T1G4QRU/LPRXiuA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghfbcra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 12:55:22 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8484ba00601so2359502b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 05:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786884922; x=1787489722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sb4wpHG3R7LlSnSdg5GdtzhojuQali/WgEpyJwumqJo=;
        b=OvEdLpo2iaBiLvv9QCFFHrCLT2FohDxP6UV+5FvgZ0Z1JmslMx3nvloN9NSSRwbGGC
         UdvN2E2gm6Jb0dR718/9eVDxRTqlfjgbfbpcTIvIHMp6x50JiSNn2OLiNKtNyPVoKzJE
         X5nfJgPfEn0ioBYREQ1eJoUUeEhUw+uY3A6PQh5XvksYwPJ4iphWjRMx0s7NCuU7RPut
         DZpY+OrSyXpOFgXvArUferkWb7gMumH15s53OFkCEQlXxU/9DV2ILUohA/g81GbEhKpH
         NiyvJvMizJyqRSv3MfZzOmx8t0wVQOWbbI30n8+NITHJOG5kwBQZgGVeIymfuttR43ch
         eFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786884922; x=1787489722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sb4wpHG3R7LlSnSdg5GdtzhojuQali/WgEpyJwumqJo=;
        b=P8XV1Aw/Kyws/J5tThZK+IjdyomUXQkSjMNFRA7kFLsratkbfNke724vH2esjVPAOv
         kS54hTQCegogcbcktB8QSIKwWoUlIGJod/bEKNm8nGqY9Lz+l3wX3cvgpFCruqEVRQ+e
         xUu0vSlQPAS96nxKUsV+oRCj79DTtgxVHMg8HARRTAV6D28n2Ji9z1uh7SeFy0tT0cvQ
         uAQ2PrOpITL/3pF+fp9eJ7EEZaa9X8HCBQZ47pTdlTIXA4fYoBaAOQkTu9ViYXJA68Yn
         +tB7SvTN/L9aKmItTd8Sr4Y1X1ChWcTszNN8FeGJ6ng/8o+eOGFL3ciTOpdYYOxpJucL
         E+zQ==
X-Forwarded-Encrypted: i=1; AHgh+RqarhoMAX04l8OVwxjR9dwlQf3GBZk69LM2wYG6j6CA8kT5jAPcBHTFKBKq7KJ9Eka+GHQzHsDz7bb2IxO2@vger.kernel.org
X-Gm-Message-State: AOJu0YztOdqhWSh7PQyLpf9XUqFJNG0u6ke+o0aio83w+uWZiVLuZkYq
	dxsHx37QWibIz97hPXKtMqLD4GTtBYeqv0mej3aCmoY2LHKbcwcHgCU/oIQ0MMv3dPc2E7zB4st
	2C5MJbFTH15ZxnCqTeMZHruKKQuGBcd6d54Y/PMJ7mhF2GeNg0oJg2LcpmgGSunjGfuRv
X-Gm-Gg: AR+sD13J/NwCO2TjAEy6IZrp0yGs6gIs6bavoyhcIEWMsb8fN/Ibe+Bns59PoNLbm+L
	mTVGRUSdScmXTSRUP2dDpRBe+WrtdcFBGUW9zL9caeG5kV4LeHfo/XQrIYaCq2AcwahCmVpgny0
	3ffeQECJheENnK6NUbs4eW36Y9lmTVyI3A++znDvwa14XtOI82Xi6ynrVfLUfQmZPLerFMfkJ4B
	1SP4uJrFh1qkY5saMB/LAZq6cm9zqN7n0Fr5PBCYhcHzfGvepIZ43LvG7CuyRQEm7DacuXq6tTa
	tCaYSLJazsAKEyVgAorZ4hGplhkpFrZNlRnQW24RnUYGWY7nY3S2Xq1tDWU083KtJP3RQXqIN7F
	n6V2UMs3N9Xuw2taRq26FZyEocS9UXOclo61Yqx3j1euoFcWkdx1JMxq7UUpZ
X-Received: by 2002:a05:6300:6d8e:20b0:3cc:841d:bb26 with SMTP id adf61e73a8af0-3cc841dbbedmr10012344637.15.1786884921237;
        Sun, 16 Aug 2026 05:55:21 -0700 (PDT)
X-Received: by 2002:a05:6300:6d8e:20b0:3cc:841d:bb26 with SMTP id adf61e73a8af0-3cc841dbbedmr10012315637.15.1786884920465;
        Sun, 16 Aug 2026 05:55:20 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141388bd5a7sm40072703c88.15.2026.08.16.05.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 05:55:20 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Yadu M G <yadu.mg@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v11 3/6] arm64: dts: qcom: Add device tree for Nord Embedded variant
Date: Sun, 16 Aug 2026 20:54:10 +0800
Message-ID: <20260816125413.1635150-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816125413.1635150-1-shengchao.guo@oss.qualcomm.com>
References: <20260816125413.1635150-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OZ6oyBTY c=1 sm=1 tr=0 ts=6a81b33a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=M_pxE5vcLJVX-WqgpTUA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: BBv0bfnVnIfeSlV2LXpl2aEZa2NWfOZI
X-Proofpoint-ORIG-GUID: BBv0bfnVnIfeSlV2LXpl2aEZa2NWfOZI
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDEwMSBTYWx0ZWRfXyVNFNW29YrL1
 qI4nIYnEbuD2i8gdjN98llkjNLDTxlsJOzJ8whyFLohGHxjXCme2tPZ/TsJW3DllpwQSlUf/zbm
 6ImYJfp4g18CIkvHBiScc1k65+QzqEc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDEwMSBTYWx0ZWRfXyWqWoFUcF05l
 xeztOoam/777JnUXmmHdq1vPd9iSwCvwujVMwu7mAI5ctos6VL8J8p5dcxC/il5lA0JrxHPz44H
 il0HVLPSyU+hRAUNdTb75fvAzphMjJnaB/CZQuDsVigTyc4atdh2+plqkla+hTaj0VYUDXfa+gb
 ThU6TOfyUoi4tUZfFN2KaJFSUu5gYRmzEAQ3chR1RP4VlOCgo3NvkhBAVAeAh2FvFJDvVbJbGqq
 OgEEBr6uc2TWJSJ1TwUC9ZkMKohjZBnZ9cKPjULqU9GBtE7kOEbwuk4NliVd2AnEwNlWGcqmmYc
 r0Kg2WSlwfvIjKHmR+KTzWZDRtk/+L+/j8ob2vwbUnHUmW1G8RbZTG/vF1nEiehCX46fEmI5YKl
 o1Slv/BaYYPtCWnQpV1I+Rukb9gZK8T6onEWyGngEtkfei17oOCz/hLH1/IEvzXuuEJI6ciW1nT
 Cvrje15FUYjy3P5/whA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608160101

Unlike the GearVM variant, Nord Embedded variant has platform resources
(clocks, regulators, powerdomains, pins, etc.) directly controlled by
the operating system. Add a separate dtsi file extending the existing
top-level nord.dtsi with nodes representing these peripherals as well as
describing how they are wired up with the already defined components.

Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 1726 +++++++++++++++++++
 1 file changed, 1726 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-embedded.dtsi

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
new file mode 100644
index 000000000000..faaf36dc8d31
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -0,0 +1,1726 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/clock/qcom,nord-gcc.h>
+#include <dt-bindings/clock/qcom,nord-negcc.h>
+#include <dt-bindings/clock/qcom,nord-nwgcc.h>
+#include <dt-bindings/clock/qcom,nord-segcc.h>
+#include <dt-bindings/clock/qcom,nord-tcsrcc.h>
+#include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/interconnect/qcom,icc.h>
+#include <dt-bindings/interconnect/qcom,nord-rpmh.h>
+#include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,rpmh-rsc.h>
+
+#include "nord.dtsi"
+
+/ {
+	clk_virt: interconnect-clk-virt {
+		compatible = "qcom,nord-clk-virt";
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	mc_virt: interconnect-mc-virt {
+		compatible = "qcom,nord-mc-virt";
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+};
+
+&crypto {
+	interconnects = <&aggre1_noc_tile MASTER_CRYPTO_CORE0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "memory";
+
+	status = "okay";
+};
+
+&i2c0 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S0_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_i2c0_default>;
+	pinctrl-names = "default";
+};
+
+&i2c1 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S1_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_i2c1_default>;
+	pinctrl-names = "default";
+};
+
+&i2c2 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S2_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_i2c2_default>;
+	pinctrl-names = "default";
+};
+
+&i2c3 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S3_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_i2c3_default>;
+	pinctrl-names = "default";
+};
+
+&i2c4 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S4_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_i2c4_default>;
+	pinctrl-names = "default";
+};
+
+&i2c5 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S5_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_i2c5_default>;
+	pinctrl-names = "default";
+};
+
+&i2c7 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S0_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_i2c7_default>;
+	pinctrl-names = "default";
+};
+
+&i2c8 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S1_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_i2c8_default>;
+	pinctrl-names = "default";
+};
+
+&i2c9 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S2_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_i2c9_default>;
+	pinctrl-names = "default";
+};
+
+&i2c10 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S3_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_i2c10_default>;
+	pinctrl-names = "default";
+};
+
+&i2c11 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S4_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_i2c11_default>;
+	pinctrl-names = "default";
+};
+
+&i2c12 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S5_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_i2c12_default>;
+	pinctrl-names = "default";
+};
+
+&i2c13 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S6_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_i2c13_default>;
+	pinctrl-names = "default";
+};
+
+&i2c14 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S0_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre1_noc_tile MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_i2c14_default>;
+	pinctrl-names = "default";
+};
+
+&i2c16 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S2_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre1_noc_tile MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_i2c16_default>;
+	pinctrl-names = "default";
+};
+
+&i2c17 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S3_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre1_noc_tile MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_i2c17_default>;
+	pinctrl-names = "default";
+};
+
+&i2c18 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S4_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre1_noc_tile MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_i2c18_default>;
+	pinctrl-names = "default";
+};
+
+&i2c19 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S5_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre1_noc_tile MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_i2c19_default>;
+	pinctrl-names = "default";
+};
+
+&i2c20 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S6_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre1_noc_tile MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_i2c20_default>;
+	pinctrl-names = "default";
+};
+
+&qupv3_0 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_M_AHB_CLK>,
+		 <&segcc SE_GCC_QUPV3_WRAP0_S_AHB_CLK>;
+	clock-names = "m-ahb", "s-ahb";
+};
+
+&qupv3_1 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_M_AHB_CLK>,
+		 <&segcc SE_GCC_QUPV3_WRAP1_S_AHB_CLK>;
+	clock-names = "m-ahb", "s-ahb";
+};
+
+&qupv3_2 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_M_AHB_CLK>,
+		 <&negcc NE_GCC_QUPV3_WRAP2_S_AHB_CLK>;
+	clock-names = "m-ahb",
+		      "s-ahb";
+};
+
+&spi0 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S0_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_spi0_default>;
+	pinctrl-names = "default";
+};
+
+&spi1 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S1_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_spi1_default>;
+	pinctrl-names = "default";
+};
+
+&spi2 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S2_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_spi2_default>;
+	pinctrl-names = "default";
+};
+
+&spi3 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S3_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_spi3_default>;
+	pinctrl-names = "default";
+};
+
+&spi4 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S4_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_spi4_default>;
+	pinctrl-names = "default";
+};
+
+&spi5 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S5_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_spi5_default>;
+	pinctrl-names = "default";
+};
+
+&spi7 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S0_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_spi7_default>;
+	pinctrl-names = "default";
+};
+
+&spi8 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S1_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_spi8_default>;
+	pinctrl-names = "default";
+};
+
+&spi11 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S4_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_spi11_default>;
+	pinctrl-names = "default";
+};
+
+&spi12 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S5_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_spi12_default>;
+	pinctrl-names = "default";
+};
+
+&spi13 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S6_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_spi13_default>;
+	pinctrl-names = "default";
+};
+
+&spi14 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S0_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre1_noc_tile MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_spi14_default>;
+	pinctrl-names = "default";
+};
+
+&spi16 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S2_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre1_noc_tile MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_spi16_default>;
+	pinctrl-names = "default";
+};
+
+&spi17 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S3_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre1_noc_tile MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_spi17_default>;
+	pinctrl-names = "default";
+};
+
+&spi18 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S4_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre1_noc_tile MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_spi18_default>;
+	pinctrl-names = "default";
+};
+
+&spi19 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S5_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre1_noc_tile MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_spi19_default>;
+	pinctrl-names = "default";
+};
+
+&spi20 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S6_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre1_noc_tile MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_spi20_default>;
+	pinctrl-names = "default";
+};
+
+&soc {
+	gcc: clock-controller@100000 {
+		compatible = "qcom,nord-gcc";
+		reg = <0x0 0x00100000 0x0 0x1f4200>;
+		clocks = <&bi_tcxo_div2>,
+			 <&sleep_clk>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
+	cnoc_main: interconnect@1500000 {
+		compatible = "qcom,nord-cnoc-main";
+		reg = <0x0 0x01500000 0x0 0x1d200>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	config_noc: interconnect@1600000 {
+		compatible = "qcom,nord-cnoc-cfg";
+		reg = <0x0 0x01600000 0x0 0xd200>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	system_noc: interconnect@1680000 {
+		compatible = "qcom,nord-system-noc";
+		reg = <0x0 0x01680000 0x0 0x1c080>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	aggre2_noc_tile: interconnect@16c0000 {
+		compatible = "qcom,nord-aggre2-noc-tile";
+		reg = <0x0 0x016c0000 0x0 0x1b400>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	aggre1_noc: interconnect@16e0000 {
+		compatible = "qcom,nord-aggre1-noc";
+		reg = <0x0 0x016e0000 0x0 0x1c400>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	aggre2_noc: interconnect@1700000 {
+		compatible = "qcom,nord-aggre2-noc";
+		reg = <0x0 0x01700000 0x0 0x1b400>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+		clocks = <&rpmhcc RPMH_IPA_CLK>;
+	};
+
+	aggre1_noc_tile: interconnect@1720000 {
+		compatible = "qcom,nord-aggre1-noc-tile";
+		reg = <0x0 0x01720000 0x0 0x23400>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+		clocks = <&negcc NE_GCC_AGGRE_NOC_USB2_AXI_CLK>,
+			 <&negcc NE_GCC_AGGRE_NOC_USB3_PRIM_AXI_CLK>,
+			 <&negcc NE_GCC_AGGRE_NOC_USB3_SEC_AXI_CLK>,
+			 <&negcc NE_GCC_AGGRE_NOC_UFS_PHY_AXI_CLK>;
+	};
+
+	mmss_noc: interconnect@1780000 {
+		compatible = "qcom,nord-mmss-noc";
+		reg = <0x0 0x01780000 0x0 0x72800>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	pcie_cfg: interconnect@1ba0000 {
+		compatible = "qcom,nord-pcie-cfg";
+		reg = <0x0 0x01ba0000 0x0 0x7200>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	pcie_data_outbound: interconnect@1bc0000 {
+		compatible = "qcom,nord-pcie-data-outbound";
+		reg = <0x0 0x01bc0000 0x0 0x17000>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	pcie_data_inbound: interconnect@1c00000 {
+		compatible = "qcom,nord-pcie-data-inbound";
+		reg = <0x0 0x01c00000 0x0 0x4b080>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	ufs_mem_phy: phy@1d40000 {
+		compatible = "qcom,nord-qmp-ufs-phy",
+			     "qcom,sm8650-qmp-ufs-phy";
+		reg = <0x0 0x01d40000 0x0 0x2000>;
+
+		clocks = <&rpmhcc RPMH_CXO_CLK>,
+			 <&negcc NE_GCC_UFS_PHY_PHY_AUX_CLK>,
+			 <&tcsrcc TCSR_UFS_CLKREF_EN>;
+		clock-names = "ref",
+			      "ref_aux",
+			      "qref";
+
+		resets = <&ufs_mem_hc 0>;
+		reset-names = "ufsphy";
+
+		power-domains = <&negcc NE_GCC_UFS_MEM_PHY_GDSC>;
+		#clock-cells = <1>;
+		#phy-cells = <0>;
+
+		status = "disabled";
+	};
+
+	ice: crypto@1d48000 {
+		compatible = "qcom,nord-inline-crypto-engine",
+			     "qcom,inline-crypto-engine";
+		reg = <0x0 0x01d48000 0x0 0x18000>;
+		clocks = <&negcc NE_GCC_UFS_PHY_ICE_CORE_CLK>,
+			 <&negcc NE_GCC_UFS_PHY_AHB_CLK>;
+		clock-names = "core",
+			      "iface";
+		power-domains = <&negcc NE_GCC_UFS_PHY_GDSC>;
+	};
+
+	hscnoc: interconnect@2000000 {
+		compatible = "qcom,nord-hscnoc";
+		reg = <0x0 0x02000000 0x0 0xb22000>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	hpass_ag_noc: interconnect@5fc0000 {
+		compatible = "qcom,nord-hpass-ag-noc";
+		reg = <0x0  0x05fc0000 0x0 0x37080>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	negcc: clock-controller@8900000 {
+		compatible = "qcom,nord-negcc";
+		reg = <0x0 0x08900000 0x0 0xf4200>;
+		clocks = <&bi_tcxo_div2>,
+			 <&sleep_clk>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
+	segcc: clock-controller@8a00000 {
+		compatible = "qcom,nord-segcc";
+		reg = <0x0 0x08a00000 0x0 0xf4200>;
+		clocks = <&bi_tcxo_div2>,
+			 <&sleep_clk>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
+	nwgcc: clock-controller@8b00000 {
+		compatible = "qcom,nord-nwgcc";
+		reg = <0x0 0x08b00000 0x0 0xf4200>;
+		clocks = <&bi_tcxo_div2>,
+			 <&sleep_clk>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
+	tcsrcc: clock-controller@f1d9000 {
+		compatible = "qcom,nord-tcsrcc",
+			     "syscon";
+		reg = <0x0 0x0f1d9000 0x0 0xf00c>;
+		clocks = <&rpmhcc RPMH_CXO_CLK>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+	};
+
+	apps_rsc: rsc@18900000 {
+		compatible = "qcom,rpmh-rsc";
+		reg = <0x0 0x18900000 0x0 0x10000>,
+		      <0x0 0x18910000 0x0 0x10000>,
+		      <0x0 0x18920000 0x0 0x10000>;
+		reg-names = "drv-0",
+			    "drv-1",
+			    "drv-2";
+		interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+		qcom,tcs-offset = <0xd00>;
+		qcom,drv-id = <2>;
+		qcom,tcs-config = <ACTIVE_TCS 3>,
+				  <SLEEP_TCS 2>,
+				  <WAKE_TCS 2>,
+				  <CONTROL_TCS 0>;
+		label = "apps_rsc";
+		power-domains = <&system_pd>;
+
+		apps_bcm_voter: bcm-voter {
+			compatible = "qcom,bcm-voter";
+		};
+
+		rpmhcc: clock-controller {
+			compatible = "qcom,nord-rpmh-clk";
+			clocks = <&xo_board>;
+			clock-names = "xo";
+			#clock-cells = <1>;
+		};
+
+		rpmhpd: power-controller {
+			compatible = "qcom,nord-rpmhpd";
+			#power-domain-cells = <1>;
+			operating-points-v2 = <&rpmhpd_opp_table>;
+
+			rpmhpd_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				rpmhpd_opp_ret: opp-0 {
+					opp-level = <RPMH_REGULATOR_LEVEL_RETENTION>;
+				};
+
+				rpmhpd_opp_min_svs: opp-1 {
+					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+				};
+
+				rpmhpd_opp_low_svs: opp-2 {
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+				};
+
+				rpmhpd_opp_svs: opp-3 {
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+				};
+
+				rpmhpd_opp_svs_l1: opp-4 {
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+				};
+
+				rpmhpd_opp_nom: opp-5 {
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+				};
+
+				rpmhpd_opp_nom_l1: opp-6 {
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+				};
+
+				rpmhpd_opp_nom_l2: opp-7 {
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
+				};
+
+				rpmhpd_opp_turbo: opp-8 {
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+				};
+
+				rpmhpd_opp_turbo_l1: opp-9 {
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+				};
+			};
+		};
+	};
+
+	nsp_data_noc_0: interconnect@1f200000 {
+		compatible = "qcom,nord-nsp-data-noc-0";
+		reg = <0x0 0x1f200000 0x0 0x2a200>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	nsp_data_noc_1: interconnect@1f600000 {
+		compatible = "qcom,nord-nsp-data-noc-1";
+		reg = <0x0 0x1f600000 0x0 0x2a200>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	nsp_data_noc_2: interconnect@1fa00000 {
+		compatible = "qcom,nord-nsp-data-noc-2";
+		reg = <0x0 0x1fa00000 0x0 0x2a200>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	nsp_data_noc_3: interconnect@1fe00000 {
+		compatible = "qcom,nord-nsp-data-noc-3";
+		reg = <0x0 0x1fe00000 0x0 0x2a200>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+};
+
+&tlmm {
+	qup_i2c0_default: qup-i2c0-default-state {
+		pins = "gpio111", "gpio112";
+		function = "qup0_se0";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c1_default: qup-i2c1-default-state {
+		pins = "gpio111", "gpio112";
+		function = "qup0_se1";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c2_default: qup-i2c2-default-state {
+		pins = "gpio113", "gpio114";
+		function = "qup0_se2";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c3_default: qup-i2c3-default-state {
+		pins = "gpio115", "gpio116";
+		function = "qup0_se3";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c4_default: qup-i2c4-default-state {
+		pins = "gpio117", "gpio118";
+		function = "qup0_se4";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c5_default: qup-i2c5-default-state {
+		pins = "gpio121", "gpio122";
+		function = "qup0_se5";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c7_default: qup-i2c7-default-state {
+		pins = "gpio123", "gpio124";
+		function = "qup1_se0";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c8_default: qup-i2c8-default-state {
+		pins = "gpio125", "gpio126";
+		function = "qup1_se1";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c9_default: qup-i2c9-default-state {
+		pins = "gpio127", "gpio128";
+		function = "qup1_se2";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c10_default: qup-i2c10-default-state {
+		pins = "gpio129", "gpio130";
+		function = "qup1_se3";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c11_default: qup-i2c11-default-state {
+		pins = "gpio131", "gpio132";
+		function = "qup1_se4";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c12_default: qup-i2c12-default-state {
+		pins = "gpio133", "gpio134";
+		function = "qup1_se5";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c13_default: qup-i2c13-default-state {
+		pins = "gpio137", "gpio138";
+		function = "qup1_se6";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c14_default: qup-i2c14-default-state {
+		pins = "gpio139", "gpio140";
+		function = "qup2_se0";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c16_default: qup-i2c16-default-state {
+		pins = "gpio145", "gpio146";
+		function = "qup2_se2";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c17_default: qup-i2c17-default-state {
+		pins = "gpio150", "gpio151";
+		function = "qup2_se3";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c18_default: qup-i2c18-default-state {
+		pins = "gpio154", "gpio155";
+		function = "qup2_se4";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c19_default: qup-i2c19-default-state {
+		pins = "gpio156", "gpio157";
+		function = "qup2_se5";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c20_default: qup-i2c20-default-state {
+		pins = "gpio158", "gpio159";
+		function = "qup2_se6";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_spi0_default: qup-spi0-default-state {
+		data-pins {
+			pins = "gpio109", "gpio111", "gpio112";
+			function = "qup0_se0";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio110";
+			function = "qup0_se0";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi1_default: qup-spi1-default-state {
+		data-pins {
+			pins = "gpio109", "gpio111", "gpio112";
+			function = "qup0_se1";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio110";
+			function = "qup0_se1";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi2_default: qup-spi2-default-state {
+		data-pins {
+			pins = "gpio113", "gpio114", "gpio115";
+			function = "qup0_se2";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio116";
+			function = "qup0_se2";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi3_default: qup-spi3-default-state {
+		data-pins {
+			pins = "gpio113", "gpio115", "gpio116";
+			function = "qup0_se3";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio114";
+			function = "qup0_se3";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi4_default: qup-spi4-default-state {
+		data-pins {
+			pins = "gpio117", "gpio118", "gpio119";
+			function = "qup0_se4";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio120";
+			function = "qup0_se4";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi5_default: qup-spi5-default-state {
+		data-pins {
+			pins = "gpio109", "gpio121", "gpio122";
+			function = "qup0_se5";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio110";
+			function = "qup0_se5";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi7_default: qup-spi7-default-state {
+		data-pins {
+			pins = "gpio123", "gpio124", "gpio125";
+			function = "qup1_se0";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio126";
+			function = "qup1_se0";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi8_default: qup-spi8-default-state {
+		data-pins {
+			pins = "gpio123", "gpio125", "gpio126";
+			function = "qup1_se1";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio124";
+			function = "qup1_se1";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi11_default: qup-spi11-default-state {
+		data-pins {
+			pins = "gpio131", "gpio132", "gpio137";
+			function = "qup1_se4";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio138";
+			function = "qup1_se4";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi12_default: qup-spi12-default-state {
+		data-pins {
+			pins = "gpio133", "gpio134", "gpio135";
+			function = "qup1_se5";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio136";
+			function = "qup1_se5";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi13_default: qup-spi13-default-state {
+		data-pins {
+			pins = "gpio131", "gpio137", "gpio138";
+			function = "qup1_se6";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio132";
+			function = "qup1_se6";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi14_default: qup-spi14-default-state {
+		data-pins {
+			pins = "gpio139", "gpio140", "gpio141";
+			function = "qup2_se0";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio142";
+			function = "qup2_se0";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi16_default: qup-spi16-default-state {
+		data-pins {
+			pins = "gpio145", "gpio146", "gpio147";
+			function = "qup2_se2";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio148";
+			function = "qup2_se2";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi17_default: qup-spi17-default-state {
+		data-pins {
+			pins = "gpio150", "gpio151", "gpio152";
+			function = "qup2_se3";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio153";
+			function = "qup2_se3";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi18_default: qup-spi18-default-state {
+		data-pins {
+			pins = "gpio143", "gpio154", "gpio155";
+			function = "qup2_se4";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio144";
+			function = "qup2_se4";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi19_default: qup-spi19-default-state {
+		data-pins {
+			pins = "gpio156", "gpio157", "gpio158";
+			function = "qup2_se5";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio159";
+			function = "qup2_se5";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi20_default: qup-spi20-default-state {
+		data-pins {
+			pins = "gpio156", "gpio158", "gpio159";
+			function = "qup2_se6";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio157";
+			function = "qup2_se6";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_uart0_default: qup-uart0-default-state {
+		pins = "gpio109", "gpio110";
+		function = "qup0_se0";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart1_default: qup-uart1-default-state {
+		pins = "gpio109", "gpio110";
+		function = "qup0_se1";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart2_default: qup-uart2-default-state {
+		pins = "gpio115", "gpio116";
+		function = "qup0_se2";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart3_default: qup-uart3-default-state {
+		pins = "gpio113", "gpio114";
+		function = "qup0_se3";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart4_default: qup-uart4-default-state {
+		pins = "gpio119", "gpio120";
+		function = "qup0_se4";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart5_default: qup-uart5-default-state {
+		pins = "gpio109", "gpio110";
+		function = "qup0_se5";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart7_default: qup-uart7-default-state {
+		pins = "gpio125", "gpio126";
+		function = "qup1_se0";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart8_default: qup-uart8-default-state {
+		pins = "gpio123", "gpio124";
+		function = "qup1_se1";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart9_default: qup-uart9-default-state {
+		pins = "gpio127", "gpio128";
+		function = "qup1_se2";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart10_default: qup-uart10-default-state {
+		pins = "gpio129", "gpio130";
+		function = "qup1_se3";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart11_default: qup-uart11-default-state {
+		pins = "gpio137", "gpio138";
+		function = "qup1_se4";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart12_default: qup-uart12-default-state {
+		pins = "gpio135", "gpio136";
+		function = "qup1_se5";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart13_default: qup-uart13-default-state {
+		pins = "gpio131", "gpio132";
+		function = "qup1_se6";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart14_default: qup-uart14-default-state {
+		pins = "gpio141", "gpio142";
+		function = "qup2_se0";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart15_default: qup-uart15-default-state {
+		pins = "gpio143", "gpio144";
+		function = "qup2_se1";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart16_default: qup-uart16-default-state {
+		pins = "gpio147", "gpio148";
+		function = "qup2_se2";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart17_default: qup-uart17-default-state {
+		pins = "gpio150", "gpio151", "gpio152", "gpio153";
+		function = "qup2_se3";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart18_default: qup-uart18-default-state {
+		pins = "gpio143", "gpio144";
+		function = "qup2_se4";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart19_default: qup-uart19-default-state {
+		pins = "gpio158", "gpio159";
+		function = "qup2_se5";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart20_default: qup-uart20-default-state {
+		pins = "gpio156", "gpio157";
+		function = "qup2_se6";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
+&uart0 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S0_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	pinctrl-0 = <&qup_uart0_default>;
+	pinctrl-names = "default";
+};
+
+&uart1 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S1_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	pinctrl-0 = <&qup_uart1_default>;
+	pinctrl-names = "default";
+};
+
+&uart2 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S2_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	pinctrl-0 = <&qup_uart2_default>;
+	pinctrl-names = "default";
+};
+
+&uart3 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S3_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	pinctrl-0 = <&qup_uart3_default>;
+	pinctrl-names = "default";
+};
+
+&uart4 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S4_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	pinctrl-0 = <&qup_uart4_default>;
+	pinctrl-names = "default";
+};
+
+&uart5 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S5_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	pinctrl-0 = <&qup_uart5_default>;
+	pinctrl-names = "default";
+};
+
+&uart7 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S0_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	pinctrl-0 = <&qup_uart7_default>;
+	pinctrl-names = "default";
+};
+
+&uart8 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S1_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	pinctrl-0 = <&qup_uart8_default>;
+	pinctrl-names = "default";
+};
+
+&uart9 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S2_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	pinctrl-0 = <&qup_uart9_default>;
+	pinctrl-names = "default";
+};
+
+&uart10 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S3_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	pinctrl-0 = <&qup_uart10_default>;
+	pinctrl-names = "default";
+};
+
+&uart11 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S4_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	pinctrl-0 = <&qup_uart11_default>;
+	pinctrl-names = "default";
+};
+
+&uart12 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S5_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	pinctrl-0 = <&qup_uart12_default>;
+	pinctrl-names = "default";
+};
+
+&uart13 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S6_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	pinctrl-0 = <&qup_uart13_default>;
+	pinctrl-names = "default";
+};
+
+&uart14 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S0_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	pinctrl-0 = <&qup_uart14_default>;
+	pinctrl-names = "default";
+};
+
+&uart15 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S1_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	pinctrl-0 = <&qup_uart15_default>;
+	pinctrl-names = "default";
+};
+
+&uart16 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S2_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	pinctrl-0 = <&qup_uart16_default>;
+	pinctrl-names = "default";
+};
+
+&uart17 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S3_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	pinctrl-0 = <&qup_uart17_default>;
+	pinctrl-names = "default";
+};
+
+&uart18 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S4_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	pinctrl-0 = <&qup_uart18_default>;
+	pinctrl-names = "default";
+};
+
+&uart19 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S5_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	pinctrl-0 = <&qup_uart19_default>;
+	pinctrl-names = "default";
+};
+
+&uart20 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S6_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	pinctrl-0 = <&qup_uart20_default>;
+	pinctrl-names = "default";
+};
+
+&ufs_mem_hc {
+	clocks = <&negcc NE_GCC_UFS_PHY_AXI_CLK>,
+		 <&negcc NE_GCC_AGGRE_NOC_UFS_PHY_AXI_CLK>,
+		 <&negcc NE_GCC_UFS_PHY_AHB_CLK>,
+		 <&negcc NE_GCC_UFS_PHY_UNIPRO_CORE_CLK>,
+		 <&tcsrcc TCSR_UFS_CLKREF_EN>,
+		 <&negcc NE_GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
+		 <&negcc NE_GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
+		 <&negcc NE_GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
+	clock-names = "core_clk",
+		      "bus_aggr_clk",
+		      "iface_clk",
+		      "core_clk_unipro",
+		      "ref_clk",
+		      "tx_lane0_sync_clk",
+		      "rx_lane0_sync_clk",
+		      "rx_lane1_sync_clk";
+
+	resets = <&negcc NE_GCC_UFS_PHY_BCR>;
+	reset-names = "rst";
+
+	interconnects = <&aggre1_noc_tile MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+			 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+	interconnect-names = "ufs-ddr",
+			     "cpu-ufs";
+
+	phys = <&ufs_mem_phy>;
+	phy-names = "ufsphy";
+
+	power-domains = <&negcc NE_GCC_UFS_PHY_GDSC>;
+	operating-points-v2 = <&ufs_opp_table>;
+	required-opps = <&rpmhpd_opp_nom>;
+	qcom,ice = <&ice>;
+	#reset-cells = <1>;
+
+	ufs_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-100000000 {
+			opp-hz = /bits/ 64 <100000000>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <100000000>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <0>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-201500000 {
+			opp-hz = /bits/ 64 <201500000>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <201500000>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <0>;
+			required-opps = <&rpmhpd_opp_svs>;
+		};
+
+		opp-403000000 {
+			opp-hz = /bits/ 64 <403000000>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <403000000>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <0>;
+			required-opps = <&rpmhpd_opp_nom>;
+		};
+	};
+};
-- 
2.43.0

