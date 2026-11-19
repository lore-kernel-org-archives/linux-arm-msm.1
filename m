Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795065219;
	b=SqZjDiPVnciRQxwGzfgihyYBeEPQzA07zmz0ao3WoQ1/5N8krk8CDnndbkAmkATUh3CC
	 yoe2jJHdSLH2PVZdVxFKtTUC78RAPA7IDKQL4JKys+dNaRgfRbMcF3DWZoxIH3EAgnxFL
	 zTIR5Km05shdr3eDi49UUgy29iQOeRcURfFMi8pLzSCk41rDISFPA/1KRH+izIhnNDg31
	 23re0ucs3jfrQUzVg1olkGJQ/yiVr9ZILhvPGJZP7bZHeT80D//0tEiPzb5MBqDRdrgYi
	 NY+HqziNZDPL8KuOMKdNpvQnA2lMMHmqLTnv3QckCsC0nj7++C4+us8hFtd3IsZqjnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795065219;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HNGeX0yPS5rH6fZiczxmSQEFAyKjoqqOiYpeLK2KJnQ=;
	b=bm6/q9JmoPvpMyZU1Ne1tunlAzSSuJDwncjKZMnwRjNYFqzHG2QKRK9Yk3bREENUDIDY
	 v5E1/wOnXizkkFVFLiQ2tkQ6tQ1TOLQ8dW4P+hOwFDKSGnTmaf7gS4UymtJjkTsr/td1c
	 6aKrV2hgIfLe1roQi4bt3hg1em/IMItSqOa083T0Jtz2uieI5DnHyF4citDKqH2AyYmvz
	 ICfagxO1TuUQSmNAF+XNDKc9hhRan6K/rXBomSd1n/udV2zvrCDTWdOE5IeFarti23Bq2
	 vE16ZFfTShyplydBqpSjcgmvCAiV8ybGlI+OtoGd4rBc7eVJIZMf2olb2D72bOfnCdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="gPG2qj/e";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PK9eUgVV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268D6606A338
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 05:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 268D6606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gPG2qj/e;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PK9eUgVV
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ1AtjZ3780056
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 05:13:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HNGeX0yPS5rH6fZiczxmSQEFAyKjoqqOiYpeLK2KJnQ=; b=gPG2qj/e+y1JI1Y3
	aVYT7ZDagZLbG+jsOohIBnb/6uFw9XSmF7zUet8qAZu3uM276S50aGW6p4GPidoE
	IVdaG32wZ8LOQyiTbBqpDLNZj/PDcbXS8ireBt9li/ChNMquIC/9CC+8XR8m8TBk
	PLUtZeb6vMEMHXCF2063wOYPP/kCPvTNgufLC36I7efbhho+JS3huFVrqXrhDLG9
	E+vMiVtzi5xEqxQhqEHb28MiMJ//nU1k3cOFs6jPPtrSzKZ3xjHiMMUh/QsdAary
	ake8Wbtgy7H9cr7jvsxwOO4QmE61kRXIkHAAf28B8SU15qVsx6ph4orckXklS2ND
	Hfzpyw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1fpnjq4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 05:13:38 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed1fbae872so21748135ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 21:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795065218; x=1795670018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HNGeX0yPS5rH6fZiczxmSQEFAyKjoqqOiYpeLK2KJnQ=;
        b=PK9eUgVVWbsfCTaGzOgFqXcCUx0G63I4+a8P3opRW0MHlApndDWcKbAwyzaMyvSc1X
         R88oeMt6tlKGkE04bQQt9BesG7ePeRUD+QDYMUc5iStew4B4IYvnqxAhCbMZoQzwn40z
         QLo5xThfjFQ6SbMkkep1XRlb7kdSJrrZp/vkfc+h5LTHlUpx6Mm+erlXyLqiCFr+qu/y
         nSH0sRDkGU1tXPJsZ8YCp16/jZzD5VTVhnxPZk8pLUmPdoSZhZ4X7rKbU6Z3wrPdfkOZ
         RI5fQ6wC6Tx0mnVQ4s2bQ2f/eihLIB1c7jz+E2jWBUFYSVbfXKnEae0o6EMX7ZIHVw+A
         +vOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795065218; x=1795670018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HNGeX0yPS5rH6fZiczxmSQEFAyKjoqqOiYpeLK2KJnQ=;
        b=H7slE+o+PqUlz7QANrc4ADgaPMc7K/nwQl1oRnYy4Nthd0w+Pxjv7u6JEAz7A9Zekr
         Xqbar5e6h7E+crH5uzV/nLWycbvkq7aVC8v+22R1lV+Yu2M5cT/lPbf5iUnFEHKNCZo9
         /xFj2gwBK0UyC0eU0QnIUP81WkTgG2bIe4Z/U784+GD3rKSLJFRXAtep/WYZ+SzCSYOJ
         jkR/tRrGCZXrT1BQTmlkKmvM7GkrH/EQJyRGEMDpSarui67F9f662/LzjNekc9Bkze29
         Y4K5trRof32JBdSZ2z7PzArLUrNCN7WpVrSQiOLEv8Vjmf4po3uauji94sczBgQ22OfB
         6C0w==
