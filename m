Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874018;
	b=4YgxymFSFYZkarVCxZlAwlMoQK62s5csWOwOlRyeC++b+JAUxMGMqzhmgY+/++lqABTV
	 QWT6kurtiPhhUtMCihzvhnBwoQtPThyWqGdBUJNE+TaygSIl9xr3Ec91oHP7cF2lnmQbO
	 GGrV5RBhHWoSFsk/KmUvPVd4RkUKDPW+brdW666TDEso837mfDjuo/A4fMjfDKjtZK04X
	 z8n6xcatfSbWm+tFLF78bCuAr9UvAK+ekWH5t+BQjWEKDVMN2lb4JIzwu5VLocQIEG7gZ
	 owDYJXuMhJ7IyU7Ut2Ms0QogJiQthvOidqkR4HvuWRFe9wW7yczESzLnA9VEkehjvsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874018;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8KVmduvNfoFze9aKRAh+crTKFlI8QYI0H/ZEZjdKA/k=;
	b=bMVfZMo+5m2hwsQ3aJuhmADW8V7fCuEbHFwojmb5EMnrek7cjuM3ArRGOj87PBHzFyKP
	 ZhNJ1y20OLVrXIAKAJzMxEu71icEKBZ7kB6srsWXEkTfBpnXYtdh/9Eaq8As/hXXc4/kc
	 aCwpKYcxrRdYfh38Nl8Q9rgLP4u6CsWM4eamsTDSdcrlQ8aCkVosuCHkGEvxfpAcOTE3D
	 TWcNWh8BzTO9G/5gCxw8A41dc39iZhKuh2qfoGJWQthuRjT/OXde5gUYht0gKAtUoCoxQ
	 P0+Qj/A92yDUCMrl+fI+MT3WAbGtf44Ye3iW3o7uUZT6aHYbUlYV7nLpQztyAkWo/CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KsPyVLGE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=feIVj6ia;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA8C606EE88
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 10:20:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBA8C606EE88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KsPyVLGE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=feIVj6ia
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tBfq3684331
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 10:20:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8KVmduvNfoF
	ze9aKRAh+crTKFlI8QYI0H/ZEZjdKA/k=; b=KsPyVLGE8BsXOiEYbjI+81pY2gK
	0T4ptHO7o+8cJcjCv9DFxUFLTupEhZzLoB3C/VYTYtY5fUZV4H6te7pl13A9mPRM
	QhmBBg+/SxvYcnPLXhqPbTLS8rGFuh0ePGXZqJZP99kgEueQ1Uudhiw4XkH5pJH/
	A8WVKRqvVSdRx+P4NNg43KbCRr6FMzwNnPeQ1hbW1nKOMsL9OHrzpxULwMSrCM6p
	s0V8KQfhg9+EuJ2fSlfT2DjLtFyMbDgwPnxKA1KaNda5uNVPj5DQqs8fVjwD/tE7
	i1J8e2QQwgZagY1gwUZJ59UW8BNthy4knGK8tK4nTeNGa4eHRM8MTcDuoig==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrj43hhgc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 10:20:16 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36d2d353a5aso633232eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 02:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793874016; x=1794478816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8KVmduvNfoFze9aKRAh+crTKFlI8QYI0H/ZEZjdKA/k=;
        b=feIVj6ianq+jmxxVZFS1CIlPM90TiDndE0xF7/otll3BpOvPPsdq54HnE6dUpdctO5
         wWrHS6Zyfoy/VrJI5U1fwqrRHKSfT+11uUJli9ZyTWhmQCmFjVImyHuaF2Nm30kd084u
         yhCTdAwiO0fCv8/Jq9U0CRAtcNUJNIrgQdZJTrCOXqyA1eeKstDEhW+1rfDV2NTADgDt
         vJ2jSNZDIu+9/qlVeyeQAQwQl5zIJHv1NO+mm30R1BrBeNRzYPD7l0+tktzfXVfxHDvu
         6lhriOb3/EGIHbyoFeriT7EYInB63HQ92+E/lks2RVaE9ZsxVYeOuxw/szkooyH8vpn2
         4xOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793874016; x=1794478816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8KVmduvNfoFze9aKRAh+crTKFlI8QYI0H/ZEZjdKA/k=;
        b=qYwBwM/dgXu6FaMZSCsSLGfd4mPTv3UpDeneZY2ETstTtbLwLTRd3RSH2K/qanoVL6
         qTviYtYizafvrZU2yF8Rg7/pwhbq7kDHAaM52rEwh5xKsC7UMs74fnaSp0LE/n+3iNQi
         Ck4JtkU+ljSj+P2D+xT1TiGIMtx3fbUw3gntSIZAOdn6qBxgFX5c1FubByk/3/APVgx/
         hCUYeE8xWk58pGIDIPHpQCKUUfGA0/W0Rg5cShbYk/nylc4SCt0AgvMwSp9NNHWvw/L4
         skU+1/rvcWF4zUK0vb6JU5h8B5XNqb8ajm3Q2XZrx4vfPt8g55AsCbmgLI/zy4hTX08U
         Tsyg==
X-Gm-Message-State: APuU4Z+o2cRnVIB83G18pS1E3vitqOHOt2tz3Gpdy+75HYFKiCK759SQ
	UPJuX14elO7yTuOBT0klO2wIuRmNooHbIX1InODJmh4zVLwcle6y16DVtKnAyz2lAT5RAgxr7UA
	1JYbxpMvSZelOpkdyU0mOoZi9GGAgp9DPf3THTpnyB6s1SUr5JuYZRhTSUHNT3Kbqbzav
