Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA2E30FC12
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 02:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784775363; cv=none; b=J6/idAut6BINEMY4nUcq9IJRHqQLU1T9eIy5zH/VLEeryugyeUnfkAKzim7wlFeXVvoa+hUGwIeXaeQl+y3ScMgtUNiCAxigIsvaMbMAsyuuCpb8HK5Mm4eD9fIQN1loOLgV/aVYqx84cIDaQPGQHShYOTnS+qdE9bitpJCUW1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784775363; c=relaxed/simple;
	bh=fitKuoq3f0JyMs8K6A7V2u0qijzshEjj3lKDbMsxf5Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UiSW162v6IpZLrmm/w8T2FfSWfZswqOkEkfX/Ap5hVzt9YWB7g0Cgifqx9+3avEHFwVKQIgoQqe7Ph0g/jtrWZegwEAPrKTjeXP/qJcge+FaN2B5MwPEVhwSAG7teRLQSWYk9FzGtt3PKwzUmfoGl7uKa/5OSlszth0S6Ow1e/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FYZ0SzlZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BZo9TsKN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FYZ0SzlZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BZo9TsKN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0X5LA2518803
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 02:56:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mlMFXOUkVU+3nCPYf3vcrl
	NLG9N3WolfCVeBQy9I9u8=; b=FYZ0SzlZZncaVx25lLZUHdcY95Y7c9BXzPqa3C
	FpIiqIXZjBrHSR6WZmCprp1Gvjgc90qCu/jb9QY8+kmTWzSuicHgF5p9MDZcO08B
	5wJM+9fXLl8Wq9sCEob70ugyptHZCAzAKxSr8Wcc7ucHbF2e4XBPTUqGIVZDUmDF
	HKKRSFOlCD9d4ZLf9wxwGQUjgAy8h5pr+SQU+ZdqaOQZjaI2qglg4qRQghf6MYQU
	J8fk2E7J0JahYexuOZkA5nu5Igq4AGfRgErRr/2CXpuvPnzCybSPS44LiqnxMrTR
	8K7ya0Vy0nJpItl2sz4pEbdNtsxvpytpTpBDVBjlT7y1LajQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjt79c65b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 02:56:01 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8484ba00601so235445b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 19:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784775360; x=1785380160; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mlMFXOUkVU+3nCPYf3vcrlNLG9N3WolfCVeBQy9I9u8=;
        b=BZo9TsKNjWCWqTzYILp2jpUpKR0g39O5uWJ5tuxSxfHztkdzuHSF86UuZ9iY4QQJuE
         ApoyXKB/wjTrMS03I8EhzeJ1vbLqw/CyHBZjOvfOxJZnx9/xALhSzzFsceLiJj4Baek4
         VOTqknMckEgTNPrmtp5DHJ5XzPj/xyYMKiff76MrcRMXkOo+wViBasmuDWEt2K6IwaIj
         q13E0NR4+YlASR/KAbqn/O5dVOw7BFul7CAxvFbV8rQdJzap4wovD9V74htztWPqNExD
         W2Q6T+npA4uuLy0M3sMOdcyR2ZSGPWhkODd8hzjajChYixwGSe4YmvGM6Eux4AlaIzil
         qjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784775360; x=1785380160;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mlMFXOUkVU+3nCPYf3vcrlNLG9N3WolfCVeBQy9I9u8=;
        b=JZkY0cNUiNm9a3kV19dz5iaGUS2Lc+HgWP+q9j4M1dqQbCWgvN8h0VHrzPVCUubhnV
         FP86HuEr/zUf0frp3SL2sZXUgDkNCJv6s/mOI44YLg4d9+OB8pfTPbqMLBcq2R33s/ga
         xLcTJX8+WjtsJZeqmtdJPi+kPovofKgB2CwG4hieBK1PMrJjUukP2A7OKa102H5y0jjn
         GykMoCAdGthy4nUtkA+RzVhx+glVPKrC5V+blrSlkuiZc2xLtqTJy6Jyg6cZJe10UcHo
         uz+VWjdNAhaFT2qBH8CnRSlCDzKAV3WP3UV9xasqRnptbHe7nfDxzcuFwmsu2rr1CUKF
         33Kg==
