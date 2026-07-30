Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6ED47D93C
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785455342; cv=none; b=RUORw02aW0gqFiLzKUeQGBhP6Pc0W5PW0Le//NwBEDPotDXNaJVPc+AkXDSRZctWCG86aqM9cxP13EtAAr8BnSmpUi6lNXzpxmj26ib9DXEnJb3gcaP5yjMPY3W+7E8TekeK7jXtz8+x58JqxqWFV4tZ+K70Q5kakx9+DdSE8qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785455342; c=relaxed/simple;
	bh=xXEVr6/5zG6LhYwhKlxTNQeBz1S6jCh9fNK4aNEif/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hereTMH2O2RUpoqSzPYXV051dZU2c8ksBWhEpFku9TD3UgV65zDFV8jFJ6MTa/S3wNGPsY9RtaZMIEAr8WvHROiFWOBh+NP2MfAxH5cbYPjJR9m1GGy8K6CiDFnf3C6D6EugNqO3CS6erN8bI/aw4/18lT7w410flNl4r+uC+VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TAjAvpOf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OUHgH0P2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TAjAvpOf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OUHgH0P2"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UMqvB02453712
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5UWhgwyCoo8JEj89rqAqyso4gEsx8Me7PQqYHP5at8w=; b=TAjAvpOfdMiZAR9f
	gqyLdMg/mI0FjUbFbmV9clU2a4QvYeoH3Klhiiq4o3SmFjHIAGC7QJ8NXZz1z8W6
	RHvcLWbouBJp+R3OAH4iN/HOF8p7Gfb8Yp0jgYzSGBLiRJiVJp4iVXj6pajzRwwc
	D7vZNpJsYm+aLIa2r4BgjSih2rV/tNaXK4UwEUeRdbbdRI3+BvJ8JtKW/Qc0eSfd
	bZ4yd4ifkPJx895+t8UkfYKotwlBUnQrlbAEP1blC9xMHcHzi2XkX2WX4PVHeq7g
	zTUcUqc1y9GmlJp/TiJ/JLuoFYmKCF/I0uUCU0q5haPP+0n90sMnxNrFdAzsR2Qs
	kOi5hw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frf0wg8sn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:48:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5174a23afcbso3431541cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785455338; x=1786060138; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5UWhgwyCoo8JEj89rqAqyso4gEsx8Me7PQqYHP5at8w=;
        b=OUHgH0P2oKzgjl3aGORPY53xq9Fv3onHNpYT+gWuf11IUyVISmCmIY/W0BUzYsWzgk
         I4EyrQOjSMZ13Q2fQqIRwHf0+PHIWxOabfITt3VE7HxwSt839sPyPp6DPwPTP1qVE8tF
         ZVxE0whdz+4uPaEx6UxD1/gMti0Oxkc81TR3vuH9IL3XpJYVKvgwSCBQCbOfL2M4O2Fl
         CqZt6QHQnbwPLZ99G5wGratOpu07e40sjDGQrajTcW364ORUnBhX+TwCOCWixWfKKU2n
         R+RAdgjqhn0uTeIYTpvazwZRrS+MYHupZM1SIBECbPLM0V089xD6ZLIrDem/EEu2zn8S
         nO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785455338; x=1786060138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5UWhgwyCoo8JEj89rqAqyso4gEsx8Me7PQqYHP5at8w=;
        b=HsXac7Ry1gfNPqjqhupD/57gPwNu0P73Jjtl2gRSidAvMIPg108s+/NzsiLQa8oU4z
         L3kjFNhQrUXHG3s/LpWQMNpPHpsnGYNbsFUxsQgcrS+PL0dnPs5VG+5qgE9BSJqL7dDs
         9nVdpkfFrjJUZROspS7Y/91ul2/vgc5Aaw3//IHDlvqzvA9aCZDTQYvgL/X7nDLDSSJy
         /+fD9dmCR0F3hrd1TSV/Mut5FRA3QHnA2jditREP/p1xbpvsUn+wmKykUHzh0tYsNw1I
         QI2NHapGd96iPSxodX+aT7OkPrQKu0D/uRw3cDFCt9RZtukFkGx1PfiFzDmWCC3aCjFA
         bzLA==
X-Forwarded-Encrypted: i=1; AHgh+Rrr4fnYDozU4JzC2N+jsx25LE17RrUg6eQFNg6N3U1D5BsDXtUblgZaCxcNQuauScTnAyjwuDtuUYsENuhQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1eMUWKYApFpmxHRDxqVQxVH6BJfj57VdENMdOH87fEzfLxMIf
	nrJSQTTKX3cMYJ2JVccUIqLLVs3v8b/La6IRxjAVgm6tdK2V10RdinxAZSRoLLYHSxQp7e79JA2
	4IayiKxiK421G82M/4oiba2A36hpSf0IPUiTcqjVcDeSWQOFhMXeRLeGm1TtNrWRU6ugi
