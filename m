Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B20B3168EE
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 04:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786942122; cv=none; b=ZmVweNOBaApYY0HV2Ps9aSF1nCuI/CqLgv/KoBi4OyT/1OIi3hrKunGB3cTKH+KbNwKYdnbMA0FygTao2ssagxmbSQBVv8JdQYd8X5zRwIlgg9/O+vKpSHiHNxSSuCouh9z7eRb55EoF9gUEn6rMvA/tlPwpihXnvxlMjjgbANM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786942122; c=relaxed/simple;
	bh=vyyAKW+sDxkJvnWkRtGMDfJQbird7CY22fXpG75dfI8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QYNH3Nba9TH8GZ5QfV0E1eUxgRgMyNVkLagNsxsKMsUPfMCeEj2IYbVCDY+8YpCaeJQZRLw7YFwBmN8Aj0lMRi9BTS21pNT3aasSpgiJzm+WDaU5eSNf12URV5nKbBvnbUCd6gXsI2f4ksyYlk2yjqfkQpzVkB8OiZvMNPevPqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jBMwGdK9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rq21t6/X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jBMwGdK9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rq21t6/X"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GLCiRq343401
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 04:48:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gnJNXuCmyusrhVQ5qCCdytU60hZXzPi/toGazcunr3U=; b=jBMwGdK9HwDpevJ+
	rux7M8rbogOqak+z1h8o0F/65/2ZWH1ceAO30uzQBJUSrdJXjjM4Rn15gqkkwBfx
	2KNRpNz8UDNVWf67s5UhXkTS+lauL2K3oI++tWL6uGOynfDxyzG477686ru+x27J
	X3To5VgsZehwbqBVQHiwd5DFmyF2uE+2OkF/unhanTD1bPSuID4fuqqnG5lp7s2N
	haqkZmFX8ATkcodAvMgIrXLtfdt7vjm4xQtI5/y4uJVuYWgODthskV7DKDGI6z9b
	iy5pmHWIS7c8miVAMaqcWfHjYzAQTnUCHT+54C/fOceqcRZ1JbMNgprII9qEFbKZ
	h8Bthw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghena74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 04:48:39 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8487ed7f7beso2933095b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 21:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786942119; x=1787546919; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gnJNXuCmyusrhVQ5qCCdytU60hZXzPi/toGazcunr3U=;
        b=Rq21t6/XBunQPzpQXMU436910dE1ZI2LLam8oIRhIva7UiUcO4yu1SYbmFpbZN6Uij
         jPk8yWsEipuX+BedbBwuEIrLIWd7pzZsGECguCfaNjOSgjScOcarLtJ1WOBn8cKSC766
         /m8d+XjmmbImb4BaXHnv9GKG9fNnTb9ZRZ+ZLtDrV7mVm9+7ZS9+8kKcy2nygwELAuSY
         cO/i71CIOkDmCW6sItw+P12CfQiFKuQBdO84RYKhND07Ct6O6XTmYge3OqPZ3BVHD1jv
         sHCd/Gm4tctQilCX7YCU74wHnk4QcgLhgT5tzUxCZEVHOx/VAslL/BuDFRSYQF+o8ujP
         UDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786942119; x=1787546919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gnJNXuCmyusrhVQ5qCCdytU60hZXzPi/toGazcunr3U=;
        b=eZwtgTVN/O739N3ZRw7aVoblAamPD4swts3EMSvqtjusk1MKHJPZY/Ffz1fx6pUiBN
         qyW+vksoxQT9/usa5o7kySDjG4Tby5SPLuLPGprGDMsVW/148FBvjrosOLgOblns4pnp
         3PspOVmzGB+N5z+0OoQwnsmAnJd/s8/ZhNVT8EmT1w3pPPDMThDkZLpH2KQMz4L1yEUq
         1HFSXsNut09fvizwDQuwPd/6o+AQWLciE/NZHnP/PxTEPyI+/i4s/5gkiRbANx1dLrAd
         tT620gzMpXBOl+/6yzCWtuJcF5i4+JOEqH4HFCxpczaIM/g7ZkigCJxQwLZkARMM/PZe
         SIpA==
