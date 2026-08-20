Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B0C3BB11F
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 11:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787225677; cv=none; b=IdRd5P+Rgkz1GdfjbOWOpxvJv5yqPcJn5NNH5Q42j3+s5A0PQtlQ9EMG/1sj7Ee5vmpWB1X6OAt+q6LiEiWvpSczdW+XHwUltaJnfB4180WzVkIHHMtqDnrTrp0Nq4CzGdgdQPjU0zhcCa01tV5RsXA/mztZ4uus4Old8+oLwrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787225677; c=relaxed/simple;
	bh=aIZNn1grO9HSs6qI5Cy7nzAIEIUu6hlW7aGSXmkXxRc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z3J0xNI+M2gV5o9Mb7soRF9DW2DhZ6E9jhb3HsrJOdFPq5A/bVDlYiZifIfY1szVyLd9dxBNF3hWCVYXHAz20K0kQMvWLSnb6i1wrymzpEnjRAldgXtfKGbyP/z+DKmrEtZRDjqz5tPeerjc9vOGbBTwE0Lg4K9TqvJePbElDR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YqEC23pa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YqEC23pa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787225675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dm+mN5n3dsTKShEHHzFfg+sTy2TwR60RlXBR7I20CNM=;
	b=YqEC23pa/f1wngven1qk//ZgqJb3ESfCKe4xJnYqkvDlNSFiRj64+1CZOy2wz/TzT4VDuG
	LCgi5rmjaFPpYB2ZcbvYPYxp7nR/p1varYSe2hmT1OR2l1n0uAKsbwhKP/b7N5iWAnd3PA
	jEyWsSDJpmg1pk7aqMOZObegbBa5smc=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-687-hqomTjmkN6S8kl7y-wjCfQ-1; Thu,
 20 Aug 2026 07:34:33 -0400
X-MC-Unique: hqomTjmkN6S8kl7y-wjCfQ-1
X-Mimecast-MFC-AGG-ID: hqomTjmkN6S8kl7y-wjCfQ_1787225672
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 64BBA195609E;
	Thu, 20 Aug 2026 11:34:32 +0000 (UTC)
