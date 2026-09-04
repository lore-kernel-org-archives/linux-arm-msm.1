Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFA63E95A4
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 08:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788509827; cv=none; b=rbvxwzFo6ZZEl2fYKjC7cWUK7MPmrqXiaABoez1Aj1iigw3U8DbrLaWunInVefX4b94uTE4qPY6AgSUtG/x/LgujRM8AhLRH98KfzRBraPz1vGIrDcVd//eHfpyRZeIixtXLz5kkNKVr8ntygK0YpqAwj0cy7eMMAiF9fW+WbWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788509827; c=relaxed/simple;
	bh=oSkWX742SllJFSnay7tGrdAJfHOtznaO/nrB8oj8uDY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mr61OR5lQC0+xYKnCV5yVr0cdxkrrZLBSDPLnfGLlWH/4dNbOfm3VR0iXALchjqO0CcIfNYwEaT47DUI3mCTtAqXWVZve09Er9kOIJfzCI2Vkuz5wNL24B5i2Fo6z5Oyhjp6K+XTN0G+l1ProxxmbeWOfVBlQ1C5fZgHocP1ACo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kkoWHSma; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i+XvktPf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kkoWHSma";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i+XvktPf"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847n4Q22976862
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Sep 2026 08:17:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PDjQ0m7c3tE
	65mKCQK0Qwk7l8KC0zsHSqCHJspWMHqA=; b=kkoWHSmalK1lKPwThBO+Qy9SvXh
	VBZAX7KbTqwyYhTzQ8gfSsrry/HYKa6r5AoyIC2AuAJ7R0Bs16BEnoXDIOFo7hcd
	/Nxz318Z6keMIAantqyTFGL/Q3tgH6yYoS0a5CHfOQzEhjuMml/8H6f+YV6bpEwQ
	4R5G13CF7b3kmQvDBnKVCO1SkztFrbE7h6uQudUVqFx3uCYnGoZNyK1UtS7Y58KB
	BCmqwsg3N6/XW+Ejis//xlSNRHoj78XBelKfMI9cyHJK4Xa5Ldk1JtL1IbOKnCMW
	fF/goWkp8/KT2fM28r+Zp+sXNO9SIAUlSMDA8Af4iO5xOrcH7RQ7MN9H7hQ==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfdyxjpcm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 08:17:04 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b1478e3546so573447eaf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 01:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788509824; x=1789114624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PDjQ0m7c3tE65mKCQK0Qwk7l8KC0zsHSqCHJspWMHqA=;
        b=i+XvktPfG6pHAY4NRQE54qkEW71fom+GCESOyG8/+Lv7uH7GVYYlfvqzZAUE0xWR1e
         FB0ljKjFpkH1KbqcbROrFJmDfNf5BvZlbSbj3MZqXpL9fYSn0rsWEWGhjRSAuQqjnIDG
         sRYe5N37qwnAfwjOlh6OxEn11NGFuRnwxt1sDoMKtJB2VNb2DSF1EEYmLmbd8Hozx12H
         nKdyA5UJ1UxwxHj4qMmhPFImxXmvFE8QiUHTog5gWSyCupUHCrp7XDeBYS0syWTSRDFL
         jxgiNGlkgDaXg7S0CEV/6TKNI6w2KrcWOPTT3IVAvLMPFT+VmWP9VdXVGSrbvr2cEZv3
         yn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788509824; x=1789114624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PDjQ0m7c3tE65mKCQK0Qwk7l8KC0zsHSqCHJspWMHqA=;
        b=pRqWlze0XgwEYcrB9cIVbpVkECnqPgByt1/ggGNxwrHMaJNg+10GuTMdbzfLScZOYo
         g8BANraPaSJyyVtBRoYRU0HuKrpTaNiEI5qcajGijHoUKzMHkxfTLi/Pa7GdhlakSj5W
         wCW1P5+JCY+691dS93Hv7fnHf4G/lZvLnvLQDlsOxc7GkhpXNDNJIGcb3ZGiHGgg8I3v
         6iWpk/AVSvJl2vxaSGQLcGdZCs17Kxz+CdrOAyPMgwmDjqnPDq3ZZRVySKrecXy0mi5o
         O/IYJLuSvKqnjlDj1XMeO53Nkr3aBR3lbslsPtZMS1K6vXJvMNxUq1G15tezZ1ptmrv/
         sUqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKeS2u2zLeaiFVNpnH6L2Ow1z1Brhmw47zclU29PwzBtVK/seyoplC4plByesz4SbfsuutM6ESYraS3eKB@vger.kernel.org
