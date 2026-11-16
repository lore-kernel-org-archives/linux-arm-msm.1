Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794848767;
	b=vIaeA35sPoSYGtuAZBw220Yc8ALOmNTPPbhVsoiDmVlWndRkaYR+9l0bNJan773QVtOV
	 IVjoSwh9joQUf8kjF0enycX44ddKhkqQqtPzM2Ix4yrfIucBLb0ArAcBsPNoxYamsEqO+
	 wxruz5/C9xZ9yKPGMqfPLwS7FEWz82IJD7UfRQrVZOSVpuVPORrlwkplqdnm3DNnLN2MX
	 ipq5OzZSeDo8rXu1gKJC0h47x5q/dqUEc4V5toUy6YSIwpa6YH0KHylB1IflLnzkk1LTn
	 EA8g/E74X7Fv8QRiuNAIZAsZNy+KfYXvBpcSIlbOM3dW2zHXVyuPuHZC4/JyPeT9oPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794848767;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nlwXqUzRRfb3OGnpB2HAjr8KEu2310plJJVrSuvmiKg=;
	b=qw71tKBEyi6rMKdRrHOaFTkHmQ5HofKuhwVmimNx3AzEgzwyD6LJckMSb4lWf0nNsGEr
	 P4oTnQYMnY02A4jb9UhvqoFtCVqWkBpT2WC83SP9BaISGE1mlHr0uAw5ymrPr8cIvjGS6
	 6L7lXeFgrEJgyN9YZNKFXi446I++2Jy5keADKmfSjAmyd6ivME0zpz+EtPASLpKJ2uvuL
	 h6iGu3hJM+MZpL7co4l4cQNcVshkY0DjxrNf0m3RIhvYK47dLrqIT7MsmEOsSa0qQuORa
	 /i2RtXMB4FIej8DmnbqTTctvQhAC3pUkc9YME+CDBroAV1VfgoVvG4PPluLoYdKCbJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YvmyvPJm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hwC1dacx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272E1606A33F
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 17:06:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 272E1606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YvmyvPJm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hwC1dacx
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIG8K2126172
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 17:06:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nlwXqUzRRfb3OGnpB2HAjr8KEu2310plJJVrSuvmiKg=; b=YvmyvPJmHAH4BW/V
	3xoDxdCPicyZKJKr985TmfU/jEQekg435JvA0U+Buc31+I4dMtlKKxq3clbCx1xT
	rw7uQd6eM02D4YRZCwm81BVWkaHDUmiXg7k7ox9/GGMdfCGrtaoMPlVq9OFWJ1Cd
	g8yts6zBldVZPyI6RMjjNxhMxrLljx9QMKtI2/C5SMYKfF7XvUh/PAL0H6zawdYJ
	N2EzGuh+GYEOTZZ/swoyuWD990SF/Na4IEh/xisDlpGX3lwUnoyZyqecLrVegGCr
	x0w6GFugy5P72stPPO5XQZ23q0U4JSAhdbVcOTqQhzS7Vf5Cev28VzuW6M4YPCj7
	yYrEsw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyxx2huur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 17:06:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ee04c49451so51835135ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 09:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794848765; x=1795453565; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nlwXqUzRRfb3OGnpB2HAjr8KEu2310plJJVrSuvmiKg=;
        b=hwC1dacxrU1Ug4jeUJNwU6BjTFTQvym8ZxSx7KZIAffoZqx8SkZwkNzSWAWGOoCy8b
         E/Wq3kjfAIjj6sbMgzb4ltxjKmTmchzy4WY6uvzLio9Z8Ro6m08z5RazRkjd5z6GZJ33
         MLFrB4y3W91YyJB83RxFKbABxNPE3q5ccpa5H0vOXQ2S5NgCpUPiCIZTlDGC8bSRJ+Gj
         sQRZQKv81RqBx7yjVzKKZcl2gO+Jgbah6YQxAxanVuvKF346DVLdlaJrrG1vTbpGfUCx
         DnJXhMwUSb9zm8zrbQuuohVT8LTIMOQEs6id25InfBBqZ89EbtIwBjJmnjXeVG3vCDZe
         0HyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794848765; x=1795453565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nlwXqUzRRfb3OGnpB2HAjr8KEu2310plJJVrSuvmiKg=;
        b=SeC9EFtgwKMIWvRB9na/ENxZbBa4X/VpH9Tgr0rXEMQa9dDFbb2Wbfq6BNnHU+aXSj
         nTzYyHH2wsawHAqTGWArqxi1l0+3XleUn3fouaukTNcz5LAruTDW3MtLEL0Wmy0HVRAQ
         4sChD8kCXJZb+NbS7A5lHz1c124sVTPXX8DBoBRsF3qLkFUYSw890VKTAPcXDwxuYPbb
         0eXS6nXdWCXaCbyEP6182A8skFcP0VhrALM3oQ92TkGbVLgR+cXghkCA6e/DqdZ8X5mw
         toXs0eGxA8wqyxTaEeVULELMfvPkG8V+AlL2DrU/+cdx5/htRIRLt1KdX5ouX8g8+G3z
         gHKw==
