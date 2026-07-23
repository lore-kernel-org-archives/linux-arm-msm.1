Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868BF2F290A
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784808941; cv=none; b=E5kJHtnwlk5RwpD6QjEWZP5XYMVYKieGUakK5Eup4z7V6kip0XT0rJX/1UTbv9xiXdQ/VW4LI/aAx3ZrKWt2QBoX8CDXFGe19StGgcWX6WeMExhdcuhMMjVe2OwbFXcy+mF07v7ymO5BxBVSXfvEpP/mMJgfjeWANLkXWaH7Zwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784808941; c=relaxed/simple;
	bh=pUsDDKtATnBmK28A4OuyxbVjJHQFs1aoNgeFoAmpdAE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KLAeF03eHf9NZTbbvQkdWZlkNccejidbX9isfa3d0gpbyERJgo/y1ZvFx4FBchqAaBfZ/WzWdkZXpKlQ5P9L9lPR/g3l7anZ3A2JaWeUcCh2r9MZIK4qD3dgYFBTSU4Ff/KYoe0T8k1OFCWZ+Q/9HoNaVabMMAh+u+5qk7/94fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YWMwgnrC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A9ocViR6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YWMwgnrC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A9ocViR6"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qgRl3642633
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:15:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=h1+biSORydH
	ZCx/JXqW7RbDVKyEajOCJipzGAMVjUmM=; b=YWMwgnrC0nJ6Jlm6y2sZhzW9Bb+
	ifNDbO8KME2Cj+J3Ht+PS+7/9wskrH3twS4LbJpKpmMPTbsw10OM+kKCI0exvwMX
	ATuwBAR78+oLGGieJU+Gbi/9jsGcfy7HN6OTR9IbEcPVVdL/ehcq4LjUE9jYnSKr
	8mkvJ+/xMBBCAE9Ap+nB97YE/ebNspzeCaw7DVbZY56ozAosP9ddxdh7M+ZUqBHI
	LdvMHxrMu/Xj50sl9MbhO3DdHtUfy9y7DuxJRc90oIoleiTqlG/jllrPrICjOq1Q
	itxTQnTwWdq8h5/k3dm3rdHuLHruevQCJ1Zzid4UD8Isi7gCcEIu1Neo49Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkayh9yc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:15:35 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso971592a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 05:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784808935; x=1785413735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h1+biSORydHZCx/JXqW7RbDVKyEajOCJipzGAMVjUmM=;
        b=A9ocViR6g8xl9PKe/RuVvzxvHYAkX+5i85EpoMzaxq6ateaWBJTt/9nQdZSB9P3ncj
         rivuBc1fZMURIRa5GHnhT8HP4Oz/aYhw728BBNp8cVI4/OlcKWw8ml96/8hGbn022dM4
         elAh+SAXUJl6wuwTv7/FctmyjyiCEl07KndQqm0m38BFubvvY7r7TNzFGUxvQcaj++qg
         hQN/pImZaJopkqz6rSz5aIsdVgBTdty8S+hJBecUee+Bm7UP6TcAGOfMt9r15yi5sndv
         R4sWFhO7vwHPThG11ImpJJx0iogxFw0/99YkGnNGDsJXiPcKxW7U9l5W3zUsyYtsTpSo
         qoJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784808935; x=1785413735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h1+biSORydHZCx/JXqW7RbDVKyEajOCJipzGAMVjUmM=;
        b=ImaNOMtMxcPb5ULMEDCYjdANQONCapUxxVsxpnbhGnGWBS8Me3EVn4BnGDpgc2s3mJ
         0Ik5QjZ7h8q+VK3fyuz5ZxcJmz38cPgrI8GE5NtWBIboko9JrTBZUsO95c30ReyDWbpG
         t7AyP+x3myM5RoPdmiRhWwat6zaGN8u+qnJHuDpo+eMxc5tnIcHGFn9vhIkpmeREFiPh
         +l9bnwdYvQXiEUkD06hXnluZahc7Ek69BjW0AR8Si0sECr3aOLYMTHL8UkLIeFitOOVH
         89gEVwOqS1kyNBHuRDVxmlvTXIAgOYcV55XKXnZ2wYTi/e5Sv+yu5w13G/Hg4Ev+pU73
         XZmw==
X-Gm-Message-State: AOJu0YzHHeSVar72DX4o9RIZYOQp3r3dY15etO7AItUZ3QqXGAJT/a/K
	wl9BKquhEX8eWPxJTO16xWWxdptTk55+0cf7siKRCzADs1RK0T8R2AXJwATzUhNVgl0//h/lWKr
	eezDo/+wRcGgJFmB1yPGnu6Jcv/PVAo+gif4cIaZHzv1rHSJf462Abi04Rf6VkHcuLxJP
