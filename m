Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839CC41D639
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 03:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651878; cv=none; b=tUezxkRGoUhHXj/SCHzCxM1cvu2khWgyHNNltsZ1Tv/wyzUukrNX5TNzObCekIu/zNZL4gkgrP+wSaTXg5qFNOhwSta5QEkXBCX3u7pXpt2nx+VCAJWjmeSJIZzWB4QS9PFX6X5Pe/bqZVyfZH8oVS1/5rUQZq6YTrG3Sgj2zFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651878; c=relaxed/simple;
	bh=oTy1duB6jN3k5Bp37ZNFZXzeLVSqBJv4Ke1sGvrI5PY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z1l7PNgcw54WdTOYQURyr2HV8Xt3KraQlB+uBkAOAzAz2T5uq848B8HmWMS7WD5v6p8IQgdxfRtga7vBgvlSmrW4dvf1ynbB6AqtXjh6qrtOnZ4ePG/ebBIRtWKnshje0Ii84VE5z5gu1idwg3yf1vKsKR8MPDyDWyqmgI4sEhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KeU2pJTo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kMvW+Ppw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KeU2pJTo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kMvW+Ppw"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T0jVow3211182
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 03:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aCUHYK+w4BDMVrp4w2bXUwotIcGHHJCYmu108KdLKKU=; b=KeU2pJToCBgVGDtb
	l2KtoBHgPRgiyunO+KHMzrEeKafoEfIOX9XBJlls+lJA8/9RnSnaT8FxYIkUaWHI
	WIL4u2//qOjR4SSqyhDLWPSe7s+xQ437Uu9cYmLky4D7sSdkZK44A+OEVBizZ9Ro
	aCEwd24IZ7zouG9puTvNgf0TyjVbtTuUYHgQOx/x6aZj0oaKwi5zJgi9X9Ms34Qk
	gLJcHOWOMCb/pp9bJ2EseOB0REnbRAwvXiu7gtUg1cZgb1Mxp7fx6MBylgG77/Cn
	783E9shzCBqnHN9B0eNA84bYh/CwBJqajdnDWNF76DpWfTDyioMpyGF8MYpkLUmd
	uqjFTw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4rvu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 03:17:51 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-343eadc0ff3so134256eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 20:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790651871; x=1791256671; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aCUHYK+w4BDMVrp4w2bXUwotIcGHHJCYmu108KdLKKU=;
        b=kMvW+PpweigzihV2cJXggJUKO5fC+nGxaUSxm3kJblZEaYaKN4EVCAyIfVSarQs+r5
         P11SnHUdWzjr0XMEERJYgc7XdxfH4YIav7/zOX+Nn4V112d4UMkiuNPjasZZmUUoBFRb
         Oy6hE9AwU0cwjYn0mKEs7yP9xrUoEZFHCtiGRRiHIzpVasUcMF1SpDXqfkupKuuRp1UA
         242m7MXG1YkPEmyRXg0d59rLZjN0UgTLJnB6sHOSvc/mRXFQGzG/GUZ5yx1/8AMvrcPz
         f3bnNACzh9t59lpXZRwjOD+bIQ4wfIuW2L8NdpXnF5MXqmUKhmyI1ofC4XxqhYTj4zDC
         x6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790651871; x=1791256671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aCUHYK+w4BDMVrp4w2bXUwotIcGHHJCYmu108KdLKKU=;
        b=AB/QL1FTh4OCEBedi2oSeHfMFRzbRtOyg5blfgQq9wQPZZ+g7/RBl0/QqJYGvZU99H
         NROHRhQyTMK0NFlQcdpVhJjzjOxMwRgZr7hMONw1We4OuBwRlffp8j2xO2XYONuwUq70
         9w0W8BOn4TXCUtTqR4T2W9ABVKBQfgn3nBKocH2OXu3X38uW7bx6HgKiWpNyyWv8ga27
         u+gxJ/INR1A5gtHsp8DRH9CQHN3IcEuFgUklt95ss/Ah9VZKBe1zuJqk2qr130FkfTSY
         wrfPFwfTe5K/Y3ZN1g8hMU+1incrlDLSwpdfumzlecR/GJkGSJrCu0NBFMaqbzqrAJC1
         jUEg==
X-Gm-Message-State: AFuF++lhC0xlfHS6bdrIGh3uqN0J5GlJ3Q/ZZoAhgART7yaZSnHobtpp
	9R8ttoSdWd9N3pVwRDBbyr5vG3vW9wGRzK1fFc1WwJ/04S+Ack6cV3T8rwUncUT66Vz410cIKmA
	eWzWjd+sYo4dPfGI0PJcK4M/S/F0nyJtNbC84OyqcaXu7Cd6pNeZ16AuCfcldkrHHFm4=
