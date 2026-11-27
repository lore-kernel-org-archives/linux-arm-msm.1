Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794939;
	b=F1q+iADbUwDAgwwranIMsZBxq0ToIO6OgiOxTTYGUsff8FsF/chte+L5VlYaQaMcP/9p
	 bP8lewEPIboa5mpzzUILdZNBTbswMyASm5uKFVaIhrtftgj5Tgq6RFMwRV8x/TC/eA6hG
	 RoS0CgYQVb7TUzk+tIA7cNsr6Vp+0s3GdgQnfK/B0vxlFN6vSQ9oQ5zMjHzfJ6jtIN1R0
	 yjVJNge3ym+LceDWJ+HRvkNM8NcpngaEwa+yfCCGctKENjn/aRAfF8dgExe63XI5lO09M
	 OqfZt0O6h75LoC5GNWnhOjnWd1HLrxfGYeLBykpCLor1WdSJN5/fHIEJsG1GNpOx9Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794939;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dZvmTbygxl/XClFljr1KmcHrdVRr51qfi7CDWubHxqs=;
	b=Bz5DFH/Ap4nOK3qdAKxUsMEkUTxA7AcO17HW19K3WZLcFfTcRb1ycSp6rnqaqctFA70t
	 V4H6QcSl1Eo+6e/u9qPySK93bkNdlKflTHGn1hxrTTBBWkuwiuXOdxvF6jR/0YukSwzdz
	 lZrtrk7BwE7u8TIr55mzJqBTFqEQnWxTyWJ6r4dFh3MTe7W5TGGkuBJCdJeaOHR1Euvna
	 o2prrUb509ZCtBF7bJMu+ygJcN3Dd6ZU0/hw+YS60znYWxppPgm0zcHvIMi+mLQHhDXPV
	 OylF/stXz4ma8RJjhPd5ikmTLB2Z04unx42IYb6nqOVddhHF9bNHTg32G4RBEfvfTOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DLFbTXj4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iQyGesAr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76A8606A69F
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 15:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B76A8606A69F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DLFbTXj4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iQyGesAr
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFp1JF3560698
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 15:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dZvmTbygxl/
	XClFljr1KmcHrdVRr51qfi7CDWubHxqs=; b=DLFbTXj48d+iUKP8MXY1V6LJ7c/
	B5zTgkap38t4G7/IkaS+Fldgw5YmxoZmneh7zmU4HfNM8AE7505B30YK7VnhhOw0
	3yqNCnsZsk5q4siT3zmYCLcCMgwE+oWmCH2oTcqnv7kNU1yt16kHW4TpVwYgRIMd
	0Ul6xNnNYzcJ08o1lQ5Dh/dUMpAPSZxACipq4YFPoDREcQkSRyi/xSBmaQqJ0Zyv
	t/KfREBLp/hbEjM2DThaK1kdV6ZZ+rOILuZlPGD8QouRVSXvSBDvCcvqLAwUsVUf
	NogBmCWdfTqGdQUORppRp96UHkSLvoByQjRi9xvgx833jR/SoaVYonS+TYw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf9482k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 15:55:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94970ad532bso649732385a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 07:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795794937; x=1796399737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dZvmTbygxl/XClFljr1KmcHrdVRr51qfi7CDWubHxqs=;
        b=iQyGesArv3JICEV2GW5sQcBTospM8v4985n1HgyLkb/STM5iEo4UhdYbuTbkSryfcZ
         eUBT95gxDK4SvRri86nAeJH6Xl+5/u7YW2fkuutLLeMk+8zr21GFOoB/ZuWcIc67Bag/
         my03uMeAKXL50IHk9qVLrswPyi7N/Zqbk2cXxhrrJHt37tIFLp5DFJfxfoq2FbteUQST
         ZGEILQ3uqWbcezEziKkizJhCeYCW1+wny3RCvhgFBTeLbs0b2mr+G/vLaPwWAJzPg7jM
         GQpGeiDA7dQBVy8D3YkE74HoB60zXseBwf53J+TqshTduw6jKCtbbFCBrOcnlTizL95a
         d6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794937; x=1796399737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dZvmTbygxl/XClFljr1KmcHrdVRr51qfi7CDWubHxqs=;
        b=WS+KiQkG89syr8ZxbXTxandfJlrQZMynwi8qVoFyekk1pnXUdWZBbbvWw8RLiJgyZz
         +DekYntECi+WWqaNpOguRKrPD5iOZhHD4+hbTWqa45KgkTMiho9nJpIcznYBswPI0oCw
         rFoeDizUiDLTS7dip723jnY34XL6RWoWpfCiyBVlZvLR3isO9sbXja25P842jpNrYP/F
         Pcelf9RMm1b+qnENXqtITtVVT1ypU4lPW/fkHv9Xwcf6Gu0Qr6xFpZkZgHTPlkdLksfc
         c3d/EawcJk/MEY4J5A9vcbH/bSRuGSSv9Izm29MMcwY1r3SDnSxJhDP5tx007cnhhbzH
         uRfA==
