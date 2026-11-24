Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522581;
	b=c7SmIczAXW1I3WgBk/gJ2+B8Ak/x/ycnGzzlgOA3+8csNw7XhxbzZTBfvrp0Sj1NYN1v
	 mTo1mSFlVi1p0k2yi5nIVvPhNgD1STVZ7qx6HKYYmGDmIPPRYaDiEL+YFfAILLZiDYaym
	 QXZAJDSRyzHuWr5i8dyNyUCZ8GPTYBHmCAea641GstDmq28ME4kd5HXT2zclx0GCteEr0
	 d99zMS36AmughhDHVvVuAcgeIe3fmxWGkrlpK5cXEAY04fqBxN1oHrD+P7OVHA6H/1E/t
	 z/iipi93ccEjbzO8lFGlpUs2+W9yEWDQfN1O+2bsLYIiCPHcL/ltjZUixy8QvtGXE1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522581;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZsGGYXWDuEAPZyeN8P880JLDy4GjUNE8fC94ZgoIpmM=;
	b=4GiuiyPlYwLGBJAWM7se74KFoF1sSzG+SkAGQ6nUaoDWTWgIvo+3mviTIMcgaGWHp5P+
	 QMpMYNTsFXtrM85wTEkig5g0YkmUrkhMpGW/Nomdzik3M4FXI7qHxABcQZeTYxdQe7uT+
	 TBb5Q68oyeT1ikxBh3t3pDVR6mVjTjXJIVHhe2DDaTQRDOarwWkrF80VYazcH6f3v9c0T
	 37Sk6x707XgfXMYAVmAmD/rkvmOW/8rpv4EEeboI2CIsz8gIhW/i6xLZxFiAVAKLE87Bt
	 m7dANg9AVMPftNJEkDMYDpkdMCUfcYryZ6+u1+iK0FKTxHaUXLCCrPBEgQu+kYxWD9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DLywCx7V;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="HTo/7HJA";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62C7606A32D
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 12:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A62C7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DLywCx7V;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HTo/7HJA
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOCDOMQ2848984
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 12:16:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZsGGYXWDuEAPZyeN8P880JLDy4GjUNE8fC94ZgoIpmM=; b=DLywCx7VIF2etErr
	6/pg/2IJDYM2z4mJ0hQ4hcgCsPlCa3TtUijIegMrSptOT4gF1l0Yg+lTcfJ+DuXg
	uQuADbfcHe3sbS6B32qwvvNNOpe1IuXxrYe796vilRKuGD1MAAZ8TDr3gP/grFIx
	NnQp2Olb/saku5yjsaWCP3cWtAvbzStHGk/I/DZc1/RyGjbnVhoGqIM8KbN8YVg+
	biDZSlGGtW4FTyXbNj/gG+GurOMyDS5lTYQeOL/PhLxJERv5fACAzOBs1RW/iH68
	Vh61/I1CQ+VdiDRYSMFhd6TXk/ei5DyDYpOFAbTWUBsW4WIp/s0R12+AIxtGG9Vc
	HeL4Ug==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5ad7r0ef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 12:16:19 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a064f294cbso3255485b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 04:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795522578; x=1796127378; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZsGGYXWDuEAPZyeN8P880JLDy4GjUNE8fC94ZgoIpmM=;
        b=HTo/7HJAEFaRVK5Wvgiol6t7ZENfcCUcfL3F+CIFFqe8/dHFqUqxwYOGMotOn5SL3K
         /LS8eKx9Zz6P2O4oogUu5pGK7imz4XUc8F9J7wcghHUohuDysurE+uXUzP68kMiRlxJq
         wu/ut8eiIXbbzNn9d+QO85S/vstmFZMGS0CvuPQkLhe2Q4z0TOhnQPQ3gM1vqDMqLULO
         hq21wWptutn5NxBxZgRHe80xlEHhDmlMSC2jR+FyP15gs452n6XFWV7iA6fTYrVL9cB4
         bf946A7QfzYgTva7jjAoYjQpQAa7fhfi5TWv55gZFVSHmNldDPz0jtIW2epoxE9wbwot
         YDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795522578; x=1796127378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZsGGYXWDuEAPZyeN8P880JLDy4GjUNE8fC94ZgoIpmM=;
        b=Ii2WvL/viWzuZiugirZP7Ajq/HHjXiwnrSpbTzHB6tnjG19CINSOVSBB0BW0L7p36a
         CKPDpmTHl0rOzklHkqTWzRZ+aXTvOEovcMnhcCourDJOZ74SR6RKdgQ1sWa9EPTfrs2j
         6lzKm/OiG1Q2AB3wNdBkqiBdCOnHBr3mFpkhX5RMp1xYips8p+Of4HbRSXghaXV4kG9w
         fvbBsvh7t1JHjVc9DeDv67Ji8pMA134KdobJQUu0Xe7GMLwrs3Rd29OmMLfeJr/8YHNR
         3TKcbS3KPFE1IkOgMZ3FRWnZdE/GccQyKt+14tn+0hMj8Pc7800UmmfQKuF/WsKHgsNn
         SPIg==