Received: from [192.168.1.153] (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 999F81955F03;
	Thu, 20 Aug 2026 11:34:30 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 20 Aug 2026 13:34:18 +0200
Subject: [PATCH 1/2] soc: qcom: smem: add boundary checks for partitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-port-smem-v1-1-d19a45f583bf@redhat.com>
References: <20260820-port-smem-v1-0-d19a45f583bf@redhat.com>
In-Reply-To: <20260820-port-smem-v1-0-d19a45f583bf@redhat.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Albert Esteve <aesteve@redhat.com>, 
 Sudeepgoud Patil <quic_sudeepgo@quicinc.com>, 
 Sarannya S <quic_sarannya@quicinc.com>, 
 Pranav Mahesh Phansalkar <quic_pphansal@quicinc.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787225667; l=6648;
 i=aesteve@redhat.com; s=20260303; h=from:subject:message-id;
 bh=HW1iRmH6U7tL08ErzMRS7SLan48xvsfAawXA2c2d7x8=;
 b=kYOqcDAnQDAj7zBYtzWYlNO7zlG0Tma5RZ90aXdqQLG400xwgxcOD6UUXqR4KDRSlVYK8Zj+Q
 0iDA3UFQVCbCxGxEwOIPnlJpxPokx1FnkjVoClHXmThCKe0JVaGCRcu
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=YSFz6sOHd2L45+Fr8DIvHTi6lSIjhLZ5T+rkxspJt1s=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

From: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>

Add condition check to make sure that the end address
of private entry does not go out of partition.

Signed-off-by: Sarannya S <quic_sarannya@quicinc.com>
Signed-off-by: Pranav Mahesh Phansalkar <quic_pphansal@quicinc.com>
Signed-off-by: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 drivers/soc/qcom/smem.c | 105 +++++++++++++++++++++++++++++++++---------------
 1 file changed, 72 insertions(+), 33 deletions(-)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index afb21a778fe7b..194ffb2ac010f 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2015, Sony Mobile Communications AB.
  * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/hwspinlock.h>
@@ -85,6 +86,17 @@
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
@@ -403,6 +415,7 @@ static int qcom_smem_alloc_private(struct qcom_smem *smem,
 				   size_t size)
 {
 	struct smem_private_entry *hdr, *end;
+	struct smem_private_entry *next_hdr;
 	struct smem_partition_header *phdr;
 	size_t alloc_size;
 	void *cached;
@@ -415,19 +428,25 @@ static int qcom_smem_alloc_private(struct qcom_smem *smem,
 	end = phdr_to_last_uncached_entry(phdr);
 	cached = phdr_to_last_cached_entry(phdr);
 
-	if (WARN_ON((void *)end > p_end || cached > p_end))
+	if (WARN_ON(!IN_PARTITION_RANGE(end, 0, phdr, cached) ||
+						cached > p_end))
 		return -EINVAL;
 
-	while (hdr < end) {
+	while ((hdr < end) && ((hdr + 1) < end)) {
 		if (hdr->canary != SMEM_PRIVATE_CANARY)
 			goto bad_canary;
 		if (le16_to_cpu(hdr->item) == item)
 			return -EEXIST;
 
-		hdr = uncached_entry_next(hdr);
+		next_hdr = uncached_entry_next(hdr);
+
+		if (WARN_ON(next_hdr <= hdr))
+			return -EINVAL;
+
+		hdr = next_hdr;
 	}
 
-	if (WARN_ON((void *)hdr > p_end))
+	if (WARN_ON((void *)hdr > (void *)end))
 		return -EINVAL;
 
 	/* Check that we don't grow into the cached region */
@@ -587,9 +606,11 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
 				   unsigned item,
 				   size_t *size)
 {
-	struct smem_private_entry *e, *end;
+	struct smem_private_entry *e, *uncached_end, *cached_end;
+	struct smem_private_entry *next_e;
 	struct smem_partition_header *phdr;
 	void *item_ptr, *p_end;
+	size_t entry_size = 0;
 	u32 padding_data;
 	u32 e_size;
 
@@ -597,67 +618,85 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
 	p_end = (void *)phdr + part->size;
 
 	e = phdr_to_first_uncached_entry(phdr);
-	end = phdr_to_last_uncached_entry(phdr);
+	uncached_end = phdr_to_last_uncached_entry(phdr);
+	cached_end = phdr_to_last_cached_entry(phdr);
+
+	if (WARN_ON(!IN_PARTITION_RANGE(uncached_end, 0, phdr, cached_end)
+					|| (void *)cached_end > p_end))
+		return ERR_PTR(-EINVAL);
 
-	while (e < end) {
+	while ((e < uncached_end) && ((e + 1) < uncached_end)) {
 		if (e->canary != SMEM_PRIVATE_CANARY)
 			goto invalid_canary;
 
 		if (le16_to_cpu(e->item) == item) {
-			if (size != NULL) {
-				e_size = le32_to_cpu(e->size);
-				padding_data = le16_to_cpu(e->padding_data);
+			e_size = le32_to_cpu(e->size);
+			padding_data = le16_to_cpu(e->padding_data);
 
-				if (WARN_ON(e_size > part->size || padding_data > e_size))
-					return ERR_PTR(-EINVAL);
+			if (e_size < part->size && padding_data < e_size)
+				entry_size = e_size - padding_data;
+			else
+				return ERR_PTR(-EINVAL);
 
-				*size = e_size - padding_data;
-			}
+			item_ptr =  uncached_entry_to_item(e);
 
-			item_ptr = uncached_entry_to_item(e);
-			if (WARN_ON(item_ptr > p_end))
+			if (WARN_ON(!IN_PARTITION_RANGE(item_ptr, entry_size, e, uncached_end)))
 				return ERR_PTR(-EINVAL);
 
+			if (size != NULL)
+				*size = entry_size;
+
 			return item_ptr;
 		}
 
-		e = uncached_entry_next(e);
-	}
+		next_e = uncached_entry_next(e);
+		if (WARN_ON(next_e <= e))
+			return ERR_PTR(-EINVAL);
 
-	if (WARN_ON((void *)e > p_end))
+		e = next_e;
+	}
+	if (WARN_ON((void *)e > (void *)uncached_end))
 		return ERR_PTR(-EINVAL);
 
 	/* Item was not found in the uncached list, search the cached list */
 
+	if (cached_end == p_end)
+		return ERR_PTR(-ENOENT);
+
 	e = phdr_to_first_cached_entry(phdr, part->cacheline);
-	end = phdr_to_last_cached_entry(phdr);
 
-	if (WARN_ON((void *)e < (void *)phdr || (void *)end > p_end))
+	if (WARN_ON(!IN_PARTITION_RANGE(cached_end, 0, uncached_end, p_end) ||
+			!IN_PARTITION_RANGE(e, sizeof(*e), cached_end, p_end)))
 		return ERR_PTR(-EINVAL);
 
-	while (e > end) {
+	while (e > cached_end) {
 		if (e->canary != SMEM_PRIVATE_CANARY)
 			goto invalid_canary;
 
 		if (le16_to_cpu(e->item) == item) {
-			if (size != NULL) {
-				e_size = le32_to_cpu(e->size);
-				padding_data = le16_to_cpu(e->padding_data);
+			e_size = le32_to_cpu(e->size);
+			padding_data = le16_to_cpu(e->padding_data);
 
-				if (WARN_ON(e_size > part->size || padding_data > e_size))
-					return ERR_PTR(-EINVAL);
-
-				*size = e_size - padding_data;
-			}
+			if (e_size < part->size && padding_data < e_size)
+				entry_size  = e_size - padding_data;
+			else
+				return ERR_PTR(-EINVAL);
 
-			item_ptr = cached_entry_to_item(e);
-			if (WARN_ON(item_ptr < (void *)phdr))
+			item_ptr =  cached_entry_to_item(e);
+			if (WARN_ON(!IN_PARTITION_RANGE(item_ptr, entry_size, cached_end, e)))
 				return ERR_PTR(-EINVAL);
 
+			if (size != NULL)
+				*size = entry_size;
+
 			return item_ptr;
 		}
 
-		e = cached_entry_next(e, part->cacheline);
+		next_e = cached_entry_next(e, part->cacheline);
+		if (WARN_ON(next_e >= e))
+			return ERR_PTR(-EINVAL);
+
+		e = next_e;
 	}
 
 	if (WARN_ON((void *)e < (void *)phdr))

-- 
2.55.0

