Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463136;
	b=oGsX/u89ofJOAdvszrbCpuzgumtkfTOkfA++rUxb0wlfRU9/E3miYH0YNUjMJ2RaKkyP
	 3uB5SG7EcWyLBkDX7Bsjr12W/YdwC/Vlf5GYHL396addT5qMWfFNWkC5ZBs6utfVTgxF1
	 d+ZNnE/S3nDlbWr0R8gYHIFx6Dblc4bn2YinKW0I+BDmQy3OEVK/Do7218lEyUjXGuaja
	 AuQh5CwtA6tajzpnfPvGNtlLdPeFemJUewzlguTgNE2XofOhXgBg3d6V56CJFN2hUxBIF
	 6eo4g7U59lKyt25S7wQYGserZXnRqclnQNisRfY7AjyqniBfnSYszb+dsk5u45n0KyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463136;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JjGzml6CP74rYN0xa4cDI3KFc9rpRn/MizTXsFxSRL4=;
	b=J2O36XbA728w/JyiU1qoGqR3IfSlq8eLfwFdObrVuIRfCXyeFduyw4QIRCugC7hw5DVt
	 K2QPBaIK/3KhIxKgIl8dsF0rN5khC8K/sft9riXeZukZf3cSaEPnJdGobNvWLE6tjzLTd
	 wuo2Bt4s3a4ldAMScrteKcLute1WUos1bVuRpvwYas2u6D8O183465+lSf1AVJos6/u85
	 EDQKntfBid/4l7z6w9b2O5SoKcgbYTqrx6gxEqsIVCZdi2m8gccyBg2HOo2cEghYv/XJW
	 9eLzSiStCSJY+8OXCdfFwOuZkjuiDf5ncDlkGjE0lVtfbhlyaEXvzHwzhlonEcpyDPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i8OFDJef;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YT30ZN+E;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7916C606A33E
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 16:12:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7916C606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i8OFDJef;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YT30ZN+E
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD0DSO2196426
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 16:12:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JjGzml6CP74rYN0xa4cDI3KFc9rpRn/MizTXsFxSRL4=; b=i8OFDJefNojLBJ5Y
	s4/Xl2d2/qcXvNPe7KwVRWKy9uRvr5fP5ottuYG0cgOenfKIC2rcshedRembaCwL
	A3jcm0djMdiAQqHYq01HOz/3CCHYcUjaPTXwYkY4bKwbEFzFPPH5goZZR8tqaUmg
	B97arNOYD4mWcFHWJc1tnuDndUwLrN3FFcS8ojZOOC8UkCnS9YPSQh0QM2OvelGC
	iHk8TOVl2Wr+BVKEFD1hYF9Yfw357IuA2y/vCYKxGpPCBQJgGgbktO9OIO8DHxpp
	XM/4LIaFACcfvzSor0IDX7aj7HO2se9uj0S9APbaA9uIzsiDoxLPHeODNQAl2QXc
	zQ3FFw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8du9fd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 16:12:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cbf2fd504so294702685a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 09:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793463134; x=1794067934; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JjGzml6CP74rYN0xa4cDI3KFc9rpRn/MizTXsFxSRL4=;
        b=YT30ZN+EXyUqlQFFAQNklKNMdJfJujavmZ6hbnDuUWTzD1otm8JUt5rGX1bGoLcX/a
         go/gpZdWojUuOsS+vOTE0w6FksKK4QH7xDIuUY8/BaYqxtL3xkvGpTXj4DAh8FO75eWw
         Mn+iQCslGZPU+F/PTLBwIbFBoGq0ZNao0mIKXVQqYRLADzZd6LeQfIiPs++AqcgZk459
         iXxAUwwSVfctk2lkWij0ntHbZ9LWFppOj3Khzj3J0L5gREkPphcHbLPD7zGt4gIwjbrs
         NCe3dDaXt9In6uHJ6RZRgwKrzq5/Zv4ucmFVWucFPnR5PmOFGZ41sBiTYehOBZvOApVD
         YrFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793463134; x=1794067934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JjGzml6CP74rYN0xa4cDI3KFc9rpRn/MizTXsFxSRL4=;
        b=u5W4s0FDHyN5RzTsDCiq92T+9heISGNzI/FSiEmWekINY0b4BhBiZsNpb3jFdBDOCY
         hb0P38ISFvot7NP3AePl1jYTGkACf80t+BsWdSzKtzMJcbRVnAIA3xcFw4vUO0GkgUUm
         C560qyW3qPOtvFmmAWECIHlGYoyCkRlurrAUxHQIsdbDgnfq7J4ojxgH5bH69Z2bsHdv
         J+wD8IGbQ46yMwM0lDChm3LNWvCkHctrK8V+vWsfQnuFp3zdafZwnTPzGaDhqdgeR7ym
         bhvHJ0KeGVKH0lXxRZRUgt5bx8PzkEWGbIjArvfB3aZZtwwDjlwTu3CIeG+MRYBZ4YHJ
         2vyw==
