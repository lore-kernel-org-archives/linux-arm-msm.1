Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353248;
	b=rl7m1y67r/9PKw8G/fjX2DZejUYtMvg90OQ7MiqXkJbVEOC14EEPlHILvx1T9bfCMtOO
	 V9rasZr4z1wWlLMQe8/FM5I1nOjGb2H6Y/eADDZvNyKER511Gw+hGlUIBu/4mEDJML+K9
	 6gqfNbHvSrbNc5kvGqgy0bKInKxnB/s1h/XLux8wTOQJucukgr+rbav6DPKmLHL/MmcxE
	 lQifcXgOeg9xWKY4ZvcHxGb2hy1smIhfwmkJFNzh4Jme8iDDl18GPGFbVNIjOovm0xVCP
	 ug5bDJmh6DHydueNbi8Ykk2yf/s61UffhsD+YOY5qVFaUCsSgVeaKdcLJKyWgNpt5Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353248;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Y+AlhbsiipjnSlMaVx4SPUj+XkfQvKsmpXV5X6+9gns=;
	b=Xk5uhOmnjCuq7jO2qVgz+kqYk+8aTOrkg1Vt1LnEdk+tV++RDSqGLzHCUlYeYheEiPTn
	 I0Ud7Y7OVXHuVAc1s+yl89CQOQNN1Zw4LDdBUvJLNYjJ7VOsg7IO3n7EHMin2fmKWS+c6
	 B0uUYqsQrXLEQrJaj2vsehn8P1NN0jyNfd3m56TB+iD5gjfeK/Ozz2jmk6Lci0CdIhHQS
	 jxhY5icmZb6HSBHayGjm676p7gRI5McEKyjnv7Cmt09IqLBW82P3oneHUWl6tKbFjoEu3
	 syJ591tSuPhRGGZ8fiJt227VccoxwKB9ubNiwAyh5NxlhupRtJhihN80h9YJVDn6V+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F3rgTHgn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ow3G3RKQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9D4606A330
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 09:40:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C9D4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F3rgTHgn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ow3G3RKQ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8FFFr3709532
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 09:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y+AlhbsiipjnSlMaVx4SPUj+XkfQvKsmpXV5X6+9gns=; b=F3rgTHgni0gIhpe4
	f1Q0Zr0u9Nj4IUpUrGQrjOVgtwU2dLrDdLFzNhCfik+ko7FZFKRQgHgY/d1bkF+Z
	qKn0Rh3oKBt6j2bP8blcF6gG74MktCoIdOofa8KZGStz0TtHXa3r77hktP9Kzahl
	Qa3hVANHwEJD8FSJUUrBOAmQ14IeZxo24o1XNOpTcqV0z1xsYcA/FAFOI+LOHJ9D
	8GHsHgclT/XvHh4zYCOFeP/tna80QVcweSsH1yQJkrFU5RwV5X6sJbKgjaCyGafK
	Ybzssa/SNwR1TPaAOtH0fFGDrQ5Bz3B+268EpFgkunI9WkqoKJfpUqJRNHBuunp6
	ft6L+A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6rjb9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 09:40:46 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a3451ea93so1006335eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 02:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793353246; x=1793958046; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y+AlhbsiipjnSlMaVx4SPUj+XkfQvKsmpXV5X6+9gns=;
        b=Ow3G3RKQhGYaki2dHl05cntsV/0OPoJdHkjF2rjm2Ihkl9NrrylZxVyWe2EhLsviQH
         8AIsaPOxJRNWDOM9fcj4+Awo4FlubNYSaJoQ8UFGaiWvU/LgZzXugDC2FGdEblDYxt4D
         uT3wV6mAQ4f4EhX3lC95hUQWp9Jl4/JoH3XpQCBKs10tPlLtCeBjLLBMSCKgEX61Bj5Z
         JQgxaDw3ktTr9Ys118hZSyZZuFnFI+S+xchyFfztLj9nRGoUX2a1szIjqkKTmFL24z8e
         8mf+kHl83CPmTk3lt7tX72f9JXM6ajN1epb01VXasnuCtRTlw2MyNM4Bq1vKoP8RGi4n
         ALlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353246; x=1793958046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y+AlhbsiipjnSlMaVx4SPUj+XkfQvKsmpXV5X6+9gns=;
        b=yDMefkbFJvpmNqrmVcLJ4uzSEvKZwoXfK93BBpl/TW9pr7mVGSUt+q1UaG7zefJHRo
         1wE6rm4D9Bc5UzK8peBadvyB7kPY4gH44pXksowVOXQ9ZdySemY4KW1yz7NgniSoxLM4
         HMy2WdS5xkfZkotOcT2+ZMWehz5qaXGW3fhWHww1lKWXEX0T/dubqe/4AsVVvUw2emV2
         tJB/fZtfyJ/5SFqng7Hbkg3bBCn7+U5wD43pUr4LXKObN4dQ6EoZaOIgx24KkSVH4/cQ
         TCl8qkAoTLTxBATCMZ22r2bYtsOGgffLuIysqIXD8QugSDZ4humo7Jjch8z4gkGkBv9U
         pIgQ==
