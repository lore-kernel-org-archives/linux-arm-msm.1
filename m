Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792568247;
	b=fZrCtwSzDWE/6KEA2qKlHaa1k0NH95NUxyNSbHnEh9d4rk37yQG+UK0VML144vn6x9AY
	 u465e0KZI898aBuYjlf+QiWLzK05goS2gE+OBwAp9YP5r9pxFEUnk6lAEn9I1I88/qG3Q
	 +YOP+UizA1sq9afxKDj3nXT5Wj+18eivvnrSbMbjVr/dtCX9fvv+tbplN6jhZLmV+VhTY
	 n7FE9RnAzIPttenSpNSfAkXiOJh+TzgYQrbQ6SolMxUj7dPkb2brTMWNxU4UwFH2Os2B8
	 ECpOAaRD7IimxWfRXrtgo8g/fLY2Phulc1ReGozVXd4kZuAFU5eT1gYgQ6fYeNM957g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792568247;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2rZA7QUCdd2DDc4g73OokmpuG2DSpyK5MXIuYPZCTbI=;
	b=lXCEJT4t57PyTpVK6jeh1QB01uhG4TVsysD0BDgyXHyGI67kt637pC3mhOtu3Y8cU3jj
	 4sbJVakycW12to52Waip5srZ1RPvApBexcpFIPIkmUmNpF8alKMaznl4NVJKX7lvi/tKm
	 EmZYRJgQ8ipbhydmPx6arsSL57+rJMcN7KPNw9KueNYX28kxvfad8Dit8PQ0mCXpoTSrV
	 I8YEvV4+1EkFZpLaOVOvovN+j98MtKF4+AGPR3jtTdcZU08hNYu02RN0gvuv5ZpVvtqWJ
	 GJUGzztGjEHvKEYUSwyd/tDcsOLLHuikezUlffRYzmUCvSR1iMloXS/AIqmdkpzLy5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K7BWpIMm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hjSzr9Ci;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DD8606A31F
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12DD8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K7BWpIMm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hjSzr9Ci
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L7aCbG4124065
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:37:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2rZA7QUCdd2
	DDc4g73OokmpuG2DSpyK5MXIuYPZCTbI=; b=K7BWpIMmHXR5pAd0TJex7GHHXoy
	PaqfmlQP0141PSgO6ICfoqP3Ah7Lypz0UDqSSVxIJEo4S5FqC4bbbkSDUE5NHkzQ
	hRH5XN0UsESj6ROZafz57wU/8WUNh9t9ZOh6oUNX09qmH0/Kh5sO2sa99S15FN5J
	5DK8p9YMWWbMN2rUsm5ZDfpLc6qy7soNURSYMTYh7qkBEhj6/9LJOuVbclu/BfWO
	IJkM/+HnB9+ITjOQS0gqqoTnVCqggKYl9p8Y69CksE8K3NadII5n8zMXZfySC07x
	EAV2pntu0hvGNdDs8BMH7+tF0bfCyOA3+omjQghQbXiOm5t2q6s/8h9J/xw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r1pkp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:37:25 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1383723dfddso729832c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 00:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792568245; x=1793173045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2rZA7QUCdd2DDc4g73OokmpuG2DSpyK5MXIuYPZCTbI=;
        b=hjSzr9Ci+j8vTQPiaDleHGiGh2VDyl3KOV6nH8KSMsD+YBTsq3GaDA907kL+4DeHe8
         N86wBxrlRq77Qri48BdN6Nt2LCXarSTf/V8XDHPOmt80+y0lRS5L7w0y/I0X3WnLgDNj
         GMd7U6PoiyZzFd0gF4WNSg6+x6pBIAXQOgTpUN4OzIb8qOr+1utINXv/s8OP+k/Z1Otb
         BZ18k3NEtUdYs2XBV9dRKVPGJMWETbdgPduF1AIRrqAdMjqpm5/aAn2Sf0bJsBwfmIT5
         37hisdyGFg208pmUm30o4OaJ++MAzR3D+00cQBR2wH4T78WTkNtz3gmWpx1eCtIab4Dd
         XATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792568245; x=1793173045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2rZA7QUCdd2DDc4g73OokmpuG2DSpyK5MXIuYPZCTbI=;
        b=AXOC+CzYpxNhYFfIittzCPboYtYzsNM0ySDdPYy9Xtzys4SNx84YWwRJN06ffmKN14
         Wp6VB8EB4I8Gl7AoR9ogFoxWHdYvXybbhaJK2QeMRPPCOseGcFRwzsMtGchFdYicwGhy
         g4S1QPtI4GLtTwskCLZemB/s+0eNF5/RZHuJism+WWIbDFZDOUN0ysvQF94/2CymPWCd
         eMTh5HppPG+d1SLCLVoXJapqeB1AuoGB7wCnUbKCMrXMrPdFGtlGkyu+DkesW12JRUpt
         QnLAWNqOx0ZGCnxbVoQazSl0ExgvaYtZ9mDmQwTvi6ERzo0lbErUUHd6etRzl4om057Y
         LJtQ==
