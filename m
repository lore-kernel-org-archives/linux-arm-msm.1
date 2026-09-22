Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F325D52FE48
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 10:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790071767; cv=none; b=Rdpz1HgzrL+aGVfNWJA7Xcg2A2uZrD6wr1n+fjVuPHar//sK5xHdw04kARccMxh+uAAqxQVRN1IHl+EDnAoMxNZPldcXKdECNa8JDB7PCzu0g3b7TWMIVLmt9fkSSEqnYerDwtfIz+I57umzLq99zSq+jEBoNsdFe3zAEQNLI10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790071767; c=relaxed/simple;
	bh=0No+ZacBX4HIzIYIMRa6vAD2lIVsiJ4dmaOWJP4PKjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cOc6jVVmfNVTEs7nPitiUuHFw1X/49kiG1J0JAhdODqLjdGQUVqbBYdVri/6dqZElc6ZqdZUsvkjgQj5xx1T5CfSyy4JT2PtmDZTDj2RUNaUBnHAf9phxem4wR42/7wZuvODs2zxaDPAKOevA2zLrnNhmTYAKTBGXmV4PsOTKQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RUgaFVLN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d+05KahS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RUgaFVLN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d+05KahS"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M7QOV73044040
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 10:09:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4LRK8MN1wRj
	sdtZjvI5LO7JovexxcJJzxK4hpdSkz4U=; b=RUgaFVLNG3w5RImqA1Y2NqDh8OC
	XYM7kGWaGDodxbAqqzvtNHnF3pLIbE5qp+9pnRgVjLbeOlnmeKbAYzYDNKa1gw/L
	mOd/Ih8dEkk/c6X0k1CPumPPSYpUKgIOxE/Jdz4N0kERZfOfOWUp5MV21eRAWZq/
	wr/WoNU1DX7JiXyuLyjfoFFiG1/jfTM0gbdPq27L1d1e7UKuAzczkoABlHQrO+zi
	+C6rV898OQi5r+gMBlr8ZrNSSNhpFzLgI5m0EBUuwaSoQ/oQfyZCBPa5o/NBSgN4
	3y0JqZ3lOAKoh4RZ2Zr6+UxGSiM6oXy6+smflhGHhgBICMowh3YHTa8ObGA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufbat0x6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 10:09:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39e3dad7ab3so5205555a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 03:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790071754; x=1790676554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4LRK8MN1wRjsdtZjvI5LO7JovexxcJJzxK4hpdSkz4U=;
        b=d+05KahSr5PGcjFK8WjsYR1sGlU5WzdmY8JTc9Ubgs00lGMVYG1hpakBbf3zmAo5aB
         UvbOAfhi/4iytqwOiO1kN007xKxvYMskjA6yEqF6Aoav0cqJLrW8odcWbXmD5X9mHadE
         FAxPGYv/NKbngH8EawpLQbixt54qqOjweGcGn44p/S8wYk+FFt2A8JvDug77lTSbnAPu
         DzmcCgL+doT7cJDwbhN2PR6eqLKjk3KuQ+b3cSjdwbgEeDmq5spO/y5s10aA1qnG5riO
         1eg7aLxh+VPvugbYx+dFlus7sOJWJVGq2tuPS6alIaQh9Ji33AhcOGCsl8xqy5qGv73A
         RDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790071754; x=1790676554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4LRK8MN1wRjsdtZjvI5LO7JovexxcJJzxK4hpdSkz4U=;
        b=Z2USeA9C7AuclKUAngifO1k5po7VwRWVcf9MBikx4l0zXKTDfgmpOr4mNrDsM1GM5r
         FJjN+NC0mLTPIPkdTqD+QPDCX12hrifeqiNRQRLuvPtk89/vJDPF8/6AgdeyNS5PhIPn
         +3LcSZVHTp/QyisGcRJVTbFRrDemnwa5nm4H9bgt3xTukXqOrqEKBhEB3RS/Bq+nPHxC
         3Wj5i5rn30FINLZ+p+XNPWSBgi8T0yVM05ukxFZIoqDhzQkE8YAHCLvERdcVjC+pBwbF
         lNQmvIGuziefRuD9GFQn3k4eT528YU0eldY7w8vaRKIhozY5zhm0ROgo399bPINkd4HG
         dUTg==
X-Forwarded-Encrypted: i=1; AKwUvBy3cywX3OM2JG/Bb0VBxsnrYAMXUSCHAJ2QDlEBv4nCfOqX4ytr4Tzp7IqdPb06iSp9N/wrNI3C+y5dGBk9@vger.kernel.org
X-Gm-Message-State: AFuF++mEsxf4nu4gHnxsZP8lut7YPhlKxRcurrZH+vo+KyuFVEhv3M9f
	AvCJjchzyvfzslUXU9b8uI66taVso9fqLFEfyUsjNnrPOhTq7T5xnkB+sHzFz/TcI14QfK2HhV4
	lRugqtXAO9oGUdmvYeyq8D21pVG9SHHmqC+kgcLczU9Gww8OjI5otyXZgNtYKgMEABGi8
