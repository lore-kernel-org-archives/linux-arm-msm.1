Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662472;
	b=EhZUrGsZqkt+lWvUd5yglj7aSLnpFwmnY6u2u0gVV63Z6ogRDzz+JlIWEWU/JAQtGue5
	 D+yFwLfxezEP9H3/BaEpJ2jJcUoXccKVpybDuCcEFy/gQJMwvGGmNyeIx14thw0oODJuf
	 sg9hW8TKp7eF9AxE1xjSBoigYLgsOgqK9nuyzcOFxEULIScB8uXF9rT1vvsFOtctBzxb9
	 Zo1+IBcBhhp3RTA2RotlvqveLWMUIPGZiQyMoQRIQXjbXu/mct998383hH5+ljHl2GTEx
	 XEUQ47SlevFU/PIIsDGRGgpH45SzRnzS+HPZAdmr/tKDO8MH/8Y71xzDJ6vWhT0PKxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662472;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key:
	 X-Scanned-By;
	bh=5nSRd52LX5yadSqwhns3RwI0pRLZvhBM2MxRWvYw9Y0=;
	b=VSo2Ody+jgD6Cm5BAc1P4TvkNzTTDVcA1K4Yq8aki7bl0tKYlbAAB1lKEHn6dYR1kgBB
	 m0GX1w1enSO/JnHoshkMp6ikRYgx+R2ACYiLCF4DlD5hsJBOK06buZvCu5LFE372qkiq3
	 ja1xjATz9/CfuAqeGRuASuTae6wA4jif+QT9hKc8d/vd5wMAbbpJV+VJtNDjY1D8y+crJ
	 Tiz9YA4r31vnffj+VGEiBYZ9/ce0yP9exEI7dPB7Nh74jF43hIofAV7ocGqZIO8tPdn2Y
	 0LVGhv3vn+6qiwPYDCNXxYmXsGQYOdC5bI2Z4Uv3viRAeF9ihgvPs9W9sl2E8O7+rWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X8Zr5LKY;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5345A60A2608
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:47:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5345A60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X8Zr5LKY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792662471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5nSRd52LX5yadSqwhns3RwI0pRLZvhBM2MxRWvYw9Y0=;
	b=X8Zr5LKYJlkjCGDyIl4B5v+di3ofgQQWt7l+bwfXzyvupuO1MiXXDpch8jVSpHev0vJvqS
	GnppgKeSkNiLFdwp2RE14Z/eE1+dU9xrH/qA9QNOfsurCeL8Ltv9hnunkmdHWBpuvFbASS
	78ABljo+EYJ4M1RbAkyGq9phT+FVDgE=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-3-JEdcUN5NOHCxSgFKeX3LYQ-1; Thu,
 22 Oct 2026 05:47:47 -0400
X-MC-Unique: JEdcUN5NOHCxSgFKeX3LYQ-1
X-Mimecast-MFC-AGG-ID: JEdcUN5NOHCxSgFKeX3LYQ_1792662465
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C1DBC1956095;
	Thu, 22 Oct 2026 09:47:45 +0000 (UTC)
Received: from aesteve-thinkpadp1gen8.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 212555AA;
	Thu, 22 Oct 2026 09:47:43 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 22 Oct 2026 11:47:23 +0200
Subject: [PATCH v4 3/4] soc: qcom: smem: validate private item payloads
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
Message-Id: <20261022-port-smem-v4-3-b0baf39c6e01@redhat.com>
References: <20261022-port-smem-v4-0-b0baf39c6e01@redhat.com>
In-Reply-To: <20261022-port-smem-v4-0-b0baf39c6e01@redhat.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Albert Esteve <aesteve@redhat.com>, 
 Sarannya S <sarannya.s@oss.qualcomm.com>, 
 Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>, 
 Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792662456; l=2810;
 i=aesteve@redhat.com; s=20260827; h=from:subject:message-id;
 bh=p5Tb/oAU7iYfBbacewiEb5eQpVb4uQ94X0TrFMvmTR4=;
 b=nyntUudjMPE7xl86MDhOe0+N9OT7UHXFsWfjFoPSynPZn4NIF2Xq/ea9t+erWJCjNL02J5f25
 N6j7kzjvH4UC+ldcG30ntKjOC7xZrHTDboUx6MnvI3A2PvsWybPtLqQ
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=zI2RBeZgocwYm3AkJW4CtjoJnKoDZrfBl1xe5Ed6h+U=
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

From: Sarannya S <sarannya.s@oss.qualcomm.com>

Validate a matching entry's size and padding even when the caller does
not request the length, and check that the payload stays inside the
same region as the header.

Signed-off-by: Sarannya S <sarannya.s@oss.qualcomm.com>
Signed-off-by: Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>
Signed-off-by: Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>
Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 drivers/soc/qcom/smem.c | 39 +++++++++++++++++++++------------------
 1 file changed, 21 insertions(+), 18 deletions(-)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index a6732832e2c5..f34eaba230ad 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -616,6 +616,7 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
 	struct smem_private_entry *next_e;
 	struct smem_partition_header *phdr;
 	void *item_ptr, *p_end;
+	size_t entry_size = 0;
 	u32 padding_data;
 	u32 e_size;
 
@@ -635,20 +636,21 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
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
+				entry_size = e_size - padding_data;
+			else
+				return ERR_PTR(-EINVAL);
 
 			item_ptr = uncached_entry_to_item(e);
-			if (WARN_ON(item_ptr > p_end))
+			if (WARN_ON(!IN_PARTITION_RANGE(item_ptr, entry_size, e, uncached_end)))
 				return ERR_PTR(-EINVAL);
 
+			if (size != NULL)
+				*size = entry_size;
+
 			return item_ptr;
 		}
 
@@ -678,20 +680,21 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
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
+				entry_size = e_size - padding_data;
+			else
+				return ERR_PTR(-EINVAL);
 
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