X-Gm-Message-State: AFuF++n5qfpMuHA46+3sEGNO4qvg1tBswgZyEH0z32fdhWbEXlOhexbg
	048JhFwDNV9je31s5u3E8FiSPM3ZhObqTmyvyta3dyYx2nh6953q4p2hfeURCROuMrJuUUK3bro
	zGVSHtJaYakR52cJ6R8lAvjsBRGODCyxkCtS1+oiYPb3Wrlu7UiNSFCtukBhB1y6tbknF
X-Gm-Gg: AYBFou1JVCyAPH6BMT4I9eLZj7QCyxo4wmWmLz4XHMZoYo35qZ8dJSOPhSqwbbBJt0o
	6SGvtGsH4LGxaOcXLzMjMKFph4Vswn1IgMJt7Ic38JXVrs71LfVwFiPVHo1USfm7+fvcmZLHvxA
	oqBwRX49c9aLO5h5mJ9EwuoKVnNg4NeYYDFc8/A05eWu16VohvJiN88IndPcQBh8Eai0v+h0F1G
	sk2rQZ1wDKoturG5EQlLu1MaqN91EmLhEaZhZ0BYruTk2JgBWSB2EBoe3hEQVwdlk/u+InkG/o+
	LtDDrOJ3ZehwGsuk9ufjxqF1RCXJcqliRqLwVpDx6tUPw2WOY4oRnmBOjKIcAIHTbVCvLTef61q
	YAKeMGxD6g+FcAS5e4dYVTTy9JIl4OnGYeWMkZa1HobNGUEjvV/Z43Un2F7d/
X-Received: by 2002:a4a:ec44:0:b0:6b1:bcdd:8898 with SMTP id 006d021491bc7-6b6f99d597amr3753219eaf.5.1788509822524;
        Fri, 04 Sep 2026 01:17:02 -0700 (PDT)
X-Received: by 2002:a4a:ec44:0:b0:6b1:bcdd:8898 with SMTP id 006d021491bc7-6b6f99d597amr3753189eaf.5.1788509822031;
        Fri, 04 Sep 2026 01:17:02 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm5466648eec.7.2026.09.04.01.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:17:01 -0700 (PDT)
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 6/6] arm64: dts: qcom: Add initial support for Nord Ride Embedded board
Date: Fri,  4 Sep 2026 16:16:19 +0800
Message-ID: <20260904081619.593602-7-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 7mJLPln4onb368-N5Rkgm5x34QNrAaM_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA3NSBTYWx0ZWRfX5mQ1cikeLwJH
 MUStjVpBCVNIRgvA1KFYF8UsE7bTMAADT0XUmK8hcT7qTxkx9w1sXpsE8tWHU5A0jg9cG+/oDu8
 LTAhK+ZSHws2h8+WHypHBx+WSbtSyWw=
X-Proofpoint-GUID: 7mJLPln4onb368-N5Rkgm5x34QNrAaM_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA3NSBTYWx0ZWRfX8+dMjPO2hq9J
 74gj95vW5HmdSRFygIhrVPMzteJLIYavNTwum6Zc+2a9YafIGtiEGqjhzVa0q0Mm+Z5Q/rcTet0
 f053VXsaSZcgY7kye+lw46NwV69UfTgz7KhHoBiQqvjv8hSnXwtrGGCD85PKBHk5F1dkFVS7pIi
 RFObYjlKTZXoSdTuc6tXNIhKHaeoChQaqt5Nxs/S6Q4JE8uDQ1FDTfYdJOoLdKpsrsgDBI6o9Zm
 yccJzaIeiN01XDRBLF4BSTfTZBe89qBWeTS1tAet68r1zZtExkl4REQ2s2aAg/HXCpMloseGSJS
 5PivSjM52XxBjtJXKT37wIoQ0hpA4F1I10lOcbrSRsv5kgTTEhWima0wYoBY3Pcw6cQu1mPN2iP
 t7CtOCm2E2zZirFl8CdLsTx1IBgVAzyz9S/tldJ6VVCn9G+JRDgJBujJNU14ZIT/ZprqUzLPe0y
 59wYDqNrsBdpngpppjg==
