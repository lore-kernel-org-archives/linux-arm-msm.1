Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A914456E0A
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791787556; cv=none; b=kgrMWxiBEZJyaypcIWLHJFyKNanimGKKBY2teN4q6ceqMSy+R7Xz/9V+5HgfBa9VN0C6tn2ZKThlnaVL+GsuyVjmPYJ6GuMj1UDm/v3FYNT9I85AFsrdFF1ikhp5iwN6tcLDokFpBrnwGqB8vYItSFgwwkEga8yyvjretFHOvQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791787556; c=relaxed/simple;
	bh=gIrNpy1BfOfBdpsEjPp2EaySKV335dpmaQgfYevJodw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J2xwS5qhWz3V0Ok1uy/xUD3ZtIqQE8Ni1FAISr1aNLFvgp6Y5NfKz6KnNYWyGU40zP4NMr6f8e9/4DNzGBRj6309rJUc8Unb15SaR5bcKSsc1MVsXtj6gnJSVvabD7HYlrKkCdNmpcYBAU78JRCtoqlRLRQxQOCd2sWiNTHcXw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DgaJkYoL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cQ81gvYF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DgaJkYoL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cQ81gvYF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55i2Y475087
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Doir+caiLoYGVhQW2yiSNYU7k/m4JLDAkXb8nVsZvlY=; b=DgaJkYoLZryqTrJf
	viObZygMMVxU0C6TbKCeimBw6xFg8J3FW+z/68MsEC3z56BRwJ6fDLTkyGcZ9XBm
	FI1UQoWYlbe3EZMOlXmJyQrBCzJEoIF88RalC9pDoik1dDP6AbGNcL3gf+mVLi69
	hxH2vStUoYEEWNQJZe57ag3EXaIFn3pW3udtGRF/whuHrMFxFaJOoCyfW0y5Rw8R
	O1vMFmjxrGumINo1gDZIT1Qa92PTWY1481LHaMnXG8M6qi5C7yOny64GKDPnXgRX
	XNEqMRkuJgJec2JVTeD0FiNiPC8LvSfyuugN/h/6BSkBJjB9FdH5/tet1Fyp0lxm
	XtTBRw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7en9w0vt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:45:47 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1a439db36so1072603a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 23:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791787546; x=1792392346; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Doir+caiLoYGVhQW2yiSNYU7k/m4JLDAkXb8nVsZvlY=;
        b=cQ81gvYFHHRnng+WTEfVbQFrtVEzFZ4++C27LMuRHZkavcELnocz1V6NlIVZ/atnI/
         OHmDwA/s/auD0sy5XxN4huyRX95RZi8p1OfX6jBb3uKa0KnY7HCrXcGHxXscn57gTjYe
         l3GqeGZc7vmCkVYNAmdUmFzkEVCNGf10jmtzD8AA2UwaFyP6rNpR4Y2TnHdAuB6ebdXK
         tAm1qySO6UUfaLDr2JEb16YMROfHAFniTjmhdRlK7JTJEcO4F8kElTJuBWKsIBjQdej4
         mvZKnStsACw97tgzlhBEgsiTruBuMuFYDZLyCk7HkBIljZL0oVQgcWf2kb9ZRvS+WVmh
         XLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791787546; x=1792392346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Doir+caiLoYGVhQW2yiSNYU7k/m4JLDAkXb8nVsZvlY=;
        b=L7OTvq88Pyhw6cpvil6ojMuIUptTH1h4V6g3wC8HAVO1ExeIKEYMSKRZnILokaa6cI
         XqC8c/ciNwGP2kn7Y6zGY/ECFgfeNXVjsanBj18jD8RPQ4fQQz0zBDyRVOJakMQrLpls
         TAZegA1uOlWv6FWxJpy27E04ODfZ55iNAUb0DVxxI4ZZkf+QSEJVQQMSMzUFvkDA68FF
         ROJDRSenH4clktbauvuNiHXgqDlychc4YySmQMjWM8nZZloF6uJ5km7QpGQHk+4Z4YHH
         RHbISfLI2KP6RxW55hYHq0ncDJ9TcpSmfDbMcxefmPVE+fkk8H/31TRcYAJ/M9iQp+mR
         IXKA==
