Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E6530100E
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784320984; cv=none; b=PeMz5pG1ScYA83RXgHCMCEbbqKNld1lF5JpRt8iWdmkyaiV3tRyx7UpmcMa/c0M116mgQVm604mJLQvKZeEXPldN5gSt5OVU69dZaLCohK9KWIIQJ6uE0GFh18VkwqLYWMxmghy3uHPInPULxkIJGOGy5OXtDbLsDttse5nPFxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784320984; c=relaxed/simple;
	bh=ji5iLrBg00KLDTJDEeIrkWdaqc6esAA0v7oRt6NInIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VZ0pREhjggMRorbH5jOKTAaFcfbmD6mjkybQoW8SNzaacx0eTiRBSCDKmN5DmeVpK9sRJjqHmYNDrWRrZme74xZ+akpXOCNjbkojZVuH7XakCH4DvC1o/4d3KJILBs4X6svGKh20ApdmQXMRldR3k53rYmOSbwDENnInIlkNafQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DpiX1zfS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OYJd0VD4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DpiX1zfS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OYJd0VD4"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtljX2824137
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j2OnpQ0EmgRssH2L3CQIB8lRZrNWoIaLQHzlCrugCPk=; b=DpiX1zfSRa6lldwY
	U3+6wAwK7OaEjUxXNbS6Hpa/Jz9rdmUiuJruNGa7Ft7Pb87qNd5/8ado7rOywoji
	4g8r0n5RFV7qkO1xsONitbbpmd6wSIJCznkxWiA0eV4tMGotcuuqFG9WordV/heW
	63GJ6k2CtjkSArYE57hlftCsvm03e/Gye8q3E+q1/cQUKZwicwmULldy9+pxbP8S
	FISXmm7f99LpO+yvArlXiWZNavYDNvcCVNSE2ypq+uC19ybeV6JwC7YwVA1PNXMc
	msb1YG+ci7MF2ImSX7AqWz7uJYIdoiN1XUfk490TItw3eAD8W/N1yOczeHCe7mjk
	l0VYyw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff8138yr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:43:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e5a616d07so252387a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 13:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784320980; x=1784925780; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j2OnpQ0EmgRssH2L3CQIB8lRZrNWoIaLQHzlCrugCPk=;
        b=OYJd0VD4qYV/g1kigqSchc/+ll44WB0OJGjchMh4Bhrjssz8+CVvcKB9dTuXUIpDRB
         CWcJCpADm024CYXyuonjTd9zBpTS0bQ4VW+dRSAWzUVfaDSKrGCpwIcvNcn/LrfNK09X
         1JCnLSBltaylEQTvhdcAUp+KMcEPSPMLgPSAScEtsxMyAVUk5bXXayrotmSdEIVnlkGi
         fLpmyVk2Ok5L+i2nGs8e2GntzLHKIsjaNEuayrOh5EzpV8BCy/9u3beNYBB7lj59uW9v
         LbhqSlzv9aS+N8RIeG6ucjUmDAn+p1wIKz5zrne8xJfBSIF2o0Vaw25vzeXq8TmXgY/7
         2Cvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784320980; x=1784925780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j2OnpQ0EmgRssH2L3CQIB8lRZrNWoIaLQHzlCrugCPk=;
        b=KZj5tF4ggsjGuset70zfiuI9lyVVavS9CkjaYnEEd7jVf3w7jPFVR1B5GhyDX7XNVz
         9hB0AgNrTZZsBWUcud09DpmJeI4SrAUKAShDp01d/v0P3MUFezZHEGnB8EisLaYYCVEn
         hFgA8D7XdWENuIq9o4KTo4xOB0TlAAwbzVuGjxdxZfFSEIwjHkL5iYuHYMpBPaEZjebD
         6WtZrLTAVIaHo/r0VRZ33ECIAJU9Le6BN0RK4sXyj7TZ/2WKtWvg1uB3MQIZ7yysqzas
         nf7m7S4MBzFjH5GRkVOgBEeOpSYh5rDbkv1wsUvBqGyM+kO2daNi3vnLjNTkCjmpgJ6V
         CmSw==
X-Forwarded-Encrypted: i=1; AHgh+Rr8xpdMlUq3DL8lul2sTF4MYOtxcueiXiawulTftTdo8n0eM7BWToEBpnpGkQ9C/+IyBe2vbHn9SJhjHlUy@vger.kernel.org
X-Gm-Message-State: AOJu0YxCYczpL7VPt5WuDdIxFxkWlY0v+9PxSs3iuIKdTo2tIn8Ai44O
	nOVgSD0b798Ve9hi6hll1huP+H+akLZ4FO0Tfi/1EPfmXOy3E/THOuglYDwv8Rch80Gxtoywm99
	YZrGXqxqiLJAZcabkn6wSIzGErjLS6F4ApcoTWfH4vbD6yXDGBf2ZeAW91JOqyEQmgrDk