X-Gm-Message-State: APuU4Z+Y07W/+i+ABjQHtAUF2iH9+rtGakBN2yL0dlYSZK4b3Y/tyvYJ
	lkNBgXFwobxb5rf4C38BLnmPFHIT5QdVrXbT5PAhOn8MEKpcZRMJNKwoijtTrEFNHy40sSpvIBE
	+MBq9qyBsc9feqTfOse09mPiYYB3t2zS1qjYZhEDAP8U6nMSuagPeJrZxwUzSbH489Z+4R5mUsZ
	fU
X-Gm-Gg: AZFdTZeVElit/uHgC76GiZnEX1N8ukR/jxZGGxu+KdhIx9SBezaMpB/6BNsjMtfEu2a
	GjptaUTTTkYQejiMCd09nynVehbYNTxOEWmkzPimETF5y3Kq8tcinEHL7mytwe+zCiF9aE8kFwC
	m0gjhC+4K3iVEjeoMg+aWFUNQfiN3Lbp4FoS1Ne+0WdPrrilG66EDduUPjIf8ps8d9VDvBmJI8h
	lH0aohdvZcJZTMT97a4vy2rqlwSSZIU5di/aHmZG08KRIlYUrkalpqVIHDb6Mx7f0S7DwgsYOtd
	UTQJJNnJImBXw25Cwl20mJ0vL5FTQr7QmpKxwiOOWVnE8xmQ9g/OQMZNa0kZJUZNJqukmV1ZnQ6
	/XplmJlqIlu0kq82kKJ2K/wnl+W9g9+AjQGPVHjT5EleEPokmgQVcFShtkmCoorzPCO2SmksNJj
	pvOITCAIdl
X-Received: by 2002:a05:6a00:44c7:b0:886:5938:cdd4 with SMTP id d2e1a72fcca58-8c87baccf21mr12944488b3a.19.1795522578332;
        Tue, 24 Nov 2026 04:16:18 -0800 (PST)
X-Received: by 2002:a05:6a00:44c7:b0:886:5938:cdd4 with SMTP id d2e1a72fcca58-8c87baccf21mr12944474b3a.19.1795522577871;
        Tue, 24 Nov 2026 04:16:17 -0800 (PST)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8706844a0sm7245572b3a.1.2026.11.24.04.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:16:17 -0800 (PST)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 17:45:23 +0530
