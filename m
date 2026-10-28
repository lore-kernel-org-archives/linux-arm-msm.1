Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180057;
	b=UmBr8Y2U8WyP5J3DtCaLxvwiKw+Ag5qvW1mYdN/XHcPdsgWmI+HPkJIQiIOmYpgPxAvR
	 LErXwsGHglmZ5BqD7v5atIsz3H3G2nJpDw3SouXlBcIsKMoIXmMFYEnCqs7fim37j+6WD
	 o2DvY6IqpTNETkD1iRhSzdclbhOxwWxP29J+/fx79EsQpszLnvedtKeTOzivjRU05Xg2q
	 Nb/Z0w+R8Lj8qwH3+5Usb+iGhY6ryOn7sCFQL1ZNa5z/VNNBE7ZcaydSgQtfhkr4BaEG4
	 U5sazDfWomOaHTC2dpMcv4lbFjuKHtc6vSxNw8XtQXO1elSuR6L0ny6/cBs8GYQIczw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180057;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key:
	 X-Scanned-By;
	bh=wOF429PAF6wPGZ/DQccKnRO6Ry9eRCxXG5zhRkZrbt0=;
	b=u5coc8NKGD61PZzPYq7tOGkwu1IDXa6yoDXchX6xS1TKk5/l1F63lScANffsG9wZqp78
	 MKbGimJs7i/NaBeNvnb8jZzIYEIjh53iIe+Olx+hirRLiBhVLwmqbR4OuW50EH/Za2Xow
	 umgKieO6vk8NmBN1KBHa9FRG/DQcopE5cWSWGLy/EW5q7CXj/sMEHKCKZWAWxyzZSxQkZ
	 xXa767e3dT1ir54FI5/ok15HRnVeNnSzpF4vZaGoFcl5dt7tiX9ypQrvisgPchoe4lEqO
	 b3+RIWNc99g756EwJl8FMXoTQD6i1yg+/FOUA8VpQ24Xn+3AQs5FY7E6iriZesb844w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gsG7lkFm;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10F4606A336
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 09:34:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C10F4606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gsG7lkFm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793180055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wOF429PAF6wPGZ/DQccKnRO6Ry9eRCxXG5zhRkZrbt0=;
	b=gsG7lkFm/G81ZiUs16Y9e30fh1haX+70nE9bc4Xis/kGPsf7B6bRdGF3/ZvxW5e4eTAD/h
	R18voSd1k6TzGP9MhwLk9VxKBvyvktfrikCCEhcC1kS6JKwuOfcwQzB8pt+QwLsLD/6srI
	SNOupW+Q+CwCRTvshjd3m27SSlZuMv4=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-349--37DGzHoMvOqUrao7Sr2uw-1; Wed,
 28 Oct 2026 05:34:09 -0400
X-MC-Unique: -37DGzHoMvOqUrao7Sr2uw-1
X-Mimecast-MFC-AGG-ID: -37DGzHoMvOqUrao7Sr2uw_1793180047
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B5A081955F14;
	Wed, 28 Oct 2026 09:34:07 +0000 (UTC)
Received: from aesteve-thinkpadp1gen8.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CC2321955F10;
	Wed, 28 Oct 2026 09:34:05 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 28 Oct 2026 10:33:49 +0100
Subject: [PATCH v5 2/4] soc: qcom: smem: validate private entry list walks
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
Message-Id: <20261028-port-smem-v5-2-121257d490b5@redhat.com>
References: <20261028-port-smem-v5-0-121257d490b5@redhat.com>
In-Reply-To: <20261028-port-smem-v5-0-121257d490b5@redhat.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Albert Esteve <aesteve@redhat.com>, 
 Sarannya S <sarannya.s@oss.qualcomm.com>, 
 Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>, 
 Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793180040; l=4357;
 i=aesteve@redhat.com; s=20260827; h=from:subject:message-id;
 bh=c6a3QAR90MOflWyIRW806QdYNWbjK3DUq9ROH4+Ga7U=;
 b=HyEqEyZZYJ38VsTGgBlOyQxiUgRkwDn1dSvXd0CEnwzXfxOrcRDFDFx4ZrpQ+R4g2vA6pKIKa
 WUieqA21SX8B8/uvEbODs6JhjHJXZid0lc75l9HS8nQpLJtOSiokn+Y
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=zI2RBeZgocwYm3AkJW4CtjoJnKoDZrfBl1xe5Ed6h+U=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

