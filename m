Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795471140;
	b=2NoeosAeP9BkMfyyKJBhH3AWU5AckCwg2tY438fFkUvBaleGXKfAkPrAIeNsciJPhqQO
	 QFAPXqkqDTVZW0RGI+/jY5kBm2qomNn1AlVB9wBioJHfEXyhXi8sE6OCVUcVsccXvh5q8
	 kcl64hWJatMosLZqjsnVBfD0SMVCChaG8OrUsQRLOhMXyDYZtBxhsA8IojZUT4oXhscVb
	 v7ZkDlm3nIrSvc8lwyEXOn+HbI220lF5jBp6vZpSDQJMZ/pHLOg6EN8VQEPobN1AGAb88
	 YnWM9zwpwDmoS9bL7QnuFJZpMJwOiFSFcCYekCUOiDxm2KjdJYLZaf7eOo2/fdTIdiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471140;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZhJLNJcKZbLsY0YDb+VkHdgB3v5oyd24NiRj9juvaS4=;
	b=oMHYgNbeFJmQcrYwlLplY91SAUQGzBKDHYolw/keamsC44KeZgJ/sZbfjv2p+kD38oY8
	 wrLChaKGzRoV+8DTS84JgsdUOMzr+/aZcsRbZP/fEgW9TD64DFoX94lXbQb+zoLssxSs5
	 7Ri7SF4xW/6t2k1Uc/KQDUlxs7VGjSEES9kAMSgH/1z30Y3+4zibKsMKa6GIC84ApO8UW
	 XonY9gVyFFd0KZUA0FBH/S3qlI5IUF0HW1Cjt1i4+Tuq984nQrsHkVwN/z9zrXUNakd+7
	 tuy45DztBMb70MTd4AOURMTsm/Kx7ZjyNsZY1AlJ+bQVhWdkX3lpJ8GtKeaNVNDIJCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=psuYqVBR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JaoC32Fi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A327606A337
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 21:58:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A327606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=psuYqVBR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JaoC32Fi
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuRph720763
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 21:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ZhJLNJcKZbLsY0YDb+VkHdgB3v5oyd24NiR
	j9juvaS4=; b=psuYqVBR1Le/k7GjYo+7UDgGpgVo68ddmtTiiEzhIPNF7FccNAQ
	bX+fLHICxApqlQl1RBqBTR+4eEqRUKBE3Un9CkdwAU5HqHPgIgw8SCM4+fncF7S6
	iB+8P/xJqMOjCdIFfnVEiCHkoHu8UGn0mPdNkuLbPWBhpBNQyfPMhCNLNgb75NeA
	CMNGUG/E7cusRxJ6hmL2azPxOzJ4qjY4zTzdhM5QZBDKfhuumS0yJNM+P66xLnxW
	SeAeX2UjhvXRropOYCxMvNBLS6h8eFlBKWi50kmXxtsIg9A8qhGHSW5gLZSwLdnf
	jY/QQ44I7+21N6H0mwpBTIf0/8sh/x8iGXg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqghrx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 21:58:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-948d83322f6so95511985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 13:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795471130; x=1796075930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZhJLNJcKZbLsY0YDb+VkHdgB3v5oyd24NiRj9juvaS4=;
        b=JaoC32FiuYQaWMAz6FufKNRNWNVrR/YM03bMA4w/Ds/6kAeTkMUb2aXMKaPHhEyYXB
         fb1SGibHkwf7jSEYFuQfBxpbI2ncMyOgi0T3SD122Qx8rantsXibnwxW7jd9MswOd6G4
         vHJmCaKRNPiQ6DTQQlHICMyu/LmttFxgk2XqiovtslDhbxhqwtjXfoUXSdgzcGyT4S4J
         LnD9JxFHWiU6gZZJ6A2nSJWzD2/yaZoM8ZOfMERcWQPr3ygcAWKj5PjaxGSHggfQHZ+V
         VAYNrBR+BAStFGdTuMQb7jlPBcWPaeY5lXxidq7rKFJnQPhiqbnAFp8NGvBYj+t/z10H
         7C2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795471130; x=1796075930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZhJLNJcKZbLsY0YDb+VkHdgB3v5oyd24NiRj9juvaS4=;
        b=tgnTrPZMwm1AYsRVuZyS8krNgo76Gy18Jh8XCs3VPzgBzz1F4+Hg8WDxiBqlku5n0w
         EhvMVaPiqeBg+UkuYXhY5j/x3Xc7QtfaSZhJalBvvlUQp5YAYdQUrnglTTI1LHpASid1
         XyMg7F6zfVKmF+C+b71AuIiHgeDiw3zNfB5BeLlyzFaGsQR0UC4q4ulHkvrtXsOzUmNe
         S6bMXyIjukh2VGwa8l4kOiNHEI/4SbBe3rv+XxmRW23pB/g38eYtCHXb5eysMaXZLXAk
         hPffexEtvRdZstdiSKPpdMWB46+Q8KPjr4z7ojkhbERs7ALmydEol8T1y4DPIGaAd7P3
         QiYA==
