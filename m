Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5684C8FFE
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 11:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790768962; cv=none; b=YIFjceYfv6z/l7i87RQ/oSbXqEL2f2PGhiT+N2cX6Fp8jS2BujGFn+xiUzHj+2QkUoU0SqevjvnKSfTZkSnPwo5IePWUjAa3IooZXDxl6d0SZcg6LjI5h3oXYbwPMnIuJoArgEpO9MOJufTJ/lGUfXeJQ5XQXUd3MS9vJRqcX1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790768962; c=relaxed/simple;
	bh=ApeJNtJg2uuP/vbiRmNdqkDoLNz/Tysd5DekOcVETAQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fHS+6XChdi9lShUxrTtxSuKPyMj/m/15wIWCQ7x62FdP5KP7nX/eAcFR8NFNPy3U/odgfd5DWtdD7soBCVyczTX2QO48bgSa1QXpu6ElvCTIXuWzDab7neALhfdm/pa91EnRPzHn+rR5axBTiHjclH8G+PSMtmgvM4KBMyZ/le0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=knSPFgXf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dipjJ2xN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="knSPFgXf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dipjJ2xN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7Ffx225543
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 11:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xlVKhCgHryZkBLrnlZnf+iSZX++5oXxO7RDEhGF/n9A=; b=knSPFgXfrS00pGn8
	A7bdukjs0giwOkh85f5Ok0Ymly30IjtXSbMNPkgFA1Cq0BsWwc0EzG7NcP3gcx7G
	mGzlhSY0Ku7/bFbSnB5JF00e0tCAcJCgDa2GMGDeAQV/8zk5///0qdyLZz1D2VnM
	qSCMCn5tr56wOxEhGXA92xnPuCcZF+RUfGJpGfGhCloJt01ghQYj3g4kmSguGpau
	Xh47GWopCMBObNaC293WgFac8NNEi83ryojnLoVAwyNMClln1aJuVC3tQbmPaLJq
	pprPWZF5dNq6OaFmK7EU+U0BYdBQn0hi1tXXabJznsYo/usIt4RCmZZMgBYWeICw
	kxyvvw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0yh80nd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 11:49:20 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-86a43fc3527so1936070b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 04:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790768959; x=1791373759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xlVKhCgHryZkBLrnlZnf+iSZX++5oXxO7RDEhGF/n9A=;
        b=dipjJ2xNoFNQrUJ/1a4z8q+wrW7dGa3cZK8UeB2a7BhJhVWxp2/5VzHTWWFPFrvADU
         1vF9hmwL6vLXi+2n1nke9UBJYz2hG3wfChBO71UHJ3X1CwGicogi2nsHXtnz9QIXpZ+S
         VPBUsIZ8UaPhG6C09T6ogrmpYqGuIMWXZbwcZCNa+eOe6cB5KIfrdpExyx0MPDPC+hhj
         n7RYdHr3DNKI5m1noaP+ogLxJEaYB3NwvHCmtWIPU+rZqIzcbyCXjKcn7GkFw89ltscu
         +wvGUub+0n4DVJd3vy+w+FgSQovK8OlldDEuwT71Zz4zzu4fvTndLtMwSaa0ixtNQg2r
         jEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790768959; x=1791373759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xlVKhCgHryZkBLrnlZnf+iSZX++5oXxO7RDEhGF/n9A=;
        b=kcbr5inr81CDZCQm7g/PwSpCr2AzrYDBnOOZ8r1AvA/hYjMOClaFZQ3MNg1Em+rowu
         fzNz/jXq7rK1eG9/LneKw322abtd5Xjl5F9YMOKT0iISda2sN+UGG8C6mwMUgTidYDnO
         UpXpwcWa87+ryBvI1KiwP0RThAEX5UQ9w2EOOeRhxSA4+LQTbXZWbCuGOOKVr1xf49zG
         GhsQS7dz7+/g4pVBt8NDaI2ibCNO/NRRybHykocjIXWyfU+IrFxoxYoyWAbNlQ94DaRt
         6pRpeuMID0D4wqvaAi2dsgpzxKx4Fvkv8mf1hkP4GNrpNBjti2HYkfpd7a/B0UZKefmb
         23Rg==
X-Gm-Message-State: AFuF++kPM5Czh+7GWrFY2XYAjyghItwA96mWYJA9sHuafh+2UXhniyRC
	Yd2IbFDMZfa8yEBPAxV2a0HvuKrNtOOcxwHCX5seY9pF3BC6kaA0t1uBMOa+6DJHq05QGSKCKab
	IzJL2tCfPxIVwhHBFoPLHzJ4vMbvoxkO6ePEle8CeUgb8roldl0E6TBURWk73Iz8z6IewPAVdmR
	so
