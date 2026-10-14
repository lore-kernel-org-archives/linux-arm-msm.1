Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5997144F563
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 06:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960091; cv=none; b=neIhv+K5fN5/rYgvq8WAI//2Q5sApCZX6bTHZSvYefgsZLs5/Tp52avSyJnKRZgMr6ELkmb9mwyffxt50lquEMLxcf1pZfLQhl9U8gkvY4G0a21AymzTVy+h8JfUtDZuWf3kZQHqgO8FTnOqYVYmuenJuzhomsS1ooN2/pCvITQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960091; c=relaxed/simple;
	bh=hchppVroUkRorWMoutz+kcZx45NJ7MyeESC9hFuj8Ik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EtKbx7qvCvwDRt2o4VUCZjW30GJbD3VooQ8KrINRijzbTLd8KkpMkXGK15hVUkWlOTy+u3R2VPGnj2anBPfy1yGAGdAqm2HCX2oi4ZV2e5RM2vocCT+Ha+dFE1r8UMsxiVFufiH1DGt1n/1ncxbz9zNPJowhpUrK+wmcgXf3BIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W9jiWl7J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TJiD5WHw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W9jiWl7J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TJiD5WHw"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DND9hC2088499
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 06:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bkBGSvWvFcf
	RSQVZpJhmqfFYy3LVXPMliyZvNwhtEoA=; b=W9jiWl7JovhpCDZnlUzEkHTdLrP
	lGu9UP0vidTAYYynF6H8rI6dLvVYa3jWLOnsk9HRO+1KEUTN3W2qox9lr8fxO0Pw
	7jHSzT9zqmdti+WxeDlUgYocV9wSq3ShRo+xznRZtVI2jrm49z0Mu/414bRfP0vf
	B9mwPio34Yf6vPRf/8FPkUHXNKYXWZKRW60tiwqygQmHjrCVIz2pvFG4Nj3t5FYK
	lD5jHoJmZbKnPiR3f2hIfiSWE/198o5mf98c7agrFBEDm9CzFEAhrIsNHpu1jN89
	zQpO2pnGbbCACjsagjkEbAbOM9Id/WkmAIWUtv47io+PTolOlWit/BBM9GA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9x49hds0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 06:41:27 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-88a1de72cf7so5292772b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 23:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791960087; x=1792564887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bkBGSvWvFcfRSQVZpJhmqfFYy3LVXPMliyZvNwhtEoA=;
        b=TJiD5WHwJ27nYq9t0wYoKCDV4SrHHmaY32BzWAC9HiWEpiEXPaJWhQa7/qwR9rwVa0
         0MT15+qR7lOg08pFzS8jl5x9RZ+7HQuGytC7HA4FHTE48z6kJaZl1vlmd7ovNJWfPYtV
         RXXDZtetMbp0DiK7tqnadAQNMnxmgQpLWr8ufXv5e5jDIJ/Z2kbkLp4FyEnwmYAAHmFa
         ikdR2VGbMkYEm5zI6926S+LRWMX9e6NhY6KoO45rwnmnKNKzwCC3XUZfJuopZcEseviA
         Mvh9Aj0AddAAlAqHzx80loMOpgoSLGy72yq/y+AdCuBDqBznDuiY6Zt9djFIIQ+W8anb
         x8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791960087; x=1792564887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bkBGSvWvFcfRSQVZpJhmqfFYy3LVXPMliyZvNwhtEoA=;
        b=W64T/ZO28UngHpk/221IRgS4OXim0dDUpkpkEJBipPTrMLU3LfeSivGDSWwHUqI+yn
         GTJKpEDdwjUsf3yjFxpvCyrM2mpUhrI0L8CSDRX1aAhE/2Z8Px2nwJh8jR3BhfiIyeVD
         IzDGTT1MCOZ0+KE60yPrC64//w4hBZTWOpN5VQ/zXn5WrFatyGsjGI+GZNrgLJOgbVSA
         fxyTqtlyOmfzjs/ocju2L5eJTLpSmsQ5RpSzSs8S6FvuvIFlX5JE5IOV0sH2QQAADmxZ
         7esBXkzxIvAYTouhrvstZ8bCx8NnNoA7nZGuQgSGbjpwhJX2GgxP/JERyEnU0yoxZloS
         AdnA==
