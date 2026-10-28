Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180058;
	b=3S/pFo9hTdtn1QH4N2yeegYa2l/JwrcajUEoWIHpUvlzjfo7huD8UYKRorCjywOq+L68
	 tAkz9RcN6KrmSGfVcCFK6Or9eWRlyT5DOPAmylcU+ttkiC8893ukMi56GVEcI2amZQzjH
	 nHWVt1+xyFgyVWqW0/vs+wU2hq2eXAuvsJDliX9hwQNd8o8OsihyivJ9UyPu3uwSz74oJ
	 NcEc7/JNZgv4H7ltPdRzmFCFbdLjFdMTrwkJae7GUQhf0qU/FugaV+GfyUzWwy5R16/1R
	 ZizOPffApT0C7QCRwVoKdlvKyQgDnKaC2x6M5NBW8P6joVWi1WU5wSF5tdTOql3u4TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180058;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key:
	 X-Scanned-By;
	bh=MM7+0U5NXwXti/ySHlHtxqoGyOLLE2vmyAfA79miAUg=;
	b=0O9j8ag9fwfqjgiiiQKqr3Iy1daPpjfmQ7cpRVnRtk9j4DkXNg9kUacuUUQADAB19S12
	 YsGdOVlvmrW68Z7UdPe9nuVtOHSpoJSd5eOY58pT4AgQPifDaZEByVS5Dhmgs6I4X11z9
	 h/X3IBugQCvM1JYtjED0lESETP0cM28AXG5UjgCNQwuBVfHmQ6d+Bbt9GSiz3j7AAaBjo
	 9RMcI0rouSDd3KJJEpRmoTPZGq5p9Y+//2q+9hlvRhZG9T8AinxGPQH8laYM35HpDHqa5
	 Nk6NS93o/Rp3KO5f7bEiI/f9rUNC2tHLFeWuMgfayv3IeDlBDZruBD4oDxh1sgYb+iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dQXnub25;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A319960A2601
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 09:34:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A319960A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dQXnub25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793180056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MM7+0U5NXwXti/ySHlHtxqoGyOLLE2vmyAfA79miAUg=;
	b=dQXnub25+qVTfdf3ayz4nuTOXV1fWcj40ESOyb/iw+VmHLX+FMSiXTYpqug7798tiOOstB
	+U+Dv/HyOVrrSOidNaDOqLmO8a998CNywFCo+v9U1cG1g0ya/WGjpas2DExLlo9mWc8Sh/
	gpkp7DNMi1rybBk52bpcCuDGhY6wsM8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-680-fljpZECJNAue0xZd0FSBsQ-1; Wed,
 28 Oct 2026 05:34:11 -0400
X-MC-Unique: fljpZECJNAue0xZd0FSBsQ-1
X-Mimecast-MFC-AGG-ID: fljpZECJNAue0xZd0FSBsQ_1793180049
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BA8571955F7F;
	Wed, 28 Oct 2026 09:34:09 +0000 (UTC)
Received: from aesteve-thinkpadp1gen8.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 157201955F21;
	Wed, 28 Oct 2026 09:34:07 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 28 Oct 2026 10:33:50 +0100
Subject: [PATCH v5 3/4] soc: qcom: smem: validate private item payloads
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
Message-Id: <20261028-port-smem-v5-3-121257d490b5@redhat.com>
References: <20261028-port-smem-v5-0-121257d490b5@redhat.com>
In-Reply-To: <20261028-port-smem-v5-0-121257d490b5@redhat.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Albert Esteve <aesteve@redhat.com>, 
 Sarannya S <sarannya.s@oss.qualcomm.com>, 
 Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>, 
 Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793180040; l=2857;
 i=aesteve@redhat.com; s=20260827; h=from:subject:message-id;
 bh=35THvmVsdWYk2Wbh1ZTdIqzU4WxzIopHN7ZbOkvLivg=;
 b=3QB0Rctnre+PwSoWld4ZxogyTv3U5M3/0zWBZu6DyI7WvC1BUmAUsRka/soz4KE6iZ7YdcGXH
 hTilAAClQNDBypxLe3A4FCG8VxY5b+xoHPUFVfZ49JcVoZqKj6KPvJD
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=zI2RBeZgocwYm3AkJW4CtjoJnKoDZrfBl1xe5Ed6h+U=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

From: Sarannya S <sarannya.s@oss.qualcomm.com>

Validate a matching entry's size and padding even when the caller does
not request the length, and check that the payload stays inside the
same region as the header.

Zero-length payloads are now rejected as invalid.

Signed-off-by: Sarannya S <sarannya.s@oss.qualcomm.com>
Signed-off-by: Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>
Signed-off-by: Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>
Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 drivers/soc/qcom/smem.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index ff5aead97bdd..36270d02e9ae 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -615,6 +615,7 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
 	struct smem_private_entry *next_e;
 	struct smem_partition_header *phdr;
 	void *item_ptr, *p_end;
+	size_t entry_size = 0;
 	u32 padding_data;
 	u32 e_size;
 
@@ -634,20 +635,21 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
 			goto invalid_canary;
 
 		if (le16_to_cpu(e->item) == item) {
-			if (size != NULL) {
-				e_size = le32_to_cpu(e->size);
-				padding_data = le16_to_cpu(e->padding_data);
+			e_size = le32_to_cpu(e->size);
+			padding_data = le16_to_cpu(e->padding_data);
 
-				if (WARN_ON(e_size > part->size || padding_data > e_size))
-					return ERR_PTR(-EINVAL);
+			if (WARN_ON(e_size > part->size || padding_data >= e_size))
+				return ERR_PTR(-EINVAL);
 
-				*size = e_size - padding_data;
-			}
+			entry_size = e_size - padding_data;
 
 			item_ptr = uncached_entry_to_item(e);
-			if (WARN_ON(item_ptr > p_end))
+			if (WARN_ON(!IN_PARTITION_RANGE(item_ptr, entry_size, e, uncached_end)))
 				return ERR_PTR(-EINVAL);
 
+			if (size != NULL)
+				*size = entry_size;
+
 			return item_ptr;
 		}
 
@@ -677,20 +679,21 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
 			goto invalid_canary;
 
 		if (le16_to_cpu(e->item) == item) {
-			if (size != NULL) {
-				e_size = le32_to_cpu(e->size);
-				padding_data = le16_to_cpu(e->padding_data);
+			e_size = le32_to_cpu(e->size);
+			padding_data = le16_to_cpu(e->padding_data);
 
-				if (WARN_ON(e_size > part->size || padding_data > e_size))
-					return ERR_PTR(-EINVAL);
+			if (WARN_ON(e_size > part->size || padding_data >= e_size))
+				return ERR_PTR(-EINVAL);
 
-				*size = e_size - padding_data;
-			}
+			entry_size = e_size - padding_data;
 
 			item_ptr = cached_entry_to_item(e);
-			if (WARN_ON(item_ptr < (void *)phdr))
+			if (WARN_ON(!IN_PARTITION_RANGE(item_ptr, entry_size, cached_end, e)))
 				return ERR_PTR(-EINVAL);
 
+			if (size != NULL)
+				*size = entry_size;
+
 			return item_ptr;
 		}
 

-- 
2.55.0

