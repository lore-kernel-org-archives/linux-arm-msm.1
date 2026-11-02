Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793604723;
	b=KW3XS5+nZzxfFfgRQl6anVba7jcglqYHRAUJ2cVniNt2VTtEnK7pjmC9tX8nFJDh+irx
	 QKY5xoPQOEYuPq7tU61mVNX0qiPvkpQLyqaMZhlacxz5cJ5Igs+esI+ckbXhSuyjpH38R
	 QrOum/Ky7jaJFdXZeZa+mEW1Gi1EbWKLxmbDNstyvgKuoaQYMPLkfzRqSieLwSMc4gYj/
	 59i04bWJnEWq1onoNYLQ2RXvbVQ79K1EgWTR8lRUWRqZojRwOMciF7LgxfMNOIE4MT+wJ
	 c2oqD6Rnus6a+Zo6ltGVQeun2mnCIhRdYPrEaM4xq3MtpidZOx7++MPJvVknz7XdA+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604723;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4fHyco4oWCPtLj+CaOGX9Pm5z9d4WkHpTNmqJ1OmtG4=;
	b=It+SHxQ0l0A6NF0dVGRzTfkgE/OqwTjefwcLfSLCGmlNL24df+k/uTNaYBiDbXKE/m9f
	 laWcASQtNPFiqAncjPZxKxGcXrvQ8HsGKdVs9dbxBpN5/+ZGPwffrLv0JLij8fBhx4pDB
	 aj6VHqz7l3dhAmMrz2+RyRaQJu5nY4Dx9P2pRS8W6/04rXxJ4oPNnINZvVwgM+vRGYDil
	 hhMEfF2z3fLOjSfH2NTXSjGsbTdpLIrg5Rw5pJxN9sUuCKoRFnrTRqAvmJHNNmqeZZpot
	 8x7/KQ+wJ58pPbrlOvnjHcBmrOV4rb3NdH/5grziSaDz8E/W4DSRCXERDP9t+31pE+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ECVnDx16;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SgOOy0pj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1F8606A32E
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 07:32:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C1F8606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ECVnDx16;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SgOOy0pj
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vKZl3348997
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 07:32:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4fHyco4oWCPtLj+CaOGX9Pm5z9d4WkHpTNmqJ1OmtG4=; b=ECVnDx16ojKqciTl
	aFtETWePWgQQSu1XOdEdYR83o+iRIZmzEHKXQ1n+uC/jUvME7ilK8evp4fRBE9+0
	9q5lMBHTTQZtXMQQjL8sKQfQtQ26fEo3ex7k7Kq0ZA54/jU1iuGpxdIp0ftxxOez
	jxbbRdF6ElB+E6l3C3N44PD6kQdjhAtAb+f762LxsbC8+TESabAdi7upVTFDacQS
	OCHhVqAxuaIumMHHKqBXCa07XoX5MDJTkzXJolSm6IVq+vcZYR0ACPPxsWLOtUdH
	UFo1qDE10DhzDxRPwbcC/+A3tiesYn6lc1sYlGXIDIIJHJk3LNfuCuqy2h56l5wi
	Ju0CWg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7wxnrbf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 07:32:02 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac7a4ba546so2861596a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 23:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793604721; x=1794209521; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4fHyco4oWCPtLj+CaOGX9Pm5z9d4WkHpTNmqJ1OmtG4=;
        b=SgOOy0pj511GXsWmnspUckjRilBeXvsAi0iWmAy42yX9PHkktwPkWFeuzb8aYdiX5Q
         el/opjQlBrrU6l1a0kMrX9SPHMMUlI78IQSNBBvj0n9f26ReKROQL4NH+6b/HH2asIN8
         6CdBpKCrhbxNEm0z7Z8BZdybyIU1AE7qd8n3995IRQ6MZzwhSfRSekLJ6SWHHHxOmsVE
         ZAUBpV11sTfy2PEXSq612gDwRFf8/+AkBy6QhAY3J+nF+CQ7qmC8W+tlr+f22fobv/li
         PK2x4l5dHnTlIKezgN64++9OhGwOy2PPKSrSxMwoC/1X27RjVoK5kmBRwWTTSCWa7QCC
         sCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793604721; x=1794209521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4fHyco4oWCPtLj+CaOGX9Pm5z9d4WkHpTNmqJ1OmtG4=;
        b=FNeASzEengqH/A8d2+bRazIOAfO29qm+9m03GmDBDQ/cyuWV5PBmp5IqKcqq3VSJm7
         CwmSb8GKYOmisuD4ko2YmouGF8L4WWNLojxv+7onP9ZiGf07/pBoTUH7/GvsRobMfz0v
         i9qq1bMK/I+qiDZHeF9x5z9HyCokNEFK5OwzZulcYKol/E1DICiKSygs/qn+sksMK1Tj
         MBkQ6tKPx6Ossbs7BGlagXooNVsAF8Xhe4JJUh4NKYpi4vxmoB3oCbRFZq9Dq2hCuH+D
         JCPO4Ni1ytzTw71EnfEe9ycZZyHhrk0Tch2DNKbLQz4IPJZiEPRCUwVFRmbo2sg/zcOJ
         nyEg==