X-Forwarded-Encrypted: i=1; AL+hErF0A/JWBO+ulu+Zcjcrr3dU54s30lXVjo2sYfBjWcIzB9Gh57ZhjGx+t8mpPngRUviqoGVHAaZa7RSgNoTR@vger.kernel.org
X-Gm-Message-State: APuU4Z9VOSuLuxODL+Szmg/+s2rH5YI9PBX5lTunZ8m2+tKdKHqJ9012
	cJ8PqkJvdQ50nen4fgVVBSlu74JjIkMgvO6CPbyyudEMBPpJOSWb4CqclPu8eEAXrl7uqABbVc2
	P5oS/YWmcoMrZUNhtLjkABxxDrWbz15ceG/T9MGkqh82T+j3cnxWM+exvK7toCraCKtb7
X-Gm-Gg: AZFdTZfFcT/Mg5yhKuilqd50qyYhN07OX0sZ6bVnpp1/lW6IfIMNjavTAghSsEq9csC
	BfemPKoagiRuTa+kZl05poms5n0qQnI8OOePi89ix/0QBd47hKPmlgjADC+tRBofNBvW4Ju3Ltx
	VGRggLJ3X7HqGeBhNPEpZ1wgU6Cy03apYOuj2s1kcEEAOas7KsIyqDYSR+MzZl8M4lkD6cvWz0W
	t50zOPx63mkQ8iY1jcOdqbYG2e0v1YbEnRD8PNOtExvyxqr4CDMOCfasqCqzAICSI8Rq9t5fBC7
	O+CHTMYfighT1VVu2r+ppQ0k3bxKFkuc3p1pjq+t7B+N9ZxVh3cRLjLHSrhxNPGysdQmJIazmlT
	P/AkxRm8Cto+J6jL7fli99V9ioMJsLD3NgG6pmp5h8FlXGHKMEM1hZD260qI6Dz6bibpovc94DZ
	IiJTly
X-Received: by 2002:a17:903:32c6:b0:2ed:21fb:e764 with SMTP id d9443c01a7336-2ee0da98d1cmr111893265ad.16.1794848765107;
        Mon, 16 Nov 2026 09:06:05 -0800 (PST)
X-Received: by 2002:a17:903:32c6:b0:2ed:21fb:e764 with SMTP id d9443c01a7336-2ee0da98d1cmr111892905ad.16.1794848764618;
        Mon, 16 Nov 2026 09:06:04 -0800 (PST)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7abfdc4sm2174605ad.75.2026.11.16.09.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:06:04 -0800 (PST)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 22:35:52 +0530
Subject: [PATCH v4 2/3] media: uapi: Add Qualcomm iris MBR rate control
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
Message-Id: <20261116-b4-add_sc7280_mbr-v4-2-636fb6bc8772@oss.qualcomm.com>
References: <20261116-b4-add_sc7280_mbr-v4-0-636fb6bc8772@oss.qualcomm.com>
In-Reply-To: <20261116-b4-add_sc7280_mbr-v4-0-636fb6bc8772@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794848753; l=3597;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=MUVQ3bz9IM6JPszLI1kBbzmCcPvTX8QFrtQh1MrfGAU=;
 b=0nAeaN5Do3G5JmFFS78nNwBTss83PQbbgGMRpFZ4YWwUu8/hJ0bwxlzOcK/fX7Jvjo7Ry6l5y
 XeyStTY/HCpASbcAWOEhKRXqKSLFvFQb/UELd6aHMi0DuRg7dhq1U0t
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Authority-Analysis: v=2.4 cv=R7WWitRX c=1 sm=1 tr=0 ts=6afb37fe cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=hlx5QhHZQzrwP0BnnOAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2OCBTYWx0ZWRfX52yN1DW8Ry6A
 WBPZCX/pSsg9PWbVYXoe1yw19Ki7bqOhPw2XsCa2NCAOsGeCTJykrk4VCJN3FZ4jumb7GdK71yo
 VIwB8e15eL1wBsZr+GnZJFkxc+3oVws=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2OCBTYWx0ZWRfX03fRR8yyFycb
 ljHxSlArtq9fuGfse9TRVFkNzrh+bOCD+I97fRX8ttNDNEQkbmJL34qFB0UZEf15XmeMYasy8/O
 uzTVDS8s3MMuMExmduiA9GQKQNERgjF/1kVoT46Yo7mihl+IuPhGOmDINTuhsnqmwk3pi1vxwHn
 OQllFnDO7dPiuluHM6cZ24FdqGEQsRilNhQXgkhrvVeUx/4XE6odansfXqtnkrRXYWI3aKxe1Pl
 nnGGqWs2LYxpv5XyWMXJerfNShe4+ztsO57vG0JAh2ZbE8yYn1Y9FJQwJpqZbP1pNGkrOtYgXqI
 HsFkDpQGcrrf2qH9Yh+sR98/wxMdFDfwW5pnzexh59WJa+zVbQztHJS3Y54fEqP0lFqLLGYJ5Vr
 bl1E7KFWOqb1JZ8Bvf0/3iTWrnqgIYov+WqpinuSmdMhRcHnC3Ivg3PZRhs+azaskjwjW1UBHwa
 fdIaTxiGH2mMIi9juiQ==
