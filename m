Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DD640EBA9
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787571361; cv=none; b=h+TwXLBCezRJ2iS6pn7iCDWJ3wziPUb6KWD6Ot2bbLtOPQ5OXsKaaNnVm8mXWFqp3D+7MrZzoAbw4nYz6OdK+M5T0612DFWiybuud361w8FTGwgc86ZrZ4acS6EA5kFJRLQ0NzuYQgtpsU7EVONICODuci9Ue+05qAF8GKnl658=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787571361; c=relaxed/simple;
	bh=Tbm7Jcdw6SCKesPf2hUXQ3fR/zuidGrGn4keKWTT6HE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LuF6V4MpiTEy6g4qNKSCfYUoRd/L6aIPqZVGIu0J9t5N7eje0zotAs0MOv0n9ZoqY2jHzlyeymF8iCVv6OR24bVg6X+EtlcjecDsZ/2vE+YBKVPUeWF++PUyToCOh6v0Avm8qNssEYoAbcHlqPqmfMZyCBAwfhURgvhYMy0s5bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VJ340Hdl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VJ340Hdl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787571358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XrYMyr29uu8WUOWFFdh9Kxfrbi8KOJEAmh71oMXMNUk=;
	b=VJ340HdlEMhMXLe4iY0H3jg9edMjGY2hjpHrZTGamfJjENUfe9UdSqiAFgwAdEp54lROEl
	GcR5LUvy6IGHlZW85vKA0e7f8RTkzbqlAqGUc7rJu5Oh2fQ7m5zSWd4iNQ8U8y1UyI2IpN
	PSjsif69I7ZEhfUN+tMTrH2vHwmhWMw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-55-N60LrwvRN2eDOg2JJqfckQ-1; Mon,
 24 Aug 2026 07:35:57 -0400
X-MC-Unique: N60LrwvRN2eDOg2JJqfckQ-1
X-Mimecast-MFC-AGG-ID: N60LrwvRN2eDOg2JJqfckQ_1787571356
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BA089195F16B;
	Mon, 24 Aug 2026 11:35:55 +0000 (UTC)