X-Forwarded-Encrypted: i=1; AKwUvBycWDZUZk94JGz2b8bmgvIB6YxX6v/C8+1ZCIPXPQnib0GGn8HhWcU3ZT+Ea+KojQ/HAtBMFXT7UpcmUcPV@vger.kernel.org
X-Gm-Message-State: AFq9FYIsWq3DycD0LaoYSKWjFG3ncZ67TIwq3eDXNPMLgppO82Qk8ayd
	C+4NzWhdYSlBDpiee+xfsZdsj83lcoWXuSyfFIln8vqMpIQRi+wORK4bQpE15ocYB5Ua9vbBccg
	9XG+Er4pi7YwB4Yudbqg05H4hWFP/Tirxb7XnVEzoN1XfCwXtz9WeKEJP+3ykVUdJfKtP
X-Gm-Gg: AYBFou29c/WQEFHH8SJdbrclOCgwgoRMcQigWJrdXP1OxrTT5TjweO0u3ggjsm5FPIA
	26Yf0K5zX+Xr3sLCNnuSF24eYbdbid31qA4mMofiH/sz3FM8NK0hYjBkZBrdC9RzLDFGpJLJW80
	2Xhne2d0M+1puNO2Og8BmoKubpZBxB+xYgt4En4HqjobcQlvwt2B7HcBGqf78/6NNodwakoO7zo
	pX/u69PVJ8+AeFcdVLQ2Eir2KgDuPTvLd2E6jT9hva1GF5aA6DbzabDa2t4SGz3GxPqCnlm5Q3A
	5LtTgqK937l3P/2JWVg1bvGG9lm9AHZSQOnvcrKljUt1gVPlvQVvj5LtC+SmGAElK9O7bx92lJ3
	wW1+qeTyqZ/8qCKhegxOHSCgZFZP9Rukc1F2+1CsNCayWWCx5Vn8TWvhy7Gww/W9c7fMRQfdvw2
	79+wLkkupXog==
X-Received: by 2002:a05:6a20:2587:b0:3e1:1b11:15c5 with SMTP id adf61e73a8af0-3e16bfce3dfmr6825878637.34.1791787546307;
        Sun, 11 Oct 2026 23:45:46 -0700 (PDT)
X-Received: by 2002:a05:6a20:2587:b0:3e1:1b11:15c5 with SMTP id adf61e73a8af0-3e16bfce3dfmr6825824637.34.1791787544330;
        Sun, 11 Oct 2026 23:45:44 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3dc6c93sm3534420b3a.33.2026.10.11.23.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:45:43 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sun, 11 Oct 2026 23:45:16 -0700
Subject: [PATCH v21 14/14] arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5:
 Add DT overlay
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-kaanapali-camss-v21-14-04fd28d815c6@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
In-Reply-To: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Authority-Analysis: v=2.4 cv=Woe+otfv c=1 sm=1 tr=0 ts=6acc821b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ZJyx6tJpJz6uHbTMGDIA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: ON-biqwrf2ODQC3apzqNeMaXzM85DSDU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfX+nOEWRpPAgHg
 Lo7FON7NW4yfv9UjZxYxtdeznvyunjCOtVPoZLLhk5LhiQMpi8EqaZXPHQZv4bwyNk2+VtPZhnB
 R8fZdHQvxEmh0l8cYDwgm6mgyg+HmsWstlRhXVLr5JN7uNSja+jrVGZvKdqwRyHW5DVw+PF0Qdl
 WECLrCZKCbzSiFs1yaq93jsAOsnLQKLNldMsH4/QYqvXfBfnxl1j4g4UY5kKiQvfrKkOu45lcRp
 INRq1qlGRO30xQZieG4+AZOcpSkE6m/jXwI/1RtQIEfjz6nzbAR2lFpL0+U2iXRVFb3bqCBjGPW
 tXcb0GDlqhfmIRJbxY1zKmlT/A8PRmeK4jPJRvZaX5wbq6Yxxr4dpmc3tKBVJvX+/XTE/SOWgnX
 nft9pZl8OCXpjfJuykNJq/dnFiWwWdqsuYuv81pswOJjnKJ7uTcuBzRjT7/1XF2sfMefLioG0AN
 0b4Shi+WACUe/pWYtKg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfX/rSloIWbRQqu
 0TkoDlDPbCBQ9xC6yo8UxpuGy6Q5Yl5RtavrXVENeGXfyVpS2nJl+cigK7lpfFiFEqK2Esu47iE
 D5Im0fzeiyT5ufUOc01K7Yl7WKWUCGM=
