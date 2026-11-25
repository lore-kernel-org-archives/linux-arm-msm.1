Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636363;
	b=yeqGwXxB+pJt5Kp5P6/JxdXmOXlvSYxnlZwsS/RsYYN4TmIXLJxbiUY4aqR+mdjZWJJY
	 AyKeSK128qN4Fm756ByqAlzH0429jq43Ai5on4G7rfNeWtMtT3vnjCsONBUg5AHvnfkdU
	 VlEEXoIRZPXsi9AGyGKWwGADCteZnV/FLIBmcgpBHTPJSPvw58THhp0MfnAkoPRVDk2du
	 kUSwnhbdl6Y/z+r0Aw5RmObcUrSFJHFYalwv48BAYpFEQ1CrEXY0lvggBE/NDrsZDqZsN
	 8Vn6+G/j0aeTAX1Pd96QgNhpx0cImiF+TNxsH6lGaqvA+l4VZ6G0oMUlszJKGCfQF9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636363;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=N+yTEKtv1a9mW5bSl/QtfRWCYhcI6C9rhqegmsyvKbs=;
	b=M/WhvFRmnBcaVrrH8n/3j/sqN69UbDKdN72U1ezp/MuL/skr6Kauf54cE1s3iMyRo4mH
	 p5xDW813BlaZjAwFnJYc76bIehtZXPKs90TySFWOsrl672yPlhGi9SbD/awEw+lD9IIQ5
	 VhJOk6pO93x0MygSP+SBhvZGWlZWaHsaIlgPnZ8bHfnjnEgzRBWU2QNBlAtEfpIUTSDqX
	 nTC3Xw7qoFL7vkesBMECZP6mbJLaHjql2yx3OLtcM+jx88NstjeXqCDxhjKkGeC6H+343
	 U8cMVladMKdzTwmctiIrfypw3vb9MWOJOAtHt/7w7X9jPJ8fBaw5V0t508rPF8/z9Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XHu1ZAnb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZErE6gHy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153F0606A32E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 19:52:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 153F0606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XHu1ZAnb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZErE6gHy
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJAtpJ648271
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 19:52:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N+yTEKtv1a9
	mW5bSl/QtfRWCYhcI6C9rhqegmsyvKbs=; b=XHu1ZAnbmrEJWrA8grrqU8YU+Hl
	ANFhDJVso+pHirUX0Lv+kVvDJrucArnsRoj3jnAdKI/l0TpCJZU2gugn5w1iwElU
	iKNwxTSH5R9uauP2UeDVCN4GajNN559nYDbTIynZb7htPrUE0Tofso93rJcaRVpU
	R1vis4vDH5SzwmoONAgdIJBDBr6PaotxJ9cTrpz/147/etvPtzstOQPNuoFe9r5H
	9VQ+HsMeC6jWOv8D5ZDEBaPLM7gTUXTGy+b5UU3ev8T/lXvBgWET+669ogYhEWgW
	hk/WDe2lS4inZ23gYv2P7nbc6hrrx2TlrhKTb662BxB2/vGfGEEgSSIqCTw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahsatj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 19:52:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2005ce21so978655985a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795636361; x=1796241161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N+yTEKtv1a9mW5bSl/QtfRWCYhcI6C9rhqegmsyvKbs=;
        b=ZErE6gHyPmcexilO6LYBBM2sDxoB3MDsQ6L025EJZSaepEIlw2ibMAOXf8+p06q3Dr
         3MEQiBrWbF166rpcj6PTF3HNAgM1DpAJmxg61GDtVvTLZrlakDlC29Y8kM9R3qLQzsc3
         YSOqi/IT9fZuQs1rLMwPFILR3RBjrNVKD8q2JcwnpnTORmYWc3qH/GwfCbj26Sp3lK3t
         h2rgqd9QRTX2w6XQnFgLJiIzNBCv8K8UeH7togiMhKHO4T5+COiBR6nyRxb+3XTn2gvm
         +GdSMPuXBxuWjpcoXnry+eYA6E3hsN4Ego2JGGX4vmhG2RMeuX6y7z3ayQ37ozXmL3dF
         j5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636361; x=1796241161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N+yTEKtv1a9mW5bSl/QtfRWCYhcI6C9rhqegmsyvKbs=;
        b=ksNkd9EIIEdZjIuEJUEvplh1gpk63fipXIoCS4z9xY6KfwJR8Tzkumn3nmWIDire9A
         2SPiDv2YAGYX3LT8T8U/J6IvyP11AiF3LLhYJ90X6Mkh47DlEo/eAMGjO+9FZuhMB0Lh
         K9Av/C4Kul8XyBFyKgP1Bg9BoG8v8YBVkSKhcJaPaNbF7b5+gc1Q9K6X8lUTEVag3qUV
         66ra8GJpA1PqnmHDY6+W507t+y2aw6TSN7SO1ukEZyhFBPYM42qa21bZ3GfnQdjZ/KHI
         TJJurhiSqf1HsPEWGiGzH0xIk4yB5z/ftKuZOJDKVdm8wj4FM5MqPmVa0EG4CB5c7t/i
         nelA==
