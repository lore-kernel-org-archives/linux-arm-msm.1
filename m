Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F5441D629
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888209; cv=none; b=AYqn1hXhIXrb8E3VQVNHF34Ej/zlz7UpkO5e4t/bzriVqTtmxL6FyHtKsF62Z6OByyc/a1STRqGW3lmds1ph2wxMeYGRn9zAK8s6SgQFDgTsoXB/nuk5NBzZn8ZLtYEhdI9U11xvLkaBOazzM9pidHPMOPZYLw6zT2wKMhERsYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888209; c=relaxed/simple;
	bh=sxOC8xu4+m1gOg7xJPQ7uKnbuitLxFxJAsNfgIHFSKs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jixxWaH4fCm1qQYqaezkUlmtl4OqFbljdE55FzAP/49d0mftYd3D7mDqmVBN3koV77ONI4DBEf6XBz7vLLtM7QmacjJqbZZ7HecQRLtGr9t30u0wr76wH7hiVazvx+uv1C35NXE/1WAVuN5MFtyx4SXqKCtPogkOxM4GtuuoSik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bn2ANeXh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aUSU+3J7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bn2ANeXh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aUSU+3J7"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADZ1m2875741
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WolrlPqd9kvmQiEssFeO4Ma7OHOVLQ26gMY9vH5kuMA=; b=bn2ANeXhwQ3Gk1Cm
	+UEVMCHKjNgzfkgzMxOijFnIgV0uAWKyc+6AYEkhde0q0eycLoApgFTxa13vcKl8
	vXTOmfu//oW9aJMEcyGIBLLjECW+CLOziTNeMgSzZwhQ3ZS7oMmorfaQMaw0qQeM
	atlPVcurO+qgGjc8B3r/22NuGvTNLEfBx8jaTE6qi1P8tXUDXPIksd7tBgyq9QFo
	dQDrACKD/ov1/YyDP9646uqZAwbF+rq0rA4n/70CZxRz2NQSE8FBpSeyGO1SHrMV
	RRaYYaRgu0Nw4Cs+JLeXVJvkjRMFiKxoaL5XkWjo+lEg/oGZGspPyneBoTi+FJzO
	BDYppQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5byr6r2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:16:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e2237bc43so477516a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 03:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784888205; x=1785493005; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WolrlPqd9kvmQiEssFeO4Ma7OHOVLQ26gMY9vH5kuMA=;
        b=aUSU+3J7JOwzGRYCaVCJe9AkD3AO1ghQc1ZJcdSXOuMzVxpKBN+TFpg3yYsMh1SUNm
         J1aIT5CQMhlSY7M3YW2aDD8S/gi7HySW+gDyAhv1MxsY1iG4PxAogguKwvzqBG8iB32a
         bMJJrdfjYREDX9FDO1VmuJ+7olsbfmSkEq+hqGZz1m9yYeDpQOKaM7EBA65cBQgELnFM
         gQKa9BHvup8LPOSJ9g5uaXmcq3BVipYR4w3iMjVNtCPVjaaQu4oE09cvNGpcaP4RY9Yz
         qSr/8QGxNtFWVFlEkfjxR3Vupth5o0w1J4svMLHCXbj0ZiXlAlXQxKWLf1tSbX93Jz3s
         1WYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784888205; x=1785493005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WolrlPqd9kvmQiEssFeO4Ma7OHOVLQ26gMY9vH5kuMA=;
        b=mygQT78X8TcSmu2+krdqIx/gtTVmlykVCRPSXw25GIyyDfD54ckEb3jH6cZyluNhhm
         LC28M/SDrmbo/TpHmyvGHM3Doga7QEMltLkMtaVqONc1LeBA18JI2PgGh91knN5v8itu
         OUhxL5VUYzXv5fjIDpkeOL89naAM8IYWiIfKl0WOk1imKnGNOI0gqqh5Nvq9JiwnKTw/
         GJWY4doHwtvujCxJ0jTi9X0xg99eWxd8PNlQYancVcRPL3ur4nCsVQsvOnp2WFJIsAHp
         NeWE147B2C/FJY0++t7cBRHU9GCtyNSDd0dL0VWC9P+iGzj1jBJr0SARp8+tdOQi3q+7
         WXgg==
X-Gm-Message-State: AOJu0YxDe49nTIh9TF+0ke7Uw42oFsd9YiEMQfKOkfHlQobNNqLoq3lZ
	1t1mp6SpzJ7KYpUmXGSGK88q5KzvYPhhc9yRkhVH3+iVpaW555q231F1DF0VYqUoMgIHlCDaiox
	6S5QOU/c3T2Izq1TsUaF+xUI2fw9wXveRNgP8+unmlC83DVg2o7OXdrFRssHxuNmybpUv
