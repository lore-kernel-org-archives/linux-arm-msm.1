Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571725;
	b=kW/BFjuWq+LuQlvWRGpf4D1lrX1dpgvKkfLYJcjNrmJLmrSW3C+0LYrWazIkhrJS3EAr
	 ObYSopZey6wY/Ej7ECoEriDZoq6C8qd5mzVyM3bWl5u01pVYMax/cTe4tOnKqNLGfPrDx
	 /JOvysh/Jv649IyJLllJNbR4cPS6GSSgEwpg2Jkxv7s1IQt5n5ZvrBiEKiu1BCXENHtvK
	 3hVRZrZPebbebJdLHcXOTg+wh/R9A6HNT4erZimeVc/pPAWWvK4dr/8UMYqX5QN1IqR8j
	 ZNtsUAe0LuxKn6Ztl3yrl+TPMWSA0HOh9Tuny4Bb49NynM6cR5Pd6uYACtSWwBTmzfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571725;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=f/TC7D20pry+/Aonp7VR6KKpRG6Wv8FkejFoFRuGgRU=;
	b=Qcz3n/Yp9ZNzq/B5O1gmpWpm9FaRoh5hKHsdJP03xUh6Bluz9zvg36O9E25Fy7rJ/9WM
	 ZXdc7hsSx/2kbggtxbi/+L5EECa6kCgdrBQWCdpo1fVX1k+uhJJfAegROYPqrjlL8/mTo
	 tPDq3sxQMpmXNQVJg15oaFXfZwLwbO4XlbkBsDLYoz4pxsv+JVPDRFvkZpBZRS9Wx/Olt
	 +vh+V67qilr5GYYWjMC5lLulk2IsF6JzOQN5qEEIKelwIoywu3mk8tol4RtHvNeFSEz0J
	 PfmoJ0+k+HbPK1EtCuP27tnmjyH0ryxF/gymjrfLGbwxS1QHTrK/bReI4EKwfGBzMRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bSM99qZu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BXNZVVLb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50235606E527
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Nov 2026 22:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50235606E527
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bSM99qZu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BXNZVVLb
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1KK3Va2377056
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Nov 2026 22:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f/TC7D20pry+/Aonp7VR6KKpRG6Wv8FkejFoFRuGgRU=; b=bSM99qZuUHuFNTgu
	4g4tuMKZFpWbKK5JryBqytjT8ssav/wg78lDxaqd8/cpoRL9N1w8D+i09//XlN0X
	2zX8FN0XtTqlxgIaIoeUqwcayW+WxvQiKlUqptDepoVypXytapqIudWlOHN4jIOr
	udPj5X9MLNVtXBCImAPNk50eib1fDssOvb2eIAtgbCbgrtDFi0A78fByhlPWSLHv
	8IEh0QUAuMyx37zoml9+EUBmV9AQWBGrMUftfELF7FtLlxE5Yq3aSI42f5zokaSC
	5quUW0lZaLOECi8oWdnwqo6KdyT4oWkqCGPlJBadpifowBPuXe10zIeK+eTIGUH9
	cZv8hw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6me21-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 22:22:04 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso5737487eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 14:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793571723; x=1794176523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f/TC7D20pry+/Aonp7VR6KKpRG6Wv8FkejFoFRuGgRU=;
        b=BXNZVVLb/39IHGd8LQ9bPjLmkThExHwk+ZZVDsa2IquYH+mWNOH/DGsoFpxwA7FKfr
         dXsyzbpHhKJ93O0zV5w6nNPCDxYBksgEZnnFmvGGf1zSO2I93YE50S/lHpWHhBigaAbK
         UtgvAyjnKvDUIffoKotbW/V2WFsL8AeEHbNyeXrqgiii68VwqXr9vVLVzPq1KFGusL80
         Ckx82kdUw83AAzJY7o+U/1URRE+/8qbMB9kLNrVn4zOdHerWtjdOvJsoovbowGmbZFJi
         AJbrVPheh7DjU0i9iRVIRjY9eoX2dk7NnIZn4a9ATG5Q7ohDbf+gz5430gXioBTMJEbJ
         RkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793571723; x=1794176523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f/TC7D20pry+/Aonp7VR6KKpRG6Wv8FkejFoFRuGgRU=;
        b=ZBpl6KBf/g/4XThjEzuitaQgn1Tea//Rvew7cX+B7ues8IqeqtKJ16DFKH6mSuTVx/
         q/eDywbqHeBRWoR/IQQHTwda9+3qV9qHWlBozrmkkXoQXlbC5YGeaIdTqT8+TjKYfUQP
         arEoHjAg0VcffnNTPw+zY4b1/OLnNd+Nf+JoWU9JbHKchzrWbRLlAaKPHW9cw1oHdBSa
         SkFoVUoXK83RV24vTlefjC1bAc/OFwj+dHIqUx/Ctc0tIzPOYy3rzI+ImynksC7wd8wm
         qQqQUYjQkhPd14jF7IonWU6ahKF6jIL0n8cd4QmPe335KvG/l1eEJ8B1ErsV5J9elsnB
         klTw==
