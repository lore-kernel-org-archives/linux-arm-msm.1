Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BB33DD521
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785487258; cv=none; b=PIsuhEbwLd0mQQyYtbsPISu7wVnpj6t9BgXo8jipvBmLi2aKBxdn+QeC6iVs2+t40Pq52nbJDkCVUJ103WLHVVLoAFHHshwVPq7A8O2YDCh/v3NBXaQ5qO5iX17tlN5fXrbt2Ihtrmf9Pe1tVKGnDMEgGlQ3ASKpsx10wSgwt2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785487258; c=relaxed/simple;
	bh=pK8ibQtYJW9jYayFEHl0j+WMAPF0qMDDHA4CRxS3tBc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NT/69XgrdJYPYNf8Xr65nB38FUFZfNl0ZRQbclNp4Fa4GZf0ZzK+qUCvQrCt+vX5MIOCXMrpd1q4/5ioTZoqMbfjri7i4Hz98fJzv1vOrpxb5QckDQSkJ275FrR+DLZ7buAPFsBaQt2AlTOWEOKB/FItzGPV5xVttXNuxoHQf/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lKhqJkG0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gTEkpG6P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lKhqJkG0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gTEkpG6P"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V8c0rb480279
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:40:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AkVJqbXVKw+
	2vJvVFlyY6LUrHn903yMTmpIEWB1SWvA=; b=lKhqJkG0YsjE7SXARrnqG6v3mMT
	aAd0eFyMG7Fwnho8q7gBH4M7Ocg2xHcE3QudG1Aa3/r5N0KD8g+eJ/Zs81hZVbKa
	khwMpNOiUlMQul94Tv6pB8EW+fExZTmIT5ikIcF3Q4mEHMMiR4FUY3Ygnp7zOZio
	lxzuRKGltIrET8eHmX9RFbul2i251EE+PiHETIUOKncM16IS0L1LWfVurx+LCNmR
	F28iymXCyJ8xGBHRuvggwg8FhpjPdomsfEA9haXFg/Nm7nWSUmIp0c89BdJ5QKxt
	eUcHd0ewFsuVkxfQ6OUx2/09K2WyK2ijs7GMgW8zx57XHDN7v5GAqOaLKwQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frrc8g0ad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:40:54 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84eccf9d899so1118523b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 01:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785487250; x=1786092050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AkVJqbXVKw+2vJvVFlyY6LUrHn903yMTmpIEWB1SWvA=;
        b=gTEkpG6Pbm5E1tA11JpcTg1ElPmmomT4JCFPPbjRCxVDnuJjf3EazDruHu5IHDDiL/
         klOVPbsiPdf91As8ZDLEJWcYLxz0zaomT+XibkZ2fQ/pbnsB9MeTNTeiPSN1oaje6NMn
         t4DNHtobzieTHGDixgkLLJeEUri5XPLbwvWjBLvkUvQwe+4I+95ctrA4uDkDd/0R2gik
         hUG7WOTbWcDjgSaLvNrNsv/etMIfT65pH8rRpPXQGMYW9rEdTtvzsNDiDApJ1ob6LuIs
         EsS4CUBSYVCR722AYLHLAEpVV20oxnTgkBy/ATqKUUBmINEzIqTipm8XMFkiHZQYXzmX
         3YoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785487250; x=1786092050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AkVJqbXVKw+2vJvVFlyY6LUrHn903yMTmpIEWB1SWvA=;
        b=bBCIUcZgZZEVqzbMOZwsDH8IOS21mDYS+CUPxSbQBtl77MM2Bf75//mpNAah/AbvDj
         8+L+nlycq1BcbTgRc0GKOIzuaDvJsA/OgTN/8AwFNr6umaKmai/NXm3RsXKlg+26kT2R
         MlHpF1KFD1mIkpeVSgvWcoOk34+H5n0uHfxhd4EWpB/+3XjxWGUvg4QfVtORb8IExW9o
         Q34BkWCHlfo1KnJtAHkiOhxLVnVKCxy11YVyK3r2OOvL9oFFegOZjHz4aMcXChsyXkQ7
         3t8D+j4xxMA2JrY9mw2tOmiOZ2xTOEIRxwbaJUeEsk0fWmIYlJ+4ult01hFHgtZq2Q1s
         mY4w==
X-Gm-Message-State: AOJu0YwPo6mt7HnLzurnESY2W17T9DJ0sHc+eyAlb+sM5FrCfznOCAuY
	V7NjgVl/gmrlnJblQ0B7awQHDCr/bUG2Y62JXLr7LVZaTCqPt6elbxMdbnnl/jK6WNS6zsfncHH
	MoJklzyMFmmm5oXrIoEG0V5tE1nvlFr82jhOKyO77Ya8nb8RmPZwBHOv1EU9sPeG8dHtu
