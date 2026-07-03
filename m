Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AD43DA5AA
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 13:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783086338; cv=none; b=pMFwYQORoMF+rWRx5Of3j+12TWllvKP9zeqtXPKAd6jlzZp9F4R0zhkERUZ7vilH/hX1rXYHp1MJal0/9jgpaZ9/ziHKWkWRM2CDr9JGQp59xbkzsu6OFB2zG0S3Z/qxiamKVIGf2ThGN2TX+6IxBUUH4IwrfD8RVlYDVWwqCig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783086338; c=relaxed/simple;
	bh=OdPOKKlbW0ZzQ3+KlsHAM9jmU0K/5OsKJUZW/jJ6+SE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d/rN/nTeJjtDpBZjJE6hsygwHUPYBgP1XG1SloU27hvfzZRt8EwrWc46c/TvxUe+TTElFKsv10i8IYCjJGojTcp1pYAM+pX5ja/vbKdYkg/PjfcnYR1r5Ne9+JdeoOkW2H+opdggZSsqbT6aQRmsnB2Yed8OkkRn+prwmvFA9MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AbWKoUez; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PHPYn9q2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AbWKoUez";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PHPYn9q2"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663D19qb053953
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 13:45:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5LZg084X8oESe0Pt2j2b2WZfAnHvwlOp8bKuKaUwaHw=; b=AbWKoUezvsWbQp8z
	+H2gPsHYWfLAdg3Rz9kCJGEcuOlQGjTG11LuIobwXAfgl0uihmjWt+l8oG1ikZRO
	X6iin5/LYfuiAMcwwPiCVTrs+noK/6UBggnS3MH0Fff3mQYa1rKWud0myKTh6JXF
	hvNmKr8aR7LGaK51n00/AmXTwyoJPHqRCn0vjYGoj16J70v9sa46TT4n3s8QmO/W
	Iloil+ebKp3SIm/y6noPToy5c/sFOuultZuDqrymas02XPdDuTIH2EDH/WxeijKV
	a9kVsR2JDyfP9adQbMN2MSUkhwfONLVPH7+VkVtIx7W0LOA7J6YCt2L7EOSKCCzN
	ZlYn9w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6dkkg4r3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 13:45:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e663c29f2so68301485a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 06:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783086333; x=1783691133; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5LZg084X8oESe0Pt2j2b2WZfAnHvwlOp8bKuKaUwaHw=;
        b=PHPYn9q2TvoqGl6Yi8YELwzi7xqPgSd9vNDNitPlmLb/tRFrSwoMJIO1hmEF0S3kSb
         /kKiFf9EXglZE+sDMHosaDKrXOemoc9lYCHOEWQ/3gSGZn0pxmF9b9a9BbayngL+++Nm
         oMu34nb7OVnAGv3VlAjGwAEvsZFWrylOtHZSOo5orRnEvK+oWHEhSV1lr+BuogNTlLTe
         6JrWd8yaS6HMJ7u49pG0SfdLuXzRuvKUwPoExOONaVdmjm4pBJ3PZsl+bZzGjvON2zC0
         vLymeb87Dyl87sEa4ns6d8ZeaX1bD/L4UgSny7P+2TV+j2dw7I+xYpnzOXCauy6Kwkn0
         prsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783086333; x=1783691133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5LZg084X8oESe0Pt2j2b2WZfAnHvwlOp8bKuKaUwaHw=;
        b=Moo1vL4xg1tkZoSOrebsby4iB44X3OVuNo+MXTfUgh9PqNQgLsYWxt+Lh2jnNNdlmS
         N6nIASUPDEH9HsaBC+cmb+CgEiqwKdGyaA31U/sEx9GJVNlMPCmlWpYXLFhMj6SIQJ0P
         vzr0wG8lxDCddLV2VTPOVeIUpTiZPO1h0j/j15SrW+QJ13j4QSJOKsHpLjGhX+WZd4re
         5ex6njPxMQY+tWl5AeR9Ei98LEHQmHAI64jNz7A9XAeAtrdVLzdhR3wae37RrlBW1wuy
         FxJ3PJG51LRSZwFF7NwKe+OZJid5uxX7oaYp+WJDwfAK6chRT/qp+Fvqmr/vTc+F8hjp
         on2g==