X-Gm-Gg: AYBFou2gvQQEf9lTo+4ddgTMxGvfLvoczCdMrPDaZHCbyzBVw9tL504nU/W8PU2j8n6
	OcDTQ1pnewz+g8bZwB/ukshJ34A3Kw88QAH+7f1Jnz040N6RHGQNZybXvFgHfB5F4Yi4pPZuiQm
	s1CGCNFCDQz4iNZ5RHKViHrlpT6PGSqV8t7MGVCx6gVI2tqPbBFsNHv/1IvkSM8JheePJUOE16W
	jV/iy2Ho9Byw4lSiPQNNsLzBJLBs4Ey86fvu7jV2N0BIuoaY/LBRhreRAU5+ILdr3DhJqdA3rmV
	lz1sQphDRlftuT7OwBeElu+bgmdP3hTogh3zZg198vRwr7RdWtIPO7nzQ6GtjwoOIkR6z0jSMzE
	aVPgQzRmlczc5XQ==
X-Received: by 2002:a05:6a00:2d9c:b0:885:ca85:68f9 with SMTP id d2e1a72fcca58-887522a4cfdmr521167b3a.13.1790768959392;
        Wed, 30 Sep 2026 04:49:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d9c:b0:885:ca85:68f9 with SMTP id d2e1a72fcca58-887522a4cfdmr521151b3a.13.1790768958942;
        Wed, 30 Sep 2026 04:49:18 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-887bc2bd404sm53163b3a.46.2026.09.30.04.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:49:18 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 17:19:03 +0530
Subject: [PATCH v2 1/2] dt-bindings: remoteproc: qcom: Relax PAS iommus
 item limit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-shikra-el2-v2-1-f0822be5aaee@oss.qualcomm.com>
References: <20260930-shikra-el2-v2-0-f0822be5aaee@oss.qualcomm.com>
In-Reply-To: <20260930-shikra-el2-v2-0-f0822be5aaee@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790768950; l=946;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=ApeJNtJg2uuP/vbiRmNdqkDoLNz/Tysd5DekOcVETAQ=;
 b=4Ngh9Rvh79ohRFib07aIUcTOm6g50J5q6GmyLhPbO5fOgWd9lcBmg0dDsgLhIK+DtW6nes0Vx
 RT+iR2F6b56AI9CJ30ByCWO2PrHES+5NCbqAdBzTIUpumEzZi3CRY9o
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0NyBTYWx0ZWRfX/ophkS4GuMli
 qVPoR0br/PT/L7v/VZSCN29HL4hTU9JE4eo8ysmt7xyLhBi43Fv8dsA9eEWGy70E5TtOZuFLCWI
 OPBtOdAhKgp/j5MwO8z08uh4EUezkcV6te9fq0FTSOy5a/uqtnqT1zfm0LGTGffMhOobCGhYZCk
 PmMsD42MjrnsXGUMI9hzleZr2PZFd0KRQRSPqeKJvfc0dJeNyPa/DR1aJtsgIJhtc+afTGCVhx8
 EIYMxNrVeOj+8F4vl6dK2NB3hTWz97fkNC6cFKlYpHKV9CG+6y7suOGWILN7o1G6QmOlt9fir4d
 CV6pGFabZemCoXQk4q9ePl4spFZE1FD9OnbhIBO5EYSncLT30heupaIOW6dNuduJ9nJI8cq1oxi
 LFM+GyJIgHvMCS2dKt8kUvnkBlMrD6zh8CX6qBDJOQIbRB0+k0IwHZf16RlirP/hWkM3DAZ+Axr
 4ni/QMrRNtXTQ1Ixoww==
X-Proofpoint-ORIG-GUID: o1UcV17utbQC7-uvvu-E2VW0TW_-B5Oo
X-Authority-Analysis: v=2.4 cv=NedzRGD4 c=1 sm=1 tr=0 ts=6abcf740 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=nBSyg2lCdujpP7gPECUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: o1UcV17utbQC7-uvvu-E2VW0TW_-B5Oo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0NyBTYWx0ZWRfX/NjNnZqR9IgB
 0wB3YdiphlvNKosXXONYHa/fwMgoxYuU+1p0c8FnuKMPMYseIP/241UIeOkxvfPnvePM7V3fijh
 ovkZTwv6k2JdMB/wA2f7rUjx/4+V8Sk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300047

Some PAS users require more than one IOMMU mapping. Update
qcom,pas-common.yaml to allow up to three iommus entries so
PAS bindings can represent multi-stream mappings used by
platform device trees and avoid dt-schema array length failures.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
index f75cab6b4ed9..d56be38aec9e 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
@@ -33,7 +33,8 @@ properties:
     maxItems: 6
 
   iommus:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
 
   power-domains:
     minItems: 1

-- 
2.34.1

