Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824E3514758
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 09:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859654; cv=none; b=fxIUwHtgYfN7KtpMIMOkp0SoCXYnn/Put7Ug56PxfZwoGJiip/kXB1JqdtetAg21rmpmGJLfZ3TS8/IYLofMIQ6mXoSHVN1xkwK4V7JfD5Pt/Hnb7pIljnl39eO93O+q4vuiy4SUoOgW4XDks04xPYCpKtDzpjU0W+/mn6larAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859654; c=relaxed/simple;
	bh=+PgyMg+apJO1emm6HGjIcKrtzSqBG/5/2BWfyH4yxF8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kBye4TsZI5wteVK7JRXE77EI9WIfexCOjDcs0M0S0fOW8liU21WKUes7IZsGzrVOvsTTZUjncsA1kjwXMmNfNd3ciVyqyPmyH6XJs+/IpOpqdmdEVLWxwgTIjkCk07VYiQCj5//6sorfRuvMUlDeIWM08hANEJuC8SAzVGZpZRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=in4Izevm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fGWOIznI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="in4Izevm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fGWOIznI"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M3bT1479002
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 09:27:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4YhDi3cAQgf2tN7eG8YPR6wVhzZEw7W60fxoUrd7ULg=; b=in4Izevm26pgPTSC
	6eXzcRnQCJEpLeyjqT4h9x65Ypdc8pkYCTsXfXHwXtr7XQIupW2wrgL2UL7/ge9m
	w1DXgXLOmeAWA9lK0L2GJUMvGOzfWYjdkDURnKdhJrxWS1f/H5plAKhJx8IyzsdL
	ABTsKkX7ONdNdx6g3QHevzeGl+rmhcskuRXuLg6NoFX4MuJl8x3G4WeGbL/qDnsa
	WQk6/+Ov+UKCHbE2dzCGRjo2V+5fzSgcDVxPFbDQLtRxk3oRf9rRuGQ1+AIdfPX0
	aaHo1bJhSXxNUvEfDcBOd/5s2YdMVWS8Ufj23LUxA6gnxcEGopkjuX1AIsDcxfjE
	tQwTZQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjatjh8f0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 09:27:31 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1c18c775eso5434996a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 02:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788859651; x=1789464451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4YhDi3cAQgf2tN7eG8YPR6wVhzZEw7W60fxoUrd7ULg=;
        b=fGWOIznIUw49UXJCwUMJJINsFsfYmEa5KJMdrgUSG8yF3hdVY2ZmzpuyPFa8nZtRKO
         lG6ZUvb6oO5mHTa5vMRJlyD9lDRv3KqiGpVQ820f89lkD49vtE91aQova7idpeIxf5oK
         XH/yPwJcd0wMrEdxwKp1uNMIhYTjKZMkfZw1ICNeDlKG1bQUg7pr2ZCmOC/mJ1mUzWcw
         54LTAXGJX7qUnrKpPFFb55l/ncrO6SYEnqTRjTDfu1DJeZHRL5hu9WA5cS2++/0aaFbw
         SU9gioGi5r50W33wVOWPu0JUZxAH86wRwzKVbHG5/4TXXX35TP7dE2zQccpE3yXDTVmP
         mGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859651; x=1789464451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4YhDi3cAQgf2tN7eG8YPR6wVhzZEw7W60fxoUrd7ULg=;
        b=dTQsGvnRfmrRvtWzwAlFYrApPjeUCKCycwSK1IDvYdhXhBMn47lDIC6dzGmkVplnC/
         Jbb8KDj0/pXXUbc50HE9YbOz1gc6WOTHxDr7HneDEmLnWGbpq8N9ydQkTaQClXDnWTu5
         xKAuM8Zakm0xoToByrLw1mNreif09ojo4tApdrmIE08t/qd5+rifSOmrS1AzJ7yQwMKW
         d3pm3RFlRRYA6UZNd1GqzsV35ciRgfSL2JyjstrxxzoRmZuYQYSDZqsM6s6Hr5GQmaED
         yKqmiJZOUPWNICenH40JPEEUmGnLRu+PDk8/bwHxk4XW9e3S45zb8ekpB+Lvs++4XOgY
         v1xg==
