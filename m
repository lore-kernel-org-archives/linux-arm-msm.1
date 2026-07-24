Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FB53F9A15
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 09:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784886602; cv=none; b=CGBuim0NS8O9NCANUuQweXsIiCZhrV91HPKFw/k7LRdv7VbWmTs3pa0VSUevLH2DcyBH2SLFvHVLK+AQCr5xhzw5+Ps4GgkjDtVOchp7Cjphw/78nQrMWoNpI1DOP+JOUAa3zzzc2ts+HcMPhsiAqHZeM27StbbYHzq0vTNpslM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784886602; c=relaxed/simple;
	bh=nGzwYW9XMYjIOpU7rm2Up8e85vxgCyaRTXlm2Pc71PE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ife8qVo300THuo3keiW0hGR3V8g7jVton6UON0wTteXA/mtqeOJiwgO4TEkPU2XP9b1nRfKYPjrlxu+UaTyc2vPMY8Dgt4D7xMFQa+ptaQsW8pNLCJpWZQZvghrRMikx7jKb/gABmzZeatoKUZBNAufWRMbN2hX/tItx0ArQPBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R10iBRgt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WamEOW46; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R10iBRgt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WamEOW46"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O9MObv2755203
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 09:49:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OHVNsbMAYbj
	kQ1t/N6D0ZmoMvxe2Y1h1gCTZ8ANDnOQ=; b=R10iBRgtIHc5k431AFgF6aMc4Tu
	5pAOCkmCCoZYMHRpaCU1vLZoL4R2R5U/rjNeOxetx4TniDFvN7JNbhXmjYtplNN8
	6Xsjzm8365DE90A/nzEFBC5g3HL1T2Me5uUGW4VdZhBKWG1YNmolNh7mJdtcfBNZ
	P0HzeUr5/tbOAyaDbHKXvmfzQU7IFpX1rBONmhA0gG4LrdZ2lNFh1s6UJaP9Wmoj
	D5Y6kizXa1kSkA7yZmT/0G0LWWYZpD8sMGuQgQqXzFcss0czdzhg4ag+64U9FjTk
	e/1iGsvjYCiVytsaY1mhz0ZANjElBn1tCaFL8YptZUeiBgJMoe9NkpoCf8w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5byr3bk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 09:49:59 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbb6433e9d4so385235a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 02:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784886599; x=1785491399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OHVNsbMAYbjkQ1t/N6D0ZmoMvxe2Y1h1gCTZ8ANDnOQ=;
        b=WamEOW46QIGsClLra4MVvYqNf0fOnis2wA5WVVAkWcVREr1ThAzcy6J/UH3Xf1Vusu
         Roa4D7bGCsR3CPUa7oMqi70sXCzZU9ahV+sfqyfwkrhwrPPhKfEOWGhJfZdMh6JVpQMW
         4PaEuN7GS2EhWvZS1rHxSwCAf57Iv6S33c/VLBGlNfd8XACwcltvG3uHfmgftcjzb9Y1
         25KMj12wIaXIx5UQ9ji1ZiTm4U42QqL7q+YTtz9XcTtlBztYF+8nRmlKD1uNSvYSNLn5
         8qj0QCblO/aJL7NYyMJs6rAXaHYLfN/CeffeOC+3i6OxueB2tivW9grmaRZfshQmhP5+
         XdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784886599; x=1785491399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OHVNsbMAYbjkQ1t/N6D0ZmoMvxe2Y1h1gCTZ8ANDnOQ=;
        b=oPU4uNaK2uH5YfwEJtlpmZawbqj4wFQ2I96tyPIVcv0JtEn/par+zA44fp520Iomb/
         vYu/j5ztnn6GEgA5h0FkSf5+A/axCZcyNPvB9/uiRURSydDVjRKSh8EP5wXYKoJYxgmv
         /3Otly+XK6zLrUhJ/BRZ9AGlwFzinEqqLRmxvuh+XR/+/q/DE/7zwI8lDfbFso8DUW93
         V+8kfgzMI1KHUoeOHlZKDlOJUrv4NzAKbCTq20Hn6TU3dxeDVtPGjpYnqWE6PqgT00Fw
         /AP6pmlV33bE2A4YwAqjklbPc054fiEql9fU40uS86IGXpVB8C8CFJle2RnQj//4KmfT
         cUrg==
X-Gm-Message-State: AOJu0YxK/aFR978fkEF9hbNQS8G+wwwmOJU4cW9LChgWyR7c73IGScM+
	7/Iw/kj4WShuVWg9zhjy03lnFPsc/jLXpcBbiOM4mDE/Dr1TsAGcghXFNoEsSUsgaWnBcAMadmv
	CI11MRxSMKp9BWo2jBvzDkqDHSc4uw3dIVBecuUi2AW6LAhaBUs5jskcTO9bOUn0JfPKv
