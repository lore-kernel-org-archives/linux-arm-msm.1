Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF74318EFF
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 02:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789353631; cv=none; b=rLaVwWCRoaRwlS5WS9QDNoYP41PyLvH9tcGFTxyjdwZ4IdagXuVQmSjwptNlk+0XNGzKNIOGPw7uM1Hv0imwpr9wmIOqrEk4mnAJZB3aqcBUgk7MpY8niAojrNtfwNyX9Q6fBLV0V3NkCDqwJJvo8TdhKsf5ussyZrW64sn+U4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789353631; c=relaxed/simple;
	bh=Hw6/IsHQpJhcpG1DHyObOULd+jT4pqPurN7coSKQuXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H7XBeiX/VKPA1OoAxyCQ5qtobMPI5KpQDzq2C/VroduNMaaOFOLjkDlz9eIMudzGfhJfWOrfJdCkT3AR9wVbScuhNGzaJ9DToQ6uEL1tgNWdAB/oRuMxlTcgUf5QJxh9joJaRW1CdA+I3dnSUULM5fU2dgRCnbanD+/Dd9PXrxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GtE8Vy4R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W/UGRdWC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GtE8Vy4R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W/UGRdWC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E2eSx23671285
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 02:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=X/cX0OG3G9T
	B9jy6BavgALGBPyz/BfnY6xv1S2eplbw=; b=GtE8Vy4RbNGzIZy+JGbGxN1zTz/
	+VOJ0k8WPtnIx1ljcdhUHTodBSzs8ZvS6XFb9Pr1Pk+ljxTq3eqrLeEORBPvGBep
	aIZojZeAH1qcSvYJNo8S9uYVZslhT2kz8yPgFTGsRkk9Zu1a6C5hgt6F6H4v2CRm
	gG9uVfUQWjU5AoP2LE8S58igz8HhAlSkPwZF//lPy/kN1306VD9GUbdeFH7A5Tn3
	+FS4NCit7ngl2hm7g2jjTmgVexS4yQqYUn6W/yPb+K0ylYv2+UKm07x8fcUarxqT
	K9NfkUuN4oC6u+2xIUQ9f69HufxZ4Rm1wHoCV7W9TVXe5vp5K6vR/8xL4yg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hsrj7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 02:40:28 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1b8088202so2348733a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 19:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789353628; x=1789958428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X/cX0OG3G9TB9jy6BavgALGBPyz/BfnY6xv1S2eplbw=;
        b=W/UGRdWC74LvkLVfkxnxuPiVUQ7ErJgxA80i9WNaXyqErq2GjdcQ0rnE94f02x0TXs
         T9TwZBKsjMXUcCxnHPWaEGx/0XakaXbcKOhn4iSil8RnzDTN9aoeDuCFCoIYE/ktyi5d
         MMk4Zw9B3WYh3AfidTOtQZalEP1LM2Ew+FjwgypN9I0+9e5YYu4UFPIy271+WXfs8Ce0
         LWnK+IutdJ3DZHoi4ssxb2iB5JSBo2bJPinnQUKNA5zg5Fc3D9nMpqUo+fFATRmvyyEC
         k/eOt8RPJYU94J0xHenY7B7VFTcM4Z1hAvWMSGpyGLo/2p5mvZ6JXKQuxRFTKor4KG62
         847g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789353628; x=1789958428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X/cX0OG3G9TB9jy6BavgALGBPyz/BfnY6xv1S2eplbw=;
        b=LzdRi/InORotoHWpDT4UjHqce5MpW6VeFJ97yLbEZz2HA0XZE/Vj36NqfvNL9/rCcz
         1i+qdRr3zuNiXjYcpQ1j5hW7frdgRnWUxBHt9oBEBup82mpGjZf55bU5AkXKMLZDtQT8
         1hPFX9EuMEcG3dfAiyfX7WPVA3aWuJmFi0V0+LmP6xgmsfpo129kKnu84Sd9KVvYQIRd
         mRR6WNOXkYYc5gf6IFBlSlROEAyKcbtm3TznaC9VfYvTV0vp0x8AHqibULkb5fQQ2SH5
         4yaCTlXfqFfiv6UHPwVbqno4xqN5Nhjgmktk9D/i1szaRSir0y6FNRdE+ncuHpnrJ+W6
         S9LA==
