Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008254;
	b=mgqtCH6V6gsJrmTQ2OB0Gdp75NX3ezE5m4ACNdgkERKDiAj+2b3v0qxNHWv7hF9AW+kB
	 PS9eImZxOsFFmwkFrP0FUSg4uAXUspOrf8ah5yX7Sose2bM80QHoSaeQmar/Ce3UY31XJ
	 VrxQoXQ2yUO0hAPDWuQfd1SgU1c55aCSqkz4+aKzRs5VLpGSHksQDSORmtu4m6vW/U5fZ
	 U2ARZT5fzOa52pMy2RIDrSL8YgWzVFSVHsxnZtwE9zS7OGNlpfALUxkhjmyBu9pMUY/90
	 wvwGRvdzj03kvsTPKQWGyKgCO08N6j+e2YswjIhZY+1TEbgFegQI6C11mCya/BCBiNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008254;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=zwh9/RgZ9buOdjk59loExjfzNV3sTF0q3vmVzocq4s4=;
	b=ZH11vJJPGG2Jz9l8uor/b3nLgcYk8VQO5DtBp5+mU9UeTc1+UMPnx+HmARBNxhPsEMDz
	 i3URo5L5Uxm0zHDkrGuBrM1RyDHDe2HXlxxt6MEneAk3gnA8iJ5BMTgT/KiUa5IE7Tkir
	 WnaXxV2T2z9Lq2fSedsUwOqoeftZSULhsjBMt5d0dTtsfoTSKaMsQ3Sv9GsDFBA7FcuFl
	 v16rRfX1bx5ibEcI0TxFPZDm2NQPDPdqeizRGspup9sGGajIHZCtiqpmgRe+9Y5nd+6DF
	 YjDq/QmQvJf5KmIq/Lybn+khoYQbymR719rnmhM39LjThi7j/xqiT9iz3PztDn6+Jvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="Z/KD2fhY";
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE51606A320;
	Wed, 18 Nov 2026 13:24:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBE51606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Z/KD2fhY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=zw
	h9/RgZ9buOdjk59loExjfzNV3sTF0q3vmVzocq4s4=; b=Z/KD2fhYKnq15hooxe
	oyYpjPy5uboMD+Ew9TcPmGBYaH3qpszMNh0AtiMtwiwl0sUoCpfmjK/x6plj2U0U
	koC3opqAVSlcAvrq/xSQjL/tp170B9DNqAoTpLaGne4FvU4SZwAhqpKou6wiWxoa
	MN7OxURPPvWUXrlDxHjN89MiI=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3X0Tgpv1qlRFsIg--.36225S2;
	Wed, 18 Nov 2026 21:23:46 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: brgl@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org,
	quic_eberman@quicinc.com
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>
Subject: [PATCH] firmware: qcom: tzmem: Clean up SHM bridge on pool add failure
Date: Wed, 18 Nov 2026 21:23:43 +0800
Message-Id: <20261118132343.2350034-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3X0Tgpv1qlRFsIg--.36225S2
X-Coremail-Antispam: 1Uf129KBjvJXoWrtw4Uur1ktF45GFW3Ar45GFg_yoW8Jr4Dpa
	1UXrW7G3y8Wan7t347G3yrur95Jwn7trWYgry7Aa4F9w1fXr1Fyryjvr4fWFs8CF1vyr43
	tF4SgF18Xa4Ygr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEL0ehUUUUU=
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7QL7amr9puIGdAAA3f

If gen_pool_add_virt() fails after qcom_tzmem_init_area() succeeds,
qcom_tzmem_pool_add_memory() frees the DMA memory and area descriptor
but leaves the SHM bridge and its handle allocated.

Since the area has not been added to pool->areas, pool destruction
cannot reclaim these resources. Call qcom_tzmem_cleanup_area() before
freeing the DMA memory to delete the bridge and release its handle.

Fixes: f86c61498a57 ("firmware: qcom: tzmem: enable SHM Bridge support")
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/firmware/qcom/qcom_tzmem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index e1d944d0eb63..b2ca1d18bf3b 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -219,6 +219,7 @@ static int qcom_tzmem_pool_add_memory(struct qcom_tzmem_pool *pool,
 	ret = gen_pool_add_virt(pool->genpool, (unsigned long)area->vaddr,
 				(phys_addr_t)area->paddr, size, -1);
 	if (ret) {
+		qcom_tzmem_cleanup_area(area);
 		dma_free_coherent(qcom_tzmem_dev, area->size,
 				  area->vaddr, area->paddr);
 		return ret;
-- 
2.25.1

