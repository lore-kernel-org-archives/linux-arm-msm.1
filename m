Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C013A3FDBF7
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784619345; cv=none; b=DBPxmrgd7ngOSWsPVjQ79fP5ae9qbsZEqaOkBdiMR+kFzwCM1LbwoQs7bOf+PWUxU1nB8QfHw465AgOeO9dcJ4nSzGDuxQHk7TXK4498ND2m49eyrhZrYRxpXFycu0FW0D8S2/yddwTYQ7CsFZ7HNKVM+RfoECf/zuGjYwEantc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784619345; c=relaxed/simple;
	bh=WozQChOwpT5XbSckiOczusoNxMbfOtWC/N7oYFDqB9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m17a5QEsyVS3PvEvQm7f9Go7soF0vz3i396NlGGjx6Z6sLPiOe4oYaxXVJirmYorVLo/vD48Qadg96fSdxGS0FcjcRF5gBT739vhBaqWFRl0YGm0wcAsCEpNbA5oodmzVjSqN9zhTb1qw1A9j3uRuEHGPRWz9k1YUYWZuRz2uQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PQ4KXhoO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kc+zfNmY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PQ4KXhoO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kc+zfNmY"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6MHWI045372
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:35:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3VOD5T7OaKyQmxUkKOE7sENrGCh7MXhM26C+rHheFBY=; b=PQ4KXhoOcEHg0eai
	ePHgQ/jaKepkvWObyLXfVNu6Q1dLS8a+t5bHwFhhSWmnkJGpQ+FLqz7/GrhTBfMR
	x9zNRTcUf1RQJGW5oBL9WWopWJuYBqJ0jFUFDdvBsMZY+h2g/ysNsjT9f+QpRr4z
	ipvpH++wtfv+4etSwWh1RkJYxqhu0VMJwRo3D7TBANRVrcAYDo9lM5SPFyvKvPd7
	rLVnBa4LBVuPF93maQRm6u3CEp07sl4kLj63sdTGu+zaTumP3kE9QzxdFFxHfKTY
	ICaipnA1UEXP2EaBwi6/Bgv+f8BeALhVnXnEQW9OF98au/fYwU29+hQfn6CfDtbd
	lJjA1g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv5ty6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:35:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cf27789c79so61491905ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 00:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784619342; x=1785224142; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3VOD5T7OaKyQmxUkKOE7sENrGCh7MXhM26C+rHheFBY=;
        b=Kc+zfNmYLLmIfKKRAvPfo/9oERqu2r/aQGCsrfNISDqu0KQbxzHy+/xWBRUBiTupV7
         MhwNDc9k/7GOstWERaHER7jYj16SiEmdht9FAk6ALFoL5CD42XQX387uTB7VeBxp2b+k
         iqhyO3kDlAfy6fQnWQ7r8KUVDBrgMptbi06StGgo2IZMl0MQ86zZ0tGDRcCG+qHaRmEB
         BWzThkC22Wra5KTeMowXaAa87HtmOvmQWbep9xSr4lkkZFGn6iXMU7H7JAhwCpv6pyrY
         jCPrTJOAf5C+BgqwBTywETRBldjWqywuOF3Maw0NFHNG6W9Q6Bs3Ovcy6FXRmdwK0P0K
         FTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784619342; x=1785224142;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3VOD5T7OaKyQmxUkKOE7sENrGCh7MXhM26C+rHheFBY=;
        b=E2fzBzCGTRsBggVvp4TVic/YFE0TPye4y2u6ouPNPETAMjv+kgvrD90Oh60aIRxR2Z
         +E3FlzZ2HFa426eDnpocydG1B+Zt+0DS5YaPCkv7fMrJmd/uZrHyyq86NFCXRhu45pKu
         lm5GAuDlD0ZQxcQZfgymx2TQp5JGQOuLy4XDx1pfYmoJ/+2OCNnbtDJq9NjhR6Ge26zH
         rkjXN2ZzFtFwmJkqj8glEruIag4Vor+UtyQIT5JcXo+fKObNfo0AR/myynBjU8J1O4dm
         /GuKdHvro8V4iCEVY0H8wXDA5VCTDrWJc3B5fx7VSQ1OIWmln9u27Ip25VutRbBhhXX4
         /L+A==
X-Gm-Message-State: AOJu0Yygt/SmMIJNr8X6QfH5yb1S5jO+uoZ2zEAFOuIlbhRWi2eMegUc
	hDZESYfbQpncUSK5y2Oyk/l9KZvjQ4NeGovpQmW9ejVSbj9PrlQ2tX1Blv6Asl68iQB7Zn06HLj
	C8e+ZEu5Xs6LHbkhe78hp3YwB5cyKy0qgG7a+iWFpEzR+3+wedJFv10c+R0i+DaCqqZPOiMVx0B
	6S
