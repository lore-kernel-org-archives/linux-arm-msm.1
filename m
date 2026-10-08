Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B0F3AA50B
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 03:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791430135; cv=none; b=MLkaZ1wRr7fzIQLwJRe2byZ0BRMDZB0P8HXKI7wXAVkH91visMaXEDwGQWPF+5hlco1sNJF4xlPtQY9l22PAP0R211O/LInZlNRUoKYMTzS/C6re5DgoRma72Hv2pOSj795nttaeILCRVKd7kg3keydRljqeR4rYK+og4rIrs+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791430135; c=relaxed/simple;
	bh=KaRcLGFBjQ//N9AGbNrr+zyJYDMAUB5KtT/9/yT6j3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c/a+Dmfl6R2gEz2W+Cs7ZLi+OS+90O5Q2Fi21VmNnOsAZ+LoWUF+xBmkZP7315xWzl3xGtkFUV3uNhvWXlWzzZOL7JonK4GJlv05Tu+oWRny5OpMhibKvvUejjMLUVBMnZQXlwDyd1MK8rT76GtOKXBy/p2DBK+Mu0An6YGc+b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HcPUCrxn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IhM30io2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HcPUCrxn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IhM30io2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6981hYG01431108
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 03:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qDOSkfgSlv2R0xVBV8llQiuT2ZcGPG0hoUyDMx3hNXc=; b=HcPUCrxnFasKbs6Z
	p0a29N47YufgXNd0bnGMNT593uVNWTUvHuyJ+79jrK6Xzm7cs4kPfPNz1P1k67/8
	e0n6tjFV4mjsnbOqJ20RGu7fT8+3KufYGI7QK0fHsG1AKhlUV8djsL1bHVvYDcDl
	3Hcud3hfeR+wlSgw3DL+vkUupCO/Xgsa9vjZ4NKnKYm8Cp8+r12YTjDx0fjhF2TT
	re96VFDUcmZVm/5SHPu6zV9pAokC0nDCNPr+5Ts9Q18AWGLMs59dtZg+7QrDzKdf
	daH7eU9EGzQLnwbaYva22/MufbzJHbrBktCIi9llTa/vc3ajVAryUZrnhOhQLsJm
	TiTb7Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2s19p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 03:28:51 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-351788121cfso1445187eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 20:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791430130; x=1792034930; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qDOSkfgSlv2R0xVBV8llQiuT2ZcGPG0hoUyDMx3hNXc=;
        b=IhM30io2pHjtMP3FCnmui4B6mRmDJwniYIC2b8JjEPiftvW8VV/yM5UpkeFotn/7AX
         M4Vxg7b65+tpvTMpOc0yg8SabWmSlNV3OXO8T7qDia28PWpivQPmfyBnNYkw4OnKo1Yg
         FfVJHySdg6PCmCwN/FNZnTkyB9pvh8Vq5aeFLviE1ShoM6MPUzekVZm0P8OSeUemW6ua
         ltoBO/U6Y570iWpi7p9embmzipG2y75TiQe23RBwT757NvXs0kkFVVVbHsNlij1ngUIQ
         74UKIAxtw28Q9BNWQgqy19wfnMAKz5NRnRKlTFYt2kQvyaQcRHv9rbrx9bxkgKqQxbKv
         lE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791430130; x=1792034930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qDOSkfgSlv2R0xVBV8llQiuT2ZcGPG0hoUyDMx3hNXc=;
        b=h+qFmi76r0dFvPw8mngsR9j5fP64GUyTM5u4wVvBQVqWB+HFaDqkJHw0ROXWL6P6tU
         rxlvn5hmtwl55rJ83GIadz3R7lO9/cKHOJwwvbprnloPt+jCNt0Xc66bnSki1QwqUYav
         VOXsssHrxxX9sx+t5hAnHrVz+f9uamIf4GmEiAzPP315+35jjUR2KjEnlQ3cWJxY6h5+
         hqI3Uc40YsyQsOSvmRNnwxmPIsrft0nf6WezQzt1WgEWFZzGRah1agPaBuCVF4kpZ+8F
         8mFmQUnbEelCigGQ4TE7nOrLSGbJhkOHq3LkosWPkh91rCHC9Uhd3xfceP+G939dWQlu
         iBAg==
