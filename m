Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6FA2EBBB9
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 13:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784899003; cv=none; b=IjTNAVocRGKDyBqblkSZPePH4LR7LQ0zfUwiqXOPPMYeQ99anG+czTCCQT43YPLOTMUHxHyZbigSUau0QOZRVqsSg5kapy0mRLeVDnBga93WUQWFn8v+GxwWzJjAUsa+cvM7sVi9OJPkN6Lo5X3i5tMrK8FH0UMsxkyrRzscB7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784899003; c=relaxed/simple;
	bh=/yj8bLKbPpZes7L89vCr9HdB3oJ01AECc11k9j6p5p0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Bpf+oDYAySEQmhGj6Db1rzlPhk9OwUAmVDLvNOkWhfpIddq0V1kL51bQbaRyaN7CXN9yJlMlT2pM419KGJyfQEwo9dVQtEokHAbE4VyCZmJNKKjiQiE+kNI2ExEB/UG1tGw9tEW6pStjUJ6cnKTwwuWUb3JDHu+BqCobJEaX29Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BSTTNFEb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cB6JZBHt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BSTTNFEb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cB6JZBHt"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OClh9Q3198523
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 13:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OWsy9ZZFAQt5AZSfvQGZt2
	cTwChZXHQpVHpQFqYJSoM=; b=BSTTNFEbpL+BALtW+FcMTYxpQv6ctNhDL3ehAa
	IVvWPTQQpVctoi7CGTYVWaVvMpQzSnJsqBukY0z4rY9pi83dBgkVXuDUH9NDnYBa
	9KJLVKF97XdBMj5XQ9RR3g4hPoN+uw6sd6IeB9fhEcJrfxRSXdJZhsUIE2NcOLp0
	94Jg8ShKLqzftivGVmWWYbE8f9k6zCHiawhimBrLnPSe4sXxd23Nccn2cjWRP7ds
	I7O827xRJru0jybWLSa0Q2jLcfyOaWuak0qAbvtngb7kgKWThvRT4gehPLkP9Zxg
	dYdOl+ut6+2pYgrAPolLSrsIN3E0taoSs8e+Clb7lkM8lbOQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fktahu3q6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 13:16:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc640dfde3so6370845ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 06:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784899000; x=1785503800; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OWsy9ZZFAQt5AZSfvQGZt2cTwChZXHQpVHpQFqYJSoM=;
        b=cB6JZBHt5Ba3mg06Nxhc1bHguhJ58jpykWxX5FrK6iVyc7Tv+/9LwP3sPWIHoThv9E
         GhUjvzaV/kRd2nqezw7gPfyVgRVRWH1xcHGExK6/XNdBjzEyemcN1zQu5eqWoH2Qe4SD
         PGqH0Siou1Y/FWmW0oWGOUyDNCWVnHmTazx1wSycYsj6XiniB6MUxZ78OHe832e1I3/u
         4EbpWRwbHhgM7P9CER01Hor++eM/5fgQ0Ut811ZXHAE8wxo3P4VAN3KdXXljqz065QO7
         rH/0bjM81sJnLOVxndW19SaV/Y64jCrw2HTaDn9tcvTQ21vQ/2mUoAaycBUmOuC7DLJB
         4e1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784899000; x=1785503800;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OWsy9ZZFAQt5AZSfvQGZt2cTwChZXHQpVHpQFqYJSoM=;
        b=C/7Hzqkhj3ACK98Q2kFBdGD5/f5JM6Cnfz1YOJmw6I6fc7/sam6k+DhjuHqDh2mzEI
         1FRipmWD7p5tqdTQFRRKqgS3qmg1Jv1DLb7UzGV3bE3MMrbXBPdD2WRk5hnUA81yrf/M
         mft8bVjha7yTLoVoTeJqQ3849aIay8xG05gXx5u5wVKoJojcvuhi/kxqMIgVUFlIomm9
         nLdDNlTiS9AGZLUfJsHXpEYL9X5AoVR90vjuC8X/rnC1gLQFZSzNEZoAvbFP4hyq62Gq
         Fq2GeTvCHLy2PihqUPQKN+UHiFyvb6o8ySg57DFePCOn//YjyEFHe1J39sFowyiRxMwZ
         weRQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp5oHF4H83psTVx4CPQkYKo025yUNlembDbEKnO2xOIDLfPv2ZuJtqFYK8rq4C7iNImfa9LLkMu/Ov8C7TS@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/C6IpuzwQFlytC9jPvEAsgoNLbNaxA7DWvovHUMZgYyyT6yGj
	OJ8EXirsK1PlPI3j1md18RYyTjw09nDsBmDDbX5Szgy7jDdp47OGjyc1JkEVxoh0kkxAHFxaqnD
	gq4IKVHjsFc/bAIegV5vaJ1zpBcVe7U1SUOxr7l/arSo6IbIZWHyF9mm2bXSI+sDSkVThDOHQkz
	TO