X-Gm-Message-State: AFq9FYLHxA9hPNd0bkYE578k3xVHI45fJFu4R+BdAcOojci8Joc+ZJgl
	9zqJ/anIBOxLdYEiKLU/rdg3et09vs/5v9dcSprWfTQUgEoJt3B77LCwd5FPVnzqZNjETKqDZ88
	hopfUbA/rl0hDW4tOHI1b/kIce0cYp89ziUfHcsCg3oijCcQRAaA6xJnE3lFfbtHG4B4U
X-Gm-Gg: AYBFou0YkY+pg/B9Os1bx5hcB6eH5nTT4fyI9S4bZ2xHU6vSx5CgrQpt0JeavEudHIw
	KSfza+iClAxzAzVmgByHb2JnxisDJ46o9X5+XE7mJ7ltOmsMMF0X9zjR8sXzkhXNsu8Zx5xiZIF
	cdAD1SvApPsnQR0wqxgRngdWhShsanx5FidoNTeXuWX+5bK+PLlxJm5yTx7t00y3A6kXOyStYgq
	52nGVy6TzNZhVzB5eUubUmLYEu3BhIB78UvQ418QmL3qy4JZmYfxAoXKzWSeXfi3+I5nVJaUHJa
	FDtDFPzMDhQmbgFhUCU9D7hxvdoLnryt3B2JuqS4c7jQ2opzYLE2n1So7l60h3e80eW30aNhBPX
	DGXTmDXGHvTJnUcweXcdPfRYLrh4zKF6TIxXiUPd4wEo2wrQ0wCLClnLP1BpcXKfhYWr94QmM8B
	ZuHVgl
X-Received: by 2002:a05:701b:4283:10b0:166:f097:6f12 with SMTP id a92af1059eb24-1ac5cb1a303mr2508149c88.15.1793353246023;
        Fri, 30 Oct 2026 02:40:46 -0700 (PDT)
X-Received: by 2002:a05:701b:4283:10b0:166:f097:6f12 with SMTP id a92af1059eb24-1ac5cb1a303mr2508124c88.15.1793353245491;
        Fri, 30 Oct 2026 02:40:45 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm6723418c88.11.2026.10.30.02.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:40:45 -0700 (PDT)
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 15:10:10 +0530
Subject: [PATCH v2 6/6] arm64: dts: qcom: talos-lyra-evk: Add AUO G133HAN01
 LVDS panel overlay
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-lyra-display-upstream-post-v2-6-906302159392@oss.qualcomm.com>
References: <20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com>
In-Reply-To: <20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793353209; l=5139;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=CQGqhSxfLwiW9diGzvVCOt4ve1m0nZXLdRNBE6mgRxI=;
 b=n2ECvROy1GlU4o3TO7BU0WasQyEsMLsenhHIyPK6/66gfTnqxgh8lHELbxYQsRNXvUjhxCNBV
 r44LnuA86GYALZdnxupCxmCpuAZZ5gJpJ5KpNKOkxNvC4j8DSfkICpS
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-ORIG-GUID: iOhfKsYrAiRYegy8wYSLJLt_UFsSCaCB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX61qgSX6v3i8J
 0Lb3rHOWmFiJc1i0BTGA3n4wYFTguWo3Sqabhza6O8Z2nC/1R+G5lrxT7LKVHCdpp+5Z8DRFGHv
 9od+iN/DPMPrQWa9eFPucQxmUkJgiqc=
X-Authority-Analysis: v=2.4 cv=PIqaavqC c=1 sm=1 tr=0 ts=6ae4661e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=IIR7FofeaqIF4eDoK2QA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX2SS5WzZIZPOb
 MD0dasWTF8POr71/fYb8WbjaixsWR/JkCilUuUjcvIrsP78IYcifK10dk2av257auZ5yfPQ1I9B
 GNmhK1gNTTOHIv9ySsX1A8wSO5AtSTvnj4IrUVB0pqOK66DahItgb4cqG1C4Fk8TOdd+ZekfqX8
 3iAbHVxGpSVsiV0qE6YvkK6Ax+fIMF+ByCE4Tm3hxgO31iATzp9uoHm8I5E3eRjQNigikuAJLDy
 1zcx9RzJ6RjWB0HiBEDo/28dwplxCB/aJgLvqNCiAKdYn/1kIqwcAmXLmJxPB4vg2RySogvbaxM
 qBLeKWgd56nhIgwcumg6qYBnWZZUGqgabshj6AiIBR/RFtBDERpamHXwaENzfiDyc5MZ1vT2wha
 FTvrK5avg3XanKGaqGXkAUOq1y0UA3oetzdZUE8RzWhKnVJdBsXlsPu5Q+AWiXk/TJwIMUdFtmv
 p4D5G2m0jracoJG8Cuw==
