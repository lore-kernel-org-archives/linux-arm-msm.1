Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779183AC0D5
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 03:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791430132; cv=none; b=sPOJfmjgKnunsNVEC1wTbZSUg0SF9Cumasn2oZodz5dDjRj+41+s2F6VRyTPxNMHSurNsCMHjSJHEyQakrs+KeOvyHadRBDqcCgVYE+EGkvJ/WSlAIwml/aI9wpXzl0DolQITXBBmF2X4Mk19woYPQ7FluuXIiONPCCNzKCWW/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791430132; c=relaxed/simple;
	bh=v73mMtBcOz2f+7XRtZtad6s5TQPr8J/A5tYO0+opeA8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SpTr15agBKRu6rCOh0DArSP4i54NTvZ03W91Sd7yyXTzy/BmZgd0LTWWKx1V8kMt1KDj/Oqy6gwOJ5FfUF2eras74mzLxK9XuT5HDqMjB2olKBvoGbLEqpHHwwlGbQJ2Pd8y+NO5i7IajsIroLUcgN11IaRsdmwt1b8ZOi1XVkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m3IiWMBw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cInNHW/m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m3IiWMBw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cInNHW/m"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6981hM9J607433
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 03:28:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JYhMxhZH0dD9pA3ktR3FA82R4vBs9fV9ebvrujfapgw=; b=m3IiWMBwcGiYIz06
	Xz8k6ERhnf8dzZHjJjD97zML0i1SrmBc1eV8Cye+/qQh1ZzKtExlf5bV8ZQlZeXG
	kia9J92NKIs1NAssqhRZXfiYVr1Su/8pQHRbMGejuj/xqoVb+q02u07ZU3xmOh9B
	km4FlapaY5WJAikmofQhW9//RUbsEPl2X9y5xOYL63NdmfnWupr44Fy0MEdbyIIc
	UdI+p420NhxnAS6c9ojW8qBoPY7vPyDYHOpQhSq7uy+7pc7MKPc7ie52/WeYe1Po
	KNrNifzsemCcKdRWlMoWGD08CNrhIkXt2HrlLh7z+uY7ugr0wI3tTPcTbkshMCAv
	lk4NEA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2rwpv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 03:28:49 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-351788121cfso1445123eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 20:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791430129; x=1792034929; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JYhMxhZH0dD9pA3ktR3FA82R4vBs9fV9ebvrujfapgw=;
        b=cInNHW/mSmTxVR3iuKobHHn7/m5tWzqtbPa8Z7sy1rJ+4/D1DOcZBGu0owl1OmuPpt
         n+7cv7d5VZ0mWzlKslKqjNpfVJ+cPvKInnVAHF/SBdCY8zeMNlxodVHCMH50nJ0sHXcy
         rNMnox6a3/4g5fGMlS5ofk4VZ3SYl3q3UCCvyue6G4GunSFn6T4mKVlPfTgmqIT7dIlD
         HH+162triqiq8ymgjSKWMWBZGiH21W4ILi+cvSX+/tivcjhyuECXObOS/CExN5WngSWf
         PAY3/LwmiOvlkgRbx2Yf6aYB1t7GsnLIZr3SJAenYIWsROJnCB2+EE+m7sQx0oleoytd
         J77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791430129; x=1792034929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JYhMxhZH0dD9pA3ktR3FA82R4vBs9fV9ebvrujfapgw=;
        b=cDB928uaMnFG1l3CphvVxPtIs8fPJnxnae+wNAO7wzAaH6qElOPvchYhW3pXY7sfy4
         LvGLNWZxvyWNIxbLshaos1HqfRInZ2ZbkDrGtAWd+6rI/gzDaXEHeDVTaxQynocyD2cn
         PzLh7980i76VQzV8rZ7uS7eiimTv3wIWyuoigoIXTeq3XlOLRm/ULnVHRhIe3UNzRKlx
         yt4SitF1EwIzO42PPtYX0yic7Q5EstXhqqxvkRFte2FPtUA3p9N3TtHXfb8vlDYMgDGF
         gmjBcPiiQMXXNcNB0Rb7a88fLdr3Bd9qnvRzzFJxndbIkTKBxmbf6vdO4DTI59IJRn2z
         iUWQ==
X-Gm-Message-State: AFq9FYJuRmc6Wd8UNaN9TFiD7hs5EnVTJJWCARqvr2/Sf3SriaiKV2Y0
	3aMFz2iLAF4XW9J05kOJyQAph99nsaRWmaP7WwW5joNBb1E4mnfKKynPB8lX9hOTUsq/R7B0AnZ
	GJXW/U1QxGuyEOnOGYU2Vv9pxG88sUVdRIC9z+x+h0zGaNi99kifwBKOgCDX5Ty5Nm+U=
