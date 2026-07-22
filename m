Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36425356754
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 14:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784730247; cv=none; b=fn9/RejBTuQhHj5jZgnVB6C+ORlunJYJphBhE1wPMvBMHTby9BJw7acz/T2tAJFc/0nU2I9JPhuNpggdvWEYJOqqcRogUq5ZtbVx4WN3SYBEl39iNUDGlxTF98KdMWFfk7surA5XlNDRt4OaNY4NixPtjXLsj0VXKA6gq0pQnF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784730247; c=relaxed/simple;
	bh=V52VMVTsICErjx52K6RCwTL/eZQ1Jb8+WCkmTN+Uii4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=La7Y5XtJB2B3sdPNIwmGbd2cOrfyHvvAynWgr8b0uojzKp+01JJrmQ0BiprY4nuEQ9orUZS72hHugsZOZnlcmrYq977uRn9daYxzozecYeg8m8bbYY08Z9U3dc31eub4V0EWJZ30zvqhzwihIUJsIu8FijVYQyi/ilfbGsvwVwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WfwEt/Ra; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iJMT2JDW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WfwEt/Ra";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iJMT2JDW"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWPvg2029990
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 14:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OQtiqSkO98b
	Kv5iFuaagymYn+xWLmyIxdl1cd4mGciQ=; b=WfwEt/Ra/IOMS7bq/5VtyEB+FIh
	iabCIlbO2OzY5mhZ4bvswjCqpD3xmQaLXSsgJp3SL8IcqwWTXEy2T1g0dFgGF3Nv
	mmHHBiCK0rAzWS9ZfuKqzmu2wuJnvUDJ/dxA2XAnR0ind51qXWisDx3SBue7Ogi8
	+2l4iQzgVPP+po6mAZX+IMuxGNXbjvbk7DtN+n1Q4OHeaBhPgj8HKeEXxRyqPP72
	43tJEtr+zCbK16+42qc0/DD74y03LNEIUFFXksjDrD+H+svxh73yNSDvmI/HXM1A
	9w+E0WAuUBNWv2ztAZw9g+vSmLygaPF7kvsr20t/ZarXwKRumN7rN7yatjw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjr83a100-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 14:24:05 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9c26587e67so6744387a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 07:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784730245; x=1785335045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OQtiqSkO98bKv5iFuaagymYn+xWLmyIxdl1cd4mGciQ=;
        b=iJMT2JDWUmSwx4tZjuxPgMZGzF5ImJyFQ0BUxieGv9CHxbpqr/XQv/IZuvWWUTbAoR
         1j683byso84IkfUMYRnWBOPw8+NciXTD1aIULc1WMp+K5U4Tatq05MmPr82gySN5VFpU
         SoNBsnZPc6oP06bXmAl35TyG2qmE3wuufTO3Yfd2jGGRtOxToKCo/75LyuKNzK4ZD0nf
         Yjqp5yFC1QdbIr3ERJn9ES0RkgfjvdNh9JbDrAu3OftQt2i5cE94AWS7WUrWrmGjrbFM
         PTdiOAKe5X7+GvUbB6uJ7POzjB5ceGgvFK5TPka3JMLUDRNC6sAR9Inux8OImrJ1iSQr
         x8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784730245; x=1785335045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OQtiqSkO98bKv5iFuaagymYn+xWLmyIxdl1cd4mGciQ=;
        b=DTZqNCl/1vh+WvMFFFjnOZGe5OTJxVRA8dJ3vvbU0Cs+hLQiq/qZ2TIudzNqAiySMc
         7EzCZ1KgzciBugD+1sCirtTAkINDGZRlYPr7YOe9RRcK13L1lIb2hwe75K8VW/JBhvxJ
         0lp820zAMgKiSlTo9KvjM4iWWlVLbqOncofybZAP9O0RTdMR63HZPleDRtRi9W9GMVeG
         TQ16VLOi9cyLmN+ioI47E0FFTwH3QpkLbNZm+P2Ax9wG9RDOlYWBAqNW9EWQTt3c9N7S
         1GmgylW/qBYyKN5DP5Ramvp4OSu7cJc2LWimsyjDr1Dk48vPME8+ZqchTnwwuFz97jSa
         hD6A==
X-Forwarded-Encrypted: i=1; AHgh+Rrr1SZmoxFY/ViP2ba3LBb4bMM3khqoUv456LzzX1Hdb7kFvchhkEOFLHHhsz59L+JTarYzk+3Nx6lcJQEv@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkr20P3LVqo/Hg9Ldq/GzscFMs/N+xCLCebyjKS25f9fdEMWe5
	DwC5aFmkpWnwGsvZJFaznwFSPOESK+Xq+qqu/fQElUmrKcBwkn1926uAxKBeOD3/M1ZDmeaibV3
	uDySnXiANUsobePRuL5C3omx3xmCg8jISpjl/H8ZLGPxZKURRW2o8w9P0x0JGRPz7SM7a
