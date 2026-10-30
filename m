Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364219;
	b=eWOKsTbQGw+PAIML+GDO0Ft4UqjdniSAam00Dcf9Y5J+KjRlxNdb9FM5A//VCUgckHwG
	 KujKydWLdLIiOCfeCvth9b3hs3umP8A44Tgytj05uQHoFPADTjMQ9jpS9GFWhq1+3zmLC
	 TdmoNZvvdzvOzr0QfDJzuJfqlbvg1t/7KOV5K0QHUHvkWx0aakim8IT3aJfe/t34h7e/T
	 r6KV9MMDR5pm4jwYOIHG+m45wSaosI0ha20mw5vrcBurqkbS0J6l6hzA8pozm517dYvyK
	 m+SR8+t+4oed4bIuyhTy2hyVwZUmiHV7pDcQLFJJFn/luLmeCcwWuqwG7z0/TCsJtPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364219;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JQZcWnzFgAmmFYA/sHLwHEakiYPJA+ODTFEZ0NO5CyE=;
	b=zYCjm6Dr6DYJCuPfazDZkjTxOiejBBt1Ax9lNj8lQ8rHyJh0ZFAGQcu3U/uX2ZCt6Jtr
	 AEciQXyIr1q9aAfud8AIC1Bpi+gggN0nl0xR1FcVYhScQkgT3ry76WxfHAFTRn3QSanG5
	 95I50ItaAb3FPsRKG+PCwG/zaA92gJlUC2dXrHOtQHNzdWRHz3UWF04W/q6Y9HYeBYGv1
	 qqis4mEJW9d0i/AI6saZpgqLSLrAStxEvur5q24vhkrFdvyw+rcJEuX2RPLsaAJ0CW6rt
	 lsowo40c7v4CVFY+BMCE3YpT28clPX9veWKFk6SEJdA9rSFvMw2sB/ko0Hy0nbNwSCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aA9iACs4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MT6f40vE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AEE606A32A
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1AEE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aA9iACs4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MT6f40vE
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBGBFM3089598
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:43:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JQZcWnzFgAmmFYA/sHLwHEakiYPJA+ODTFEZ0NO5CyE=; b=aA9iACs4OIHPhKAx
	z3tAtDDkGHfnj0GwoaR/slfHPfGvqOuHHRebmCPc0vKZEmRLfCL/kkd2mYx7yypf
	mesFwnqXeolYDZbXWyw/2WJjzZkxDcivijWVA++Mw8Kc5Okcsd27AgNxMT3BV2gY
	foM4Gw5Y4Pm/oOzO+AaEpUt6VN3nUyG/s2+1PpwxmsmWbTRPH9ouxdMYB8gQ+P4C
	y43RHRj3CDalDugNjW3SGsw3hANONVoRAf4evoN5NA+pddkVW5N+yacfjWiLVdKZ
	RjC5uy6qBeyo7JPIvNfKdebTPOl7dQz/pGAaA1PSeMWoQq04xPyi3HRiVUXdGvIf
	yX3C9A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qk2v3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:43:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2eb362d1f5eso7764275ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 05:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793364217; x=1793969017; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JQZcWnzFgAmmFYA/sHLwHEakiYPJA+ODTFEZ0NO5CyE=;
        b=MT6f40vE9No5RHTEIrzbyLe18caae6v1PI5eYbcp0c13AIhzo2HAn0prZ7dIn7nUYi
         KugvKwv8OLcGnsRTTcbZitX5K0+rnG98YONIsOGEOPg3pUAzNhjPNlMN7XYncgoQhvEF
         6bA3WC7l8TLPLYWWP6/LQpiG4o4TNIBagzq1u1tQQ38nBLt4UPsu4kHYRbNsmvCQc7LB
         gU/1kC8KWMguEAXnmnFUBc56m+OsqIml4+G85NkCsxtqwpa7zT4U+qXVbwKVkzJXZSb8
         Op7O4vfwCunprQ6aIOXIcFZ9RMseMQta/8QnilIf8ZQ+iBLmb+qCxGhQqEGhqwxCrSmb
         q5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364217; x=1793969017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JQZcWnzFgAmmFYA/sHLwHEakiYPJA+ODTFEZ0NO5CyE=;
        b=dPne0R2lgghZQaDLY/MwKX6XU52awai8/xuPQJ5neProKLR0qGdtHVfyyJ15sFUWct
         uVnXK0c8XypxQgeCVn0NKvlGwjKoAhrzEEbb3u5DrMsjswoujM5b4R1YwhCSRUpE7wEE
         v7cGjhKqZnCr2NfvzSGg5+3It7otJ9ZfIvS2NFChdVPjZi9SbNKifpigW2sfppzlVVto
         w1/QU/ttAqC1IL6qchsRineS0AxIjhLO4rY6SPWyl35fWHDlkxSr0ZsBGp+lzSXyVvpK
         6419/2OdWRrKvqSUwwouzUIboxNxetfhI2QUrbKUY1hhxeqy2p8D77qLbaYInkiVz5I0
         lVFw==
X-Forwarded-Encrypted: i=1; AKwUvBxepUbIcw8hwigfTBUCEXpqYJixfemmF1qmTLZmYt493pylOsoCA/MMcYc7u0E8+PjKwsBA7aJJy66Ygr5i@vger.kernel.org
X-Gm-Message-State: AFq9FYK5HcFPJxyW3cNTbe3SDVX++993hUYZ6ewwnL1B+m59csl8A6kl
	yeJQFlHj4rUUQYJjJetgguu6oOjXlhZPsVMoGt5Q2Ea27YZ59iI0pNgl8ZqHvEkqXDl07fKAAcW
	VYt9JLX4hJPg3uySZ8uD1R8CWo5ityX3B0rB/efIqNH8aPeAuIqypSHQbS6po03Ld9ff5