Received: from [192.168.1.153] (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E02E918005B0;
	Mon, 24 Aug 2026 11:35:52 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 24 Aug 2026 13:35:39 +0200
Subject: [PATCH 1/2] firmware: qcom: scm: Introduce new locking mechanism
 for SCM driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-port-scm-patches-v1-1-1dfd69374402@redhat.com>
References: <20260824-port-scm-patches-v1-0-1dfd69374402@redhat.com>
In-Reply-To: <20260824-port-scm-patches-v1-0-1dfd69374402@redhat.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Albert Esteve <aesteve@redhat.com>, Ninad Naik <quic_ninanaik@quicinc.com>, 
 Murali Nalajala <quic_mnalajal@quicinc.com>, 
 Venkatakrishnaiah Pari <quic_vpari@quicinc.com>, 
 Jian Shu <quic_jianshu@quicinc.com>, Guru Das Srinagesh <linux@gurudas.dev>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787571348; l=4334;
 i=aesteve@redhat.com; s=20260303; h=from:subject:message-id;
 bh=oCcwlSiYdkbBKpMDoescR9pyYDfbnCJRtMENlMwNhjg=;
 b=LbLIiUJE1sDJib9MUSBGEiPeSQf5bkVPE3ZnXQ5PDwBzxssecpioeJ24DR0k4XPOA8lUPa9+L
 dQ6RRCH0okuAq9Ti+wVr97UrYNcsFsNpMn6RmeE8ePaVfNtUq8OvoAb
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=YSFz6sOHd2L45+Fr8DIvHTi6lSIjhLZ5T+rkxspJt1s=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

From: Ninad Naik <quic_ninanaik@quicinc.com>

With the existing global mutex lock, there is a possibility that it
could resulty into a deadlock when SMCInvoke and smc call go to
firmware in the same order and both wait on same WAITQ in firmware.

Replace the global mutex with a counting semaphore.

Signed-off-by: Murali Nalajala <quic_mnalajal@quicinc.com>
Co-developed-by: Guru Das Srinagesh <quic_gurus@quicinc.com>
Signed-off-by: Guru Das Srinagesh <quic_gurus@quicinc.com>
Signed-off-by: Venkatakrishnaiah Pari <quic_vpari@quicinc.com>
Signed-off-by: Jian Shu <quic_jianshu@quicinc.com>
Signed-off-by: Ninad Naik <quic_ninanaik@quicinc.com>
Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 drivers/firmware/qcom/qcom_scm-legacy.c | 8 ++------
 drivers/firmware/qcom/qcom_scm-smc.c    | 7 ++-----
 drivers/firmware/qcom/qcom_scm.c        | 4 ++++
 drivers/firmware/qcom/qcom_scm.h        | 3 +++
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm-legacy.c b/drivers/firmware/qcom/qcom_scm-legacy.c
index 029e6d117cb8d..6afcbe6f7e5ed 100644
--- a/drivers/firmware/qcom/qcom_scm-legacy.c
+++ b/drivers/firmware/qcom/qcom_scm-legacy.c
@@ -6,7 +6,6 @@
 #include <linux/slab.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/mutex.h>
 #include <linux/errno.h>
 #include <linux/err.h>
 #include <linux/firmware/qcom/qcom_scm.h>
@@ -15,9 +14,6 @@
 
 #include "qcom_scm.h"
 
-static DEFINE_MUTEX(qcom_scm_lock);
-
-
 /**
  * struct arm_smccc_args
  * @args:	The array of values used in registers in smc instruction
@@ -173,11 +169,11 @@ int scm_legacy_call(struct device *dev, const struct qcom_scm_desc *desc,
 	smc.args[1] = (unsigned long)&context_id;
 	smc.args[2] = cmd_phys;
 
-	mutex_lock(&qcom_scm_lock);
+	down(&qcom_scm_sem_lock);
 	__scm_legacy_do(&smc, &smc_res);
 	if (smc_res.a0)
 		ret = qcom_scm_remap_error(smc_res.a0);
-	mutex_unlock(&qcom_scm_lock);
+	up(&qcom_scm_sem_lock);
 	if (ret)
 		goto out;
 
diff --git a/drivers/firmware/qcom/qcom_scm-smc.c b/drivers/firmware/qcom/qcom_scm-smc.c
index 127365ab11fc2..1b51e0fb82924 100644
--- a/drivers/firmware/qcom/qcom_scm-smc.c
+++ b/drivers/firmware/qcom/qcom_scm-smc.c
@@ -6,7 +6,6 @@
 #include <linux/io.h>
 #include <linux/errno.h>
 #include <linux/delay.h>
-#include <linux/mutex.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/firmware/qcom/qcom_scm.h>
@@ -27,8 +26,6 @@ struct arm_smccc_args {
 #define CREATE_TRACE_POINTS
 #include "qcom_scm_trace.h"
 
-static DEFINE_MUTEX(qcom_scm_lock);
-
 #define QCOM_SCM_EBUSY_WAIT_MS 30
 #define QCOM_SCM_EBUSY_MAX_RETRY 20
 
@@ -135,11 +132,11 @@ static int __scm_smc_do(struct device *dev, struct arm_smccc_args *smc,
 	}
 
 	do {
-		mutex_lock(&qcom_scm_lock);
+		down(&qcom_scm_sem_lock);
 
 		ret = __scm_smc_do_quirk_handle_waitq(dev, smc, res);
 
-		mutex_unlock(&qcom_scm_lock);
+		up(&qcom_scm_sem_lock);
 
 		if (ret)
 			return ret;
diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 3eaa4c9ccf3cc..7a042273d6d5b 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -78,6 +78,8 @@ struct qcom_scm_mem_map_info {
 	__le64 mem_size;
 };
 
+DEFINE_SEMAPHORE(qcom_scm_sem_lock, 1);
+
 /**
  * struct qcom_scm_qseecom_resp - QSEECOM SCM call response.
  * @result:    Result or status of the SCM call. See &enum qcom_scm_qseecom_result.
@@ -2893,6 +2895,8 @@ static int qcom_scm_probe(struct platform_device *pdev)
 					     "Failed to request qcom-scm irq\n");
 	}
 
+	sema_init(&qcom_scm_sem_lock, scm->wq_cnt);
+
 	/*
 	 * Paired with smp_load_acquire() in qcom_scm_is_available().
 	 *
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index cf90a565fdfbd..06fdc5e56bea4 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -4,6 +4,8 @@
 #ifndef __QCOM_SCM_INT_H
 #define __QCOM_SCM_INT_H
 
+#include <linux/semaphore.h>
+
 struct device;
 struct qcom_tzmem_pool;
 
@@ -15,6 +17,7 @@ enum qcom_scm_convention {
 };
 
 extern enum qcom_scm_convention qcom_scm_convention;
+extern struct semaphore qcom_scm_sem_lock;
 
 #define MAX_QCOM_SCM_ARGS 10
 #define MAX_QCOM_SCM_RETS 3

-- 
2.55.0