X-Forwarded-Encrypted: i=1; AL+hErGjXfFcv8K2LqbikhvWZucVK0gpNEOQLZq1z427rhtYFigfTLJhQbmBxeTxeE2viWgLP/z/SIXnYCxHgu4s@vger.kernel.org
X-Gm-Message-State: APuU4Z/iBwxycT1vRqfDcw7Nd47AdPFatkHZC8NqA/2iJyXwDbM15NFd
	PqBNGUTf/z0WQX5+RizT6VPo08p4j6p3T2gelP9JYj/iKkmHnDlNf4i0nYNYU54kRwtwbgDVnJX
	4KKQ9DH6XFTbhGZe0TM8g6iH1zxMataTfsh9MGeZ4Ps6DkZUH/SjxkG2WRDw+9Lh6Bezi
X-Gm-Gg: AZFdTZcYze5QTIPc2kspGQJhJUp1CKOaxL/+PYlWnAHDEe1vWkmAapX6yPyFrRh0+4F
	ULonSZ61ZD0yu3ENuYAMfFS29yZ1PN9wrbe+LL/bqX+mPnecmNFF+DvhGs/0or0/FJCNypwt8wG
	wg2MFj7hStcl1eNxx4dx/ybcR3knzfZ/rWb6sq5+JxctmhNqaLXJlLqxIWpeYZXNCeqBSiFgzsC
	vnEl21+Cxd/kzCYElEeyUaMlz0pcHsZtCAwqLY7vKK3CB7Qx0kz/1dLKACWBap3T3NzPWAzqeXu
	RD43Y7egdRiG8aG4WYuPQgimIN4V3Mv/md85UMWTUGmWfxrXRwIwn1ayaGrWNjQSeKsrlW9KaMn
	5ZDf2kLnSiRx+eQJrVM2IX81WLwLLIf6wz9uesCGkVIS+qU0DiHux30D07tUKzQ==
X-Received: by 2002:a05:620a:2945:b0:949:6f9a:c049 with SMTP id af79cd13be357-949ba9e3599mr2252987185a.32.1795471130442;
        Mon, 23 Nov 2026 13:58:50 -0800 (PST)
X-Received: by 2002:a05:620a:2945:b0:949:6f9a:c049 with SMTP id af79cd13be357-949ba9e3599mr2252985785a.32.1795471130003;
        Mon, 23 Nov 2026 13:58:50 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm429427965e9.10.2026.11.23.13.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 13:58:49 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] clk: qcom: apss-ipq5424: Drop unused qcom,ids.h include