X-Authority-Analysis: v=2.4 cv=X9Zi7mTe c=1 sm=1 tr=0 ts=6a9a7e80 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=23L8-64gBmTLm0DN3gAA:9 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040075

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Add the initial device tree for the Nord Ride Embedded board, the
non-SCMI variant of the SA8797P automotive Ride board.

Enable the debug UART, UFS storage, the ADSP and CDSP remote processors,
and describe the board regulators supplied by the on-board PMICs.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/nord-ride-embedded.dts      | 442 ++++++++++++++++++
 2 files changed, 443 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index e4da48bbfd03..f151f8e18961 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -162,6 +162,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-maple.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-poplar.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-xiaomi-sagit.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= nord-ride.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= nord-ride-embedded.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= nord-rrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= purwa-iot-evk.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
new file mode 100644
index 000000000000..09ee525764ef
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -0,0 +1,442 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+#include "nord-embedded.dtsi"
+#include "pmau0102-nord.dtsi"
+#include "pmm8650au-nord.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. SA8797P Ride Embedded";
+	compatible = "qcom,sa8797p-ride-embedded", "qcom,nord";
+
+	aliases {
+		serial0 = &uart15;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	clocks {
+		xo_board: xo-board-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <38400000>;
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32000>;
+			#clock-cells = <0>;
+		};
+
+		bi_tcxo_div2: bi-tcxo-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+
+		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+			clocks = <&rpmhcc RPMH_CXO_CLK_A>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+	};
+};
+
+&apps_rsc {
+	/* PMIC A - Kobra_MM (PMM8650AU) - SID 0x0, Bus E0 */
+	regulators-0 {
+		compatible = "qcom,pmm8654au-rpmh-regulators";
+		qcom,pmic-id = "A_E0";
+
+		vreg_l4a_1p2: ldo4 {
+			regulator-name = "vreg_l4a_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6a_1p2: ldo6 {
+			regulator-name = "vreg_l6a_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7a_1p2: ldo7 {
+			regulator-name = "vreg_l7a_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8a_1p8: ldo8 {
+			regulator-name = "vreg_l8a_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s1a_vdd2h_l: smps1 {
+			regulator-name = "vreg_s1a_vdd2h_l";
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		vreg_s3a_1p8: smps3 {
+			regulator-name = "vreg_s3a_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		vreg_s5a_mv: smps5 {
+			regulator-name = "vreg_s5a_mv";
+			regulator-min-microvolt = <1328000>;
+			regulator-max-microvolt = <1370000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		vreg_s6a_vddq_l: smps6 {
+			regulator-name = "vreg_s6a_vddq_l";
+			regulator-min-microvolt = <500000>;
+			regulator-max-microvolt = <570000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	/* PMIC E - Kai_MV - SID 0x4, Bus E0 */
+	regulators-1 {
+		compatible = "qcom,pmau0102-rpmh-regulators";
+		qcom,pmic-id = "E_E0";
+
+		vreg_l1e_0p9: ldo1 {
+			regulator-name = "vreg_l1e_0p9";
+			regulator-min-microvolt = <936000>;
+			regulator-max-microvolt = <936000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2e_0p9: ldo2 {
+			regulator-name = "vreg_l2e_0p9";
+			regulator-min-microvolt = <936000>;
+			regulator-max-microvolt = <936000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3e_1p8: ldo3 {
+			regulator-name = "vreg_l3e_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	/* PMIC F - Kai_MV - SID 0x5, Bus E0 */
+	regulators-2 {
+		compatible = "qcom,pmau0102-rpmh-regulators";
+		qcom,pmic-id = "F_E0";
+
+		vreg_l1f_vdd2l: ldo1 {
+			regulator-name = "vreg_l1f_vdd2l";
+			regulator-min-microvolt = <904000>;
+			regulator-max-microvolt = <904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3f_vdd1: ldo3 {
+			regulator-name = "vreg_l3f_vdd1";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s7f_lv_sub: smps7 {
+			regulator-name = "vreg_s7f_lv_sub";
+			regulator-min-microvolt = <1036000>;
+			regulator-max-microvolt = <1136000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		vreg_s8f_vddq_h: smps8 {
+			regulator-name = "vreg_s8f_vddq_h";
+			regulator-min-microvolt = <500000>;
+			regulator-max-microvolt = <570000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	/* PMIC G - Kai_MV - SID 0x6, Bus E0 */
+	regulators-3 {
+		compatible = "qcom,pmau0102-rpmh-regulators";
+		qcom,pmic-id = "G_E0";
+
+		vreg_l2g_0p7: ldo2 {
+			regulator-name = "vreg_l2g_0p7";
+			regulator-min-microvolt = <752000>;
+			regulator-max-microvolt = <752000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s5g_vdd2h_h: smps5 {
+			regulator-name = "vreg_s5g_vdd2h_h";
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1150000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+	};
+
+	/* PMIC H - Kai_MV - SID 0x7, Bus E0 */
+	regulators-4 {
+		compatible = "qcom,pmau0102-rpmh-regulators";
+		qcom,pmic-id = "H_E0";
+
+		vreg_l1h_0p9: ldo1 {
+			regulator-name = "vreg_l1h_0p9";
+			regulator-min-microvolt = <904000>;
+			regulator-max-microvolt = <904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2h_1p2: ldo2 {
+			regulator-name = "vreg_l2h_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	/* PMIC I - Kai_MV - SID 0x8, Bus E0 */
+	regulators-5 {
+		compatible = "qcom,pmau0102-rpmh-regulators";
+		qcom,pmic-id = "I_E0";
+
+		vreg_l1i_0p9: ldo1 {
+			regulator-name = "vreg_l1i_0p9";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2i_1p2: ldo2 {
+			regulator-name = "vreg_l2i_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3i_2p5: ldo3 {
+			regulator-name = "vreg_l3i_2p5";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <2504000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	/* PMIC K - Kai_MV - SID 0xA, Bus E0 */
+	regulators-6 {
+		compatible = "qcom,pmau0102-rpmh-regulators";
+		qcom,pmic-id = "K_E0";
+
+		vreg_l1k_vdd2l: ldo1 {
+			regulator-name = "vreg_l1k_vdd2l";
+			regulator-min-microvolt = <904000>;
+			regulator-max-microvolt = <904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2k_0p9: ldo2 {
+			regulator-name = "vreg_l2k_0p9";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3k_vdd1: ldo3 {
+			regulator-name = "vreg_l3k_vdd1";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	/* PMIC L - Kai_MV - SID 0xB, Bus E0 */
+	regulators-7 {
+		compatible = "qcom,pmau0102-rpmh-regulators";
+		qcom,pmic-id = "L_E0";
+
+		vreg_l3l_1p8: ldo3 {
+			regulator-name = "vreg_l3l_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&qupv3_0 {
+	firmware-name = "qcom/nord/qupv3fw.elf";
+
+	status = "okay";
+};
+
+&qupv3_1 {
+	firmware-name = "qcom/nord/qupv3fw.elf";
+
+	status = "okay";
+};
+
+&qupv3_2 {
+	firmware-name = "qcom/nord/qupv3fw.elf";
+
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/nord/adsp.mbn",
+			"qcom/nord/adsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp0 {
+	firmware-name = "qcom/nord/cdsp.mbn",
+			"qcom/nord/cdsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp1 {
+	firmware-name = "qcom/nord/cdsp1.mbn",
+			"qcom/nord/cdsp1_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp2 {
+	firmware-name = "qcom/nord/cdsp2.mbn",
+			"qcom/nord/cdsp2_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp3 {
+	firmware-name = "qcom/nord/cdsp3.mbn",
+			"qcom/nord/cdsp3_dtbs.elf";
+
+	status = "okay";
+};
+
+&uart15 {
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 181 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l3i_2p5>;
+	vcc-max-microamp = <1300000>;
+	vccq-supply = <&vreg_l2i_1p2>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l1i_0p9>;
+	vdda-pll-supply = <&vreg_l2h_1p2>;
+
+	status = "okay";
+};
-- 
2.43.0

