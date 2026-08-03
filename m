Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9579370AE5
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 09:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785750359; cv=none; b=Lvp64AaScvRRvZ2b4eI4t4YZI04hNfE02ZN9Fs0ml+ustREgVKaz9wQGQgCYQDJ9MABC+G3UIIgeElttZd1/koOXlAQFMJP4+YPy6UCUuDbyTakZnPOnBIe06InpxlMizLJhk3EgR00/O44fujmiog0jYHG9iwo7NQhaPey5cDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785750359; c=relaxed/simple;
	bh=YF09NFBv8XV2mwwiWYdQirwqkhH8XmGEPACV2jstcps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qtYF//sNlVA76Dh2t13A6eD5XigGhag8w+0Xiy8OJmfr2s+zbJ9ltbEjwpqZ6BD8JCf6owemf2mWTrrqlDan/smlURTjkvULwQ22i59Nc5543K4l89ovbv38ajCFlvJP6w0Mya9UDNmKaq5boFTxM3/gSIj8M6xUtGaiw0OZsiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fgzCke40; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P429LUHk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fgzCke40";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P429LUHk"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736T7qY4014979
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 09:45:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BMf292AZeOlCNbfbdHJJYz8+230HZxidGqGvw+WCW6M=; b=fgzCke40gnRS4arn
	f9EwwqN6SB3k1PoNe0aMjz9vMUA0BE24rlR6kj6GGgmT2Wpf8Cyz4zz1fWdxXsML
	zPolrcIt3Y2deLVuUlcokcNJDMN24RmuVBSh+UnWXQH2KbNw6+YQ542FcJNDdXP8
	odgTF2e5YSA/5jo2KCZTIIQEyXo14eJG65UbRE1uIhNfwULznEpv88JBwCo5W+2C
	i2M+0ELnZ8yLr4dGDL6Ke2wI0JSiD7JwV/O35FPPxJtx5mO1boNy5bwi31jqCLG5
	UK9lVtVcSJizltAXIpGCbNoFF25agggUKY4NB/Mk0r3Nuu39FQscxEqY5/M4lS9h
	9MJGKA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrt8v7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 09:45:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e667368f0so5903395a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 02:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785750355; x=1786355155; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BMf292AZeOlCNbfbdHJJYz8+230HZxidGqGvw+WCW6M=;
        b=P429LUHkPRATpVUAFuB1bYSJTgMBT85m//dJPhZlokOnvNanF0g+G/Cxw+ruNm71N6
         uBqc6Xd7062UcqLDVfSRQkbPwQbWLxGsx/6dLWd+nYZd+EjPV1IF1E2acA8A+wXmflax
         cfnctayW6lJYwyynwKFn/8pA8ZjPseCW+xNlIN/rupq7CgA4eM5+U+zUb9LBiHiyHmHf
         /Aq/BiulHWKM3vrlOIZ3L5Ap+5lV8WBIigVp5mK+NFzlZhOBIFqOisGTMXbHOj+G9ts3
         UgrCgP6fJxw4vD8grVLV0frF5uitfV6opBl5ckifQYLJIgdoaROF9UP+ny6TwVPzQ8r8
         ta2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785750355; x=1786355155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BMf292AZeOlCNbfbdHJJYz8+230HZxidGqGvw+WCW6M=;
        b=X8a5Uqt0LVCavBAk7Q8ISiQLaAjxFgQM0NU/kqeuBI7WC11EhMZ/2kw3H7Gi3nngLz
         ptRbanqWZUvVeHLHMJ7ojIHkDPWqfQpV0jyJdWW/bBb4lMzqj0sQ6U3b45Z6FKD9WzZR
         2sC8cRd6CpS6216eiAQT2uDrJKlXtic21EsgCUE9aUaoe1gz6ihUYqc2/ydi6fWMnGxE
         C3LCuFVWVnN7IrqY8X6EpZnQExzJ2J05kRr/F7Yi5NK2/BNgUbPgrIAuJp1ZjnJIlGwF
         5JyTnmCnr40K0zK4ovxMlvs5+dBRIUHmeAMbQqZAcvsKwv0udlKYvjbLqjGgBaGJN++U
         VstQ==
X-Forwarded-Encrypted: i=1; AHgh+RqTwgNvJoh4W37yb19NQ8CM/Y1gzh5qBJAwU6OlUadRiv6CTIFTbvvtDYW0ASyaYctXywVq7EeI3o0HHqfH@vger.kernel.org
X-Gm-Message-State: AOJu0YyOe2X3oN+gD7Rrwy5o6173jetDY3vMwK+zP8Ya+Z30hS3ZB8YN
	WgAd/TBaQIFUZN/F3bWv0zjr6sQOUkm22eSyT2zRzdcpKraYQjXgQLwgCZMpe/j8XpWrKSJ4ZX8
	rHLVuktpuaGpS/Ms+zazpmFQKqS+sC+bA3Fe0iSEvEsLJiqRf9RmSZvRsTp479brWzv00
