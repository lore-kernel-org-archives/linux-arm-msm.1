Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C823C279B
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 04:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789619910; cv=none; b=EohUXg3NwX/mjzUkB+SYoncOC+Hngs/Il/vOUPX6xY0XwtJFSj3mbKcUmmG0Uc5aw3wx2jDA82zrAxh2lrp2vEJD0fk9f1RtCnseILkNlQg8+Cs8zzdhMJxaydnB9K1fqUPud5/YBVZLk7Eqi+DF8yOmnKKchVgzSrIE87s1Ym8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789619910; c=relaxed/simple;
	bh=SOV9jDO8GOlRCmornBB7OfFab2xr3q5d1uV+VfkbaNI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uz7Hi5jWsoJiECAlNNHYPyeZnysvVbu6SjByqOc4ZDBs8LDWZLvfutsNmsiV3AhCUHTFdMsoenfmuNxCwgLd/nsyMuyPGG7HJi1vq/wd/yex+ATK7qloZ4mFe4U224MLPB5N7yYbIfzX4QTfQ6fXGT4r/UkwWb53bluqM44knQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ddYxuVpl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aAb/8Ntn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ddYxuVpl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aAb/8Ntn"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H22XxG3559699
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 04:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U5+92k94YxTQHHecRbmgdArr12KipPi0NK/Izeo3Geg=; b=ddYxuVpl5SKum7vb
	TWg96g13MCzVFwiTjVzu0sTdPpG+k/wMpK7EUqy5KKOHgE41nltEYOTndQW2j5HB
	gbUTe6dDgucJJtlVRSbyWDRxyElrC5eM7qn78UN9ZAFFoRkbAjnJCx/dLkxcw6sr
	ZwglLssqnEENFmGUD3GlND0jUqwHZvMIHt8I3bObyUXTYaeZ+2JERfDr+SExQXAG
	jBe9TtDbuncuyW0/MzYIQ/37+ZPYviqW3NypBzwTSJvEBSfOYqaaPOUUcy5Inap0
	NHYeEt7crNB0AaK46clNIIhfkqTrzJZ5dK+dURCFN44H1AaYON65c5UcseV0dhrY
	YyW8hA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy7hacg6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 04:38:27 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39de4a68f7cso796813a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 21:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789619906; x=1790224706; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U5+92k94YxTQHHecRbmgdArr12KipPi0NK/Izeo3Geg=;
        b=aAb/8NtnuHujNdhlpX4rq1eAN2SoNHb+BT2Kg7AxooAzkaRckeEhCS/rXtrUmv8eC9
         Tg79ni7bZsl0p6l04px568nwb9T/nBv971t+eGkhFiCgq7D25vXNhMYkqpmBiYz8dMt0
         AvUqXVirI2NapXJFt2CIiVA0iPuIxrPHESYkdbvXxPYBLY3VFyCiwlEzSpVfOoapTEtM
         glY7Vknmbda1SuryJ+rSJkgSqEfZp7LgNIqipGg3GyPVYRaxWFtkGintitdTl3nKYUWx
         BUn1Z9DWiqDEyA5s2rsAnVagpp2suuSaSV6xHM+Ug4tT2ZpbqTp+CtuKBIvmKjkt7VY3
         rP9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789619906; x=1790224706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U5+92k94YxTQHHecRbmgdArr12KipPi0NK/Izeo3Geg=;
        b=m/g3YSsPYsNkFeaf1/6j+5NmveRJKcV5fC0GXZzcHTZ0UCtMlf0Wt6fJ85obwcLDOX
         x6D9Ssj1VEeWSQ9vurVAfOKjpLhliQWq51USqgTUqXXKmDvO2A+araP/xvTwHp6dZAo4
         Ui7GS67RfBQDsZuUOq3kv3NIYze3hHRG+jCN6ThGMfljKW+Vk+D+kcWzdSpYdhXrHW8O
         sch3KYV5Wr8IWz7btF5C8GADifdlLTO/0oOEfAFGAfYORx1Yqv8xWb0aueB4q4uoVDDh
         iaNfVwR75c1nMzY5WP0QDdujQh3BOjwdwRy/4mR+/hm3OZaIphVPOsZsZqKOiTbBpnqf
         NOXQ==