X-Gm-Gg: AYBFou14PAr+Hm/8e/Df+pMWJiV+p+HLEfDPJQRhctLWH5hAwYn9gZsRO9iX1FEIHFP
	ZSyBkkzNVkfkMQArQdLz//gA831x1AFd2h1/LzeZp+q+kLeyl9iGMnCuEdZQ9p70jYs7mUK/ETL
	jRT849tMJr2sPGPPWGNeN+4eoxW7pBBgM2HHVXMAFLQjFNWa9Roo7N8Rn/tso0SYTAaklBmwpUa
	P3C6/B6KQrqiEqJRKQjrkDT0UyfCmf2tOG5YzHcDh/VhlA6uG6OMQhbgH1nBRY4zuhtMAY+avC6
	wt9SMfK6JwrkrXKOVQ3bFav3SMuvlQejJbL1uiqqoX1lAncTq+v1J0rao/JdR85oaPc6N2CgN6S
	KtmpNVoTo6/SXPBOKElaQM9eFAWrR7wSm3o5cdXpP1c/WIAAfpp8h/nparg==
X-Received: by 2002:a05:7300:8808:b0:351:232c:6d79 with SMTP id 5a478bee46e88-3515dd837d6mr4640151eec.12.1791430128416;
        Wed, 07 Oct 2026 20:28:48 -0700 (PDT)
X-Received: by 2002:a05:7300:8808:b0:351:232c:6d79 with SMTP id 5a478bee46e88-3515dd837d6mr4640114eec.12.1791430127800;
        Wed, 07 Oct 2026 20:28:47 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35179d07566sm2168349eec.30.2026.10.07.20.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 20:28:47 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 20:27:11 -0700
Subject: [PATCH RFC v2 05/10] firmware: add RPMI TEE transport core
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-riscv-rpmi-tee-abi-v2-5-45939a13d223@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAxMyBTYWx0ZWRfX/2XnzQtRlaE2
 WraSy6q58VE0gI/gAZxZNPQ+V0+asf03WGH219Pj8zEyVo/DHbHEoRmzIT6kRNkbt3OtCETKTXN
 6QUJZRnWgLvTMFCUq6vSjkrzyAUqcdk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAxMyBTYWx0ZWRfX8TYRD3mm8LQU
 RvGc/cOFv0dNP9CsjS3Qr05SsnceF5HBu21vohBrMAwoXmH7cQdZP6fONZ+5hToAg9bNfCZkLXG
 /VYoK+KzrO+nCyrfW7gHTN4o7/JJ4F6DRr2PHU77corJxRQebk6oMuD4W28E2+49fCVMmEqMMGS
 u/RxuOovrc/ITxBzw1x6HhFsS1bxhDAgx8wMFooYSLGDz4gBsZgGChHQO5K2R84QLqpB3kSJ4wG
 gACeiBLtabwf4czOdRb98BKj/KdjqHa5GwYBqksO8vA9O00QU6/WhIIyokjAf/SAISJBmKuqHHE
 dagvqQK3Uc5YOj97oNzDmfEvp8W2ouR0R7m04gL3EJhV9bs+9No0xGiVL/UM21FEk2QIZWcOheL
 3VIMNT4z2UVER2QaqNF0IOGNmXTq4VPWYPwdARHMoTRuNDEeaIRPmtts1nLkBRAWgCrnjP/Uahb
 1yAfUoIWfZ93PDBDEqQ==
X-Proofpoint-ORIG-GUID: K-CCFXAuc2zgRAD97iS4Bc875RNh2MGt
X-Proofpoint-GUID: K-CCFXAuc2zgRAD97iS4Bc875RNh2MGt
X-Authority-Analysis: v=2.4 cv=CIm/zhrD c=1 sm=1 tr=0 ts=6ac70df1 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=0-kq_-QLXk4bkpNlR94A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_01,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080013

Add a platform driver for the RPMI TEE service group using an SBI MPXY
mailbox channel. Select direct synchronous mailbox transfers so RPMI
transactions complete in the calling context.

Query mailbox attributes to check the RPMI specification version, TEE
service-group identifier and service-group version. Cache the maximum
message data size for subsequent service requests.

This establishes the transport state used by later discovery, memory,
and notification support.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/riscv_rpmi_tee/Makefile           |   3 +
 drivers/firmware/riscv_rpmi_tee/driver.c           | 133 +++++++++++++++++++++
 drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h |  26 ++++
 3 files changed, 162 insertions(+)

diff --git a/drivers/firmware/riscv_rpmi_tee/Makefile b/drivers/firmware/riscv_rpmi_tee/Makefile
index d80ab5bc9dc4..8984127535ed 100644
--- a/drivers/firmware/riscv_rpmi_tee/Makefile
+++ b/drivers/firmware/riscv_rpmi_tee/Makefile
@@ -3,3 +3,6 @@
 rpmi-tee-bus-y = bus.o
 rpmi-tee-core-objs := $(rpmi-tee-bus-y)
 obj-$(CONFIG_RISCV_RPMI_TEE_TRANSPORT) = rpmi-tee-core.o
