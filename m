Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795614691;
	b=JBx2R09F3OVaA/GBzNXB6v9L854ShO0oclIadBXCI+sqfhY9U5VPU20fGjLnZZgbDI4o
	 YTwTO34Ln1rQrpBsB6run/RZuYMq2qfIDHJCqZuLGJqvBHlviLvN21oEYXZYHx46YmNsT
	 542kKaZUIlQN/2kkJTiYsTkg7g9LW3E04eAptFtiUzio3Ur3isJekP0vBArV3z0NxzB+f
	 1LowlCRTxY6RFtiTTvQ7Htch0WAQhfFqKGTzA3BMRjgOke1HdZd7+wrcjzS6J0g8SNB3z
	 U/TFv7zIURHkljS9JLuVpKAn90eNHkk9fnPIOIv6Iy4MbPw/Ty+E4zOzGf0vQ1pJsow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614691;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FKKsaX0iLIihjEs0HiQH6IuZ/cox9XgvibcPxadi8NA=;
	b=ZLbQdProdLcHKX/7RLX3Vomc17vj2I/TVn8EHGS/NaDZcxrrO3Z6qPgZQo/E7RBezWyH
	 /ed8r/jR3U3SDQj/xsieS9XooPgigWJrIUq3Mkv578CboKhyz5S30sqDRc0jecjwe37J4
	 8CI9SB49t0nAApKeteuUFhjy6GTgvT/DWH0SO6SvCKelm0Mw8GgXMs/ngfR9gEOXat/0F
	 guqM6Gk61AHAyn9OIhuOT4Q4j1ty9VPUsRoRatRKtwqJCxEoe2OjLaGHy5VTZPgqlbEYe
	 jxHJejqA/ODN0CjjRsvBW4KydShUPvm1B6RFO4ie28MNGWE117eD/v7gQb0I2PQsE6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mrw8qz7V;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iqfKqobk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C31C606A323
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C31C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mrw8qz7V;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iqfKqobk
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mopA3611866
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:51:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FKKsaX0iLIihjEs0HiQH6IuZ/cox9Xgvibc
	Pxadi8NA=; b=mrw8qz7VJsviWHPggc/MnckouP9kLpy4wM3ID+zbWiqixOTp9nB
	R6rYFdgJCd1Pu0BinrYzcN31/dtipILpujVSHGRhtAuJR7rBtdfDbStVM7y/04YT
	Xix0uBww7/A4TP4BZ3kxIexEFYKm+9+3w/75QZIq57/GuH++L3ZkHgQKPUp5nfxT
	VJ3OBYR+jVJ/vLPij9tNhMFkhQbMV3QUC2SN0Tg0ylUiKKR2u4UCOCgDtxKEPNqH
	YOoa3rhzMxBFKo6qWAGwCn1qtxwxgT0Xg1py6LQE7h+6pvIPrcBA9SLo+VbhGAim
	fyNsHdn8EykbBNalgqVaqhSKC8IdZI/WcPg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnsbwg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:51:29 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd652c0385bso4034117a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 05:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795614689; x=1796219489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FKKsaX0iLIihjEs0HiQH6IuZ/cox9XgvibcPxadi8NA=;
        b=iqfKqobk/Yp6Bmf8H4atA8P5eP6wfbUCvE+QGuEiCKLZl+jtjpyYQffg/mWCxGsswe
         6dZxyPWfo3OqaCQZAyGX3oHKQ1ufnVZvHSVJWwNmPkG54U/ygCeCRGIN/CcxwlR3+DpB
         SGQJFzNDYQukwBIJRMoZO4fRNhwzjjTUBG67VuZ7jD6elWRIaTp7CrqoR/OyrM0z9MFd
         ZMvy6WcWtRIi98RMl8YJGbpqHg9YQjk8oUhAJFMsVa/TfMbgywYzJ88usBVhtHpPD2DM
         24KV7Y8BlDqvjxjYKJI5gYR1pGLmhAQ3B9uciN5aEVgEIKyj6sqRLYggP/pFVgTEfrcM
         nO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795614689; x=1796219489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKKsaX0iLIihjEs0HiQH6IuZ/cox9XgvibcPxadi8NA=;
        b=OmRA3gUQ5sWoSbFkQVMoew6+UsnlnUojs1nFilvZeVQF7u3J7/4hRqML+RFGJQYusT
         1syLt22ZLpCKGLF2oZ5BW6l/cnKSaFGNVnmENg60zj2Ydays8UefkfVlDR02s/E8eTGc
         k4x4CnaAhh4uKzS0+nUsLxVS4Jc1yhtVE5gCupTw5Ds8XrONZKTdoIoWYNW0O1554sGG
         KQqCtWhRkQXsWxkmnQPrAbI05ty4t3t2a5HqtPTbNYPwUH3zBmbv61PSBpX9Q5MYtp1Z
         L06KzuYkOW4f4J9yf+ijBEU/keXB62jzdWYesi5db+uCZYfcWT52h79BqcZJ67IvvzeE
         ktvQ==