X-Forwarded-Encrypted: i=1; AFNElJ8BaDjqJzoIMxF66lHRvBSvopOODFlw06ENv2pyPok+dhsNoV0FzainU+bl3QJmNo7LBrZeG3GFG4pYC6Qb@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2/WpXYWLz8NOC2uVk+WaSV79aTZ+C3mm7ZPfvbDWcoSbxaEYx
	q333Y+nT8nxo9tZiFMzKp30TXcGvrw8Tnnr61hmFUJ5UosbQgO8nGZwYgewRV1i4XerrFVagcjL
	AS0FYnjRqBYO5sDTS6vApYFx8uueoQRJzlcRf0wU3FrZXQ1VGTcl6EMn4ifYny8SmSlnB
X-Gm-Gg: AfdE7cnTr+1z54t7e04UMHBV/JTyQaC7rxAYgZm+sgXBf+ZopPk7xkZOloDjawBnoLD
	tRwmuf7DzRUZwShDp/G3aPrNltufIllCegVpkneGg3cJibe38ROpKIrhrMDOKGIbxkYQzDs30M2
	4Er1hGTZKfhNSv2d4veyYLVF0H1qSdVdhsKxQj3qMkYBcFP1tf40reRZ8+eO3K8M/IRp94oU6Fs
	aci8WgS+ziRBBmWO63FXAjoQ9t6LARqwxZBNNKjY3sUxYPhlah2qHPbEkqon2XQ8nX7p4dIUy5W
	KLG12uhOGo/EF7cZ8AZsvXY0mMjmu+eZ3Vk2zwsA4uV+Hq9eXaGbTc0ga2t4ctMlt0qZ60souwA
	XehLD+UXDqxgU+kf/P5tznP8/L9UpYFRLhAvdkOlHNLAV+M3l6OG3T4TCgC5JryKxMcRlTgKxrd
	RDK3PSXpBIK4S9BKLls2OHXg7TU7is4dhGLQ+VrU6PHhcBt1xiCLmXYAWGPLk1Ng4=
X-Received: by 2002:a05:620a:3947:b0:92e:7167:3f2c with SMTP id af79cd13be357-92e8b5462f8mr487413485a.32.1783086333144;
        Fri, 03 Jul 2026 06:45:33 -0700 (PDT)
X-Received: by 2002:a05:620a:3947:b0:92e:7167:3f2c with SMTP id af79cd13be357-92e8b5462f8mr487405385a.32.1783086332480;
        Fri, 03 Jul 2026 06:45:32 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6059e4csm286135466b.1.2026.07.03.06.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 06:45:31 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 15:45:18 +0200
Subject: [PATCH v8 5/9] block: implement NVMEM provider
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-block-as-nvmem-v8-5-98ae32bfc49a@oss.qualcomm.com>
References: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com>
In-Reply-To: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEzNSBTYWx0ZWRfX7vxtux/DeEr1
 MCLxQH4j/oH4y9SYK4ey+TXcAT+7OazsTcEgX2TI0SxO+j0EcjKxw+aZIITrMPhAPtP7Q8Oghad
 mHUeART/3Q7GSpWYvFAXn6fnGblKRSQrgAQ9KXUQUe3JRRbV06+BKGgXKdgEjtxdr6P9bHpu5Ew
 a/CkkmsghewXxMnxgKZpcoF9/B3P9RDlx+Cq/Jf7cfdwOTVi+BJpgfFDVzMY8A1acGzgTEAAQcb
 YcwkgTgkAOSN0bApQrf0J5/jTkQHWbVByYYfoCrggShHzU6gwdbhMM2mDls/Q8a+GMskuH5rsQ2
 a2c1NFnFEgav+kJimYz+mFLXg4D4Ww3nDxfYP2/D8GeGe9Rgd15F+tUQhHPo8GrjE3ypB1Jh6re
 TYyEQCgNaVgoiEiv/YubNT8nc1lh6t5o2h6pN8cVh10LeEq3xRihhJfYA4DTreipZT1s32wUSJd
 Jy8TdUohZ2ekzQZwWnQ==
X-Authority-Analysis: v=2.4 cv=LeUMLDfi c=1 sm=1 tr=0 ts=6a47bcfe cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VT4XjZGOAAAA:8
 a=EUspDBNiAAAA:8 a=QS6QONgytJYYblx7mpIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-ORIG-GUID: S7eeu734bOcPqCvyEqIxfCl8q1vB4iTU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEzNSBTYWx0ZWRfXwM47l7sAhLtK
 o2cDi+UvjmlerqgK+jpY6IxJDPPl5dR2nGJ/71SFRzRDOMoCQEZeFztqs/+/nmCQlAxi3+wrvfp
 Fs63ikG0/AAQDE1DX9A9yJgL3fqo/VE=