X-Gm-Message-State: AFq9FYJl7JFPNKlS4HItYW/XfdKmSV4O5+kxMRlN3n4ZAS2mM+ygq9Rc
	NQpn/IHltSSQSxizp5o+mSlOUYzFMQCph3iuax9pNBD/mh67QxmexV8djLS3VuAtF2Ae3h2qBzX
	G9yXqyIB3CADYnQ3VFHv+nqT2NLnCVa8JapxRoMpWNHYXZ3zsOivK30lWQHVScQZHqDnx
X-Gm-Gg: AYBFou1tnUc7m85ECu1aqvfuPHhcvCwzDOAiN6p6W+8H4ibbQbuvvW3njFYbcY4tG/Z
	4QjzLvHD32/v9eHdxjAF+kULCQG3qbnvOTag8yWTswV8lW6SP7uGN+84TJzZNol+yN2KEVN0fXZ
	+3oLuBtHLcS/Zld9rFajep7Rj1/7c9fXU1oLTlzxLRt2RwjLXuRi5PbyIMtQjeFtnrgvjzsbwW9
	i96lWHdYcUkZfUi1I1KkhZEEIm5GzjBcRVkBiJjDSwKdpAAlwoRlTlYXs/zwd7Ze0tcUeY+ZyhG
	fkUj+NanuZH6Cs3WoeqfSPiQ/DFH2hJBoRyxodJv2ZKbDfrIACUXQwMJvI0PJq4ouHyG+0EWf6M
	WgE3qmb+9hhYg5vhUvQH8j75+1gGfyJpfgNCjzOpa5zxKLFDXenUrz7tviAsjDUKR15nKx0RUYh
	tVIYMGgiYwvtMA8Bwt/ioycl0DfEJDNgbSMQYIFLf8NnB8jyr6mTQcrz7rvNmnjA==
X-Received: by 2002:a05:620a:460f:b0:93f:22af:cce7 with SMTP id af79cd13be357-94421585456mr894490585a.12.1793463133596;
        Sat, 31 Oct 2026 09:12:13 -0700 (PDT)
X-Received: by 2002:a05:620a:460f:b0:93f:22af:cce7 with SMTP id af79cd13be357-94421585456mr894485185a.12.1793463132921;
        Sat, 31 Oct 2026 09:12:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe0720e3csm666666e87.28.2026.10.31.09.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:12:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 18:11:52 +0200
