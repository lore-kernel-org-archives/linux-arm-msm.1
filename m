Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792568251;
	b=XaCTr4XEWd4P7BXM5PDPnZNnl2p4Uh5f0zVIzrwV4MTYG+YHq5na4+kd2rCOsD9k5UHp
	 2zwJpAO4p2Rc0Av2SEF7Hrx94h8PYcA5WvPIJrk/BBzbipsEA/QHsATSH5hy90lEOULaE
	 0besks4SfmP0GpmrkdndAVVKR30hrmrhptEYzXQTRT9ll39wOyvBC8LEDd2WzbRISHDQg
	 qQ/cdLQYC2VdL799dJtREFpvE3/MB/HBwURDd1MIaug7bmZK8vHlFctnDIsKLkK5AOp8L
	 hKeM+vjOJm7AT+2NB3a4bVuWDafaSFXt4juecOlGqorwan8MY2vl/P0tta7TG1fVxYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792568251;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IMy6Ev1Iqy7o5vhaentmWFPLH1WBrPlgezDbmf9nqJ8=;
	b=5obIJXrXI7RqpSCG9L6VAauwFgb5vv95UW0WyzcEGdFzKB1fuYvNPtn2JEWGBwSFHe+o
	 5irGAIDXCzYwyHjwXoAQ9xHu72fzLD1PV1IIFoZbKI/ZjV6r3V//AY2RgqF/UhDd2l4fa
	 ueZayz/jzMF97bZsvVxSHEtdRFLtTMqdv2lx54mGngnw5GC2+99aIVH9VlxKVgAVQRObZ
	 ae0K5jbTf7U07z4ajSOS+VLtXxRpHmkHPJT8//hMp1BXzETklVint0hAw9YSpEEiSyVVQ
	 9d6sjORL1l/owUEWtSNzO7LQB2N5UL3kdHM2YAhKInzggzdiJyT82QQhxEjOuJc6nFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QPeATwSD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KZywAMDH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D70F606A332
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:37:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D70F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QPeATwSD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KZywAMDH
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j0r4165017
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:37:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IMy6Ev1Iqy7
	o5vhaentmWFPLH1WBrPlgezDbmf9nqJ8=; b=QPeATwSDRWOgzsrvE8gFroN1/n0
	rG9FgOouFSxiEjpVN+sx+9TrOHcYnIlOsNCC873KdHCxxYF2ccut/24bfQ10WeZ6
	o9dePkOYOqm9ZkFnXioLF2/uUOF+3uGcg3oapT0bt7h0VdSIa3fcit8as27avs6n
	f3lMFXKpLVfu4SOWl9wTmCXmENshkk61boe1kLSWb4X9Fb/VyXCX3IGmCN6XiEAP
	j7STghWpPmltExaRa8QBHQIhWSWL+ph8NCGPto6eARzsi2Qrjce792uimqgZsyBf
	g92oWx0cwLHkM0FDoEzpXdpj42+FftUaaoXBACrslnnT8u0y+EbBFKK12aQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs01sq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:37:29 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1663fb7e005so677055c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 00:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792568248; x=1793173048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IMy6Ev1Iqy7o5vhaentmWFPLH1WBrPlgezDbmf9nqJ8=;
        b=KZywAMDH5EmL34wKPMV0Up60h8wTjz2R7ORey/P3APyhDFXV86qbKZFoEtGFL+DaEq
         BZAbDicHgUlP9AcyvHBQeTxHA6I+umUYDlOikGiShmmOFNqFSa6+TMBkCza80yF3+kU0
         QGCNBUrCfFnlSXmr+ixND2qonP3cIsJjkfVbA4zmbqj69GrV1MUY45INbRUSyECDKXF3
         TsbjtIs4leIhqNJzUtetoTb2FDGVe1N+zhxbdmbVAWNmHwLeUTibWtV6JR7GhhnjZEAs
         LQTkVrCN3BL5raF9rzqSw9qCRHjsh72MzvCZ7p6HdScjKgbpIAn5xB0+h3LBO0exQ5Ee
         br/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792568248; x=1793173048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IMy6Ev1Iqy7o5vhaentmWFPLH1WBrPlgezDbmf9nqJ8=;
        b=o0sx7SAxQfwcQdrXl4dXHPjT+IBRDyCvjpUyhdnqb6bDhBYrD4+4E99YkakW0BK/fF
         7DZVnG53BmG6xau/WoeuPaX2MEttvVYITMG456+NvFXJyCRUmhV70ZnVIamkhQmmdcY/
         R5d4hKOVF9/LgUVvWd6YyG36NeotcKlCqsA+RcKjbegSh0mipmKqGLls3PC/0waR6OrL
         XRnWDV5UJd0S+/JXyzccE+oGGQBaLCTwp1KELO9Vyy/1bsh9o0kpTkBQsnAte3MtFQjn
         OWrBQGZQBrNS3+BNKZwqKq/aPGSr2i1jDRgRNP3wmxpWe20vhR6w2D9185wZeN9dt1mF
         LBBw==