+rpmi-tee-driver-y = driver.o
+rpmi-tee-module-objs := $(rpmi-tee-driver-y)
+obj-$(CONFIG_RISCV_RPMI_TEE_TRANSPORT) += rpmi-tee-module.o
diff --git a/drivers/firmware/riscv_rpmi_tee/driver.c b/drivers/firmware/riscv_rpmi_tee/driver.c
new file mode 100644
index 000000000000..d9ae161d241b
--- /dev/null
+++ b/drivers/firmware/riscv_rpmi_tee/driver.c
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * RISC-V RPMI TEE transport
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/mailbox_client.h>
+#include <linux/mailbox/riscv-rpmi-message.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/rpmi_tee.h>
+
+#include "rpmi_tee_private.h"
+
+/**
+ * rpmi_tee_get_attr() - Get an RPMI mailbox attribute
+ * @priv: RPMI TEE transport
+ * @id: Attribute identifier
+ * @value: Returned attribute value
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+static int rpmi_tee_get_attr(struct rpmi_tee_transport *priv,
+			     enum rpmi_mbox_attribute_id id, u32 *value)
+{
+	struct rpmi_mbox_message msg;
+	int ret;
+
+	rpmi_mbox_init_get_attribute(&msg, id);
+	ret = rpmi_mbox_send_message_sync(priv->mbox.chan, &msg);
+	if (ret)
+		return ret;
+
+	*value = msg.attr.value;
+
+	return 0;
+}
+
+/* Validate the RPMI mailbox transport and cache its message size. */
+static int rpmi_tee_check_transport(struct rpmi_tee_transport *priv)
+{
+	u32 value;
+	int ret;
+
+	ret = rpmi_tee_get_attr(priv, RPMI_MBOX_ATTR_SPEC_VERSION, &value);
+	if (ret)
+		return ret;
+	if (value < RPMI_MKVER(1, 0))
+		return -EPROTONOSUPPORT;
+
+	ret = rpmi_tee_get_attr(priv, RPMI_MBOX_ATTR_SERVICEGROUP_ID, &value);
+	if (ret)
+		return ret;
+	if (value != RPMI_SRVGRP_TEE)
+		return -ENODEV;
+
+	ret = rpmi_tee_get_attr(priv, RPMI_MBOX_ATTR_SERVICEGROUP_VERSION,
+				&value);
+	if (ret)
+		return ret;
+	if (value < RPMI_MKVER(1, 0))
+		return -EPROTONOSUPPORT;
+
+	ret = rpmi_tee_get_attr(priv, RPMI_MBOX_ATTR_MAX_MSG_DATA_SIZE, &value);
+	if (ret)
+		return ret;
+
+	priv->mbox.max_msg_data_size = value;
+
+	return 0;
+}
+
+static int rpmi_tee_transport_probe(struct platform_device *pdev)
+{
+	struct rpmi_tee_transport *priv;
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = &pdev->dev;
+	platform_set_drvdata(pdev, priv);
+	priv->mbox.client.dev = &pdev->dev;
+	priv->mbox.client.tx_sync = true;
+	priv->mbox.chan = mbox_request_channel(&priv->mbox.client, 0);
+	if (IS_ERR(priv->mbox.chan))
+		return dev_err_probe(&pdev->dev, PTR_ERR(priv->mbox.chan),
+				     "failed to request mailbox channel\n");
+
+	ret = rpmi_tee_check_transport(priv);
+	if (ret) {
+		dev_err_probe(&pdev->dev, ret,
+			      "invalid RPMI TEE mailbox channel\n");
+		goto out_failed;
+	}
+
+	return 0;
+
+out_failed:
+	mbox_free_channel(priv->mbox.chan);
+
+	return ret;
+}
+
+static void rpmi_tee_transport_remove(struct platform_device *pdev)
+{
+	struct rpmi_tee_transport *priv = platform_get_drvdata(pdev);
+
+	mbox_free_channel(priv->mbox.chan);
+}
+
+static const struct of_device_id rpmi_tee_transport_match[] = {
+	{ .compatible = "riscv,rpmi-tee" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, rpmi_tee_transport_match);
+
+static struct platform_driver rpmi_tee_transport_driver = {
+	.probe = rpmi_tee_transport_probe,
+	.remove = rpmi_tee_transport_remove,
+	.driver = {
+		.name = "riscv-rpmi-tee",
+		.of_match_table = rpmi_tee_transport_match,
+	},
+};
+
+module_platform_driver(rpmi_tee_transport_driver);
+
+MODULE_DESCRIPTION("RISC-V RPMI TEE service group transport");
+MODULE_LICENSE("GPL");
diff --git a/drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h b/drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h
new file mode 100644
index 000000000000..b25192c5df00
--- /dev/null
+++ b/drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _RPMI_TEE_PRIVATE_H
+#define _RPMI_TEE_PRIVATE_H
+
+#include <linux/mailbox_client.h>
+#include <linux/types.h>
+
+/* TEE service group and the services used by this module. */
+#define RPMI_SRVGRP_TEE		0x10
+
+struct rpmi_tee_mbox {
+	struct mbox_client client;
+	struct mbox_chan *chan;
+	u32 max_msg_data_size;
+};
+
+struct rpmi_tee_transport {
+	struct device *dev;
+	struct rpmi_tee_mbox mbox;
+};
+
+#endif /* _RPMI_TEE_PRIVATE_H */

-- 
2.34.1

