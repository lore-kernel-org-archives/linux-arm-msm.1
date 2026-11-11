Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794382317;
	b=POuVVTXPen+vigyoNN/dBbhqZMU3rrfJpE19JJIbTGX2AobkW1+BqVciAsty876lUR5E
	 uECzl1hTJ3pJY4CqXuTyhpABblBj286vWlkumWD6eCoO/Y9IidPkpUkdmDc+W4PwrahEb
	 uDE/NYW6PfpTupmaHh8gDq/rs2jARar6tOaOIhAf/Mgbyp3gPM5Nv3F86dtBic4xm7eZm
	 9YGa78o3dSyF8JbKl2/PYPENhrEOcEKWX7+u72KK4wRQpNvBiUgwfEHz/z38sfJtwmC/V
	 BukK55y7XpN2XvRTrl/BuAcfWkmoKyOySMykYsHFFeJogYj5XRZB1ZssTJWpoUwQQdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382317;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0y9iPA4x5dubX+cAZufMH2d3neDRLs0T+y1ymr7oOcQ=;
	b=TxEn3U7YsuZvnFC4fCYgueBTrhvbA8I2UEFbi+HVFu3bJa0EfKStShFRlUaVKadHD38x
	 ahmB5iDnWIUoyk3rEWUwWe35HY5IsZI/lPpNXdDwECjccH3SQ4cHntbl2dUx8ZtZ+b6SN
	 eeIgOJEssKO77tTWzUB35eDK1Ms40K+9/9qCBY2B/p1y0oQkKc4FGTAayeoZXo4iTg7rH
	 m0r6RXBjgzX6M5cWnLPDGEHOzRIESwdB9I7lgGMS0G1OVpv5PxB+sV16OLv9VmYmaqQui
	 EH19Mju8xq1TnuG2jnsWxrl24E5AbuIwoFaZF+fmxNoTRs8NE6iUUGeKiv1GxoVVfIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lH5HEtlc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dQunFWOn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5191960A3839
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:31:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5191960A3839
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lH5HEtlc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dQunFWOn
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KI1Z1369025
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:31:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0y9iPA4x5du
	bX+cAZufMH2d3neDRLs0T+y1ymr7oOcQ=; b=lH5HEtlcFuM8qw2ii7LoP0CqCmu
	Wz+Mx+5cNK3+0H0axQgZfKtrKztkxn5HqQwGXYrW75Q4bbgRduWR5a9tx88gP4BZ
	b2cG3T6vPN326shK+bIGCyjWm0TqJlS2nAgC6DMH75b8S4ocVxp9fNbIFPGo33fR
	FyOLO2fvr8cQCb+YYrTapN1XWNqHqNtlBIeTGZgREbbElyJafWCYzDqItlVNHL4s
	Jjb0VI8yZp2Tz03aLPctn7LvgL3STt8y0jY9Ay5qYfBmuLebeytIlnwgDT6wQdKd
	uCV0L9K2mSo5KE/494IwmXPtsqPNVvqcKv6GnU0soSp1g7aI00Ncu1ZoQ+w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvcpehk6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:31:56 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-37158b53d06so395245eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 23:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794382315; x=1794987115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0y9iPA4x5dubX+cAZufMH2d3neDRLs0T+y1ymr7oOcQ=;
        b=dQunFWOn2Ydo4Jm1SmWWL1jLddhGx5Te/HJsEx/rmCX2r/b6Suvg1kWBwsZq5mIEpL
         a+0VZE1nbuIYlfylf9y9AL1u4f02xkvVuKWsy1V4JQiSprLAOmxa6u4JN9qUnr5buvBi
         tR8oKNQscRhU+i9jygLgAmK9opmAall/EUvbiD+LsB2BQXznQdanZMFy4iMEYhb3r+k4
         k5pTg7anDenz+SLHQqqoRW9BGa7Mu/6yMcR8zbDdsKIWwOqKmU9s87o4Zmi0BclhbQi8
         oiIEUQY/cOvN1hkayifuKo8TXurj1ojP9tMtrQsga1KlrzGfmHDGXUQey4H+/GzvI7bA
         hMEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382315; x=1794987115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0y9iPA4x5dubX+cAZufMH2d3neDRLs0T+y1ymr7oOcQ=;
        b=MGIjFDQAkMBzWscNP6SgDeS5D5vVNmE65FG2f4i5urlx1efMZQJ40RWHH6XezraRqr
         8z0AUNMKxvVJN9vkodYO1E0FL+QbBG0+IS6bht+bUKnLcOBiohHnuvmlnluEZf0qZHXw
         TWhbsR5PIJowZJVGE7Eg/48xnBstdOqGQQcrEwTUhqEUSWsHyB/3tHERAlOlR+aaSnSa
         jshefWjqzwvFNr6vRRA2ye5ClBPfBn7O+HCDtuBhPRRXTWncKCnYmG9AapifB57iH7rI
         axmVpwdypT4oH961Bl9mcH+VZZWR9JslMgjx8K2Xo0noUXz0OxGaBvX63zqJedQzEdj8
         Fq6w==