X-Forwarded-Encrypted: i=1; AKwUvBydswaXcD3g8ZQvEkBlMVqnWqGHgxbq/qwXMB/JKWZKK5yeX+nOQ8WI4xLWUYJqlxCw0eLPMmqSCSCKVo9C@vger.kernel.org
X-Gm-Message-State: AFq9FYKk+KyJEnbrO28XWa2e2AS/UIjV+A3x+/gNDuulH35mr0DMpIuM
	lkXct4ALTiTuPfE8S3xLlR9umuRzTolCocbWsRW4Z4ssyQTqRqpUkX43eJOgW719mRLJCX/G+Hb
	nx9sr/06E8Ce+actXctM/Rp6YtgkS/St2xWifiP9Xkf2BaGsoK3DYy/Vpyuf5d8QKZv47
X-Gm-Gg: AYBFou3WYGaPRu9ldQuOGaJt4quCOujbPJKjBxAEuG+Q0grGHY9T7iGAu0u3JJDPa87
	hci1fBiMbwVhLzIYxcG22BP4TZF2vfW98I1pVDBPXnQIsUXCI/jFdEzpLDdBC862pRL2VnEfi+M
	RiPb66Bzj2hMpI6khr82TZ6L/kpyQRAJbs0pcA/GpD+DMoaTRmYyeDhyGoYsp9QEKksnDhFJFZm
	fowGcN9227wF0lSJQ4Tbn50yoLr1dBQJBAbyYnp+pRKvqu7w2E+lo6tdGT5sUcFxQzfsZYxJPCb
	Qn2YVQDxYj9MVZu0YPz0BNsubZnOrtqkcVqUzY8QCKhGG+nXsGhSqNUy2JBY8PqsG9yWHX7Fu6m
	Q9UWIUN65USy6G2HL+xj86N3s9eLuNwx0selE5tkxb5V9s1V2FaIIDuuFHe5S2X/g30EJ2mgai1
	UAtOj2Fw==
X-Received: by 2002:a05:7022:eb53:20b0:168:6ad8:e8c6 with SMTP id a92af1059eb24-1ac5d88c9c9mr12972986c88.15.1793571723010;
        Sun, 01 Nov 2026 14:22:03 -0800 (PST)
X-Received: by 2002:a05:7022:eb53:20b0:168:6ad8:e8c6 with SMTP id a92af1059eb24-1ac5d88c9c9mr12972929c88.15.1793571722307;
        Sun, 01 Nov 2026 14:22:02 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1932sm27742653c88.2.2026.11.01.14.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:22:01 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 03:51:16 +0530
Subject: [PATCH v4 03/25] accel/qda: Add compute context bank devices
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
Message-Id: <20261102-v4-v4-3-88f2f24a5f0b@qti.qualcomm.com>
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
In-Reply-To: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>, dmitry.baryshkov@oss.qualcomm.com,
        andersson@kernel.org, krzk@kernel.org, rob.clark@oss.qualcomm.com,
        jgg@ziepe.ca
Cc: lingtong@qti.qualcomm.com, cacar@qti.qualcomm.com,
        sandheep@qti.qualcomm.com, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793571679; l=10953;
 i=ekangupt@qti.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=AEvsn32ivhk3XVOKxDEqRU0Wbh3W3SdNAogbEYlrP+8=;
 b=a17HJ4E2zswJsHHcHADxbkmtxg9zb2IWt74VQjsu4HwzDA7w3N8iN10DMvNHK7UWjV5DNSQb2
 bFc+I5ii5NiAemXxBEsAlIg5MDHLmreWs+MMfGi/MfzJtsJBO3NF+Kd