X-Forwarded-Encrypted: i=1; AHgh+Roa70iuP6AGzpcJ9M0ouhuSQCXyrhjF7rGfCSjpOzpLuEI+pb6tSOIRkGAei1mzq3pNtx9yaCvL9UJCvGVT@vger.kernel.org
X-Gm-Message-State: AOJu0YwptHR1ZMAV8ZyCQgDtU0EQMZNC8AxWk0ssWwWRoj5CZcphXP0M
	zfTLmcc3m1uPFvCG/vRFv2bY5rXwNYmj2YMrha29LR/PBuICgwlNt3HoPMYpfz2rYWHCwdxd2JV
	C5WIz/l7NerZqBlMl3QJGuN61s/SNXokQ8levpJWGiRfmucWGgMC7RaBT3b11kYCFywri
X-Gm-Gg: AR+sD13KJxGw9+TkNCIpVgjhvfmYO8TU6/RwRglHhi1g6fuO3Sn+MCYi6xuzTk7zXBG
	wffqSB2aowB0oS9neFYmuIDq8Wn4chJHrIZLtXoJPXiL5fAiHz2R4jw2qoUIF4IbL0NqL38quO3
	gA2YQxYPrxdiBSeGlA+JfZGiyBsY6UILMuYBsoBnZAtQUOIdVqkiVgqW6nVkwiwlL9XieEmpqZK
	VZ/Fv1P8jS+S3ZdlP06Cwd930aWgg0INsfBNgOqY7ZmFmADQOlQO19PoPlYlcz/1JpLG9BXQHWu
	nWuvlwbNlybQ+SgiqDte1O4BGiZy5kIQv87FMom1hOvLESM3unpL5chwNubtvxapv2d97LyxsMy
	EKQVBvExQoEWjQzCNjgGDEu6S9sJc5ymU
X-Received: by 2002:a05:6a00:32c3:b0:847:881c:7026 with SMTP id d2e1a72fcca58-84fde1501cemr21344776b3a.3.1786942118798;
        Sun, 16 Aug 2026 21:48:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:32c3:b0:847:881c:7026 with SMTP id d2e1a72fcca58-84fde1501cemr21344741b3a.3.1786942118322;
        Sun, 16 Aug 2026 21:48:38 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d046638sm2149250b3a.27.2026.08.16.21.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 21:48:37 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 10:17:41 +0530
Subject: [PATCH v2 06/15] accel/qda: Create compute context bank devices on
 QDA compute bus
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-qda-v2-v2-6-69a02e9090d4@oss.qualcomm.com>
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
In-Reply-To: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786942058; l=7659;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=vyyAKW+sDxkJvnWkRtGMDfJQbird7CY22fXpG75dfI8=;
 b=9iSkBuK0+IvRZzeuUuxCA3txvr7RXBv9HocPubw7VSQhNZIb23asi+VU2A7GF556vKccuuFT5
 CEcv2JEnaPyDLM5cvWl2HDbdbG6+lkEv61S+iefHgPM0Vj8R3WH6BDD
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Authority-Analysis: v=2.4 cv=EKc2FVZC c=1 sm=1 tr=0 ts=6a8292a7 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=_bi6IaUD7rjJwiY1G1oA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDAzMyBTYWx0ZWRfX35H0VZFlhhtW
 gRHVIUnZqDZR/cI/JSGpqaRTgpDsYB/CzcAMyh8NLvMsN9/ryxSXdvaN9keI5LkvMbJzREpOuuf
 OKdnfuJ9YIZB+FtqRZ7F+bckfd9U7OA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDAzMyBTYWx0ZWRfXyGuKsoP+Cyik
 CFV3hX8+3+Qo78dAMKCet25rwojNDzSgY+CWR98I5SWhwdER0OpsAQLD+6qI5+ebcJqUEJPAsZ9
 njpb9ya6C8FtmIfNODql8TGvBG761eOgY1kC2AUkdRZQWeuA1pDPlioi4QS72XXnSM0Gsv05pKI
 eb0QtR1BV66tDZKujBj+SQLdS3kWyZS0eMOdtTnS2UgeYrz1VeQ5XGx367zI8F3x0nYRB19cUzx
 fSRKJ3v+nped6gz6Exw1KJi9Pi6mxfC2/bVShVnm/CyJ8uzePwhUyrB24uLQSQdQXlaBpnKJ1Mj
 mu0Gp1OOvFr9t+MFCQZ99DStFPl/T/xgYLP1caq9a0SQvzrSDfLfM/uAdWQqW2jk0/w8dV5EhJm
 o3tddeBWoXgkriIyPsK3u0ZJCvER9lYyh70tvzuZg35ZIaiSpN6c7v817fmL8FQfldWeKa4p1Ba
 g68KP8uFKJOgE9mKTtQ==