X-Forwarded-Encrypted: i=1; AKwUvBxq5Uqd41RFJ7IQS9m6KjwguyihilbdBrradUMREzsYaMrAz29m3KUjxRpHVaulTp4f1IrLGcjvmI/UMjJu@vger.kernel.org
X-Gm-Message-State: AFuF++lnNX7S6mdKPQds5LCG5wXTI8NuB3AybrOCfQIM5/TZULOsFEy5
	Xmxi2g1pfP0V0iMmkOmW30PGHpN/sjfJw+W1uaqh0Gh8r8SnHo4DwIc0bv7WrH+QOzylZ+NVTXh
	+4amYICRfyC/Kd9FR3UDH4pdvWzeg2Fdkf6svvA88JXOUkig9hMgB0hsPV3uQF4CevZv5
X-Gm-Gg: AYBFou1Ab9S4ELk+RMC8yHOXgOM8aZB5DOsHPM2ocY00fKZMu4YaVmmHG/R+6/sqhtC
	yV8DaV0mxpxP00LgRZa6Q/HwZeAPCORED/ZSSiF8XhVOQ+PqoS8lx/xw6yi0dUJRnR9OXpdg5R1
	B//a9KemR6Cmixg3uSSUtDDJONGqvNBc3TJgQZe3vy1RvnqBwS2J2ieUXaaNvA07FEQ/5+7qJg+
	178SgQlmJ/m2CEPyfqYmC857PGvfWIdA56Lyv2CqQiT+2G5ja6iXjX9GKpSPxaELGkLntBYyvlG
	kfK254PGNG3nUBSiakJu5zVfQCjNaFKKrbPgZDBkj467cNQogu/M8W9aXXTtu45/MByXWueKEvZ
	q8+HxlCAKqBqpPRh07cnnkijU3A==
X-Received: by 2002:a17:90b:4b04:b0:396:4ce0:6400 with SMTP id 98e67ed59e1d1-39b07f33963mr37567066a91.2.1788859650829;
        Tue, 08 Sep 2026 02:27:30 -0700 (PDT)
X-Received: by 2002:a17:90b:4b04:b0:396:4ce0:6400 with SMTP id 98e67ed59e1d1-39b07f33963mr37567007a91.2.1788859650238;
        Tue, 08 Sep 2026 02:27:30 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befe870sm38281492eec.30.2026.09.08.02.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:27:29 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 14:57:22 +0530
Subject: [PATCH v6 1/3] bus: mhi: host: clients: Add loopback driver with
 sysfs interface
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-lb-v6-1-66755ceb16cc@oss.qualcomm.com>
References: <20260908-lb-v6-0-66755ceb16cc@oss.qualcomm.com>
In-Reply-To: <20260908-lb-v6-0-66755ceb16cc@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788859644; l=14714;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=+PgyMg+apJO1emm6HGjIcKrtzSqBG/5/2BWfyH4yxF8=;
 b=ZnGsS3D053L7Bj6hLHfZ52knAdflqKjXGwlpOWJUVkhOuMfFb8Qm3gk4OjGm26XGOQ5IfcmOV
 KrivbTVWIvLCe1Jn8MnHKO3bGzYsDDvq1X+FuyHfCBeQ4exaE0154rh
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA5OSBTYWx0ZWRfX0i7ajeYzlvqP
 SkCvaoeGzuYEUK2ggifJ0FErhN2IpIiPlYN9Ekw31uh6f34oWy/ExtdwaH93mVWdEMoLvOI1DW+
 oLY6Y6bi5pmAWnRcxrtXV0uTXcVNCl8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA5OSBTYWx0ZWRfX+KfLGr5jcI/K
 nL2oKSYeNCTmTBKnyHfamxfhEFv3AqZWbV9mD8og5zZ+ym8cEd98ZXOKYfB6TvyhJ5WrVRWoPL/
 waV93HWqcGLgmVdEVUMbE8Fl57ESgOkoAKtSPWoa/M9guoSnwfecbPKBJgectywVOJoGUZRrJvB
 be04bmWeZvwJxR4PiuJp/4cZGqXQA32K5xZf6AN2Rs6LEdmIWj6QxBEbNX/IEIRIDS0jUhXqeId
 zGoMqTEK1fWKqUqyEAH296J8jF2UpbLz49Jfb+Db+STX6tDJmwSFddOCWXjSaEkaGciqPaNCxpp
 Q5bv7dvTJeV2oV4WPREPNVkKoLV3AuNxX35vSlpy7DfjqX+UgJzqLrG4Pijkizga6ZEGRGl50ZY
 zMO1kFm8v7lUU0bTgznv6dwT/D5UTMFbQMMrHa52JnSoIcMRyJrx5hVC1HB3V8K5RBBox8uJpai
 UHnOJteZUZHkpvLZJEw==