X-Proofpoint-GUID: S7eeu734bOcPqCvyEqIxfCl8q1vB4iTU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030135

From: Daniel Golle <daniel@makrotopia.org>

On embedded devices using an eMMC it is common that one or more partitions
on the eMMC are used to store MAC addresses and Wi-Fi calibration EEPROM
data. Allow referencing the partition in device tree for the kernel and
Wi-Fi drivers accessing it via the NVMEM layer.

NVMEM is registered for a block device whose OF node describes an NVMEM
layout, either via an "nvmem-layout" child or by being a "fixed-layout"
node itself (e.g. an eMMC boot partition associated through its mmc-card
node).

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 block/Kconfig             |  11 +++++
 block/Makefile            |   1 +
 block/blk-nvmem.c         | 110 ++++++++++++++++++++++++++++++++++++++++++++++
 block/blk.h               |   8 ++++
 block/genhd.c             |   4 ++
 include/linux/blk_types.h |   4 ++
 6 files changed, 138 insertions(+)

diff --git a/block/Kconfig b/block/Kconfig
index 15027963472d7b40e27b9097a5993c457b5b3054..69370ea2e268b9e5320477c747db4aab15abe3ff 100644
--- a/block/Kconfig
+++ b/block/Kconfig
@@ -209,6 +209,17 @@ config BLK_INLINE_ENCRYPTION_FALLBACK
 	  by falling back to the kernel crypto API when inline
 	  encryption hardware is not present.
 
+config BLK_NVMEM
+	bool "Block device NVMEM provider"
+	depends on OF
+	depends on NVMEM
+	help
+	  Allow block devices (or partitions) to act as NVMEM providers,
+	  exposing factory-provisioned data such as MAC addresses or Wi-Fi
+	  calibration blobs to the drivers that consume them. This is
+	  typically used on embedded devices where such data is stored in a
+	  dedicated area of an eMMC, instead of a separate EEPROM or OTP.
+
 source "block/partitions/Kconfig"
 
 config BLK_PM
diff --git a/block/Makefile b/block/Makefile
index 7dce2e44276c4274c11a0a61121c83d9c43d6e0c..d7ac389e71902bc091a8800ea266190a43b3e63d 100644
--- a/block/Makefile
+++ b/block/Makefile
@@ -36,3 +36,4 @@ obj-$(CONFIG_BLK_INLINE_ENCRYPTION)	+= blk-crypto.o blk-crypto-profile.o \
 					   blk-crypto-sysfs.o
 obj-$(CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK)	+= blk-crypto-fallback.o
 obj-$(CONFIG_BLOCK_HOLDER_DEPRECATED)	+= holder.o