Subject: [PATCH v2 2/4] drm/msm/adreno: add a timestamp offset for counters
 that restart
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
Message-Id: <20261031-b4-adreno-timestamp-v2-2-0836856b228f@oss.qualcomm.com>
References: <20261031-b4-adreno-timestamp-v2-0-0836856b228f@oss.qualcomm.com>
In-Reply-To: <20261031-b4-adreno-timestamp-v2-0-0836856b228f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6447;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pgt0edGfcerXO7fdC4IZjk994ujodfRoNGPFKDlJzNU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq5hNQfNyiirMtKyxGYRZr4lea+TqW6fLQuZdHU
 3ae5kqCsq6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCauYTUAAKCRCLPIo+Aiko
 1Va/B/0RYec27l6YHQswUMqvdClNOpO3EVfW6L3XHWtMBkYb6kTm2R7/ykZXPtKKb4247BwJggU
 zasUkwGqdGzmZ68r2xD2VOEFoeIbXU7bNwzte+X9bzwrsfPU+0ZU88nTRxwRwIbI+gSpeK0JgyR
 7fQIiJ8rIVC5xmDxGmtRgDCuiKTRLwirEaz+RqxUmpRQVokg7kJS24VZvKKO04XrsxIgS9hHsUV
 wGXiX+SRLK998PDFpy1hKl7HggKhaM72TymUt6H/JrCKbrvWj1kfpjwR1Uer5UN0enKOmvpcyZJ
 MUDUlr8GFz5zE5XTAXmOHSBVTYdf7exH7TGMBkKdewGODs9D
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=O6esLx9W c=1 sm=1 tr=0 ts=6ae6135e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=0rTI16qmik2F_lPQQP8A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: s--zjwcR1PpqSXPsMxH1UafeH9Gbbr4i
X-Proofpoint-GUID: s--zjwcR1PpqSXPsMxH1UafeH9Gbbr4i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA2NCBTYWx0ZWRfX7whQFy/5mDCP
 zsQaihwm+61UKOKNgmiz5R+9OJnCzqhuzNAF+4u19CISRdd0BEZt8YUPkqyhV5pLMPkEn4R5tyi
 Sy925HFDGXRnqq2mBkpOHbuNb375arC8eu4N86eXupSxcV5+7il7cM2KzZ3I3EWziqlve3vl/qF
 v2+QlX80/uxsjZA+1i1q09ZtC9QBsdAQQVFle7kwzRNSau8y62AKHAWOfVHQUSLgRzrKlJsjVy1
 YJbnYEWJy9LnGFkkXiXyNieWNTIjkwOtkKDtgWhHS743kZSf60hF2zX0exFPAYg8c/wUS8W+DUQ
 wYJXY9j0wHbfJFPMYxtPkwkeGXdUeEsPhzyfnMvvaiOz0QKp0gmTDInnYLGl7uIhgPHcFXWv1TD
 4qvOUzLNcbMvpkxd8K/qtnIOKzW5Inz9NJmNcx2/i/JItb5biRo/gRSg1ufNxpgCpkXZ4fRkn6O
 3kElO5SRL2E1/tzmxEg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA2NCBTYWx0ZWRfX1aAlNb1kxNnU
 ZqSAquoMq6RrAHB1OjD/IzmULt7m6mXY580Tmz83uQ2MPfkQYT0dJYlZNQDTOMviFl7R2BvuvoV
 icpqp7nbzRoJzucvgSFj0bPZ9IjDlT4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310064

Before a750, the always-on counter behind MSM_PARAM_TIMESTAMP, which the
GPU also writes for its own timestamps, restarts whenever the GPU powers
up, so timestamps go backwards across a runtime suspend. The counter
can't be written back, and adding an offset to MSM_PARAM_TIMESTAMP alone
breaks its match with the timestamps the GPU writes.

Keep an offset that makes the counter continuous, advancing it by the
CLOCK_MONOTONIC time the counter was stopped, and publish it in the
vdso page so that shaders can add it to the timestamps the GPU writes.
Report the counter with the offset added as the new
MSM_PARAM_TIMESTAMP_MONOTONIC, read under gpu->lock so that recovery
can't move the offset in between. MSM_PARAM_TIMESTAMP stays raw for the
existing userspace. On GPUs where the counter doesn't restart the offset
stays zero, so userspace can take the same path everywhere.

Nothing calls the save and restore yet, so the offset stays zero.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 63 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 10 ++++++
 include/uapi/drm/msm_drm.h              | 16 +++++++++
 3 files changed, 89 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 0adf56fb9563..f13e54e75dc1 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -226,6 +226,50 @@ adreno_iommu_create_vm(struct msm_gpu *gpu,
 	return vm;
 }
 
+/* The always-on counters tick at 19.2 MHz */
+static u64 adreno_ns_to_ticks(u64 ns)
+{
+	return mul_u64_u32_div(ns, 12, 625);
+}
+
+/* For a GPU whose always-on counter restarts when it powers up */
+void adreno_timestamp_init(struct msm_gpu *gpu)
+{
+	to_adreno_gpu(gpu)->timestamp_restarts = true;
+}
+
+/* Call with the GPU powered, before anything that may restart the counter */
+void adreno_timestamp_save(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+
+	if (!adreno_gpu->timestamp_restarts || adreno_gpu->timestamp_stopped)
+		return;
+
+	adreno_gpu->timestamp_saved = adreno_gpu->funcs->get_timestamp(gpu);
+	adreno_gpu->timestamp_saved_ns = ktime_get_ns();
+	adreno_gpu->timestamp_stopped = true;
+}
+
+/* Call with the GPU powered, before it runs anything */
+void adreno_timestamp_restore(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	u64 now, gap;
+
+	if (!adreno_gpu->timestamp_stopped)
+		return;
+
+	now = adreno_gpu->funcs->get_timestamp(gpu);
+	gap = adreno_ns_to_ticks(ktime_get_ns() - adreno_gpu->timestamp_saved_ns);
+	adreno_gpu->timestamp_offset += adreno_gpu->timestamp_saved + gap - now;
+
+	gpu->vdso->timestamp_offset = adreno_gpu->timestamp_offset;
+	wmb();
+
+	adreno_gpu->timestamp_stopped = false;
+}
+
 u64 adreno_private_vm_size(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -404,6 +448,25 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 			return 0;
 		}
 		return -EINVAL;