X-Gm-Gg: AR+sD12RseCXzUPNYlItJiWjVb9Db2k4yxP11hK8KsxFG17qibGczLn8XnOgSDzzYkx
	nQW/feS2L/xzgBF6EQ2UXffMnFDgs1kZ+CduU7joErRtIVlxgmKNG88yVXwvfM9qk6GM0b/pFJq
	XkbtMZXj6C2iCz2RVXeP7huAc/UFyvVVVKDulQ6NgIH7La6oGQ5RKdXMuJZfN/gd2ZR95O7styb
	DXtLsSoWOKFoH/MmzDeMDab8/7k0SGv7iUg4IzfjnTtABNn0N/+WdbUNKnfq6phMZRePzTuSLwx
	H4eaAyt3ItIbIJZk8+AqBVPCJGH26RKkPBZc1a3/0dHzjKWbEQ+VIgv030Sclw0llrIF/0vu0Ev
	XQIVrNMocObVLm3CNYfqSHg0ptebcOw==
X-Received: by 2002:a05:6a00:1c94:b0:848:411f:3969 with SMTP id d2e1a72fcca58-84ed723b677mr919860b3a.20.1785487250010;
        Fri, 31 Jul 2026 01:40:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c94:b0:848:411f:3969 with SMTP id d2e1a72fcca58-84ed723b677mr919847b3a.20.1785487249549;
        Fri, 31 Jul 2026 01:40:49 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc2d4473sm147552b3a.40.2026.07.31.01.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 01:40:49 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 1/2] arm64: dts: qcom: eliza: Add LPASS macro and SoundWire support
Date: Fri, 31 Jul 2026 14:10:31 +0530
Message-Id: <20260731084032.3106477-2-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260731084032.3106477-1-ravi.hothi@oss.qualcomm.com>
References: <20260731084032.3106477-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: G2MyJkip8C41EEc8zF4jkLD5i0bz7pTY
X-Proofpoint-ORIG-GUID: G2MyJkip8C41EEc8zF4jkLD5i0bz7pTY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA2MiBTYWx0ZWRfX36TtTg76fApG
 aKX58Zlwp5F16Pi9eaYCbCC5OgqduB2ckl4Qg7mjxanSs7vBRYi4PapTWRFdFYCaUzTqEpqRzL1
 ETT2lM8kUUtiehNPhADmz/XroY+yX+fPFK17A40SwsfDnMuGmnQaNnZCZyr3PdotmxLvG+QHcrP
 8h2zcEIxQnmXH1/9gX1bQDp3T6dxONRGUX+ZM9eMxRWgEjRL3vNprC1MiOMFU2yz2nskVG86Ih7
 TJlroRuIJrmF++Fp0105mKlYUEbV2oh0iPHGSJ0Uvm7gGnRSaX3eT3DvLDYFeEx/vMTlaODHlfW
 IkNAGKTYLv9um/BPlQHJDAssQIAdIj0puvzHSHLKa3phTn1V5kpKtK9lczXoygrsAt2Ia9Qne5u
 HuS1cYRLNOaZfneGj7tcu2tE601JLfoV5j/LYo1aqsPVLPmZ78uWQlSOmYC0Vb0e7u51OBUv8xL
 Tg1aOhU6GnGErBldgmQ==
X-Authority-Analysis: v=2.4 cv=EcL4hvmC c=1 sm=1 tr=0 ts=6a6c5f96 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=XCWodxiYzDmHC-LrW4gA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA2MiBTYWx0ZWRfX84/lJN7wyk53
 z4z5wkMea2aCnWrWanGgDOAg5UeG7AUnmf9Lb2aSiKdrtYz0OTGUYcYHU+3vaEYYnhmNH1Nvv4l
 bqrgolJRTlDx0An8EaRmVgFo7eQfRmA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310062

Add SoC-level LPASS WSA macro, VA macro, SoundWire controller and LPASS
LPI pin controller nodes. DMIC and WSA SoundWire pinctrl states are
defined inside the LPASS LPI pin controller node. The hardware is similar
to the SM8750 platform.

The SoundWire controller is kept disabled so board DTS files can
selectively enable and configure it.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 189 ++++++++++++++++++++++++++++
 1 file changed, 189 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 1830020f23b1..3957dae4524e 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -19,6 +19,7 @@
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -2064,6 +2065,77 @@ q6prmcc: clock-controller {
 			};
 		};
 
