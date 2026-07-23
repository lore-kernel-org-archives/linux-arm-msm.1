Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDC431619B
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 01:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784771225; cv=none; b=qTOSIfHTDEq2yDoqO74ygpSeeWk/uZ2MkuboE2qROSaQli98cJ7+cfT4kI++NTq5G/KTKT80QyxofRrPqrqRzQAU2b7ronWbxBvPbV5GSfa2cMPfUmCYzLYD+Zj3LG+6ELfn/xPGYcuUc+W0ZuCqinoSc8fFijgzXEpA8G6dlQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784771225; c=relaxed/simple;
	bh=KjZAmYYdX486FIyES0cXfj7PWztonIPwwITTJrvXDuU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vg9ttqdeHwOgIDcKc/+wKfnDxfGsnVgv6S2fQDQmifsURNZ8+mNhDE7TNyiHZ1SD4Mnsf2Ly9Dfk+R58e97pGXKkchOFF/m4W0n4Dv3VQ2C2bXXr8ZCjAy7lKOdHpdJvf4ulO+OCRBLTA0GJS7EkeQqIyUS683QOn/w4DYoTdk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=azy1mT4k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NTyR1W6a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="azy1mT4k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NTyR1W6a"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0WvQL2260595
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 01:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7lBQb3aO26PPCzUD/0DgsEWzJwNnZzEQ0nrCQeklUzs=; b=azy1mT4kMdMyli3R
	YeuVauPdoJXBz8OpeIX8wWo3UoKfEeXTtkejiDeQQrKgJCOO7IvV6hrIk/kzQnCr
	AGjI1jFz/NBj2mtP0Thbv062aK/514fQYmNQkW6xWmFcp0mj9UTDeqDaF/l3fiwX
	4ymgoIOrR73qIztYZJU3Y0ogihl+rMTiGHNbn4NnXwSjwt/KD2WhQRGaTLYZ4oP6
	ukOw6hYUrnFAl1fk+IJLv1CaQMrrPigbdK3ZPD3UkfX4YpSsp1Y5IF6sPEOTDrwM
	JrR4TXpMP2AdEXxK1LKcwkuuWznBRG5oklyc49jqLcKGyZxN28UasqblM32z6Ug5
	MvIGpA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk275hp7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 01:47:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so3436645ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 18:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784771222; x=1785376022; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7lBQb3aO26PPCzUD/0DgsEWzJwNnZzEQ0nrCQeklUzs=;
        b=NTyR1W6aLAYYms/KK0u/nPbGSsoEatCXCvPMry8SG0ICH7LOWQ/9op+5WWYD/KnwcJ
         kGumWl/sYn2LkzWSPSwmbtFyCpswxcttzVjNWPT+9Um8bW+MyiJ41EXavbbTn7MZ+5Gy
         ZxnQPGxPpQBjZFdv0dyOgsZ4RcbgV9cxAkqP6n2Dv+IFe9MhHVlIJIdpZdy47I6GChUP
         oDm9jBzPIjDiPL4M0Xft323Mr8hhVgekpbCCZg7pUhPex3oNw+94Cr6UV3WcXVX4FT6c
         hy69mlpg/gt2EeaD61Fu0PrshsfSjFcCxxaUapyM5Ov4QpGBiLpb3GSA4iY8oiL+lzr8
         Pm0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784771222; x=1785376022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7lBQb3aO26PPCzUD/0DgsEWzJwNnZzEQ0nrCQeklUzs=;
        b=P36VVpqWA2jexHxHBVNXbXiXN6YT8CMQ6qIeDzZEoCiId+SBwxbPekLb6gFRfXC+uq
         aa5aqAR3yAPBPy9mUF2AHsVEBSzF+fCsOX5zOjOUIGexs41fxIhbQETAGpL4DPw4NZs1
         Bx929LaSecPlJhKqPFBYbp+YmbPF9jiBHL9MPQ4pxlUYwMcufj1iuslGjqAHcp2y3QbY
         25HfyDtnActmQ/z/8bpRl5RCSLqpRb8HsD1JBgKcvHXNsm9nBdsG9zpV/fbquNl3emB7
         SzznotXkVILfKeswZOKTi2aPT71lyWogirCzO23aH3uc3fw82m9BUjIGHugitHz850XY
         Houg==
X-Forwarded-Encrypted: i=1; AHgh+RqLYuh44eIe5S5gBEUgVIvPi31i9x8hZ5kabG9xDxf3cG9Ql7rj35JaOWTN7p7Wt9OwbXQ4eRlFTmElmdGs@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2Eop20r7z1BpUYjwBP1/T+U/Il/EfzbgSMiU5JslM7SoOdtrQ
	YU7vKmsZOjgsvmkIhCelbNslwAbd71gYYU4h+60l7VN2jvs8TxjS7e2r8FcRT3fdt3NbTVeQN0S
	ukH2U/8G8XFWnXTSmAUyhMQK+1XexQSW4KgjpV9qTveYy5uyyZSm2URGOqnzhMWMQtIcF