X-Developer-Key: i=ekangupt@qti.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-ORIG-GUID: R_jusYBLQkOwEJ-DnTTNibz9NAjHeDkA
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae7bb8c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=myGEx3QdhjGBzXGUh0MA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: R_jusYBLQkOwEJ-DnTTNibz9NAjHeDkA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfX9K7kL8wu3jb6
 kE/88yg1G+qlybGj9mrh59wGdNb1WehNWj2hYT0isM7hwm2262lstUSj0ZN6iMebqvyYhcxLi3J
 veUOeIvA0V5O7v7IJOZP4oQgJ+Y1vfY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfX04Arf2tLvoKb
 P+Zm65UDbGkGusY7S/AEwlPPxDYHwvoS0jXyNWbSAY4jr76S7zzL/KNX1ncfd/HqMwQhHPrqaKT
 Aidiyd9oCcTPrM/NzhPbK3tw1k+JyLB/T6ogzcCxgcib4wg4j6XDgJfE6Svy/SoCZctdDgzaddq
 IBb+Qc9eeEYfBXaKpdXSWJF/Arus200Gt1R5Q33Os/Y9lYkx9C5NosmPxnrfjXLhLQuCkBB5/VZ
 CdA3IfhRvCTRpnPbQRktBZf6osQD6FxeMe0ncXW5E4flUBRbJpd1Exwn+wwOEiOVN3L7QuLjpyT
 xn7mXEnJXFayb1Gur9RSjYJOW/SLcF3oqDgjoKoynJF23hrK0W4NdQlHdasu4BUSffTsll8QQVQ
 u4ZBXtpRWeqviGv2yQAYY0TmdlLqqAYgnQAXlIsoNdadJqGk+8HTMiX96R8w8xj0ziOOtO+vnk+
 XRdlRfN7y1IuTtYM89Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010089

The DSP does not access memory through a single IOMMU domain. Its
device tree node describes a set of context banks, one
"qcom,fastrpc-compute-cb" child node each, and every context bank has
its own SMMU address space. Later patches give each session a context
bank of its own so that sessions cannot reach each other's buffers, but
that needs a struct device per context bank to allocate from.

Create a platform device for each context bank node when the rpmsg
channel probes, and destroy them again when the channel goes away or
probe fails. Registering the device is what gives it an IOMMU group
and domain: the IOMMU core probes it from the platform bus notifier
when it is added, so no driver needs to bind to it. The devices are
created before the DRM device is registered, so user space can never
reach a context bank that does not exist yet. They are destroyed after
drm_dev_unplug(), which makes sure no ioctl is still running against
them.

The width of the address space the DSP can reach differs between SoCs
and DSPs: the CDSP on Kaanapali and the platforms that use it as their
fallback compatible can address 34 bits, everything else 32. Carry this
in struct qda_soc_data, selected through the OF match data of the two
compatibles the binding defines, and apply it to each context bank with
dma_set_mask(). All CDSP instances (cdsp, cdsp1, ...) share the CDSP
width, which is why the DSP name is matched by prefix. The remaining
per-SoC parameters are added together with the code that uses them.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/accel/qda/Makefile    |  4 ++-
 drivers/accel/qda/qda_cb.c    | 76 +++++++++++++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_cb.h    | 29 +++++++++++++++++
 drivers/accel/qda/qda_drv.c   |  2 ++
 drivers/accel/qda/qda_drv.h   |  6 ++++
 drivers/accel/qda/qda_rpmsg.c | 25 ++++++++++----
 drivers/accel/qda/qda_soc.c   | 31 ++++++++++++++++++
 drivers/accel/qda/qda_soc.h   | 30 +++++++++++++++++
 8 files changed, 196 insertions(+), 7 deletions(-)

diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
index dbe809067a8b..4f2f236086a4 100644
--- a/drivers/accel/qda/Makefile
+++ b/drivers/accel/qda/Makefile
@@ -6,5 +6,7 @@
 obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
 
 qda-y := \
+	qda_cb.o \
 	qda_drv.o \