X-Forwarded-Encrypted: i=1; AKwUvBwmj7RlhDqOd6mWysVda/fJigaEUrH+Vn///gDqSRL4bUKgxpVK0QY2ADXQ4cMiw7ZqMEvGjkUCKftXEdnj@vger.kernel.org
X-Gm-Message-State: AFq9FYIkor0C4oj8wc4DTqZ7g94sgUvejUSE0Ag9Xx8RJD8mLDqZjB2a
	1F574cSW+AWfdJSXbTkeiSW5lVt1VwOL/s8hL1vQFzclrN0kagiKiKeTv59CXRDp5XDOvfCTZ6A
	GW7EWNdlcahdzAguZrArS2/YuHsmaRvQHlAzj3BWJKO9LjwflmHembdMqruU9yDdhIR11
X-Gm-Gg: AYBFou0kakJJLNnCMg0VvB7PUiqtgIsykkMF0rnO0t+wBeTh+6kypEW3CeWZvW9Rj6s
	xlfnb/T031y28V/PvN6/tR5DAsCQMFkV9G70NyyTHcZHmyDJe4D9/QZyHq+RDpTtly0vHnjc1bl
	wfJKusACFDxJg0xLiO7eUSfFKSgwH0r/9x2s082eW25vPeR3vKnGwDGBgYBFg/rTWmQfmoGkbST
	2GqJwaPFzVO1+Am+A2q/TtqzwcAt4rkCIs20JLG6MAaNIwV+aqsuRn5FE0f7Dy4hqdRJ1a2rO5I
	d6vx21RkxuG/hG/1CfkylK5oi/Vu6hRsqrXM3G5oG04n9MfIrNrLG5BzrQgOiJshKTFGab+TPih
	I+1XegC/kw5kLdzs3EFCrI1DeLZ8QLfWi+EDkOuLGoXKouD8zpLa/rLFOU2U=
X-Received: by 2002:a05:701b:2097:10b0:168:6ad8:e88c with SMTP id a92af1059eb24-190a67fe090mr1853738c88.39.1792568248032;
        Wed, 21 Oct 2026 00:37:28 -0700 (PDT)