X-Proofpoint-GUID: CmQzpSjMuv1ToHhXnK8nbqMBxEk6eGKK
X-Proofpoint-ORIG-GUID: CmQzpSjMuv1ToHhXnK8nbqMBxEk6eGKK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160068

Add include/uapi/linux/media/qcom/iris-config.h defining
V4L2_CID_QCOM_MBR_RATE_CONTROL, the first control in the
V4L2_CID_USER_QCOM_IRIS_BASE range, so that userspace can use it.

Document the control in
Documentation/userspace-api/media/drivers/qcom-iris.rst and add both
files to the Qualcomm iris MAINTAINERS entry.

Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
 .../userspace-api/media/drivers/index.rst          |  1 +
 .../userspace-api/media/drivers/qcom-iris.rst      | 28 ++++++++++++++++++++++
 MAINTAINERS                                        |  2 ++
 include/uapi/linux/media/qcom/iris-config.h        | 15 ++++++++++++
 4 files changed, 46 insertions(+)

diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
index 8d2c489b8453..66cb9773bd4b 100644
--- a/Documentation/userspace-api/media/drivers/index.rst
+++ b/Documentation/userspace-api/media/drivers/index.rst
@@ -37,6 +37,7 @@ For more details see the file COPYING in the source distribution of Linux.
 	max2175
 	npcm-video
 	omap3isp-uapi
+	qcom-iris
 	thp7312
 	uvcvideo
 	vgxy61
diff --git a/Documentation/userspace-api/media/drivers/qcom-iris.rst b/Documentation/userspace-api/media/drivers/qcom-iris.rst
new file mode 100644
index 000000000000..49f70ef49d6c
--- /dev/null
+++ b/Documentation/userspace-api/media/drivers/qcom-iris.rst
@@ -0,0 +1,28 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Qualcomm Iris video driver
+==========================
+
+The Qualcomm Iris video driver implements the following driver-specific
+control.
+
+Driver-specific Controls
+------------------------
+
+``V4L2_CID_QCOM_MBR_RATE_CONTROL (boolean)``
+    MBR Rate Control is a VBR Rate Control mode optimized for
+    surveillance video content, which has high temporal correlation
+    due to static camera positions. This Rate Control smartly identifies
+    key-frames in the scene, and allocates more bits to them to improve
+    the coding efficiency by taking advantage of high temporal
+    correlation in surveillance videos.
+
+    .. flat-table::
+        :header-rows:  0
+        :stub-columns: 0
+        :widths:       1 4
+
+        * - ``0``
+          - MBR Rate Control is disabled (default).
+        * - ``1``
+          - MBR Rate Control is enabled.
diff --git a/MAINTAINERS b/MAINTAINERS
index 760791e3635f..f28f235f5cb1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22599,7 +22599,9 @@ L:	linux-media@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/qcom,*-iris.yaml
+F:	Documentation/userspace-api/media/drivers/qcom-iris.rst
 F:	drivers/media/platform/qcom/iris/
+F:	include/uapi/linux/media/qcom/iris-config.h
 
 QUALCOMM MIPI CSI2 PHY DRIVER
 M:	Bryan O'Donoghue <bod@kernel.org>
diff --git a/include/uapi/linux/media/qcom/iris-config.h b/include/uapi/linux/media/qcom/iris-config.h
new file mode 100644
index 000000000000..0551b61aa06c
--- /dev/null
+++ b/include/uapi/linux/media/qcom/iris-config.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/*
+ * Qualcomm Iris Video Driver - Userspace API
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __UAPI_QCOM_IRIS_CONFIG_H
+#define __UAPI_QCOM_IRIS_CONFIG_H
+
+#include <linux/v4l2-controls.h>
+
+#define V4L2_CID_QCOM_MBR_RATE_CONTROL	(V4L2_CID_USER_QCOM_IRIS_BASE + 0x0)
+
+#endif /* __UAPI_QCOM_IRIS_CONFIG_H */

-- 
2.34.1

