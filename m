Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718304;
	b=Nezg6xcCYYeDuxOLgLJwXiRE60oNNVZ5HMiAHtFgnSlLLedPP+rQbICZs2VJC7XvOGwn
	 CfXqxErm4P3MnXAjnDJLIQTj3MKtkVRScj3uh2Sd8M7q/UFYP93RBLEE1AyTSbIxLdSgR
	 yZhKzJdw3fgLNl8OCz7213IEuNFFyyhZH+xfXC26dsXuQgqTI53007iUZ9t3U6qO2gZys
	 QwAnxUnL+IMJvAbSudL3T947Ze2Eyn+D60YjtUocC4GBiHedZeFYBVutuM6i1ztTxsxM1
	 jdJ3kpeAC7fT28kbBgVGrN+5SMfdFm/17GdWznrSfOZWhD3lCpibdsfkUMy+K5SDwPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718304;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5RyW/8S38on4s8FH5B3EhnUMU8XwOhqAS4tkeTqtcdo=;
	b=L6MX/63/1Vj0qnbHwS5NC5ohurXgpvhZ9dwZ88nw4iIGywLJn+WYR1NOq6RAH9F3+EAm
	 Hus6tcZt0/H35rPcevi8cWzyFRMr9mU6xuoALQU0TACchiNcNA+yrms2jVpxD7s316SeO
	 8SNF8q736RqcHxXXElMmu6Zw5ZKyVmYkuL3LbqzZg4FUQNkzmblA1sKRP3W+9MPqCpjhv
	 ZqNFad+OX5ZltZ+QZZ5Gfpzdn+d2kwchp/0QdSERE8DrwROFOkpeomBgmyzRMYsxTagoO
	 pvrV4obEWO/pv13WjQiWxOpwz3psrCsiR3oI2BXg2kL0biTOyEkV/qNJKKm3JjY/mkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YIfvNx4l;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LQuliMDr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA851606A692
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 18:38:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA851606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YIfvNx4l;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LQuliMDr
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFu0c92835011
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 18:38:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5RyW/8S38on
	4s8FH5B3EhnUMU8XwOhqAS4tkeTqtcdo=; b=YIfvNx4lK+UuMsi6wyjFGRiOB9c
	Pulv5JqoLlJ1zdHkPG0hZ4MpQbNptT/GJPb/P35rZBvgocFZ7qLLr7A56wvy+6M0
	gvC0IF4GO/rDwAlXpJYBU5y8EYFbq5mtJw5zRMVNVIoRzjEGTKGMiYARCK8T1QdL
	I6fVrGK3WmHOusN2FFeCvpQoc2KeA2uSNhKljZSuSCCGLuXieldYF9z9gG11gDJ8
	Zo4WGdmLHXD2K67GUbno2PDHhc7/ML+kGzJTxCD3qAdCdW/alzz4WL9uQ8xWhtPx
	PvUz7Z0SizPuW8ntVHePgj+773qC2T+wufQL/W8pfV69SjQ6z+T+yqaTJww==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqgsk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 18:38:23 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9210bbc04abso135849326d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795718302; x=1796323102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5RyW/8S38on4s8FH5B3EhnUMU8XwOhqAS4tkeTqtcdo=;
        b=LQuliMDrCSJu0b/5lqQg1O3Iw5Jc4YtybORf3975OTDtnp3qca3kJErqIZ2IqVikN8
         IDownp+7UibrzDECmjNz1QuwRxxbQbICgoAodXWakeOyLksF1PPKPv9AJCd0fgj7J2Y5
         5hRhfVmHfLEXZJv4JlIjZJLj+s6XCmEiYj/Xh9Y45udRyY9wxqq2ad904K9lkCHP5q3L
         09DT5H78F92j8eilaKhbiAgqyAiF4DMzEkNsWM2yLaVJgYSydKSpXNSCxzVrztgYbUmG
         bzi1BKXJnw5+qGIQYnxqTnDGh4hjx3+ZmzAcTW94CPx9fVXgqy3aE4Lpf8GTiX78ST+d
         MqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718302; x=1796323102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5RyW/8S38on4s8FH5B3EhnUMU8XwOhqAS4tkeTqtcdo=;
        b=TpMcFA1QU/6EB1lEtmulm38YygSnZFTWv2swPdKGT3Aos6bS9tfHGMoSRFLrbO2W3I
         pienEOagTHARVi1ZeQO8wSfa3uszFW5L7M3zsV3Mhr0YZbJe2VkGhEqCuOxhhIfd66/G
         ditKdSwaalqrk4QUKB1AQ/ud0CmxiSopj05JIc+bMyVjUTLBqaGx8Eglumh8IJo/fu6W
         JFaytoTNWYmAsS/r5ty330puHloX3EVp49R3S8lLAkgSqzU+uow0jbHbam5YM06ycAkB
         WTcuWzKJOKhC+W7nzwyUpjxw2YT1E1+Gw/OdJZ8nPEkP8VwTSJ5H4juFWRDhsTO9kP8R
         CBsA==