X-Gm-Gg: AYBFou00EnOLgtgM8o9sNvyXlkbQJ9RGop60gdndh9laJbyqmKE7UJht6V9lT8GsxPH
	Tz+dxY2Nr7MxRUDSfU7sQ5c1RdibeeSlB8qg4jhRXhMK/TX+X6JBqfV0KWVvJMJvm71leQz8KHq
	Z5VwWxbiGkSF8p1RwNtptGBLP8KImQsEBnJ/dId895ZomHNg4l5GU9VkL17w1PsCSurzw2KOg+G
	3SBYy/0Tgw2HYuokCSzeatHVdUoTXgqttdtJaa4ggywDOuyKEcejY0oB25tgq78B2HHBXAq4Tc6
	If6Nf39wsVSoaa7hiGJPgQ+b8Jb7GK7bjCAnlzJY/R48gIzlBQir4H5L6hXommAqWvzOp9u1Yzj
	SS4ebHQ+Qb7h0nshm2oiWQukBAlAs9A40HAlDDIQjHutlhnUcozUWmYs49wA=
X-Received: by 2002:a05:701b:424f:20b0:136:4bbe:9524 with SMTP id a92af1059eb24-14b2df6149dmr1530574c88.10.1790651871188;
        Mon, 28 Sep 2026 20:17:51 -0700 (PDT)
X-Received: by 2002:a05:701b:424f:20b0:136:4bbe:9524 with SMTP id a92af1059eb24-14b2df6149dmr1530549c88.10.1790651870575;
        Mon, 28 Sep 2026 20:17:50 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad4028a9sm24789368c88.11.2026.09.28.20.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 20:17:50 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 20:16:56 -0700
Subject: [PATCH RFC 05/10] firmware: add RPMI TEE transport core
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-riscv-rpmi-tee-abi-v1-5-04908b81d885@oss.qualcomm.com>
References: <20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com>
In-Reply-To: <20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rahul Pathak <rahul@summations.net>,
        Anup Patel <anup@brainfault.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amirreza Zarrabi <amrzar@gmail.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, op-tee@lists.trustedfirmware.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxMiBTYWx0ZWRfX1sk+kDr9ZjWM
 2ZdIyoSyrA1KjncEaSP54o3kFaSNpxEw0Aj46n2A3mnE4jUwroO+J5ro7w37nedrVOfcnZtf7JY
 Ovsw3ZTrdDyQ+9KtCV99wAsYR+qOxQg=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abb2ddf cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=5numxkeOl0lsm_bA3l4A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxMiBTYWx0ZWRfXzWwUZOI/K6bu
 aDQZGzoRI4poPf8PEfWL0izJE04R2K+WPeGnS+IGD2shh8WJapSkBtiKTxmFnCSevziK9I0uztO
 9lHTyu2FOgAvPGXMqTXmdAUDJlNeX8laF2UMeaSGzW/+Udk1ru3dYiPf6SvrEnuILUc1xLWAOQe
 pkWGe5uMnXyRuKnGHHnzNw/Rw0Bx+yeoLB9kpVrEHMUO9pjxv+z0ifAP6G1tpMNkO6vmp/IYp+r
 sOrX6k2l9AK//hn6y5bumTH48WoBX8DXLEk4W1v19e8I7hRzAoMbol0HtLUvKoylM/jQTss/Scy
 jZA3rH2k+JA47PN3hEQ4qFypJVJolv64lJ1mWvSzpSHjGFUCG/8QBXZ7bdwaa4melNlcqm/z9PV
 OaJ5qpGkZdO4Qa5EpiLu8G298R9Fn2SNyMk+AYQJf0eIwCxUos+vgwhIzgMJ2e1VpyRvXusOeDh
 Jqq07p/GBss99RUDqJg==
X-Proofpoint-GUID: JwvtLd9D2nsBmy-zSqVQ8JQXa8JFv2hp
X-Proofpoint-ORIG-GUID: JwvtLd9D2nsBmy-zSqVQ8JQXa8JFv2hp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290012

Add the RISC-V RPMI TEE platform driver and bind it to a direct
synchronous mailbox channel via tx_sync.

Before retaining the channel, validate the RPMI spec version, the
TEE service-group identifier and version, and cache the negotiated
maximum message data size, so later discovery, memory, and
notification support can rely on a checked transport.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/riscv_rpmi_tee/Makefile |   3 +
 drivers/firmware/riscv_rpmi_tee/driver.c | 144 +++++++++++++++++++++++++++++++
 2 files changed, 147 insertions(+)

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
index 000000000000..633dba116584
--- /dev/null
+++ b/drivers/firmware/riscv_rpmi_tee/driver.c
@@ -0,0 +1,144 @@
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

-- 
2.34.1

