Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D2541B8F9
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786973393; cv=none; b=QQ7PdJ4YtBwCvEaakRUPuV2hVV3z2q6ySQ2bYe38Pj/PKJJyfF6GD4sY/eL1pS64i3nPFidvkgGwIx886mGO7kygCaGcOtJLIJyU1wlZ/y9GY/pZDl+4Y+YyZCMkxWFPoeVgtBHfbdLxj+Ce8zJFN00jjUdM64hBuLSsKht9BhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786973393; c=relaxed/simple;
	bh=NqJsIisW4ZWzUKnnepVXnP+dRrUOckssRKfcriXotLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j1HxnEHShv7tbwfcXQSTLpaDAHC1PZhr6sSxfYpdfCWf6393IBOCrjpCw59yaeRRPzj0zehMSMBpdaOBE3Nu1HfcUx7EnH7OAYVPPYCAhYv0Q3ri6E5eMJCrrcwXSaH0eDmQxXNd9hBktBgcyMs8nbV3xRJ3igrkdesvCTgGL/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FySgVowI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FySgVowI"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD6IeW2395052
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:29:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MFNW5D83mbINc3PMBmmkg1hwMrPPrHy8ooL+syO4Cqk=; b=FySgVowItSU/RzO2
	fSeTH8uxoofBJRvEJGDmLBcDGj8LIlbQBpAY5MA+Q/y5/DoJFBdX2Z1lz0wI/zZD
	9fAChEAqgrCS33D0KGXJQbufn+edWyN/cI5Whgx6IXQrJqoPqbdWeTqp5zxX66eW
	AtetLWPjKblPaNUGdAAU5HoTQ/x+GgmJY6vqYFNJXgC/WdF3LFBUmha0ywWu9kog
	gzmIDNIg6fxcO5KxSqXXwGlCsSz/HlmGBK82kro9cgva9nhNFCbfteTfmoB/I2lO
	YodnRpDvYq3KvqM/NM9K+fPFd3m6Jov4ugcBO84r8SFidKvDtbZjIh5MhS5Xt7aZ
	ljXWPA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3txya14x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:29:50 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67HDTl3i000829;
	Mon, 17 Aug 2026 13:29:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 4g2h6jamds-1
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:29:47 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67HDTl2p000796
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:29:47 GMT
Received: from hu-ffaruque-hyd.qualcomm.com (hu-ffaruque-hyd.qualcomm.com [10.147.245.31])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 67HDTkmT000795;
	Mon, 17 Aug 2026 13:29:47 +0000 (GMT)
From: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 18:59:43 +0530
Subject: [PATCH 3/4] nvmem: provide consumer access to cell size metrics
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-pscrr-provider-v1-3-88a318c13d41@oss.qualcomm.com>
References: <20260817-pscrr-provider-v1-0-88a318c13d41@oss.qualcomm.com>
In-Reply-To: <20260817-pscrr-provider-v1-0-88a318c13d41@oss.qualcomm.com>
To: kernel@oss.qualcomm.com
Cc: avaneesh.dwivedi@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.15.2
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwMyBTYWx0ZWRfXzFI5O47ZWHmu
 77Z9kCnOkiUyxLs35PMTSKhxiBCG2MhMRMAJrCF9+YjMMuIKpNP0lSIpqIcR54Hlwxddp24wWwY
 n5Sg/Eh5lWhACP79Ia78AVboq0tGqHw=
X-Authority-Analysis: v=2.4 cv=auGCzyZV c=1 sm=1 tr=0 ts=6a830ccf cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=8iAkK7V-g8xI8jGQdaYA:9 a=QEXdDO2ut3YA:10
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwMyBTYWx0ZWRfXyDyYGSJ/ZmXo
 a4lbexjxJxwfH5zngYqZOlkKeKAYULViVz8q0gJfvx7T2uKRX/3NRDBfdPYwdFbkXrAwW+miXbq
 u7ewBKB3/0wBimNbli0pqrElIVp9i77RVTYy0arXDtMmbIkjSBl8/crgtjS8t1blQ1OZU41Tcm1
 /wEThk39UJOkbJ+GX/r+5cMem2xv2rXnP+o6r5CeUH0Nhote47GvLyemqSmrU4e9gmW5k2qWaL5
 1q/o4r1+y02s4vo/MWpfPGWRxQW4iHaHLIY7flCdrwWAIxLzWo9+tq7XmiVvaI4CPuKXzFBa5hc
 Bg/cKX6iypYTykY1T6YXXt/QbyP3erJGXOjR/Z0jDIcc48z+EhR90XNVDH1HJEG6xK6bk4dc79Z
 QGHnjBb/7g76E18NfHSNWfs/ghBvWbxr+jb2TGruj74nsnJZ1EISnPuXum159mllWhOo3xDDSLZ
 REmBp2qp4LN1Hd1LE+g==