X-Gm-Message-State: APuU4Z+zyaPD4F2Oj6aK4beHetABdNK9FiF+kfnPEi/6C1lVGiSnaRaC
	KKmp4dJIYWAm4b3HLVNUW1MbOpuTCdtKB5Pyaqb/aq4mcy/KW5IhfCIGNJjuNA9SIgK//fZyybH
	0Bo8b2suebRYSu0INJYh1Dk29NN80IDj0nlCAsYQk1v+10pt4Ugja0wVtd/iOadv50MjcHdlO8C
	o/
X-Gm-Gg: AZFdTZcSqXiQrzf051L6F63SrZTq2URjO9wu3vd9p9AviPwBImlqHeeCyRME/6UNpC9
	j+rRAADRQHqwAPWF7pIAO8sM2H3jWiFEbiXbnYXajF3xq7tijNGocykxWLodLoTArg1O2rX/FE5
	2lHLXawgcWs+sgDPmoIcAnHrCHtydjjENbgN4BEsCPlTBLnltm+zQaCfFq4AZfTsWlV4JjsIbDn
	kBDxvaLbTJqAKE3iAW4/fpcz890wOQJSfXApCiI3k7GSlUyvA/QUU07FOAfSOoQxqol3OiYorMV
	pGlTdqBprXVeucnj6dhjAgpWusk/oQNc6kGmRPZ8laV6riNu4NdvYcY8QQLmjr0M/fitXBM6IUD
	jYPeJX0nwxCY8KmcYOl5bCq55cUATPiCvv3bmJPpqPsjI5N4l20/L1AHg93LW7geC
X-Received: by 2002:a05:620a:1713:b0:93c:6534:d04d with SMTP id af79cd13be357-949baa0d7admr3927436885a.35.1795718301992;
        Thu, 26 Nov 2026 10:38:21 -0800 (PST)
X-Received: by 2002:a05:620a:1713:b0:93c:6534:d04d with SMTP id af79cd13be357-949baa0d7admr3927432285a.35.1795718301512;
        Thu, 26 Nov 2026 10:38:21 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm239659035e9.3.2026.11.26.10.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:38:20 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/7] arm64: dts: qcom: glymur-crd: enable WCD9378 headset codec
Date: Thu, 26 Nov 2026 18:38:01 +0000
Message-ID: <20261126183806.172485-3-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: MUxp9bG1dgHpaLx83PIR4VW2Gwo_1ctL
X-Proofpoint-ORIG-GUID: MUxp9bG1dgHpaLx83PIR4VW2Gwo_1ctL
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b087c9f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=imSGFiSTgn8yRhLT7isA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfX7pJxfPX88TVD
 +dXR21zbHek+utbCSDlG3P8l3kGFcWiEyTGiBvyxoEiXpXia8tPtBLcJ5E8yO4oOUH/CrAT5oTv
 x7bHxoc5km3pshpA+MqE9quN+oN++cc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfX9qY3AzVUgriQ
 IXxxs2/Sn6u8Q4khxH7BXFMWQlH6NWEYw6zxP0JRsqiGyhCvAUL/KQfxh/g132vv3EdzhzeUOel
 JYuNurQQw1+nkiWw8eP3aTAKjTc3jkS3EqcVJc38eGlcY8huH/wIJO9eVtlcKHc5CuMFp76OKEV
 aakMXoXpS/3wUlgUS6Y2AN41+NCYdp1r4QqMQm66h5YecgZe0+6c7vcUCwaTkpt9lr6A7ox3RCo
 05FJNU7NvFG/4J8wZ1hPlxUA98I6rpVzWIZtnLWlYcRRk2cWsJ4oshqvKp4Y1fmTycc1x39ytAR
 tgFcIQSzAXoIkbT+DeBbcbyXoO/P17m2Ggz9gNYjKahGCtYZzPEfIoX2BTQLmn1wl8eYD7XNw2s
 GAcLtuXyknjHaeFG4ngcz23o287sspYK6pEHT87v/9yB8BLr5QGS6j5NytWQ1qj2Xk/mPOgcBN+
 cSJOHpbj6meUmo856Hw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260073

Enable the WCD9378 SDCA-compliant headset codec on SoundWire.  swr2
is the SDCA primary and swr1 is a DATA-only multi-master dependent
(lanes 2/3); the WCD Playback and WCD Capture DAI links run through
the LPASS RX/TX macros.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 83 +++++++++++++++++++++++-
 1 file changed, 82 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 3a9cd5f3ec2b..be0a2cf10f54 100644
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
 
@@ -791,6 +826,44 @@ right_tweeter: speaker@0,1 {
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
 &remoteproc_soccp {
 	firmware-name = "qcom/glymur/soccp.mbn",
 			"qcom/glymur/soccp_dtb.mbn";
@@ -961,6 +1034,14 @@ wcn_wlan_bt_en: wcn-wlan-bt-en-state {
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