X-Proofpoint-ORIG-GUID: vPgGngZ2jqbY2CoViRGPVSXBkG8Vjj_I
X-Authority-Analysis: v=2.4 cv=QrduG1yd c=1 sm=1 tr=0 ts=6a9fd503 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=AwGs7t8Iw4eTprD25B0A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: vPgGngZ2jqbY2CoViRGPVSXBkG8Vjj_I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080099

The MHI specification defines a LOOPBACK channel. The endpoint firmware
echoes back whatever the host sends on this channel. Without a host-side
driver, there is no way to exercise this channel to validate MHI data path
integrity between host and endpoint.

Add a host-side loopback driver that binds to the LOOPBACK channel and
expose a sysfs interface for data path testing. The sysfs interface allows
users to configure TRE buffer size and count, trigger a loopback test, and
read the result.

The new sysfs ABI is documented under Documentation/ABI/testing/, not
stable/, since this is a new interface without established API
guarantees yet. It is unrelated to the existing stable MHI sysfs ABI
documented in Documentation/ABI/stable/sysfs-bus-mhi, despite both
being covered by the same MAINTAINERS entry.

Co-developed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-mhi-devices-loopback     |  40 +++
 MAINTAINERS                                        |   1 +
 drivers/bus/mhi/host/Kconfig                       |   1 +
 drivers/bus/mhi/host/Makefile                      |   1 +
 drivers/bus/mhi/host/clients/Kconfig               |  17 ++
 drivers/bus/mhi/host/clients/Makefile              |   2 +
 drivers/bus/mhi/host/clients/loopback.c            | 287 +++++++++++++++++++++
 7 files changed, 349 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback b/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
new file mode 100644
index 0000000000000000000000000000000000000000..9e47e8443f309199691a50d70adadf84f3237037
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
@@ -0,0 +1,40 @@
+What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/tre_size
+Date:		August 2026
+KernelVersion:	7.4
+Contact:	mhi@lists.linux.dev
+Description:
+		(RW) Size of each Transfer Ring Element (TRE) buffer in bytes
+		used for the loopback test. Valid range is 1 to the value
+		reported by max_tre_size. Default value is 32 bytes.
+
+What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/max_tre_size
+Date:		August 2026
+KernelVersion:	7.4
+Contact:	mhi@lists.linux.dev
+Description:
+		(RO) Maximum allowed Transfer Ring Element (TRE) size in bytes.
+		Reading this file returns the upper bound for the tre_size
+		attribute.
+
+What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/num_tre
+Date:		August 2026
+KernelVersion:	7.4
+Contact:	mhi@lists.linux.dev
+Description:
+		(RW) Number of Transfer Ring Elements (TREs) to use per
+		loopback test. Must be greater than zero and must not exceed
+		the channel ring capacity. Default value is 1.
+
+What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/start
+Date:		August 2026
+KernelVersion:	7.4
+Contact:	mhi@lists.linux.dev
+Description:
+		(WO) Write any value to trigger a loopback test. The driver
+		sends random data to the endpoint using the configured tre_size
+		and num_tre parameters, waits for the endpoint to echo it back,
+		and verifies the received data matches what was sent.
+
+		This is a blocking write that returns when the test completes
+		or times out after 5 seconds. The write returns an error code
+		if the test fails or times out.
diff --git a/MAINTAINERS b/MAINTAINERS
index 70663089f071c4eaa07fe7b9baf9003d8b981c07..b10f8cd592954e1450e5851045962bf05dcf1a50 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17628,6 +17628,7 @@ L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git
 F:	Documentation/ABI/stable/sysfs-bus-mhi
+F:	Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
 F:	Documentation/mhi/
 F:	drivers/bus/mhi/
 F:	drivers/pci/endpoint/functions/pci-epf-mhi.c
