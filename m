Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62191481231
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 13:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390853; cv=none; b=PtvT7gmbQ2Pp6jLVpmj9QmLYddaxjUBEg+ibkgS7yMgWkxUeX0/meuvHcwELKRPEts57fWBm70rIls/KbtBgAAHzXFFSMOuiSfdgjTXftrap0qWJyhrvztFuF4Azp0ScWQ/DboA3pBwUKcHRC8gmCk5m9w8e+RAryrKJGLANycg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390853; c=relaxed/simple;
	bh=Fta+Tz15bh+Fp6unIraecN96k8cXVodoMPMtZjdanRk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=un2sMLBXvDCN+XzfZOABUvrVSJXtrW1s6nid598Ayb2HWgPRqlVj+EqFxVUPz5Q/Njg7wPZNJ3iaCXyFu+XVc+E4I9mcgdlHWcDBd+VLlNKK7nfSh0CBg2z3AvVzExapuyUpYtSJ4gsp2R9JeSyJTrtZc+l+hFCDJR6YHayeiAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cNojXurg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UZmV0JKL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cNojXurg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UZmV0JKL"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0khW136046
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 13:00:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ijQGpz4rs8FjLuQnD7R64L9WUl2bI0uODBu9d90WLPw=; b=cNojXurgA9MU+bRR
	Y+drk5sC+6uKxo9U3KWD6nWH5P+ximBn88815WdQl4ilNmVCF3NKpzZsGclrZQmf
	mlpNKGGPlm9a5fLwG412NlnobA0fLhIBYJwym/PPF4XU0hAqGUgINC/NBgGtf1x4
	yjzwJPjrICk/+KyJL2BFMl67XTpuldavuF7731wtbF95D3G7IovZKFguuw/6ms47
	16SgkD5bj3PbgTfgN/GN6WPobhOU/kBjG87wTtLiu38QGLYuQJSPjNLWk3iqIILb
	IofDQ5qAHdBzWjkBo48SG8XepjFaXeVnJVQhl01KKFk3ng1wXlnTt/MYIkS3hNqq
	nCZV6A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuq8my0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 13:00:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dc92350888so55288895ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 06:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390850; x=1789995650; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ijQGpz4rs8FjLuQnD7R64L9WUl2bI0uODBu9d90WLPw=;
        b=UZmV0JKLIvoJX7/9hLjhQkf6a0AskRPWUcfUxoS1m6NkAIPabkz1B31D94/1EOp0mC
         OyB/NzI03yre7qtGXF+Cl4sbyEOJWte4SSnX1hwWygQ+YNWPp50OcnPRjpj1+14zFGsE
         VzsSsP4fDqd04KmyqyxPc6w+YVaLkHHKA4XqDcemGPnBAPiJuPmKjj6yhNRL9n6veY9+
         58dbJu8+ZS52erOlE+BRrSK9xQJOF+EO9fWyFoVcR10yoOpknRLeiuV+Hv0IlmzaGBJa
         8y0Pcz9y7I+damwOMaVLfu9qDT+bHDB8TQWA7dnb84TPcS2WXj7gFqIIR4txLYD4SmLK
         PbpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390850; x=1789995650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ijQGpz4rs8FjLuQnD7R64L9WUl2bI0uODBu9d90WLPw=;
        b=Y8zV6OJIdoRJm5UN1aj9p+8PymP2mqeZWG8REMvKYJvWh27FnB11zw3Dly/toO0trn
         4ZFtT4m3pADNzfwGmjk2PGwRFxhcmEYVyB74AOgyl4Qtc1BIPRnx7wBKXJ336chys2fw
         E4fpHdNPFKCVZkqpO+4eweFJqQxeS12myictUf0u9mvfo5DxOHfOZ668Q4yms6LSVmVs
         ayxlaw6tLAvAOxQNJicCV0qU9RbcrQKB6AY/sAQxmA1luCZLVY2i/rBVUhc6oXsnc2Gl
         WkZ8JbCpAmuYtrbMN2cPbVTReYf3KH+dv7sNhIbwWbbwMcmxDmpsbd4jXUQmeHpT2/7e
         gORg==
X-Forwarded-Encrypted: i=1; AKwUvBz80E+PWk98XuQUr1x721RB7n1un8g7OqtZUo3FYDWG6gwiONILAgU9/QHclyh9Wl3nq13AYUDyph3PVO5J@vger.kernel.org
X-Gm-Message-State: AFuF++mip/jO6ue4bjS+Lfzk5y3hbqLF6c97E72NZSv5K8zR1dOXz4F2
	5wBuaDKypcUVignN9jjUI1ipFb5vIKohiabPjFYdP54ncxU+jcLTZHXsyBQxcwgL98+CK5AHCOp
	I124NnLEjyUFs/sqwnL9vtXvfoJ591jKneADfrl0KTFd/X1km476Uvok14G9GVTyTgqpV