+		lpass_wsamacro: codec@6b00000 {
+			compatible = "qcom,eliza-lpass-wsa-macro",
+				     "qcom,sm8550-lpass-wsa-macro";
+			reg = <0x0 0x06b00000 0x0 0x1000>;
+
+			clocks = <&q6prmcc LPASS_CLK_ID_WSA_CORE_TX_MCLK
+					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_MACRO_VOTE
+					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE
+					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&lpass_vamacro>;
+			clock-names = "mclk",
+				      "macro",
+				      "dcodec",
+				      "fsgen";
+
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+		};
+
+		swr0: soundwire@6b10000 {
+			compatible = "qcom,soundwire-v2.1.0",
+				     "qcom,soundwire-v2.0.0";
+			reg = <0x0 0x06b10000 0x0 0x10000>;
+			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&lpass_wsamacro>;
+			clock-names = "iface";
+
+			label = "WSA";
+
+			qcom,din-ports = <4>;
+			qcom,dout-ports = <9>;
+
+			qcom,ports-sinterval =
+				/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f
+					   0x18f 0x18f 0x18f 0x0f 0x0f 0xff 0x31f>;
+			qcom,ports-offset1 =
+				/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15
+					  0x00 0x00 0x00 0x06 0x0d 0xff 0x00>;
+			qcom,ports-offset2 =
+				/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f
+					  0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-hstart =
+				/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff
+					  0x08 0x0e 0x0e 0xff 0xff 0xff 0x0f>;
+			qcom,ports-hstop =
+				/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff
+					  0x08 0x0e 0x0e 0xff 0xff 0xff 0x0f>;
+			qcom,ports-word-length =
+				/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff
+					  0x08 0x0f 0x0f 0x00 0xff 0xff 0x18>;
+			qcom,ports-block-pack-mode =
+				/bits/ 8 <0x00 0x01 0x01 0x00 0x01 0x01
+					  0x00 0x01 0x01 0x01 0x01 0x00 0x00>;
+			qcom,ports-block-group-count =
+				/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff
+					  0xff 0x00 0x00 0xff 0xff 0xff 0xff>;
+			qcom,ports-lane-control =
+				/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff
+					  0xff 0x00 0x00 0xff 0xff 0xff 0xff>;
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
+
 		lpass_lpiaon_noc: interconnect@7400000 {
 			compatible = "qcom,eliza-lpass-lpiaon-noc";
 			reg = <0x0 0x07400000 0x0 0x19080>;
@@ -2078,6 +2150,123 @@ lpass_lpicx_noc: interconnect@7420000 {
 			#interconnect-cells = <2>;
 		};
 
+		lpass_vamacro: codec@7660000 {
+			compatible = "qcom,eliza-lpass-va-macro",
+				     "qcom,sm8550-lpass-va-macro";
+			reg = <0x0 0x07660000 0x0 0x2000>;
+
+			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK
+					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_MACRO_VOTE
+					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE
+					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "mclk",
+				      "macro",
+				      "dcodec";
+
+			#clock-cells = <0>;
+			clock-output-names = "fsgen";
+			#sound-dai-cells = <1>;
+		};
+
+		lpass_tlmm: pinctrl@7760000 {
+			compatible = "qcom,eliza-lpass-lpi-pinctrl";
+			reg = <0x0 0x07760000 0x0 0x20000>;
+
+			clocks = <&q6prmcc LPASS_HW_MACRO_VOTE
+					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE
+					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "core", "audio";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&lpass_tlmm 0 0 23>;
+
+			dmic01_default: dmic01-default-state {
+				clk-pins {
+					pins = "gpio6";
+					function = "dmic1_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio7";
+					function = "dmic1_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+			};
+
+			dmic23_default: dmic23-default-state {
+				clk-pins {
+					pins = "gpio8";
+					function = "dmic2_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio9";
+					function = "dmic2_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+			};
+
+			dmic45_default: dmic45-default-state {
+				clk-pins {
+					pins = "gpio12";
+					function = "dmic3_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio13";
+					function = "dmic3_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+			};
+
+			dmic67_default: dmic67-default-state {
+				clk-pins {
+					pins = "gpio21";
+					function = "dmic4_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio22";
+					function = "dmic4_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+			};
+
+			wsa_swr_active: wsa-swr-active-state {
+				clk-pins {
+					pins = "gpio10";
+					function = "wsa_swr_clk";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio11";
+					function = "wsa_swr_data";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-bus-hold;
+				};
+			};
+		};
+
 		sdhc_2: mmc@8804000 {
 			compatible = "qcom,eliza-sdhci", "qcom,sdhci-msm-v5";
 			reg = <0x0 0x08804000 0x0 0x1000>;
-- 
2.34.1

