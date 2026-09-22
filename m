Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC50377023
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 20:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790108735; cv=none; b=sFpDlAK5OFqoACTmYM5lk6mjvy2k44jj4TVAkEsCJRFR+pTn9jUgObcsH6VgTnZD3w88Qt2cRS2G8YB1q6uELzn+fW2wjjCrHrKqqOXGgrBkXLM1FMRAoeC/yX7J4VhD3nLPTRPyDVokzuv5TjarEBi3y10pJAwPLB7y50ZVwTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790108735; c=relaxed/simple;
	bh=BnsHd2rNEq/nl7zxksb3Mx5SzklZzKqsPweU+rMX1r8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GIRxJtnruroeelEnTCjKJqxrzkpasZetDIYtzSMVRtYGAqEYO1qOGx2HgImVAXtxt88wrsorCjpZ+7cklWZFtavfPedY5O/Fz2NgPELC7RkpDOzb4ziN55fxm1NbnznClWtYokJOhDyLDcMDkEcg8AdjRuS2n2A+GdBbTScJT2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OXbplp4L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gxjLxglS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OXbplp4L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gxjLxglS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI76xR2033335
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 20:25:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DoPn9zrhP5yV7lMcM1dqmYXJ7qwVxD2zmvz50gJaX0A=; b=OXbplp4LKDPgjPab
	BgoA2wR9tKGaUNyV6yDOz3/Z8ARLMd0zJdmdjnkEW7L0VIwvPrX/p5wPJ1eWn/BE
	3pZh6GSM+Y59JxPWLpLBD1jP1PZKsaTULBbJzEY3byZFnP0dPF7p9NaY2zjp+jPi
	+VrwwlmCF/pPb70NYEsswtYPPt7dgXVPg4IiZfDY9fs0q/tlxZ0whFVgQ6Y1guNG
	CUWCjmsKKfOie/CnosR3nTNJ2PXCfhwxXTpNBZ/wbCA0InDNYKj5WxxxkYLFukhI
	DwBDF0r+MCwfRCmkkWO5ZwmuKaFwTMit1GDaPoID3nhHjE3alr0+wNEsuDu7HnuL
	1GF1RQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c0uns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 20:25:23 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b2fb8f0df0so473959b6e.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 13:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790108723; x=1790713523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DoPn9zrhP5yV7lMcM1dqmYXJ7qwVxD2zmvz50gJaX0A=;
        b=gxjLxglSL5QG/1Pt9PzRveZ3YuE9eA4GdeVlqaBdDnGc30/ByBON0uOb2loh7CFY2h
         pYS0WeW6pJHgWpVXGzZqlMYO3HS7WjMjMQvsAM0zVPVUhKk4GzjM59n8/ciyWCXajNzv
         9uZMceafYDPheC9/rDpa4728oTc84eRgjG/11+FUEqglzsaEFr3XFE/O+AuRKgcVc2A/
         OApEDKGWUZW3cOxdFXgdJhmtz+T3zVWI/2wwqccE6TRXywBqx87fK6PUmL69Y/5DFnpo
         XIuk+1fnPtALGcaMqUzSz1ikGcZtjmnt9RoTW/vlkebH8ASLvzWgQWPyV9cSMKT3STge
         IdYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790108723; x=1790713523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DoPn9zrhP5yV7lMcM1dqmYXJ7qwVxD2zmvz50gJaX0A=;
        b=g89S2TJ0Si17/cTA6Nj9lxUwtglk/6ufiz9u29PL/hlBxNJmS7P+0BI4tsxrF7EUpv
         7FGhZ6NzRB5FFyx3kHvEUAcBd8RGQdRXGjWQPh5AHg/ulikxiT96T3LbKDQA/Ky1ndPC
         2Lx7jpLXcPEkeBfNLVJg+FS/kPjlgJw9wVWj1FZv/4oHsV0sR8AwGfVQtP3dJSd1rkhS
         RMaoql5eIZnJ1AVYnmew0kebJlIGngb0nosTVsy9D58EHT0sTEG93bSSSXjExLmUDpJ3
         hXQFfJacp3Pt6JfgKhu4ldzVQIqYln2HFn2h9KOgivhVFzsBOLbqZTO+8+jjW9gHD6jG
         54bg==
X-Forwarded-Encrypted: i=1; AKwUvBxH8NEmGl2C0rk0SC3NRWfSDuVN6Fvh7fzMtlCnuEQyeTKJnmajBewfW0J5uRQAj0F5abJGHmPPCTst74lt@vger.kernel.org
X-Gm-Message-State: AFuF++m+sU0ORbtd6OgIqz8B8qIvqgiqg6gqlSGBAOgnrSzDrDbwGeIb
	nHefbw7QAj6LKrV3er34TKZmBirYGMIS5pH/50OAO2rGskFOkNY/BmXoMVQPozeYCwoi1husPxF
	/9d9dBQ0W9kM/CKCdKsRVibYWCHWplnJel6yC1VIcSSndYaVzlnJOWLatjSEkAfSn/tkxvkJ2sw
	cb