X-Gm-Gg: AYBFou1+4AGBrqGWGyc+YtW/Guo67I8ENsgswpOMPRbnthYdFWvEIpNFVNcb1FezUl3
	nK2oKcr+rILZ57//ErvGrxSXjWJjIQGK+cNYReR2Xo+W2O1C9Qf9V7rM3GnkOXqw73qwURx+duz
	w8qy0HSuP1d1nvNcxbI1QwGCTLdVA/Hb3KmIqQrBydPASlHetGlKZlwtFdyt4qewcg/1LXpDJ6E
	cgzxQOayfeJrin67Gzro0KpeUpkME2j0rTOZaneDrI0USwufbcMnriPb7jtXVOTvY9VDAcQHhTP
	XMq2pryrpJD4UQpRnEZ+lXStkb7UCdGuO7k17dEgJYHQqMkzwfFPlXqbcBs9q7VMeAmzo27Aip+
	xSrzUuGRyb+HjRz0NI9jQlB6KqTfnf1uyfVLSKZIvf7AhtBmJUga+KgA1bzKCHmfJwxKKh70tBA
	o=
X-Received: by 2002:a17:902:eb83:b0:2da:dcd8:713d with SMTP id d9443c01a7336-2dd6c6fd8admr45496285ad.15.1789390847674;
        Mon, 14 Sep 2026 06:00:47 -0700 (PDT)
X-Received: by 2002:a17:902:eb83:b0:2da:dcd8:713d with SMTP id d9443c01a7336-2dd6c6fd8admr45491345ad.15.1789390844637;
        Mon, 14 Sep 2026 06:00:44 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ceb6861sm47434965ad.36.2026.09.14.06.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:00:44 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 21:00:24 +0800
Subject: [PATCH 1/5] dt-bindings: media: venus,common: Extend clocks and
 power domains
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-add_iris_for_maili-v1-1-09df2b54c317@oss.qualcomm.com>
References: <20260914-add_iris_for_maili-v1-0-09df2b54c317@oss.qualcomm.com>
In-Reply-To: <20260914-add_iris_for_maili-v1-0-09df2b54c317@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789390835; l=1679;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=Fta+Tz15bh+Fp6unIraecN96k8cXVodoMPMtZjdanRk=;
 b=iwSNuOPqbJv6D+SAiDEBHreRUNDZk+Ew/pQIyqqMSmmBcRmRvQFx8uGMijxycCtrhJkTwDgqa
 oygkshC8yPgD3YxXiTvlzNniyUi3PJrp78lXAPC/2S7xtz8gG19epPF
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4NiBTYWx0ZWRfX/138jq4ncJdp
 ++gsr+bH7vtMJyO8eRHXrxLxUR9gKamC0WRgE9n/vj8dSjZk/gjuk9OJEw5lc6UEiEHszz4OrLG
 Lj1VAFGyarliDIABgwJPBF2q5EKHMc/gyc3NZ9YXGY8We/3heJpSNUJ9raG2bBXqMSD1Ks9aM8e
 apiGaAMb3SduRbo0odbvKDHAYzMaP+FVXFazxyku9VlcqLR5wbYilQhFWY68bwfknrO+G47h0oI
 ZdM0wp0Z1SHw/XkCANVjjgWXaQWf12KdSqQxAhtdUvtP8IfPG8vI7mIkd6eEqY8vbaYNtcVlFPr
 Rv0xDv/+0qg1iXNkzKygTwX+IRKQt71kJyLNqmbqQnEPpdQbcoPc1Egr+k4dp/2N6mcAqO3NDu1
 98cEU4AzxP5jxTsgdPfOTiG8vN2xrLLYFEOyJUq/scb+3WfQu8J41K2tSYBeLbind7CWH67UFVL
 KFdaOlvRTNl88Xc+a8g==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa7f003 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=t3Xd9w1G4aITJWInbQMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: QPbU56fHY5VCZy2WVsRaDEZki8z8v-D6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4NiBTYWx0ZWRfX0qAa3ltuARJ4
 no+HnG59Keou25TUixzqs7ksqNSIpf2PU49lOHgB9QO3Hf4gK0W1sT+m2uWvKX7mfHO168fUD2d
 emdz1oWHmPNwTFD7um3KrZs9b1p0GDM=
X-Proofpoint-GUID: QPbU56fHY5VCZy2WVsRaDEZki8z8v-D6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140186

Upcoming SoC platforms require more clocks, power domain entries, and
IOMMU mappings than the current limits allow. Relax the common schema
constraints to accommodate these platforms:

- clocks/clock-names: increase maxItems from 7 to 8
- power-domains/power-domain-names: increase maxItems from 4 to 5
- non-pixel context bank: add minItems and increase iommus maxItems to 3

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,venus-common.yaml        | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 68d5e592a028c5eecde04ce72cd5ae6815ba5c82..795ecca21bd6bd05b5e0dd610c749857d22ad1cb 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -20,11 +20,11 @@ properties:
 
   clocks:
     minItems: 3
-    maxItems: 7
+    maxItems: 8
 
   clock-names:
     minItems: 3
-    maxItems: 7
+    maxItems: 8
 
   firmware-name:
     maxItems: 1
@@ -41,11 +41,11 @@ properties:
 
   power-domains:
     minItems: 1
-    maxItems: 4
+    maxItems: 5
 
   power-domain-names:
     minItems: 1
-    maxItems: 4
+    maxItems: 5
 
   '#address-cells':
     const: 1
@@ -64,9 +64,10 @@ properties:
 
     properties:
       iommus:
-        maxItems: 1
+        minItems: 1
+        maxItems: 3
       iommu-ranges:
-        maxItems: 1
+        maxItems: 2
     required:
       - iommus
       - iommu-ranges

-- 
2.43.0

