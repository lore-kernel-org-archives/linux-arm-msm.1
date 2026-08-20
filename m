Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E493A7597
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 19:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787255339; cv=none; b=Zgmh8/RAjFLTriFdz7IwnmZvojTfm4tFJ6N8Zcpgyl8lRKY3cMFDpc9i4o7W/1hDN9+mgr/ThwHfvxF/MMB9g6ADn/PEmm/60+cFsVLGZB+T9VCSxlRCv0GzmBiNaPRc3EPCj/IGUp7R+HO/JfnhW0TOm3HBy+Rl9anfKLRZ8s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787255339; c=relaxed/simple;
	bh=u3LVJlrV2TA9ikLtD5YVW5Qnc251euZUSpcSxft7hu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Towtcps2vkz65Tya8IzdN7aGHFJdk5l3HZrlDsds0Tg7r1CyZuOd4Fe2Y3dQG+W5+0qDkB0xHminauWFZQFh4c5XAhCnu4zW/UxgH22Cy4jlhdoEm5MmhW9A8Ktl4fRuZxgoIUuww1VwLQ/SAllBEpRhbQvIV7C5Nf3lwROTRbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rw49asBN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WeZnxD3k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rw49asBN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WeZnxD3k"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KIJ459017127
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 19:48:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2UnZhL42BZO
	zUigVArKOkVoW3gNb0xtMC9LmMxlRmPE=; b=Rw49asBNDE8qcdtvR6pXpRZLrgh
	+q91xMEh/wfc38Rp2OMDkB8i9YUCHlI1DQc0VmH1xRIuYBjNSKcV/w8eZRZ+zsKK
	GON4SoEvUFETvRRK1XoSp+HNv80RLqAP+zbiC+slbm8TVWVApDpa1WOkMQ9fu2Ho
	Z3oG/wtLfumLhMMx/GL79kMk+gyWqRWsvq162m88r24BCSkP6mlBbo48otVzGebT
	j90BsJndgT/ZoOXZiPXi3wAq6ZCXrBvS1YOOy51udY91K/fMkq7ozwOA5naagTKu
	BmStAKVqekHzfTrsgjrGM87qsflAVhAqmRszx4vRPiDpDpwveThGDr0XYiQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5w49bbm4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 19:48:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930edb4362dso19161985a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 12:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787255337; x=1787860137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2UnZhL42BZOzUigVArKOkVoW3gNb0xtMC9LmMxlRmPE=;
        b=WeZnxD3kF+q6bzzYmALBnP9nrcWKTuzVlx2pZhYS5WhEgcbM0XJ3wv//oACcKmk0rL
         Q2JiiBfNQfvCAEEZDYd7zaYy6emC8Ig5bLBBVB1eMBPcesxe3laZ7SGYXIPtW9/r9u7r
         fIayNthcNSGUCNN2b9J5sIQznCXEPN4FrHGlq3BHsU++jXiij37B2LZZEW/wbKmTP7PQ
         SWwGnfyH+Lg8flNLmXskhNCw8cxY5XB3tub2n07tuxGd2/nhsUDCLbR5L5/aZyZkjW/Z
         ZBPebtrmfH1/mAH6GEwT/DfqTfrQ2yxxSiU2iVKnlFJ+/lgxM+imOIGwp5l+X7pZd0WO
         ytHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787255337; x=1787860137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2UnZhL42BZOzUigVArKOkVoW3gNb0xtMC9LmMxlRmPE=;
        b=rnPH9QF0AuA/dDACQbfrkFHQUu43EHLloF3fkyH7qpmPs8l8IGSm9geCHEtFk8zyg1
         STbpccpS67mHTdxcFMgD1cclr6QGglWDzZwX8RS7N4ru+J5wmXQVmjXZ6aFAezTauILZ
         0Re2Xn67LgSgl53xgmdiFKvJEwXBSO1ecX7QGkAzYl8E6Zo/WPQgwcDavHPxAytwm8Ow
         2eVakAJ5tNidi05W+1v/om7qAi/MRlDYMnaeZZTHbP7+dVYN8Exdv9qsjUVfu5mKtfS5
         Z8IAsSVqPhAUNFuiiX1WsofMx4Jg3rZ1R1Erx6MWIgAoDJvkIsruY4UF4ITmlpK2NSVI
         96Ew==
