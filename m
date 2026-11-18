Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007364;
	b=MfgJI3JGqKqFJ6GGHE/+q84uJ6hiX5hA45xpLH2XyI9qBm184dU9eb5CB47RZhcpZIu6
	 bKkK4fVeiiKq3pHuUARstUdnhoFKaCgIZJVqDeEM7kxgSzqwtWgapAsxw2mj+f/yb3VWf
	 atnGWfVaf78hcixQLXQMAIhIVYRcQ1+dcNVs2yP28eIV1LhM8tFlhO6GrEcQUJXTUmBAy
	 jCtwnXLM0HLGh0S7sBIP5ttxQAW+RmCXWhy0goQmYaOi3oAgEebR9w2iN/75aMlNxmVNJ
	 JvuUpEbc8RZC6Nh5QxIOUtHjiqRPFBXD7lqSTg3Wg4+s1LSGRCyVTWCS4bid2FzUXug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007364;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=50tJpTY0/NQyUgPm5jhQ+vnZd/4bBfqxV08nQXImnYQ=;
	b=rxUXyOOEGI4b+bcobHYEYNSPxERoBtzkqftGk8MiOOC7zfNw38YuwS9itzUewVp4w1dP
	 s0IHSe1zMuq0db+DCkkVKmqL7eg8E/EaQ26DLNHQoksB5RC+NMWUPuIQUETpFwxx555WQ
	 /vDf4b+Q8qNwhXOGo0gn8RgKLTdHw0F4MEe0Vb67laJa2asOSKXsH+OCeXWiyUKJFcpAv
	 0khAFMUPFPn1rU4UUH6yc7UCusNUUbLj9eHezbEMnAGKP5jHa1WIqQ9tPFyPXgfeeNHA6
	 q+okv0eP5Oxa6eyYyTUHwuC/mptloAg/OkJLhnl9Q8Y7WNbDqKhiKqu/k0CL6UDQQqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g4Mm2InU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K4MUi4NU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F29606A325
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 13:09:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9F29606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g4Mm2InU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K4MUi4NU
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AICLj7s3421459
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 13:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	50tJpTY0/NQyUgPm5jhQ+vnZd/4bBfqxV08nQXImnYQ=; b=g4Mm2InUlKtWel8W
	AxFk2UYEeAs/Y4adM6uBs6VVrikELWv71NK6QSY0xFKeC4/Uyp0UdKT7bIwkbxiq
	6wXUN6KAsdXLKSFORbje5RI171Uz20MFjy5lebVO2Ye68nboGkj7gHu6JJtP634N
	mVYjKJWldUuMZyf6Y0/yzE5EHwkSt0e9RJQ5nSF8WP9nl6CeSFuNl9ECACDNwsyC
	l2M5X0xl5NXxOkwKEE4xCo7Mvr0rJwGD4o9KI1MNoZc6VEw7izz3icrIHG2NEbHa
	hOOuJlNvl/66byJtoU2aCgIqEmFzdkUzB5jR5doXwFSNBwfYIrWM2kQneRumz1j7
	KxYrdA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8u2dv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 13:09:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0a0747175so175866a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 05:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795007361; x=1795612161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=50tJpTY0/NQyUgPm5jhQ+vnZd/4bBfqxV08nQXImnYQ=;
        b=K4MUi4NUtHDTi9KXBjq6YAwcKVeG+dtlwEZNwAdgD78cehMLWf6OKHgDBRnKl7+hZu
         M5mAyZLjGtGoqVVMhgLJ3bJ5AoxSxxMpBz5ppnqdJZFUZIyrkwgw0pVIt4n9NYdMwKMq
         ZzM2TuIv7oTAI639m+iDZgP0B4iZkKEK2LW+o5IhTBG6n1L6n2EbxM8RmyAAH/yW6rHL
         CkNwiZl5iJkjUsvU2PccE7461HB4KSbTgRZBQR8lFzIZg4IlvCjGn8ybdR1Z1HgxsYx4
         dd07mbDuM4qKDnk3xPYxUQHa0kKfK8vuGqSF/w+6IgrEGNAkdKPLFdUIZdWWEojMmyr4
         40Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795007361; x=1795612161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=50tJpTY0/NQyUgPm5jhQ+vnZd/4bBfqxV08nQXImnYQ=;
        b=N+pjiN7zab9TI6nT6hFWJ3sAcKDcoFaI0upCdClq4MX9FO8VJc05QCJeNWxxAHTY+Q
         ej54IFjwsCWExsaET3x9cfXxDdPvqZrb/KgKA89QRTRPokzymhZw9eXCMV+uvaAn9a6k
         QBVhBFfYJd7L0MyihaMTywq7Dc6GSqcAIbqvE2yzW/WEDzMV7FjIDwqQ6502DRHRZAWt
         ctcZPk09F1J+neszn7RzkgFY/RfjQunlf7gLj7RSdhO199aMjmu+P3Y/ZS3rapIH48mT
         Y1/d4VaiutJ/eoRc6sBzaH403+vx+z+7gd6NLyQWMKGYCa3dMZF6aWm2lp1O/L2C1nqq
         H4Aw==
X-Gm-Message-State: APuU4Z/D7H855jRXzxogI40llrWhxu7ARNcu4WWPBihwTQqhDESr+nKP
	5B8h9/jD3fFFbQPQrWSlkmZvmgCjQAb1em+PJj9WKXZTLdQXWElAqr7CtyaXU0ardRsKI/O/JGR
	SquXnaBX8SsRXctcfeEl5YWqxg48MIPuPoLdAL6szQxetkps3sIqXdAKxqRpkvGPdyRVK
