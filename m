Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794940;
	b=SVh1X8aX0ogQ3lKawypn8AtGCGz3Ktm0HM7KipwqFgNVg5zZXC1oKwFVwFNQTTAgEUcH
	 oVt1bFW3zj/Xy6d9Xx58iF5dOcDKEWSu3mpT5iZMhn1YFY3z+YWTzf94FkK6mXZVfwfXo
	 gIbpZyierONy7Xn3PsSNX3gkJUF6qSR/oBAjiUyp0u+U/2XotzkiT+Ncl0lC37Zkxmg0K
	 Qv1vfO0bOIP7HERP0rl6HlAo3aVHpnE3NqONSoxyBXTrm0B9DHec6Q6SAgAhPnXo2ji1E
	 D75QWcuP/8c/EQ85c2vBLPZV4WnU6lI8FJqnBrH/d+8vGEFXSTVCKJd1SHEy5KCpUZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794940;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AlSrlFLmZffwL3k7gDfM1QEVNvHBDX3zqYtjiRgM0LA=;
	b=cNBhqPnO54Dgj9VgCQHx2InATKvJfxwWlP4PmrpnP3onF6QZ+uSDauRmNmWt+yey63RB
	 XnGjYIgF1LwBO/ki313DFQ5ydX7WLezcBTOxS/xQK7QCyZPjwfedB1VerT1iv41OqNFQ7
	 iUanSczyvpseZd+16HSa8plBniGGYBPLuFJc6/oJMA/wrEvnPk8fl5dp87nDmXiHwl1Rh
	 fC559oEZTrg9DE6XnEt+fMS4Y8LLdmhSVXuJgskZBF+AWpBYwkdbs4hOEvxxRFyz+/ir6
	 DcTVwMzEw3rNtrK3yXdD7BWOpqZvzaNjDv8CMXDb6I+xw5twIaioxmi1hff/jIEGSmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cstmriLc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h1M6lUFF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62048606A6AE
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 15:55:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62048606A6AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cstmriLc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h1M6lUFF
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFp20s2617456
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 15:55:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AlSrlFLmZff
	wL3k7gDfM1QEVNvHBDX3zqYtjiRgM0LA=; b=cstmriLc0cm87GqjflUjx8V48QG
	ZegzPBBCid+HEXcWRYX8bQGwbpws+VNQIM1udvuRI3/FR3BOSEa/0i3dSTK3bZCL
	sc40j4VEYPbJgpBTue+6iOg3YQ7eZ7KRRyhi6x4aOrtUKMzfLI8hCy31j2OtwFoS
	x4mU7gGb0gRjoW4bzb8NHbM7jR33yo/0tS+5zwcgQXwZDQ+a0G1Tn0XE4HJiQVlL
	ctUheAa39+lcmzwjI/ah0LmI/zGZSCMYD3TQPZ5q4Ct1r6B/zdd8hbhuazbrzsFZ
	pQvOk4R4kHKeM9gsaukzwWvqRuqYFgfze3cxqoQVUiBlLJbXqKT2vDSXFDQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4hurb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 15:55:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-949dc497896so720382485a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 07:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795794939; x=1796399739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AlSrlFLmZffwL3k7gDfM1QEVNvHBDX3zqYtjiRgM0LA=;
        b=h1M6lUFFDy+eIt+2/EgPrcuXNt+3bD3jWNzo+0JSycMfZ1Lf9q0aJiYuYpaHBjvkxp
         nupkz10cFKJwTbU9qAXoCqSZwQZPzLoOe0bQkRZJ61KMmbypT60R/KEXlkVVEVfe2xl+
         JdHG/2qe5vmiliGaA27VTkrzk9U/Jc/OPk520VALWVTG9+Bw6+IBxc4ieDN9k3US552U
         9DZ6tDVmQkdnYoQGYZNVRyZXGd+ZCqDh56pHGl+XZ5hb3V+WYwGB8Mqd+8Ca453KHBWY
         7fc6UOm9p4RyHWNP/6aIsdiCM9PgDQfpRBW+H1hJcJmIQqGRTHRx9XWQCv17U2RcCyhO
         t9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794939; x=1796399739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AlSrlFLmZffwL3k7gDfM1QEVNvHBDX3zqYtjiRgM0LA=;
        b=XbRlZ30qQnRZXEUMbgNk/ppgGBYamIVrI22d435KTOqStbyek9GDyPsWsDLp/eUye6
         5zEyElNb0BMIbcK3sotxKqcUfuQ7F8wFrojtnz/F0hvBlckEXISS+9RgfOHuG5GJ/fN0
         kHbfvYYIlzhrD53xW/rbZKx5GUvD3agNe2QibrqYy7c4bCxoY1AwY8xk3YkIWhqsU9IW
         //+Y7ssNDutbceApop/TLYKK0FsqWS9rCirAkgGBdbagkce9Sq+21NIROzbKjDp+wcVa
         HI3Yg5FyokFrTtazS1LW2i1F+UFxcL4zzjktoBnR/rrOjXoUZAwFkVOlZxqkexhEf4h2
         lOkw==
