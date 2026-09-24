Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6532AD2E
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 13:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790255471; cv=none; b=QjOLuBE/0g8PL55/t6abqbfCK3DuDMAJ1ZunvrRREnEAc1FICwLRHCweiuYqSoqqNzaNVYR4WD0I735qSGza0V3KgDPOFWg3mkiw5mC8nxFmoCIKzphgcYO6i8zDeO0O1NhPWq6EnY/VK7uYIyXTQJVa+CBhvJhEMpeiOYNu8og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790255471; c=relaxed/simple;
	bh=kHAokS9fDuLvwu1+K2sAsR4xaoLQ3P90JOQdGxXwI3Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RYsOM9bNz7+Tq4IU2bofXSaiC7SBuf41HkyjItegSAwMsvDTCgs1p50xOuRGxM9UyTgMHXIkV0YosI1BvoEjOdfYVOt/D/8d6+hwWoWbvuEOORiziqiDz/qFQ/sn7+5tby81hS8jgmeiru3VVcuPPp208HSDjg0+D1/sTjfUqgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TL6XKPfJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TL6XKPfJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790255468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BKSceu/74WoCFK22feNIfxF464NqVJJHCaTrECoXAd4=;
	b=TL6XKPfJbPbtD1MYmNxB46+AH8nPPqp6IiJ6flAh+/A1ignM/GcA56rbmdELWZgS3Q9pGn
	io7tjdTIdScZ3Kal5WcV/ZXZtATR30dgqBthOtMbIDakc4XHfMSRXEY4mrUhzxyiBLlXeq
	2eiCMIs/gxWMnOZI+ASY9l0qgYPsmKA=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-467-VFZfnszIOYeUOEML_6zYtQ-1; Thu,
 24 Sep 2026 09:11:06 -0400
X-MC-Unique: VFZfnszIOYeUOEML_6zYtQ-1
X-Mimecast-MFC-AGG-ID: VFZfnszIOYeUOEML_6zYtQ_1790255465
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3B88618512C2;
	Thu, 24 Sep 2026 13:11:05 +0000 (UTC)
Received: from aesteve-thinkpadp1gen8.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 435BF1800370;
	Thu, 24 Sep 2026 13:11:03 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 24 Sep 2026 15:10:35 +0200
Subject: [PATCH v3 1/4] soc: qcom: smem: add IN_PARTITION_RANGE helper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-port-smem-v3-1-fbc2ea81a654@redhat.com>
References: <20260924-port-smem-v3-0-fbc2ea81a654@redhat.com>
In-Reply-To: <20260924-port-smem-v3-0-fbc2ea81a654@redhat.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Albert Esteve <aesteve@redhat.com>, 
 Sarannya S <quic_sarannya@oss.qualcomm.com>, 
 Pranav Mahesh Phansalkar <quic_pphansal@oss.qualcomm.com>, 
 Sudeepgoud Patil <quic_sudeepgo@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790255460; l=1678;
 i=aesteve@redhat.com; s=20260827; h=from:subject:message-id;
 bh=ZL5OqMFy04o5fpagEOrdmsCdEQK3KqDzDKFuhPnBefE=;
 b=IJeA3bDldXV3K9gifNiyfen/SFSiLpTGSf2QTzoJvVXJTlHAuULolv4NNVO9p3kFgTZaGnukS
 FPgB7zHRCzoCUsHWiZKsSPV1TphPrHorNt/NRoxjiBvoHsWRxuUoDzv
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=zI2RBeZgocwYm3AkJW4CtjoJnKoDZrfBl1xe5Ed6h+U=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

From: Sarannya S <quic_sarannya@oss.qualcomm.com>

Add IN_PARTITION_RANGE() to test that a pointer lies in [start, end]
and that pointer + size does not wrap.

Signed-off-by: Sarannya S <quic_sarannya@oss.qualcomm.com>
Signed-off-by: Pranav Mahesh Phansalkar <quic_pphansal@oss.qualcomm.com>
Signed-off-by: Sudeepgoud Patil <quic_sudeepgo@oss.qualcomm.com>
Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 drivers/soc/qcom/smem.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index b5e7bd8c1512..6783a3c533f0 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2015, Sony Mobile Communications AB.
  * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/debugfs.h>
@@ -88,6 +89,17 @@
 /* Processor/host identifier for the global partition */
 #define SMEM_GLOBAL_HOST	0xfffe
 
+/* Entry range check
+ * ptr >= start : Checks if ptr is greater than the start of access region
+ * ptr + size >= ptr: Check for integer overflow (On 32bit system where ptr
+ * and size are 32bits, ptr + size can wrap around to be a small integer)
+ * ptr + size <= end: Checks if ptr+size is less than the end of access region
+ */
+#define IN_PARTITION_RANGE(ptr, size, start, end)		\
+	(((void *)(ptr) >= (void *)(start)) &&			\
+	 (((void *)(ptr) + (size)) >= (void *)(ptr)) &&	\
+	 (((void *)(ptr) + (size)) <= (void *)(end)))
+
 /**
   * struct smem_proc_comm - proc_comm communication struct (legacy)
   * @command:	current command to be executed

-- 
2.55.0