X-Gm-Message-State: AFuF++nYuVEcZFCAyVRF8mzaRajM8t6i0I1rFlFj7FKrEgXgt/FRq8pZ
	mrexup6C8uPwR1dNI2IB1us+h/zi3c8mI0AA+t2h3gLr0MvPwN3PkU0CYWFvYvA0bxy/NVHplOH
	3yIkQl1ANldafewqfX1GZUQeAPfWcV5ulmBLyFB513WlJuAirtD0OqebgD5FQDFAA3hw=
X-Gm-Gg: AYBFou2dyhG+ly4XQgEghwEFfN41W7FSG8MSfn2ESL/HCouW3cG/Jv6TaS3StidWSbo
	QwB7wDYiqzOI/EvvFaHpWIgPFJR1FuRylbEZlmEJMMPaUDz6hE9CDqO94myJoxjqDw3NSX2pCTM
	KBo8NQaxhduu6/y6FN/Y8qUj5M4ib2hZRMN4d8HxIANyXXxmLaPNY+okHMi1ZCLuZkVw+hUFwzR
	iku//e3T05qTmdJYeQhITBKKhmZJuXOrb8GTwqWufucX9J5e6kUSIgbv1Mqp/oagx4C5CyArTVZ
	BcUURR6MuvYiOOt7bINHMn9aVfIHhd00wIx5MtOHNqLFSfpwxPSbKy/5gXVeOGKc/pRiJNwvsJ3
	E8diDnTnUnteWIfzhWCQ9kY32KXK1X+QBOqKMqNH7TgajVuxDKXM51JQLlQ==
X-Received: by 2002:a05:7300:51e1:b0:351:55c3:6896 with SMTP id 5a478bee46e88-3515dde39acmr5313079eec.16.1791430129837;
        Wed, 07 Oct 2026 20:28:49 -0700 (PDT)
X-Received: by 2002:a05:7300:51e1:b0:351:55c3:6896 with SMTP id 5a478bee46e88-3515dde39acmr5313028eec.16.1791430129097;
        Wed, 07 Oct 2026 20:28:49 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35179d07566sm2168349eec.30.2026.10.07.20.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 20:28:48 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 20:27:12 -0700
Subject: [PATCH RFC v2 06/10] firmware: riscv: rpmi-tee: discover TEE
 endpoints
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-riscv-rpmi-tee-abi-v2-6-45939a13d223@oss.qualcomm.com>
References: <20261007-riscv-rpmi-tee-abi-v2-0-45939a13d223@oss.qualcomm.com>
In-Reply-To: <20261007-riscv-rpmi-tee-abi-v2-0-45939a13d223@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rahul Pathak <rahul@summations.net>,
        Anup Patel <anup@brainfault.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amirreza Zarrabi <amrzar@gmail.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, op-tee@lists.trustedfirmware.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=AbMkjHXG c=1 sm=1 tr=0 ts=6ac70df3 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=LGPBHASfCGe67HC_iDoA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 03T7CRLoLcnmSI0Xx1zfodUL9dlPryiv
X-Proofpoint-ORIG-GUID: 03T7CRLoLcnmSI0Xx1zfodUL9dlPryiv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAxMyBTYWx0ZWRfX5oqyMfknvfFX
 uGIzC1ZTzehgTAXCGq20lp2S8AM+Ua4f39RZDBUNu/PDbgHqOzKJUaursdkZI+pXGnUwKHVFdkc
 DartJ9i6JW6mK3JfteeDfy2Gwuhrbl4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAxMyBTYWx0ZWRfX5cMVNIVv+iVr
 7KWagp5+huB1T1aM0zpwniip5gBwbEelWSWYzaS01QfOtOfYgpR1klrOkYP3xtPySwrcqiHyv3y
 yW+je0pMhiIXZfSOTsNzMQ4dHSo2F/iuM6/vCOqN4zdvnba71pDzEI6I6mP6PeAhlpqtwZKvas6
 0Ri9aTi7/DIKJ2rnM/BB8b4Ddgc09COwOFCqZfELf5Jt28mRgJlbMtzIYmzecBXkInG4giM0Mda
 cz/7ghSWuj2WoDWZIKfq6TRMnxT1eW5e8XRuaJB/RGOVubBs6r53jxDIdvmiUZrOy/65ZKSzqrr
 6Z7YGCF1nvrL1Rn0mdmmXyZzk5SY1+/YKBEqFoqrYFUzmxbSA6lM0cKax9gTUHmO8hWjQC0Nj7e
 eyYWcKs7YxcBpjgFOHfzgCJMkm7zdZvPktQi2oBUrDFuSpij4oM5MX7VaLNPM0SCUswb4RTKA9C
 C000iE9Z43EjdcySwzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_01,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080013