-	qda_rpmsg.o
+	qda_rpmsg.o \
+	qda_soc.o
diff --git a/drivers/accel/qda/qda_cb.c b/drivers/accel/qda/qda_cb.c
new file mode 100644
index 000000000000..afb0bb71a1f4
--- /dev/null
+++ b/drivers/accel/qda/qda_cb.c
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+#include <linux/dma-mapping.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/slab.h>
+#include <drm/drm_print.h>
+#include "qda_cb.h"
+#include "qda_drv.h"
+#include "qda_soc.h"
+
+static int qda_create_cb_device(struct qda_dev *qdev, struct device_node *cb_node)
+{
+	struct qda_cb_dev *entry;
+	struct platform_device *pdev;
+	u32 dma_bits;
+	int ret;
+
+	pdev = of_platform_device_create(cb_node, NULL, qdev->dev);
+	if (!pdev) {
+		drm_err(&qdev->drm_dev, "Failed to create CB device for %pOFn\n", cb_node);
+		return -ENODEV;
+	}
+
+	dma_bits = qda_soc_dma_addr_bits(qdev);
+	ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(dma_bits));
+	if (ret) {
+		drm_err(&qdev->drm_dev, "%u-bit DMA enable failed for %pOFn: %d\n",
+			dma_bits, cb_node, ret);
+		goto err_destroy;
+	}
+
+	entry = kzalloc_obj(*entry);
+	if (!entry) {
+		ret = -ENOMEM;
+		goto err_destroy;
+	}
+
+	entry->pdev = pdev;
+	list_add_tail(&entry->node, &qdev->cb_devs);
+
+	return 0;
+
+err_destroy:
+	of_platform_device_destroy(&pdev->dev, NULL);
+	return ret;
+}
+
+int qda_cb_populate(struct qda_dev *qdev, struct device_node *parent_node)
+{
+	int ret;
+
+	for_each_available_child_of_node_scoped(parent_node, child) {
+		if (!of_device_is_compatible(child, "qcom,fastrpc-compute-cb"))
+			continue;
+
+		ret = qda_create_cb_device(qdev, child);
+		if (ret) {
+			qda_cb_unpopulate(qdev);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+void qda_cb_unpopulate(struct qda_dev *qdev)
+{
+	struct qda_cb_dev *entry, *tmp;
+
+	list_for_each_entry_safe(entry, tmp, &qdev->cb_devs, node) {
+		list_del(&entry->node);
+		of_platform_device_destroy(&entry->pdev->dev, NULL);
+		kfree(entry);
+	}
+}
diff --git a/drivers/accel/qda/qda_cb.h b/drivers/accel/qda/qda_cb.h
new file mode 100644
index 000000000000..070dc1de67a0
--- /dev/null
+++ b/drivers/accel/qda/qda_cb.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __QDA_CB_H__
+#define __QDA_CB_H__
+
+#include <linux/list.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include "qda_drv.h"
+
+/**
+ * struct qda_cb_dev - Bookkeeping for one compute context bank device
+ */
+struct qda_cb_dev {
+	/** @node: Entry in &qda_dev.cb_devs */
+	struct list_head node;
+	/** @pdev: Platform device created for the context bank node */
+	struct platform_device *pdev;
+};
+
+/* Create a device for each context bank child node of @parent_node */
+int qda_cb_populate(struct qda_dev *qdev, struct device_node *parent_node);
+/* Destroy every context bank device created by qda_cb_populate() */
+void qda_cb_unpopulate(struct qda_dev *qdev);
+
+#endif /* __QDA_CB_H__ */
diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
index f4430332ff6e..6ecb6a966f68 100644
--- a/drivers/accel/qda/qda_drv.c
+++ b/drivers/accel/qda/qda_drv.c
@@ -65,6 +65,8 @@ struct qda_dev *qda_alloc_device(struct device *dev)
 	if (IS_ERR(qdev))
 		return ERR_CAST(qdev);
 
+	INIT_LIST_HEAD(&qdev->cb_devs);
+
 	return qdev;
 }
 
diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
index dd3345b6a5ad..737232f7027f 100644
--- a/drivers/accel/qda/qda_drv.h
+++ b/drivers/accel/qda/qda_drv.h
@@ -7,11 +7,13 @@
 #define __QDA_DRV_H__
 
 #include <linux/device.h>
+#include <linux/list.h>
 #include <linux/rpmsg.h>
 #include <linux/types.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
+#include "qda_soc.h"
 
 /* Driver identification */
 #define QDA_DRIVER_NAME "qda"
@@ -41,6 +43,10 @@ struct qda_dev {
 	struct rpmsg_device *rpdev;
 	/** @dev: Underlying Linux device */
 	struct device *dev;
+	/** @cb_devs: Compute context-bank (CB) child devices */
+	struct list_head cb_devs;
+	/** @soc_data: Per-SoC DSP integration parameters */
+	const struct qda_soc_data *soc_data;
 	/** @dsp_name: Name of the DSP domain (e.g. "cdsp", "adsp") */
 	const char *dsp_name;
 };
diff --git a/drivers/accel/qda/qda_rpmsg.c b/drivers/accel/qda/qda_rpmsg.c
index 6bd977e8d68a..78b5f31974c1 100644
--- a/drivers/accel/qda/qda_rpmsg.c
+++ b/drivers/accel/qda/qda_rpmsg.c
@@ -5,18 +5,18 @@
 #include <linux/rpmsg.h>
 #include <drm/drm_print.h>
 
+#include "qda_cb.h"
 #include "qda_drv.h"
+#include "qda_soc.h"
 
 /*
  * Both compatibles the binding defines are matched here. The glymur, hawi,
  * maili and nord nodes name "qcom,kaanapali-fastrpc" as their fallback
- * compatible and so are matched by that entry. Per-SoC DSP parameters are
- * attached as match data by a later patch, once there is something that
- * consumes them.
+ * compatible and so are matched by that entry.
  */
 static const struct of_device_id qda_rpmsg_of_match[] = {
-	{ .compatible = "qcom,kaanapali-fastrpc" },
-	{ .compatible = "qcom,fastrpc" },
+	{ .compatible = "qcom,kaanapali-fastrpc", .data = &kaanapali_soc_data },
+	{ .compatible = "qcom,fastrpc", .data = &default_soc_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qda_rpmsg_of_match);
@@ -58,6 +58,7 @@ static void qda_rpmsg_remove(struct rpmsg_device *rpdev)
 	 */
 	drm_dev_unplug(&qdev->drm_dev);
 	qdev->rpdev = NULL;
+	qda_cb_unpopulate(qdev);
 }
 
 static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
@@ -69,13 +70,25 @@ static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
 	if (IS_ERR(qdev))
 		return PTR_ERR(qdev);
 
+	qdev->soc_data = of_device_get_match_data(&rpdev->dev);
+	if (!qdev->soc_data)
+		return -ENODEV;
+
 	ret = of_property_read_string(rpdev->dev.of_node, "label", &qdev->dsp_name);
 	if (ret) {
 		dev_err(&rpdev->dev, "Missing 'label' property in DT node: %d\n", ret);
 		return ret;
 	}
 
-	return qda_register_device(qdev);
+	ret = qda_cb_populate(qdev, rpdev->dev.of_node);
+	if (ret)
+		return ret;
+
+	ret = qda_register_device(qdev);
+	if (ret)
+		qda_cb_unpopulate(qdev);
+
+	return ret;
 }
 
 static struct rpmsg_driver qda_rpmsg_driver = {
diff --git a/drivers/accel/qda/qda_soc.c b/drivers/accel/qda/qda_soc.c
new file mode 100644
index 000000000000..323b620b8adb
--- /dev/null
+++ b/drivers/accel/qda/qda_soc.c
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+#include <linux/string.h>
+#include "qda_drv.h"
+#include "qda_soc.h"
+
+const struct qda_soc_data kaanapali_soc_data = {
+	.dma_addr_bits_cdsp = 34,
+	.dma_addr_bits_default = 32,
+};
+
+const struct qda_soc_data default_soc_data = {
+	.dma_addr_bits_cdsp = 32,
+	.dma_addr_bits_default = 32,
+};
+
+/**
+ * qda_soc_dma_addr_bits() - DMA address width of a device's context banks
+ * @qdev: QDA device
+ *
+ * All CDSP instances (cdsp, cdsp1, ...) share the CDSP width.
+ *
+ * Return: Number of DMA address bits the DSP can address on @qdev
+ */
+u32 qda_soc_dma_addr_bits(const struct qda_dev *qdev)
+{
+	if (!strncmp(qdev->dsp_name, "cdsp", 4))
+		return qdev->soc_data->dma_addr_bits_cdsp;
+
+	return qdev->soc_data->dma_addr_bits_default;
+}
diff --git a/drivers/accel/qda/qda_soc.h b/drivers/accel/qda/qda_soc.h
new file mode 100644
index 000000000000..b052964f11ae
--- /dev/null
+++ b/drivers/accel/qda/qda_soc.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __QDA_SOC_H__
+#define __QDA_SOC_H__
+
+#include <linux/types.h>
+
+struct qda_dev;
+
+/**
+ * struct qda_soc_data - Per-SoC DSP integration parameters
+ *
+ * Selected by OF match on the fastrpc node; see qda_rpmsg.c.
+ */
+struct qda_soc_data {
+	/** @dma_addr_bits_cdsp: DMA address width of CDSP context banks */
+	u32 dma_addr_bits_cdsp;
+	/** @dma_addr_bits_default: DMA address width of all other context banks */
+	u32 dma_addr_bits_default;
+};
+
+extern const struct qda_soc_data kaanapali_soc_data;
+extern const struct qda_soc_data default_soc_data;
+
+u32 qda_soc_dma_addr_bits(const struct qda_dev *qdev);
+
+#endif /* __QDA_SOC_H__ */

-- 
2.34.1