X-Forwarded-Encrypted: i=1; AL+hErFZ0a1b6oMhsrBgqFiWJEbho6DSOiy+MjN8G3+qF202zzlpPMHgkQE5nd3+rqVHIWgQSnojyliKG0j4iPI4@vger.kernel.org
X-Gm-Message-State: APuU4Z8pem9G67cIWl4nkW9oEzMmcYwM/fxlQq4JZKI5LhDAtDzEUhfi
	fcjJf5DZHxB7c30lXpnFyfAu1YLJcTM92KeUU3btWtc6W/JzMK68SGKPVFp4SklDIHbMflz04SV
	tLSyhKuhQC/ElbN1Gjw3m2zsb07qpPYjE/URaGvbVYQAAOV9hKZm001IVMZOnPiWTeRGz
X-Gm-Gg: AZFdTZdArThJgiJZFmLPEf/VUc6tmbcf1oNIfAvUrgUUbMgSDkVXisgEGrBEXy6J419
	Br5YQTJVo+oWjZOny2xe2e7+A+0KRmRXh9CozpRqqTudS5RFCt5UBojc4u1IcT6xFSWCxAxZD+a
	phkbkf+cQJJaFh2OH8jeGykC5Yo3KHHarxnTBoqYvEcPxeInAZi86NFzTnamcl7dVH1SPDw2Nd7
	mpBpCaknipcjaqc6wUfqvwZkqEqXd44g6AImk+PfouLNOd5WxAH8Lke6psEgAbCTL73Myawqa11
	ybjj5+Qv2Dqg5QyEdOiuFKyq7XWPKyuyBqURHL3mzGwcDM88X7NaX0381pRVVSFGZqSuIHFubgz
	/Mh00lpFzT2HhD5lfxGnld7M/ska2duIp1E26qLiank5KtQ8In4PRQT6Ds1KvQ+yg3D1sBx/rJJ
	Sm4qtW8+U7Iz9wFn7zXVOGFHKegUhhZmCUQRsCpnee++zF2miNjA009yzu/OBp6fID
X-Received: by 2002:a17:90a:e705:b0:3b4:fa3:36de with SMTP id 98e67ed59e1d1-3b41c9750e2mr15507410a91.51.1795614688862;
        Wed, 25 Nov 2026 05:51:28 -0800 (PST)
X-Received: by 2002:a17:90a:e705:b0:3b4:fa3:36de with SMTP id 98e67ed59e1d1-3b41c9750e2mr15507383a91.51.1795614688084;
        Wed, 25 Nov 2026 05:51:28 -0800 (PST)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm27710815a91.4.2026.11.25.05.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:51:27 -0800 (PST)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: will@kernel.org, robin.murphy@arm.com, m.szyprowski@samsung.com,
        honghuan@amd.com