Add discovery through the PROBE_SYSTEM, PROBE_DOMAIN and PROBE_ENDPOINT
services. Obtain the caller's endpoint ID and enumerate reachable
physical TEE endpoints and their service UUIDs.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/riscv_rpmi_tee/Makefile           |   2 +-
 drivers/firmware/riscv_rpmi_tee/discovery.c        | 383 +++++++++++++++++++++
 drivers/firmware/riscv_rpmi_tee/driver.c           |  29 ++
 drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h |  42 +++
 4 files changed, 455 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/riscv_rpmi_tee/Makefile b/drivers/firmware/riscv_rpmi_tee/Makefile
index 8984127535ed..fc6edfb21dbc 100644
--- a/drivers/firmware/riscv_rpmi_tee/Makefile
+++ b/drivers/firmware/riscv_rpmi_tee/Makefile
@@ -3,6 +3,6 @@
 rpmi-tee-bus-y = bus.o
 rpmi-tee-core-objs := $(rpmi-tee-bus-y)
 obj-$(CONFIG_RISCV_RPMI_TEE_TRANSPORT) = rpmi-tee-core.o
-rpmi-tee-driver-y = driver.o
+rpmi-tee-driver-y = driver.o discovery.o
 rpmi-tee-module-objs := $(rpmi-tee-driver-y)
 obj-$(CONFIG_RISCV_RPMI_TEE_TRANSPORT) += rpmi-tee-module.o