X-Gm-Gg: AR+sD13/2DPab0n569jFdTGrK+bbfrmfRZ9axLYUdmvsSYaqJLZwfEA+/d01rfwg0j4
	qzih8vLHP0losDuxW2+rqwO97smRU2OR+3K4a3v6PiXoehfc5DdXOk+c8MRnE3Vu03rx9dXA4yA
	+6pYlG3dy/0VdVJ48hKeLrZV+X6Vg8z7YfE1KbHxd6d+Se7nvdt5MV/yLAIP5w/ObxFd9en7mvC
	9WXuOw9UVXBH/hYXp8hFydHkv40Kgc2GPHHihqbrZXZxlijkYB7I290k9Ya3MAqXWcQ3QRLD3PJ
	5ds7cYoI8VmQsarXf3IkWHjZCpHpkAJOO80u8w6USBS+6imrgFc7/plJMoix+GiSEZQBJCjwIyn
	KKAL75ikrA2BUBISuZSqMRixblc8=
X-Received: by 2002:a05:6a20:1449:b0:3c3:7ac4:dac7 with SMTP id adf61e73a8af0-3c44b190aa1mr7584972637.45.1784886598616;
        Fri, 24 Jul 2026 02:49:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:1449:b0:3c3:7ac4:dac7 with SMTP id adf61e73a8af0-3c44b190aa1mr7584933637.45.1784886598176;
        Fri, 24 Jul 2026 02:49:58 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f1a8a7csm3961013a12.24.2026.07.24.02.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:49:57 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Andrew Halaney <ahalaney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 3/3] firmware: qcom: scm: Fix tzmem state on probe retry
Date: Fri, 24 Jul 2026 15:19:39 +0530
Message-ID: <20260724094939.613844-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260724094939.613844-1-mukesh.ojha@oss.qualcomm.com>
References: <20260724094939.613844-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WJ73N1W5fYJrXYPft77C4sOB1hH9F-Fb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA4OSBTYWx0ZWRfX8DCQoohDigyG
 pP2VioQzotkydIY1mOhkc5XFqmexA9rVyVDMB+/KyLJoHHoAc8WppNZYDuTnHpbzpBi4BnCXk2Z
 1Iv2AMoUzTiw8BXPN9ySlQbruMuQ+Is=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA4OSBTYWx0ZWRfXw6lqwy7Kud/J
 H5Esvx60xhqTuK8RVlfxqe3tI1XDzMSkJzzwsFwmaYfflcHDSxT6LL0ZKpZwhoJB5jVC3BivvQ5
 i5ThyUXRCDqh3SUeKkrRItscz/mpWfQugEUia0bju1NZmtuil7fdik3QXxbHl1YplV9Srosd/ol
 cKIfIlNUaJfRfMcRlvxvEiqMW5yqEGzzAEnac3qyNIUF75HJCWg5Qa6IJT4YIhpc9ds77gcxXLU
 lVkG7fACVoLkGc5040GivlxpYnjJuEYBu9iiR3zTjIb624wE69azVTI5uifeJnUTyUt98Onkd77
 doUYAi4eA5m5qpVNJPEq7yJd4N2lECTsOiiu8C5ehkEyUAaB4KbTeH7kNOs93gzxWmITGVBz1/d
 rAJFLyZ0uFc6hoVQrDQXYg8ox9RGk+fmhKRp0tY9Rwh6+JX1XCqrbWhDTB+VU02iTXW3xiO8UUi
 OxVVC5Mb8VqPcjqqF1g==
X-Proofpoint-GUID: WJ73N1W5fYJrXYPft77C4sOB1hH9F-Fb
X-Authority-Analysis: v=2.4 cv=GMA41ONK c=1 sm=1 tr=0 ts=6a633547 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Wn-X5jRZ7-pqfG1RE4UA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240089

qcom_tzmem_enable() returns -EBUSY if called a second time, but this
causes probe retries to fail permanently if a later step in
qcom_scm_probe() defers after qcom_tzmem_enable() has already succeeded.

Use DO_ONCE() to ensure qcom_tzmem_init() runs exactly once across all
calls in a thread-safe manner. qcom_tzmem_dev is set on every call since
probe retries use the same device pointer. The result of the first
initialisation is cached and returned to every subsequent caller.

Fixes: 40289e35ca52 ("firmware: qcom: scm: enable the TZ mem allocator")
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_tzmem.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index 0635cbeacfc8..0fd9581275f1 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -15,6 +15,7 @@
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/mm.h>
+#include <linux/once.h>
 #include <linux/radix-tree.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
@@ -507,14 +508,18 @@ phys_addr_t qcom_tzmem_to_phys(void *vaddr)
 }
 EXPORT_SYMBOL_GPL(qcom_tzmem_to_phys);
 
+static void qcom_tzmem_do_init(int *result)
+{
+	*result = qcom_tzmem_init();
+}
+
 int qcom_tzmem_enable(struct device *dev)
 {
-	if (qcom_tzmem_dev)
-		return -EBUSY;
+	static int result;
 
 	qcom_tzmem_dev = dev;
-
-	return qcom_tzmem_init();
+	DO_ONCE(qcom_tzmem_do_init, &result);
+	return result;
 }
 EXPORT_SYMBOL_GPL(qcom_tzmem_enable);
 
-- 
2.53.0

