Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320F73F9F30
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 23:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790119212; cv=none; b=HTCaniUPYG6rUifPvAz7qZCf0ZNZ5G/GGYJZ8Uj7vfLmlgJ3RYu2VX0ow84Fb4b5REYKpDb67DYJClBYKQv1k/cA/3yO+EKRO1HyZU7RLnDUbjj1w1hxdRvwlOXUmioh+VWVyhoGok5Rj6U9rg3cVXSe8xPHWiXwxrx1NiBgSsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790119212; c=relaxed/simple;
	bh=l+ARlOXS2XWaVbDlfHvazDmsre4mloEoMEythuIAEgk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=awkJ3D9xN98nqZlSnM7d7vMs9kmrYaWPCBXluCFwwTvtg9lzOsxyJLBhU+r76RRKU4sOMRiY8Xkuy6FRYWmTt/o4vEgjfus7MWDjFIA3ifgi9cJ84IHZF6dbt9AZfWtQ5SRKFYVrZQ27zwldJy7H7jLgRKCyBYS9SHsghIBD9Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H3CxU7rE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G7TnSstG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H3CxU7rE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G7TnSstG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7ARW1154375
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 23:20:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2EwrgEF430cEg8Mo0ngi/Kw0Qhs42PqZHvdu03xpsVs=; b=H3CxU7rEIrdrtTHH
	Wk3YW9AOkO5LlieZHCSh/SSDmByulJdOBCuJiBjzk1Aa6Lt0lJdxyi1jyx9OPGsp
	vhOz6P3MSFMf2t/Mqub6ahWUIDIqXQNeozVvSagjLyCs/DpR46IcqcBf4g7jObid
	yujxCdr4vmIMPfU6tGCJ8Cqd8TyNVQxWad9f64Jb3afh6L3WrA/uRZXkQ5AO17Fq
	G5JmOihbMvaHHRPhM9EDpLFqTKxZ7+oXOkYa2Np2/N/thRyUnE7qc/Pwgl1yHOUy
	P2a5oryUzwHh0tcOd6QzKBEhC1eZ5mUGI2I8amQDQ4GEYax8YAmUvUr0F0EGv/xb
	wYK7KQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guvw7j2qn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 23:20:10 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-143580417b3so1091253c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 16:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790119209; x=1790724009; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2EwrgEF430cEg8Mo0ngi/Kw0Qhs42PqZHvdu03xpsVs=;
        b=G7TnSstGOU1XIHM4P+9CzJn9VFnmZLYk1Epzd+pgUkXqzHYnWLpAhYCunGfa2Cp+1y
         6kEph1Ybq8gvS1XYno3PoaGCwOv3Uyytn8l7RYnJwxYbF2/qFOwzh5tQSI686t8Erobs
         1N4tJXN8T1+8A9dnZVYSCBwJx5ioMnt7wAFuTNhMMTBV8CnhFVl2L9vQf9uCEkpDrrt5
         yzT3bcKfWpZUltetKdjBwpcb6IREdjA5m2D2aPUpIsCp1GhN8Tzr7kHLjcdnUUB1TZt7
         jh5yR+aHfBAnZu2jkW8Jpnl5qiMPh0moalD1I60I4l+PaP1CoU2uaE6b2xlwOv4DEFK8
         hnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790119209; x=1790724009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2EwrgEF430cEg8Mo0ngi/Kw0Qhs42PqZHvdu03xpsVs=;
        b=0Gt8HErpSC2qtjOjWNO2rew7VBMyfyTh2XIknErLAUUIWir1y0sWbCZSYeglEy2cpV
         CB/7DDv0+9THOBBWrIs/OPhzaZEN9HE1Yi0kIPdJF9iOyavw00y1hkJ1QwHUFooQiofY
         XsLZv8PzZCzyz/s0MVPeI8jVWMlGTn1X7lkxwM9vVdzhz128AwfWcxHB3tPYd+K0Otu1
         bPC/lSFfwPlico6fJSFic2ifIjZIYg4Yknn8qj3tW265z+R/C35BanCMvu1DwFjrxqFL
         mmbVG1huAdOzG+7+RBgxS56Xxu5aofJUVoDqL4hXI+4TEdFEoGJN16uKYOaa/2bv+a4r
         pDgA==
X-Forwarded-Encrypted: i=1; AKwUvBySreqDawN0j6Wc3ygT3Ft532qHDT3om9zdYJkKTFT0PhwQhWct1i860l0gCOp235Qq84iwvBGMZAoj/jC0@vger.kernel.org
X-Gm-Message-State: AFuF++nFDJN8yLxxSz5UF/KOFesZdPnL/dhqhtzO0ryPkNz/mZArVe7b
	/8uSDTCtVFfFhC6PnZY3QtbUQCTijwrJ+7sD65IR/+WcLRmUOXsV6Rw4dIYOwO4yGcGfT9TcEao
	BQjteltwcNJ9RaU5hy5kVM+cgz2fSHlH5Hi/dMF0GDC4rsNxY/JQWq/nx5I+JbvPOOpTW