X-Gm-Gg: AYBFou0pdc76OcN5YWtw3/ajTCFtTjmOiFmHfE/xDo40QIGOuYosHGJSllmfL2FSt26
	bjLBr2fPvSHPsyfbq4V/kX7GxWRxsMZgJa0vwSItSqmkywoaJx86XGJIgfc4aNM/2xQxK7GaETy
	3m9LiFFdkqZ0JBwTZlqvF4mbyaIq1VmPCk7LA5qfC0MQh895qrnxSX4eGrvQhbyRRELdBF27HqK
	tfk+AVCq4cOG2N8O3s6wSUShIUn/viuW8TqZbnhqCsfxhP1hbDYpAeT1A+fPJfiuq9NEKOTKxWO
	SlFWXyVsQe/n5n8VOt+LRSAd2tjTXJVnHOYC35dgxCRYo2oCTpQIxOCajXUWATS0f/Fiq6ci2Vr
	vpsurXBiKm9a3ntw0927ufoAhvwdEGffhULQTYojw8x0kbAa0WNMp2FVIPrZCFrZtDqj5evNCAF
	GmCX4=
X-Received: by 2002:a17:902:e5c1:b0:2e8:1929:c8e4 with SMTP id d9443c01a7336-2eb36527d99mr22525445ad.60.1793364216719;
        Fri, 30 Oct 2026 05:43:36 -0700 (PDT)
X-Received: by 2002:a17:902:e5c1:b0:2e8:1929:c8e4 with SMTP id d9443c01a7336-2eb36527d99mr22525265ad.60.1793364216294;
        Fri, 30 Oct 2026 05:43:36 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3922f5dasm6450075ad.25.2026.10.30.05.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:43:35 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 18:13:02 +0530
Subject: [PATCH v3 2/5] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Hawi
 and Maili compatibles
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
Message-Id: <20261030-hawi-maili-camss-v3-2-9742bca8cef2@oss.qualcomm.com>
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
In-Reply-To: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793364192; l=1461;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=O6JOHgjWCf6k0+eXloLMxj3S4Nm7SEUIMrYIjwRLIus=;
 b=3q6SA79to3LhfP25KLgv4CM/jRHI+Eaug863piJVxiwfuCDVLNdBFSp3qPp+LcZTmyL2pUt1c
 Wpi0ylH0f72AaZBoTsPa+f9i/u7hEkQPP2ONknjq1ttyu4rISfN1TDl
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: 003LIVRin1oREBHxhAvEJaqZNHveZqWh
X-Authority-Analysis: v=2.4 cv=KLzPn1Fo c=1 sm=1 tr=0 ts=6ae490fa cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Qbo-v1IXpRF52dvEqNcA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MCBTYWx0ZWRfX9js/kI6FtRMm
 AWehvGq9ppbhvCWaGrlYILB/3oG/eXJS/fvTKOa30bX+zbIkLqlH6vTDeMfswkmEDBSRZt7u1SA
 Qq2mHnmDjavl2Ed+4s8Se/1RtIpsc820aLYnDMSzKlQglkrgxS7yvuujHP/z9xLH1kANUDz+8vL
 ErjH8iJGULD851GUxoMIE5j50FbMBab25Dqcv35/oQfoCeJjpXFsGNBl3JZFYXRjpewFDB5wAbf
 tJfl848dzKC6FyQAwoynwGMhLT3NBCyVUovrf7YVDvuPs+uGP/LQiN/0AfAepPoQvtnKdGdRD6o
 C9Eh8GkUwBAgsknrULBjHkaWYCdKJUW74pDj8nal5LBgpH8vA/zUPZtT3DBvYLlQ+XC82vqNcR3
 qclx64VgPhHASD/0yKuuKjNXuXmmyASU29ywIDhvzNyLBKLJboKNzusFvcbN1J/8E0fEIqxkprA
 IA47uu/FjnPgJ07RuXg==
X-Proofpoint-ORIG-GUID: 003LIVRin1oREBHxhAvEJaqZNHveZqWh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MCBTYWx0ZWRfX9erqDqdv3P5I
 QhWg4ezAViIRUcVDA2j/6buRBAl8qM/zsTR3w2prQy5nULtrhS3hcJ8t0IrdSy3Q92kBXQTbK6y
 2B0AKhjqtwQ1o99JXb705VQZusaBtsM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300050

Hawi and Maili integrate the same CSIPHY IP as Kaanapali with an
identical register interface. Add qcom,hawi-csi2-phy and
qcom,maili-csi2-phy falling back to qcom,hawi-csi2-phy.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Co-developed-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 6e9eb8e265df93b631101ae13f31f6365b6239b6..627aebc7cd9b7ca313457d3f70f72796e9671e8a 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -18,11 +18,16 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,hawi-csi2-phy
           - qcom,kaanapali-csi2-phy
           - qcom,x1e80100-csi2-phy
       - items:
           - const: qcom,glymur-csi2-phy
           - const: qcom,x1e80100-csi2-phy
+      - items:
+          - enum:
+              - qcom,maili-csi2-phy
+          - const: qcom,hawi-csi2-phy
 
   reg:
     maxItems: 1

-- 
2.34.1