X-Forwarded-Encrypted: i=1; AHgh+Ro68Yd8iQ222OHb4bFPrnMZARSnQTdBVOuIHytDm6C9y5FHGp/zr+fGcL2p80LwhQVbtsf2RDH5L5LXMXGK@vger.kernel.org
X-Gm-Message-State: AOJu0YwyYasSjMK0vFYmi9iTgnpfTabwHPLgNKuxROMJLz8BQq+z8/Bo
	Apd613rhJjqbf9y+4fofo9Kxk4tnZyqF6RP5+mm2qqm2a1/9CiVtalzAY/hgmm01LyO0gGf8u3T
	5jNDMwCwVC515xnMwBZjLhn/QRkpX+Wd74Zca50jSznqx1W3Q0UBCCiA0jACNWilHw0/OaMlRZ3
	bN2bI=
X-Gm-Gg: AR+sD11fwVXfF11owHIlskEhngTlp+MTfcSMSLEQgefjw0xc8EPVHnQfKrDmFyyhwJr
	Yo8kt+EdQRdhc5SNhXrcTIO/l44uXjqY62s06AqwFtWEoRI01ChFV/gshtGTkMiJlB6Wqf3MLLZ
	iNOnViiaF2t1MVyJMgqmxmEM6k85bnEQjKLG4w90VDYUztCIrRdbYe4T7BGcNwFIWH/lt37Xo9A
	kYRYYek99gLngQZ9ubEqo2NJ1toVm/0ZqwieZCuOkFLz+UyJNrFZJyL0hEBzmuQNUeqPZWeyE6X
	O3WIFr/LJn1Ac0//MZmANG4kbBnZhwgVUP6RLMmxavJq0rlYFLVGlaswR2Bqwn9uwBaegWPpJWL
	hsSZb+tvh5mouB9+HGBMOZSOqQYIFGrgLubZBFm03AjQjAi7XY5ICMdyNR2c7F2bzp7Z5rSs3Ic
	E=
X-Received: by 2002:a05:6a00:428d:b0:847:9315:fb8b with SMTP id d2e1a72fcca58-84e2b7fd971mr1539634b3a.6.1784775360249;
        Wed, 22 Jul 2026 19:56:00 -0700 (PDT)
X-Received: by 2002:a05:6a00:428d:b0:847:9315:fb8b with SMTP id d2e1a72fcca58-84e2b7fd971mr1539610b3a.6.1784775359749;
        Wed, 22 Jul 2026 19:55:59 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17262e33sm2233312b3a.14.2026.07.22.19.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 19:55:59 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH v4 0/2] media: qcom: iris: add dynamic encoder properties
Date: Thu, 23 Jul 2026 10:55:53 +0800
Message-Id: <20260723-dynamic_encode-v4-0-5fd6bd549ead@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALmCYWoC/3XOW2rDMBQE0K0YfVdBunrYylf3UUrR46oR1HZiO
 aYheO+V7UJLnf4IRjDnzp1kHBJmcqzuZMAp5dR3JciniviT7d6RplAyAQaaSV7TcOtsm/wbdr4
 PSEWtuNVCMwySlNJ5wJg+V/DldcsDXq7FHbdP4mxG6vu2TeOxclJx5aPkSgulsYkyokYWg+d1V
 MYG60xdQySLdUp57IfbunXiK7bNAvZ31sQpo8Ch8YYrHhk+9zkfLlf7sVw+lGcZ+902D9veRKc
 ND40Tdt9e9kzws6E4OwWKotHUITIBsoF/FPFLgb0iihLBQnDMerDxgTLP8xeEjW4AyQEAAA==
