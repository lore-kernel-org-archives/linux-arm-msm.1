Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517677;
	b=tss7H/4QETDmUmEtPjDwFD0gFB+ZbcAnPLfCwOarrczsC0tsXgmFwpZ2OeJacLTYlTGk
	 ZOvXKGzi724Io7FOXwY04BepfQB7uAzLmQurMOMZJpbu0vjiAvzNKTp1P35/uvHJ5rodk
	 UJ79BXmvEn/aMgniWYPVWTJtYi2gbhkVKezBoKXoMUQOAnK29l9uCljlbxEX0SgkVIMOS
	 UambkKdibBqMDy7N22AoeO/iUPX4zUBNojJ+pP0ZzFKNeIyAClzra0v7QFn161OoxY2TS
	 VDSg1LrSU1piIoY3yuTYgAUaOJNeW140znZUYhkNNjl2WXPlLyz1As3QqCLLqpmbSVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517677;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oCq9AyrnUPb6wZIC4i+bwmGWAMp/EZK4G4q8U9q6iSM=;
	b=O4bxgpc/QoXaVwqLPaOSOlhBJVivfnrS3uFul2n36Hk7YRLQ8zJJ2sXJU79XCMjd2EYQ
	 +tWgjIICmKC39Pyr2QgW8W3dchJkIk3nQ3qu2Rcswzhu5/B9SQqVeA6+KmPV9cIWdkf38
	 nKQlccaKda+QkWjaZeYcZ2ApuaX1wGDx4cJ8ypWdjr59a0Xmf4jddSdmgPV2mtHBNvLBn
	 nRxaJu0oNmah0NubZmw+A5YwD8Jp1T814RHpmi9iQp/Dg4kzL1hO2Oco7m2GY89hBGMWR
	 7EIeBq3+7l/X844R9Tb2+DcPjwYxddr2YhiQMzkkC0uXNHfVT2jnFikyG9Ktdx4qCmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bHhleDKg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=koHXLA40;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC7D606A321
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BC7D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bHhleDKg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=koHXLA40
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8USS23701109
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:54:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oCq9AyrnUPb6wZIC4i+bwmGWAMp/EZK4G4q
	8U9q6iSM=; b=bHhleDKgvopeEk/utmfUQ67VrrpLDtyA+GF/1l9oNQoeleg8g8/
	XPS34JS0Ojf2IN7sX6kCyY2KzMEUG1mbyoPmEsDTYU3ZxK5o7fr7+RnESyNgYSm0
	kdv75y0XuBjRrHl8PuxYcIjjONueEGdWvLzPJGXANZPMpzZlFVJ4XYUw6LnK01OK
	dPPmeTn6dk+4oNrWRrD1iN461Db4CeEX2Ff7n3UjV5A8CWfvV65TbiXYKzlqPQrg
	LzewDcn8nPXw8U4w/oKUF9vJlqbhVnvTv892S/12TkuVno+UFE8cdPK19VmVrYk/
	FepIqgxQZCUFBhBY9Qw066i8rYOsU5STUPQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j50ky269r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:54:36 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-38355b03cb8so4436711eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 02:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517676; x=1796122476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oCq9AyrnUPb6wZIC4i+bwmGWAMp/EZK4G4q8U9q6iSM=;
        b=koHXLA40OG+Gwq0Tw5eu7oPIGhpeBZHBp5XIveBtcMHmtZcBOJEIPFbYN4k6HfT3O6
         qLETKg/eL09R3XGV75Cstw1bd5UfCRcRyo5rXv0XMqZKGPPLYB1sfGjINpWWmzLqVrOm
         1KrxS8pV8W25OmL5Vwn+v2tEu4oj+nflvm30vpXK06I4az/OKlJ5MmRwBDLugPLKUBHQ
         EbKOHHm9pu5Y8nMJENQGioc5NsMZX1WVL4Japb7kPVkqFI/pnKgfXHylK/WJlDayI/Ae
         /q7JHbCllU5jR4nJzohjFaIa7+gxXMiEGRDwe0OmmkAvRsdBJEovLpbk+6uURT8nR9DG
         CO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517676; x=1796122476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oCq9AyrnUPb6wZIC4i+bwmGWAMp/EZK4G4q8U9q6iSM=;
        b=yd7V92bWivs6nXVJ8MqJrrQH/KntBRlfyjmRVH7P/BrqeCrsWvj550dC1W46uwAaiO
         KU9jdxaTdltJbc19KYttW4NTEJmFvcI8Fs8C2siSpQAeI5UuUbZQblPLq8EXLS6gV7NL
         smpV6vBKeGnyYeEpKYJDO0/JaakxSMP62aewIsoNicpB0///4BGYfIGWff6OKmDNgtRN
         rk4dchluVUFzd/xau6QQvERk8ORpVq5FZ2YrUVjAM7YlFkXvtS0lI/RtBrUHkbY9GBBM
         euGSZTFdkGDQPZkfX/SBPMagUj50QZP3anfIYSresI5ROCG9fmw2+Eg+shQ6k5G//5Vr
         8Lug==