X-Gm-Message-State: APuU4Z+fKpEYDA0PepICfphQt4FnKbFXMLybEU/ZpalKKSzhuX1ctA8a
	PBhKWKv5gKDJlMf+AMi1yhe8QDhkdGLeIBBiiOPmlLTfzAlpfA9j6exf52YsuarRv+1ucfO6Q0i
	vvAVrfEFMKY9/eIbihNvxBVDwHE67yz4xuPMmHLoBXs384kmHg3qcka5c6MIw9tlKzku4
X-Gm-Gg: AYBFou3/Q973oxGtM2cEvXEgqOkUJsn6xPCUz0TrsSg+I5EJv2h2ubXadWNHrQ5p1aS
	D9gKkG8BXLFjOuPmEy+56LJjW+X/RN2clfcDdYQZ2gPbsDQOe0sYHu5ZSKANcZqv9gez3FzaLYO
	87hT4jibxAzL2D3nN0szqk4nNwt6qdanrECiefUkv93P/faeDC2g9Pciib9QRgGsRK/jUSlSBmr
	zqoJFIUv/y7kbFkpNkkk1pmdud8iGzhy8Vzy4PXYLl6isRk2CmW6JowfYpbMeWGy8spvDFymi6w
	nMbhNVagyOI7oAbxR1Omy52FKEo2FzAUVPfE/q9JRd6fUCrS3hi4kDFblqLy1xvC2c8eU7imXkE
	SrwPwxcPjf7OU+ytVtmwDW/LTxNZXcmBmyLAmBUYFRH/LHxpgjHiomU7+KmtnrzO+FZvDjt/UcS
	ENSbU8
X-Received: by 2002:a17:90b:2d50:b0:3a7:96c1:f6f6 with SMTP id 98e67ed59e1d1-3ae6effc303mr9304055a91.34.1793604721258;
        Sun, 01 Nov 2026 23:32:01 -0800 (PST)
X-Received: by 2002:a17:90b:2d50:b0:3a7:96c1:f6f6 with SMTP id 98e67ed59e1d1-3ae6effc303mr9304044a91.34.1793604720766;
        Sun, 01 Nov 2026 23:32:00 -0800 (PST)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052f0fsm23861775ad.11.2026.11.01.23.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:32:00 -0800 (PST)