X-Forwarded-Encrypted: i=1; AKwUvBywEAVPAEJxk97PKhPDucYKw/MlFDwDQJAwI7l02KhIxAEjAktXgl9CKaQAtrVIvybJhDZ5zqCbmp2hPTGa@vger.kernel.org
X-Gm-Message-State: AFq9FYL6ua/OoRZw1YpQQoqDdGXBgFTUbyHIr4/2fkuKYX55DuVHPC8R
	f6j+Gm0LP81VaITDQx6w4Oucs9bGvzfcKGE+VDq2CFHsdVw9A2Bsa75HCusDpNG/brdzBb5PsV/
	AhnjtgQU1pp91fnaq6GKamMtca7Zm+SokVd0Rs2coOn8fGlcLEMMpsL5QKTw3nhq0i68E
X-Gm-Gg: AYBFou0np/TO1jM51vHIgVNlL4ZU16Yg+2qo052woFNgC/2qH+DsjhqFlzFIaN6EVO3
	um0wm3C4OoyOdwxrZ84KoWIr//EcOt8rOeKhoDpw0k0trrjeom9W98m1tRKbT/k4cFQ9GUzWH2A
	MWQ/+FHZabjVUrE8ftUVuuVp8lWtUI6LNoVGHvHJUgFnURoHNnYm5strQtyd0HLWu4e+5UoNPKC
	7PY9M0ia9B+iiBpA90Mo17n2YNMYgWNSB12rD1ClABD2g/WETw9oUd2zWBN8vJAhc10PGq2Gh8X
	shJ9KK9uW/xOqL+GPvKzKlXUUhY8p0obMVApdl2F2JaE8dkCjxG13z/521hyJGargM2FbeEVolx
	7288EQeFdRhOTIdAQAm3vL4diX7a/ltkDMT63Wvm1xEWtTbt8/Esm/bk4xwY=
X-Received: by 2002:a05:6a00:1a16:b0:837:f111:b70 with SMTP id d2e1a72fcca58-896898e695cmr8139848b3a.4.1791960086650;
        Tue, 13 Oct 2026 23:41:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:1a16:b0:837:f111:b70 with SMTP id d2e1a72fcca58-896898e695cmr8139833b3a.4.1791960086032;
        Tue, 13 Oct 2026 23:41:26 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d7f518b8asm733221b3a.2.2026.10.13.23.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:41:25 -0700 (PDT)
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 5/7] arm64: dts: qcom: nord: Add PMAU0102 and PMM8650AU PMIC support
Date: Wed, 14 Oct 2026 14:39:50 +0800
Message-ID: <20261014063953.549379-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014063953.549379-1-shengchao.guo@oss.qualcomm.com>
References: <20261014063953.549379-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YJcKWhGx c=1 sm=1 tr=0 ts=6acf2417 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=hucZloQI8G6bWT6_XmMA:9 a=U2nuDi6JAHPDsfF0:21 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyNiBTYWx0ZWRfXwTsGMqTay6ov
 I8AFW8p+rZG0KeCat43NHX8Al7OIFPIFIoIizkCAafJUYq01yo2CJnDF7MyIF+GbPCcwOS1uWtJ
 7wkpT/PDup0vjFNI26rX4sLEbKSQJsq4FODWPmoLQxi6t7Q81NWEc+xy1BG1zgXmlFfqF0EUCxd
 9yBnLnLHO0NwAafV3Hgw3fwecPVaFOocZs02XyljP1jKYUEfpDRkfUMdWiYN7+IcdzOcdH/wx+T
 vQsR4loUVwj+QhPNqzDTroVW+7egNNWOAOMPwpZIZSz+EH7G37zzOZZvjKg1z2ILz2ZSDrfW7Ya
 z5QpVzWnPXhKg0cC0Kfgn7VOquYjOvgZyB7esVCd1v55r4q1JO/og6qVMciUTq6E5IBDxNeutEG
 1I/5guBt9kb9lzqXQ7SI5eV0YC2VA7JJ+7Q9U5b9eRr9aPVkSMkv9qHIV0QKqOwAeBQNDoNc47a
 4I0MDlDcsUBed6a+Lng==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyNiBTYWx0ZWRfXwOSsNROQcRrr
 cRhtW8wACtB2Fy8+I76Et1H0WUygEr5NdxsiMY/qIpZ83MYaGgUS+ZMG3gfawYhsG/jB1qsmObc
 KByyvxfKwDDK2t1zBZXJ+eaCrFM6etw=
X-Proofpoint-GUID: y5VZIXWijlsdGZue5R6rXr4OHFgB3bEW
X-Proofpoint-ORIG-GUID: y5VZIXWijlsdGZue5R6rXr4OHFgB3bEW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140026

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
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts        |   2 +
 arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi  | 543 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmm8650au-nord.dtsi |  54 ++
 3 files changed, 599 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmm8650au-nord.dtsi

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 0b0acd33a2e1..47978df0af92 100644
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