X-Forwarded-Encrypted: i=1; AL+hErGzbsSMAFXbzHqo/GghN30nbOpTraX6dJppzBSdCbc5CzrQaTaZ34kAdhT6+9Yv7Jtq0jJmyCv0fF6dRCs9@vger.kernel.org
X-Gm-Message-State: APuU4Z+8HjbNLXjnKPvLzuJTvRPnbywm7dkNY1oIeGpPotjLYFjulZv/
	0EjNZZ/p7avOcDRWkkEnTkJL8Y6oW4AP4T/+LOYM96r8n36v5PToGroy34jnvYcanxR4Gd6Axtu
	bScucdD2dKx4wEiHtuBWxknnqJdurrF/ZOVxbTfSi926CV4iL8Rp0K7rV5GDWMlflq2TF
X-Gm-Gg: AYBFou2iFSYsY/7CZtuLQqgHHdbkYIhJqfjbRCCxV/cD92wUf6LMv6m+YhAOYET/+qZ
	bDt+g7hYmJEwgTQFcjUTt7vNMf4s5k2+28cOS61OAC0k/EoWKv32BfhsjdcM5CwSRbmB4Tdm9a3
	Fpn/Lhe8oUnrBbAYoaKznIn3fteHC+6kjSJjtCIpmehW7WlKpH+gJi++nyZ04rhveMjQfPNuQbO
	dCrzltEhIaSiM5uJHGX9V2se07I3ukOJXl1p/RXU4VCnRGvOJNhR7e+GBxVZgicVmPv4+H2S7zT
	PH8IH78W57e3PU4LsuuzSVzSftZHw/zGsT5qs4/TjO8ifm27qNT87xFX/zXrI5nUo+4PU/RbbZ9
	OcflaG/zYUcoBd+NeKYUng7BOwBPLDePf1I/eAkJOCD4o6weQCrX3IiMVEidPATz+TASjOwzpkX
	R/tGmoIF8rBloZQTi8QHEGGZbbiFpvKSu+
X-Received: by 2002:a05:701b:2302:b0:145:ac96:3917 with SMTP id a92af1059eb24-1b3bef3979bmr2092208c88.21.1794382315112;
        Tue, 10 Nov 2026 23:31:55 -0800 (PST)
X-Received: by 2002:a05:701b:2302:b0:145:ac96:3917 with SMTP id a92af1059eb24-1b3bef3979bmr2092194c88.21.1794382314403;
        Tue, 10 Nov 2026 23:31:54 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm27220027c88.10.2026.11.10.23.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:31:54 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 4/5] arm64: dts: qcom: nord-ride-embedded: Add sound support