Cc: joro@8bytes.org, prakash.gupta@oss.qualcomm.com, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH] Revert "iommu/dma: simplify dma_iova_destroy() and drop the free_iova helper"
Date: Wed, 25 Nov 2026 19:21:20 +0530
Message-Id: <20261125135120.1126571-1-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-GUID: rK2pWmirVUEDMh0TQVAWccJ2SygQ29NX
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b06e7e1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=cR5wH3shGYeZUv4u9kAA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1NSBTYWx0ZWRfX0+ohmG800vxg
 89GneMN1ksoVVKvNyFGtrHaYyXIKIOxXinX7Mt0bdQNCj3lnD8MJI0J2IohCwUut24omThPEvdR
 Of6t7VeCmLyX+Z27wyG4EWbZ0SeKbO4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1NSBTYWx0ZWRfXz/t+t1yS57p3
 HOJwGFiaNNxRCfM/lKgxM6y0uPmd9KGVp7s+4RSHMe/5ZDbuVIpsqmUrjXbmekwWu2pezz5AjJY
 USfGgwKZPgj7utEqL/BcDzu88tV1hSng8b4vNmUszTtVnppSMpyv42qEgiSmQSmqn1NiRrW+2GS
 +c54nctpbLqm1CZbcIguWVCed+pT0yuzC1WiyUlu1EEaqrxZvGc6jsjLFLRdho1uJ5mUS7PUd5R
 upLwQa8duHVGP+TLYol02VcfoKaYCgkTPm/yfJeXjFRoL7Mk+X6a2WMFV4EyPfS2mz8jugaKamq
 uDefRK2yeB/107v0n4Xq5v4ri5j33iGU3HRBr024Iow9cO14GAFsPRTZnrOxybPEcSlcq6D4Qkr
 aavYPmdYLg+TIBzJKEM99qr5DysEpmE7zgU15f6jeAXnqSYB9RwcUo+UNeLvnwKY8mvpz6eqOPK
 iHZtERoiYrmhs0kvCpg==
X-Proofpoint-ORIG-GUID: rK2pWmirVUEDMh0TQVAWccJ2SygQ29NX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250055

This reverts commit 1acce29926d93f3eba427696fe3da6451504dae2.

Before this commit, dma_iova_destroy() unmapped through
__iommu_dma_iova_unlink(..., free_iova=true), which set
iotlb_gather.queued from cookie->fq_domain, skipped iommu_iotlb_sync()
and freed the IOVA with the queued gather, exactly like
__iommu_dma_unmap(). After it, dma_iova_destroy() calls
dma_iova_unlink() and then dma_iova_free():

  - dma_iova_unlink() never marks its gather as queued and always calls
    iommu_iotlb_sync() after iommu_unmap_fast().
  - dma_iova_free() passes a NULL gather to iommu_dma_free_iova(), so
    the IOVA goes straight back to the allocator through
    free_iova_fast() and never through queue_iova().

DMA-FQ domains therefore get strict invalidation on this path. That
includes the block layer's blk_rq_dma_map() path, which NVMe uses for
all data transfers, so iommu.strict=0 has no effect on NVMe I/O.

hw/sw details: Qualcomm Glymur CRD: SMMUv3 with no RANGE_INV,
	       4K pages; NVMe SSD on PCIe Gen5 x4

Fio sequential read/write numbers:
  Domain                          seq write    seq read
  DMA (strict)                    2694 MiB/s   2693 MiB/s
  DMA-FQ (lazy), flush queue      2707 MiB/s   2803 MiB/s
    bypassed (this regression)
  DMA-FQ (lazy), flush queue      10.6 GiB/s   11.9 GiB/s
    used by dma_iova_destroy()