Subject: [PATCH v2 2/6] dt-bindings: dma: qcom-gpi: Add QSPI protocol
 identifier
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
Message-Id: <20261124-qspi_qup_upstream-v2-2-cd69894107c8@oss.qualcomm.com>
References: <20261124-qspi_qup_upstream-v2-0-cd69894107c8@oss.qualcomm.com>
In-Reply-To: <20261124-qspi_qup_upstream-v2-0-cd69894107c8@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795522563; l=1017;
 i=jyothi.seerapu@oss.qualcomm.com; h=from:subject:message-id;
 bh=EEx2Qf9ht9RV2ShxIZ5R8hgTYqT6216fgvKWmMYEzDw=;
 b=MgqTwicYRlvJgrM+Ti/uoSQignoLBWDzOxIHDD22f7YmBLV3491zS+retoQpIsYP5p+DKHrhf
 mKE2Qd6sMgCCVjhNsFOTSJZT/LrZ8iIqqNAz5nUPLgwvYkHYqWm4gyL
X-Developer-Key: i=jyothi.seerapu@oss.qualcomm.com; a=ed25519;
 pk=9vafyYsia0OnBKWSEwhmWe3hPVQfI2T1xOs5dPaFvEo=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0NyBTYWx0ZWRfX3HnN0KX6oGLa
 I2Zt7lrxYyHF33Eg21XXc7+GEOibVJhg5AWXmrxKoPt9FuOpOWcVL9KjtY08Aw4BcuRbyduHzXC
 6kBlxLUSRa/A6eFSw893LgIlBDv014Q=
X-Authority-Analysis: v=2.4 cv=cI51IVeN c=1 sm=1 tr=0 ts=6b058013 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=XDCUMzA_0XyrBmuHy_cA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0NyBTYWx0ZWRfX/Qv7srmpl94k
 BdicGAeOL7yk76HBz5d/kgSz98zRey6Rw8c3de7Ab9ZYuGQBXXYz8Q9H9C7zVlEC5COG9cmZfIQ
 26YvKumOIZoCBY8csBD1kCdthA5y6nGxUQyRdXvWaMhggAzhU9944Fk+OmvTGKaZ6meBnhujUoI
 saCIZ5CWebYKsj1upSijbysRFElNyzC/ChgdCrFpJnW5yYrjfxON3v7AdpjkedfN0/oUzfGiX46
 vlOr3GLpYiSTn0RtXCeO5kVe4+Wzr5ITxS8LPrfGLb3cidj+DiSwiUfVKT+sbRNNECKHTkppIqA
 l8E1bUyQBkxv4jEMyq2EmxeyXcxaMg5bWZjFom+RYIToPKwAvHIe8vucD9k6/MkYtO2V6qud+cC
 ivHjwFNfaZAQ4+P5/3o1Bj6swN3dcvK2jx2wjMI2ipAdrWDe2J5Du3aeRha78uuqSdxT4U0+oJZ
 Y/qP7NTIjxl2b6ec3Qw==
X-Proofpoint-ORIG-GUID: 7cxuEIQfFOHgFtVCIwnwOl3pJpsr2FCs
X-Proofpoint-GUID: 7cxuEIQfFOHgFtVCIwnwOl3pJpsr2FCs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240047

Qualcomm GPI DMA supports transfers for peripherals using serial
protocols such as SPI and I2C. The third argument of each DMA specifier
identifies the client protocol so the GPI driver can configure the
channel and generate the appropriate transfer descriptors.

Add QCOM_GPI_QSPI with value 6 to identify QSPI TX and RX channels in
the dmas property. This is a DT client identifier, independent of the
hardware protocol encoding used by the GPI driver.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
---
 include/dt-bindings/dma/qcom-gpi.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/dma/qcom-gpi.h b/include/dt-bindings/dma/qcom-gpi.h
index ebda2a37f52a..50fdfc5fd9a5 100644
--- a/include/dt-bindings/dma/qcom-gpi.h
+++ b/include/dt-bindings/dma/qcom-gpi.h
@@ -7,5 +7,6 @@
 #define QCOM_GPI_SPI		1
 #define QCOM_GPI_UART		2
 #define QCOM_GPI_I2C		3
+#define QCOM_GPI_QSPI		6
 
 #endif /* __DT_BINDINGS_DMA_QCOM_GPI_H__ */

-- 
2.34.1