X-Gm-Gg: AR+sD11ag5tIT1vvIXsSfMMO5exrngcyY6w9YsMbAlhcWW7uebQ0VEslhlo+1mLo4+g
	SngkQlij4iLS7VEHlRx3+8fSIn0sQlM84+hL+DDucAce6/Nmx9dD3v0oGVTgzSjTcTo9MZEm88k
	pnVNcCbHyNzSULgQSAjqDu3uWBODCzdb1G5UZT2nNQDD8NjlHq6Mtu7TpETfZfeepDYQQt1q7Ra
	FJspf10Mxzi90pQXULa6BYuUgL1AchsAIyjgTafxKEjrstg/eOkItuSh4eGUEmW4HGFn+cSzTQ3
	PVseC2Os2UxPH+9UdNeSohEZ6o5HkqYxsunqVpXpm5XjBNJKXH2PJ0pYF+VVdJif8hhd7fLGu95
	jYwyRPk/7lAyfv0XkH5c28GE+SIPTBc3KccP20PTe85tZ3PBx0tbgqxBC0lsgBPadyKQP2CBD7U
	gpwxEPcG13zcMaqA==
X-Received: by 2002:a05:622a:281:b0:51c:7b12:1200 with SMTP id d75a77b69052e-52b386c480emr50063771cf.78.1785455338068;
        Thu, 30 Jul 2026 16:48:58 -0700 (PDT)
X-Received: by 2002:a05:622a:281:b0:51c:7b12:1200 with SMTP id d75a77b69052e-52b386c480emr50063501cf.78.1785455337548;
        Thu, 30 Jul 2026 16:48:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9ba724sm634487e87.45.2026.07.30.16.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:48:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 02:48:33 +0300
Subject: [PATCH v9 12/19] media: iris: Add framework support for AR50_LITE
 video core
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-iris-ar50lt-v9-12-d71a782001c0@oss.qualcomm.com>
References: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
In-Reply-To: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10792;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9eletMHeBNlXrb2xA+TY9IGv9a5H/HkGGUmBbWdTDNA=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1b2o9MWq2YZTU4tn6gdcPPSpfiXljPvGZv8ONsmL5Hb+
 YdZYHFrJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmoreZg2GFvnvcYrOyw+Yy
 h+/vdbZflaSjHlhR7dI386jh5LVBi8IYlgq2MkXbCPu2rlr0NiFr6xJb/2X3lv5k5eiQ93eUvPW
 oUOHA112ljPHp01QtVSpd/myO8nDX+GQY07Xz/oLMbSnXBNNWtwnpzQo5ebyA/dKZMH5xLpkauf
 9Ra44sc/icwiy6yuCjt3+aN6f09219/Xsmr6iLNS8PzA7am5emrl8f/7nqTOOX8Glnhb5xtDhwX
 eq5FS7xLUHB1KbsWaZProjSFMfk2tdBX1lzU3+Ff1ddGyoXVd2zxer6i36TCqZlKRbuBqnre9vV
 LdJaWbLv+U1Zrrw7mX/vew9WbclNtQuXaUv8TX3yTxYA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfXwuKUfyAz7vow
 Au0AgsT7mykRSoWExIeEvCTPaY+zDKsgsSkZj+hMb8oL7DKdcUKzBnz9WJ4Qdu7KD6HNIjPaeZb
 27V5N5ygi31nE6w7I5aXbTm4Fj3Yvmw=
X-Authority-Analysis: v=2.4 cv=T928ifKQ c=1 sm=1 tr=0 ts=6a6be2ea cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=oth-URKmseDdlDMfR28A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 5Z_Gg1F2U4R-PtIWIyMpfgXAsol5KFzd
X-Proofpoint-ORIG-GUID: 5Z_Gg1F2U4R-PtIWIyMpfgXAsol5KFzd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX+p69tN6AygcK
 i6Z8FbXlzE4XIm5rAaQ9GE3JV0HlJadCatYZYGBk9BteGvzeRl4HCDVPQF572/g5e7ll7yphptR
 F3qMJkmwbIjY7ZyOq47DT4z1ug12VwyXzMjt39OJD8xNUPL2o54MrtjM5pqmwPDw3qEba011sYn
 8jqRKTaUKbFw5Gip4W26TCHYw+vuON1mshbB8/53W5HXkqv6Y9XtigxXAJAosfcQts9iNX4uDZY
 TdVVRAubRb3We3F5/xbFVE0rpqUTFsWT1ktTE9sH47b0dtGDjJaMz8jOOMdjiedcmAsT4Xu9kvH
 bQWr0X0cBY1cLfpkoVEQa0U6NQyMt88d3uRhBuIa/Bo6bKU8GFUQgbMytF54dTadaCixDWTsUlD
 3DGZhBe1NYTrQygCUc9okk+ndoS6MEHDsS536gp/YVF/9JLkTKfWepRy8xajiRO66YeWIkLg7nN
 gglK9igmmeincq4uYjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300168

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Add power sequence for ar5lt core.
Add register handling for ar50lt by hooking up vpu op with ar50lt
specific implemtation or resue from earlier generation wherever
feasible.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile          |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |   2 +
 drivers/media/platform/qcom/iris/iris_vpu2.c       |  28 +----
 drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c | 130 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  29 ++++-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   2 +
 6 files changed, 164 insertions(+), 28 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 48e415cbc439..f1b204b95694 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -26,6 +26,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_vpu2.o \
              iris_vpu3x.o \
              iris_vpu4x.o \