X-Proofpoint-GUID: O858RMa7P0_ATJdtZAinNtwYd3WitAB3
X-Proofpoint-ORIG-GUID: O858RMa7P0_ATJdtZAinNtwYd3WitAB3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170033

Introduce the CB (compute context bank) device management layer. Each
DSP domain node in the device tree may contain child nodes with
compatible "qcom,fastrpc-compute-cb", each representing one IOMMU
context bank. Enumerate those child nodes during RPMsg probe and create
a corresponding device on the qda-compute-cb bus for each one, so that
the IOMMU subsystem assigns each of them its own domain and DSP buffer
mappings are isolated per session.

qda_cb_populate() walks the child nodes and creates one CB device each,
unwinding everything it created if any single creation fails.
qda_destroy_cb_device() removes a device from its IOMMU group before
unregistering it so the domain is released cleanly.

CB devices are created before the DRM device is registered and destroyed
after it is unplugged, so user space cannot reach a CB that does not
exist yet, and no ioctl can be in flight while one is torn down.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
Changes in v2:
- Use qda_cb_device_create() and pass the name as a format string
  instead of formatting into a stack buffer (Dmitry Baryshkov)
- Fail probe on the first CB creation error and unwind, instead of
  counting successes and continuing (Dmitry Baryshkov)
- Drop the impossible NULL check in qda_destroy_cb_device()
  (Dmitry Baryshkov)
- Use drm_*() logging consistently instead of mixing with dev_*()
  (Dmitry Baryshkov)
---
 drivers/accel/qda/Makefile    |  1 +
 drivers/accel/qda/qda_cb.c    | 86 +++++++++++++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_cb.h    | 32 ++++++++++++++++
 drivers/accel/qda/qda_drv.c   |  1 +
 drivers/accel/qda/qda_drv.h   |  3 ++
 drivers/accel/qda/qda_rpmsg.c | 16 +++++++-
 6 files changed, 138 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
index 424176f652a5..143c9e4e789e 100644
--- a/drivers/accel/qda/Makefile
+++ b/drivers/accel/qda/Makefile
@@ -6,6 +6,7 @@
 obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
 
 qda-y := \
+	qda_cb.o \
 	qda_drv.o \
 	qda_rpmsg.o
 