X-Gm-Gg: AZFdTZfyuH6Sulm+KzneBYjewbHBjrltZrXdCivcuXfqUUg5mnIyEydKtFd598COlf4
	Z8G9MblTCgFU3HYlGL/2scPK8F7yCn8f/CkkELeKSpENxaU1hNYABbS9aLE53FLFudhm66MFJv5
	5dHIwD3MCvKuAAy7YkHjwkReCdVojvghCilfQLNxhXz1ncSx/XRf/rnVXlxs9q4wQKRl/gS8oFh
	WRi1+u4x9IfiCfwo2ZzSLWHzr417XgcUHx7gxGBNyxufRTdcmvWvrtA9iK2VkYV53O7VuAXtpIK
	BNVgTXqoJSyXDGuTCnjwZ/YpN3FvDMmwgQI3ablnbV6CILMTHUzVRVGtKGwzZsbh0qyQdtDj6UC
	HLBHkruCSfIlC9MBb9dn/wfaXxE2WX3wPacAecBjw8kSIRV6zFli7/QeefnNpgFPgdjcS8eYpIw
	v/g0vkmErB
X-Received: by 2002:a17:90a:e7ca:b0:3b3:ab75:c947 with SMTP id 98e67ed59e1d1-3b3d06a489fmr4456541a91.1.1795007361477;
        Wed, 18 Nov 2026 05:09:21 -0800 (PST)
X-Received: by 2002:a17:90a:e7ca:b0:3b3:ab75:c947 with SMTP id 98e67ed59e1d1-3b3d06a489fmr4456486a91.1.1795007360842;
        Wed, 18 Nov 2026 05:09:20 -0800 (PST)
Received: from hu-pvgtejas-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d187dc82sm4909533a91.6.2026.11.18.05.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:09:20 -0800 (PST)
From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 18:38:30 +0530
Subject: [PATCH 6/6] arm64: dts: qcom: shikra: Describe the GPU CX SMMU
 aperture
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-adreno-scm-fallback-v1-6-e99cdbf3121d@oss.qualcomm.com>
References: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
In-Reply-To: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795007310; l=958;
 i=puranam.tejaswi@oss.qualcomm.com; s=20261118; h=from:subject:message-id;
 bh=OrV/5vTYv13MHRURk6HQcE68oIHzOJUujrYoLsrCZl0=;
 b=E02f0xCUQ0B2N8YwWTg2OQt6tBwet88oCSzgp/qF8U6IEa/zGvNPhvlA1LLu0l2TD5KGmW876
 bGya8WcAb/nCcfpQ0ad2361m10ugHZ3zS27WF3pmhb2SD5rO+ux7ch2
X-Developer-Key: i=puranam.tejaswi@oss.qualcomm.com; a=ed25519;
 pk=I7kFxZ7dcroo7ZWUatk8fR/J/KVbRzZq4ZBLhRRGpJo=
X-Proofpoint-ORIG-GUID: Mv1sF6paCSJ0naqrRtHjk3uoZI1_lnyq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1MiBTYWx0ZWRfXwACzvmVRanAv
 3NtuHcvVUgfjjbhbFO7Tgfq5Vq588F+KRfwqZFEY7RlkgapEcKBjG6iDCMXq1MlYTV57sAvUUov
 RUy9kWSfPNM23x5caoD8zKajogmQIgU=
X-Proofpoint-GUID: Mv1sF6paCSJ0naqrRtHjk3uoZI1_lnyq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1MiBTYWx0ZWRfX1HZ0WTXBEW+G
 PTGymjXhdejyjGLfvE8tWyPN3QiMmyzKDoHFUtxYb037sy5U+RxrinF+xq8HnoQzs3o3lyJ6vEA
 Mwv+2sbr6YqUY7Mgr3/sqY2Vzfe/ME1pCECg6FLtdmUqEuOPtCLohNmH2KM9O2GLOiOxqNccO0I
 lbefbrXg+NVJy21Zzeaa4qiCUuCA/zL5Ur00i2lJYGGU+OfO3O+ssW5hcNsdRe4xFQJsVgfCBkn
 /apEnjp8Y42TiasLkCtSSiXzF/lO6JF1DK/cyORRHvYZv8ixb41llGD+XYoZmGKweGb14S3IvcF
 klbbD3AmNWDm29BD2yBFDSQOt9Ea4IrImAlZyVcpHdnRa5ppUwAb5cVAel9ocx/0L8uQanG9rof
 tDXFqUSfRmvoiCt4D2MV58jw329gTzMzov7NwMVlwZZNXjxqk4xD1eiVvGYHT2NkdCQa4oyC7FF
 nHAGlwUCVCMWshpT4RQ==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afda382 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=KBsJZNVkQGKO3p3TXRAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180052

Add the CX SMMU aperture register region to the GPU node.

Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 0a95ad5a5582..ebbe5e23d173 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -2647,10 +2647,12 @@ gpu: gpu@5900000 {
 			compatible = "qcom,adreno-07000400", "qcom,adreno";
 			reg = <0x0 0x05900000 0x0 0x40000>,
 			      <0x0 0x0599e000 0x0 0x1000>,
-			      <0x0 0x05961000 0x0 0x800>;
+			      <0x0 0x05961000 0x0 0x800>,
+			      <0x0 0x05960000 0x0 0x1000>;
 			reg-names = "kgsl_3d0_reg_memory",
 				    "cx_mem",
-				    "cx_dbgc";
+				    "cx_dbgc",
+				    "aperture";
 
 			interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH 0>;
 

-- 
2.34.1