X-Forwarded-Encrypted: i=1; AL+hErGDst8T0lvvpYg97ImYj2U3tncWcDbllpb+SHQLM4hhmaWmOlbNLrQxlk/7uaXBdzmtP3+YqCNXFXBt9NvM@vger.kernel.org
X-Gm-Message-State: APuU4Z9BCPM+LXwn/+bJMhsW4PQ8hculv+sV95pgqhnJgn3MU2uTtODl
	p6vGgmLR4dT3ly28sCBnTISbgjd95uTLo+RVakKwpPXhNRQXCsASdpH5TCUBAGHFE9BeNm8VP3e
	jZYSmNxY4PJ5lhfIqBZ+MsNgvNUypVoNfNC85KnDOmbozbRL48WG3LNs5wLX81h4qB5wt
X-Gm-Gg: AZFdTZd/bx5SA4w2gd9h0rFwclnanPariLyb/+1yzg18LDdeQS93cGlGI5ar+ckgkh+
	DL0E6+sEuhadp1upLkNgU8oinXYGAA/SmCezkXEIL9jivSdIOUoND5R4Mfbuy7OgXJpjzhLt3a3
	7oR1FG1YWyRT0f7nvtGAbMRUd0tXJZzBm/NWBebwSbTA3imEfSQKz1ZJFdM30CpuVPKQJhht85Q
	NMrMBXEP6zOwnI0Fms8vP/kqdvVgwxdDPe3u6vS63oemounIOsTMzMjZjcWwVZyVUSZvl8wqMio
	WrBMkWVCKqIJcHCkJ33qTM73qdOb1dMneVgRClfHfxvR2xNgbVJHeVH5sC1jnfFVPCV5teA6r3L
	gVf9hiedF0JguqKH7V6IOhNqjkFxIDzG10FkjhSJp92GlWvOwgR4GuLH0W9fpCYqH
X-Received: by 2002:a05:620a:688a:b0:94a:10f3:869c with SMTP id af79cd13be357-94a10f3879dmr67456085a.55.1795636361427;
        Wed, 25 Nov 2026 11:52:41 -0800 (PST)
X-Received: by 2002:a05:620a:688a:b0:94a:10f3:869c with SMTP id af79cd13be357-94a10f3879dmr67451685a.55.1795636360999;
        Wed, 25 Nov 2026 11:52:40 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm774316205e9.11.2026.11.25.11.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:52:40 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>,
        Luke Macken <luke@phorex.org>, Srinivas Kandagatla <srini@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 2/3] arm64: dts: qcom: pmk8850: add PWM node
Date: Wed, 25 Nov 2026 19:52:25 +0000
Message-ID: <20261125195226.1563577-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125195226.1563577-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261125195226.1563577-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: NDCPnxOtenTX70HZzUi6WcRDeu_zSO8Q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3OSBTYWx0ZWRfX++AL+Q5z4MWI
 5rAT3XYjjZrwOEUFWOsdqP47waP81HfH+WffqAG7uQwLgDn+zQc1X0sihf5QwiNLZwVjJaeMNuR
 ovE+vRRJ6o11by7kS+xP/02CyXuAyWo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3OSBTYWx0ZWRfX83LNIgymA4QQ
 7WNqi15GStJdNx4s8ff9K2PJddDCgVbSu+LS8S9THgo4lAg9K7s1esyQIKc5GMtpwzwFW+dLtfn
 jyzIca0/8TTMo1qU5AtFe0HEKL2Kq3bkl7iIctMdoEp7Y+cu0frVDffeftxAEoSvqO79HlFncXT
 DJ8Pa7Q6PJyNl+359GZ/yOKoL1v8mAypT6tZSwMzsW7a9FElJ4oTa0YTl8bkkbvIHf8p6/EsOQo
 M3mJ1CqhXROri/fLqKhRJDTCRurqVCMoVh9VincHafdk52Ir411x7JKQcePJac1oS/ctiZLHreI
 6eD1gV7lGBKp7Xwt4jrAc16jW82O9ookv7XwwxO2Aa3jxpNdOUvLRhNaLSV6Ikp6yHuS1vJJNxP
 W6jUmhEypnz5KPMVZzvwYGRkrAZgysM4nMl37P9LxwEwXRtmL8XUBnpUzJDngcDBWiK2VQLAzAL
 cQHtKEBnAOfzDE7kYUA==
X-Proofpoint-ORIG-GUID: NDCPnxOtenTX70HZzUi6WcRDeu_zSO8Q
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b073c8a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=mO8_gwkcAAAA:8 a=zgIjqA5jzSmhAMQQ9ZAA:9 a=NFOGd7dJGGMPyQGDc5-O:22
 a=InTEqNb8lIr1xazlwGwc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250079

Describe the LPG/PWM block on the PMK8850 sleep-clock PMIC. Left
disabled at the SoC level; boards enable it and reference the channel
that drives their backlight or LED.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Luke Macken <luke@phorex.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmk8850.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmk8850.dtsi b/arch/arm64/boot/dts/qcom/pmk8850.dtsi
index c7ba72fd48bc..053ae42ef0fb 100644
--- a/arch/arm64/boot/dts/qcom/pmk8850.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmk8850.dtsi
@@ -66,5 +66,15 @@ reboot_reason: reboot-reason@48 {
 				bits = <1 7>;
 			};
 		};
+
+		pmk8850_pwm: pwm {
+			compatible = "qcom,pmk8850-pwm", "qcom,pmk8550-pwm";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#pwm-cells = <2>;
+
+			status = "disabled";
+		};
 	};
 };
-- 
2.53.0