+	case MSM_PARAM_TIMESTAMP_MONOTONIC:
+		if (adreno_gpu->funcs->get_timestamp) {
+			int ret;
+
+			/* recovery moves the offset under gpu->lock */
+			ret = mutex_lock_interruptible(&gpu->lock);
+			if (ret)
+				return ret;
+
+			pm_runtime_get_sync(&gpu->pdev->dev);
+			*value = adreno_gpu->timestamp_offset +
+				 adreno_gpu->funcs->get_timestamp(gpu);
+			pm_runtime_put_autosuspend(&gpu->pdev->dev);
+
+			mutex_unlock(&gpu->lock);
+
+			return 0;
+		}
+		return -EINVAL;
 	case MSM_PARAM_VDSO_IOVA:
 		*value = gpu->vdso_iova;
 		return 0;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 4b2156825bdf..51ef57b536ed 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -209,6 +209,13 @@ struct adreno_gpu {
 	uint16_t speedbin;
 	const struct adreno_gpu_funcs *funcs;
 
+	/* offset that keeps a restarting always-on counter continuous: */
+	bool timestamp_restarts;
+	u64 timestamp_offset;
+	u64 timestamp_saved;
+	u64 timestamp_saved_ns;
+	bool timestamp_stopped;
+
 	struct completion fault_coredump_done;
 
 	/* interesting register offsets to dump: */
@@ -641,6 +648,9 @@ static inline int adreno_is_a850_family(struct adreno_gpu *gpu)
 /* Put vm_start above 32b to catch issues with not setting xyz_BASE_HI */
 #define ADRENO_VM_START 0x100000000ULL
 u64 adreno_private_vm_size(struct msm_gpu *gpu);
+void adreno_timestamp_init(struct msm_gpu *gpu);
+void adreno_timestamp_save(struct msm_gpu *gpu);
+void adreno_timestamp_restore(struct msm_gpu *gpu);
 int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		     uint32_t param, uint64_t *value, uint32_t *len);
 int adreno_set_param(struct msm_gpu *gpu, struct msm_context *ctx,
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index f8bf48fdc339..2fd185f0ffcc 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -120,6 +120,16 @@ struct drm_msm_timespec {
 #define MSM_PARAM_AQE	     0x17  /* RO */
 #define MSM_PARAM_VDSO_IOVA  0x18  /* RO: GPU address of struct drm_msm_vdso */
 
+/* On GPUs before A750 the always-on counter behind MSM_PARAM_TIMESTAMP
+ * restarts whenever the GPU powers down. The GPU writes the same value as a
+ * timestamp.  MSM_PARAM_TIMESTAMP_MONOTONIC returns the counter with
+ * drm_msm_vdso::timestamp_offset added, resulting in a monotonic timestamp
+ * that most uAPIs require. Shaders can add the same to the timestamps
+ * the GPU writes when required, ending up with the stable counter values.
+ */
+
+#define MSM_PARAM_TIMESTAMP_MONOTONIC 0x19  /* RO */
+
 /* For backwards compat.  The original support for preemption was based on
  * a single ring per priority level so # of priority levels equals the #
  * of rings.  With drm/scheduler providing additional levels of priority,
@@ -134,6 +144,12 @@ struct drm_msm_timespec {
  */
 struct drm_msm_vdso {
 	__u64 flags;
+	/*
+	 * Value added to produce MSM_PARAM_TIMESTAMP_MONOTONIC.
+	 * The offset doesn't change while the GPU executes a submit, and stays
+	 * zero where the counter doesn't restart.
+	 */
+	__u64 timestamp_offset;
 };
 
 struct drm_msm_param {

-- 
2.47.3

