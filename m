Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D371E49B1EF
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 11:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791373123; cv=none; b=If2lhh9wqgCJmY6Tp+VZAJYhJzvIQLRtouo+UGg6O3BSNkv9dfnYOkYev1NQpJSxa2zU3SG9n2l4cct5NyPmGba2pss5qy8uPu93IgPeTusw8ZkfP+kK+LZjI51EX0HZSgPVgyHz6P0dUn7uNjic3Y7VAwxiE2AtwpiJiOOunj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791373123; c=relaxed/simple;
	bh=DQ9EWfGPZKBvqgp9iN4lMDE2hFQ8EQVewPUivJN4wLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HN9nz8WU93sNse8YYbutUmzkXCiy6642anhJIu9bdlTtyHhdJ6WGVpR3vEB2kBxrwr5ROfRkG8joxhZdMNKs0YmD2g8Z8/lkfrjJ/Nn4NiU+LcAED6YRLVV8QZ79gyRc6YSG/lFuR7ZLCZSwhvDB0QGncXKqKSbHpEMdiSpHjpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R8y/tst5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q4L1gWSZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R8y/tst5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q4L1gWSZ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BV7hu609864
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 11:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cbMzmwWaBO70zBSqQ/eHNfR6dBbEZw3DRlvo6abDoF0=; b=R8y/tst5xDAb7+uN
	5evKUt2hHCiP/Ez2SOi4tvh9TOw8DmBEsJVy7sdJ8PSHkPY+Dd3DQMOhJ8h3FHE+
	gxhwM/FesRSOv8crZsJuyvPoe9QSj8O1j8YOVsFrc5dV9HQv+QzaFGKG8oxgHTmn
	/6TUDOG0cZiLB76XVslpNDeUy7uMv1KDkuUgXPmuIXTTOAS3WlPgRqwbeXe4/Zay
	YuqayptvA/zBdXhkLmp/8oRa8o0bES259p4f6l9rK1/hl0vqhui5anu5Xg6gwpDN
	dM+PktZ/tkztt00XkMeKQMyrNA0f4zcf94wINDoTvrFrloN9rIjPHp9OgsmKvuPQ
	xKDmCQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fc597ya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 11:38:13 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a8a16d84eeso553386a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 04:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791373092; x=1791977892; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cbMzmwWaBO70zBSqQ/eHNfR6dBbEZw3DRlvo6abDoF0=;
        b=Q4L1gWSZ+1Vj6u4q+7D42xHnNGh4BfjbGYuXqmm7gGkgBzJ0S0IKS4a+eN3gb+zLcD
         CC+h15yIKT5RP3gLOFd9F9cfSZQmtKrgRLEqte3zKnNBb7Zmq1jMfUccJndliAXxaNY/
         Mujwsoh5DzJzOhHzuSadHMPAknJIgXtUFA24/bchTDU1jhWzqhaH8Xyh1FWlSJjb73mt
         74PxY2Szrm78SgGBWqXULpVJemN5w7pqmt+jbGa3qxdc0KWqIjuwLfRWrvrvROtvWoqD
         KUQ0QAxg/7yfyVbbJTUil0/H3ywjTUrD9xZVfNaKLyqHqKxGmn3xVkuj/41ZRFtOsTBm
         T6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791373092; x=1791977892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cbMzmwWaBO70zBSqQ/eHNfR6dBbEZw3DRlvo6abDoF0=;
        b=JSXfMt3r9KRVljnpQnAbJvicJEWUMIMuDJkoyeBQpWHgN8ggtf4q/QRe2yZ3SkFgez
         xTbN6bPPlBt4hkNpiLoZYaYmfDiRLtfcokyGQs4Qo2R2cLfwTL4xM5ZKW8rEusZ4t1CS
         aftF2j87EAik4IiTR8j4FmarjzLBXcfPHd0byXwIlQxRCtSO+NsCLT0JeEzVroI3uqzU
         +2rWxaQM0cTUMKneLHlJ6IhHmdxm9IPKaea3iU/91FTOozMcpP2ZhN7TjEFTcezB5ShQ
         y1aahKp2mPJF980qH25OGLvkqgbADbMyDoeGW4p72L+rXEgEFIKv47TZUcg0UV//aso8
         kWcg==
X-Forwarded-Encrypted: i=1; AKwUvByXQ50/CnFn8oW30+m2bl7edQbmIOEAHnlC4E6HDgf2I29la47LEHbR4t60RLS4xYJysZpJQyWUfOaFLdRQ@vger.kernel.org
X-Gm-Message-State: AFq9FYLwIvbqM8+KUAeAOB9w7ljW4NvduhAllJOcuxdgQ7Wxb83vXM61
	E549/im63ZyRbCO/PcMV4gUbFJMJIfeo8kTxcps4nguoNInRBa1pulsZBqhb1aYGQEvXAlgp4yH
	qJYXJ8e7bBF//yMJIM2GexuCqRqPviYRnfp6+n9KNS7RHDsJMKCa2nVfiDsWm8FrywZWY
