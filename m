Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718305;
	b=ds92s/TLFFjznDnoozIF2s8LPcUaRIF2IOsdz95NhvCaN/9nrq3NXgOy4VzYzN0coOC4
	 QuRROjVzlmFrPWwdZIVt1dyidWZwSBts+AXI1XXiaFUR/G3PPKOXkP3uFGyOBgc2xTJ7X
	 qkLM1nlQKnpMoLknGEa7vd7qR8oQ9KPNtpmXhz+hc2iqrCNwRreMQab1/Bvud1uFHxC94
	 HtPhtZ0XG2ri+OnspnZh+C9+F59sTXNcXpNZchMNCOicfXGaXkY2s5eAaGIoZbp07meY2
	 q1QqZgUqIolVx+Kh/T8DvPZ0Q/pnzYaWvIC2hly2SMgrd9yHshYRzFfIxvEWvm0rWJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718305;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BfVcGVrBRqJ7zIMdhtS1zygXckuAwk4N3NK9IAnInWE=;
	b=UzN2FYDwz0z4W8knbTS61BWCdkQuhRHrsXyxE1MIhHoWMxhBkEs3dU/8rRHTpYMfZOQl
	 +7xKR3S5vmWBzcSUn1nxmBXgCULi180EpdCR+YwtGC6qC59P1/bqVrlbmuHnmv0y/fnTk
	 1bWnAEEsclUPJCjMsIteNjQIhHeFV5sYTG/GfAN+4OuTsTTHOqEYu6IJi0YPT0GFoPlQG
	 vDzvjD11M2ur1HKAJpqMwVbCpox8XneulBpHaj7GX1fM8Rx37fg1QlvprfuioG/XeLsZp
	 vzhvEy4JlsuuIPxOzlJrKmiWMlqZqHeR/a5QISGcocrVTafMiEENgUqQV9skhkw8xXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iUycXkHi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M6DVRbv6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0E9606A685
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 18:38:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC0E9606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iUycXkHi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M6DVRbv6
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFu4pa3850515
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 18:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BfVcGVrBRqJ
	7zIMdhtS1zygXckuAwk4N3NK9IAnInWE=; b=iUycXkHiF84UIPqvgnjW2Lq5L7+
	bpqHRWR9MYTgLVVTXbo6pzYLBi25Y6rYyGloCPQ1LhtteRUQoN7ZBKvDULG5j2w4
	SDVzI7pjcmdfovfAyOrrofivFVj5BIZe79R0PT8oYO1byR4npkaSECLaMAW4xTpJ
	3sHHVZEwzloOb14lBooXk5DUEOQdMyvNDwh5E+HGchxqU7lv1+ONR1t/9jjAUoe2
	dT0yZlsAi8iyPgj6JJtMrn4eVrBSaOnxuAyg2ERxz4EZEvTZ4K+JAHHfv1wYBHWb
	iQssYxMZ26u2aOvBmEQ62WNmQ87fzzwkfQASjCEvr3qHMSqVYZN1PVqhvbg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6h7ga4ku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 18:38:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-946038e22f5so428220585a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795718303; x=1796323103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BfVcGVrBRqJ7zIMdhtS1zygXckuAwk4N3NK9IAnInWE=;
        b=M6DVRbv6ECDiKiz66wAAhP8RfF5QPDNku3xsfNysoTHqlmD5SNIVuBGSvYTZthGEbs
         4T+SZdnjy6fR9vTBIEJ5rIJyGnTYoSKb3ZTRwEW8PW3ll8RLhtf30puolPMZm55eoyMA
         0EIzYPZ0xQqKxMfPFZqf9t2lJIkcRMDnCgGAtmIBlRDnzATG1xlAMEj/LNkFaAinoUEh
         zcQ68x5v19DGFd417dNef4LnKd6+4voy/DqnmLpWN7FjEUCgUHtjmlJzau8IzMiiHf9X
         /kVpQbNZxI/T8cMrI4hDDBMWSQc4FGk0FqO9aGY+t0iwfl9Skz9YKbYumKidMdlVk9mw
         thRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718303; x=1796323103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BfVcGVrBRqJ7zIMdhtS1zygXckuAwk4N3NK9IAnInWE=;
        b=Na9W61NAwhzLXmAFjRbIi8HGJc51igcz7lMH6/yysTfT8NBAU70hZ0442F1I+bjzp8
         CF/Xw5tE0KQ6iguUMywLYSrm3ea/2MIPauxMXXN296Ay7s2MBF/HxK4ieWFIzayMPcXs
         Pkr0gp7w5T07Dkd3EjrYcYFgU8hVqwwfCmNM+pQs10poMcw80DcH4qFKO2o9tZN/ooG9
         X90BpwsIlfWaDcykQ43fjYJS0hAMzOl18unoyFQjwF/H0rs7xi9E1sM0vTvsG+eOs63j
         5o8lrFyo+OQL9TWPxDp8kR7L2zMYhxCIw3Hn6/PD7qLB8iCfB2+lQqw6lqiQrFZa5Kel
         USgg==
