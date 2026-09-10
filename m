Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6162356A38
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 23:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789082243; cv=none; b=hGNaTRJ/6Kw30v1XmqyfhUZFMqF5VEMzTkeWuSLmTTeKHM5bQxl0nj7h/slWkCoAjalpXiRjEcjWf6O3InhSjRcy+AoU3CkDJpIzqluPA+TOrz7oHr6QWe1EZjVRSaEwn0y+ZWq+dewjSumDKn/H3sTi2J06F5LKC6ogWEANThk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789082243; c=relaxed/simple;
	bh=scUkbh7aM6dsaWIUWWRpZS6yrZXIIs0yC4l9VgoW9CA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rsoy7sB1lKVNe0Ktq2+MXSSvih686coVZ6K+YkKWC7P6IV3stELQuObMsglNY/fqk+Wu37GrOW6xw2ZmNoeQcyXfA3uIuaduWV24bjW4ZpPfETbhUkygTbBPOJX+3hb8FwrTeGDfH3r7NgDi+tunfAjiKBXQCg5xir7DbBeuq1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eWWE9jDR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JlWaSfkX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eWWE9jDR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JlWaSfkX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ALTYWF2708470
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 23:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JwmD/vVkRH/
	B+an9newKRj3uwd9lkCW6spd4hrDujhc=; b=eWWE9jDRfC/3+ZX8H38dz7cfkbn
	uldELYWhIJ+CrQhCU/zn2sPGSkpxavSVfYLWu4WZGmBmFPcPDD1PMDpDqSQQIAKs
	vg7/rdH+7429M3GDQxAzhimC586GiI4dZClviQL4dRodtcmuvM3uJ+l+umrSANoG
	Huz2QA/38I7Mm8KCIaJjr5G54bX7AxyDibGovB0mqupnHPkR8eHaaURQFIcmWKcf
	UaFoA+MwYueGgjEyr8tgzsOFZTq5xCMrFIo9aoaouh49m3gwyXDYU/o7mU4K4Grn
	tVZsDRnlNG3L2jrp+2yRcJMSXlN7cjaxWjL9icnf3Qegvtdop4HTILXi8HQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm2q10pc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 23:17:20 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398fe469aa0so424073a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 16:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789082240; x=1789687040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JwmD/vVkRH/B+an9newKRj3uwd9lkCW6spd4hrDujhc=;
        b=JlWaSfkXiu7keVnyagfwMgxJJwnL35RXDS7MaAUFYkBDXGZ4iMhf2UUSA/yJwnz12A
         ChOmW8KzEZOYN4RcUvZjIcz79t4uL7gHebzpCjCHa6zBID+s7kSvWI+43tEAV8Ncgrg0
         MAPwk5gWpPaZjqQfMqWheVXbPlheor7wTxFy4/w/buDBU8RbKiQrukam7Gpxhfan9G5X
         Flsjqy1tsppHjBWXYtZsMQbgrsN0ui5eYBqsgrI7YDhCQ2Yy7eZ8ertTAsEgrE39lNhC
         tbaSBXIukYYxp1IQAhT9JbCDU3uKTD+J00kD7mqIHJGLwMsqjDDZdtNHuVGqiSFqAYKz
         cpzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789082240; x=1789687040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JwmD/vVkRH/B+an9newKRj3uwd9lkCW6spd4hrDujhc=;
        b=Uh6yZJ0Zq/jZrh5BomfPS2ocG9fZOZHC3H8fYUbsNvYSlPsOxL4BrV9bUC4VbzgiKa
         89/gTuqgZWaoLdOArS8GbLCFysBXcg5qSEAyvNejU5EhdXXWjwE5szCTlnjKy+UQimGP
         cMkwuiRaPNox7NskyW9uBWwgTSIq7D6E8k0J075qSF6AZ+g8oj6V1LXgv+tixlPtgrzd
         EG67YDQz37zcVhG1Ukso4S4yhTSAwfzedo5RZoN6P0a0fD+gpsozZIU6QUivrGwv/b7u
         2w5XAKcCu7kB1RZobUOpXne2u9WwZteVUl+OHdp4qzUIBbnT0EY4oTKVJjyAuA89yVgP
         oVdA==
X-Forwarded-Encrypted: i=1; AKwUvByuy44cYkbX/m2pEZF5GU8cu5JKfdz9aKJQYq60Bdy/Z3n6BZ9LdPx6zObc1KjIxlEOEjZXjsDNFSW2oGYE@vger.kernel.org
X-Gm-Message-State: AFuF++mPaaWY2ECY3BaohOej3SKW4xgRzoH3WDWpLRgHFcCifOPMLpj6
	vZWmkqNgGUlTLPcMcNkCSc+48hcsa13NfSOJ1HzDUPOWs0keqs9+DZhK44UVDqMXsi9NfNoluPN
	cBQV/95rr6zqaUmOXxYHCCOTV4oEW4fbGxDSLH9wfmC4bdnpVAvDfXGucLdaufBj0DVhk