Date: Wed, 11 Nov 2026 15:31:20 +0800
Message-ID: <20261111073121.3707030-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111073121.3707030-1-shengchao.guo@oss.qualcomm.com>
References: <20261111073121.3707030-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAyOSBTYWx0ZWRfX98WavRGEt1ER
 9q3Twv2CG751MorsLvykWVLtiTzYWIVKpZj51pp4AmyYEfyVUNA4WgEGhBAaIK7BvSBtsSsLCO6
 KR4NA3kQ//9duVtX0STurustWBFfqCKn6JtHKau4P/+/L5eyGRHuHlbitlh5h66xKagejLDtIhq
 8YLiE55E8xEsb5ueedcsyYU/cvxN4hFlKhvYFcJyb8AtluLeDe6H7KBriCgfnmo3MMJLlTStBLM
 Txdcg8T7EYXC6ys/l0iggm4X7GEI4hgISZst+M/OMQ/v3p7zHIxBRu3x1rHP8GP6phur861WgQM
 /PU75ooSdF7uXGNyQSuJd9WfJ/Fk18XkOfTExjbfTftn4gNuo7demictNVHUWb8Wo3g3vRIRPKz
 ZfEGRacviwkcHk1iKxmCojNcWLOsJP5ZTenQVqZ7CtyLDLddiqmo/XTD6QPe6mJ/2pJvnlW7q0K
 SlEqWkrlad10tcz2ySg==
X-Proofpoint-ORIG-GUID: lhdKL12jrnw-ndkPrRaj_TE1YNkQqj4K
X-Proofpoint-GUID: lhdKL12jrnw-ndkPrRaj_TE1YNkQqj4K
X-Authority-Analysis: v=2.4 cv=RfAFmFtv c=1 sm=1 tr=0 ts=6af419ec cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=WpxzUcmsBv8F2e-3JPYA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAyOSBTYWx0ZWRfX6DzyCv0dlVvY
 CkoZTXZ1tYJWhvzEYxEusTqyKv4LK3bmqE1iCHz3Kiyx52HYk0fg33a3DUicxO11MpjaKlhnPsb
 K7ImKxCgCzcJj6zWFp5Yy1WtzLvgLk4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110029

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Enable audio on the nord-ride-embedded board. Add a soundcard node using
the qcom,nord-sndcard compatible.

Add PCM1681/ADAU1979 codec nodes on I2C18, with the PCM1681 system
clock supplied via MCLK0. The DAC control lines come off a TCA6408 I/O
expander on the same bus.