From: anand.tiwari@oss.qualcomm.com
Date: Mon, 02 Nov 2026 13:01:32 +0530
Subject: [PATCH v3 2/6] arm64: dts: qcom: talos-lyra-evk: Add DLC DLC0697
 panel overlay
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
Message-Id: <20261102-lyra-display-upstream-post-v3-2-7f660c3b622c@oss.qualcomm.com>
References: <20261102-lyra-display-upstream-post-v3-0-7f660c3b622c@oss.qualcomm.com>
In-Reply-To: <20261102-lyra-display-upstream-post-v3-0-7f660c3b622c@oss.qualcomm.com>
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
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793604704; l=3295;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=SEdAsyTt418trjKLHtxucoXBRSy/JerrxkxW9XWhnj4=;
 b=0qJj4A2u59oReDexzdM9x3eaVTMCYzBR2drMDK5ONPsUDXgsZ9Vbob+7xYOi3xcEqtfis2HWt
 9heqCNRD7a0Cm3/6qk+7mHd4Sd/AdilVE0ywKoK67r+el8NW+Sg85QO
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-GUID: 92F3NNnwNwyiqztFG709PgKqWMUBIdJb
X-Proofpoint-ORIG-GUID: 92F3NNnwNwyiqztFG709PgKqWMUBIdJb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfX0ZPOYXhPWno5
 r3gKUgXtHapHzkVt4db+GErmBzIKQNuviooGNE9+R4Jy3oLr7f18dTB6hFAuKShxNZ97KCCbZrx
 pXNDUmqFcO+OAmHaP8mRDZQsgZHKXMI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfX8Bv+St4L1Uou
 XG6d01Q4JtDa1w/Vq9EA9zOtV+3eCnBAvSR8xJLtLD3JZf/CVAKwA2zwqRa/8Pqbe2oFYkn6T0/
 YM5Iz4DJQcx8AklOk/10ePHhaE0yEMfBbnZaEatr/cL+XCUODbXDEeIpLkLCdEvU+jZo2ZEzdFP
 C8t4I249NkbHFcmpDnPPr5K08AGzfOw99KlvXUu1D/9fNCNJ8XowHCV1+ctkxBh3MG4csGFPCDp
 2OqzfwFBbRSPfaYlfdmAmAyxIlzvBrFXsQhGJi/SBxi8wgBEQa20wsgavC2QMsnXek2FlojCSmi
 93rhWzuXRpYvD7jge8q3XZXNkgv2EXHGKDyaLsVZxXZfF+8EC58rtZZkG0rDLcuqGIBQKRzRIEU
 wItOMbaeDdUpoGsCYkODblMD/GsSmcR0n9ovAgBT4kH/wEBCyJ2+qVjty1Ue2sjYocpaWe3k01K
 uZaFI7UTzSXDAqAxtEw==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6ae83c72 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=mwcz9oGRgcW5ZIR5_CEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020029

From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>

Add a DT overlay for Qualcomm Talos Lyra EVK, to enable DLC0697 panel
when DLC daughter card connected to DSI0_B2B on carrier card.

Configure DLC0697 reset GPIO, supplies, pinctrl states and GPIO
backlight controlled through TLMM GPIO 2.

Disable the default HDMI bridge and connector in favour of the DSI
panel.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  4 ++
 .../boot/dts/qcom/talos-lyra-evk-dlc0697.dtso      | 77 ++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 243231692866..709a96ece14e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -476,6 +476,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= talos-lyra-evk.dtb
 talos-lyra-evk-el2-dtbs	:= talos-lyra-evk.dtb talos-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-lyra-evk-el2.dtb
+
+talos-lyra-evk-dlc0697-dtbs := talos-lyra-evk.dtb talos-lyra-evk-dlc0697.dtbo
+dtb-$(CONFIG_ARCH_QCOM)     += talos-lyra-evk-dlc0697.dtb
+dtb-$(CONFIG_ARCH_QCOM)     += talos-lyra-evk-dlc0697.dtbo
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
 x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-dlc0697.dtso b/arch/arm64/boot/dts/qcom/talos-lyra-evk-dlc0697.dtso
new file mode 100644
index 000000000000..b79e54459725
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-dlc0697.dtso
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	backlight: backlight {
+		compatible = "gpio-backlight";
+		gpios = <&tlmm 2 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&hdmi_bridge {
+	status = "disabled";
+};
+
+&hdmi_connector {
+	status = "disabled";
+};
+
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "dlc,dlc0697", "ilitek,ili7807s";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 118 GPIO_ACTIVE_LOW>;
+		backlight = <&backlight>;
+
+		vddi-supply = <&vreg_s4a>;
+		avdd-supply = <&vreg_disp_3p3>;
+		avee-supply = <&vreg_disp_3p3>;
+
+		pinctrl-0 = <&panel_rst_n &panel_te_pin>;
+		pinctrl-1 = <&panel_rst_n_suspend>;
+		pinctrl-names = "default", "sleep";
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel_in>;
+};
+
+&tlmm {
+	panel_te_pin: panel-te-pin-state {
+		pins = "gpio98";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	panel_rst_n: panel-rst-n-state {
+		pins = "gpio118";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	panel_rst_n_suspend: panel-rst-n-suspend-state {
+		pins = "gpio118";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+};

-- 
2.55.0