diff --git a/drivers/bus/mhi/host/Kconfig b/drivers/bus/mhi/host/Kconfig
index da5cd0c9fc620ab595e742c422f1a22a2a84c7b9..627c57948235aa52348179ae8b2d0826ebaed01e 100644
--- a/drivers/bus/mhi/host/Kconfig
+++ b/drivers/bus/mhi/host/Kconfig
@@ -29,3 +29,4 @@ config MHI_BUS_PCI_GENERIC
 	  This driver provides MHI PCI controller driver for devices such as
 	  Qualcomm SDX55 based PCIe modems.
 
+source "drivers/bus/mhi/host/clients/Kconfig"
diff --git a/drivers/bus/mhi/host/Makefile b/drivers/bus/mhi/host/Makefile
index 859c2f38451c669b3d3014c374b2b957c99a1cfe..2a16008aeb38127494782bbff4e1656428d2b776 100644
--- a/drivers/bus/mhi/host/Makefile
+++ b/drivers/bus/mhi/host/Makefile
@@ -4,3 +4,4 @@ mhi-$(CONFIG_MHI_BUS_DEBUG) += debugfs.o
 
 obj-$(CONFIG_MHI_BUS_PCI_GENERIC) += mhi_pci_generic.o
 mhi_pci_generic-y += pci_generic.o