Date: Mon, 23 Nov 2026 22:58:43 +0100
Message-ID: <20261123215842.21088-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=724; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=ToRKlZq1pk9x4im0ALS1DipycJrxyesaHb+41j1K1NA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrBLcSMCvKFt8TdaQGFobh+duQ2nZMApKUVShJQ
 hvMrMi2DoGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawS3EgAKCRDBN2bmhouD
 1xqGD/9JOEyvFuni7akDb5dt1QXTR0np6H57ncZBagII21D7rcXRzD4+TIPNPmpxr3Y0PAzFVIW
 M2QJhdw6urv32mukZ7JlRyoKudF12/0pVOJohf7QUF/XEJ9QTkiWlU8iDSIPoIoQpvKghCkUgcS
 MB2Z9NGtevmHySoTConHe21t5EY8nff9nM2Ck/3H71jKGMdTiGuRmb4LU0AE43LFygcj0juYk07
 O9mcNim7izdYrVIWctleLqSjwlxyfzkKrWQZ0uqIDff8UYlbfjBCQGGisiQnA1ANzNe4XYUprMi
 /vr96/SqVH5eheB2uivofX0/pQF0BPSxRclRLIBXM5j7YU9+4mxstvlWimK8bQLO6pzdMa4lvjb
 a2Sq7VZETBYHGPtf+xH4WOiMyfSRVEKvs9iK04BS+0djvrvvDwuPBm/0+aEa3LLCNniUx1m6Fc8
 qBdOpnauMygZnniW/A7yYE4mXb7Gmij4YJTEHighPW3U5SE1QujDotFy1iuqlQkT1vvkGVQ5XSx
 tJJF67YVNP+6UCjgcrdmOoBHyt7kso1vTt8Wy3wXcFoxLuCD/a0DmKd/e5rxffQBSPa712f1o18
 fV/xOU1lzxXrB4Vsu0ECIMEzwhkA6sepwZJV4a5ncZAWCavUErLeL7oChEgF8G7g5tpz5fH7R6P 6lR7au6RYzNbICQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b04b71c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=eshxwDXe2nWDVXl-4hwA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4NyBTYWx0ZWRfX0wMvUt/9HfUB
 CcdN+Nnx8jYPO/3TS9ryzYDyhAkrMxyFgZwuz7tC1NM+wTMwe1+QSyG1LGrS0Spd+Bgxw1EjjYc
 VCKMlpBQRoPEbfGKM70qAkq5mlXQw7wpasJJNldKODWEafxGMFKsB61Hhi0ZrRVNJFWCCoxnoPr
 6GqMFU6Tqx83hkytXw/NP/2ZPNRsbSLEC2toOaCTqejzKF65kDvs7kQPAIH2faaOZQXx4h1+YOy
 cLIL8g6u7Jnmaa+kc/Jh0Ril15j30vWghclMI6F3luDAjY2Vpvtjylin11e/P20MCwYklcL4W3S
 4QMnKCymVvANdg6Omtnc1CaU8OSqfMyTDmRuJY3g0G9BSZlavbg/h9PlCUCABr/UdzWu0F18D/j
 AZydQOnBNx4Ybhjq3bNy6QJ3wDlkfC7tQRbLHdokoHrV54lRVuIFiOKYh6b7p2jPsuA37dtcp+U
 K9iWce0EAcWE/PbV5MA==
X-Proofpoint-GUID: tpEl-n01ZAgzNXg7ItK9DZi9jqWJYluy
X-Proofpoint-ORIG-GUID: tpEl-n01ZAgzNXg7ItK9DZi9jqWJYluy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4NyBTYWx0ZWRfX5Ngg5Vqp1cHm
 FXcvsLwLirD3o7mMc3BwUH93mygYq9hslN7RrUN3YwDOt0z5sejNt4HBlLVaSHhfGls5EYyTV5q
 8Q/0badDM4lXQyi7AsqkZclBWm6Cmfc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230087

Driver does not use any Devicetree binding from qcom,ids.h header.

Suggested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/apss-ipq5424.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/apss-ipq5424.c b/drivers/clk/qcom/apss-ipq5424.c
index 1662c83058bc..efc9e08614b3 100644
--- a/drivers/clk/qcom/apss-ipq5424.c
+++ b/drivers/clk/qcom/apss-ipq5424.c
@@ -13,7 +13,6 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
-#include <dt-bindings/arm/qcom,ids.h>
 #include <dt-bindings/clock/qcom,apss-ipq.h>
 #include <dt-bindings/interconnect/qcom,ipq5424.h>
 
-- 
2.53.0