Describe DAC_ENABLE as the enable of two regulator-fixed supplies
(3.3V and 5V load switches) feeding the PCM1681, and the three MAX9892
click-and-pop suppressors as one simple-audio-amplifier on
CLICK_POP_MUTE_N, routed after VOUT1..6, so DAPM controls the mute.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   |  30 ++++
 .../boot/dts/qcom/nord-ride-embedded.dts      | 166 ++++++++++++++++++
 2 files changed, 196 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 003c5ba2771c..18818575b3c8 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -1140,6 +1140,36 @@ nsp_data_noc_3: interconnect@1fe00000 {
 };
 
 &tlmm {
+	aud_intfc8_mi2s_active: aud-intfc8-mi2s-active-state {
+		data-pins {
+			pins = "gpio75", "gpio76";
+			function = "aud_intfc8_data";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		sclk-pins {
+			pins = "gpio73";
+			function = "aud_intfc8_clk";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		ws-pins {
+			pins = "gpio74";
+			function = "aud_intfc8_ws";
+			drive-strength = <8>;
+			bias-disable;
+		};
+	};
+
+	aud_mclk0_mira_active: aud-mclk0-mira-active-state {
+		pins = "gpio99";
+		function = "aud_mclk0_mira";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
 	qup_i2c0_default: qup-i2c0-default-state {
 		pins = "gpio111", "gpio112";
 		function = "qup0_se0";
diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 49635695f832..f092c2a85fbd 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
 
 #include "nord-embedded.dtsi"
 #include "pmau0102-nord.dtsi"
@@ -53,6 +54,107 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	/*
+	 * MAX9892 click-and-pop suppressors on the PCM1681 line outputs. All
+	 * three parts are muted by a single CLICK_POP_MUTE_N line, so describe
+	 * them as one amplifier.
+	 */
+	lineout_amp: amplifier {
+		compatible = "simple-audio-amplifier";
+		sound-name-prefix = "LineOut";
+		enable-gpios = <&expander0 5 GPIO_ACTIVE_HIGH>;
+		VCC-supply = <&vreg_per_3p3>;
+	};
+
+	sound {
+		compatible = "qcom,nord-sndcard";
+		model = "NORD-RIDE";
+
+		aux-devs = <&lineout_amp>;
+		audio-routing = "LineOut INL", "VOUT1",
+				"LineOut INR", "VOUT2",
+				"LineOut INL", "VOUT3",
+				"LineOut INR", "VOUT4",
+				"LineOut INL", "VOUT5",
+				"LineOut INR", "VOUT6";
+
+		pinctrl-0 = <&aud_intfc8_mi2s_active>;
+		pinctrl-names = "default";
+
+		aud-intfc8-tdm-playback-dai-link {
+			link-name = "PCM1681 Playback";
+
+			codec {
+				dai-tdm-slot-num = <8>;
+				dai-tdm-slot-width = <32>;
+				dai-tdm-slot-rx-mask = <1 1 1 1 1 1>;
+				sound-dai = <&pcm1681>;
+			};
+
+			cpu {
+				dai-tdm-slot-num = <8>;
+				dai-tdm-slot-width = <32>;
+				dai-tdm-slot-tx-mask = <1 1 1 1 1 1>;
+				sound-dai = <&q6apmbedai AIF_TDM_RX_8>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		aud-intfc8-tdm-capture-dai-link {
+			link-name = "ADAU1979 Capture";
+
+			codec {
+				dai-tdm-slot-num = <8>;
+				dai-tdm-slot-width = <32>;
+				dai-tdm-slot-rx-mask = <1 1 1 1>;
+				sound-dai = <&adau1979>;
+			};
+
+			cpu {
+				dai-tdm-slot-num = <8>;
+				dai-tdm-slot-width = <32>;
+				dai-tdm-slot-rx-mask = <1 1 1 1>;
+				sound-dai = <&q6apmbedai AIF_TDM_TX_8>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
+	/*
+	 * DAC_ENABLE gates two load switches feeding the PCM1681, one for the
+	 * analog and one for the digital supply.
+	 */
+	vreg_3p3_dac: regulator-3p3-dac {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_3p3_dac";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&expander0 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_5p0_dac: regulator-5p0-dac {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_5p0_dac";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&expander0 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_per_3p3: regulator-per-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_per_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
 };
 
 &apps_rsc {
@@ -366,6 +468,70 @@ vreg_l3l_1p8: ldo3 {
 	};
 };
 
+&i2c18 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	expander0: gpio@20 {
+		compatible = "ti,tca6408";
+		reg = <0x20>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&pmau0102_l_gpios 6 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pmau0102_l_gpios 5 GPIO_ACTIVE_LOW>;
+		vcc-supply = <&vreg_per_3p3>;
+	};
+
+	/* ADI ADAU1979 - 4-channel 24-bit ADC */
+	adau1979: adau1979@31 {
+		compatible = "adi,adau1979";
+		reg = <0x31>;
+
+		AVDD-supply = <&vreg_per_3p3>;
+		#sound-dai-cells = <0>;
+	};
+
+	/* PCM1681 DAC */
+	pcm1681: pcm1681@4c {
+		compatible = "ti,pcm1681";
+		reg = <0x4c>;
+
+		pinctrl-0 = <&aud_mclk0_mira_active>;
+		pinctrl-names = "default";
+
+		clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "sck";
+		assigned-clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		assigned-clock-rates = <12288000>;
+
+		VCC1-supply = <&vreg_5p0_dac>;
+		VCC2-supply = <&vreg_5p0_dac>;
+		VDD-supply = <&vreg_3p3_dac>;
+
+		#sound-dai-cells = <0>;
+	};
+};
+
+&q6apmbedai {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	dai@195 {
+		reg = <AIF_TDM_RX_8>;
+		clocks = <&q6prmcc LPASS_CLK_ID_QAIF_IF8_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "bclk";
+	};
+
+	dai@196 {
+		reg = <AIF_TDM_TX_8>;
+		clocks = <&q6prmcc LPASS_CLK_ID_QAIF_IF8_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "bclk";
+	};
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0