X-Proofpoint-ORIG-GUID: ON-biqwrf2ODQC3apzqNeMaXzM85DSDU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120026

Enable the S5KJN5 image sensor via CCI on Kaanapali MTP board.

The Kaanapali MTP board connect S5KJN5 with QUP I2C bus by default. This
DTBO enables S5KJN5 on CCI-0 interface connected to the CSIPHY2 in four
lane mode on a rework camera module.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  5 ++
 .../boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso | 81 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts         |  7 ++
 3 files changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..84b244d43e9e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -48,6 +48,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9650-rdp488.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp-camera-s5kjn5.dtbo
+
+kaanapali-mtp-camera-s5kjn5-dtbs	:= kaanapali-mtp.dtb kaanapali-mtp-camera-s5kjn5.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp-camera-s5kjn5.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso b/arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso
new file mode 100644
index 000000000000..d0e39855e0e6
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h>
+#include <dt-bindings/clock/qcom,kaanapali-camcc.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
+
+&camss {
+	status = "okay";
+};
+
+&camss_csiphy2_in_port {
+	camss_csiphy2_inep: endpoint {
+		data-lanes = <1 2 3 4>;
+		remote-endpoint = <&csiphy2_out_ep>;
+	};
+};
+
+&cci0 {
+	status = "okay";
+};
+
+&cci0_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@10 {
+		compatible = "samsung,s5kjn5";
+		reg = <0x10>;
+
+		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam_mclk2_default &cam_reset2_default>;
+
+		clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;
+		assigned-clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		vddio-supply = <&vreg_l4n_1p8>;
+		vddd-supply = <&vreg_l1m_1p0>;
+		vdda-supply = <&vreg_l4m_2p2>;
+		vddio1p2-supply = <&vreg_l2n_1p2>;
+		afvdd-supply = <&vreg_l7m_2p8>;
+
+		port {
+			s5kjn5_out_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <1248000000>;
+				remote-endpoint = <&csiphy2_in_ep>;
+			};
+		};
+	};
+};
+
+&csiphy2 {
+	vdda-0p9-supply = <&vreg_l3d_0p8>;
+	vdda-1p2-supply = <&vreg_l1d_1p2>;
+
+	status = "okay";
+};
+
+&csiphy2_in_port {
+	csiphy2_in_ep: endpoint {
+		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+		clock-lanes = <0>;
+		data-lanes = <1 2 3 4>;
+		remote-endpoint = <&s5kjn5_out_ep>;
+	};
+};
+
+&csiphy2_out_port {
+	csiphy2_out_ep: endpoint {
+		remote-endpoint = <&camss_csiphy2_inep>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 9eb02fd09dab..c70cd39bcb75 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -1243,6 +1243,13 @@ &tlmm {
 			       <119 2>, /* SoCCP */
 			       <144 4>; /* CXM UART */
 
+	cam_reset2_default: cam-reset2-default-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
 	wlan_en: wlan-en-state {
 		pins = "gpio16";
 		function = "gpio";

-- 
2.34.1