X-Forwarded-Encrypted: i=1; AKwUvBz84NwoGV1YS5br6YtyfI/qE7PGH12ZvLbAUQbNOh44YNpUgeubLY3JuHLIj3KBE17/wiUuLf/30FbpF/bF@vger.kernel.org
X-Gm-Message-State: AFuF++ktGp64vrRyWkujsX/IIQPZlhQq69rU57HLmVp0FCxySW1VWCXw
	n5JV15IavKzb+SP48FKeX32s7AcQBQy45QCY3TER/RUR4JFQ5DMHQldNXhUbiYRAYrwKcEGTikl
	xipCxF5z6CV0mzP7ZDsBaIfjHYg3+QSt/ZmTN5u9U01ysZB83Hut9OeHwsrh93fqVyJpn
X-Gm-Gg: AYBFou2tMha5ebaZu7LtYXMT7qH4uTNz4kMZ4XYViXGLKTY3rtsWs/kych+uRPCmJY/
	hIDXE+P4Q8W3NEKSLOPc6Cgr1wDr6jgWPA7RM1zKNAgO5U7L5C9W5sYwst5wa8mznsUAW2JUNYw
	0aquBzKPBhMB0GA7yACe3Rx5RLwRLiGsuZZj/fB/fEl4oNH+WrMk2HCkU80yAAa6LbshRDLl9r7
	VnaZxzuys5pOUqpF0DOCpsfs1r3bNSodlU4OVJIErW1nMi2UN4Da6DUgh1QdhPXSOSNVmSFRs/+
	bAtxyuNpskPNEGg2Z+SmrKTJsFk0LFITjFrFK7mJa1NiVRjUeqDaVeOmRiY9g1jfCRd7IWqbBM/
	BRc8I5LLZa04JqTVmDe5rSDiP1pKI4XePY+ZA
X-Received: by 2002:a17:90b:3b91:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-39e1e2bf7a7mr15585940a91.6.1789619906217;
        Wed, 16 Sep 2026 21:38:26 -0700 (PDT)
X-Received: by 2002:a17:90b:3b91:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-39e1e2bf7a7mr15585863a91.6.1789619905788;
        Wed, 16 Sep 2026 21:38:25 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a9fd38sm12357376eec.13.2026.09.16.21.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 21:38:25 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 10:07:36 +0530
Subject: [PATCH v3 7/8] arm64: dts: qcom: shikra-iqs-evk: Enable sound card
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-shikra_audio_dts-v3-7-9a49e1ca6370@oss.qualcomm.com>
References: <20260917-shikra_audio_dts-v3-0-9a49e1ca6370@oss.qualcomm.com>
In-Reply-To: <20260917-shikra_audio_dts-v3-0-9a49e1ca6370@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789619867; l=4088;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=SOV9jDO8GOlRCmornBB7OfFab2xr3q5d1uV+VfkbaNI=;
 b=NFGiksqVqZk6Bh651mL1HsehAuBd8zzu2uDQcIwZIWi2f+ezvpywh5kXmmkymzuDEqKqYXibf
 FchPMroDX4XDkvCnuttMdyq6KdYynKIcKK8S6nyE5sdwy4T/JO97iLY
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA1NiBTYWx0ZWRfX3DR6t0T71pck
 4r1rTC1VFuzhcbp0Ci3kF3T9u04iacoebPF0HWeuDp21NFfNvqC7TXY3PDCBR2dvpdbHi4QNdt4
 JHq0Xmfwm0sPanhUiAvRC2B5Ut2LE5yZDLpLoYrXgPkKwI8hhXJoN53MWDtw01kzvOPH7nztiYz
 GAaqllcAhYW2MxQ1tpcQAGGnMr7wT77Fkk34n7QeDax+cxCTDKbppTWGgTPBVn6kk31LfvCco5G
 NB/h7ZJ7LYIda9BwtzkBfB41lntNb8ZyQXyUivhWw2/+x59TzYP/2kkNydSPZQSVEwVkLixn5E2
 So7yRWzrnH0lC7KhBM8aKCknv4ISCyihQFGm+BbVsNXgBifJ1rLYwchtdWn7dkzlEJHdcNPt5zB
 IjVOGaIalv3M2sBzgNfNiXypxlU7ctHtkkgH3SoLHcIoDiVKCXMwUOB34o53d0MLlfj//rkue9e
 tnA2ufCHlW9y6KEKxQw==