X-Gm-Gg: AYBFou3LbpsWZslLWUJ+wTieo5jMor4qHL5nJl5VQKypLuEOf2DNYbwT31H/UwXCWt/
	nLqPbA2DvjoisxR5xf42uC8hsI+Zv23Qtqp09rSHMF/G/Wx7EeSnL7ockTZ8dcwuO7K1FdWjuuE
	21nd51CB846lcbp0jiNg+nzwUWQpTwo1+CADGjk/1asEtc2K2MZH9HOFyF0/T4u786xXKRPTkw+
	4oqTdz9utGoRQA/PFtqHqIhqtc2FOeuNtcqadjps58mfO3UpuxLHwJWSzxUVHTStjpUQwHr68w8
	NsHCVqAhcm91L7dQPA8wbVWJZzDR/QzNkKKqkz3DoIDfS+J0T7aW0K+FhSHdhq6w01EGHN/6q2f
	4efhSC6a7jKCGViCDm6eYFDktvEVKVlXfjTvX2TKSeyTUo3+XXw==
X-Received: by 2002:a05:701b:4511:20b0:143:296a:3ed with SMTP id a92af1059eb24-144f92e1a7emr834569c88.24.1790119208839;
        Tue, 22 Sep 2026 16:20:08 -0700 (PDT)
X-Received: by 2002:a05:701b:4511:20b0:143:296a:3ed with SMTP id a92af1059eb24-144f92e1a7emr834545c88.24.1790119208267;
        Tue, 22 Sep 2026 16:20:08 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96f47d52sm1412845eec.28.2026.09.22.16.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 16:20:07 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 16:19:58 -0700
Subject: [PATCH 1/5] dt-bindings: arm: qcom: Document Maili SoC and its
 reference board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-maili-dts-v1-1-ac2b1b76bfd9@oss.qualcomm.com>
References: <20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com>
In-Reply-To: <20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790119205; l=898;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=eThQjenGT64SgHD+r38689AieVgWjY46GmeXWeTOXts=;
 b=6+17yGkGOYHdda9trnjeOawzjIa09iBG8Hv+8d2KDKm2X8qxA7cHZHZB9zlVB/zq2o2+h/ntu
 ItBTVbJIXyfAMedj5MycJWtWg3JwaLVX/cMqZCiC8fPqf7E6P0r3nod
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwNiBTYWx0ZWRfX8Agvbv5qHpdL
 QiTAwdGtFERXExXZQ3tTggTvnF+M/5HCTdy2WMTMr5beStaEI0GcPbAcA/CgAsNgyswJVuqFwLd
 gGvNO4kOTofw6Q9EibyZbwr/B73P5nI=
X-Authority-Analysis: v=2.4 cv=ZYqIpcVA c=1 sm=1 tr=0 ts=6ab30d2a cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=nEm8NXYsWs7wjBKNTMkA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: s2zZcgG1HZLV58mvbeT9D6uXdaZJ-YxJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwNiBTYWx0ZWRfXxETI3wZwWnL2
 v28YVJboeAqRhqwOpJACs+hDYjD6SfEJm9P7Em9i8TOmDjocOJtDSpXekWfW0P7jpxv4IigvRHO
 0h9FxB0YeclSOxAOXV+rYFxJOYgNvhco0hBXdYHmvG7w0Q8LlEcIWadaBt5zS4e99IVnODzeVSw
 GS7zRTljnLLRjRoDIQMT7kGDCqQEB/7oXWrnOJ+7y8uIoUTv8HrFOyChW3wxJ/92rAufTuYGfCX
 336R9BwCG15q+ohIWWTvxzJ1+SxwL9Hi76Jk5nuU6WqJZgUryYxR2DptfVY5pgrOxw5sJGPCkj1
 MQman3lwEvWXrEDB4FZ0B0hZPBp4pps5eTE56fzh7lz7Y+rBcAtk3/c7dAbwh8TmAPuPw6NBQ13
 pKmcp5c14e9uO0Fh9fqjSd71xFyTOU02MLAril2aaMIwqHYGGdt9WpJHRHFcVjszogZqmV/F+kG
 d1qoszWWjppxfdwasaw==
X-Proofpoint-GUID: s2zZcgG1HZLV58mvbeT9D6uXdaZJ-YxJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220306

From: Yijie Yang <yijie.yang@oss.qualcomm.com>

Document the Maili SoC binding and the board which use it.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index eddf87fbd0cc..0e6b4fd8b275 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -187,6 +187,11 @@ properties:
               - qcom,mahua-crd
           - const: qcom,mahua
 
+      - items:
+          - enum:
+              - qcom,maili-mtp
+          - const: qcom,maili
+
       - description: Sierra Wireless MangOH Green with WP8548 Module
         items:
           - const: swir,mangoh-green-wp8548

-- 
2.34.1