+obj-$(CONFIG_BLK_NVMEM)                += blk-nvmem.o
diff --git a/block/blk-nvmem.c b/block/blk-nvmem.c
new file mode 100644
index 0000000000000000000000000000000000000000..642a12f8a8b1c88e25baa1b684adef48c8c91c84
--- /dev/null
+++ b/block/blk-nvmem.c
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * block device NVMEM provider
+ *
+ * Copyright (c) 2024 Daniel Golle <daniel@makrotopia.org>
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Useful on devices using a partition on an eMMC for MAC addresses or
+ * Wi-Fi calibration EEPROM data.
+ */
+
+#include <linux/cleanup.h>
+#include <linux/device.h>
+#include <linux/file.h>
+#include <linux/nvmem-provider.h>
+#include <linux/nvmem-consumer.h>
+#include <linux/of.h>
+#include <linux/pagemap.h>
+#include <linux/property.h>
+
+#include "blk.h"
+
+static int blk_nvmem_reg_read(void *priv, unsigned int from, void *val, size_t bytes)
+{
+	dev_t devt = (dev_t)(uintptr_t)priv;
+	size_t bytes_left = bytes;
+	loff_t pos = from;
+	int ret = 0;
+
+	struct file *bdev_file __free(fput) =
+		bdev_file_open_by_dev(devt, BLK_OPEN_READ, NULL, NULL);
+	if (IS_ERR(bdev_file))
+		return PTR_ERR(bdev_file);
+
+	while (bytes_left) {
+		pgoff_t f_index = pos >> PAGE_SHIFT;
+		struct folio *folio;
+		size_t folio_off;
+		size_t to_read;
+
+		folio = read_mapping_folio(bdev_file->f_mapping, f_index, NULL);
+		if (IS_ERR(folio)) {
+			ret = PTR_ERR(folio);
+			break;
+		}
+
+		folio_off = offset_in_folio(folio, pos);
+		to_read = min(bytes_left, folio_size(folio) - folio_off);
+		memcpy_from_folio(val, folio, folio_off, to_read);
+		pos += to_read;
+		bytes_left -= to_read;
+		val += to_read;
+		folio_put(folio);
+	}
+
+	return ret;
+}
+
+int blk_nvmem_add(struct block_device *bdev)
+{
+	struct device *dev = &bdev->bd_device;
+	struct nvmem_config config = {};
+	struct nvmem_device *nvmem;
+
+	/* skip devices which do not have a device tree node */
+	if (!dev_of_node(dev))
+		return 0;
+
+	/* skip devices without an nvmem layout defined */
+	struct device_node *child __free(device_node) =
+		of_get_child_by_name(dev_of_node(dev), "nvmem-layout");
+	if (!child && !of_device_is_compatible(dev_of_node(dev), "fixed-layout"))
+		return 0;
+
+	/*
+	 * skip block device too large to be represented as NVMEM devices,
+	 * nvmem_config.size is a signed int
+	 */
+	if (bdev_nr_bytes(bdev) > INT_MAX) {
+		dev_warn(dev, "block device too large to be an NVMEM provider\n");
+		return 0;
+	}
+
+	config.id = NVMEM_DEVID_NONE;
+	config.dev = dev;
+	config.name = dev_name(dev);
+	config.owner = THIS_MODULE;
+	config.priv = (void *)(uintptr_t)dev->devt;
+	config.reg_read = blk_nvmem_reg_read;
+	config.size = bdev_nr_bytes(bdev);
+	config.word_size = 1;
+	config.stride = 1;
+	config.read_only = true;
+	config.root_only = true;
+	config.ignore_wp = true;
+	config.of_node = to_of_node(dev->fwnode);
+
+	nvmem = nvmem_register(&config);
+	if (IS_ERR(nvmem))
+		return dev_err_probe(dev, PTR_ERR(nvmem), "Failed to register NVMEM device\n");
+
+	bdev->bd_nvmem = nvmem;
+	return 0;
+}
+
+void blk_nvmem_del(struct block_device *bdev)
+{
+	nvmem_unregister(bdev->bd_nvmem);
+	bdev->bd_nvmem = NULL;
+}
diff --git a/block/blk.h b/block/blk.h
index ec4674cdf2ead4fd259ff5fc42401f591e684ee9..ed0c10168ba7be10855509637f824a9cea2b9ccb 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -757,4 +757,12 @@ static inline void blk_debugfs_unlock(struct request_queue *q,
 	memalloc_noio_restore(memflags);
 }
 
+#ifdef CONFIG_BLK_NVMEM
+int blk_nvmem_add(struct block_device *bdev);
+void blk_nvmem_del(struct block_device *bdev);
+#else
+static inline int blk_nvmem_add(struct block_device *bdev) { return 0; }
+static inline void blk_nvmem_del(struct block_device *bdev) {}
+#endif
+
 #endif /* BLK_INTERNAL_H */
diff --git a/block/genhd.c b/block/genhd.c
index 7d6854fd28e95ae9134309679a7c6a937f5b7db8..1b2382de6fb30c1e5f60f45c04dc03ed3bf5d5f2 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -421,6 +421,8 @@ static void add_disk_final(struct gendisk *disk)
 		 */
 		dev_set_uevent_suppress(ddev, 0);
 		disk_uevent(disk, KOBJ_ADD);
+
+		blk_nvmem_add(disk->part0);
 	}
 
 	blk_apply_bdi_limits(disk->bdi, &disk->queue->limits);
@@ -704,6 +706,8 @@ static void __del_gendisk(struct gendisk *disk)
 
 	disk_del_events(disk);
 
+	blk_nvmem_del(disk->part0);
+
 	/*
 	 * Prevent new openers by unlinked the bdev inode.
 	 */
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index 8808ee76e73c09e0ceaac41ba59e86fb0c4efc64..6ed173c649025b95cce9253b27f68f2c7dbab8eb 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -15,6 +15,7 @@
 struct bio_set;
 struct bio;
 struct bio_integrity_payload;
+struct nvmem_device;
 struct page;
 struct io_context;
 struct cgroup_subsys_state;
@@ -73,6 +74,9 @@ struct block_device {
 	int			bd_writers;
 #ifdef CONFIG_SECURITY
 	void			*bd_security;
+#endif
+#ifdef CONFIG_BLK_NVMEM
+	struct nvmem_device	*bd_nvmem;
 #endif
 	/*
 	 * keep this out-of-line as it's both big and not needed in the fast

-- 
2.34.1