X-Gm-Gg: AR+sD11Erz+13P1+w/wgtM7Z0vby9pmED7SbjG79ynJBiDKSadMnIFe+B2wm8IhZg5O
	1o/B6AffXl+TQq8AVwBKUrRG4yRxp0kwMDlxwJP9JuPcOAUPv3w/7PidXu3gQJkHLATzQiET+O6
	rLnxcnjv4M8On6RJrxagq417szMfyOs99kPK+C8rm52hBlrgiHaDJbpRYRPePa+CGAAfHQsazS0
	H3+TgSYn8aoHnfEEUjEhIRLO5MrEkYy3u+eQ02brgKUhrlxvbIMYVDXjyVLk6Y+J5v/jXXJPaJM
	5YfsyZqhWZfxhL2WgnwKufTeceC7IuQ0YAvo1rccaf+uPjNCiGEBmhnkdV9zTWqeeyF5pd2CeKs
	+n0A3jjP5mMmdOPVwGHfRWARyhhSEoRHVNK/D5Uub21nc8Kqb5Wn9QbFpsQwOqac=
X-Received: by 2002:a17:902:e841:b0:2cf:a1c1:c60e with SMTP id d9443c01a7336-2cfa6a5a0a3mr15816465ad.1.1784771222035;
        Wed, 22 Jul 2026 18:47:02 -0700 (PDT)
X-Received: by 2002:a17:902:e841:b0:2cf:a1c1:c60e with SMTP id d9443c01a7336-2cfa6a5a0a3mr15816185ad.1.1784771221548;
        Wed, 22 Jul 2026 18:47:01 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efa39e9sm23389995ad.10.2026.07.22.18.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 18:47:01 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 09:46:30 +0800
Subject: [PATCH 1/2] dt-bindings: arm: qcom,coresight-ctcu: Add Shikra
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-add-coresight-nodes-for-shikra-v1-1-992615f9ea15@oss.qualcomm.com>
References: <20260723-add-coresight-nodes-for-shikra-v1-0-992615f9ea15@oss.qualcomm.com>
In-Reply-To: <20260723-add-coresight-nodes-for-shikra-v1-0-992615f9ea15@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784771207; l=956;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=KjZAmYYdX486FIyES0cXfj7PWztonIPwwITTJrvXDuU=;
 b=MCVWSdx3kFRU6sl12LLfX/j6oW1cFns1Kbxbiws6kjgs1+ouZvT9ESLEerRVnbqM6vSCEwB8T
 Gej5nGzKwOVAyRSI3jMXfjbVBYm0o2bMwOMcQhKEjsxq1ndFCZSFGQr
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=Q53iJY2a c=1 sm=1 tr=0 ts=6a617296 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=BZKsYnZZkaJ4N7IUUl4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDAxNSBTYWx0ZWRfX5XuLJ/gG5+gW
 VykDpyXuHMefOwJpghkfe6z2g6sxgmAh9trMVldaY1c55DellOgDHDnCi24fwF+NZlkDNk8ngkP
 rGKfDjbSVbtaxJls/18cWAqihkhYivg=
X-Proofpoint-GUID: dLwtfw31o4znv5WH4dWzCpNOjP5BEUUF
X-Proofpoint-ORIG-GUID: dLwtfw31o4znv5WH4dWzCpNOjP5BEUUF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDAxNSBTYWx0ZWRfX7RXp+FyhR5yZ
 3Z2yWTf/xIQQfHzX61Ao6xzk173pWVGRmo5i5xNnIOdTK6zyXYbALLViC8k7sSMCCFiB3rqp2H2
 is0aZfrU68QoUiQXQyBFDk+BdAQ2BqsemRP4jrZLLilnRXzgDsIuqg1U074wHPbyPU+rqc7WAdZ
 MnioWI/tlLASbW9ytE4IxTjmQ8lTBUe7fVS451M4EYC1lq4KfsHFDR7jguraDYf1ZBXQYMeTfwA
 yWEQ5kjSKpqKU4WEKOzRVqvcSm6b5YBJWjjNkLX9zyZrtJ8Et9AG+UThq3FT122qxhuCkJfthJt
 nxMO9/A5Ip3vZF0GH5Pv2cI58Gt2cmmuFF6k0oBd5ac6Db2d6zgC1cNKf44C192FeslFYHIzdjs
 nZGRdpExQg+iVDhed0qo4D61Gx+t8xeOvljD9Pl/8B8ZOn4vZE+ROHwInDULhmOmJDDrpU6qX67
 coBQi9TLT5rzSBC3UEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230015

The CTCU device for the Shikra shares the same configurations as
SA8775p. Add a fallback to enable the CTCU for the Shikra to utilize
the compatible of the SA8775p.

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

