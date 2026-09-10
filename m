Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C831F49B21D
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047004; cv=none; b=GSI0PV2UjkhZBELGHsK/mYCighCh/i/GZwrwk1DXf5yOvXISDgiv50pITYxyvXbrWweWTtFz7j7nmk80WCwyC/lkRumFtCu0+nqFllpXRSyP+tdgSVZbP47V+jV5h4ei7D6Pe0YPk/aIVwNBE6nxi0kxp8+JpYZkV3ts6E5+fe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047004; c=relaxed/simple;
	bh=XV9v5D1+9gPZXEtX1onl5e3mfJusxovOJOelXb/jdw4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AWWI6ukSC5DI+q8KSRxF++0Cv03yIPMlqVhLT66PMbkBfkYCZkvO0kHaFLO+zZ1X+C7Y1zehcOsb1NsQyQyDqK5SAbIzB0Ak8Epf5U8Ipmpl0h1Z1mhg+5/No2bnqDiQ6/hiBedSJGdSfjOxarHZ1BF8bd9cDbVh2IkOWiPUgRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kvpjyVb+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d/KZq7/8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kvpjyVb+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d/KZq7/8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7lIn245013
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:30:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	czflz//vzxCEPoX+dRgQmIOa3mdqZAbZV0BPwSj5Qg0=; b=kvpjyVb+yqMg/jM+
	d3AhA0vPBt/ec0L4NRYMcnp32fZZD1yv9ExQzNlxdUpWX5mBq0cBr9fwIt1lhCU6
	waMif3l/oJo8fHPGTaivSbKDM10BlIAQ9YG6MajFO9XasDhBIAbES7x411qhp+WN
	4+a42f0pj75Wr5m2GEuxIuDFy1ZsgoKWKN+EE7oXQXPKJE/ElQ5a3IMg9lnigvpG
	3cuRgA1s1BDPWMkfItzhWcqseYIWxqyDD7E+33Zwkjd66/5IlEiRv18u6gUf2b5U
	3RB7hK0puWUKMGeoXflD74Pal1G6n0a0tkGvXcqxtfnTwDkyNMb1Z+DEr6Jms01y
	Yp57ng==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyfm3k7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:30:01 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so12668013a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 06:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047000; x=1789651800; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=czflz//vzxCEPoX+dRgQmIOa3mdqZAbZV0BPwSj5Qg0=;
        b=d/KZq7/8RnRxymygA+qfQyfYKc6KoiLjHioSrd9a1O1ZYgtCPlj2apj6HTkKUH4dkF
         5A+I6DanD2XLj3kNQSLgb0n5z+QLqqrd/TFlgYelkQu63J5UAvFg6LK15bC3t74jjWbT
         5Fvma2B0wwCzSqhLGM/VGm7sfLVHjIvMPAtcaKrk47dTI275mEbaemvoK8Imw2/hKivf
         mb3lkJxnCHvBY0pj7zyWlFt2iK10fOYdIuzyNjdV3ZjpJh7EpgWHdXxABRBMS7ubMnmT
         WPWh4VAG5WCsJynl2LIIBQPddoYVoseYvQa5ekpT1D0VynwXVDyPnfX4Z26mIvaYPOoM
         k8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047000; x=1789651800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=czflz//vzxCEPoX+dRgQmIOa3mdqZAbZV0BPwSj5Qg0=;
        b=JD05GOwxgOY0Mx7hOlvXprktED/gKSVbVEtrMvflCXQTNLtcUYL84pGoSgLXUzRzWf
         KL4YJiMTcUkKMtrhc1s76buEMaHoiLLDeL5Z7i2AbKMZc5ualFVaSIy3+fgqdhk/L/OK
         eyD6vFUCktzQHNlTwU7hqJCmVAmv2VNBA6CHhN/kv4OKWpT0oVduHfIa4gC0hbds4//b
         3Hscx1nYf/8533e4uMkXVr/N2S5XD6hPXO9U4XJwGR7UOahGIun2Tv2S+JvuUhnQKZ/a
         evWd/lsW/bEd3dI3oAoeemo6M/17L4kLrHRxSWg0hkLXckHMKODMtXzsKI+WNPDd83js
         GGXg==
X-Forwarded-Encrypted: i=1; AKwUvByI+ImA7GVt/YWySHB0br8o5ut5RG5NTuLDXcBeQ7tNm18+RgaUMYh/tqrk1Fn7pHQspGbEffPLBVSY1HyQ@vger.kernel.org
X-Gm-Message-State: AFuF++ltzAwD5kZlr50+aqbbXQ+zgl6hHrQzu/vK0MEzs5q7f1MGKyr3
	pzIFZJCT76nXTsOlF7BVDo6MfW6IZUIS4CHKweO1G+cKB1rPfwDRVPlncYDzpSpOZuTcS4P7Gjx
	3ozYBxVdc6hD3NCFAQvF5GnnKd8R0qspnPjzN28gR18l3lNacTI4vZ/rcewjHqHS2lxtl