X-Gm-Gg: AR+sD11jB6r2RCwIWai3iyXyVVMuo8Nu8lzqDXA3lLFq1Cl2uOJ0N8IvFRjwJEPYGD2
	W2anGsSmt43nnCCSZsrqd9AEtchN7VkISLQxHHXSnhZTKxIrIOzzztd9qrs4Y5+YaG2HuwompWk
	V5reCYxHaFGv187B7RWMxWbd+qob1I9ANzYYY6yYH4RdTHHtjNjvQOX15aOs5RThDBiyBT2cc3m
	pxg0gjS6VOY1Atut5+ppxD9tJfm+ZwJTn47g7YXkJkyJgUS/qJj/xgH6LJxcUwJgc22LKpY4MkX
	UIfHHXDf9A+ABLrwbdFkkBGIXIe64jWuSdJPXdkTEi696BLTVjMS27FnUseptyBRrz72OwCshE/
	hEfI/I8l/3zMBmAW2gH56xgrmUYE5i9sqwEDB
X-Received: by 2002:a17:90b:2750:b0:38e:2c8f:a01a with SMTP id 98e67ed59e1d1-38fbc42c3a1mr7726893a91.11.1785750355016;
        Mon, 03 Aug 2026 02:45:55 -0700 (PDT)
X-Received: by 2002:a17:90b:2750:b0:38e:2c8f:a01a with SMTP id 98e67ed59e1d1-38fbc42c3a1mr7726841a91.11.1785750354407;
        Mon, 03 Aug 2026 02:45:54 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2be6c8csm3660671a91.13.2026.08.03.02.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:45:54 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 15:13:38 +0530
Subject: [PATCH v24 07/12] mfd: core: Add firmware-node support to MFD
 cells
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-arm-psci-system_reset2-vendor-reboots-v24-7-889281373870@oss.qualcomm.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
In-Reply-To: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785750274; l=7933;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=YF09NFBv8XV2mwwiWYdQirwqkhH8XmGEPACV2jstcps=;
 b=iWxDeilK2zVkbE2E9xjCYxx29tooW1BOq49KVaULUzqDdvX/jStMSvMhIwd2nOaQew8OoeMcI
 lKpd/Cq9ECPCTsZ1UmShciKwCIG6nToGM9niWP3D+6sLmE/kCk2I2ku
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4NiBTYWx0ZWRfXzr/F+TPl2/cm
 WDlb1pLxsJC5ZU/hqFoX5g/iZL0wEmzSG57u4hewLILGrAC1MNcHdyDyvHTc6y1uxZmgMeizRvQ
 kK+Qyc2wEGlXkFmibIOdO5LtoBwGna6oGSmTIMV0Ww0KQIDiomO8XrPbiZ0H6KDrMFeb9iK30mn
 DhpiETkPcoiEEQhDWAnIgn0TbXiNm3DwJtKKXRsL5suPHY6vBu7TjA/ESnhyVqhNjSaLyN7mHTv
 9FixufpdFJw9NPMocLO/cNyt4zKBLaN1W9rrN3TpS8j1db2rvhubsad1Xu7Avv5F+LokIOBswsK
 i1UraFu8soBeSu10wakwQWiWQPdeGkH331CXnaqlkCCBfYnLTtOrVx0X0/QKl79lFYUlcjqEVYl
 eZMTOb6u6B5NLlLxlemRlZOnK0YhdIG2PLh0SxLOqIFA76Vo6sW3UwjyOwfeFZPkBrxJuVhGjGk
 C3PzS2Jz8uUYXTh+Lyg==
X-Proofpoint-GUID: bo5txKGyFYRogdWUDxc0JYpwL3Io_2sy
X-Proofpoint-ORIG-GUID: bo5txKGyFYRogdWUDxc0JYpwL3Io_2sy
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4NiBTYWx0ZWRfX0wKAmngtmoJD
 qBEnmVOvXVvOvZkBQHLbFI8ieBbIIMCDsCnTUFjF8C+qS4DWhCTF/Co8oXMc63nfyWMOf/d+CzH
 94GwAIk+qgEpzXq3Rqc3vsAx2UTQncE=
X-Authority-Analysis: v=2.4 cv=Ft81OWrq c=1 sm=1 tr=0 ts=6a706354 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=2Layw8R8_bQqnRkAqW4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030086

MFD core has no way to register a child device using an explicit firmware
node. This prevents drivers from registering child nodes when those nodes
do not define a compatible string. One such example is the PSCI
"reboot-mode" node, which omits a compatible string as it describes
boot-states provided by the underlying firmware.