X-Gm-Gg: AYBFou2i/c9YGXk8H0ZtDs9KrDqgIapzXyRs8xvDk5lmxktx/8QgEEMYy/B7TvArPgE
	NbfeqSZDEfG2K9N1uaNS6zY2A4nobtUiYHDAEJvl9ra3qX8twhhooVyHP7PQ+Xnq14t9iyYifDf
	kSogQTbiHHxv41PW1T/gTLOzb9D9uHdI6v9K152Xq/oiQkwf8x21in2cA/CT7QhIafTpH0p9qf5
	7VUf1yvm7WRIV5KD+RP0BD81iMLrEqI+eygaA5NCaprKfo00z7p+rT5swlPM+TuLjp2e0ZEJ1QJ
	KDoJXIwg5kzQcA+4VbuKYSg5Ofo1CaL1JqhjJ3J0eo091zAvnRUKmd0CV2XAYz3cyTiCWZZwP7g
	iHpbzPFzKuJ0/MLPKOpksoTojVdnHqnaQINJP
X-Received: by 2002:a17:90b:3dc6:b0:398:bc52:825b with SMTP id 98e67ed59e1d1-39d9c3aeedfmr1848478a91.21.1789082239650;
        Thu, 10 Sep 2026 16:17:19 -0700 (PDT)
X-Received: by 2002:a17:90b:3dc6:b0:398:bc52:825b with SMTP id 98e67ed59e1d1-39d9c3aeedfmr1848400a91.21.1789082239207;
        Thu, 10 Sep 2026 16:17:19 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f7390csm1204374eec.26.2026.09.10.16.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:17:18 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/9] arm64: dts: qcom: shikra-cqm-evk: Enable sound card support
Date: Fri, 11 Sep 2026 04:46:39 +0530
Message-Id: <20260910231642.1794948-7-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=d6lgWhjE c=1 sm=1 tr=0 ts=6aa33a80 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=0XATH8VR6Q797auvcJMA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDI5MyBTYWx0ZWRfXxlOcr3XR9koV
 6ZeGeUH0VR8KOWp3Wjh83Ya2xZ8R/snnrKPC9dpseukeW42G4BAS+EvWDuFLEevuEEB27irYbsI
 B9ILNok51hGjugJamfgfZ0MUxqmd5eoCTC2bZMlo4XcUwe28GLPtRjmegNFMzNhimrJBoMqPsRp
 Psxkttsd23/x4L8XAON0Cv1O5fmBdnokF6bnAeymU6Objsnt1zWmJXuyQCK1OkaqARC238T764X
 xESz73C1pcKi5pJjibNbqg4l3XGJ3x9XNhGFaMzNlamSzT8lVvLpgIe/0AuFmx3wvt3n9V3qFFE
 zpxBQac2TOdEYrK4ACHJtoqaW9ETL5Iq60Penm/wi1kUAHYF6nGEL78CK366EeezUogYRP/4Vyh
 sHXJYfI/Fb9lsJ4ImEzVUb8D8+B6sysHR8PyT2rFd8wM5ouvi5T9PMkBEutogvpCcbenMhcNcfQ
 M8KA9k+y3u/9LLGLnZw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDI5MyBTYWx0ZWRfX+U15PDLGoJTX
 VcgLAAVBQhrqMWXMKGzbWzhnI6zQ7jwhib/wazcdlQ6BL9x5GH9jA8HEe9Dqfan/4KHV1G1RadQ
 uJHZCnrjUxsoQZ0ACu1sILEc6CRCYaY=
X-Proofpoint-GUID: ww1qJxkVckWQUHvr7puuoprRkZFJhBEw
X-Proofpoint-ORIG-GUID: ww1qJxkVckWQUHvr7puuoprRkZFJhBEw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_07,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100293

Enable the sound card on the shikra-cqm-evk platform, including
the PM4125 (Rouleur) headset codec, WSA885x external speaker path,
and QAIF backend links.