X-Forwarded-Encrypted: i=1; AKwUvBwoZNfOOhBm+WKXDkjn0BbYdNbW6FGgL/hQv3hhAxNTK9f+LqRkoPoC4sRthrNc1GlyXlyEohy0fIv1zpII@vger.kernel.org
X-Gm-Message-State: AFq9FYJHZox91DkUaKAycExtICVHlwIZqsyyOOCrxpSBku3I6Vap6xiD
	PqACt8H1hstZFjT++XE/LA04NJvwIB55OnNk8DIV9jLsHp2amnFeTdZLWq9Mz400vGvRMGmluE+
	DWnYruMX24EAiw7WK0Yd3Afebg1nRvbmciH1D2sbW06I6H3ZtrNiJp6xnghZsanT1q56n
X-Gm-Gg: AYBFou3WnF1u1Gl6USv+Dl7kBpcnV0nHU8V0Av5ZuyYJAGCGYQPYjfQltCEZ2pFdU7w
	ylJ/JQkAJVqRA0iPDjdrb8LP1eJBgLjt9LgNGmSDY2MlHkHeKOVcIipDeNd9lIGKwwm9p8yRbnO
	OLhNziw7FaRnS60FA5OVUB5WvNbcrSlpbOYgB87molhXsxg0bzDMAO1SP/3gIG9DgfQEMpoRBmX
	T8PZRCOkF7pZMNjml+bzr5REq7W278m56Yc5T9rleDH0syczpj0dmkHs/pnXcNFSLKwowRc9dZe
	kHLN1QxGBm/EQ7utzYZ449PrvGut7lLNh1O4l8OZy640fmd3O8NLi5nD+LC5TzOXu1fkQByd8sb
	KF9OcImJYZRzNlIO1IuE8WbLtLthL8tbMUbjjbmJw8z5Aphs07R50VQydwXI=
X-Received: by 2002:a05:7022:6986:b0:185:869a:8c64 with SMTP id a92af1059eb24-1909fc7bcd7mr2409902c88.1.1792568244225;
        Wed, 21 Oct 2026 00:37:24 -0700 (PDT)
X-Received: by 2002:a05:7022:6986:b0:185:869a:8c64 with SMTP id a92af1059eb24-1909fc7bcd7mr2409844c88.1.1792568243635;
        Wed, 21 Oct 2026 00:37:23 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d0a1sm4042471c88.14.2026.10.21.00.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 00:37:23 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v2 4/5] arm64: dts: qcom: nord-ride-embedded: Add sound support
Date: Wed, 21 Oct 2026 15:36:32 +0800
Message-ID: <20261021073633.2163128-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
References: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad86bb5 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=WpxzUcmsBv8F2e-3JPYA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: ghBuRNf366EIH9iu51s0DtSh-1UxNTJH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfXx3XEBGuPh1lV
 HH8M0hYdmvC13kCY5usfC6Hp3xHxv0OfwAudl/zu41L+kyljJXLIljJyX7c+NMlMjfnPsJpXuaZ
 WgdX+5LBzJhSm+gOMKzxhuVmV/7JAGHrONOtQJG8RxYJ+4YBXcC27KrWNIyU6Nvo/9flV5r9CXn
 pMY9qQ59C0mAow9uvN3mP/gifK2BkMbadZd6r9mxMV1YPsttLOKcPvefYyUKGGpqrOfB91RkZy5
 qtjcykwWqkS0aNQkyOhWH6VeBLQjy13IELsayQslj4ewtnC4PnQ0Ce0a9aLx+rkadXImbI6WGBa
 vcL9nEBEs1JG2Cj0F4NmezMLaYVYLx41v/NdIJIy9+dac+0WaRHUUuV2xEcqlHHt+P2Q2cGuyXw
 FcBmmYVbgEMQMKCjpvm4ekrwbiY5SaN558Ie4nPaUY2oMKsJy4IUnxGFpEKVSdKVLybjOZuzTv4
 JTX4wVBGztv+SjaZksg==
X-Proofpoint-GUID: ghBuRNf366EIH9iu51s0DtSh-1UxNTJH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfX4QPi8DlZTNKP
 SDCmtO9k5Rv1dbYSWRbHtqug8QV57R6wIzIFO6jcguC1x+y2Z6TcU7PgeFS4JC0WQAZ0Wqu98sM
 J4p7AsVZd+WaW2YT1ceaARuMWHLt8zs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210030

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
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   |  30 ++++
 .../boot/dts/qcom/nord-ride-embedded.dts      | 166 ++++++++++++++++++
 2 files changed, 196 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 1ead642254e0..8f07f9f9ac62 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -1106,6 +1106,36 @@ nsp_data_noc_3: interconnect@1fe00000 {
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
index 49635695f832..34119b80d395 100644
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
+		vcc-supply =<&vreg_per_3p3>;
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