X-Gm-Gg: AR+sD12Lom5an8X2JzPLNIdS3tzQJgCDgWBWzSfplZY2MnCztldm749jOZx7rg8ivTi
	R6sliZ4n4Pw3liX75XZzN7K/x100cbicFL6+42XxaQxKaA/FJVKExsUbuuvMWZJKJBJCkGNleMn
	u8MyFkfZbTdI/7hkHNc4DUOU3GE/C67vY1psylA0aG84hVLLfcCURAQktJclgCksH0r0cKkB/eW
	aYTzdRRRK+WSiw2egOF1KWQmDgwUSxqIaULTh5wUPIoGeeu1CvyLCyxDBFG4aDcQMXtUoa+6kGu
	Lj/1PWJ/bcyP7aFH5TUFug2EiIskeF97OJv4ib0YP1+tGNGxsTaqrSTNkZZbf7qHhq6xNa8rb5L
	alP80q8pao0wLLRimuTu0tb5LvDkERh08/2K9spC3piyCPUWEh2oIFxrPYSTMHfo=
X-Received: by 2002:a17:90b:50:b0:37e:a09:2640 with SMTP id 98e67ed59e1d1-38ec64958fcmr7225506a91.7.1784888205001;
        Fri, 24 Jul 2026 03:16:45 -0700 (PDT)
X-Received: by 2002:a17:90b:50:b0:37e:a09:2640 with SMTP id 98e67ed59e1d1-38ec64958fcmr7225457a91.7.1784888204563;
        Fri, 24 Jul 2026 03:16:44 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f041b8be9sm1222644a91.14.2026.07.24.03.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:16:44 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 18:16:11 +0800
Subject: [PATCH v6 1/2] dt-bindings: arm: qcom,coresight-ctcu: Add Shikra
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-add-coresight-nodes-for-shikra-v6-1-8b0d7300be41@oss.qualcomm.com>
References: <20260724-add-coresight-nodes-for-shikra-v6-0-8b0d7300be41@oss.qualcomm.com>
In-Reply-To: <20260724-add-coresight-nodes-for-shikra-v6-0-8b0d7300be41@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784888190; l=1029;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=sxOC8xu4+m1gOg7xJPQ7uKnbuitLxFxJAsNfgIHFSKs=;
 b=BYz9ywskpOAB/O9fwTJzkLchmrShVsip0YeJ6w5YWNgAwJkz+4UoY9wyiQMutKruxYFKxp8er
 kyCYMg/Y5uFCKyrpe1WVLEuM/ZrnsNR8da+yvCDg2dZXcD/H5P8Mh5D
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: M93H_IyAR2hBSrh_JHgQ1G-Liesit97S
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MyBTYWx0ZWRfXxdRR7rnE2w9G
 B2vpFRPs2yvSEGfse1fZ9qxjzjeWRtbOQTYM0Dr8yO3x49gjdl97EpcPKtLCGbctpphxRKw8OdH
 LXHvU3gC7p8Spl8TLTE4TJjmNAnuxTc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MyBTYWx0ZWRfXxnKtNWT3vlrS
 VoIYKeezlc6wgDj6+M+dqWXThX1rkaLq+JuC9KeSWt71vNEorZgkIOB0VQpWbYPzzDDyeN4mDQW
 6Flj9cs79WlrvsCenFA/UWmG2pNUw+B3BLQ7Vltp7kiWrY/wBALi9d08kkw/NGPIMSH6hTEq1x7
 X/ls5vtDLpw4HmCNumsbc9YwvOlY5sArWBBvlHPggcmbeXOpa1om5T2mtJpJeXWRPlR9Ywqa9mT
 tMchvVllfjgxEys69/BTsUU5ccueSMFxWNYIrienGgUWLIiXYlCKq8pVBMgUv4EzWouRjMtEx6l
 eWDCMQ0LvmbgHyA1DSfYXCg/kBDb3gVJ+I3c5naiTfLPJAF1wfm1LEetTTTQJAP153W6pYN4zf8
 JNyOoLtCbiHGJajK6Qou7fnEGEhtyXEA/Sjvs9NJXUOmNFB8X3YsO1uMoBQUTR0/QKrXbC6UmAX
 rSPw/zJLRR1oo3NUcAQ==
X-Proofpoint-GUID: M93H_IyAR2hBSrh_JHgQ1G-Liesit97S
X-Authority-Analysis: v=2.4 cv=GMA41ONK c=1 sm=1 tr=0 ts=6a633b8e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ILLKxz7CyoOsuA973zsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240093

The CTCU device for the Shikra shares the same configurations as
SA8775p. Add a fallback to enable the CTCU for the Shikra to utilize
the compatible of the SA8775p.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index f3f3feac4ce2..335a8e1a5a9e 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -32,6 +32,7 @@ properties:
               - qcom,glymur-ctcu
               - qcom,kaanapali-ctcu
               - qcom,qcs8300-ctcu
+              - qcom,shikra-ctcu
               - qcom,sm8750-ctcu
               - qcom,x1e80100-ctcu
           - const: qcom,sa8775p-ctcu

-- 
2.34.1