X-Gm-Message-State: APuU4Z/v3TjBnteel2/Jp9YPlJyILhyrbRxCl7662gJbXH35gELVrr62
	Q50th27kGGFJJKpas3aMtoOgD8OSk2cmamrOLcgDoZgYYPV6zRAi5pf2ugHUEOYvZXamtK0ERdY
	3Y4AalcTnRPfrs+Yl6NLtNY2Llki6gcxswPNzQMA+enTwGMpRUQniHcoOUFmSXwWyfIkX
X-Gm-Gg: AZFdTZfU39mDB2ivCavWi37cMaWQ1jAg6OAq/mL1fo8IXDe7v3ECotgmxqrFhrOuYFE
	ZAe6yMsjfvAPrZISxHIkDWAQQSiUYHINUrqhmsavce+i6Yjw8c6cKfVBmvoIxh5mfPSTOAaCdSb
	kjcaJ1i9dvEOfvHyKOCk5dDB0caft4A2bwFemkSB9s2iVUz6T49rFrIp2Fwn1WJwyP9iz3th9oY
	8QKhJRK9r3AN79LvTz1WmmkgmccIiNQkojMtdg/PQDNfpHMqqcN/PS/Tpb7Odh/D59c+ZaUyCWR
	Ltvzn5mP4lNpEz17cyMruUANDRDbtwI/ffNOIhszuQKAU8u8t6DyA890eZkswqx/pHaCE4YV0u/
	rAc3EmDnaA3lX5lu7dmPbYIH9leJnmsIzhOv4340jjBjZ+GHq7iCdYZ3iuceaO8Y5
X-Received: by 2002:a05:620a:468e:b0:949:6027:7580 with SMTP id af79cd13be357-949bab7df00mr4612601985a.83.1795794936902;
        Fri, 27 Nov 2026 07:55:36 -0800 (PST)
X-Received: by 2002:a05:620a:468e:b0:949:6027:7580 with SMTP id af79cd13be357-949bab7df00mr4612595985a.83.1795794936461;
        Fri, 27 Nov 2026 07:55:36 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm47272636f8f.10.2026.11.27.07.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:55:35 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 2/7] arm64: dts: qcom: glymur-crd: enable WCD9378 headset codec
Date: Fri, 27 Nov 2026 15:55:15 +0000
Message-ID: <20261127155520.358909-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127155520.358909-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261127155520.358909-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: VGlECKvBVcqsUBpM3YaEBNylwtmXIA2f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfX2Mfz+AFetxHc
 mBc0xpQbTOdKNT5sfDiKfZOYAHqo3ehxVEX/fhnrrQa8LLK78f+usvpQxYY7jY6WQr5j9RTdS+3
 cTU9FOnFyzs7cVxUD1VMNZT7vvpyhDspvQ+NnsSJNTqt7r4WU3xEKqH0NjHepBQLaWWr1xCIjOf
 QL3E6l5zVvFgju3FHtlR6UB9tZh510mL6iMf0z7tjkFAzeSlm6mFrzIH64DxDzGjDecEhP/eq2U
 /NmdprMRGxQmtfHTi60ImjPdlo9NSvHJty7IhY7Tstl41IGgZAOgWXQnlqQDJzN0y9z4mvheRTL
 y54rsoSyg57nBGdggbKhoIr06PwaROGPIAJvzuvZPSgEQbS/vXWnzPwanv2cNPbphEqZLeoKMvJ
 wcripGEZvjA3Zv+QSCz7rn8MfR8ZJE8J7algXAnNxxtTbmipPPUHTiijp9exTyTQcPVtsWH1GUZ
 BdWa7u8s5MsrcjMjNFg==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b09a7fa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=imSGFiSTgn8yRhLT7isA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfX0LV0E5P7WfYp
 slqcczkri/AyLmMJ86PWiTRArNDq0OJTtc/578fjA7xTlcknfzO1Je5x75fg2L5IEy8wKoX9plx
 SwwxZbKaRey+0SIFDxEABcg5bw7JwR8=