X-Gm-Message-State: APuU4Z+3VYJ1dze4uuScV+hZ41xiyi8PiENVHfWrDmtmxDU8Uk5KpH5W
	KlkIBHO9nxGg8/P+irQquBARn5wvdBAjxZMBKbmkBuBeZMDWd/V0+a1suVwDd7u4xNhKPu1FkuE
	wzJ8eMJa/fE7w71I+3gOk8yldrv1U9aSGfZ/V8zmAsMArMK4kx55sD+yIyujr7+4tUsoE
X-Gm-Gg: AZFdTZcLo6pQ9toO8vYn1stITZxVq95uuw00uuKzGKRXUMxn+FymWX50KiQjyeDcYe2
	yW4jQsaYGnTgjuZRsLsSLluc1ZE7RyD8U67G0fWjASLkfMCF0ysldwmddzbIjIg6HqC2FqeyVBE
	bmgzY0h915HFDcsJ+o/PtgjoUVKTpgZ7ZeHmVVP/Md2TV9SZGsTorYBcNhITF9tzTFnnOVqMaU8
	+9VuvcfW8TIJrQyO22guaiBCQV7fOQ1c9aKceyNA/AyaiNn3tIPCsdNpqESYJa3U82U+aD3Zy+q
	3PqtVa2RXrv8nUD5Ux74HUpz2P0FFuLa3A2nHW7zTBVKw0md0EvKmJeEGwGcYMbOKf8BYCsrMNb
	+kJulcu3KqPmL/JZZh3K4mC/VkP4AfyxP/vhqJpLAwaEW0cVwP6TEcvUKiyoIdPSTec9qTSayHi
	wr8CplSdrAmMhr8YYUqQ4okqz6FR1RCnxd4L70UnS32aP7ZueniuxKoWA=
X-Received: by 2002:a05:7300:d205:b0:36a:1f8:a56e with SMTP id 5a478bee46e88-3856fe564a1mr14547469eec.23.1795517675952;
        Tue, 24 Nov 2026 02:54:35 -0800 (PST)
X-Received: by 2002:a05:7300:d205:b0:36a:1f8:a56e with SMTP id 5a478bee46e88-3856fe564a1mr14547443eec.23.1795517675449;
        Tue, 24 Nov 2026 02:54:35 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm55231578eec.5.2026.11.24.02.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:54:35 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: crypto: qcom,prng: Document Seca TRNG
Date: Tue, 24 Nov 2026 16:24:26 +0530
Message-ID: <b13bc8fa6aac6e9164ce9ad0ab202d0df491331f.1795517666.git.yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Authority-Analysis: v=2.4 cv=Y+ptIReN c=1 sm=1 tr=0 ts=6b056cec cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=lHObh2IfMKzVuqTG74EA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: NYKckIkLdg20vgVmXNpI9FEk97NsWZQn
X-Proofpoint-ORIG-GUID: NYKckIkLdg20vgVmXNpI9FEk97NsWZQn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX+L8+QMAhMY4X
 YGcinqxhBB6mmEBIUdqNweXifQcKSGCKSU9pqs6OoO+o4+jRjM6Ni259xVhpgo0tb1CIn4IL9Kg
 yLgWu6csek7ULUYyGW3+3fpTogBqmSg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfXyDoOG8/Sw7YS
 pLlX/2Tz5CHqCcn0Ui/HWZYpX51GkzNXa2jBeuXgj9aiD6evb4MmA9w2IVv+KLQQ+GZxbCwBA9F
 HXtgUWsr5yJvCIoJO7L6r8GQB/kKGRTBDeeL7gtnP+yoLlWUMEI2Rvi1xGtQNP+Tw2VHqAzkJYi
 HClTHOOOKJPdqvR47zStUrHsarc64sc28CABNUEjR6dtAaLrBWHuT1OGHRxg370HOnjHE71j6xB
 p6bL3DVSPHiW3z5wEMCmPQP/+rrKUop7DsT23HZceanV3JMrLQW+4xqVFJJlx227E21JxFZ2Vkw
 824a0fq0MLfkhJMQMeYkwjgFwdV+Ka37rhleYWfC8PW1ybDWdP5TkT5RWcRE7HWCOC4sOeeVlPj
 6ZpeMcjAO6mOYHWhoU9SeO/HrpYKb1clFXlBMF7IMnrtZrb961bR3l+s8IaHR7BgOvb5nEkBLmm
 oHbdY29+XB6E6zeUbjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

Add qcom,seca-trng compatible string for the True Random Number
Generator on the Qualcomm Seca SoC.

Signed-off-by: Yadu M G <yadu.mg@oss.qualcomm.com>
---
The Seca SoC device tree using this compatible will be posted as a
separate series.

This series was prepared with help from an AI coding assistant
(Claude). It assisted with review on the device tree, bindings and
driver (formatting and alignment fixes), rewording commit messages,
and running the validation steps (checkpatch, dt_binding_check,
dtbs_check and W=1 builds). All changes were reviewed and tested on the
Seca Ride board.
---
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index de323969fe64..cec847c52f8e 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -31,6 +31,7 @@ properties:
               - qcom,sa8255p-trng
               - qcom,sa8775p-trng
               - qcom,sc7280-trng
+              - qcom,seca-trng
               - qcom,shikra-trng
               - qcom,sm8450-trng
               - qcom,sm8550-trng

base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.43.0