diff --git a/drivers/accel/qda/qda_cb.c b/drivers/accel/qda/qda_cb.c
new file mode 100644
index 000000000000..9c5ef32f351e
--- /dev/null
+++ b/drivers/accel/qda/qda_cb.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+#include <linux/dma-mapping.h>
+#include <linux/device.h>
+#include <linux/of.h>
+#include <linux/iommu.h>
+#include <linux/qda_compute_bus.h>
+#include <linux/slab.h>
+#include <drm/drm_print.h>
+#include "qda_drv.h"
+#include "qda_cb.h"
+
+int qda_create_cb_device(struct qda_dev *qdev, struct device_node *cb_node)
+{
+	struct qda_cb_dev *entry;
+	struct device *cb_dev;
+	u32 sid = 0;
+
+	if (of_property_read_u32(cb_node, "reg", &sid))
+		drm_info(&qdev->drm_dev, "No stream ID in DT node %pOFn, using 0\n", cb_node);
+
+	cb_dev = qda_cb_device_create(qdev->dev, DMA_BIT_MASK(32), cb_node,
+				      "qda-cb-%s-%u", qdev->dsp_name, sid);
+	if (IS_ERR(cb_dev)) {
+		drm_err(&qdev->drm_dev, "Failed to create CB device for SID %u: %ld\n",
+			sid, PTR_ERR(cb_dev));
+		return PTR_ERR(cb_dev);
+	}
+
+	entry = kzalloc_obj(*entry);
+	if (!entry) {
+		qda_destroy_cb_device(cb_dev);
+		return -ENOMEM;
+	}
+
+	entry->dev = cb_dev;
+	list_add_tail(&entry->node, &qdev->cb_devs);
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
+		qda_destroy_cb_device(entry->dev);
+		kfree(entry);
+	}
+}
+
+int qda_cb_populate(struct qda_dev *qdev, struct device_node *parent_node)
+{
+	struct device_node *child;
+	int ret;
+
+	for_each_child_of_node(parent_node, child) {
+		if (!of_device_is_compatible(child, "qcom,fastrpc-compute-cb"))
+			continue;
+
+		ret = qda_create_cb_device(qdev, child);
+		if (ret) {
+			drm_err(&qdev->drm_dev, "Failed to create CB device for: %s\n",
+				child->name);
+			of_node_put(child);
+			qda_cb_unpopulate(qdev);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+void qda_destroy_cb_device(struct device *cb_dev)
+{
+	struct iommu_group *group;
+
+	group = iommu_group_get(cb_dev);
+	if (group) {
+		iommu_group_remove_device(cb_dev);
+		iommu_group_put(group);
+	}
+
+	device_unregister(cb_dev);
+}
diff --git a/drivers/accel/qda/qda_cb.h b/drivers/accel/qda/qda_cb.h
new file mode 100644
index 000000000000..bd83d64fa425
--- /dev/null
+++ b/drivers/accel/qda/qda_cb.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __QDA_CB_H__
+#define __QDA_CB_H__
+
+#include <linux/device.h>
+#include <linux/list.h>
+#include <linux/of.h>
+#include "qda_drv.h"
+
+struct qda_cb_dev {
+	struct list_head node;
+	struct device *dev;
+};
+
+/*
+ * Compute bus (CB) device management
+ */
+int qda_create_cb_device(struct qda_dev *qdev, struct device_node *cb_node);
+void qda_destroy_cb_device(struct device *cb_dev);
+
+/*
+ * Transport-agnostic CB device population/teardown.
+ * Called by any transport layer (RPMsg, etc.) during probe/remove.
+ */
+int qda_cb_populate(struct qda_dev *qdev, struct device_node *parent_node);
+void qda_cb_unpopulate(struct qda_dev *qdev);
+
+#endif /* __QDA_CB_H__ */
diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
index 9a64f7dfcb6e..09b6d5ac390b 100644
--- a/drivers/accel/qda/qda_drv.c
+++ b/drivers/accel/qda/qda_drv.c
@@ -52,6 +52,7 @@ struct qda_dev *qda_alloc_device(struct device *dev)
 	if (IS_ERR(qdev))
 		return ERR_CAST(qdev);
 
+	INIT_LIST_HEAD(&qdev->cb_devs);
 	return qdev;
 }
 
diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
index 4a27fb40c280..3bd41b9593fa 100644
--- a/drivers/accel/qda/qda_drv.h
+++ b/drivers/accel/qda/qda_drv.h
@@ -7,6 +7,7 @@
 #define __QDA_DRV_H__
 
 #include <linux/device.h>
+#include <linux/list.h>
 #include <linux/rpmsg.h>
 #include <linux/types.h>
 #include <drm/drm_device.h>
@@ -37,6 +38,8 @@ struct qda_dev {
 	struct rpmsg_device *rpdev;
 	/** @dev: Underlying Linux device */
 	struct device *dev;
+	/** @cb_devs: Compute context-bank (CB) child devices */
+	struct list_head cb_devs;
 	/** @dsp_name: Name of the DSP domain (e.g. "cdsp", "adsp") */
 	const char *dsp_name;
 };
diff --git a/drivers/accel/qda/qda_rpmsg.c b/drivers/accel/qda/qda_rpmsg.c
index 6a6e58333a68..723b3e61bf0a 100644
--- a/drivers/accel/qda/qda_rpmsg.c
+++ b/drivers/accel/qda/qda_rpmsg.c
@@ -5,6 +5,7 @@
 #include <linux/rpmsg.h>
 #include <drm/drm_print.h>
 
+#include "qda_cb.h"
 #include "qda_drv.h"
 
 static struct qda_dev *qda_rpmsg_alloc_and_init_qdev(struct rpmsg_device *rpdev)
@@ -40,6 +41,7 @@ static void qda_rpmsg_remove(struct rpmsg_device *rpdev)
 	 */
 	drm_dev_unplug(&qdev->drm_dev);
 	qdev->rpdev = NULL;
+	qda_cb_unpopulate(qdev);
 }
 
 static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
@@ -57,7 +59,19 @@ static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
 		return ret;
 	}
 
-	return qda_register_device(qdev);
+	ret = qda_cb_populate(qdev, rpdev->dev.of_node);
+	if (ret)
+		return ret;
+
+	ret = qda_register_device(qdev);
+	if (ret)
+		goto err_unpopulate;
+
+	return 0;
+
+err_unpopulate:
+	qda_cb_unpopulate(qdev);
+	return ret;
 }
 
 static const struct of_device_id qda_rpmsg_id_table[] = {

-- 
2.34.1