diff --git a/drivers/firmware/riscv_rpmi_tee/discovery.c b/drivers/firmware/riscv_rpmi_tee/discovery.c
new file mode 100644
index 000000000000..fedd68bba639
--- /dev/null
+++ b/drivers/firmware/riscv_rpmi_tee/discovery.c
@@ -0,0 +1,383 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/bits.h>
+#include <linux/errno.h>
+#include <linux/cleanup.h>
+#include <linux/mailbox/riscv-rpmi-message.h>
+#include <linux/slab.h>
+#include <linux/unaligned.h>
+
+#include "rpmi_tee_private.h"
+
+/* Role flags in PROBE_DOMAIN and PROBE_ENDPOINT responses. */
+#define RPMI_TEE_DOMAIN_TEE		BIT(31)
+#define RPMI_TEE_ENDPOINT_TEE		BIT(31)
+#define RPMI_TEE_ENDPOINT_PHYSICAL	BIT(30)
+
+/**
+ * struct rpmi_tee_probe_system_resp - PROBE_SYSTEM response prefix
+ * @status: RPMI completion status.
+ * @caller_domain: Calling endpoint's domain ID.
+ * @caller_endpoint: Calling physical endpoint ID.
+ * @domain_count: Number of entries in @domains.
+ * @domains: Reachable domain identifiers.
+ */
+struct rpmi_tee_probe_system_resp {
+	__le32 status;
+	__le32 caller_domain;
+	__le32 caller_endpoint;
+	__le32 domain_count;
+	__le32 domains[];
+} __packed;
+
+/**
+ * struct rpmi_tee_probe_domain_req - PROBE_DOMAIN request
+ * @domain_id: Domain identifier from PROBE_SYSTEM.
+ */
+struct rpmi_tee_probe_domain_req {
+	__le32 domain_id;
+} __packed;
+
+/**
+ * struct rpmi_tee_probe_domain_resp - PROBE_DOMAIN response prefix
+ * @status: RPMI completion status.
+ * @flags: Domain role flags.
+ * @endpoint_count: Number of entries in @endpoints.
+ * @endpoints: Physical and proxied endpoint IDs.
+ */
+struct rpmi_tee_probe_domain_resp {
+	__le32 status;
+	__le32 flags;
+	__le32 endpoint_count;
+	__le32 endpoints[];
+} __packed;
+
+/**
+ * struct rpmi_tee_probe_endpoint_req - PROBE_ENDPOINT request
+ * @endpoint_id: Endpoint identifier from PROBE_DOMAIN.
+ */
+struct rpmi_tee_probe_endpoint_req {
+	__le32 endpoint_id;
+} __packed;
+
+/**
+ * struct rpmi_tee_probe_endpoint_resp - PROBE_ENDPOINT response prefix
+ * @status: RPMI completion status.
+ * @flags: Endpoint role and lifetime flags.
+ * @name: Debug name, not a matching identity.
+ * @proxied_count: Number of proxied endpoint IDs in @data.
+ * @parcel_count: Number of parcel IDs in @data.
+ * @service_count: Number of 16-byte service UUIDs in @data.
+ * @metadata_len: Metadata length in bytes.
+ * @data: Proxied endpoint IDs, parcel IDs, service UUIDs, then metadata.
+ */
+struct rpmi_tee_probe_endpoint_resp {
+	__le32 status;
+	__le32 flags;
+	u8 name[32];
+	__le32 proxied_count;
+	__le32 parcel_count;
+	__le32 service_count;
+	__le32 metadata_len;
+	u8 data[];
+} __packed;
+
+struct rpmi_tee_system_info {
+	u32 caller_domain;
+	u32 caller_endpoint;
+	u32 domain_count;
+	const u8 *domains;
+};
+
+/* Return the domain ID at a validated index in the system response. */
+static inline u32
+rpmi_tee_domain_id_at(const struct rpmi_tee_system_info *info, u32 index)
+{
+	return get_unaligned_le32(info->domains +
+				  (size_t)index * sizeof(__le32));
+}
+
+struct rpmi_tee_domain_info {
+	u32 flags;
+	u32 endpoint_count;
+	const u8 *endpoints;
+};
+
+/* Return the endpoint ID at a validated index in the domain response. */
+static inline u32
+rpmi_tee_endpoint_id_at(const struct rpmi_tee_domain_info *info, u32 index)
+{
+	return get_unaligned_le32(info->endpoints +
+				  (size_t)index * sizeof(__le32));
+}
+
+struct rpmi_tee_endpoint_info {
+	u32 flags;
+	u32 service_count;
+	const u8 *services;
+};
+
+/* Copy the service UUID at a validated index in the endpoint response. */
+static inline void
+rpmi_tee_service_uuid_at(const struct rpmi_tee_endpoint_info *info,
+			 u32 index, uuid_t *uuid)
+{
+	import_uuid(uuid, info->services + (size_t)index * UUID_SIZE);
+}
+
+/* rpmi_tee_parse_*_response parse and validate the response. */
+
+static int rpmi_tee_parse_system_response(const void *data, size_t len,
+					  struct rpmi_tee_system_info *info)
+{
+	const struct rpmi_tee_probe_system_resp *resp = data;
+	u32 count;
+
+	if (len < sizeof(*resp))
+		return -EPROTO;
+
+	count = get_unaligned_le32(&resp->domain_count);
+	if (len != sizeof(*resp) + (u64)count * sizeof(__le32))
+		return -EPROTO;
+
+	info->caller_domain = get_unaligned_le32(&resp->caller_domain);
+	info->caller_endpoint = get_unaligned_le32(&resp->caller_endpoint);
+	info->domain_count = count;
+	/* Borrowed pointer, use rpmi_tee_domain_id_at() to access. */
+	info->domains = (const u8 *)data + sizeof(*resp);
+
+	return 0;
+}
+
+static int rpmi_tee_parse_domain_response(const void *data, size_t len,
+					  struct rpmi_tee_domain_info *info)
+{
+	const struct rpmi_tee_probe_domain_resp *resp = data;
+	u32 count;
+
+	if (len < sizeof(*resp))
+		return -EPROTO;
+
+	count = get_unaligned_le32(&resp->endpoint_count);
+	if (len != sizeof(*resp) + (u64)count * sizeof(__le32))
+		return -EPROTO;
+
+	info->flags = get_unaligned_le32(&resp->flags);
+	info->endpoint_count = count;
+	/* Borrowed pointer, use rpmi_tee_endpoint_id_at() to access. */
+	info->endpoints = (const u8 *)data + sizeof(*resp);
+
+	return 0;
+}
+
+static int rpmi_tee_parse_endpoint_response(const void *data, size_t len,
+					    struct rpmi_tee_endpoint_info *info)
+{
+	const struct rpmi_tee_probe_endpoint_resp *resp = data;
+	size_t remaining, service_offset;
+	u32 proxied, parcels, services;
+
+	if (len < sizeof(*resp))
+		return -EPROTO;
+
+	remaining = len - sizeof(*resp);
+	proxied = get_unaligned_le32(&resp->proxied_count);
+	parcels = get_unaligned_le32(&resp->parcel_count);
+	services = get_unaligned_le32(&resp->service_count);
+
+	/* Check both ID arrays before adding their counts. */
+	if (proxied > remaining / sizeof(__le32) ||
+	    parcels > remaining / sizeof(__le32) - proxied)
+		return -EPROTO;
+
+	service_offset = ((size_t)proxied + parcels) * sizeof(__le32);
+	remaining -= service_offset;
+	if (services > remaining / UUID_SIZE)
+		return -EPROTO;
+
+	/* Ignore metadata following the service UUID array. */
+	info->flags = get_unaligned_le32(&resp->flags);
+	info->service_count = services;
+	/* Borrowed pointer, use rpmi_tee_service_uuid_at() to get UUID. */
+	info->services = resp->data + service_offset;
+
+	return 0;
+}
+
+/* Return an owned probe response; vanished domain/endpoint IDs yield -ENOENT. */
+static int rpmi_tee_probe_info(struct rpmi_tee_transport *priv, u32 service,
+			       const void *req, size_t req_len, void **data,
+			       size_t *data_len)
+{
+	size_t resp_len = priv->mbox.max_msg_data_size;
+	s32 status;
+	int ret;
+
+	void *resp __free(kfree) = kzalloc(resp_len, GFP_KERNEL);
+	if (!resp)
+		return -ENOMEM;
+
+	ret = rpmi_tee_send_with_status(priv, service, req, req_len, resp,
+					&resp_len, &status);
+	if (ret)
+		return ret;
+
+	if (status == RPMI_ERR_INVALID_PARAM &&
+	    (service == RPMI_TEE_SRV_PROBE_DOMAIN ||
+	     service == RPMI_TEE_SRV_PROBE_ENDPOINT))
+		return -ENOENT;
+
+	ret = rpmi_to_linux_error(status);
+	if (ret)
+		return ret;
+
+	*data_len = resp_len;
+	*data = no_free_ptr(resp);
+
+	return 0;
+}
+
+static int rpmi_tee_add_endpoint(struct rpmi_tee_discovery *system, u32 ep_id,
+				 const struct rpmi_tee_endpoint_info *info)
+{
+	struct rpmi_tee_discovered_endpoint *ep;
+	u32 i;
+
+	/* Skip endpoints already discovered. */
+	list_for_each_entry(ep, &system->eps, node)
+		if (ep->ep_id == ep_id)
+			return 0;
+
+	ep = kzalloc(struct_size(ep, services, info->service_count), GFP_KERNEL);
+	if (!ep)
+		return -ENOMEM;
+
+	ep->ep_id = ep_id;
+	ep->service_count = info->service_count;
+	for (i = 0; i < ep->service_count; i++)
+		rpmi_tee_service_uuid_at(info, i, &ep->services[i]);
+
+	list_add_tail(&ep->node, &system->eps);
+
+	return 0;
+}
+
+/* Discover physical TEE endpoints in one domain, skipping vanished IDs. */
+static int rpmi_tee_discover_domain(struct rpmi_tee_transport *priv, u32 id,
+				    struct rpmi_tee_discovery *system)
+{
+	struct rpmi_tee_domain_info domain;
+	struct rpmi_tee_probe_domain_req req = {
+		.domain_id = cpu_to_le32(id),
+	};
+	size_t len;
+	int ret;
+	u32 i;
+
+	void *data __free(kfree) = NULL;
+
+	ret = rpmi_tee_probe_info(priv, RPMI_TEE_SRV_PROBE_DOMAIN, &req,
+				  sizeof(req), &data, &len);
+	if (ret)
+		return ret == -ENOENT ? 0 : ret;
+
+	ret = rpmi_tee_parse_domain_response(data, len, &domain);
+	/* Only TEE domains are processed. */
+	if (ret || !(domain.flags & RPMI_TEE_DOMAIN_TEE))
+		return ret;
+
+	for (i = 0; i < domain.endpoint_count; i++) {
+		u32 ep_id = rpmi_tee_endpoint_id_at(&domain, i);
+		struct rpmi_tee_endpoint_info endpoint;
+		struct rpmi_tee_probe_endpoint_req ep_req = {
+			.endpoint_id = cpu_to_le32(ep_id),
+		};
+
+		void *ep_data __free(kfree) = NULL;
+
+		ret = rpmi_tee_probe_info(priv, RPMI_TEE_SRV_PROBE_ENDPOINT,
+					  &ep_req, sizeof(ep_req), &ep_data,
+					  &len);
+		if (ret == -ENOENT)
+			continue;
+
+		if (ret)
+			return ret;
+
+		ret = rpmi_tee_parse_endpoint_response(ep_data, len, &endpoint);
+		if (ret)
+			return ret;
+
+		/* Only physical TEE endpoints are processed. */
+		if (ep_id == priv->self_id ||
+		    !(endpoint.flags & RPMI_TEE_ENDPOINT_TEE) ||
+		    !(endpoint.flags & RPMI_TEE_ENDPOINT_PHYSICAL))
+			continue;
+
+		ret = rpmi_tee_add_endpoint(system, ep_id, &endpoint);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/* Free all discovered endpoints and their copied service UUIDs. */
+void rpmi_tee_free_discovery(struct rpmi_tee_discovery *system)
+{
+	struct rpmi_tee_discovered_endpoint *ep, *next;
+
+	list_for_each_entry_safe(ep, next, &system->eps, node) {
+		list_del(&ep->node);
+		kfree(ep);
+	}
+}
+
+/**
+ * rpmi_tee_discover_endpoints() - Discover physical TEE endpoints and services
+ * @priv: RPMI TEE transport
+ * @system: Returned list of endpoints and their service UUIDs
+ *
+ * Obtain caller identity and walk SYSTEM, DOMAIN and ENDPOINT probes. The
+ * caller releases the entries with rpmi_tee_free_discovery() on success.
+ *
+ * Return: 0 on success, or a negative error code.
+ */
+int rpmi_tee_discover_endpoints(struct rpmi_tee_transport *priv,
+				struct rpmi_tee_discovery *system)
+{
+	struct rpmi_tee_system_info info;
+	size_t len;
+	int ret;
+	u32 i;
+
+	void *data __free(kfree) = NULL;
+
+	INIT_LIST_HEAD(&system->eps);
+	/* PROBE_SYSTEM has no request data and returns the caller's identity. */
+	ret = rpmi_tee_probe_info(priv, RPMI_TEE_SRV_PROBE_SYSTEM, NULL, 0,
+				  &data, &len);
+	if (ret)
+		return ret;
+
+	ret = rpmi_tee_parse_system_response(data, len, &info);
+	if (ret)
+		return ret;
+
+	priv->self_id = info.caller_endpoint;
+	for (i = 0; i < info.domain_count; i++) {
+		u32 domain_id = rpmi_tee_domain_id_at(&info, i);
+
+		ret = rpmi_tee_discover_domain(priv, domain_id, system);
+		if (ret) {
+			rpmi_tee_free_discovery(system);
+
+			return ret;
+		}
+	}
+
+	return 0;
+}
diff --git a/drivers/firmware/riscv_rpmi_tee/driver.c b/drivers/firmware/riscv_rpmi_tee/driver.c
index d9ae161d241b..a70b8be41bed 100644
--- a/drivers/firmware/riscv_rpmi_tee/driver.c
+++ b/drivers/firmware/riscv_rpmi_tee/driver.c
@@ -5,6 +5,7 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <linux/unaligned.h>
 #include <linux/mailbox_client.h>
 #include <linux/mailbox/riscv-rpmi-message.h>
 #include <linux/module.h>
@@ -14,6 +15,34 @@
 
 #include "rpmi_tee_private.h"
 
+/* rpmi_tee_send_with_status() - Send an RPMI TEE service request. */
+int rpmi_tee_send_with_status(struct rpmi_tee_transport *priv, u32 service_id,
+			      const void *req, size_t req_len, void *resp,
+			      size_t *resp_len, s32 *status)
+{
+	size_t max_resp_len = *resp_len;
+	struct rpmi_mbox_message msg;
+	int ret;
+
+	if (req_len > priv->mbox.max_msg_data_size ||
+	    max_resp_len > priv->mbox.max_msg_data_size)
+		return -EMSGSIZE;
+
+	rpmi_mbox_init_send_with_response(&msg, service_id, (void *)req,
+					  req_len, resp, max_resp_len);
+	ret = rpmi_mbox_send_message_sync(priv->mbox.chan, &msg);
+	if (ret)
+		return ret;
+	/* At least STATUS word should be present. */
+	if (msg.data.out_response_len < sizeof(__le32))
+		return -EPROTO;
+
+	*resp_len = msg.data.out_response_len;
+	*status = (s32)get_unaligned_le32(resp);
+
+	return 0;
+}
+
 /**
  * rpmi_tee_get_attr() - Get an RPMI mailbox attribute
  * @priv: RPMI TEE transport
diff --git a/drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h b/drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h
index b25192c5df00..ba0e7cb59b6d 100644
--- a/drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h
+++ b/drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h
@@ -6,12 +6,18 @@
 #ifndef _RPMI_TEE_PRIVATE_H
 #define _RPMI_TEE_PRIVATE_H
 
+#include <linux/list.h>
 #include <linux/mailbox_client.h>
 #include <linux/types.h>
+#include <linux/uuid.h>
 
 /* TEE service group and the services used by this module. */
 #define RPMI_SRVGRP_TEE		0x10
 
+#define RPMI_TEE_SRV_PROBE_SYSTEM	0x03
+#define RPMI_TEE_SRV_PROBE_DOMAIN	0x04
+#define RPMI_TEE_SRV_PROBE_ENDPOINT	0x05
+
 struct rpmi_tee_mbox {
 	struct mbox_client client;
 	struct mbox_chan *chan;
@@ -21,6 +27,42 @@ struct rpmi_tee_mbox {
 struct rpmi_tee_transport {
 	struct device *dev;
 	struct rpmi_tee_mbox mbox;
+	u32 self_id;
+};
+
+/* Report local transport errors separately from the returned RPMI status. */
+int rpmi_tee_send_with_status(struct rpmi_tee_transport *priv, u32 service_id,
+			      const void *req, size_t req_len, void *resp,
+			      size_t *resp_len, s32 *status);
+
+/**
+ * struct rpmi_tee_discovered_endpoint - Physical TEE endpoint and its services
+ * @node: Entry in &struct rpmi_tee_discovery.eps.
+ * @ep_id: Physical TEE endpoint ID.
+ * @service_count: Number of UUIDs in @services.
+ * @services: Service UUIDs for the endpoint.
+ */
+struct rpmi_tee_discovered_endpoint {
+	struct list_head node;
+	u32 ep_id;
+	u32 service_count;
+	uuid_t services[] __counted_by(service_count);
 };
 
+/**
+ * struct rpmi_tee_discovery - Discovered physical TEE endpoints and services
+ * @eps: List of &struct rpmi_tee_discovered_endpoint entries, excluding the
+ *	 caller endpoint.
+ *
+ * On successful discovery, the caller owns the entries and releases them with
+ * rpmi_tee_free_discovery(). Endpoints without services are also included.
+ */
+struct rpmi_tee_discovery {
+	struct list_head eps;
+};
+
+void rpmi_tee_free_discovery(struct rpmi_tee_discovery *system);
+int rpmi_tee_discover_endpoints(struct rpmi_tee_transport *priv,
+				struct rpmi_tee_discovery *system);
+
 #endif /* _RPMI_TEE_PRIVATE_H */

-- 
2.34.1