X-Forwarded-Encrypted: i=1; AKwUvBwPAtWbTqp2kReQr9E+1NDDag1PC9We4grW9tBUFPUH0Or5XmjHYYhofaTRRec9ogJV8D1/Cls/fmCYJw/9@vger.kernel.org
X-Gm-Message-State: AFuF++kv2gE7vjSDj9eyjlPMovtiDLxPUAQ+h6Bw0toBevA5iWCcatjo
	wbp+/Rnj5H/sS0swQlsnVNau3YpKWsqb878JHcF4ewnLziObsUhLBXly5DjN1f+/O0Es7Oyehaf
	oLE7CDnjFVd6xoZBy932jP6DKqGXdClaFSPcfVfTBAWvO3059JIfzTW8fLK43kW9MPEqX
X-Gm-Gg: AYBFou0sN/P+sOJdsr2wAWCT94WK4MbyPk9Piu8v06XrciRHjthVt23XQcKQahqU+pE
	PEhh+/w1UpF30oX89uqszkbCIBwVtAg0RYqIEfsVzTGy+8ekNDl3kLD6JXAVPez37vwH4KSEa8U
	jxz4mAGxn3SSqe1GoOArNCLan2cTiWr+keYt6F0QU7x4R4/eR5TpOTp+sHqvQ+hmP+B8xbFY7+x
	5uFphlajFprKFjHxW5SG44WCOS+nHJzluRKAVnqkj8Vz5xebo0s7PHcegJMWL6jOLkNFkJ00plo
	Ylvz/QckG5lx15q90osqDzkj9mYUY2Dh/6V8sqWqvlT0jn0jT6Dp6Q0VMk3eUT0Np83kcxuU3HU
	XqKMNpknOZap0pDupAXz1QDDGlS6hMN4gbyzy4m1IeQhc4bfTvTR7a752FsGw
X-Received: by 2002:a05:6a21:3383:b0:3c3:875d:7053 with SMTP id adf61e73a8af0-3db4049d144mr1092714637.8.1789353627707;
        Sun, 13 Sep 2026 19:40:27 -0700 (PDT)
X-Received: by 2002:a05:6a21:3383:b0:3c3:875d:7053 with SMTP id adf61e73a8af0-3db4049d144mr1092654637.8.1789353627269;
        Sun, 13 Sep 2026 19:40:27 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed79absm25943953eec.17.2026.09.13.19.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 19:40:26 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/3] arm64: dts: qcom: nord-rrd: Add sound support
Date: Mon, 14 Sep 2026 10:40:02 +0800
Message-ID: <20260914024003.120931-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914024003.120931-1-shengchao.guo@oss.qualcomm.com>
References: <20260914024003.120931-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDAzNSBTYWx0ZWRfXwIe36nUH/hlO
 xI7DeCZuagl9/2JSIRSLGcNSnuXUNGObFn57x8H24SuIZ2Aer9L+FYc4uz5rPce0ye1vXXNORxj
 hEC44zsLcY1RvE7FDLIZkRN3TFWxv1n30zlEdTZGgeEuKtFiGLtG7XAm58o0W4kKScVXYm+GvRx
 bZbOVAnM4QiNgtjIFXld+eRoX/g2X8fhNpuPJwnoVHIqy4dk1eIfbSYVX/oivnk1vYNj/ei7+pG
 eSMxJU9Y2OxfSv/SBxe2xUcBlms96YDdl02vjC6wllEI815gbF5KKUJj+zz0d0PZ5afbIvZiIUH
 oXfdMjaeam3NWd5SsiFAvsBhiF9ODLqjy1M4G97G5o+aSW13+saj4Fnzr2sy04YqCzY4Qje5dHS
 4cO8bXcoQQXt9cxSSNCAyDyNBkENzegr8XRRJWJHh4A0XBkwsC8S5yDrrI2EUKVHHOxmZ5SZAuV
 +m7h+If0gpnf2zCW5pA==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa75e9c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=-7QXgc7oF19ObtyNz1sA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: Yk7Rr8gjADpCEpeGlCHznHLWNQUQEmcT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDAzNSBTYWx0ZWRfXzuxCvYYeM37k
 kyI9MgLX+nANQjvp4okPwSDSHAL3XyqFriwGLdSKism7Tt7pJyQPMTPJQT5Zxnmgt2Whpc6738G
 0kEcrr1yMeCEdC3C1jhQuARe+OgQl58=