X-Proofpoint-GUID: DMAtwyiO_rKOWExSkoT22DL2FI4Av81H
X-Proofpoint-ORIG-GUID: DMAtwyiO_rKOWExSkoT22DL2FI4Av81H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170103

Add nvmem_cell_get_size() to let a consumer query a cell's size before
reading or writing it. Without this, a consumer that assumes a fixed
cell size can pass nvmem_cell_write() a buffer larger than the cell,
which fails with an incorrect-size error instead of succeeding with
the cell's actual capacity.

Co-developed-by: Oleksij Rempel <o.rempel@pengutronix.de>
Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Link: https://lore.kernel.org/lkml/dixmyhyj6b66vyizfotpqw6yzaavi2o2mauloa5x6zn3qgk5ub@huoal5ucdd44/
Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
---
 drivers/nvmem/core.c           | 29 +++++++++++++++++++++++++++++
 include/linux/nvmem-consumer.h |  7 +++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 0556d140170a..49afcff4c72c 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -1790,6 +1790,35 @@ int nvmem_cell_write(struct nvmem_cell *cell, void *buf, size_t len)
 
 EXPORT_SYMBOL_GPL(nvmem_cell_write);
 
+/**
+ * nvmem_cell_get_size() - Retrieve the storage size of an NVMEM cell.
+ * @cell: Pointer to the NVMEM cell structure.
+ * @bytes: Optional pointer to store the cell size in bytes (can be NULL).
+ * @bits: Optional pointer to store the cell size in bits (can be NULL).
+ *
+ * This function allows consumers to retrieve the size of a specific NVMEM
+ * cell before performing read/write operations. It is useful for validating
+ * buffer sizes to prevent mismatched writes.
+ *
+ * Return: 0 on success or negative on failure.
+ */
+int nvmem_cell_get_size(struct nvmem_cell *cell, size_t *bytes, size_t *bits)
+{
+	struct nvmem_cell_entry *entry = cell->entry;
+
+	if (!entry->nvmem)
+		return -EINVAL;
+
+	if (bytes)
+		*bytes = entry->bytes;
+
+	if (bits)
+		*bits = entry->nbits;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(nvmem_cell_get_size);
+
 static int nvmem_cell_read_common(struct device *dev, const char *cell_id,
 				  void *val, size_t count)
 {
diff --git a/include/linux/nvmem-consumer.h b/include/linux/nvmem-consumer.h
index 34c0e58dfa26..bcb0e17e415d 100644
--- a/include/linux/nvmem-consumer.h
+++ b/include/linux/nvmem-consumer.h
@@ -56,6 +56,7 @@ void nvmem_cell_put(struct nvmem_cell *cell);
 void devm_nvmem_cell_put(struct device *dev, struct nvmem_cell *cell);
 void *nvmem_cell_read(struct nvmem_cell *cell, size_t *len);
 int nvmem_cell_write(struct nvmem_cell *cell, void *buf, size_t len);
+int nvmem_cell_get_size(struct nvmem_cell *cell, size_t *bytes, size_t *bits);
 int nvmem_cell_read_u8(struct device *dev, const char *cell_id, u8 *val);
 int nvmem_cell_read_u16(struct device *dev, const char *cell_id, u16 *val);
 int nvmem_cell_read_u32(struct device *dev, const char *cell_id, u32 *val);
@@ -128,6 +129,12 @@ static inline int nvmem_cell_write(struct nvmem_cell *cell,
 	return -EOPNOTSUPP;
 }
 
+static inline int nvmem_cell_get_size(struct nvmem_cell *cell, size_t *bytes,
+				      size_t *bits)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline int nvmem_cell_read_u8(struct device *dev,
 				     const char *cell_id, u8 *val)
 {

-- 
2.34.1