X-Proofpoint-GUID: iOhfKsYrAiRYegy8wYSLJLt_UFsSCaCB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300038

Add a DT overlay for Qualcomm Talos Lyra EVK, to enable LVDS interface
when LVDS daughter card is connected to DSI0_B2B on carrier card.

There is SN65DSI84 DSI-to-LVDS bridge on the daughter card which is
connected through I2C5 with reset and interrupt connected to
GPIO61 and GPIO60. Backlight is driven by a generic clock-based PWM
using GCC_GP3 on TLMM GPIO59, with an additional backlight enable
GPIO on TLMM GPIO2.

Disable the default HDMI bridge and connector in favour of the LVDS
panel.

Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   4 +
 .../qcom/talos-lyra-evk-lvds-auo,g133han01.dtso    | 133 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts        |   1 +
 3 files changed, 138 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index b6a61339914d..012dee96f700 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -468,6 +468,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtb
 talos-evk-lvds-auo,g133han01-dtbs	:= \
 	talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
+talos-lyra-evk-lvds-auo,g133han01-dtbs := \
+	talos-lyra-evk.dtb talos-lyra-evk-lvds-auo,g133han01.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-lvds-auo,g133han01.dtb
+dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-lvds-auo,g133han01.dtbo
 talos-evk-rpi-display-2-5in-dtbs	:= \
 	talos-evk.dtb talos-evk-rpi-display-2-5in.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-rpi-display-2-5in.dtb
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-lvds-auo,g133han01.dtso b/arch/arm64/boot/dts/qcom/talos-lyra-evk-lvds-auo,g133han01.dtso
new file mode 100644
index 000000000000..8c592e6317c3
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-lvds-auo,g133han01.dtso
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,qcs615-gcc.h>
+#include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	bklt_pwm: pwm {
+		compatible = "clk-pwm";
+		#pwm-cells = <2>;
+		assigned-clock-parents = <&rpmhcc RPMH_CXO_CLK>;
+		assigned-clocks = <&gcc GCC_GP3_CLK_SRC>;
+		clocks = <&gcc GCC_GP3_CLK>;
+		pinctrl-0 = <&bklt_pwm_default>;
+		pinctrl-names = "default";
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&bklt_pwm 0 100000>;
+		power-supply = <&vreg_disp_3p3>;
+		enable-gpios = <&tlmm 2 GPIO_ACTIVE_HIGH>;
+		brightness-levels = <0 255>;
+		num-interpolated-steps = <255>;
+		default-brightness-level = <128>;
+	};
+
+	panel-lvds {
+		compatible = "auo,g133han01";
+		power-supply = <&vreg_disp_3p3>;
+		backlight = <&backlight>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* LVDS Channel A - odd pixels */
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+
+				lvds_panel_out_a: endpoint {
+					remote-endpoint = <&sn65dsi84_out_a>;
+				};
+			};
+
+			/* LVDS Channel B - even pixels */
+			port@1 {
+				reg = <1>;
+				dual-lvds-even-pixels;
+
+				lvds_panel_out_b: endpoint {
+					remote-endpoint = <&sn65dsi84_out_b>;
+				};
+			};
+		};
+	};
+};
+
+&hdmi_connector {
+	status = "disabled";
+};
+
+&i2c5 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	bridge@2c {
+		compatible = "ti,sn65dsi84";
+		reg = <0x2c>;
+		enable-gpios = <&tlmm 61 GPIO_ACTIVE_HIGH>;
+		interrupts-extended = <&tlmm 60 IRQ_TYPE_EDGE_FALLING>;
+		vcc-supply = <&vreg_s4a>;
+
+		pinctrl-0 = <&bridge_irq_pin &bridge_rst_pin>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				sn65dsi84_in: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+					data-lanes = <1 2 3 4>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				sn65dsi84_out_a: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&lvds_panel_out_a>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+
+				sn65dsi84_out_b: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&lvds_panel_out_b>;
+				};
+			};
+		};
+	};
+};
+
+&hdmi_bridge {
+	status = "disabled";
+};
+
+&tlmm {
+	bklt_pwm_default: bklt-pwm-default-state {
+		pins = "gpio59";
+		function = "gcc_gp";
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&sn65dsi84_in>;
+	data-lanes = <0 1 2 3>;
+};
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
index eeb8e903b03b..e5c2ea9e1e07 100644
--- a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
@@ -15,6 +15,7 @@ / {
 
 	aliases {
 		i2c2 = &i2c2;
+		i2c5 = &i2c5;
 	};
 
 	dp0-connector {

-- 
2.55.0