X-Forwarded-Encrypted: i=1; AHgh+RqRl23gIZ3CMZjXNYnDbfSRdm/hwFi5EgdAgsDpom84Qg6PQYStNL+10v32urkHX6fxU0r3lYZz7qes+Pkx@vger.kernel.org
X-Gm-Message-State: AOJu0YzL5kv/p35qZbpl+baiwfvYTLncXxNoigTs8aM4OeRZoM4XphRB
	sCTsb1KIncykf4m5KcqrMHvpPbkrYIC2XV2ZvmHlCXMDz+G9eFoqbYIZxUzsjBm/w4Q8owvIKed
	rUJiEYDgMjYmOLGedpBXG6ooCAeVxYOwZ0XCkCQ1B4pKN4c3vLjRioqs/42c4E6ysmEbn
X-Gm-Gg: AR+sD12A8BN629Ue6yZeV8ACN2yZR8JwSP/Yrwsp2z/kVhPLjlAG+2qyF+7LWPFsy8x
	/0EwJCgzGxTfV5VR16ekFMjJJeJ+CdhSmtQw9q4YMOST/xs5fndzvl3kCZeQkl4ZRpMyh1Bbrvi
	CpwioDMbTnt0/U0kTzTAqTUVrwQ1n4BezQoZL56R1NmJPFd1lDt3Jl4BFDvmH4sKk1tzxsSbBfq
	3zqZ3Rm4Qvs8Th828V5O0+JPzp06Ln6wzL4kA7oLmcS6MFXd2Vj07Ic12yzv5o1G6dziv7JppxL
	OJSayewGz1DcDxKOTm8bdDDX/u4VK84nFnOpTcTxVWMEJwMQCLPVGeF8xaFpGRWzfdH5zNCS3Ek
	DnLZXgjgNuU//
X-Received: by 2002:a05:620a:2982:b0:936:6c8a:f7aa with SMTP id af79cd13be357-9373942ee43mr53882485a.4.1787255336544;
        Thu, 20 Aug 2026 12:48:56 -0700 (PDT)
X-Received: by 2002:a05:620a:2982:b0:936:6c8a:f7aa with SMTP id af79cd13be357-9373942ee43mr53879585a.4.1787255336046;
        Thu, 20 Aug 2026 12:48:56 -0700 (PDT)
