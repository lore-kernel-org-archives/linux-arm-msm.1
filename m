Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB27429CD8
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786973393; cv=none; b=Fy+3TuXDIC1FMsBx8eOdo8h5qwgakKezVtjbZiokRixRJnCILlDEE+ODLv0dt96m2qyEXtyt8c0JfJ5RtRXdYWtrP5pCkAYnkoVwcuZnSvo+z1LBlCYcXyrc35LfkTSWG5brZkDdUY47UoAk7TNftXsj01eU+31RMxnrHVzWzHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786973393; c=relaxed/simple;
	bh=cM5ftP0enNdp1Dvlgt6HFPAx6xihorQNyUls6IpgxR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QJcWFBagG0uhKht6HlwEyhqhqRY6LNazUvdTa/WNxMwchqNCtCe8qrd+XcpQEpPuLvSXq0Afov/DA2/oo4LAD9b8sa2fv4mK0Q+s2iTlq+7F3s6TNCnDXWRrh3E0vquRcp4LFOZ9l3QFyFnpb6QeHodjO37fxTvM5D6WtIR6eRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S+A0JC57; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S+A0JC57"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD68Yj2749203
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:29:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KGkdlxrYuSGdPywToyYxKuJvJ8ejPqYPanm1HtddtR4=; b=S+A0JC57ZoCyeDi1
	caXXZwV2aiqtwItgRcNAFsD6fzMSMrw3dQH4E8BpgnsAocYMFvH8ZafqybIvYrg1
	0q70HBDb91LLEuQArIcnX9R7gXkMcEwkZElCCSDo6gBhTKNYyqQcFn66OsXtRI6p
	x4nqJ7mQrPMjExAsq+at0dWClXtibYFCNdaHtDwf5S9YlXI9LeV2WVb/AsvFd8f4
	a6ROitvaIxitsdvSqZUQ2s1eOPeTxq8O0n6XGodIQinjOAyMYSq/+0d8hm3otzqR
	xeUTGfvUScWK5H9R/y2g5owAjktdI9XPq2NJutIlF5/BeEg8AlaJYmKOJPW6hch1
	G1VFtA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3y7791mc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:29:50 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67HDTlwG000822;
	Mon, 17 Aug 2026 13:29:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 4g2h6jamdp-1
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:29:47 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67HDTl2n000796
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:29:47 GMT
Received: from hu-ffaruque-hyd.qualcomm.com (hu-ffaruque-hyd.qualcomm.com [10.147.245.31])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 67HDTkmS000795;
	Mon, 17 Aug 2026 13:29:47 +0000 (GMT)
From: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 18:59:42 +0530
Subject: [PATCH 2/4] power: reset: add PSCRR NVMEM recorder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-pscrr-provider-v1-2-88a318c13d41@oss.qualcomm.com>
References: <20260817-pscrr-provider-v1-0-88a318c13d41@oss.qualcomm.com>
In-Reply-To: <20260817-pscrr-provider-v1-0-88a318c13d41@oss.qualcomm.com>
To: kernel@oss.qualcomm.com
Cc: avaneesh.dwivedi@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.15.2
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwMyBTYWx0ZWRfX3/4u9CBuVehR
 Z0oFV8+c3/X8IFKsrGfUB59ZgQzBdiDcQutvBJb4+L/ZcDTcB6+WXH5lbJeztcBeFKamViT/aqe
 LPovyXeVnTvxiu79zCN3HDGjdmU0Dl4NSA9LjTCijYkwJ1qR9N5DXEpxuObnVTBmF1yBDfidJmp
 dhP175aGpXpvseI7QGgsTJrTE2ulx8xB8nUamEDiCD+rrIVAXwWroTLf7h+aVRp/DrceEUjCN/I
 m1axCs3e7H3foQ0d69MU6w2rdS0FiVW7KXOdSstulmKq7Udih4VsBkhTf+beZbZVky5ZDTFZ3Nr
 4PYqxSFEQG4Viv8GcJTcgfQJPUwygxdqR87dCgsQK6kmI4Hq8sKYqiVFG1bEdSgXrUBfj+jmPia
 7xQULeiMfzggcdl/QsPHq/Shevg1a5pExZupiwQgptue3TcG+Yq+tf/OuzLIxqaUCHbV9E9YIuw
 7Rspjm3J9UG5zR+fXEg==