Also enable the required LPASS macro and SoundWire nodes, along with
the necessary pinctrl configurations for DMIC and I2S interfaces.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts  | 185 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi |   5 +
 2 files changed, 190 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 6b963df6f1eb..a66608d75309 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -21,6 +21,110 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	sound: sound {
+		compatible = "qcom,shikra-cqm-sndcard";
+		model = "shikra-cqm-evk";
+
+		audio-routing = "IN1_HPHL", "HPHL_OUT",
+				"IN2_HPHR", "HPHR_OUT",
+				"AMIC1", "MIC BIAS1",
+				"AMIC2", "MIC BIAS2",
+				"AMIC3", "MIC BIAS3",
+				"VA SWR_INPUT0", "ADC1_OUTPUT",
+				"VA SWR_INPUT1", "ADC2_OUTPUT",
+				"VA DMIC0", "vdd-micb",
+				"VA DMIC1", "vdd-micb",
+				"VA DMIC2", "vdd-micb",
+				"VA DMIC3", "vdd-micb";
+
+		pinctrl-0 = <&i2s2_default>, <&dmic_eldo_en_default>;
+		pinctrl-names = "default";
+
+		headset-capture-dai-link {
+			link-name = "Headphones Capture";
+
+			codec {
+				sound-dai = <&pmic4125_codec 1>,
+					    <&swr1 0>,
+					    <&vamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&qaif_cpu VA_CODEC_DMA_TX_1>;
+			};
+		};
+
+		headset-playback-dai-link {
+			link-name = "Headphones Playback";
+
+			codec {
+				sound-dai = <&pmic4125_codec 0>,
+					    <&swr0 0>,
+					    <&rxmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&qaif_cpu RX_CODEC_DMA_RX_1>;
+			};
+		};
+
+		wsa-speaker-dai-link {
+			link-name = "WSA Speaker Playback";
+
+			codec {
+				sound-dai = <&wsa8855>;
+				dai-tdm-slot-num = <2>;
+				dai-tdm-slot-width = <32>;
+				dai-tdm-slot-rx-mask = <1 1>;
+			};
+
+			cpu {
+				sound-dai = <&qaif_cpu AIF_TDM_RX_2>;
+				dai-tdm-slot-num = <2>;
+				dai-tdm-slot-width = <32>;
+				dai-tdm-slot-rx-mask = <1 1>;
+				dai-tdm-slot-tx-mask = <1 1>;
+			};
+		};
+
+		va-dmic-dai-link {
+			link-name = "VA DMIC Capture";
+
+			codec {
+				sound-dai = <&vamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&qaif_cpu VA_CODEC_DMA_TX_0>;
+			};
+		};
+	};
+};
+
+&gpr {
+	status = "disabled";
+};
+
+&i2c3 {
+	status = "okay";
+
+	wsa8855: speaker@c {
+		compatible = "qcom,wsa8855";
+		reg = <0x0c>;
+
+		pinctrl-0 = <&wsa8855_spkr_sd_n>;
+		pinctrl-names = "default";
+
+		powerdown-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <77 IRQ_TYPE_EDGE_FALLING>;
+		vdd-1p8-supply = <&pm4125_l15>;
+		vdd-io-supply = <&pm4125_l15>;
+		qcom,battery-config = "1s";
+
+		#sound-dai-cells = <0>;
+	};
 };
 
 &remoteproc_cdsp {
@@ -42,6 +146,10 @@ &remoteproc_mpss {
 	status = "okay";
 };
 
+&rxmacro {
+	status = "okay";
+};
+
 &audiocorecc {
 	status = "okay";
 };
@@ -61,3 +169,80 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&spmi_bus {
+	pmic@0 {
+		pmic4125_codec: audio-codec@f000 {
+			compatible = "qcom,pm4125-codec";
+			reg = <0xf000>;
+			vdd-io-supply = <&pm4125_l15>;
+			vdd-cp-supply = <&pm4125_s1>;
+			vdd-pa-vpos-supply = <&pm4125_s1>;
+
+			vdd-mic-bias-supply = <&pm4125_l22>;
+			qcom,micbias1-microvolt = <1800000>;
+			qcom,micbias2-microvolt = <1800000>;
+			qcom,micbias3-microvolt = <1800000>;
+
+			qcom,rx-device = <&pm4125_rx>;
+			qcom,tx-device = <&pm4125_tx>;
+			#sound-dai-cells = <1>;
+
+			status = "okay";
+		};
+	};
+};
+
+&swr0 {
+	status = "okay";
+
+	pm4125_rx: codec@0,4 {
+		compatible = "sdw20217010c00";
+		reg = <0 4>;
+		qcom,rx-port-mapping = <1 2 3 4 5>;
+	};
+};
+
+&swr1 {
+	status = "okay";
+
+	pm4125_tx: codec@0,3 {
+		compatible = "sdw20217010c00";
+		reg = <0 3>;
+		qcom,tx-port-mapping = <2 3>;
+	};
+};
+
+&tlmm {
+	dmic_eldo_en_default: dmic-eldo-default-active-state {
+		pins = "gpio71";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+		output-high;
+	};
+
+	i2s2_default: i2s2-default-active-state {
+		pins = "gpio100", "gpio101", "gpio102", "gpio103";
+		function = "i2s2";
+		drive-strength = <8>;
+		output-high;
+		bias-disable;
+	};
+
+	wsa8855_spkr_sd_n: wsa8855-spkr-sd-n-active-state {
+		pins = "gpio2";
+		function = "gpio";
+		input-disable;
+		output-enable;
+	};
+};
+
+&vamacro {
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>, <&tx_swr_active>;
+	pinctrl-names = "default";
+
+	qcom,dmic-sample-rate = <4800000>;
+	status = "okay";
+};
+
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index fde7fc035bf5..a48143ca5ef5 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -93,6 +93,11 @@ &rpm_requests {
 	regulators {
 		compatible = "qcom,rpm-pm2250-regulators";
 
+		pm4125_s1: s1 {
+			regulator-min-microvolt = <1396000>;
+			regulator-max-microvolt = <1396000>;
+		};
+
 		pm4125_s2: s2 {
 			regulator-min-microvolt = <1000000>;
 			regulator-max-microvolt = <1200000>;
-- 
2.34.1