Received: from shalem ([2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2459198ec5sm113433266b.34.2026.08.20.12.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 12:48:55 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH v3 1/3] module: add SCMI device table alias support
Date: Thu, 20 Aug 2026 21:48:48 +0200
Message-ID: <20260820194850.459739-2-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260820194850.459739-1-johannes.goede@oss.qualcomm.com>
References: <20260820194850.459739-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE0OSBTYWx0ZWRfX2a6nmrABZPLC
 SHgqvFeWWJFzqtm6Yc/wPrw2Z3C5uIlT1d08CbgHhUHGXiLJVwowwnqKHZmk1IoDUEZ+zzu3ogx
 V69dTIZUXDwI6ug8t3pt26S4zZqGKGE=
X-Authority-Analysis: v=2.4 cv=YP+vDxGx c=1 sm=1 tr=0 ts=6a875a29 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8
 a=NbjprmzQH6tOvfj-_-IA:9 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: raUVGKYwHK0QRfDUbtcWUngdhxSZVvWH
X-Proofpoint-GUID: raUVGKYwHK0QRfDUbtcWUngdhxSZVvWH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE0OSBTYWx0ZWRfX7rqo9mwkDJzq
 Rh6d2bASCT9JLgCxcNRLNwwcNBA7NecJJfOgodR3Y1puP8Iw2DOazYm5c8Txw1dorD8ujTk/6xp
 CmSsEcRfSwdx/kE+EVx/sk8RMuTeDrlpT0OGyqbN2zUry+cEJ6ItTKlmxXx9A5BhwlZ8OQybULI
 Zvex4lT00zRAwRN7fRawZVVIabCuh17pYaI8AnZgowxHyULYMk20S5nwYtVYVpkaiY9S1ndd9cW
 Xvx7RmaweQ7JW8Qm6+7sGXrGPl+lVZfC4UVva6PyMjXsGYFroqd0c26ILszawfGmjHvor5+9UHV
 k3tfxgBsESpbfiV6wr6LCNJ+8JCqaD1p8cP17mwDMRgzssYdgIGVMFxpHa9JMq/owFZG6O48RNB
 pxR2X09nrFEMKMs90T1fVvDIKpB8XA9ruG3CyVWHpoJYpt5Rn2JZ4LAqcq5YOxKZJ2ZHAJmwx69
 UAYR+DzWJMmnBhCX0pg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_01,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200149

From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

SCMI client drivers already describe their bus match data with
MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to consume
SCMI device tables. As a result, SCMI modules do not get generated module
aliases from their id tables.

Move struct scmi_device_id to mod_devicetable.h so it has a fixed layout
visible to modpost, add the corresponding generated offsets and teach
file2alias to emit scmi:<protocol>:<name> aliases.

Use the same stable alias format for SCMI device uevents and sysfs
modaliases. The previous string included the instance-specific device
name, which is not useful for matching modules.

Assisted-by: Codex:GPT-5.5
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v3:
- Adjust for ad428f5811bd ("mod_devicetable.h: Split into per subsystem
  headers")
- Add '\n' to modalias_show() output, matching other subsystems' modalias
- Link to v2: https://lore.kernel.org/all/20260618-scmi-modalias-v2-1-8c7547c1be21@oss.qualcomm.com/

Changes in v2:
- Drop #include <linux/mod_devicetable.h> from scmi_protocol.h
- Link to v1: https://patch.msgid.link/20260616-scmi-modalias-v1-0-662b8dd52ab2@oss.qualcomm.com
---
 MAINTAINERS                       |  1 +
 drivers/firmware/arm_scmi/bus.c   | 21 ++++++++++-----------
 include/linux/device-id/scmi.h    | 19 +++++++++++++++++++
 include/linux/mod_devicetable.h   |  1 +
 include/linux/scmi_protocol.h     |  6 +-----
 scripts/mod/devicetable-offsets.c |  4 ++++
 scripts/mod/file2alias.c          | 11 +++++++++++
 7 files changed, 47 insertions(+), 16 deletions(-)
 create mode 100644 include/linux/device-id/scmi.h

diff --git a/MAINTAINERS b/MAINTAINERS
index fc6ca082106f..ee5beee606fc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26334,6 +26334,7 @@ F:	drivers/pmdomain/arm/
 F:	drivers/powercap/arm_scmi_powercap.c
 F:	drivers/regulator/scmi-regulator.c
 F:	drivers/reset/reset-scmi.c
+F:	include/linux/device-id/scmi.h
 F:	include/linux/sc[mp]i_protocol.h
 F:	include/trace/events/scmi.h
 F:	include/uapi/linux/virtio_scmi.h
diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 793be9eabaed..d12d5de15a1a 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -13,11 +13,12 @@
 #include <linux/of.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 #include <linux/device.h>
 
 #include "common.h"
 
-#define SCMI_UEVENT_MODALIAS_FMT	"%s:%02x:%s"
+#define SCMI_UEVENT_MODALIAS_FMT	SCMI_MODULE_PREFIX "%02x:%s"
 
 BLOCKING_NOTIFIER_HEAD(scmi_requested_devices_nh);
 EXPORT_SYMBOL_GPL(scmi_requested_devices_nh);
@@ -141,7 +142,7 @@ static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
 	int ret = 0;
 	const struct scmi_device_id *entry;
 
-	for (entry = id_table; entry->name && ret == 0; entry++)
+	for (entry = id_table; entry->name[0] && ret == 0; entry++)
 		ret = scmi_protocol_device_request(entry);
 
 	return ret;
@@ -197,18 +198,18 @@ scmi_protocol_table_unregister(const struct scmi_device_id *id_table)
 {
 	const struct scmi_device_id *entry;
 
-	for (entry = id_table; entry->name; entry++)
+	for (entry = id_table; entry->name[0]; entry++)
 		scmi_protocol_device_unrequest(entry);
 }
 
 static int scmi_dev_match_by_id_table(struct scmi_device *scmi_dev,
 				      const struct scmi_device_id *id_table)
 {
-	if (!id_table || !id_table->name)
+	if (!id_table || !id_table->name[0])
 		return 0;
 
 	/* Always skip transport devices from matching */
-	for (; id_table->protocol_id && id_table->name; id_table++)
+	for (; id_table->protocol_id && id_table->name[0]; id_table++)
 		if (id_table->protocol_id == scmi_dev->protocol_id &&
 		    strncmp(scmi_dev->name, "__scmi_transport_device", 23) &&
 		    !strcmp(id_table->name, scmi_dev->name))
@@ -245,7 +246,7 @@ static struct scmi_device *scmi_child_dev_find(struct device *parent,
 	struct device *dev;
 
 	id_table[0].protocol_id = prot_id;
-	id_table[0].name = name;
+	strscpy(id_table[0].name, name, sizeof(id_table[0].name));
 
 	dev = device_find_child(parent, &id_table, scmi_match_by_id_table);
 	if (!dev)
@@ -282,8 +283,7 @@ static int scmi_device_uevent(const struct device *dev, struct kobj_uevent_env *
 	const struct scmi_device *scmi_dev = to_scmi_dev(dev);
 
 	return add_uevent_var(env, "MODALIAS=" SCMI_UEVENT_MODALIAS_FMT,
-			      dev_name(&scmi_dev->dev), scmi_dev->protocol_id,
-			      scmi_dev->name);
+			      scmi_dev->protocol_id, scmi_dev->name);
 }
 
 static ssize_t modalias_show(struct device *dev,
@@ -291,9 +291,8 @@ static ssize_t modalias_show(struct device *dev,
 {
 	struct scmi_device *scmi_dev = to_scmi_dev(dev);
 
-	return sysfs_emit(buf, SCMI_UEVENT_MODALIAS_FMT,
-			  dev_name(&scmi_dev->dev), scmi_dev->protocol_id,
-			  scmi_dev->name);
+	return sysfs_emit(buf, SCMI_UEVENT_MODALIAS_FMT "\n",
+			  scmi_dev->protocol_id, scmi_dev->name);
 }
 static DEVICE_ATTR_RO(modalias);
 
diff --git a/include/linux/device-id/scmi.h b/include/linux/device-id/scmi.h
new file mode 100644
index 000000000000..4150481524d4
--- /dev/null
+++ b/include/linux/device-id/scmi.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef LINUX_DEVICE_ID_SCMI_H
+#define LINUX_DEVICE_ID_SCMI_H
+
+#ifdef __KERNEL__
+#include <linux/types.h>
+typedef unsigned long kernel_ulong_t;
+#endif
+
+#define SCMI_NAME_SIZE		32
+#define SCMI_MODULE_PREFIX	"scmi:"
+
+struct scmi_device_id {
+	__u8 protocol_id;
+	char name[SCMI_NAME_SIZE];
+	kernel_ulong_t driver_data;
+};
+
+#endif /* ifndef LINUX_DEVICE_ID_SCMI_H */
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index a397213bedac..d241421c36aa 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -49,6 +49,7 @@
 #include "device-id/pnp.h"
 #include "device-id/rio.h"
 #include "device-id/rpmsg.h"
+#include "device-id/scmi.h"
 #include "device-id/sdio.h"
 #include "device-id/sdw.h"
 #include "device-id/serio.h"
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 5ab73b1ab9aa..ba53302d95f5 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -9,6 +9,7 @@
 #define _LINUX_SCMI_PROTOCOL_H
 
 #include <linux/bitfield.h>
+#include <linux/device-id/scmi.h>
 #include <linux/device.h>
 #include <linux/notifier.h>
 #include <linux/types.h>
@@ -951,11 +952,6 @@ struct scmi_device {
 
 #define to_scmi_dev(d) container_of_const(d, struct scmi_device, dev)
 
-struct scmi_device_id {
-	u8 protocol_id;
-	const char *name;
-};
-
 struct scmi_driver {
 	const char *name;
 	int (*probe)(struct scmi_device *sdev);
diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
index b4178c42d08f..da5bd712c8da 100644
--- a/scripts/mod/devicetable-offsets.c
+++ b/scripts/mod/devicetable-offsets.c
@@ -144,6 +144,10 @@ int main(void)
 	DEVID(rpmsg_device_id);
 	DEVID_FIELD(rpmsg_device_id, name);
 
+	DEVID(scmi_device_id);
+	DEVID_FIELD(scmi_device_id, protocol_id);
+	DEVID_FIELD(scmi_device_id, name);
+
 	DEVID(i2c_device_id);
 	DEVID_FIELD(i2c_device_id, name);
 
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 8d36c74dec2d..a5283f4c8e6f 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -852,6 +852,16 @@ static void do_rpmsg_entry(struct module *mod, void *symval)
 	module_alias_printf(mod, false, RPMSG_DEVICE_MODALIAS_FMT, *name);
 }
 
+/* Looks like: scmi:NN:S */
+static void do_scmi_entry(struct module *mod, void *symval)
+{
+	DEF_FIELD(symval, scmi_device_id, protocol_id);
+	DEF_FIELD_ADDR(symval, scmi_device_id, name);
+
+	module_alias_printf(mod, false, SCMI_MODULE_PREFIX "%02x:%s",
+			    protocol_id, *name);
+}
+
 /* Looks like: i2c:S */
 static void do_i2c_entry(struct module *mod, void *symval)
 {
@@ -1491,6 +1501,7 @@ static const struct devtable devtable[] = {
 	{"virtio", SIZE_virtio_device_id, do_virtio_entry},
 	{"vmbus", SIZE_hv_vmbus_device_id, do_vmbus_entry},
 	{"rpmsg", SIZE_rpmsg_device_id, do_rpmsg_entry},
+	{"scmi", SIZE_scmi_device_id, do_scmi_entry},
 	{"i2c", SIZE_i2c_device_id, do_i2c_entry},
 	{"i3c", SIZE_i3c_device_id, do_i3c_entry},
 	{"slim", SIZE_slim_device_id, do_slim_entry},
-- 
2.55.0