X-Change-ID: 20260417-dynamic_encode-3751a6360ed4
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784775356; l=1937;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=fitKuoq3f0JyMs8K6A7V2u0qijzshEjj3lKDbMsxf5Y=;
 b=4CvjtvJtgpaUpPcjvg4DIz3F9RZTcrf6Uhb7ZXYAqq5DJKlTt0yQfKHtEJJBnc9VM627sIY36
 0rlNd/j+VT0AasV6uIc/93nIBz5JVx3nOVbIcxs8Air2Rw5quzzM9Ts
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=Sr6gLvO0 c=1 sm=1 tr=0 ts=6a6182c1 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eqrrz9xRmxmWE_0OKXQA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: xphFbHkV8V0T_nHlFpimuoVXV0xDbMHr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDAyNyBTYWx0ZWRfX+Veiy1DiIG3Y
 RJw2QDhSavGPgBy/NLphFRO7nUaQ9XRPy1TpWjrkwzfXwUqr+Q5UOSpmvPXm0XGzGbtOm5VFCZk
 2D8DzEePDmu23GXnq1R0iJDnmBqk4UUdVhM5MfJexcmcrbLX32Jpm2Al4WxzlsIGyqB12C1Guai
 lJqlU9pLYd7fE48+qjqzZXGbcd+BFZdUDxp4l4+gnBLuDafhxbu/gV6vyWjS/xlAiM7XIPo60AN
 9XrYAqyrEq9WdpSE28qSoJSjGHLT3mj5vgDzIQwexJcxRMso9fIQ0cZr9ry9NIgA3rnRjSNFdsf
 Hzuf7wLRlGlb1oscviRQrzEzyUJuD7q1/vLcxSQrbnVxFoQAFvNBbVJeYUx2dL4Vzkr0TCuyALc
 UISUCcstM1k2EJHFuXIsPQa2zwS+zZF8HNgQKN8lT6jGrMiqOCZ8VcLqUXZPztuY+YOqmh5GTlV
 FEes2PU6pcifjD803tQ==
X-Proofpoint-GUID: xphFbHkV8V0T_nHlFpimuoVXV0xDbMHr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDAyNyBTYWx0ZWRfX8HXDq0ywQF8t
 ctHYKyqeZdD1R0R7ZxcQRraZj6V9505EZGiA4BfpCXTVPUXtTbkVRBj/kuUz6roKwfww7LXi/zz
 2riskpO+fXVxPNtEkSGN5pEdPCOuJX8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230027

This patch series introduces several enhancements to the Qualcomm Iris
encoder driver, improving support for V4L2 controls and enabling more
video encoding features.

- Fix missing hfi_id for gen1 encoder GOP_SIZE cap.
- Add key frame request support for gen1 and gen2 encoders.

All patches have been tested with iris_test_app on gen1:QCS6490,
gen2:QCS9100, X1E80100.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
Changes in v4:
- Add Fixes tag.(bod)
- Link to v3: https://lore.kernel.org/r/20260624-dynamic_encode-v3-0-f2a2db0ac2af@oss.qualcomm.com

Changes in v3:
- Correct the max value for FORCE_KEY_FRAME cap.
- Link to v2: https://lore.kernel.org/r/20260604-dynamic_encode-v2-0-6e97df032482@oss.qualcomm.com

Changes in v2:
- Rebased due to a conflict with commit 'media: qcom: iris: split HFI session ops from core ops' (35da0884068226ca3a53371dbf685db6e0d74658).
- Link to v1: https://lore.kernel.org/r/20260429-dynamic_encode-v1-0-c9fb691d8b3a@oss.qualcomm.com

---
Wangao Wang (2):
      media: qcom: iris: fix missing hfi_id in gen1 GOP_SIZE cap
      media: qcom: iris: Add request key frame support for encoder

 drivers/media/platform/qcom/iris/iris_ctrls.c      | 24 +++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 26 ++++++++++++----------
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  3 +++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 12 +++++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  7 ++++++
 .../platform/qcom/iris/iris_platform_common.h      |  2 +-
 8 files changed, 61 insertions(+), 15 deletions(-)
---
base-commit: b4515cf4156356e8f4fe6e0fdc17f59adab9772f
change-id: 20260417-dynamic_encode-3751a6360ed4

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>