X-Authority-Analysis: v=2.4 cv=L8aI0OT8 c=1 sm=1 tr=0 ts=6aab6ec3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=wLb_nwxRshEjtDnoXkMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: vBr-TjnMobjCeGAhz_QSUlIlWL-VNXya
X-Proofpoint-ORIG-GUID: vBr-TjnMobjCeGAhz_QSUlIlWL-VNXya
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA1NiBTYWx0ZWRfX8Y6dtQ7DAZOR
 Vx5Ly7zsOc6L1mZYlQsstxDUuFKSbNpfg4LUZbFlZydmHNUYGgl9Ts05vtsGp1vAIn1PHj/vcrH
 RdlyKU3j3nFau1v1YHOGR4Kde7eHExM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170056

Enable the IQS EVK audio card using MAX98091 on I2S0 for primary
playback/capture and VA DMIC capture through q6apm backend links.

Add board clock and pinctrl states required for codec IRQ, external
mclk and digital mic routing.

Co-developed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 144 ++++++++++++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 543d769125ef..54c840a748c8 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -21,6 +21,105 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	sound {
+		compatible = "qcom,shikra-iqs-sndcard";
+		model = "shikra-iqs-evk";
+
+		pinctrl-0 = <&i2s0_default>, <&ext_mclk2_active>;
+		pinctrl-names = "default";
+
+		audio-routing = "IN34", "Headset Mic",
+				"Headset Mic", "MICBIAS",
+				"DMICL", "Int Mic",
+				"Int Mic", "MICBIAS",
+				"Headphone", "HPL",
+				"Headphone", "HPR",
+				"Speaker", "SPKL",
+				"Speaker", "SPKR",
+				"VA DMIC0", "vdd-micb",
+				"VA DMIC1", "vdd-micb",
+				"VA DMIC2", "vdd-micb",
+				"VA DMIC3", "vdd-micb";
+
+		pri-i2s-playback-dai-link {
+			link-name = "Analog Playback";
+
+			codec {
+				sound-dai = <&max98091>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		pri-i2s-capture-dai-link {
+			link-name = "Analog Capture";
+
+			codec {
+				sound-dai = <&max98091>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai PRIMARY_MI2S_TX>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
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
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	max98091: audio-codec@10 {
+		compatible = "maxim,max98091";
+		reg = <0x10>;
+
+		pinctrl-0 = <&max98091_default>;
+		pinctrl-names = "default";
+
+		interrupts-extended = <&tlmm 28 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&q6prmcc LPASS_CLK_ID_MCLK_2 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "mclk";
+		assigned-clocks = <&q6prmcc LPASS_CLK_ID_MCLK_2 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		assigned-clock-rates = <12288000>;
+		#sound-dai-cells = <0>;
+	};
+};
+
+&q6apmbedai {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	dai@16 {
+		reg = <PRIMARY_MI2S_RX>;
+		clocks = <&q6prmcc LPASS_CLK_ID_QAIF_IF0_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "bclk";
+	};
 };
 
 &remoteproc_cdsp {
@@ -80,3 +179,48 @@ &usb_2_hsphy {
 
 	status = "okay";
 };
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
+	ext_mclk2_active: ext-mclk2-state {
+		pins = "gpio110";
+		function = "ext_mclk";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	i2s0_default: i2s0-default-active-state {
+		pins = "gpio105", "gpio106", "gpio107", "gpio108", "gpio109";
+		function = "i2s0";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	max98091_default: max98091-default-state {
+		pins = "gpio28";
+		function = "gpio";
+		bias-pull-up;
+	};
+};
+
+&vamacro {
+	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+	clock-names = "mclk",
+		      "npl";
+
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>, <&dmic_eldo_en_default>;
+	pinctrl-names = "default";
+
+	qcom,dmic-sample-rate = <4800000>;
+
+	status = "okay";
+};
+

-- 
2.34.1