X-Proofpoint-ORIG-GUID: Yk7Rr8gjADpCEpeGlCHznHLWNQUQEmcT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_01,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140035

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Enable audio on the nord RRD board. Add a soundcard node using the
qcom,nord-ride-sndcard compatible with two DAI links:

  - PCM1681 playback over Tertiary MI2S RX
  - ADAU1979 capture over Tertiary MI2S TX

Add MI2S pin mux states (data, SCLK, WS on GPIO 73-76) and the MCLK0
pin state (GPIO 99) to nord-embedded.dtsi so they can be shared with
other nord board variants.

Add PCM1681/ADAU1979 codec nodes on I2C18, with the PCM1681 system
clock supplied via MCLK0. The DAC control lines come off a TCA6408 I/O
expander on the same bus, so add that too and hog its dac_enable and
click-pop-mute-n outputs, both of which have to be asserted before the
DAC produces sound.

Assisted-by: LLM
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi |  30 ++++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts       | 112 ++++++++++++++++++++
 2 files changed, 142 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 84ce57a07361..1cd6e0e17345 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -1155,6 +1155,36 @@ nsp_data_noc_3: interconnect@1fe00000 {
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
diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index c2f870ac4234..8798f69d3967 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -8,6 +8,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
 
 #include "nord-embedded.dtsi"
 #include "pmau0102-nord.dtsi"
@@ -70,6 +71,46 @@ vreg_hub_1p2: regulator-hub-1p2 {
 		regulator-max-microvolt = <1200000>;
 		regulator-always-on;
 	};
+
+	sound {
+		compatible = "qcom,nord-ride-sndcard";
+		model = "NORD-RRD";
+
+		pinctrl-0 = <&aud_intfc8_mi2s_active>, <&aud_mclk0_mira_active>;
+		pinctrl-names = "default";
+
+		aud-intfc8-mi2s-playback-dai-link {
+			link-name = "PCM1681 Playback";
+
+			codec {
+				sound-dai = <&pcm1681>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai TERTIARY_MI2S_RX>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		aud-intfc8-mi2s-capture-dai-link {
+			link-name = "ADAU1979 Capture";
+
+			codec {
+				sound-dai = <&adau1979>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai TERTIARY_MI2S_TX>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -464,6 +505,60 @@ usb_0_con_ss: endpoint {
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
+
+		click-pop-mute-hog {
+			gpio-hog;
+			gpios = <5 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "click-pop-mute-n";
+		};
+
+		dac-enable-hog {
+			gpio-hog;
+			gpios = <6 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "dac_enable";
+		};
+	};
+
+	/* ADI ADAU1979 - 4-channel 24-bit ADC */
+	adau1979: adau1979@31 {
+		compatible = "adi,adau1979";
+		reg = <0x31>;
+
+		AVDD-supply = <&vreg_per_3p3>;
+		DVDD-supply = <&vreg_per_3p3>;
+		#sound-dai-cells = <0>;
+	};
+
+	/* PCM1681 DAC */
+	pcm1681: pcm1681@4c {
+		compatible = "ti,pcm1681";
+		reg = <0x4c>;
+
+		clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "sck";
+		assigned-clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		assigned-clock-rates = <12288000>;
+
+		#sound-dai-cells = <0>;
+	};
+};
+
 &pmau0102_i_gpios {
 	usb_pd_int_default: usb-pd-int-state {
 		pins = "gpio8";
@@ -474,6 +569,23 @@ usb_pd_int_default: usb-pd-int-state {
 	};
 };
 
+&q6apmbedai {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	dai@20 {
+		reg = <TERTIARY_MI2S_RX>;
+		clocks = <&q6prmcc LPASS_CLK_ID_QAIF_IF8_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "bclk";
+	};
+
+	dai@21 {
+		reg = <TERTIARY_MI2S_TX>;
+		clocks = <&q6prmcc LPASS_CLK_ID_QAIF_IF8_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "bclk";
+	};
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0