X-Gm-Message-State: APuU4Z918qOYs81TYLvjnfyYpNW2YDp3QKfjTBDkpewyEXp4g4LEJwBW
	8idSQSWBF8WDNnYw8trhBD3xB99VTZNi9ap5/uIS9ayC3hUNzGlAIgKi0LvOuhzlkb1TF4HAqe+
	RkFUHs8LQbAOpsTHabG5EyA2nEcnKJbyUAW1fPau3x7XaGnwjO7NyXxJq0D8FWlDwO9MK
X-Gm-Gg: AZFdTZfzkgZ+WN1Na0v0t/X+fHB2OMYjow3il5DoHafh5Fi4pZTo9EdRmgQSrSQWIcW
	6osRIZ72vME5kA8tYDvMimQ9Z3210EcoGU3QXL7jJiPUG05vq7Bzsa8Xl86KFrDU+N8m5sCIFu5
	NJN9ZS/uTsIog+rNlpLG4Pq96mKPoV7ByObe8wFK/UFb0tKYR0G1tXd2V0S5It35cZ+64aTXFC1
	UZzX7WA6Cnhwjg9Cav+k6qdZYg3lwLYN4qQoNYgWZZxmN4ta3pR0N+9noG1ulwHYDoLJBoJv8Jh
	WN4XfMfpyGc+MzvXaqIj60u+3KneHNS85Hpv278YjDvDeWQmN41uw9eWQPtQMLLywaxavOWgh0d
	3Fvft8i6jBvVEo7pG194c4Wi/IpP41Iew7d0P/5eJpYiJ92pRPJqyrLpFlmF+8Trl
X-Received: by 2002:a05:620a:19a3:b0:949:7acd:3c37 with SMTP id af79cd13be357-949bab678bemr3935502685a.66.1795718303217;
        Thu, 26 Nov 2026 10:38:23 -0800 (PST)
X-Received: by 2002:a05:620a:19a3:b0:949:7acd:3c37 with SMTP id af79cd13be357-949bab678bemr3935499885a.66.1795718302848;
        Thu, 26 Nov 2026 10:38:22 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm239659035e9.3.2026.11.26.10.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:38:22 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 3/7] arm64: dts: qcom: mahua-t14s: enable WCD9378 headset codec