X-Forwarded-Encrypted: i=1; AL+hErFDSuWsQTNsrIk8QEhJng9gQF58TPbXCkbA1gldk6Ta0Ln1QI3ABOj5aADkpTrnZvGhBVBuAbWug35k4V2g@vger.kernel.org
X-Gm-Message-State: APuU4Z8ESkQpcPUYqXGkENyDFs2FN2SIX6NXY1YnZZ3oBcQFGDLewEFs
	6l9NhoavWM402ayIYjkG8TTWsBWN1zqHDdSwBiY3Iz4nm5BNRSTVv3DAR6/AFWXiiUCMm8987Vh
	goCo97hgoC6lVvGciUZORtwdTGesSqrWjyFHsbvSiBw2GBEjDqmRFPkxaNMZeyEBy5cX8
X-Gm-Gg: AZFdTZemEvhJ+6Ad3Xfq6GcaIzfvSrTRDHm1kZIQs4+7y2Z3gliQQq+qioZwBRvRtvF
	vMoYu+2u+aGlZpQtQftVf93hWUV4pzTTVQq2mV1x0pf6uP3IWz/e7P2ZMxTjjdZntB86u/HRi1k
	uxehgKa+oymYGWQfUiYSZ5Qr8dMTy7z568q+Vd88Us8QT1rgjqVcwKxtLuW3ietyYTQVMl2I7uo
	vZu79P0/FebWRN552iqaW3qdew18xJyLmmFM9QQZM92Q7hKcdLDSRJV+DkYHo/OJ96IW9XtyLnx
	IUz1TpBz1mTduGfuTtYk+c/+gewVdL1WcHgSQToqat7em9lbaiEg4A3Rde6uFiU+bLY8q+GQNq7
	Bg0cJUw30uPdCD3/YrAXBVlt8brVJql+J62LD24qfXvKNI4kn3GBXGL92NplO5BZ2xr5MhZsCZO
	HCmx482H3/MX8xMje/2V8RbwecaeBpvEP8wUvw+1G61gNlrDU=
X-Received: by 2002:a17:902:d2c7:b0:2ed:2305:5244 with SMTP id d9443c01a7336-2eff752ec1dmr51306765ad.46.1795065217896;
        Wed, 18 Nov 2026 21:13:37 -0800 (PST)
X-Received: by 2002:a17:902:d2c7:b0:2ed:2305:5244 with SMTP id d9443c01a7336-2eff752ec1dmr51306435ad.46.1795065217360;
        Wed, 18 Nov 2026 21:13:37 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff622c0a5sm24067185ad.50.2026.11.18.21.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 21:13:36 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 13:13:24 +0800