X-Gm-Gg: AYBFou0jXICQaIXTxzqUN6O+a4MoLohDSLDNKb5HYG/HMsi2UKgYK7oJTWIis3GLc7r
	gLNpjw9A3rqUKziUiloJTl+RByUumT8VXirbeEIiLMTUgrxbkMBwFSw5mmUXTpDVsziVW2C7RLE
	J4TIiYNmU5KFOj6tewZ6oG/HIWtR+4Umdsydy1dosgxsWxwd3WHaNeJgTnHpGaUhzD3JUAG+0Oh
	hbSyn+5n8YEhqRP5b4wMVftOJm+3OtWWxm1x9vUarAGNA8WMVQPH6tCjMIWOpDzH/f8t1IibmHk
	t3Z8EM2frimvR1IoYlSKSeXqc1Y4wOGD6c0AeTzWTPHuwGHq3zxXWPpFkW4nIy0cZiZfqRPPihJ
	TJez731dT4Q0gRT2piCzR912XuMfH5TYTE8uHQAbCTWrdAxUbzMF6x+o4M6TpjfoSLrZ7KAdjxt
	2USZ5RoSR3
X-Received: by 2002:a05:7301:9c07:b0:362:2e2f:c261 with SMTP id 5a478bee46e88-36de7932f28mr2963301eec.27.1793874015927;
        Thu, 05 Nov 2026 02:20:15 -0800 (PST)
X-Received: by 2002:a05:7301:9c07:b0:362:2e2f:c261 with SMTP id 5a478bee46e88-36de7932f28mr2963254eec.27.1793874015320;
        Thu, 05 Nov 2026 02:20:15 -0800 (PST)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6160sm14115330eec.9.2026.11.05.02.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:20:13 -0800 (PST)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: andersson@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mani@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com,
        shiraz.hashim@oss.qualcomm.com, monish.chunara@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V6 1/3] arm64: dts: qcom: monaco: Move eMMC CQE support from SoC to board DT
Date: Thu,  5 Nov 2026 15:49:53 +0530
Message-Id: <20261105101955.3732723-2-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105101955.3732723-1-monish.chunara@oss.qualcomm.com>
References: <20261105101955.3732723-1-monish.chunara@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: sqS2Mlh5LU56ZzcH27gYqy8oX5djRaMT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MSBTYWx0ZWRfX712u2poQwm09
 VKpnxrbX+CeD/ZMODIoFVeGKMw/dXJuSNQJUaGqum9RL/GPRvyHWD3DKKFnvbFPIf7R43TmqeLC
 j/MyKd5wI5qbGtAV/+Mw+KUYR12Ze5gtW8GtExJc6PMqWA25AdZN8gZNaP1odDZuITfv/QFitPN
 /3Dk4CVcp5RsQk5AhZ8A2O+xYg98GkzhN3iqNtgHM6jTFzwuWt8uzH3DCcXB9noI0JzZDttuMRf
 tVEPbpD1IqQ+8Cv5ekElxa4Ir3+9MEx+s/zpHFfFL231Ze9qtmZCxnvOmXmiLGjC1JhnPzwSGNp
 Hh9Q2aOhctyOz7kJbW7pq/PN2DUMUbx5d+ZfDnwsTIjfBoJeJJGlmijz6f5gh4SHL8jfW7DUro7
 e+956ZB7b0uh0V5ywdCUiJZobSTgcd/PkY9TX1h8vTJFEJr3Iq0BNkGriwjDOpABNFGFoQwtT73
 UE1vZka37R5wiKuQzfA==
X-Proofpoint-GUID: sqS2Mlh5LU56ZzcH27gYqy8oX5djRaMT
X-Authority-Analysis: v=2.4 cv=SZdi5fRu c=1 sm=1 tr=0 ts=6aec5860 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=aGigY-oVRoDAAVteN7sA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MSBTYWx0ZWRfX6V9haPE6G0Ei
 hB+1dBV1ZnCHVeUoHxiycb6zj63LOZOA/YpzhiMTxOnwX5wcjUHWcDMkA3q9fHKJWfQjpnCZ5gV
 hAR4Aw7Iaarf6vbRpYEjh0buiNmQpKA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050041

The Monaco SoC SDHC controller supports both eMMC and SD cards. However,
the 'supports-cqe' property (Command Queue Engine) is specific to eMMC
and conflicts with SD card operation.

Remove 'supports-cqe' from the SoC device tree to ensure compatibility
with SD cards. Simultaneously, add the property explicitly to the
qcs8300-ride and monaco-monza-som board device tree, as this board uses
the controller in eMMC mode.

This ensures the SoC definition remains generic while enabling features
correctly at the board level.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi | 1 +
 arch/arm64/boot/dts/qcom/monaco.dtsi           | 1 -
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts      | 1 +
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
index 36af1ad2105d..a489932c7b1d 100644
--- a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
@@ -275,6 +275,7 @@ &sdhc_1 {
 	mmc-hs400-1_8v;
 	mmc-hs400-enhanced-strobe;
 
+	supports-cqe;
 	no-sd;
 	no-sdio;
 	non-removable;
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 35fbee63d4c6..591ad233f90e 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -4843,7 +4843,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			qcom,dll-config = <0x000f64ee>;
 			qcom,ddr-config = <0x80040868>;
 			bus-width = <8>;
-			supports-cqe;
 			dma-coherent;
 
 			qcom,ice = <&sdhc_ice>;
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index be850a23472f..54770aa7376d 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -721,6 +721,7 @@ &sdhc_1 {
 	vmmc-supply = <&vreg_l8a>;
 	vqmmc-supply = <&vreg_s4a>;
 
+	supports-cqe;
 	non-removable;
 	no-sd;
 	no-sdio;
-- 
2.34.1