From: Sarannya S <sarannya.s@oss.qualcomm.com>

When walking private entries, use the uncached/cached free offsets as
the list bounds, require room for a header before dereferencing, and
reject a next pointer that does not advance.

Skip the cached list when the cached free offset is at the partition
end.

Signed-off-by: Sarannya S <sarannya.s@oss.qualcomm.com>
Signed-off-by: Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>
Signed-off-by: Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 drivers/soc/qcom/smem.c | 51 +++++++++++++++++++++++++++++++++++--------------
 1 file changed, 37 insertions(+), 14 deletions(-)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index 36a4a10f3aec..ff5aead97bdd 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -422,6 +422,7 @@ static int qcom_smem_alloc_private(struct qcom_smem *smem,
 				   size_t size)
 {
 	struct smem_private_entry *hdr, *end;
+	struct smem_private_entry *next_hdr;
 	struct smem_partition_header *phdr;
 	size_t alloc_size;
 	void *cached;
@@ -434,19 +435,24 @@ static int qcom_smem_alloc_private(struct qcom_smem *smem,
 	end = phdr_to_last_uncached_entry(phdr);
 	cached = phdr_to_last_cached_entry(phdr);
 
-	if (WARN_ON((void *)end > p_end || cached > p_end))
+	if (WARN_ON(!IN_PARTITION_RANGE(end, 0, phdr, cached) || cached > p_end))
 		return -EINVAL;
 
-	while (hdr < end) {
+	while ((hdr + 1) <= end) {
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
+	if (WARN_ON(hdr != end))
 		return -EINVAL;
 
 	/* Check that we don't grow into the cached region */
@@ -605,7 +611,8 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
 				   unsigned int item,
 				   size_t *size)
 {
-	struct smem_private_entry *e, *end;
+	struct smem_private_entry *e, *uncached_end, *cached_end;
+	struct smem_private_entry *next_e;
 	struct smem_partition_header *phdr;
 	void *item_ptr, *p_end;
 	u32 padding_data;
@@ -615,9 +622,14 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
 	p_end = (void *)phdr + part->size;
 
 	e = phdr_to_first_uncached_entry(phdr);
-	end = phdr_to_last_uncached_entry(phdr);
+	uncached_end = phdr_to_last_uncached_entry(phdr);
+	cached_end = phdr_to_last_cached_entry(phdr);
+
+	if (WARN_ON(!IN_PARTITION_RANGE(uncached_end, 0, phdr, cached_end) ||
+			(void *)cached_end > p_end))
+		return ERR_PTR(-EINVAL);
 
-	while (e < end) {
+	while ((e + 1) <= uncached_end) {
 		if (e->canary != SMEM_PRIVATE_CANARY)
 			goto invalid_canary;
 
@@ -639,21 +651,28 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
 			return item_ptr;
 		}
 
-		e = uncached_entry_next(e);
+		next_e = uncached_entry_next(e);
+		if (WARN_ON(next_e <= e))
+			return ERR_PTR(-EINVAL);
+
+		e = next_e;
 	}
 
-	if (WARN_ON((void *)e > p_end))
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
 
@@ -675,10 +694,14 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
 			return item_ptr;
 		}
 
-		e = cached_entry_next(e, part->cacheline);
+		next_e = cached_entry_next(e, part->cacheline);
+		if (WARN_ON(next_e >= e))
+			return ERR_PTR(-EINVAL);
+
+		e = next_e;
 	}
 
-	if (WARN_ON((void *)e < (void *)phdr))
+	if (WARN_ON((void *)e < (void *)cached_end))
 		return ERR_PTR(-EINVAL);
 
 	return ERR_PTR(-ENOENT);

-- 
2.55.0