X-Gm-Gg: AfdE7cl1mmD+Wfiwml9q9MW9ESBUL7GqdhiaLsjzc4dT3tqbJVx5OTVFkHSs847uTBF
	eftl4NT3MtGVFpwXOYxM7eWxikB5EHDUkOIEeuDKi6h7y20AuQI8OrUpVoF3y6HMTkBzGIsr4/Y
	R7qGXQ6BaEmC8xdF1emkQ5M38Qydgz3ZaJxRtZD0MODrsnrxdEG4R+YjekyBsCLVsV95D9S+zgT
	vJ5qk7GZYo9KnBltwtIP9Z80PB+oDte7A+cEdTLFjaAkXD1x+CxkEv3zrOYvnDzWK7ii1PPl992
	UgAzeHLg/xIKcIelXm0IobhyjBrd3+Bof0/hYM29JDiz0YW2WcdfBRNBwqauI5SJc0qeAFFX/xS
	yNUt5N6INot3Lq03ZPBcSTAW0
X-Received: by 2002:a17:90a:d60f:b0:38d:c834:2106 with SMTP id 98e67ed59e1d1-38e4b51656bmr4228883a91.28.1784320979919;
        Fri, 17 Jul 2026 13:42:59 -0700 (PDT)
X-Received: by 2002:a17:90a:d60f:b0:38d:c834:2106 with SMTP id 98e67ed59e1d1-38e4b51656bmr4228835a91.28.1784320979372;
        Fri, 17 Jul 2026 13:42:59 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1e348bsm11322997eec.25.2026.07.17.13.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:42:58 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 02:11:33 +0530
Subject: [PATCH v2 8/9] arm64: dts: qcom: eliza: Add GPU cooling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260718-eliza-gpu-v2-8-64379dbebd7a@oss.qualcomm.com>
References: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
In-Reply-To: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784320899; l=1862;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=I2qdHaXAWQ66skBdEcFBDJZY9iFXnEWZCtP8SvXbtEY=;
 b=Hr26za7eMf4CPEZuBeq1QpcGTa+cwNyDY7ry7ltZ24uYMQrlbbDQKhp1jH0P9FhBarogV3/ti
 yGBLL4sPirEAEkMVokLL3QmWaYWdYvOUfnk2qfLFmhYQ4OdQKTpPQry
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=RbqgzVtv c=1 sm=1 tr=0 ts=6a5a93d5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=wz9XmjxeAwFrORu178sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: T8atPm5tjZ2WyNiGLAtdNXfgdpnqo-jp
X-Proofpoint-ORIG-GUID: T8atPm5tjZ2WyNiGLAtdNXfgdpnqo-jp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIxMyBTYWx0ZWRfX0MLiouQvmp8Q
 u2w4lFHSh+Jq3jO3pZWfevxSw4kXcDyiD6z2Fw0Q/afjpu7Y4K5abCLlDEs7YxVgz6mweSc++WK
 +1+oyGcR9Txh/fQ3WAovxhz5SoyirHT0nSSG/5Ot/yoH+Id2byN87BYHs0zB7040HqXEPF1fMxL
 EbLDqMAfkS2KDdCqMv9wQIiWjvMUUaZkm13BSTa1xjIJg27Jj9NfM/rOMwEno5NbfT/62AT6P4Z
 TRTinb7haqQSDRLQxVVzxCFBfOtvzEOo87GHlkWPqzGdYUs+hs2d94Xz5xG5I4+NGKbWZCxvzpO
 r8u6js7UqP0Z/n1VOgNAvbQELFjA8q/gMX3eeyFO1pfisnylLLAHoTSzPECEkjTQIFofwk3AaVX
 Do1Nhgb5ho7V2zGPVUtmgPjdrpkbH0Aen6HDWG9+TimnpBTaJ62iJhHY4xVAyDhzCVqZkdsFZ9X
 B8aYZ6re+zQPqi36CAQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIxMyBTYWx0ZWRfX6FOICic+T7VM
 vVgTgxX5Rb9mzpDQSD3lwZig4QIeNV+dzPXXxXyRRrvrKuQCt6If31RYpHT/+jRSUooE+1zrtIE
 mPTaNEHH4PnL7mkCW4zmrGPpGF44mN8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170213

From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

Unlike the CPU, the GPU does not throttle its speed automatically when it
reaches high temperatures. Set up GPU cooling by throttling the GPU speed
when it reaches 95°C.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index c24c5e9695d5..7a6095495b5a 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -22,6 +22,7 @@
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -4203,7 +4204,7 @@ gpuss0-thermal {
 			thermal-sensors = <&tsens1 8>;
 
 			trips {
-				gpu-alert {
+				gpuss0_alert0: gpu-alert {
 					temperature = <95000>;
 					hysteresis = <1000>;
 					type = "passive";
@@ -4221,6 +4222,13 @@ gpu-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss0_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss1-thermal {
@@ -4229,7 +4237,7 @@ gpuss1-thermal {
 			thermal-sensors = <&tsens1 9>;
 
 			trips {
-				gpu-alert {
+				gpuss1_alert0: gpu-alert {
 					temperature = <95000>;
 					hysteresis = <1000>;
 					type = "passive";
@@ -4247,6 +4255,13 @@ gpu-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss1_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		modem0-thermal {

-- 
2.54.0