X-Gm-Gg: AYBFou3TogA2Z+xSsDq024ZiKsbDuD/jZ05iVeqVrub8Tih9y1uxJO/zaCUnjs4xfaV
	2dv63DmoNwIZXD4xCA2oMD9mN/513CtrMsc0YCbZO/fzhQ5SkWhsSK1uFTFITEiWPw2oaoTs+C5
	keTO7Twpd1mdvGFTiFZ6KwAco8DNnr59EEbS6j7BRQn427S4TBpUUjXaWtWY2kisJdwb+s3JYjs
	qwBjLTdCfA5FCsryvmpuq/2X6yHkowHdoxiPapH+dE6patxxpZdRPWnGL4f4hpNRRVpT+7xxW+A
	MIWQa1pWGGE+V9S3u0oTwOipDDT2Y1wUkXxAOP8ZmRVr8TUaCU4lgAnZ+CXPtrVhRXBHw0MH/r9
	044azwsMM4rBgp87ZCzlOlQZPU0ZFUIHJ
X-Received: by 2002:a17:90b:3810:b0:3a8:92a3:8baa with SMTP id 98e67ed59e1d1-3a8a1ac0576mr1503981a91.27.1791373092305;
        Wed, 07 Oct 2026 04:38:12 -0700 (PDT)
X-Received: by 2002:a17:90b:3810:b0:3a8:92a3:8baa with SMTP id 98e67ed59e1d1-3a8a1ac0576mr1503945a91.27.1791373091681;
        Wed, 07 Oct 2026 04:38:11 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a5e0eeb6sm1454001a91.2.2026.10.07.04.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:38:11 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 17:07:48 +0530
Subject: [PATCH v2 1/4] dt-bindings: misc: qcom,fastrpc: add iommu-ranges
 support for context bank
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-extended-mapping-v2-1-5dca3aa2c2d3@oss.qualcomm.com>
References: <20261007-extended-mapping-v2-0-5dca3aa2c2d3@oss.qualcomm.com>
In-Reply-To: <20261007-extended-mapping-v2-0-5dca3aa2c2d3@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791373080; l=1504;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=DQ9EWfGPZKBvqgp9iN4lMDE2hFQ8EQVewPUivJN4wLE=;
 b=GV1ceQclqogtYmo10/6T4mCwskpqqXIPQeE7GCWzFuSg+BY3H8rik8OVHxlOofeI7rsa4U/aG
 ZaNYfBp253+CdVa99pZaoaV18JjUpdyY9D4enQFCBlmwss+njwFv6UG
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0NiBTYWx0ZWRfX9QbYCR8tLF5C
 wf+G+4g4WXxgnI1EnSRDcaP17Fy5Cd1uqNEdqN+tCUFi8hjlI9wcoZmVPA1SIl6vlhBYu1Cdh32
 3MF1h892fkmY0Pmek02+EfXxqDgh/nc=
X-Proofpoint-GUID: 7Go2WEgXlWnsw52JMMiQT57bWyHfdO3g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0NiBTYWx0ZWRfX+RIbOq7XyrxR
 9e2QJjVWJeAfbU2VaqEnI+g93+xi7IxmOYYOE+7D3JrG0PtmucwwWuzMYKWF8EbZ2d7L97Dly7P
 S93hjhboJREysjCRv/ObjwidQ+BsTFLekjcV93k06FT6DYMnJ/TLnVFXHAnQow9ec4Fh+HnJA1f
 vyUpctc1u14LIzJcLrnZGOxG+C4xzB6idhf//ROKpVJzti6GpD0GgrH8xExY3L1SefhMYXnxnFi
 Pn1aUunhzCNuC3BehKUO+tUhB2wmlskvY+TfcNtCcHnyL5J+CfF3LoA2/f9E3xyInKX60QiTx5K
 NnB36xmtK3B2kaDLHLhKZed5XwUJrab7+IONnohYunh2uEYKr6Uh0Swmy6SEZFvd8zn072b92oD
 7gkig9f4Uv4BEDByfNW9OATEfIZoMbeXu87pW810O914fw+PWxC4swzIfMMsqC3DXpyEsLWI+aY
 pK0NWFwBKeHsIXSCx4g==
X-Proofpoint-ORIG-GUID: 7Go2WEgXlWnsw52JMMiQT57bWyHfdO3g
X-Authority-Analysis: v=2.4 cv=a6+lZkSF c=1 sm=1 tr=0 ts=6ac62f25 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=OJl0ziJC5c_Yx6648RIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070046

The driver uses the presence of iommu-ranges on a context bank node to
identify it as dedicated for extended IOVA mapping. iommu-ranges lists
the IOVA ranges the IOMMU allocator may use for that device; any range
not listed is left unused.

Add iommu-ranges to the compute-cb subnode properties so the DT
validator accepts it on context bank nodes.

Relax #address-cells to enum: [1, 2] and #size-cells to enum: [0, 2] to
allow platforms that require 64-bit values in iommu-ranges to pass
binding validation.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index e945c8ba75e3..f4ca9a767255 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -73,10 +73,10 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32-array
 
   "#address-cells":
-    const: 1
+    enum: [1, 2]
 
   "#size-cells":
-    const: 0
+    enum: [0, 2]
 
 patternProperties:
   "(compute-)?cb@[0-9]*$":
@@ -98,6 +98,8 @@ patternProperties:
         minItems: 1
         maxItems: 10
 
+      iommu-ranges: true
+
       qcom,nsessions:
         $ref: /schemas/types.yaml#/definitions/uint32
         default: 1

-- 
2.34.1