X-Received: by 2002:a05:701b:2097:10b0:168:6ad8:e88c with SMTP id a92af1059eb24-190a67fe090mr1853702c88.39.1792568247415;
        Wed, 21 Oct 2026 00:37:27 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d0a1sm4042471c88.14.2026.10.21.00.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 00:37:27 -0700 (PDT)
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
Subject: [PATCH RFC v2 5/5] arm64: dts: qcom: nord-rrd: Add sound support
Date: Wed, 21 Oct 2026 15:36:33 +0800
Message-ID: <20261021073633.2163128-6-shengchao.guo@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad86bb9 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=ZlzAYip4OQkxlMcad5cA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfX7xlpwOURowfH
 XNiFc8oaopmDPq+s9f3PDArW/C52Ossh+z+Xi0yzKFFSesOujMm2CGeV7ZvO7ansPMq2bCfg0Sa
 OH/hM5lGhLM7NH3i47YL64U4v8j5OMCyBx4LLgXr5s6zCqBTiGhSCBmj7Mi8+UqwCM4rHXds+Mk
 qviYRTvVc+NFFZuXh+zbJK9FeOnQ/0npOblS0Ljm/Voeo8YXwCY2FnBw3P6bnOpu9gq7hhSVje3
 e2s/Obra4uG+H6VQSYWMC8q1sXxlZTHoOSCGzpi5AMxuzsdLBPfV1YNXcGrLghjhAoqG3iO58nJ
 ngbPJQiiqdo2LAHB4OTvgFTX/MKHQAETkdxM3oCUdzhAI7O18NGihgno6jDBFbTOtmBC51C+5DM
 7w3+Jke8JkZ1GUiQNkJvERR5r4lcabjsPvcZSnH4tZZYvQOmyI3Q94Rj6pkHNfZMb2dkuf+Olrz
 MpkZSb3R0x1cSYq9+dQ==
X-Proofpoint-ORIG-GUID: 9EEyHwsMhMNNdvnZy8xyYuQgOmGvSiFo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfX54WDGfNkaKGc
 sQb09Nw24s0u8N6WW1AUaenUG+SaZE5hjycQurwH+QNOkIJDZEnLM+FkxKAnoaUbZG4bqzuKOTC
 MZnhFCYKcWcr+eOGj7I9CTj4/6+6dCI=
X-Proofpoint-GUID: 9EEyHwsMhMNNdvnZy8xyYuQgOmGvSiFo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210030

Enable audio on the nord-rrd board. Add a soundcard node using
the qcom,nord-sndcard compatible.

Add PCM1681/ADAU1979 codec nodes on I2C18, with the PCM1681 system
clock supplied via MCLK0.

Describe DAC_ENABLE as the enable of two regulator-fixed supplies
(3.3V and 5V load switches) feeding the PCM1681, and the two MAX9892
click-and-pop suppressors as one simple-audio-amplifier on
CLICK_POP_MUTE_N, routed after VOUT1..4, so DAPM controls the mute.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 153 ++++++++++++++++++++++++++
 1 file changed, 153 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 47978df0af92..b0abee05a8ba 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
 
 #include "nord-embedded.dtsi"
 #include "pmau0102-nord.dtsi"
@@ -53,6 +54,106 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	/*
+	 * MAX9892 click-and-pop suppressors on the PCM1681 line outputs. Both
+	 * parts are muted by a single CLICK_POP_MUTE_N line, so describe them
+	 * as one amplifier.
+	 */
+	lineout_amp: amplifier {
+		compatible = "simple-audio-amplifier";
+		sound-name-prefix = "LineOut";
+		enable-gpios = <&tlmm 42 GPIO_ACTIVE_HIGH>;
+		VCC-supply = <&vreg_per_3p3>;
+	};
+
+	sound {
+		compatible = "qcom,nord-sndcard";
+		model = "NORD-RRD";
+
+		aux-devs = <&lineout_amp>;
+		audio-routing = "LineOut INL", "VOUT1",
+				"LineOut INR", "VOUT2",
+				"LineOut INL", "VOUT3",
+				"LineOut INR", "VOUT4";
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
+				dai-tdm-slot-rx-mask = <1 1 1 1>;
+				sound-dai = <&pcm1681>;
+			};
+
+			cpu {
+				dai-tdm-slot-num = <8>;
+				dai-tdm-slot-width = <32>;
+				dai-tdm-slot-tx-mask = <1 1 1 1>;
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
+		gpio = <&tlmm 41 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_5p0_dac: regulator-5p0-dac {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_5p0_dac";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&tlmm 41 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_per_3p3: regulator-per-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_per_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
 };
 
 &apps_rsc {
@@ -377,6 +478,58 @@ rtc@32 {
 	};
 };
 
+&i2c18 {
+	clock-frequency = <400000>;
+
+	status = "okay";
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