Extend struct mfd_cell with a named firmware-node field to identify a
child node under the MFD parent. The node is added to the MFD child
device during registration when none is assigned by device tree, ACPI,
or software matching.

Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/mfd/mfd-core.c   | 151 +++++++++++++++++++++++++++++++++++++++++------
 include/linux/mfd/core.h |  10 ++++
 2 files changed, 142 insertions(+), 19 deletions(-)

diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
index 7aa32b90cf1e..79b400535138 100644
--- a/drivers/mfd/mfd-core.c
+++ b/drivers/mfd/mfd-core.c
@@ -10,6 +10,7 @@
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
 #include <linux/acpi.h>
+#include <linux/fwnode.h>
 #include <linux/list.h>
 #include <linux/property.h>
 #include <linux/mfd/core.h>
@@ -22,6 +23,7 @@
 #include <linux/regulator/consumer.h>
 
 static LIST_HEAD(mfd_of_node_list);
+static LIST_HEAD(mfd_named_fwnode_list);
 static DEFINE_MUTEX(mfd_of_node_mutex);
 
 struct mfd_of_node_entry {
@@ -30,10 +32,91 @@ struct mfd_of_node_entry {
 	struct device_node *np;
 };
 
+struct mfd_named_fwnode_entry {
+	struct list_head list;
+	struct device *dev;
+	struct fwnode_handle *fwnode;
+};
+
 static const struct device_type mfd_dev_type = {
 	.name	= "mfd_device",
 };
 
+static int mfd_claim_named_fwnode(struct platform_device *pdev,
+				  struct fwnode_handle *fwnode)
+{
+	struct mfd_named_fwnode_entry *entry, *iter;
+
+	entry = kzalloc_obj(*entry, GFP_KERNEL);
+	if (!entry)
+		return -ENOMEM;
+
+	entry->dev = &pdev->dev;
+	entry->fwnode = fwnode_handle_get(fwnode);
+
+	scoped_guard(mutex, &mfd_of_node_mutex) {
+		list_for_each_entry(iter, &mfd_named_fwnode_list, list)
+			if (iter->fwnode == fwnode) {
+				fwnode_handle_put(entry->fwnode);
+				kfree(entry);
+				return -EAGAIN;
+			}
+
+		list_add_tail(&entry->list, &mfd_named_fwnode_list);
+	}
+
+	return 0;
+}
+
+/*
+ * Temporary MFD-local cleanup for named non-OF child fwnodes.
+ * Remove/rework this when platform core starts owning and dropping
+ * dev->fwnode references for these devices.
+ */
+static void mfd_release_named_fwnode(struct platform_device *pdev)
+{
+	struct mfd_named_fwnode_entry *entry, *tmp;
+
+	scoped_guard(mutex, &mfd_of_node_mutex) {
+		list_for_each_entry_safe(entry, tmp, &mfd_named_fwnode_list, list)
+			if (entry->dev == &pdev->dev) {
+				if (dev_fwnode(&pdev->dev) == entry->fwnode)
+					device_set_node(&pdev->dev, NULL);
+				fwnode_handle_put(entry->fwnode);
+				list_del(&entry->list);
+				kfree(entry);
+			}
+	}
+}
+
+static int mfd_claim_of_node_to_dev(struct platform_device *pdev,
+				    struct device_node *np)
+{
+	struct mfd_of_node_entry *of_entry, *iter;
+
+	of_entry = kzalloc_obj(*of_entry, GFP_KERNEL);
+	if (!of_entry)
+		return -ENOMEM;
+
+	of_entry->dev = &pdev->dev;
+	of_entry->np = of_node_get(np);
+
+	/* Skip if OF node has previously been allocated to a device */
+	scoped_guard(mutex, &mfd_of_node_mutex) {
+		list_for_each_entry(iter, &mfd_of_node_list, list)
+			if (iter->np == np) {
+				of_node_put(of_entry->np);
+				kfree(of_entry);
+				return -EAGAIN;
+			}
+
+		list_add_tail(&of_entry->list, &mfd_of_node_list);
+	}
+
+	device_set_node(&pdev->dev, of_fwnode_handle(np));
+	return 0;
+}
+
 #if IS_ENABLED(CONFIG_ACPI)
 struct match_ids_walk_data {
 	struct acpi_device_id *ids;
@@ -111,19 +194,11 @@ static int mfd_match_of_node_to_dev(struct platform_device *pdev,
 				    struct device_node *np,
 				    const struct mfd_cell *cell)
 {
-	struct mfd_of_node_entry *of_entry;
 	u64 of_node_addr;
 
-	/* Skip if OF node has previously been allocated to a device */
-	scoped_guard(mutex, &mfd_of_node_mutex) {
-		list_for_each_entry(of_entry, &mfd_of_node_list, list)
-			if (of_entry->np == np)
-				return -EAGAIN;
-	}
-
 	if (!cell->use_of_reg)
 		/* No of_reg defined - allocate first free compatible match */
-		goto allocate_of_node;
+		return mfd_claim_of_node_to_dev(pdev, np);
 
 	/* We only care about each node's first defined address */
 	if (of_property_read_reg(np, 0, &of_node_addr, NULL))
@@ -134,18 +209,48 @@ static int mfd_match_of_node_to_dev(struct platform_device *pdev,
 		/* No match */
 		return -EAGAIN;
 
-allocate_of_node:
-	of_entry = kzalloc(sizeof(*of_entry), GFP_KERNEL);
-	if (!of_entry)
-		return -ENOMEM;
+	return mfd_claim_of_node_to_dev(pdev, np);
+}
 
-	of_entry->dev = &pdev->dev;
-	of_entry->np = of_node_get(np);
-	scoped_guard(mutex, &mfd_of_node_mutex)
-		list_add_tail(&of_entry->list, &mfd_of_node_list);
+static int mfd_attach_named_fwnode(struct device *parent,
+				   struct platform_device *pdev,
+				   const struct mfd_cell *cell)
+{
+	struct fwnode_handle *fwnode;
+	struct device_node *named_np;
+	int ret = 0;
 
-	device_set_node(&pdev->dev, of_fwnode_handle(np));
-	return 0;
+	/* named_fwnode is a fallback only when no OF/ACPI match and no swnode */
+	if (dev_fwnode(&pdev->dev) || cell->swnode || !cell->named_fwnode)
+		return 0;
+
+	fwnode = device_get_named_child_node(parent, cell->named_fwnode);
+	if (!fwnode)
+		return 0;
+
+	if (!fwnode_device_is_available(fwnode))
+		goto out_put;
+
+	named_np = to_of_node(fwnode);
+	if (named_np)
+		ret = mfd_claim_of_node_to_dev(pdev, named_np);
+	else
+		ret = mfd_claim_named_fwnode(pdev, fwnode);
+
+	if (ret == -EAGAIN) {
+		ret = 0;
+		goto out_put;
+	}
+
+	if (ret)
+		goto out_put;
+
+	if (!named_np)
+		device_set_node(&pdev->dev, fwnode);
+
+out_put:
+	fwnode_handle_put(fwnode);
+	return ret;
 }
 
 static int mfd_add_device(struct device *parent, int id,
@@ -224,6 +329,10 @@ static int mfd_add_device(struct device *parent, int id,
 
 	mfd_acpi_add_device(cell, pdev);
 
+	ret = mfd_attach_named_fwnode(parent, pdev, cell);
+	if (ret)
+		goto fail_alias;
+
 	if (cell->pdata_size) {
 		ret = platform_device_add_data(pdev,
 					cell->platform_data, cell->pdata_size);
@@ -295,6 +404,7 @@ static int mfd_add_device(struct device *parent, int id,
 	if (cell->swnode)
 		device_remove_software_node(&pdev->dev);
 fail_of_entry:
+	mfd_release_named_fwnode(pdev);
 	scoped_guard(mutex, &mfd_of_node_mutex) {
 		list_for_each_entry_safe(of_entry, tmp, &mfd_of_node_list, list)
 			if (of_entry->dev == &pdev->dev) {
@@ -382,7 +492,10 @@ static int mfd_remove_devices_fn(struct device *dev, void *data)
 	regulator_bulk_unregister_supply_alias(dev, cell->parent_supplies,
 					       cell->num_parent_supplies);
 
+	get_device(&pdev->dev);
 	platform_device_unregister(pdev);
+	mfd_release_named_fwnode(pdev);
+	put_device(&pdev->dev);
 	return 0;
 }
 
diff --git a/include/linux/mfd/core.h b/include/linux/mfd/core.h
index faeea7abd688..8daa83dd31ea 100644
--- a/include/linux/mfd/core.h
+++ b/include/linux/mfd/core.h
@@ -80,6 +80,16 @@ struct mfd_cell {
 
 	/* Software node for the device. */
 	const struct software_node *swnode;
+	/*
+	 * Name of a child firmware node under the MFD parent device.
+	 *
+	 * Used only as a fallback when no firmware node is assigned to MFD
+	 * child and no software node is provided.
+	 *
+	 * For Device Tree parents, lookup is by base node name only
+	 * (the part before '@'). Unit-addresses are not matched.
+	 */
+	const char *named_fwnode;
 
 	/*
 	 * Device Tree compatible string

-- 
2.34.1