X-Gm-Gg: AYBFou1Y8AnhfJzERRlElYR61ffgDHrS+NTCH5FmOnuOBBSrWqomFowkWq7Gp6tyY73
	4MY8YJBpskr4DQ6OGdaWmHftouemNtjSj+nXdKoBf5/LFXexkwUeVSgFZku067Fuek9bQG6k34T
	2efV3psiGvzow2FG3OdDGqaxCw8tajF+nP9l5EP8FNEqiO+gNwPeLRe6Ve9IVOlAh5Gf56Sf6rh
	KG/ROnG9i3yrwKgJAyyG/iBl5heDE9JPV3NHP8p2V+SwPkc+osJPPdzBlKMQYVvh3phywWF7fCQ
	TANbamxp1+64H0eRYQJqGEvIF+zghQTAb2IaabD8HNlFYkezmuYxoAarCMXssRD4m5qENgM1Pyr
	v7Tg5Ya8jBK0jEDvl4E2L7wYcNuIXwMfQn4c=
X-Received: by 2002:a17:90b:3a0f:b0:398:de23:9af6 with SMTP id 98e67ed59e1d1-39bac34a3c3mr18658624a91.15.1789047000377;
        Thu, 10 Sep 2026 06:30:00 -0700 (PDT)
X-Received: by 2002:a17:90b:3a0f:b0:398:de23:9af6 with SMTP id 98e67ed59e1d1-39bac34a3c3mr18658548a91.15.1789046999851;
        Thu, 10 Sep 2026 06:29:59 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:29:59 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:01 +0530
Subject: [PATCH 12/34] arm64: dts: qcom: sm8750: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-12-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=919;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=XV9v5D1+9gPZXEtX1onl5e3mfJusxovOJOelXb/jdw4=;
 b=eXhKCedKJ3+kNvAG8XJp+DhjHFdafqrmCCxM9JHXteBu354oHjoxJ7jZyBhOQZETE11mWknUK
 ii64/qCbBwTDDH9uUUzfiPB2nvVUWL5tb+lKhNzYvFburDDM6TnRaox
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX7Fugrof0W1aJ
 4LSoiWwgtLTpQwHz+6ISCXy/eadfd221ODdGCVZ+fdhjJS1BB5UfRbMG+kCi2ecTd76zfzMrrRf
 es3PiWBYWEQCfr7kYkGtRvX2iPq2kJ0=
X-Proofpoint-ORIG-GUID: u_2xX7Cnk5LKRbneWpqLECRJPOMdW4LC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX8lFpBP2hDtjn
 AiKPvfkqs7Vb6bA+vj5S8t4FbjpjU4RzQ0GTYb4iIQyVyl+e7lpmJpUEqr5km/biYMntBuKhl3Q
 E83GnFJXyPbG4Uyw1fyoekZk6nKM2G/TKESED1OTz8R8oWt0bExipbxzewmGjAYzOcDsSP1Vy/Y
 4/DOFKtVPD8ovPB3nWyGqiq4dg2Zz9k/9V6KtnZXM+F88DdR90/JZNTbnO+l1la0heSG+8QQT4L
 rcgIFyAARTCFT6snUixRC2UKEQXl2GahHTaOIgkxDdWa00wZ73sEQI5ESCgyCgRDlJV09Mi4yrT
 AEjnWhXMUVWFedEPHxod8fix8hTwTNuzD5uD+LZH7+m2RUaZyxpPwD5ZA7wYwqAu3PkEdoTCRX6
 lzsCFo0zhDU8pPS6WlJc0yfFVfXTzRpXs1VypnLXfM78HH+eeIkRUtJhLPa6dJLtlUp5zdGuu7l
 SY+Q9ZyaToSaYNg+JEg==
X-Authority-Analysis: v=2.4 cv=H5pOUOYi c=1 sm=1 tr=0 ts=6aa2b0d9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bu6UjZ7a5GH_BZZocUYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: u_2xX7Cnk5LKRbneWpqLECRJPOMdW4LC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100161

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 9b5fbc004df4..23476fbd993c 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -1119,7 +1119,7 @@ &pcie0_phy {
 };
 
 &pcieport0 {
-	wake-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 104 GPIO_ACTIVE_LOW>;
 	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
 
 	wifi@0 {

-- 
2.34.1