X-Gm-Gg: AR+sD12qMpHL3DhisP2hyaT78UaRP51B6Kdr8cu8BdKjy7PRDz8BqMcz7c90kHxeOJf
	Ns6+NW+kOz8zn7ucayFCp26nGcS35fKrjXscZ7TAJLzgxLhXZaJvLnOoQYCNnKaq2X21rpUBH09
	9HzCE8VvOJ8cmYpF1cplZQL3t2VljKvmqJBfkHzNjSO+BqMpIkRSABrGymx6FRBVswCZOVW3RqZ
	9A3Roan3Nj04Xn8RfHgt6YBUjLrMokDfWjfo36yYblkmuat0ANZu1zK91+krUnhzpDk6IjfhFwK
	uvZVBnNBs1gfc2/8xvKwLD/n/UNKbc7sTR/pU0dmyuiUcYHJXSEvuQFBhVBA+djzBJKG4FgjDhv
	uoakwrPOw8opSyNZWZgLdZVeO1VTYIOj6m2Ud
X-Received: by 2002:a17:902:d486:b0:2c9:e846:a57e with SMTP id d9443c01a7336-2cfa67039d2mr80763195ad.0.1784898999802;
        Fri, 24 Jul 2026 06:16:39 -0700 (PDT)
X-Received: by 2002:a17:902:d486:b0:2c9:e846:a57e with SMTP id d9443c01a7336-2cfa67039d2mr80762705ad.0.1784898999215;
        Fri, 24 Jul 2026 06:16:39 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd76cfsm52162965ad.20.2026.07.24.06.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 06:16:26 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 18:46:04 +0530
Subject: [PATCH v24] power: reset: reboot-mode: Remove devres based
 allocations
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-arm-psci-system_reset2-vendor-reboots-v24-1-ed5125785ef6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJNlY2oC/53U22rcMBAG4FcJvo6DNCN5Rr3qe5RSdBglhuw6t
 bZLQ9h3r7yUeKEVKLkxSKBvxuIfvQ1F1lnK8OXubVjlPJd5OdYFmPu7IT7546OMc6obAyiwipQ
 b/XoYX0qcx/JaTnL4sUqRE4xnOaZlHVcJy3Iqo5kiK2WMzzEP1XpZJc+/r4W+fa/rp7mclvX1W
 ves1bb9t4RWnSXqsVGNQmSQGDGZ+HUp5eHnL/8cl8PhoX62yp9SAyQMzBCE7b/q9gNnrW+bpm5
 eVz5lFAigGSO2eLjhQXfzUHmm4CNKNADS4vGW7+8eKz8FToCoLTtu8WbnWdtu3lQeKYHL1vnof
 Iu3O+8AunlbeYqCXjETZ93ip3deqw90P23JcewleQ8ozbunndfdE1WPVd5MotiG6E2MLZ53HgC
 7ed7uHrJ3QpPkdjDdLc/dvNuGNQRnJ2VRNZMD72/BpFCZXh62qY2ZEpoaTyRo8XrnTX/u4Tq1M
 TskIivUuhyAnbe6v/ttaoG9DUkUGW7yuPP0AR6vD6WxGK3hCP/L/eVy+QMG7W0oDQYAAA==
X-Change-ID: 20250709-arm-psci-system_reset2-vendor-reboots-46c80044afcf
To: Sebastian Reichel <sre@kernel.org>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Pavan Kumar Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784898981; l=4865;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=/yj8bLKbPpZes7L89vCr9HdB3oJ01AECc11k9j6p5p0=;
 b=VnGDA9/ouU3zsWzUnHx8R9UnQZfrozq3UVFd8Augs2YnFve7vaqEFSUrNzcENqOJlukQFyaWf
 snNykxhlqN+AtTSdVx2XH6p4y2UONSed6mGrAk/XORxrYaADupHuLby
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEyMCBTYWx0ZWRfX6Jdln99ocJYJ
 koxN0HhUnzcTmWv7Ui14LREbJqj7ljSp4chSy95/vy8dIq4KRPALNu5ZCMiDJBHij/8I0+2S9l9
 umIXxeHql+lG7OCApsxe7z6NHVAUX+g=
X-Authority-Analysis: v=2.4 cv=TvrWQjXh c=1 sm=1 tr=0 ts=6a6365b8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=QX4gbG5DAAAA:8 a=igCNvyY4kf761yXvtm8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=FO4_E8m0qiDe52t0p3_H:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: dTApuzZ0q75cs3aaNWQA4g8d1B8_2JYv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEyMCBTYWx0ZWRfX1k2QAcMSg5DG
 Afdw5z0gL5hNlwX4p0eXk1sy5CMyQclnx8YLCYLpRoY7W1GZGtlSK6MqoUZvb+NfDvbHbVMiBh8
 bsB0xoFkGzn2y9yHMGtHurTP9QETGIbVXANf1kJ+QUNbBsDpMZ+fXuDwaKJ54gCBf+E7xIwoc2p
 F4bx3vlUgTMo/oYsnIJfksVgnia/3Y0BHPdhjWO/1DO6LBP20gCTmws+c74Iw0FmVPmhxVLb1bf
 HKZnoTm42DOKJPP/3YhfWOHIyIB1D1nQw5v5bsy+Sh0qjUzBUdu5Zsde5viYYwsrEdk/nofz0ej
 AH/vufb4cTdJxGV0OxwFclISkyvtV/FiwTcAPJBo7tzw2NAORDFua0Xk9QlFOUHobG6XGblSu4I
 ny98H9Ewj2NZAEU5tWuTkd9JcZmQWQ+z57kWjE8cKo8Sck+Ve3KRkowEG3LPsaU/DxY/Lu2Xc13
 SdsBmWNKGdQhS6C7oLA==