Date: Thu, 26 Nov 2026 18:38:02 +0000
Message-ID: <20261126183806.172485-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126183806.172485-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261126183806.172485-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: OTC3EJNOUALs8q-QeJwVk4l4kjNybprG
X-Proofpoint-GUID: OTC3EJNOUALs8q-QeJwVk4l4kjNybprG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfX6c1xmoy+OJQS
 cyQ4K/ayCKdEjxnzPwxP2W6rVsL3r7JmBQYMOKL118L93Dr1JPd0TNE/JmDRiYYTUi1x/rb7O1p
 y8IUI3HGIJVym8AUnhrV7/xw+ttqh0ggYkhM7xUY6S9+sULs9Oc+1hT8fE8ZgfW4oGml6P1W1qi
 ufm9IFmC/dGbXoxRVSqBNPfM+RCntXjAE43GKqqOqH2DwgZPK97AArKXJHcy/YhmMYA2RmMLa7c
 B/ummy1L4784iCvbfuFNRMnJh1eGQcOqVMNC7b1oNRR7XdQ4Hi1HvMAl7gN3w224/NjmeNTT5wj
 PnBulq2NyDJVSqzw3FHGbznnBcB8DADtrhnEhzKlLDHg7KrnXq49YeLXkUC7nYLqlkym7oBMcw5
 0XYe/RW7xmdM8A7tOBE2QG9JXexZmWbtrsj678awRU6JLpehtF9rUIi/w9LJc0CErmHYsyl5ROm
 8mqdroUvJJzvFXYdAlA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfX6AstXHHzpp/G
 MSDi4b6o/2drHhvfbImvUMbMfv3GRPQN69GRP8pW3xFRNx1hlMqcKmxyHU286G0dg+IoEXeabfP
 UScfaSDm2KvKokdCEua7jzH4s/U3EUQ=
X-Authority-Analysis: v=2.4 cv=L4GI0OT8 c=1 sm=1 tr=0 ts=6b087c9f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=M8yDIIM4nUrurVDekmcA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260073

Enable the WCD9378 SDCA-compliant headset codec on SoundWire,
matching the Glymur CRD wiring.  swr2 is the SDCA primary and swr1
is a DATA-only multi-master dependent (lanes 2/3); the WCD Playback
and WCD Capture DAI links run through the LPASS RX/TX macros.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 83 ++++++++++++++++++-
 1 file changed, 82 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index bad49ba5443f..84be12c07f6b 100644
--- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
@@ -254,7 +254,10 @@ sound {
 		audio-routing = "SpkrLeft IN", "WSA WSA_SPK1 OUT",
 				"SpkrRight IN", "WSA WSA_SPK2 OUT",
 				"VA DMIC0", "vdd-micb",
-				"VA DMIC1", "vdd-micb";
+				"VA DMIC1", "vdd-micb",
+				"IT 41 Playback", "HPHL_OUT",
+				"IT 41 Playback", "HPHR_OUT",
+				"TX SWR_INPUT1", "OT 36 Capture";
 
 		wsa-dai-link {
 			link-name = "WSA Playback";
@@ -273,6 +276,38 @@ platform {
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
 
@@ -760,6 +795,44 @@ right_spkr: speaker@0,1 {
 	};
 };
 
+/* WCD9378 multi-master: swr2 primary + swr1 dependent (DATA lanes 2/3). */
+&swr1 {
+	qcom,multi-master-mode = "dependent";
+	qcom,multi-master-peer = <&swr2 0>;
+	num-lanes = <2>;
+
+	status = "okay";
+};
+
+&swr2 {
+	qcom,multi-master-mode = "primary";
+	qcom,multi-master-peer = <&swr1 5>;
+	num-lanes = <2>;
+
+	status = "okay";
+
+	wcd9378c: codec@3,0 {
+		compatible = "sdw20217011000";
+		reg = <0 3>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&wcd_default>;
+
+		qcom,sdca-compliant;
+
+		qcom,port-mapping = <2 2 3 4 5 6 7 8>;
+
+		reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
+
+		vdd-buck-supply = <&vreg_l15b0>;
+		vdd-rxtx-supply = <&vreg_l15b0>;
+		vdd-io-supply = <&vreg_l18b0>;
+		vdd-mic-bias-supply = <&vreg_bob1_e0>;
+
+		#sound-dai-cells = <1>;
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <4 4>,   /* EC TZ Secure I3C */
 			       <10 2>,  /* OOB UART */
@@ -881,6 +954,14 @@ tpad_default: tpad-default-state {
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
 	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
 		pins = "gpio116", "gpio117";
 		function = "gpio";
-- 
2.53.0