X-Gm-Gg: AR+sD13fl35n/c2QxqNsZFcArzDWePFdb6T2OLWksq2ddtAJoy6Ap+ym2+kDhCVu6rQ
	aRHJZNjandYmoFKieQVwG6d/3IVxqmtdM18PFmnVWCEm4Ri2EBcynj6DXsHnUrsRHV+3Nv3XG0p
	fxSocRUhXMvzzmoDU94RaHEYNA9CmKbzxTvYOEnByFohibP/KqrJYzqLYUYqN5rFJVgUhS8R0SB
	6n6Y26DCv1SQzm2XxELT6ghJZ1z9kO5OpVOrYyHgCLRFhBFg21bBjzYgJO9p0zLRTtqY3E2l7Ix
	M0W6ZEpejXNOaP/mnGXgTETV9u4IqwcuwwcGABzFvo12Tiw3lJAlmq0El0nhNYWiIH5aBynbJse
	GpnKyFedDSvqMLFFkcUNYytC/DQkQCA==
X-Received: by 2002:a05:6a20:c704:b0:3c3:7891:6523 with SMTP id adf61e73a8af0-3c44b0516e9mr3209195637.34.1784808934482;
        Thu, 23 Jul 2026 05:15:34 -0700 (PDT)
X-Received: by 2002:a05:6a20:c704:b0:3c3:7891:6523 with SMTP id adf61e73a8af0-3c44b0516e9mr3209126637.34.1784808933810;
        Thu, 23 Jul 2026 05:15:33 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f1a8a1fsm2687005a12.26.2026.07.23.05.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 05:15:33 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v3 1/2] arm64: dts: qcom: eliza: Add LPASS macro and SoundWire support
Date: Thu, 23 Jul 2026 17:45:15 +0530
Message-Id: <20260723121516.2341900-2-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723121516.2341900-1-ravi.hothi@oss.qualcomm.com>
References: <20260723121516.2341900-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HZgkiCE8 c=1 sm=1 tr=0 ts=6a6205e7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Cc5UsSPITet5yPTV4qQA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: jMI73_Rrmhu44TH0XnHMGtaUdQXmU09k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyMCBTYWx0ZWRfX5MndjtScPRsm
 YHLvdvtqob7p3MIhsGIeG895oPgXuqdm2MgoLvJ24tA25mVovlPUupjRlgqkOfbn2DHDVh+argh
 VV+pgOFXSrnYVFZIa0pL02eIlqU9Ph9rXkLOenNgOWgcwb0yWEROnYj+k+HE1aBvl8VfmnQnSb4
 NU9shkCpOX4bw5oIGJVExeVFZzQkfAq2vzBqDRTKGNbFvn/QCQGoohsV50wV6WxqpR83ikY54j9
 6fjBAqVbW9kOQXWdo5szlAYSObNm5Sr1ugFo3EZKBf3jvuumODMTS4Sj91GoY1FfjnsW0juL3M7
 1EeavSuFvr9pLx02momH6JgqYtc0l0szyboyyRR+77zZraOUgwkqc6JllpdyGW5qWPYMINneAuN
 C04KZWrBLcDye5mA+WcqYX4ys3nm8kzIh2xYUwhb3wFKnKm1cHYa2GlvcPbh+j9yFi5Pz/R8hji
 Y0NT647U7GDj/mWS7ZQ==
X-Proofpoint-GUID: jMI73_Rrmhu44TH0XnHMGtaUdQXmU09k
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyMCBTYWx0ZWRfXwSgZb9S1F6Wh
 b/rdu3z7YUGlYKlWoMbqrwaKXrWnUpk3RhUEFLCJL6Ks2R6H9XcE0aGIqtzfqPWEXlfXfboEBOf
 7S7L4ukyBnXqCKgkKKo3/vbBCX9PZjI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230120

Add SoC-level LPASS WSA macro, VA macro, SoundWire controller and LPASS
LPI pin controller nodes. DMIC and WSA SoundWire pinctrl states are
defined inside the LPASS LPI pin controller node. The hardware is similar
to the SM8750 platform.

The WSA macro, VA macro and SoundWire controller are kept disabled so
board DTS files can selectively enable and configure them.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 193 ++++++++++++++++++++++++++++
 1 file changed, 193 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index fa6a22f2da6a..33fcedfff7b7 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -19,6 +19,7 @@
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -2056,6 +2057,79 @@ q6prmcc: clock-controller {
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
+
+			status = "disabled";
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
@@ -2070,6 +2144,125 @@ lpass_lpicx_noc: interconnect@7420000 {
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
+
+			status = "disabled";
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