X-Proofpoint-ORIG-GUID: dTApuzZ0q75cs3aaNWQA4g8d1B8_2JYv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240120

Devres APIs are intended for use in drivers, where the managed lifetime
of resources is tied directly to the driver attach/detach cycle.

To ensure correct lifetime handling, avoid using devres-based
allocations in the reboot-mode and explicitly handle allocation and
cleanup of resources.

Fixes: cfaf0a90789a ("power: reset: reboot-mode: Expose sysfs for registered reboot_modes")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202607191025.h6bQp891-lkp@intel.com/
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
This patch is split from the original series, "Implement PSCI reboot
mode driver for PSCI resets", and sent separately as it fixes a recent
issue introduced by "power: reset: reboot-mode: Expose sysfs for
registered reboot_modes" and is independently applicable to the
reboot-mode framework.
---
Changes in v24:
- Split from the original series and add a Fixes tag.
- Use kzalloc_obj. (By Pavan)
- Do not change dev_err to pr_err. (By Pavan)
- Convert dev_err to dev_dbg for missing magic-number log as it is not
  an error scenario.  
- Fix a pre-existing space issue.
- Link to v23: https://patch.msgid.link/20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com

To: Sebastian Reichel <sre@kernel.org>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Pavan Kumar Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: linux-pm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
---
 drivers/power/reset/reboot-mode.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index d20e44db0532..af00c00eceee 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -10,6 +10,7 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/property.h>
 #include <linux/reboot.h>
 #include <linux/reboot-mode.h>
 #include <linux/slab.h>
@@ -168,10 +169,11 @@ static int reboot_mode_create_device(struct reboot_mode_driver *reboot)
  */
 int reboot_mode_register(struct reboot_mode_driver *reboot)
 {
-	struct mode_info *info;
+	struct mode_info *info = NULL;
 	struct property *prop;
 	struct device_node *np = reboot->dev->of_node;
 	size_t len = strlen(PREFIX);
+	u32 magic;
 	int ret;
 
 	INIT_LIST_HEAD(&reboot->head);
@@ -180,22 +182,22 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 		if (strncmp(prop->name, PREFIX, len))
 			continue;
 
-		info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
+		if (device_property_read_u32(reboot->dev, prop->name, &magic)) {
+			dev_dbg(reboot->dev, "reboot mode %s without magic number\n",
+				prop->name);
+			continue;
+		}
+
+		info = kzalloc_obj(*info, GFP_KERNEL);
 		if (!info) {
 			ret = -ENOMEM;
 			goto error;
 		}
 
-		if (of_property_read_u32(np, prop->name, &info->magic)) {
-			dev_err(reboot->dev, "reboot mode %s without magic number\n",
-				info->mode);
-			devm_kfree(reboot->dev, info);
-			continue;
-		}
-
+		info->magic = magic;
 		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
 		if (!info->mode) {
-			ret =  -ENOMEM;
+			ret = -ENOMEM;
 			goto error;
 		} else if (info->mode[0] == '\0') {
 			kfree_const(info->mode);
@@ -206,6 +208,7 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 		}
 
 		list_add_tail(&info->list, &reboot->head);
+		info = NULL;
 	}
 
 	reboot->reboot_notifier.notifier_call = reboot_mode_notify;
@@ -218,6 +221,7 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	return 0;
 
 error:
+	kfree(info);
 	reboot_mode_unregister(reboot);
 	return ret;
 }
@@ -261,12 +265,16 @@ static inline void reboot_mode_unregister_device(struct reboot_mode_driver *rebo
 int reboot_mode_unregister(struct reboot_mode_driver *reboot)
 {
 	struct mode_info *info;
+	struct mode_info *next;
 
 	unregister_reboot_notifier(&reboot->reboot_notifier);
 	reboot_mode_unregister_device(reboot);
 
-	list_for_each_entry(info, &reboot->head, list)
+	list_for_each_entry_safe(info, next, &reboot->head, list) {
+		list_del(&info->list);
 		kfree_const(info->mode);
+		kfree(info);
+	}
 
 	return 0;
 }

---
base-commit: 9eebf259d5352b87080d67758f483583d9e763d7
change-id: 20250709-arm-psci-system_reset2-vendor-reboots-46c80044afcf

Best regards,
--  
Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

