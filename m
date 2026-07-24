Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A895B3F2109
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784887849; cv=none; b=mKLH37a8SRTjbbDd1x31KMIkcdXTOZgqEjkA1D7geIIhXIdWsmJroP2C2VNXdiS/1JqAPbH017CfRi2ohfKgPjw9MojFdwAEU5t9wbw8ZiudR5s4i38PuIajzhg3G6pRkRy3hranHl9are4iU5cDCJZWdgYwSW4b52TBOtV8Xdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784887849; c=relaxed/simple;
	bh=fvzDiZ67AMugJfYnW8hKFy6ptEIPS5tGSZjlOp7y0GU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KXsivl2a7dqsR+GfyckwtE1cIzmHS3pNBEu6vvbotdM/OuAk/YrZt2HtfB+Sg/9ph9k4V9fx+fEtrTxZAkHObLUQB/C3lD/CaMby3Vwci5TZ9laFM5MqpNx0KWg1gkYF+LamX3UqFK57t7VnwcEEN2P1c9AtEie2ob9pOZK/KX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W8LWvKK0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=feBsA63h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W8LWvKK0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="feBsA63h"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O9MGWj2754981
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:10:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qmzQ69Ie4mcQOk1JreV97QpBgdyvfWbFuRHTnab1d4E=; b=W8LWvKK0GKLFeJHY
	5KIpik7G53TDgRM52e203OR01qr3TYzjswRCc+VrgAP2hl0vUfrvncAKJ2v4nT87
	j6FIOqS1oF/tgG7z00BU9tev33Te5viSYF6Nhqrf61s1ehYaM5P9PfXRVFzLytHv
	B1ER+NiHCC0XTXb7VjBe0pUGoP94VyezHvf7hU5XIwwthvH5a0XEdnaZvCU0gNuk
	Cq7GN2ZB/tiPztOEiMLToYon24YwI/kx6KMzg4zgIBlhHWwwgcmpaC6U/xrGFfVZ
	eFgtOL3/M2+0vhDLK8kF7S433jxwdGqubBdEjJlVgMDzJ+FhHurNLy6MEP+P7Bw1
	tmks5Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5byr5vj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:10:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc640dfde3so4448115ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 03:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784887845; x=1785492645; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qmzQ69Ie4mcQOk1JreV97QpBgdyvfWbFuRHTnab1d4E=;
        b=feBsA63h7M1p5Q1ZJok/66VxC8t+IYiY+mxjYC3JT+ZM7BVcbKiG4/EaoggTScUDRF
         wAqSu8wrs+NeTDhQCcPnvwvH9DA61dJ+mZHuKdT9roIFCrrSfHBIdbetyziZDFXkc6rk
         lJQQvPEU4E4WLpns97XzLeyAvSnRl2uXUxDP1vwUNXtL7CLe3m2oSY6+RX4QvqT1DA+r
         g+uQVpzNeBiDEQWMWhnzTKiyTE6NIunTah/2rRvj7c/TygDdpu0gAuIOHeXgsW44o6vO
         IgCzwdNp/zUz7ECYPq35yL+puFrkBZQo04Il1BWAjuhZfCsMjqZ+YIVG80G1RGLSYd+E
         u9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784887845; x=1785492645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qmzQ69Ie4mcQOk1JreV97QpBgdyvfWbFuRHTnab1d4E=;
        b=nxm4Etf97XESgAth7T7b81ztSJZT3P3SFc/2Mgosn0D2iQODXK+AZracHSqCrhS1Dy
         X5WSaHY1MTeBKvcKKsn/vrSp7KnsvNj4e4ovjzLGXXLByd3I7NY+Ywyi3WeO4/bH+ELp
         jiV2VHZqxh/UwMavoEa7Dy7S5CTivFAK4MvoEXmI9yEWXRRpqq1Eh1a9hwbCjM6I0KG5
         OJi8UGOwknh9r/itWGkQVTbBYe+MYV4ggSXWe8Ya0zicHr0FZhNN+tnidfBHid9rGAOZ
         sW8FPi9ZcLd2sC6tg51KUTX9CDk7eUbBIEUjp645kH+qzcjTCInMzUi5LiaisK2f8zA5
         BFDQ==
X-Forwarded-Encrypted: i=1; AHgh+RpjtRYtTLUZWqST7J+nAht5QJT3v2dCUlTSGepViCDsnHfaucxlKz6aK2bv1OcsfO+Nnx8HwDNOxOBBMBgj@vger.kernel.org
X-Gm-Message-State: AOJu0YzLR+U+taU799Z8O+rQ0cQVbB/KsN1UfKmgPZFHealNm05MnaJV
	i4oBUUUb4RIpHdkCAr/3ug3sB9SExo/WvkDuRnZQV1sqzBkwPoZInWEm+YJG+CsUXU8Q+067zOa
	2qadJKGHT57AsoT4WGLzPTpEMFqQXiMirwPie6zWfQQT7v2wTjq0sH2zOoqeDiKZvEkT/