+             iris_vpu_ar50lt.o \
              iris_vpu_buffer.o \
              iris_vpu_common.o \
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 4246c2dc5cd4..4ed0709ec381 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -76,6 +76,7 @@ enum platform_clk_type {
 	IRIS_VPP0_HW_CLK,
 	IRIS_VPP1_HW_CLK,
 	IRIS_APV_HW_CLK,
+	IRIS_THROTTLE_CLK,
 };
 
 struct platform_clk_data {
@@ -318,6 +319,7 @@ struct iris_platform_data {
 	u32 tz_cp_config_data_size;
 	u32 num_vpp_pipe;
 	bool no_aon;
+	bool no_rpmh;
 	u32 wd_intr_mask;
 	u32 icc_ib_multiplier;
 	u32 max_session_count;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index dd2eeae0d9eb..5419a5096b00 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -12,38 +12,12 @@
 
 #include "iris_vpu_register_defines.h"
 
-static u64 iris_vpu2_calc_freq(struct iris_inst *inst, size_t data_size)
-{
-	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
-	struct v4l2_format *inp_f = inst->fmt_src;
-	u32 mbs_per_second, mbpf, height, width;
-	unsigned long vpp_freq, vsp_freq;
-	u32 fps = inst->frame_rate;
-
-	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
-	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
-
-	mbpf = NUM_MBS_PER_FRAME(height, width);
-	mbs_per_second = mbpf * fps;
-
-	vpp_freq = mbs_per_second * caps->mb_cycles_vpp;
-
-	/* 21 / 20 is overhead factor */
-	vpp_freq += vpp_freq / 20;
-	vsp_freq = mbs_per_second * caps->mb_cycles_vsp;
-
-	/* 10 / 7 is overhead factor */
-	vsp_freq += ((fps * data_size * 8) * 10) / 7;
-
-	return max(vpp_freq, vsp_freq);
-}
-
 const struct vpu_ops iris_vpu2_ops = {
 	.power_off_hw = iris_vpu_power_off_hw,
 	.power_on_hw = iris_vpu_power_on_hw,
 	.power_off_controller = iris_vpu_power_off_controller,
 	.power_on_controller = iris_vpu_power_on_controller,
-	.calc_freq = iris_vpu2_calc_freq,
+	.calc_freq = iris_vpu2_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
 	.interrupt_init = iris_vpu_interrupt_init,
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c b/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c
new file mode 100644
index 000000000000..e084a5b49f2e
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/bits.h>
+#include <linux/iopoll.h>
+#include <linux/reset.h>
+
+#include "iris_instance.h"
+#include "iris_vpu_common.h"
+
+#include "iris_vpu_register_defines.h"
+
+#define WRAPPER_INTR_MASK_A2HVCODEC_BMSK_AR50LT BIT(3)
+
+#define WRAPPER_VCODEC0_CLOCK_CONFIG_AR50LT		0xb0080
+
+#define CPU_CS_VCICMD					0xa0020
+#define CPU_CS_VCICMD_ARP_OFF			0x1
+
+static void iris_vpu_ar50lt_set_preset_registers(struct iris_core *core)
+{
+	writel(0x0, core->reg_base + WRAPPER_VCODEC0_CLOCK_CONFIG_AR50LT);
+}
+
+static void iris_vpu_ar50lt_interrupt_init(struct iris_core *core)
+{
+	writel(WRAPPER_INTR_MASK_A2HVCODEC_BMSK_AR50LT, core->reg_base + WRAPPER_INTR_MASK);
+}
+
+static void iris_vpu_ar50lt_disable_arp(struct iris_core *core)
+{
+	writel(CPU_CS_VCICMD_ARP_OFF, core->reg_base + CPU_CS_VCICMD);
+}
+
+static int iris_vpu_ar50lt_power_off_controller(struct iris_core *core)
+{
+	iris_disable_unprepare_clock(core, IRIS_AHB_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+
+	return 0;
+}
+
+static void iris_vpu_ar50lt_power_off_hw(struct iris_core *core)
+{
+	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
+	iris_disable_unprepare_clock(core, IRIS_THROTTLE_CLK);
+	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
+	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+}
+
+static int iris_vpu_ar50lt_power_on_controller(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_CTRL_CLK);
+	if (ret)
+		goto err_disable_power;
+
+	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
+	if (ret && ret != -ENOENT)
+		goto err_disable_ctrl_clock;
+
+	ret = iris_prepare_enable_clock(core, IRIS_AHB_CLK);
+	if (ret)
+		goto err_disable_axi_clock;
+
+	return 0;
+
+err_disable_axi_clock:
+	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+err_disable_ctrl_clock:
+	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
+err_disable_power:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+
+	return ret;
+}
+
+static int iris_vpu_ar50lt_power_on_hw(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
+	if (ret)
+		goto err_disable_power;
+
+	ret = iris_prepare_enable_clock(core, IRIS_HW_AHB_CLK);
+	if (ret)
+		goto err_disable_hw_clock;
+
+	ret = iris_prepare_enable_clock(core, IRIS_THROTTLE_CLK);
+	if (ret)
+		goto err_disable_hw_ahb_clock;
+
+	return 0;
+
+err_disable_hw_ahb_clock:
+	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
+err_disable_hw_clock:
+	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+err_disable_power:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+
+	return ret;
+}
+
+const struct vpu_ops iris_vpu_ar50lt_ops = {
+	.power_off_hw = iris_vpu_ar50lt_power_off_hw,
+	.power_on_hw = iris_vpu_ar50lt_power_on_hw,
+	.power_off_controller = iris_vpu_ar50lt_power_off_controller,
+	.power_on_controller = iris_vpu_ar50lt_power_on_controller,
+	.calc_freq = iris_vpu2_calculate_frequency,
+	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_ar50lt_set_preset_registers,
+	.interrupt_init = iris_vpu_ar50lt_interrupt_init,
+	.disable_arp = iris_vpu_ar50lt_disable_arp,
+};
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 3fa1a3cd4de9..606f5e1ad7aa 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -97,7 +97,8 @@ int iris_vpu_boot_firmware(struct iris_core *core)
 	}
 
 	writel(HOST2XTENSA_INTR_ENABLE, core->reg_base + CPU_CS_H2XSOFTINTEN);
-	writel(0x0, core->reg_base + CPU_CS_X2RPMH);
+	if (!core->iris_platform_data->no_rpmh)
+		writel(0x0, core->reg_base + CPU_CS_X2RPMH);
 
 	return 0;
 }
@@ -422,6 +423,32 @@ void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core)
 	writel(0x1, core->reg_base + WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0);
 }
 