+obj-y += clients/
diff --git a/drivers/bus/mhi/host/clients/Kconfig b/drivers/bus/mhi/host/clients/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..8bb5715e61d0d6e64a51012b4e1594ba46e5bfc1
--- /dev/null
+++ b/drivers/bus/mhi/host/clients/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config MHI_BUS_LOOPBACK
+	tristate "MHI LOOPBACK client driver"
+	depends on MHI_BUS
+	help
+	  MHI LOOPBACK client driver that binds to the MHI LOOPBACK channel
+	  as defined in the MHI specification. The LOOPBACK channel is
+	  implemented by MHI-based devices (e.g. modems, WLAN) in the field,
+	  where the endpoint firmware echoes back whatever the host sends.
+
+	  This driver exposes a sysfs interface for testing MHI data path
+	  integrity between host and endpoint. Users can configure the TRE
+	  size and count, and trigger a loopback test.
+
+	  To compile this driver as a module, choose M here. The module
+	  will be called mhi_loopback.
diff --git a/drivers/bus/mhi/host/clients/Makefile b/drivers/bus/mhi/host/clients/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..3811b6928f42b38f94b1167941cf3b0fe512d32b
--- /dev/null
+++ b/drivers/bus/mhi/host/clients/Makefile
@@ -0,0 +1,2 @@
+obj-$(CONFIG_MHI_BUS_LOOPBACK) += mhi_loopback.o
+mhi_loopback-y += loopback.o
diff --git a/drivers/bus/mhi/host/clients/loopback.c b/drivers/bus/mhi/host/clients/loopback.c
new file mode 100644
index 0000000000000000000000000000000000000000..058a8b587933245230eaae61bb7fe3361d4a362a
--- /dev/null
+++ b/drivers/bus/mhi/host/clients/loopback.c
@@ -0,0 +1,287 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/atomic.h>
+#include <linux/cleanup.h>
+#include <linux/completion.h>
+#include <linux/errno.h>
+#include <linux/mhi.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/random.h>
+#include <linux/sizes.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
+
+#define MHI_LOOPBACK_DEFAULT_TRE_SIZE	32
+#define MHI_LOOPBACK_DEFAULT_NUM_TRE	1
+#define MHI_LOOPBACK_TIMEOUT_MS		5000
+#define MHI_LOOPBACK_MAX_TRE_SIZE	(SZ_64K - 1)
+
+struct mhi_loopback {
+	struct mhi_device *mdev;
+	/* Serializes the sysfs attributes against a running test */
+	struct mutex lb_mutex;
+	struct completion comp;
+	/* Tracks outstanding DL+UL completions; comp fires when it hits zero */
+	atomic_t tre_pending;
+	u32 num_tre;
+	u32 tre_size;
+};
+
+static ssize_t tre_size_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct mhi_loopback *loopback = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%u\n", loopback->tre_size);
+}
+
+static ssize_t tre_size_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t count)
+{
+	struct mhi_loopback *loopback = dev_get_drvdata(dev);
+	u32 val;
+
+	if (kstrtou32(buf, 0, &val))
+		return -EINVAL;
+
+	if (val == 0 || val > MHI_LOOPBACK_MAX_TRE_SIZE)
+		return -EINVAL;
+
+	guard(mutex)(&loopback->lb_mutex);
+	loopback->tre_size = val;
+
+	return count;
+}
+static DEVICE_ATTR_RW(tre_size);
+
+static ssize_t max_tre_size_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%u\n", MHI_LOOPBACK_MAX_TRE_SIZE);
+}
+static DEVICE_ATTR_RO(max_tre_size);
+
+static ssize_t num_tre_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	struct mhi_loopback *loopback = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%u\n", loopback->num_tre);
+}
+
+static ssize_t num_tre_store(struct device *dev,
+			     struct device_attribute *attr,
+			     const char *buf, size_t count)
+{
+	struct mhi_loopback *loopback = dev_get_drvdata(dev);
+	u32 val;
+	int el_num;
+
+	if (kstrtou32(buf, 0, &val))
+		return -EINVAL;
+
+	if (val == 0)
+		return -EINVAL;
+
+	guard(mutex)(&loopback->lb_mutex);
+
+	el_num = min(mhi_get_free_desc_count(loopback->mdev, DMA_TO_DEVICE),
+		     mhi_get_free_desc_count(loopback->mdev, DMA_FROM_DEVICE));
+	if (val > el_num) {
+		dev_err(dev, "num_tre (%u) exceeds ring capacity (%d)\n", val, el_num);
+		return -EINVAL;
+	}
+
+	loopback->num_tre = val;
+
+	return count;
+}
+static DEVICE_ATTR_RW(num_tre);
+
+static ssize_t start_store(struct device *dev,
+			   struct device_attribute *attr,
+			   const char *buf, size_t count)
+{
+	struct mhi_loopback *loopback = dev_get_drvdata(dev);
+	u32 total_size, tre_count, tre_size;
+	int i, ret;
+
+	guard(mutex)(&loopback->lb_mutex);
+
+	tre_size = loopback->tre_size;
+	tre_count = loopback->num_tre;
+	total_size = size_mul(tre_count, tre_size);
+
+	if (total_size > KMALLOC_MAX_SIZE)
+		return -EINVAL;
+
+	if (tre_count > mhi_get_free_desc_count(loopback->mdev, DMA_TO_DEVICE) ||
+	    tre_count > mhi_get_free_desc_count(loopback->mdev, DMA_FROM_DEVICE)) {
+		dev_err(dev, "Not enough ring space for %u TREs\n", tre_count);
+		return -ENOSPC;
+	}
+
+	void *recv_buf __free(kfree) = kzalloc(total_size, GFP_KERNEL);
+	if (!recv_buf)
+		return -ENOMEM;
+
+	void *send_buf __free(kfree) = kzalloc(total_size, GFP_KERNEL);
+	if (!send_buf)
+		return -ENOMEM;
+
+	get_random_bytes(send_buf, total_size);
+
+	atomic_set(&loopback->tre_pending, tre_count);
+	reinit_completion(&loopback->comp);
+
+	for (i = 0; i < tre_count; i++) {
+		ret = mhi_queue_buf(loopback->mdev, DMA_FROM_DEVICE,
+				    recv_buf + (i * tre_size), tre_size, MHI_EOT);
+		if (ret) {
+			dev_err(dev, "Unable to queue read TRE %d: %d\n", i, ret);
+			if (atomic_sub_and_test(tre_count - i, &loopback->tre_pending))
+				complete(&loopback->comp);
+			return ret;
+		}
+	}
+
+	for (i = 0; i < tre_count - 1; i++) {
+		ret = mhi_queue_buf(loopback->mdev, DMA_TO_DEVICE,
+				    send_buf + (i * tre_size), tre_size, MHI_CHAIN);
+		if (ret) {
+			dev_err(dev, "Unable to queue send TRE %d: %d\n", i, ret);
+			return ret;
+		}
+	}
+
+	ret = mhi_queue_buf(loopback->mdev, DMA_TO_DEVICE,
+			    send_buf + (i * tre_size), tre_size, MHI_EOT);
+	if (ret) {
+		dev_err(dev, "Unable to queue final TRE: %d\n", ret);
+		return ret;
+	}
+
+	if (!wait_for_completion_timeout(&loopback->comp,
+					 msecs_to_jiffies(MHI_LOOPBACK_TIMEOUT_MS))) {
+		dev_err(dev, "Loopback test timed out\n");
+		/* Reset the channel to reclaim the TREs still pointing at the buffers */
+		mhi_unprepare_from_transfer(loopback->mdev);
+		ret = mhi_prepare_for_transfer(loopback->mdev);
+		if (ret)
+			dev_err(dev, "Failed to re-prepare channel for transfers: %d\n", ret);
+
+		return -ETIMEDOUT;
+	}
+
+	if (memcmp(send_buf, recv_buf, total_size)) {
+		dev_err(dev, "Loopback data mismatch\n");
+		return -EIO;
+	}
+
+	return count;
+}
+static DEVICE_ATTR_WO(start);
+
+static void mhi_loopback_dl_callback(struct mhi_device *mhi_dev,
+				     struct mhi_result *mhi_res)
+{
+	struct mhi_loopback *loopback = dev_get_drvdata(&mhi_dev->dev);
+
+	if (mhi_res->transaction_status && mhi_res->transaction_status != -ENOTCONN)
+		dev_err(&mhi_dev->dev, "DL callback error: status %d\n",
+			mhi_res->transaction_status);
+
+	if (atomic_dec_and_test(&loopback->tre_pending))
+		complete(&loopback->comp);
+}
+
+static void mhi_loopback_ul_callback(struct mhi_device *mhi_dev,
+				     struct mhi_result *mhi_res)
+{
+	if (mhi_res->transaction_status && mhi_res->transaction_status != -ENOTCONN)
+		dev_err(&mhi_dev->dev, "UL callback error: status %d\n",
+			mhi_res->transaction_status);
+}
+
+static struct attribute *mhi_loopback_attrs[] = {
+	&dev_attr_tre_size.attr,
+	&dev_attr_max_tre_size.attr,
+	&dev_attr_num_tre.attr,
+	&dev_attr_start.attr,
+	NULL
+};
+
+static const struct attribute_group mhi_loopback_group = {
+	.attrs = mhi_loopback_attrs,
+};
+
+static int mhi_loopback_probe(struct mhi_device *mhi_dev,
+			      const struct mhi_device_id *id)
+{
+	struct mhi_loopback *loopback;
+	int ret;
+
+	loopback = devm_kzalloc(&mhi_dev->dev, sizeof(*loopback), GFP_KERNEL);
+	if (!loopback)
+		return -ENOMEM;
+
+	loopback->mdev = mhi_dev;
+	loopback->tre_size = MHI_LOOPBACK_DEFAULT_TRE_SIZE;
+	loopback->num_tre = MHI_LOOPBACK_DEFAULT_NUM_TRE;
+
+	mutex_init(&loopback->lb_mutex);
+	init_completion(&loopback->comp);
+
+	dev_set_drvdata(&mhi_dev->dev, loopback);
+
+	ret = mhi_prepare_for_transfer(mhi_dev);
+	if (ret)
+		return dev_err_probe(&mhi_dev->dev, ret, "Failed to prepare for transfers\n");
+
+	ret = sysfs_create_group(&mhi_dev->dev.kobj, &mhi_loopback_group);
+	if (ret) {
+		dev_err(&mhi_dev->dev, "Failed to create sysfs attributes: %d\n", ret);
+		mhi_unprepare_from_transfer(mhi_dev);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void mhi_loopback_remove(struct mhi_device *mhi_dev)
+{
+	/* Blocks until any in-progress store() has returned */
+	sysfs_remove_group(&mhi_dev->dev.kobj, &mhi_loopback_group);
+	mhi_unprepare_from_transfer(mhi_dev);
+}
+
+static const struct mhi_device_id mhi_loopback_id_table[] = {
+	{ .chan = "LOOPBACK" },
+	{ }
+};
+MODULE_DEVICE_TABLE(mhi, mhi_loopback_id_table);
+
+static struct mhi_driver mhi_loopback_driver = {
+	.probe = mhi_loopback_probe,
+	.remove = mhi_loopback_remove,
+	.dl_xfer_cb = mhi_loopback_dl_callback,
+	.ul_xfer_cb = mhi_loopback_ul_callback,
+	.id_table = mhi_loopback_id_table,
+	.driver = {
+		.name = "mhi_loopback",
+	},
+};
+
+module_mhi_driver(mhi_loopback_driver);
+
+MODULE_AUTHOR("Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>");
+MODULE_AUTHOR("Sumit Kumar <sumit.kumar@oss.qualcomm.com>");
+MODULE_DESCRIPTION("MHI Host Loopback Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

