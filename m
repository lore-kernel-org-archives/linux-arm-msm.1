Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29B34DB55C
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 20:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786049861; cv=none; b=jD9GCElxKeNnBY/veQaB9pFWtuK3wgQf74HqWfIfmAlIcYhTqh0+r5dXLyFerp5yscul2Tpd09lH+dtUW9Iw2mVTsFLBrVbuBFn+95+WiuhtD0XfNkvnixs7xG1Ygg8Pgor4khYUcagvuJdjqluO79aylF7zyccbYdayJxNR1C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786049861; c=relaxed/simple;
	bh=MD5I+VArbC1H63/X/zCUsjSZIDHA/CM8wfB/bAIAthE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yp8VscT1FKJ37E/P4r8glScLnNfFYQx04D20SzCDgTMZD6Rv4+Op4ZqkfvBk/gUvnPbFneu5Pk1SDW2A9AaNpGNcpXpcHG047vaqityMBKNfKyPBZzSie+EP05l7bN/+fUSn9+ZN9GteQ80VRx7Prwmx4l0VFyRhocL4LKvCg8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pXMWxeTh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I6VCRhny; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pXMWxeTh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I6VCRhny"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676IHwP92704701
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 20:57:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6bBCWNJUB84UpOgg5BY1iXXPsRYauvBdtILg7E28C0U=; b=pXMWxeThI8cjN0uv
	KVt41gCnjEEaZUSn+V9h/n7yxFekG++alz4My9Prgow+7u1dpqvcGG0Mll5KBU8N
	YVkaHmrRM1BL5v7ZhNSMyGGrCQ7yg6UxidXoHwrCHs0tAcrtNMi5qi9nOEvy/f0T
	qjR9i6qeUsXrTQNKa52HOSz6WBDTC/BD3fSiPjFgP63opEYRYgwM+0fQGjj6VQDS
	wrK6z48DLo3KOe/fk7m5UoZeD0o+FBJnwxBAnEASh0lO41e+Rai4g4XXBzEUjUAZ
	9elfmQXehYDvdukvF0dxN+41rzSS04tQd2Qy0t/5G4Pj+9NiJCaLpFUEL7CiRHMl
	6lZ4kw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6h8rfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 20:57:35 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb7d6ba548eso2952382a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 13:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786049832; x=1786654632; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6bBCWNJUB84UpOgg5BY1iXXPsRYauvBdtILg7E28C0U=;
        b=I6VCRhnyaIJTd/Kmx98Ku10nhPIBTeSOrIhnsrA7tNHuAcKQbNnfyOi7CQypBSFjOR
         XRmV7HD1eEFufkGATIy2ZKYMVI5b5iAFB1jQwY9UZ2IXCa/KPl0HIhoEXywzvf9sUHJG
         ncQajP6yuhxzHAP6d6SkSM2e2+vqAjEHwg1f5SmwqOaSkL3iQxyBUqJ/+A9IfGloYAsL
         uIGmEc4T0MTcShP8dAxxvpTi+OFcQkybiTUwiDlYRoUPYeAf2pZwGAyq8doE+eOsud5H
         15wLWetNyc18J2mW8PoG5JvFJ0CJ9fMaOCPt7sbQM22dNLHCM7hxMRZl8EN5pWSZsB2a
         i7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786049832; x=1786654632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6bBCWNJUB84UpOgg5BY1iXXPsRYauvBdtILg7E28C0U=;
        b=YqnQ78N8b4gpi9ifyxntV5DebUcuglWIwVnjKZ8kGomjWfPO5vQYgXyZJAhjPyTg4K
         RawJ2LMlDwJzfVS57A9Mg0RgAWnppZddOnCzTWyKZXdyAdvQgeZyYVdY0JuKVP4gPZDL
         xBlYCJnIfw3gsa6GPUoUwR1txf1hW29qi/QGvQuYFzQZflOJFM/4q3ynAQUXDH/zj3Hs
         7bTdhsCYbaxxPQqQMzQU/y/3qyZZuPZjzXXb10KXuvOuymWzlqwdNoEabhanG6XoGaG7
         oEXS5SD5hv4NP94TcKJtr+SafmSgXsfgRVUC1B3CJzdVX9/YExtBWY5UvGsh5KpC265F
         Ij6Q==
X-Forwarded-Encrypted: i=1; AHgh+RrHkCuqJJr/6UAsD/2v6+0CmR38kgKbBS3ZxgxwLGWCVA7NM0k4KAfE1KdZbiOJxV7SQXqqQdrkke7oa73y@vger.kernel.org
X-Gm-Message-State: AOJu0YwZgt2ruaGrRnEPBWfOso8WrA27pxHaDS6RpGUy1zKKTZwBE2ga
	pIGaLUNx9vQbzoHaI+SK9I/X1AIsnN6tSry6vfMYTUSYDH00gdLDPdGHseF/gSJZjU0q5BdHCnq
	tpPyALPcrZT2rxY0/da/4JZfUmDfyKa66Y90WSZQCa3ZnXFZ9cwaVNPlP/Gzl1X0xkazjR/uY6h
	WE