X-Gm-Gg: AfdE7cmfyxRLwIhv9QQV2+qFImr+aPBx2DTLOlqbESzzA9B5GX/BEgLAS7AiYbrsR+U
	fbxh3wIipPuh0xtyvLlal/2HkCQnlrYoU/kSJgjM/jRK64fqOnNOhFVukBv6bC99cVFLQVpWMRK
	ftRZG7+ckMKU51dYQZCtzTeS+/nrd/6KpSvsKFDqqj5pwEcILgr2nRJGzRZQWG7+GStzeywFoIH
	omFRzg9KLGkEMI7XsedhJjN5xfum0SFmiqinefJ2jDNcTsr8kB2IPx0iIVGROBHLOg61xgBA8Ag
	ZDuGnnpW2hpyFKUfTzhO4xPUSKbIwxDOPbetP09pnh0EKqWqgFwmFslA7iwPuFIUgBIRfuiSoK0
	DoqKGJgOVrYBj+P9hxxxuYD5/CGduPJ8UmjjQ8ERCClDBKoN4vnCbRQ3oAt7Vvhmed+ybTH89z9
	AORA4cisWC2AUovVHl4IMeg67gYLq/Lw==
X-Received: by 2002:a05:6a20:e292:b0:3c3:6cfb:4ed7 with SMTP id adf61e73a8af0-3c3ad7ec516mr18246095637.30.1784619342345;
        Tue, 21 Jul 2026 00:35:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:e292:b0:3c3:6cfb:4ed7 with SMTP id adf61e73a8af0-3c3ad7ec516mr18246062637.30.1784619341921;
        Tue, 21 Jul 2026 00:35:41 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a210571sm45224271eec.31.2026.07.21.00.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:35:41 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 13:05:26 +0530
Subject: [PATCH v5 1/2] dt-bindings: phy: qcom,ipq8074-qmp-pcie: Document
 the ipq5210 QMP PCIe PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-pcie-phy-v5-1-8d403ef7e780@oss.qualcomm.com>
References: <20260721-pcie-phy-v5-0-8d403ef7e780@oss.qualcomm.com>
In-Reply-To: <20260721-pcie-phy-v5-0-8d403ef7e780@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA3OCBTYWx0ZWRfX/0zVdBmr3guI
 oTNdugwJ/YF9ICAvAaI/w3cqKA+bhS5p+0A1LsTvOOPU8GS/mWuRhxd7ZmvKCrLvz6aGGt9ZJBt
 KLu6ICdI+wPcPQUSsPy2yITz/vnelGnBOCT3XeVIZRzEb3sZJ+/vh+kyAJU+xrQ21/eGcfWinSJ
 Yhf5+9FptLL+xzWQV5SCItDEwL9hR1lcApQ9DgVuEp6qYlleMvdSf3SvssqoOBpA80DITLPCo7W
 DvsPyO2h6kbk+FpyER+8nfO86QC0Mu+baBP5y6j7mNkVaiiLLT08SgrjMXJIsEwM8hjJM+U7K9f
 ZG0wrZnr+eqSXtU/qXmTt32e8v8qsmgDA2ozCkI5Gu0B2lLIRTpgp/1PzAYrwPw4PDdC27e6p04
 V3txpcnzjDtwR3ekKsVIdePPTZLH6qLQWOUrHUYCepbRirNWWvRwLMjLzL2y3JH3F2r7SkWJ6Xm
 BUjdJjlOovld9kxAvYw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA3OCBTYWx0ZWRfX9Xkig3xI1hpb
 S7FXqxPdUfPp3AzRLlhRYQ4cI3y1XgdfRKYtpXM0kT0BnA9SErBYiFg+ra+wWaN0/fpkAKwGW7g
 v7bV2pVh0EyhxCuf+Gs+3+q4vxATGdI=
X-Authority-Analysis: v=2.4 cv=WNpPmHsR c=1 sm=1 tr=0 ts=6a5f214f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=EF49ANZLUTmcXe5zpi4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 5fsKZZSUZbpHNC1_9BKpQYNzlajIwWz-
X-Proofpoint-ORIG-GUID: 5fsKZZSUZbpHNC1_9BKpQYNzlajIwWz-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210078

The ipq5210 has one dual lane and one single lane PCIe phy.

The dual lane phy is similar to the dual lane phy present in ipq9574. Hence
qcom,ipq5210-qmp-gen3x2-pcie-phy is documented with ipq9574's dual lane phy
as fallback compatible.

The single lane phy (qcom,ipq5210-qmp-gen3x1-pcie-phy) is documented as
specific compatible as it uses a combination of its own initialization
tables and some of the existing tables.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
index f60804687412..fc155ad5fa6d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,ipq5210-qmp-gen3x1-pcie-phy
           - qcom,ipq6018-qmp-pcie-phy
           - qcom,ipq8074-qmp-gen3-pcie-phy
           - qcom,ipq8074-qmp-pcie-phy
@@ -28,6 +29,7 @@ properties:
           - const: qcom,ipq9574-qmp-gen3x1-pcie-phy
       - items:
           - enum:
+              - qcom,ipq5210-qmp-gen3x2-pcie-phy
               - qcom,ipq5424-qmp-gen3x2-pcie-phy
           - const: qcom,ipq9574-qmp-gen3x2-pcie-phy
 

-- 
2.34.1