+u64 iris_vpu2_calculate_frequency(struct iris_inst *inst, size_t data_size)
+{
+	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
+	struct v4l2_format *inp_f = inst->fmt_src;
+	u32 mbs_per_second, mbpf, height, width;
+	unsigned long vpp_freq, vsp_freq;
+	u32 fps = inst->frame_rate;
+
+	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
+	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
+
+	mbpf = NUM_MBS_PER_FRAME(height, width);
+	mbs_per_second = mbpf * fps;
+
+	vpp_freq = mbs_per_second * caps->mb_cycles_vpp;
+
+	/* 21 / 20 is overhead factor */
+	vpp_freq += vpp_freq / 20;
+	vsp_freq = mbs_per_second * caps->mb_cycles_vsp;
+
+	/* 10 / 7 is overhead factor */
+	vsp_freq += ((fps * data_size * 8) * 10) / 7;
+
+	return max(vpp_freq, vsp_freq);
+}
+
 u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size)
 {
 	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 71d96921ed37..a62b6184bde7 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -13,6 +13,7 @@ extern const struct vpu_ops iris_vpu3_ops;
 extern const struct vpu_ops iris_vpu33_ops;
 extern const struct vpu_ops iris_vpu35_ops;
 extern const struct vpu_ops iris_vpu4x_ops;
+extern const struct vpu_ops iris_vpu_ar50lt_ops;
 
 struct vpu_ops {
 	void (*power_off_hw)(struct iris_core *core);
@@ -40,6 +41,7 @@ int iris_vpu_power_on(struct iris_core *core);
 int iris_vpu_power_off_controller(struct iris_core *core);
 void iris_vpu_power_off_hw(struct iris_core *core);
 void iris_vpu_power_off(struct iris_core *core);
+u64 iris_vpu2_calculate_frequency(struct iris_inst *inst, size_t data_size);
 int iris_vpu35_vpu4x_power_off_controller(struct iris_core *core);
 int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core);
 void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core);

-- 
2.47.3