Fixes: 1acce29926d9 ("iommu/dma: simplify dma_iova_destroy() and drop the free_iova helper")
Cc: stable@vger.kernel.org # v7.3+
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 drivers/iommu/dma-iommu.c | 57 ++++++++++++++++++++++++---------------
 1 file changed, 35 insertions(+), 22 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index b66e83cfbc5f..e71a10e14c36 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -2101,20 +2101,10 @@ static void iommu_dma_iova_unlink_range_slow(struct device *dev,
 		arch_sync_dma_flush();
 }
 
-/**
- * dma_iova_unlink - Unlink a range of IOVA space
- * @dev: DMA device
- * @state: IOVA state
- * @offset: offset into the IOVA state to unlink
- * @size: size of the buffer
- * @dir: DMA direction
- * @attrs: attributes of mapping properties
- *
- * Unlink a range of IOVA space for the given IOVA state.
- */
-void dma_iova_unlink(struct device *dev, struct dma_iova_state *state,
-		size_t offset, size_t size, enum dma_data_direction dir,
-		unsigned long attrs)
+static void __iommu_dma_iova_unlink(struct device *dev,
+		struct dma_iova_state *state, size_t offset, size_t size,
+		enum dma_data_direction dir, unsigned long attrs,
+		bool free_iova)
 {
 	struct iommu_domain *domain = iommu_get_dma_domain(dev);
 	struct iommu_dma_cookie *cookie = domain->iova_cookie;
@@ -2130,13 +2120,35 @@ void dma_iova_unlink(struct device *dev, struct dma_iova_state *state,
 		iommu_dma_iova_unlink_range_slow(dev, addr, size, dir, attrs);
 
 	iommu_iotlb_gather_init(&iotlb_gather);
+	iotlb_gather.queued = free_iova && READ_ONCE(cookie->fq_domain);
 
 	size = iova_align(iovad, size + iova_start_pad);
 	addr -= iova_start_pad;
 	unmapped = iommu_unmap_fast(domain, addr, size, &iotlb_gather);
 	WARN_ON(unmapped != size);
 
-	iommu_iotlb_sync(domain, &iotlb_gather);
+	if (!iotlb_gather.queued)
+		iommu_iotlb_sync(domain, &iotlb_gather);
+	if (free_iova)
+		iommu_dma_free_iova(domain, addr, size, &iotlb_gather);
+}
+
+/**
+ * dma_iova_unlink - Unlink a range of IOVA space
+ * @dev: DMA device
+ * @state: IOVA state
+ * @offset: offset into the IOVA state to unlink
+ * @size: size of the buffer
+ * @dir: DMA direction
+ * @attrs: attributes of mapping properties
+ *
+ * Unlink a range of IOVA space for the given IOVA state.
+ */
+void dma_iova_unlink(struct device *dev, struct dma_iova_state *state,
+		size_t offset, size_t size, enum dma_data_direction dir,
+		unsigned long attrs)
+{
+	 __iommu_dma_iova_unlink(dev, state, offset, size, dir, attrs, false);
 }
 EXPORT_SYMBOL_GPL(dma_iova_unlink);
 
@@ -2157,13 +2169,14 @@ void dma_iova_destroy(struct device *dev, struct dma_iova_state *state,
 		unsigned long attrs)
 {
 	if (mapped_len)
-		dma_iova_unlink(dev, state, 0, mapped_len, dir, attrs);
-
-	/*
-	 * We can be here if the first call to dma_iova_link() failed and
-	 * there is nothing to unlink, so let's be more clear.
-	 */
-	dma_iova_free(dev, state);
+		__iommu_dma_iova_unlink(dev, state, 0, mapped_len, dir, attrs,
+				true);
+	else
+		/*
+		 * We can be here if first call to dma_iova_link() failed and
+		 * there is nothing to unlink, so let's be more clear.
+		 */
+		dma_iova_free(dev, state);
 }
 EXPORT_SYMBOL_GPL(dma_iova_destroy);
 
-- 
2.34.1