X-Gm-Message-State: APuU4Z952BpvA7krbKUsQR16NWNGIMelZi+TQca7x2EYDgb78Farl7gP
	gs3v9+SHZDLqCGAHdjPLSMBD0bEaWtiLpk5WCSHboQvDczlxmVmm3AHSgsrNz4SNPTU5ZvIIvaI
	IajDoSWtr98nkUrTaMOhc6ZL4IZH1tU1mBuyor3dtn+/bOu7/KXHxA2M6nCguB7x9QHXykA7IcZ
	/e
X-Gm-Gg: AZFdTZc7RNyHM5ZKUH3swC9bxdNN2CDVHSW0rXpdYbEOwmU0U+FpxU19UGqu+Rba3zh
	CQesAqb/tVc3gAHbdoYUParfa++9JhaqO5z7abU/NZ2/eRDtd3a1liBMxF5awbhw/nhCPomb0SU
	SimnYwalDAUJ9HTAyofabKbOgngj/emxbhcte/s/p4XlMHkSaow+XrkPIIteKrUjDqDtmmaTuWw
	YGzqhE1f07FvgKROqkdN6oWBKqufyESFVgGjkeCZRt+ZxUPFwerQ2TWC/KLGfao9IVtXIjw0y2H
	x80++XYIBDxh/EXafMrlGYAojW9rGgDmb5rwLDMBnhS+k9fD5qDHuMSETd42/tBpqrUu4XTj+t5
	NSeQkgIgRLKd8kw8FT4og1zQzjh0TMK4lBOtwB492AJF4HZRsf69YxgIA2SbhCkdC
X-Received: by 2002:a05:620a:45a3:b0:949:6e15:e1d3 with SMTP id af79cd13be357-949ba8246f8mr4306427385a.3.1795794938653;
        Fri, 27 Nov 2026 07:55:38 -0800 (PST)
X-Received: by 2002:a05:620a:45a3:b0:949:6e15:e1d3 with SMTP id af79cd13be357-949ba8246f8mr4306421085a.3.1795794938133;
        Fri, 27 Nov 2026 07:55:38 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm47272636f8f.10.2026.11.27.07.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:55:37 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 3/7] arm64: dts: qcom: mahua-t14s: enable WCD9378 headset codec
Date: Fri, 27 Nov 2026 15:55:16 +0000
Message-ID: <20261127155520.358909-4-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfX/NXs+v4f+6fU
 m2f/ABf8qcPwwLuMluLubUkzRqUhC0udCP9jsIHGA4kI1orz+xY5C5lTnrNLU1r3UvfS+esIVo5
 955lQLeQK2bBqYJtr+4p04kzu3MFlZA=
X-Proofpoint-GUID: 9vXleBe3G__vngdysojAzhsHXQ-lBD5B
X-Proofpoint-ORIG-GUID: 9vXleBe3G__vngdysojAzhsHXQ-lBD5B
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b09a7fb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=M8yDIIM4nUrurVDekmcA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfXzFoEhKhNhzAT
 eUg+D/NaF0HdkxWVvRvNCQrn3u1s0HpriLxFEvIwPvFICURE1lpP6p1hI58/0eovTvRqgNpTMbW
 HUuiUyiRHxINLr9x99s2PyeXjgR3yiU9MgHSkT+xEae7ghi7/DdS3NtMbA+TIqAQ05ROMj7+kbZ
 58YV6jF7hag7c4/1btI9H0qic1I6fhOinfa28eHKT08xw00NclJR/MK5X9F9kfAkamirao5m80y
 U/T+TrShVC87o441zc7XcS52qNokoqsY0NGMd4sY0DMEBWuPTdXsfKQ35N2DZOrHwVI1HsH/swt
 Zjnvt5hsBZjL2DXSjj/GPb6UhPj9QVOF1ABqsu+CLUHDOdsRFbxV2550ye/jG6/f0LjicgBvbN5
 ndbPEVZBgS4oiEk0rjwXriWceALPZxz/MwTPhhcj6+kMktThrliF01pdzp42cz0LBf3eM2jF6D5
 JDXqCQDsPTk9Do7LpHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270063

Enable the WCD9378 SDCA-compliant headset codec on SoundWire,
matching the Glymur CRD wiring.  swr2 is the SDCA primary and swr1
is a DATA-only multi-master dependent (lanes 2/3); the WCD Playback
and WCD Capture DAI links run through the LPASS RX/TX macros.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 84 ++++++++++++++++++-
 1 file changed, 83 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index bad49ba5443f..34ec5a52aa02 100644
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
 
@@ -760,6 +795,45 @@ right_spkr: speaker@0,1 {
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
 &tlmm {
 	gpio-reserved-ranges = <4 4>,   /* EC TZ Secure I3C */
 			       <10 2>,  /* OOB UART */
@@ -881,6 +955,14 @@ tpad_default: tpad-default-state {
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