Subject: [PATCH v3 1/5] dt-bindings: media: venus,common: relax
 clock/power-domain/iommu limits
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-add_iris_for_maili-v3-1-d47d047a3f7c@oss.qualcomm.com>
References: <20261119-add_iris_for_maili-v3-0-d47d047a3f7c@oss.qualcomm.com>
In-Reply-To: <20261119-add_iris_for_maili-v3-0-d47d047a3f7c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795065207; l=1484;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=Z4w/efAzsLElawBC0itHg6/jRqhONxnL9NTi97sv2Sw=;
 b=hk9Y00LCsEcX8bq6mIJrgePHBCHPIEcDLByixiBwPAQidz2O7Px0J65BDw67MCnbQMmulFC+Z
 asdb6XZuSTbAk6/cY8s/1X+VsBZZUoFPe1Evwl8IturuKM/ixThtEXh
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: CG5oe-tdP7RqXUGma48YIuFPtYMxv9Ci
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAyMCBTYWx0ZWRfX5iTA5hUnTEer
 Nwm1cz3CKkuMnB5CtxnvM/nLmU45YLsd84ju1qZ9wxjASiQOJ8WPwTW3Bu+Gr4u/cfj8L1PaO+1
 /GCFN1U+cwxlMXOScafS3iwre0doUZosNWA+1VZJjSlOV38H2cs5dWIfEIzCQwPglX68owU1H77
 aidvZxhCcp7HjNavONis0Pbf0uk2sJab96cKdhxxsaBwWfTr01brmBzhQunXXcU3Jj3OjfV/bjh
 bVd/wM7kdI0c0OTF8bGVfbBeRDaLCJxzce4jwleJsINpbgO73AM5XxjA0YDv34/LMyjKF1bwp54
 eNikfUDHjQplb+GqCX6P+s7sNPhL02ftkVti1YR4TkBeLtHLYM0TqvXHf7jUQtD+2hvTUX3JCpf
 prt0bUqTaB2zcO2nUy1znwYvtzC76Yba2Y9kN9Jb8skzBOvpfkv4FGck1EKWArFvYudZcwJHDgj
 DLCRWGgqJsGSh584Jvw==
X-Proofpoint-ORIG-GUID: CG5oe-tdP7RqXUGma48YIuFPtYMxv9Ci
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAyMCBTYWx0ZWRfX8hC+Ien9kxQa
 eByZNWy3SOElN4BG/u5cGokZuTuV9q1vpiYoE8OTsqRV8d1EYs17tQAKAMJaOEYyvt6dTY/7yYM
 CXCPuk2vA0bNIxMxg1ow4XPR02DyoNk=
X-Authority-Analysis: v=2.4 cv=PJ6aavqC c=1 sm=1 tr=0 ts=6afe8582 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=HhAAYa2kYXLYgDpgJ-QA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190020

Upcoming Soc's Iris4/5 video codec requires more clocks, power domain
entries and IOMMU mappings than the current limits allow. Relax the
common schema constraints to accommodate it.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,venus-common.yaml        | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 6c205077bea4d729335d7a5690a57bc1bb43ed9f..48f2bb5eafe3c2818a7d361b9e0459ce656459a4 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -20,11 +20,11 @@ properties:
 
   clocks:
     minItems: 3
-    maxItems: 7
+    maxItems: 13
 
   clock-names:
     minItems: 3
-    maxItems: 7
+    maxItems: 13
 
   firmware-name:
     maxItems: 1
@@ -44,11 +44,11 @@ properties:
 
   power-domains:
     minItems: 1
-    maxItems: 4
+    maxItems: 9
 
   power-domain-names:
     minItems: 1
-    maxItems: 4
+    maxItems: 9
 
   '#address-cells':
     const: 1
@@ -67,9 +67,10 @@ properties:
 
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