X-Gm-Gg: AR+sD13tI06Gr3VF0eRc9xxRXH5OuvqEDrAlUiY8MhKSQfbkCuIxonPqPJLOQdWNCb4
	o7CCjuUJ6HgJW8+yX+SxT09FFghw4jgM3pGYKvpaSyfeUiG+jS6IJb9cTdfo5icpxtupepFg42L
	IkgHESuW+XPjWPzwzPPTznn29a+g2M8gcCtdeguf3URN0SSGKD6bKzTaKja6Twl8uQlkr4yfVTz
	VpOP0PsaXt22yWWzyJlQrpQ5YosY6QjvXAB/6vlKlM+8EBOUwgkjSVH0xRTs6YlSOHTSqS2Vu70
	VjIryzVq7Ye2tbsSYGbB4LzTzHuDJozxsG95HS7yiNpVtnGdkpde7bL/G7sMzdH6lSZTwLbSnwH
	/aRw0pQXDKWj9lfkwW1y2b88dBBq29g==
X-Received: by 2002:a05:6a21:3a82:b0:3c3:704d:57c4 with SMTP id adf61e73a8af0-3cb85ded954mr22189216637.12.1786049832151;
        Thu, 06 Aug 2026 13:57:12 -0700 (PDT)
X-Received: by 2002:a05:6a21:3a82:b0:3c3:704d:57c4 with SMTP id adf61e73a8af0-3cb85ded954mr22189169637.12.1786049831727;
        Thu, 06 Aug 2026 13:57:11 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bc667f1csm116641eec.12.2026.08.06.13.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 13:57:11 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 02:26:30 +0530
Subject: [PATCH 1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Document RTC
 client properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-rtc-glink-cleanup-v1-1-7801e4d69c4f@oss.qualcomm.com>
References: <20260807-rtc-glink-cleanup-v1-0-7801e4d69c4f@oss.qualcomm.com>
In-Reply-To: <20260807-rtc-glink-cleanup-v1-0-7801e4d69c4f@oss.qualcomm.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Raj Aryan <raryan@qti.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786049822; l=1194;
 i=kamal.wadhwa@oss.qualcomm.com; s=20260406; h=from:subject:message-id;
 bh=MD5I+VArbC1H63/X/zCUsjSZIDHA/CM8wfB/bAIAthE=;
 b=toKd43o3cpn3nv/npS75mCQTi7r5OfqMdiI5G8BIj1R7PIQ5xV7RIwoVj1UMPgF3Qou2XZs9x
 i5Oan3QM94RCyASDrn89qABVFr5fQG+1RxI6Xurwxwi+OueBp5D37LE
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=ylH1NxUZkBpYsmww89g6zVxpS0q8qthtzcORkYxn/Ag=
X-Proofpoint-GUID: a4QYu9TLP-4aJiEtu3k_RujYOpNEuooa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDE2MyBTYWx0ZWRfXyJPQwM4qf2qd
 iHuEsg/9Be2IM3NQHmFyJKj4CLu1INSwIgi9J2rZKfh3xSbhXGSEzojoI756g1P1gQCPvdcdsPR
 XDDZrZVSrVsNFZIyOvp6i5/E4DIji0PZbZRmfofoKxDGr3xoQOmgGuzpzq0nY4UcUSbuz046Aud
 uRvmKMB7yviAwRnGRSAgSUoTym00CFoMf4nsJB6J1XNEMMPyJGHX6RYxnGzfFEXR/jB0Z9mRpzD
 yYw9iexODSAYmU0YoaXuG/kZrroBUq7TrQ28/V8p7KyBrSpNo+KLltUYnyLqph7PiyRQf3l/ux2
 lm4bKNnOkT/el8yQl2+tWOavWcB2M7d+SUpfa8vBsSAH0fd7ZsfOpz6OxidVlk2pN1o8snNPH0I
 Q4EvLNrNAHX4ZFcYGIJD7sR6iFcAbAUjq3Ya5bZtWTqQUAe/p4fO/VG1qHi/XJ362rCZ55sbBzB
 ecvZHHhOb2E/yWdO0Mg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDE2MyBTYWx0ZWRfX42Dr3JgC6OrD
 iNjFlLf47StZbX9AnaAYdw35wYgjqU2oMUHrVPTy3i7OeL8Oi1V5s92CoZQDyIxWtmjlZ6mx+Dx
 XYLyAtR+YhRHtZUunC/m0wHTwe22DQE=
X-Proofpoint-ORIG-GUID: a4QYu9TLP-4aJiEtu3k_RujYOpNEuooa
X-Authority-Analysis: v=2.4 cv=MbpcfZ/f c=1 sm=1 tr=0 ts=6a74f540 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=qoOW9mG7lyo1mN_lm6gA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_02,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060163

The pmic_glink driver can now register an RTC auxiliary device on
glymur, whose PMIC exposes an RTC over GLINK (see rtc-glink driver).
Document the allow-set-time flag it consumes from the parent
pmic-glink node.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Raj Aryan <raryan@qti.qualcomm.com>
Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index 16ad4f5698fc..38db1ff473c0 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -79,6 +79,11 @@ properties:
       - const: charge_limit_end
       - const: charge_limit_delta
 
+  allow-set-time:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Indicates that the setting of RTC time is allowed by the host CPU.
+
 patternProperties:
   '^connector@\d$':
     $ref: /schemas/connector/usb-connector.yaml#

-- 
2.43.0