X-Gm-Gg: AR+sD125RjhHZDoZGmRR2pUcDsiRdU3VPt5sGquVpgKzssuc5BisCRVX2dj8vhesjAE
	3BaO2bke6FDWmMOassamOEmQLRlo6qFdvorz9AnJHxVA+5at42vzfUGCuDkQDuXpk4C448yDj2w
	RC/PVINxx1YnVSI/PVmLnGX3WgwTeHmAmxDvVGucoUV16NeEPkawkkFhoALnXZgapFPpeKArCME
	QZs50MYNahRjSUrB5jI6tRkN26qOfX99s4FQ71okhUkNWhNeuJiKEmlKw1/3tumXTNQIT82u2gi
	PJZawcPc790pHTkCkgv9kFdTXwsF2iCvc2yUGpSZOG531LqCgY8oJTfXvBuDJCR19QahuErrOS7
	kGzkS6VqOlzk9dHZDiT+QZstqRic=
X-Received: by 2002:a05:6a21:4782:b0:3c3:75c5:48d5 with SMTP id adf61e73a8af0-3c42921e17amr4273356637.4.1784730244746;
        Wed, 22 Jul 2026 07:24:04 -0700 (PDT)
X-Received: by 2002:a05:6a21:4782:b0:3c3:75c5:48d5 with SMTP id adf61e73a8af0-3c42921e17amr4273315637.4.1784730244251;
        Wed, 22 Jul 2026 07:24:04 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc7d8fbsm11231211eec.10.2026.07.22.07.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:24:03 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
X-Google-Original-From: Monish Chunara <mchunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V4 2/4] dt-bindings: mmc: sdhci-msm: Document the Glymur compatible
Date: Wed, 22 Jul 2026 19:53:40 +0530
Message-Id: <20260722142342.990384-3-mchunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260722142342.990384-1-mchunara@oss.qualcomm.com>
References: <20260722142342.990384-1-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: MWahlsMC-7v-Vc7noP6NQrMesRbRQPh_
X-Authority-Analysis: v=2.4 cv=VfrH+lp9 c=1 sm=1 tr=0 ts=6a60d285 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=4B918gerxBs5-tgjyCMA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: MWahlsMC-7v-Vc7noP6NQrMesRbRQPh_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE0MSBTYWx0ZWRfXydfi1az/89u1
 QyeFX7UcRyUFeXxfMTAUBFYHYT7liEYsioc3eWCfK/ACLciRs0PyDV7xVdAuLLKpYk768lCQGue
 eAiqi4/a7BVGSb86qagiPcY8RARpQ/BLT/jTixsmKQhHf9imjWkY9IbGQDGiO/9KvoD9iaGTJvU
 GVzqGd4I0000XLEhHq6QfrrJeMe++P3hkROH8kKLNV1Gv4doS0+sLcyCC2M0PE0nsqGVnQm0x2s
 aCyxFI106nFA6rWaYbWd4xpxcfukE+BbNTGANRvX0dL1y8Eud/MNnyeCo0aVEu+hZvgXTb89qMe
 gu71+HQ6qdgny53jguSty9haOxTQGh9mykZply97R+Q+ORL1CDARAL4XnvUR3PdJcAK0H2M6x+m
 cLqVKO4sxvD1cGX+VZ/CuSATrWR4336vA+0jv237ce4+JnC9IaNBtKHwsK/nB+dzQF25//6hzcH
 hfIT161SLV0acHS5f8w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE0MSBTYWx0ZWRfXynnjeKwHo6IT
 iYHuV1Ck7G+aC/UfQSPfEnz5XOGozZRxDrZk5ar9ZPzoy8A9p1UYOGMrmMjWQ8HVHdEdqkkDFHT
 WwlKz8P4u1iz3eVAs4Lmnc5ncIjnjhY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220141

From: Monish Chunara <monish.chunara@oss.qualcomm.com>

Document the SDHCI controller on Qualcomm Glymur SoC, fully compatible
with existing MSM SDHCI v5.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
index b3fcc1673c10..5aa6b3a29ece 100644
--- a/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
@@ -38,6 +38,7 @@ properties:
       - items:
           - enum:
               - qcom,eliza-sdhci
+              - qcom,glymur-sdhci
               - qcom,hawi-sdhci
               - qcom,ipq5018-sdhci
               - qcom,ipq5210-sdhci
-- 
2.34.1