X-Gm-Gg: AYBFou3OdpLju7+Q9t/vUoOkr0xb6j3oN1Q5QWsSNj/L68Q8yyvphcFnDjrnR8LYR8K
	6gM4LQDQVZKMXutywaG+IFwK3Q22TrFesnkAYvTe3ieZGJNeVjTcZl2ey3DlifadGLAiJzXQNxz
	0iv3pcAohX0RDHOFx6RVgTtWKWBDGwcpTkEjQ6sR/ba56a/UdeNjA7KI4VXSD02qCJOh8iautjq
	8475xBdsWqVjREiVH+ULDGAjGF6cdUaM4rkUcTwL9O1Ibd8a9pqOiFeLLjCSzqXAm6EyMYyeRWO
	V8zUMomKD/NP0EgrhCx/o+XOYp8klj9xrJ/FHF/OR4AL9vvzdKT+tJHcg7tZ9szTuUEM/RvP9XR
	ard+MFUIiFF/9bQyhobmYFuijbzE8gy+lKvBrEQrxnuJeOqn7VIuyd7gpGtI=
X-Received: by 2002:a17:90b:1c08:b0:39e:6a80:dda0 with SMTP id 98e67ed59e1d1-3a0731f957dmr624683a91.39.1790071754486;
        Tue, 22 Sep 2026 03:09:14 -0700 (PDT)
X-Received: by 2002:a17:90b:1c08:b0:39e:6a80:dda0 with SMTP id 98e67ed59e1d1-3a0731f957dmr624649a91.39.1790071753974;
        Tue, 22 Sep 2026 03:09:13 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e612c9ca7sm5121502eec.17.2026.09.22.03.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 03:09:13 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: arm: qcom,coresight-ctcu: add Nord
Date: Tue, 22 Sep 2026 18:08:49 +0800
Message-ID: <20260922100850.527109-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922100850.527109-1-shengchao.guo@oss.qualcomm.com>
References: <20260922100850.527109-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE0NiBTYWx0ZWRfX8KJGIphLbz/1
 mACUDl7bfGjEtHVriyOOOoB/CVMzx5tIpSjB1f8OWOxUGPXVM7ejwnyiDUdg+4HzqTL5lB0Pm0X
 fHn4OyTxjB5AY26bOtKqZFgWroHkso/90abf75NG+eLy3KU5rFQvJ2shA+GXuF9/X5JRwslYO4t
 HcY06L5gg/jxRORniwPJTLPXDOFk2gggJ1kbZorQkjHFv/eQtaL+uOleLVZuLR+nr7DK1bFrzZR
 4rb+zZiXXThuEld0jLUnH6GBMLrJvsiOUs0bPiilsMRknkILYzO5CaMjZfcqgtJ23Ic1lXuXbbk
 SHG8YuCOmi/FFPoQwbBIvwc0zc1787thJ+FNp6vscFNCSniOlpXSRDDTfBQNrBALlzb/X+CGwdT
 odfqKdAiJqFzI1rqbZF/S6uj5Du2EiyNJQCwDfaGV2eqndMi53FCXhYUe7ErJiYSSCTEjxWt0la
 mc1uGfQRIkdolIorHDg==
X-Authority-Analysis: v=2.4 cv=IYYSymqa c=1 sm=1 tr=0 ts=6ab253cc cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=co3ps9B5goeKVN-PGfEA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE0NiBTYWx0ZWRfX3P8TuG2l/AZw
 CZ+lM100PlPKK5zEtmwyMKCnxjECVnWmn/wR6wIT0Kf6tckHepLLBYBf1kpIS1yfIsKX4/eoYAy
 xdJ+BU4VzuFtr8Z6pJBPSQTq36mcmC4=
X-Proofpoint-ORIG-GUID: xw9B292N41882tVTphb667pYzoXzUen3
X-Proofpoint-GUID: xw9B292N41882tVTphb667pYzoXzUen3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220146

From: Jie Gan <jie.gan@oss.qualcomm.com>

The CTCU device for nord shares the same configurations as SA8775p. Add
a fallback to enable the CTCU for nord to utilize the compatible of the
SA8775p.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 335a8e1a5a9e..1d5bf79f4984 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -31,6 +31,7 @@ properties:
           - enum:
               - qcom,glymur-ctcu
               - qcom,kaanapali-ctcu
+              - qcom,nord-ctcu
               - qcom,qcs8300-ctcu
               - qcom,shikra-ctcu
               - qcom,sm8750-ctcu
-- 
2.43.0