X-Gm-Gg: AR+sD11Yd2d9ufOToGFn4BTBi12uWx+x4CF+/mKA1WhAGceN6liTzEKr/6+EwBMvG11
	gzer/ZBS5JP35kGqo60Q8ah7tUqCq+DZaxhDFA6LvW6pWA0GCSpIKAjtVt9jhMAIk/oGRDSAF7S
	Ni2mKrDGpUQ5hGPobvjJilVGcXq9dD5BSz9GT8TGx3XXK8tBawubNG9xoICS41ikKrdwn2DNF7K
	O4QtesGVeKjWCAPBIHvNiVNgvv2HNiKF20FJEIYUwF48ItkVfvvAcKHPRMPVkYrYYPYw+O7XJRc
	ii1K/ray7jMxQ+JTCWuWN3NLwLaUmGxPC6K4a70kgkO1FFM0rabuxaNnm12sfee4BYONOw9TbgD
	w2BaNGCMZCZRpKK6mYwbPRCMW
X-Received: by 2002:a17:903:1b07:b0:2cf:4505:6bcf with SMTP id d9443c01a7336-2cfa6c54aefmr80413965ad.29.1784887845423;
        Fri, 24 Jul 2026 03:10:45 -0700 (PDT)
X-Received: by 2002:a17:903:1b07:b0:2cf:4505:6bcf with SMTP id d9443c01a7336-2cfa6c54aefmr80413725ad.29.1784887844998;
        Fri, 24 Jul 2026 03:10:44 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f390dd2sm47863705ad.79.2026.07.24.03.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:10:44 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 15:40:13 +0530
Subject: [PATCH v3 5/5] dt-bindings: mailbox: qcom: Document Maili CPUCP
 mailbox controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-maili_initial_clock-v3-5-45b577241c91@oss.qualcomm.com>
References: <20260724-maili_initial_clock-v3-0-45b577241c91@oss.qualcomm.com>
In-Reply-To: <20260724-maili_initial_clock-v3-0-45b577241c91@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: T9bnVH6qKekvL3VWYJE51dP1hd7zR4SX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MiBTYWx0ZWRfX4FUaaWCaUQsH
 39GhNEhsajT2bmdoPuxum27Hl6+90MBbeTfzjPFu4bkUEPXg9RSLOKjmwP4yj7aL3uPxT7bYRNN
 Lq4PgHEwYKkM3DakzbZd42dCdlTJSA4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MiBTYWx0ZWRfXy1F06wO7oNt0
 fPNWVGHTA/GyjN97Ru0EX51Xha/mmZqBWwkcOJBf/J4kmfvvBanJgIRWJtB1oFe9h54AgKdsknA
 nzXmxXcjETLrkUMw0UxVu5hyeFQIegvsa7ZeddDfoxZO5pTwpzB0bHvecUTTzB5krDGu66jIgLX
 x13yY7asC9K6puizRzOvyJeY8soZWQym1wI0EO5gF++YMyrXt7vtFIO6ydUyrAP+YC/BLbqSrVJ
 NJhfNnCeigV9w2XQ8AmbZTTZOmxdLXtsahYBtELpQwyXe/tfEO0nLimzA6zRecFymfZNid0LDcX
 jsJnpugdHMofVdwbfvHbV7S9OxsskEMUzwF3YoVjQu/aNmEH0iid8MUj5YuUnnjCUgoQBp3C8Mv
 tUvjphbSfBSjjhIzAhwV4Y5f11BEN7SJM1XlLLuvu0sRvbuvxY7qtPng7ywtZqYZHR3XZTCgROn
 WhDI6wOGHDhg/rcIrag==
X-Proofpoint-GUID: T9bnVH6qKekvL3VWYJE51dP1hd7zR4SX
X-Authority-Analysis: v=2.4 cv=GMA41ONK c=1 sm=1 tr=0 ts=6a633a26 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=5FXc3QUEpXE_4WiDhFYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240092

Document the CPU Control Processor (CPUCP) mailbox controller for the
Qualcomm Maili SoC. It is software compatible with the X1E80100 CPUCP
mailbox controller and uses it as a fallback compatible string.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
index 03359479d926a623c467f1b8ba857d787366d411..2185920e1b5d2154a23b67905106f35e0b71eee9 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
@@ -21,6 +21,7 @@ properties:
               - qcom,glymur-cpucp-mbox
               - qcom,hawi-cpucp-mbox
               - qcom,kaanapali-cpucp-mbox
+              - qcom,maili-cpucp-mbox
               - qcom,nord-cpucp-mbox
               - qcom,sm8750-cpucp-mbox
           - const: qcom,x1e80100-cpucp-mbox

-- 
2.34.1