X-Proofpoint-ORIG-GUID: E0gFfV-G_k4MiS_ZIn-8HjVPmULe2wth
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwMyBTYWx0ZWRfX1I1xHopYXi4z
 Np5IuhFfTsgriNXdRBTa5njgnKtwlk9mll7KWGCfadG8IhuAQAReKcwe53NOLIHZi/EgMk7PM19
 cNrJSrYQNHYo12yR03XuERck62NqUEc=
X-Proofpoint-GUID: E0gFfV-G_k4MiS_ZIn-8HjVPmULe2wth
X-Authority-Analysis: v=2.4 cv=WNhPmHsR c=1 sm=1 tr=0 ts=6a830cce cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=HK-LrPc_DGzbyERBICQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170103

Record the power state change reason into a small NVMEM cell (an RTC
scratch register or EEPROM) and read it back on the next boot, so the
cause survives a power cycle. The cell is a plain nvmem consumer
reference and the reason value is stored directly.

Co-developed-by: Oleksij Rempel <o.rempel@pengutronix.de>
Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
---
 drivers/power/reset/pscrr/Kconfig       |  14 +++
 drivers/power/reset/pscrr/Makefile      |   1 +
 drivers/power/reset/pscrr/pscrr-nvmem.c | 155 ++++++++++++++++++++++++++++++++
 3 files changed, 170 insertions(+)

diff --git a/drivers/power/reset/pscrr/Kconfig b/drivers/power/reset/pscrr/Kconfig
index 72de82731b53..bfcf04b0c8f5 100644
--- a/drivers/power/reset/pscrr/Kconfig
+++ b/drivers/power/reset/pscrr/Kconfig
@@ -31,3 +31,17 @@ menuconfig PSCRR
 	  unless hardware provides the reset cause.
 
 	  If unsure, say N.