X-Proofpoint-GUID: VGlECKvBVcqsUBpM3YaEBNylwtmXIA2f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270063

Enable the WCD9378 SDCA-compliant headset codec on SoundWire.  swr2
is the SDCA primary and swr1 is a DATA-only multi-master dependent
(lanes 2/3); the WCD Playback and WCD Capture DAI links run through
the LPASS RX/TX macros.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 84 +++++++++++++++++++++++-
 1 file changed, 83 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 3a9cd5f3ec2b..8e0dd2956882 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -242,7 +242,10 @@ sound {
 				"VA DMIC2", "vdd-micb",
 				"VA DMIC3", "vdd-micb",
 				"VA DMIC4", "vdd-micb",
-				"VA DMIC5", "vdd-micb";
+				"VA DMIC5", "vdd-micb",
+				"IT 41 Playback", "HPHL_OUT",
+				"IT 41 Playback", "HPHR_OUT",
+				"TX SWR_INPUT1", "OT 36 Capture";
 
 		wsa-dai-link {
 			link-name = "WSA Playback";
@@ -263,6 +266,38 @@ platform {
 			};
 		};
 
+		wcd-playback-dai-link {
+			link-name = "WCD Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&wcd9378c 0>, <&swr2 0>, <&lpass_rxmacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wcd-capture-dai-link {
+			link-name = "WCD Capture";
+
+			cpu {
+				sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
+			};
+
+			codec {
+				sound-dai = <&wcd9378c 18>, <&swr2 1>, <&lpass_txmacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
 		va-dai-link {
 			link-name = "VA Capture";
 
@@ -791,6 +826,45 @@ right_tweeter: speaker@0,1 {
 	};
 };
 
+/* WCD9378 multi-master: swr2 primary + swr1 dependent (DATA lanes 2/3). */
+&swr1 {
+	num-lanes = <2>;
+
+	qcom,multi-master-mode = "dependent";
+	qcom,multi-master-peer = <&swr2 0>;
+
+	status = "okay";
+};
+
+&swr2 {
+	num-lanes = <2>;
+
+	qcom,multi-master-mode = "primary";
+	qcom,multi-master-peer = <&swr1 5>;
+
+	status = "okay";
+
+	wcd9378c: codec@0,3 {
+		compatible = "sdw20217011000";
+		reg = <0 3>;
+
+		pinctrl-0 = <&wcd_default>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
+
+		vdd-buck-supply = <&vreg_l15b0>;
+		vdd-rxtx-supply = <&vreg_l15b0>;
+		vdd-io-supply = <&vreg_l18b0>;
+		vdd-mic-bias-supply = <&vreg_bob1_e0>;
+
+		#sound-dai-cells = <1>;
+
+		qcom,sdca-compliant;
+		qcom,port-mapping = <2 2 3 4 5 6 7 8>;
+	};
+};
+
 &remoteproc_soccp {
 	firmware-name = "qcom/glymur/soccp.mbn",
 			"qcom/glymur/soccp_dtb.mbn";
@@ -961,6 +1035,14 @@ wcn_wlan_bt_en: wcn-wlan-bt-en-state {
 		bias-disable;
 	};
 
+	wcd_default: wcd-reset-n-active-state {
+		pins = "gpio191";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+
 	wcn_sw_en: wcn-sw-en-state {
 		pins = "gpio94";
 		function = "gpio";
-- 
2.53.0

