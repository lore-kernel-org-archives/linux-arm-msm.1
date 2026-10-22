Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662474;
	b=EjXmBLJiSM/zmVZPMuxVM7y6kZs/7nWWXurZ/frNQvgMFRHPp0sCPglPARnBuEuYbLpZ
	 4wFGszvbHhPRo+TLD5tc7+otqM7LcnIpiKZzr++uBH3BiRXxHEGwWHfhM+gYUn8jEECQr
	 Yirn5ATqdvD8hNQz1l+/B1kXN6o1E4KV+asKLmBJcXDUhvzthkxKhH34UnOGSCfrQooAn
	 OpUR3h35P3UZeYu0aWVY/pk5MPzs/B8enqKChkoF/uJw/wnoTlQdvlWpbZLWl1hl0nofk
	 SoXXNGR9LGJTKMFqrISLusE38LwYe0jmO6I/tKvPJamDUIitD4DwI/r+0Hi8YO8frEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662474;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key:
	 X-Scanned-By;
	bh=BRxQJ5eyiQFfo7dB89x0UqT/Ru3bBgTZGjDFr3mHISM=;
	b=Wq4yKmXT/aV3brIbkDn/+O/zkv0R0OV04zy1spC2Wcpd5vzui+d3J8eNrvpDiGKoMVGQ
	 167CzdEyGG6CVyRPggZ6Izpn6q1zEFxx9qCQk8Re/tf6NYcPmhJQYKhPzPDheoETNpSlS
	 3qxv+yDumQQnwdiNmnFwLHuA6g9sxE66nUFL1Vdp4eoKCxWas6Y7n5SeG0Y/vzDPCag9W
	 zpyNSeodu/EhAo42FpxWmaH1yxhbxtjVmr6ShpnQlBz3tsRvULBhcWUsSfnyWEntsjb8z
	 Lr6Q846tbdHuGbTaZGO9/JPLBFuuMcsMITQpWW6IZr71s42Y8Ox7OXEH6MqxsCqaiOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PUkT5BKj;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4CE606A31A
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A4CE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PUkT5BKj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792662473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BRxQJ5eyiQFfo7dB89x0UqT/Ru3bBgTZGjDFr3mHISM=;
	b=PUkT5BKj4F6B6E5jIICvvvU5h8yMrxWWB8dh7NiIXg4WhEuci3WOchA448Kov7EUDzPlM5
	bDLD+b+3iRMd6wOgyG4fk5JxBh4tkrYxs/4BLFGxFt6bUTsDHwGmy1bnHQ6+iFMkKUfLXi
	lWPFZV8NcuxWzdsUlcKdMMj1B+KQycs=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-393-XJVOV_ZfP2iqNJ1uu7gTnQ-1; Thu,
 22 Oct 2026 09:47:42 +0000
X-MC-Unique: XJVOV_ZfP2iqNJ1uu7gTnQ-1
X-Mimecast-MFC-AGG-ID: XJVOV_ZfP2iqNJ1uu7gTnQ_1792662461
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 80B63180048E;
	Thu, 22 Oct 2026 09:47:41 +0000 (UTC)
Received: from aesteve-thinkpadp1gen8.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A934E46C;
	Thu, 22 Oct 2026 09:47:39 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 22 Oct 2026 11:47:21 +0200
Subject: [PATCH v4 1/4] soc: qcom: smem: add IN_PARTITION_RANGE helper
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-port-smem-v4-1-b0baf39c6e01@redhat.com>
References: <20261022-port-smem-v4-0-b0baf39c6e01@redhat.com>
In-Reply-To: <20261022-port-smem-v4-0-b0baf39c6e01@redhat.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Albert Esteve <aesteve@redhat.com>, 
 Sarannya S <sarannya.s@oss.qualcomm.com>, 
 Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>, 
 Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792662456; l=1699;
 i=aesteve@redhat.com; s=20260827; h=from:subject:message-id;
 bh=EN4OCzEwTrwzn2tkkGPPu2ujKr3BRqYxJnl5sXQg7Cc=;
 b=wN/5CIXB3mor6sD2cKdEu2BDaSElxWiC60e+iEZYQKzoOps5RH5YT9lChOlZqiWmmSnc8nDv8
 pxB8jJFbRajCh+BegX3NPqsFGnpm9RCXOkRDF+le6SQin3ROslPSpT/
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=zI2RBeZgocwYm3AkJW4CtjoJnKoDZrfBl1xe5Ed6h+U=
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

From: Sarannya S <sarannya.s@oss.qualcomm.com>

Add IN_PARTITION_RANGE() to test that a pointer lies in [start, end]
and that pointer + size does not wrap.

Signed-off-by: Sarannya S <sarannya.s@oss.qualcomm.com>
Signed-off-by: Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>
Signed-off-by: Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>
Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 drivers/soc/qcom/smem.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index b5e7bd8c1512..36a4a10f3aec 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2015, Sony Mobile Communications AB.
  * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/debugfs.h>
@@ -88,6 +89,18 @@
 /* Processor/host identifier for the global partition */
 #define SMEM_GLOBAL_HOST	0xfffe
 
+/* Entry range check
+ * ptr >= start : Checks if ptr is at or past the start of the region
+ * ptr <= end   : Checks if ptr is within the region
+ * size <= end - ptr: Checks if size fits in the remaining space, using
+ *                    uintptr_t subtraction to avoid pointer overflow UB
+ *                    (safe because ptr <= end is checked first)
+ */
+#define IN_PARTITION_RANGE(ptr, size, start, end)		\
+	((void *)(ptr) >= (void *)(start) &&			\
+	 (void *)(ptr) <= (void *)(end) &&			\
+	 (size) <= (uintptr_t)(end) - (uintptr_t)(ptr))
+
 /**
   * struct smem_proc_comm - proc_comm communication struct (legacy)
   * @command:	current command to be executed

-- 
2.55.0