+
+if PSCRR
+
+config PSCRR_NVMEM
+	tristate "PSCRR NVMEM recorder provider"
+	depends on NVMEM
+	help
+	  PSCRR recorder that stores the power state change reason in a
+	  small NVMEM cell (such as an RTC scratch register) and reads it
+	  back on the next boot, so the cause survives a power cycle.
+
+	  If unsure, say N.
+
+endif # PSCRR
diff --git a/drivers/power/reset/pscrr/Makefile b/drivers/power/reset/pscrr/Makefile
index e5530a858971..95c80c80c7da 100644
--- a/drivers/power/reset/pscrr/Makefile
+++ b/drivers/power/reset/pscrr/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_PSCRR) += pscrr.o
+obj-$(CONFIG_PSCRR_NVMEM) += pscrr-nvmem.o
diff --git a/drivers/power/reset/pscrr/pscrr-nvmem.c b/drivers/power/reset/pscrr/pscrr-nvmem.c
new file mode 100644
index 000000000000..66bfb8ef19f9
--- /dev/null
+++ b/drivers/power/reset/pscrr/pscrr-nvmem.c
@@ -0,0 +1,155 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * pscrr-nvmem.c - NVMEM recorder provider for PSCRR
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ * Copyright (C) 2025 Pengutronix, Oleksij Rempel <o.rempel@pengutronix.de>
+ */
+
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/nvmem-consumer.h>
+#include <linux/platform_device.h>
+#include <linux/pscrr.h>
+#include <linux/reboot.h>
+#include <linux/slab.h>
+
+struct pscrr_nvmem {
+	struct nvmem_cell *cell;
+	enum psc_reason reason;
+};
+
+static int pscrr_nvmem_cell_read(struct pscrr_nvmem *priv, u8 *out)
+{
+	size_t len;
+	void *buf;
+
+	buf = nvmem_cell_read(priv->cell, &len);
+	if (IS_ERR(buf))
+		return PTR_ERR(buf);
+
+	*out = len ? *(u8 *)buf : 0;
+	kfree(buf);
+
+	return 0;
+}
+
+static int pscrr_nvmem_cell_write(struct pscrr_nvmem *priv, u8 val)
+{
+	int ret;
+
+	/* nvmem_cell_write() returns the byte count on success, not 0. */
+	ret = nvmem_cell_write(priv->cell, &val, sizeof(val));
+
+	return ret < 0 ? ret : 0;
+}
+
+static int pscrr_nvmem_read_reasons(struct pscrr_provider *p,
+				    unsigned long *reasons)
+{
+	struct pscrr_nvmem *priv = p->priv;
+
+	/*
+	 * Report the reason latched at probe (or overwritten by a later
+	 * record); the cell itself was cleared at probe, so it is not read
+	 * live here.
+	 */
+	set_bit(READ_ONCE(priv->reason), reasons);
+
+	return 0;
+}
+
+static int pscrr_nvmem_write_reason(struct pscrr_provider *p,
+				    enum psc_reason reason)
+{
+	struct pscrr_nvmem *priv = p->priv;
+	int ret;
+
+	if (reason >= PSCR_REASON_COUNT)
+		return -EINVAL;
+
+	ret = pscrr_nvmem_cell_write(priv, reason);
+	if (ret)
+		return ret;
+
+	WRITE_ONCE(priv->reason, reason);
+
+	return 0;
+}
+
+static const struct pscrr_provider_ops pscrr_nvmem_ops = {
+	.read_reasons = pscrr_nvmem_read_reasons,
+	.write_reason = pscrr_nvmem_write_reason,
+};
+
+static int pscrr_nvmem_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct pscrr_nvmem *priv;
+	size_t bytes, bits;
+	u8 val;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->cell = devm_nvmem_cell_get(dev, "pscr");
+	if (IS_ERR(priv->cell))
+		return dev_err_probe(dev, PTR_ERR(priv->cell),
+				     "failed to get the pscr nvmem cell\n");
+
+	ret = nvmem_cell_get_size(priv->cell, &bytes, &bits);
+	if (ret)
+		return ret;
+
+	/* The reason is a single byte; a bit cell still occupies one. */
+	if ((bytes ?: DIV_ROUND_UP(bits, 8)) != sizeof(val))
+		return dev_err_probe(dev, -EINVAL,
+				     "unsupported pscr nvmem cell size\n");
+
+	/*
+	 * The cell survives resets, so at boot it still holds whatever the
+	 * previous session recorded before it went down. Latch that as this
+	 * boot's reason, then clear the cell back to PSCR_UNKNOWN: if this
+	 * session is later cut short by an abrupt reset that never runs the
+	 * recorder (watchdog power-cycle, sudden power loss), the next boot
+	 * reads "unknown" instead of a stale reason left over from an earlier
+	 * cycle.
+	 */
+	ret = pscrr_nvmem_cell_read(priv, &val);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to read the pscr nvmem cell\n");
+
+	priv->reason = val < PSCR_REASON_COUNT ? val : PSCR_UNKNOWN;
+
+	ret = pscrr_nvmem_cell_write(priv, PSCR_UNKNOWN);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to clear the pscr nvmem cell\n");
+
+	return PTR_ERR_OR_ZERO(devm_pscrr_provider_register(dev, "nvmem",
+							    &pscrr_nvmem_ops, NULL,
+							    priv));
+}
+
+static const struct of_device_id pscrr_nvmem_of_match[] = {
+	{ .compatible = "pscrr-nvmem" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, pscrr_nvmem_of_match);
+
+static struct platform_driver pscrr_nvmem_driver = {
+	.probe	= pscrr_nvmem_probe,
+	.driver	= {
+		.name		= "pscrr-nvmem",
+		.of_match_table	= pscrr_nvmem_of_match,
+	},
+};
+module_platform_driver(pscrr_nvmem_driver);
+
+MODULE_AUTHOR("Oleksij Rempel <o.rempel@pengutronix.de>");
+MODULE_AUTHOR("Faruque Ansari <faruque.ansari@oss.qualcomm.com>");
+MODULE_DESCRIPTION("NVMEM recorder provider for PSCRR");
+MODULE_LICENSE("GPL");

-- 
2.34.1