X-Gm-Gg: AYBFou3oGYPXcJQNiQk+QaICiJq0tiAPLraq8C/EW4wWGspwoim7VFFcbrnvbAazZti
	et3NNQYhkoFxxR/+KmWyJ9QMfLzln1CvLADi2vPGFlmVs012nThbXe5Fj8kMSP2z+UmWIPqDpAp
	dKBh6jDvfYiiEHcJJIaiWtd5cSwe9Ioip4dgfCwMgauW9Nt03Np5ceidMmPM0QLaWv63jVrjLC0
	mCtgwVXvAybeWFTT+9kPBa+8SjLyg49F9Wqwt9kcaWC3AUQig1WQ/AMMC3tfQTsj+EfHN4VzCRk
	dLUiVf7VJVBCk0N9BuTiMSnBw3vjCUFCWjqvnegN9ktvSDN3aCYnAZzIQv2WDTpd+/69Y1bLi3I
	8zi73SepRib/trmRs34s5zjNdNw==
X-Received: by 2002:a05:6870:2011:b0:48f:e0f6:c02d with SMTP id 586e51a60fabf-4908b09972dmr731119fac.43.1790108723152;
        Tue, 22 Sep 2026 13:25:23 -0700 (PDT)
X-Received: by 2002:a05:701b:4546:10b0:143:298b:ba79 with SMTP id a92af1059eb24-144f91ed3eemr477063c88.40.1790108341264;
        Tue, 22 Sep 2026 13:19:01 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f983d73fsm1101142c88.6.2026.09.22.13.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:19:00 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 01:48:35 +0530
Subject: [PATCH 1/4] dt-bindings: arm: cpus: Add Oryon PartNum 3 CPU
 compatibles
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-dt-post-v1-1-e41473b6298b@oss.qualcomm.com>
References: <20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790108331; l=929;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=BnsHd2rNEq/nl7zxksb3Mx5SzklZzKqsPweU+rMX1r8=;
 b=ANeeQPsv2NbzjxheHp6fl7Ay8B5EtBvQTd7xhic8j/izwG1tJhpAxHYB0nlsWvIl30j48gy1v
 AqdbCvzZrWeAgrgo4xuHAG+pFZYGBfYUIJQmY6c6/LE04rhpEnXitJC
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5NCBTYWx0ZWRfX0I8uPJH6+84l
 YhZ7zrNGY6THLudwd+vLWejkw/l2Ex2VqGzmuOYcUGgq3GVrCT70Vlc8ssiubHV2g6sA+HR766E
 TSvZI33El6rj3EdXAq3YQWLlrbMf8WKDJ6Ez6bNUTxYxHJp4S1a2wYni24rg0JzjsLHRCgEVlUj
 h993kkn3guPig7HUjw9s8K2lzGejS0a+ivwJf17P0tGh6kv12bo5Ol4NMo2Pwfdkl12aHAe3m8J
 qEtdIkAjbuiSQb6ZdpebjbSx5BW/7XU1egBFAp7JmSydCyOvItCPsDoxPg2wf7ti2o1wZBq4lww
 p3FAMPs0vPwUq+dddiiu/50J2yNfFFVt8FNqGxFQS0d44dfZfP+qj+b0NMk+25yCSvu98qZwFQS
 JwybkyFFfoQGwjuOle1Wdq2j4YROfHECtTNW8i6hjkfgan1ubjwMRfkbe4BX9Xki91VGr5iDaXk
 w1IUblM1XSAs6dxx0hw==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab2e434 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=qZrVCR7J192xugBBzLgA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-ORIG-GUID: BbePCZdbGfe01ZPWjVHC9Be5pYYOAtxa
X-Proofpoint-GUID: BbePCZdbGfe01ZPWjVHC9Be5pYYOAtxa
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5NCBTYWx0ZWRfX7MTqfS/fM02N
 SdRB1sAeXxEbsHzvxtQEo0S3/2Ji77CgBDSttXZhXOGyMJL9bBeQRy7MToekJXQEM1lMdTpYSB6
 WAYrVnl2IHLvT0Rk7dweFz8v0fxPzOU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220294

Add core-specific compatibles for Qualcomm Oryon CPUs with PartNum 3
following the qcom,oryon-PART_NUM-VARIANT convention derived from
MIDR_EL1 and to be used on the Qualcomm Hawi SoC.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index c3facc98bf83..ead4e3f3462f 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -230,6 +230,9 @@ properties:
           - qcom,oryon-2-1
           - qcom,oryon-2-2
           - qcom,oryon-2-3
+          - qcom,oryon-3-0
+          - qcom,oryon-3-1
+          - qcom,oryon-3-2
           - qcom,scorpion
           - samsung,mongoose-m2
           - samsung,mongoose-m3

-- 
2.55.0

