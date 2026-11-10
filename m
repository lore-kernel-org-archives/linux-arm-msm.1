Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328762;
	b=0l8owUvLp/dM/euy63wI8PfmgX+8nq+zNIY35tCre00+Uyp/xtBLCtsWzVxIxiUZohM7
	 aJlVs589kZwhxY0pMFKeC2IjHs9p4c1vuyN5J50NiX6sn2lub1240+37RunKbJST1InrP
	 a0iNi36l96Pffae91qk78YYOsRkqUAASDWbdfGyfYmaFvpvh+fbeBJnqQFpwTebG0V+gd
	 zxEbimPkHzFOweY6aA1wowuYCTDxHZcK/6AyE2+2n/WHLw/k33naPllOophNEFQ0qbzJY
	 a9Fbr2aFBNImmkVKJyZBM/dkcCSw2TAASzk24hRHD/mch32xBWvWyUROLMWOZV5ZIMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328762;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VJiVHhGRcwV/rD/F4p3bmkosbUsG62dv3yDIyyclfPI=;
	b=EsXWFZQf5heZVvm/Puo/fjfKRl4mUfXvGAOfTOzsE9VWDtHXkrL+S9iX6KdJQ7YhKxaD
	 +QlP7S3MgjhyM+3UZK77OfSj/BVTDZjAq0ASZxJ40QSGG5MGCVaA1Npf85dkFsCmj22wQ
	 0MyPB62USz/relJRyHd70yMvXN10xRziB6u2F8l5onIqbKd3s0zVnxjgZ38BBAr5MpnR/
	 Dvzw45TakNUhZ5FO1Kh7vZ9dvwzDJeLJ5rAjkqQd+2u/CMQEGclW8ujDfFLR1Z0bjHFzu
	 P5ZaWk13RBQZquBcyKmLxP7Lyrx53EEjz3hYjR9H+S6VBTx24wX/w+zlDaJoAs0pdvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JhGSG7BL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OIPQ0FrO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE730606A89E
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 16:39:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE730606A89E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JhGSG7BL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OIPQ0FrO
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF0Hnv151624
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 16:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VJiVHhGRcwV
	/rD/F4p3bmkosbUsG62dv3yDIyyclfPI=; b=JhGSG7BLDJq4ohUZrZ6dKIwwTC8
	T5GVtlb5c7lbdevV/rGYRjd/M6Nv1VLvGZUmKDrESRYPq11iPXHejxBkTI8az+C2
	TBsIh9JenICZKncyTqJifHCfD/Aoh7nSYsuV6ztkfX69sojom0mTrVoPfE75Cf/i
	FJpKM+OBm2PENk1cP8Ipl20GxH1iMotmutYX4/x97GisI8XGi3cWPHA2pUh3oOZ8
	iJiWcX00VB6CZffuh66aj1fKHwHSFfAmTU3Yg0ZkQc8/41olZlRGUT1m4VDAkrkO
	/h09xlofaSil13yLovqmU5b5zlXCgMHcU6clNCpCuR0wWTd6lEFIKGlCmTA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv4pv8nqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 16:39:20 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9905fc56b60so1740046241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 08:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794328760; x=1794933560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VJiVHhGRcwV/rD/F4p3bmkosbUsG62dv3yDIyyclfPI=;
        b=OIPQ0FrOMrQx6LS9rKSvXiZ/aFDerQQI9xF5RQo9B0YAkm2QDUWiRFqhRDzRWavWTA
         oQSX5oRwk5V7KK4NfdiQy7WD6vKYwAhdRF5JnXtaVHjcBkeaPWOV/3ez5mCXlPYDVjdY
         YV1oc+90pvRuphYAFqFzfFXHtPR+fOIu0G7IHwGb0gGu+PqfaNgHEq0kRtvdDxsuDwf1
         OcrUYflQ1NYK7THkMjI9Ok8+8s+6aEeVhekMYNQnL8skdseVLcj8EJ2gOLoa8J4yMx6f
         JMD6Pl/j74msfqvUZAPiLSm6ZBIZg1DLUgPHpEfO5hW6Glcr5zY9vjTWOWCTr3zDvQAF
         vR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328760; x=1794933560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VJiVHhGRcwV/rD/F4p3bmkosbUsG62dv3yDIyyclfPI=;
        b=oLEr3fAj8lAvjF1NvWHbpkeLPk8zABdosINkz+57vddOO/731QOXzm31ElpAMSpbsW
         CEpV4v0kAIQHYTt7SjDlP3dNAqnOIuBmUnc2NZ1ux1eA4H4AuKeMwW6mLJzhNKJGmb/3
         J45/XSY0cHoyp4MgMxehgjOjYR1rWR+iOakPwr4dhe8qOrCR5NYdFndxr8gvvg/3KYXU
         T9MfDiZCW6O/swbpA5/OYefDy1850n5Pe8c89qgbtdSjmNXQtunFvf4bNL6fI/xZG4zi
         8zin0B4xlruTuAne7blkMJRisBU3kN7gFNJQaZ6bGmWsk47KEC51p4C/DRz01FCx7XfV
         07Xg==
X-Forwarded-Encrypted: i=1; AL+hErGpH8d7msaqritVo4Xu1U0Wk/G1i7njlXcdChgQAdYcyOXi4pJp0x1SKgvvKJpajwd2wcUCgcWniNfeCJZZ@vger.kernel.org
X-Gm-Message-State: APuU4Z/dSMGeDDP2FxzRTSU1TmNEQjD0zshJwpoLG6rRpt8iRTIeD4x3
	1PMIMQBr/Rvx6HHSmjIAGd4/u3wctIqNN85M3QMp+06fzy308qGtm+R6yYjcQAiXQWkGp6d/04t
	7tEjEbUHSqm8CygivmdRewq9z0pqHT2L7sTEyeM1eIHAJhOYrMtx1Ol7olHEz8lz0OL2a
X-Gm-Gg: AYBFou0omtOn4OsqC8eFevrOJAUF6BSjnnIMqzHhNk0nD6v7mbhGyhgntUV/NWj9vPk
	8vTVpJ0hC5I0IoWETNaLzrdv/ZtTCCP1Bqm7uhGuXRqboJnTBPi/5b+r52cwuJlYgHiLglLkiFt
	9n8XGUCB9vSVMai3bft9PdSaUhUfbW9LXHDOxud682+Cj990OYxmGO8X8ghdlgRIwFbGE3ReaPq
	fI8zT2QSnOIacZx7d8fl2bacITOrNmCo/YEzLcnZFGi5zENtIjR7YONnXnyNojpKYxOYO26PIop
	IkD+wwH/e9UiKH0SBRvOtVmBnYkKg7ICA/kZggCFxoB1h0xKdvgjQEFr0TlmPJei9+o0jhxo5Mx
	S4wRzHZbdFq5fBZeSjYEO7HGjdkiROLAjajVYJXvyB7+xJWW4RrPpZKLrzXhphP5UoRsI6BXyMg
	==
X-Received: by 2002:a05:6102:290b:b0:7b9:5abb:eb17 with SMTP id ada2fe7eead31-7d494cdfadbmr19315137.3.1794328759873;
        Tue, 10 Nov 2026 08:39:19 -0800 (PST)
X-Received: by 2002:a05:6102:290b:b0:7b9:5abb:eb17 with SMTP id ada2fe7eead31-7d494cdfadbmr19306137.3.1794328759300;
        Tue, 10 Nov 2026 08:39:19 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01ff3428sm85130395e9.15.2026.11.10.08.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:39:18 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v8 3/8] media: v4l2-jpeg: Add a baseline JPEG header writer
Date: Tue, 10 Nov 2026 18:39:04 +0200
Message-Id: <20261110163909.78085-4-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=XqZvqlF9 c=1 sm=1 tr=0 ts=6af348b8 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=uaGMt4ufPnOKGkpinpYA:9 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: ad292BtgOKGoHiXut1bWngO-9TcmAbc-
X-Proofpoint-GUID: ad292BtgOKGoHiXut1bWngO-9TcmAbc-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfX21crApUvoyf3
 6Tn1OaMvh+c4n31kS0Znit6rILCqPWoMMOwoGz3z8z0rAn3LMvOaPgXObrShBuaJT3mtjrTdQKK
 e+p5ajlsMnpFZlug80dNz7Ai4vClO3Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfXwUNTpIN0A5kF
 QoyRTZol4hg365yORdwDFVFXYNRCAu8Eo3/qp8zqb0yH6v1/IWlYOU5T8eUAVa0UClFaUX5uR8H
 PaGrylF+M4alOQNMN5xHFyV7LINQ45Vo8XF0thTiHNT70Wx18oOTwUpMEGpE5GR/wz6QyL1Z70S
 EdcXOlBuLUEedc+EhAlhCBwt4UK+QD9z99Qm3yf34DDS6zbWqqI9zAxMXPwERLJ81JY7taap534
 dOieq6M/DobcI5wEcuuM1ps33gNFaGNFplD7QpTtBPEGM5c0kqlNGs+wr8PFR+s7rMauX1nLCJM
 P39dTxOtnhqBxXkIlg8eNOwkxO4d+OpPdZLhIMQ9X08E5Gam7xPL7a5xJ2JzN+Ka75ibB/6eGHG
 /zt82V3lGuPiaz3rrRZOwbgfEjqomFQJjLE86xmwMYdfH5bALg1Axgq2tG12yHZeTI94KH37+mu
 l5kA85OyVYdUYFQ3fVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100066

Several V4L2 JPEG encoder drivers build the JPEG header in the driver
from a fixed template and patch the image size and quantization tables
for each frame. Add v4l2_jpeg_write_header() for the baseline case: it
writes SOI, an optional JFIF APP0, one DQT segment per table, SOF0, the
ITU-T T.81 Annex K reference Huffman tables in one DHT segment and SOS,
and returns the offsets of the fields set per frame. Add
v4l2_jpeg_hdr_set_size() to set the image size in such a header.

The field values come from media/jpeg.h, so the driver keeps only the
hardware specifics.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-jpeg.c | 165 ++++++++++++++++++++++++++++
 include/media/v4l2-jpeg.h           |  31 ++++++
 2 files changed, 196 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-jpeg.c b/drivers/media/v4l2-core/v4l2-jpeg.c
index 36a0f1a1b0d97..f466dc6a457de 100644
--- a/drivers/media/v4l2-core/v4l2-jpeg.c
+++ b/drivers/media/v4l2-core/v4l2-jpeg.c
@@ -13,7 +13,10 @@
 #include <linux/errno.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/stddef.h>
+#include <linux/string.h>
 #include <linux/types.h>
+#include <media/jpeg.h>
 #include <media/v4l2-jpeg.h>
 
 MODULE_DESCRIPTION("V4L2 JPEG header parser helpers");
@@ -711,3 +714,165 @@ int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out)
 	return marker;
 }
 EXPORT_SYMBOL_GPL(v4l2_jpeg_parse_header);
+
+/* baseline JPEG header writer */
+
+/* Segment length of a header struct: the marker is not counted */
+#define JPEG_SEG_LEN(hdr)	(sizeof(struct hdr) - offsetof(struct jpeg_seg_hdr, length))
+
+struct jpeg_hdr_buf {
+	u8 *buf;
+	size_t len;
+	size_t pos;
+};
+
+/* Writes past the end only advance pos; v4l2_jpeg_write_header() checks it */
+static void jpeg_put_bytes(struct jpeg_hdr_buf *b, const void *src, size_t n)
+{
+	if (b->pos + n <= b->len) {
+		if (src)
+			memcpy(b->buf + b->pos, src, n);
+		else
+			memset(b->buf + b->pos, 0, n);
+	}
+	b->pos += n;
+}
+
+static void jpeg_put_u8(struct jpeg_hdr_buf *b, u8 val)
+{
+	jpeg_put_bytes(b, &val, 1);
+}
+
+static void jpeg_put_be16(struct jpeg_hdr_buf *b, u16 val)
+{
+	u8 data[2] = { val >> 8, val & 0xff };
+
+	jpeg_put_bytes(b, data, sizeof(data));
+}
+
+static void jpeg_put_dht(struct jpeg_hdr_buf *b, u8 class_id, const u8 *table, size_t len)
+{
+	jpeg_put_u8(b, class_id);
+	jpeg_put_bytes(b, table, len);
+}
+
+/**
+ * v4l2_jpeg_write_header - write a baseline JPEG header
+ * @buf: destination buffer
+ * @len: length of the destination buffer
+ * @params: header parameters
+ * @layout: returns the header size and the offsets of the fields set per frame
+ *
+ * Writes SOI, an optional JFIF APP0, one DQT segment per quantization table,
+ * SOF0, one DHT segment with the reference Huffman tables of ITU-T.81 Annex K
+ * and SOS. Width, height and the quantization table values are written as
+ * zero; set them with v4l2_jpeg_hdr_set_size() and through the
+ * @layout->dqt_offset offsets.
+ *
+ * Returns 0 on success, -EINVAL for an unsupported number of components or
+ * -ENOSPC if @buf is too small.
+ */
+int v4l2_jpeg_write_header(void *buf, size_t len, const struct v4l2_jpeg_hdr_params *params,
+			   struct v4l2_jpeg_hdr_layout *layout)
+{
+	static const u8 jfif[] = {
+		'J', 'F', 'I', 'F', JFIF_IDENT_TERM,
+		JFIF_VERSION_MAJOR, JFIF_VERSION_MINOR,
+		JFIF_UNITS_NONE,
+		JFIF_DENSITY_HI, JFIF_DENSITY_LO,	/* X density */
+		JFIF_DENSITY_HI, JFIF_DENSITY_LO,	/* Y density */
+		JFIF_THUMBNAIL_SIZE, JFIF_THUMBNAIL_SIZE,
+	};
+	struct jpeg_hdr_buf b = { .buf = buf, .len = len };
+	unsigned int nc = params->num_components;
+	unsigned int ntables = nc == JPEG_COMP_MONO ? 1 : 2;
+	unsigned int i;
+
+	if (nc != JPEG_COMP_MONO && nc != JPEG_COMP_COLOR)
+		return -EINVAL;
+
+	memset(layout, 0, sizeof(*layout));
+
+	jpeg_put_be16(&b, SOI);
+
+	if (params->jfif) {
+		jpeg_put_be16(&b, APP0);
+		jpeg_put_be16(&b, sizeof(__be16) + sizeof(jfif));
+		jpeg_put_bytes(&b, jfif, sizeof(jfif));
+	}
+
+	/* one 8-bit table per segment, luma Tq 0, chroma Tq 1 */
+	for (i = 0; i < ntables; i++) {
+		jpeg_put_be16(&b, DQT);
+		/* length field, Pq/Tq byte, table */
+		jpeg_put_be16(&b, sizeof(__be16) + sizeof(u8) + V4L2_JPEG_PIXELS_IN_BLOCK);
+		jpeg_put_u8(&b, i ? JPEG_QTABLE_CHROMA : JPEG_QTABLE_LUMA);
+		layout->dqt_offset[i] = b.pos;
+		jpeg_put_bytes(&b, NULL, V4L2_JPEG_PIXELS_IN_BLOCK);
+	}
+
+	layout->sof_offset = b.pos;
+	jpeg_put_be16(&b, SOF0);
+	jpeg_put_be16(&b, JPEG_SEG_LEN(jpeg_sof_hdr) + nc * sizeof(struct jpeg_sof_comp));
+	jpeg_put_u8(&b, JPEG_SAMPLE_PRECISION_BITS);
+	jpeg_put_be16(&b, 0);		/* height */
+	jpeg_put_be16(&b, 0);		/* width */
+	jpeg_put_u8(&b, nc);
+	for (i = 0; i < nc; i++) {
+		jpeg_put_u8(&b, i + 1);
+		jpeg_put_u8(&b, i ? JPEG_SAMPLING_H1V1 : params->luma_sampling);
+		jpeg_put_u8(&b, i ? JPEG_QTABLE_CHROMA : JPEG_QTABLE_LUMA);
+	}
+
+	jpeg_put_be16(&b, DHT);
+	/* length field, then per table class a Tc/Th byte and the DC and AC tables */
+	jpeg_put_be16(&b, sizeof(__be16) + ntables * (2 * sizeof(u8) + V4L2_JPEG_REF_HT_DC_LEN +
+						      V4L2_JPEG_REF_HT_AC_LEN));
+	jpeg_put_dht(&b, V4L2_JPEG_LUM_HT | V4L2_JPEG_DC_HT, v4l2_jpeg_ref_table_luma_dc_ht,
+		     V4L2_JPEG_REF_HT_DC_LEN);
+	jpeg_put_dht(&b, V4L2_JPEG_LUM_HT | V4L2_JPEG_AC_HT, v4l2_jpeg_ref_table_luma_ac_ht,
+		     V4L2_JPEG_REF_HT_AC_LEN);
+	if (nc == JPEG_COMP_COLOR) {
+		jpeg_put_dht(&b, V4L2_JPEG_CHR_HT | V4L2_JPEG_DC_HT,
+			     v4l2_jpeg_ref_table_chroma_dc_ht, V4L2_JPEG_REF_HT_DC_LEN);
+		jpeg_put_dht(&b, V4L2_JPEG_CHR_HT | V4L2_JPEG_AC_HT,
+			     v4l2_jpeg_ref_table_chroma_ac_ht, V4L2_JPEG_REF_HT_AC_LEN);
+	}
+
+	jpeg_put_be16(&b, SOS);
+	jpeg_put_be16(&b, JPEG_SEG_LEN(jpeg_sos_hdr) + nc * sizeof(struct jpeg_sos_comp) +
+		      sizeof(struct jpeg_sos_tail));
+	jpeg_put_u8(&b, nc);
+	for (i = 0; i < nc; i++) {
+		jpeg_put_u8(&b, i + 1);
+		jpeg_put_u8(&b, i ? JPEG_TABLE_SEL_CHROMA : JPEG_TABLE_SEL_LUMA);
+	}
+	jpeg_put_u8(&b, JPEG_SPECTRAL_START);
+	jpeg_put_u8(&b, JPEG_SPECTRAL_END);
+	jpeg_put_u8(&b, JPEG_APPROX_HIGH_LOW);
+
+	if (b.pos > len)
+		return -ENOSPC;
+
+	layout->size = b.pos;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_jpeg_write_header);
+
+/**
+ * v4l2_jpeg_hdr_set_size - set the image size in a header from v4l2_jpeg_write_header()
+ * @buf: header buffer
+ * @layout: layout returned by v4l2_jpeg_write_header()
+ * @width: image width
+ * @height: image height
+ */
+void v4l2_jpeg_hdr_set_size(void *buf, const struct v4l2_jpeg_hdr_layout *layout, u16 width,
+			    u16 height)
+{
+	u8 *sof = (u8 *)buf + layout->sof_offset;
+
+	put_unaligned_be16(height, sof + offsetof(struct jpeg_sof_hdr, height));
+	put_unaligned_be16(width, sof + offsetof(struct jpeg_sof_hdr, width));
+}
+EXPORT_SYMBOL_GPL(v4l2_jpeg_hdr_set_size);
diff --git a/include/media/v4l2-jpeg.h b/include/media/v4l2-jpeg.h
index 62dda1560275a..d789ccfeba734 100644
--- a/include/media/v4l2-jpeg.h
+++ b/include/media/v4l2-jpeg.h
@@ -167,8 +167,39 @@ struct v4l2_jpeg_header {
 	enum v4l2_jpeg_app14_tf app14_tf;
 };
 
+/**
+ * struct v4l2_jpeg_hdr_params - baseline JPEG header parameters
+ * @num_components: number of color components, 1 (grey) or 3 (YCbCr)
+ * @luma_sampling: luma horizontal and vertical sampling factors, as in the
+ *	SOF0 component specification (0x11, 0x21 or 0x22); chroma uses 0x11
+ * @jfif: emit a JFIF APP0 segment after SOI
+ */
+struct v4l2_jpeg_hdr_params {
+	u8 num_components;
+	u8 luma_sampling;
+	bool jfif;
+};
+
+/**
+ * struct v4l2_jpeg_hdr_layout - offsets of the fields set per frame
+ * @size: header size in bytes
+ * @sof_offset: offset of the SOF0 marker
+ * @dqt_offset: offset of the luma and chroma quantization table values
+ *	(V4L2_JPEG_PIXELS_IN_BLOCK bytes in zigzag order), 0 if not present
+ */
+struct v4l2_jpeg_hdr_layout {
+	u32 size;
+	u32 sof_offset;
+	u32 dqt_offset[2];
+};
+
 int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out);
 
+int v4l2_jpeg_write_header(void *buf, size_t len, const struct v4l2_jpeg_hdr_params *params,
+			   struct v4l2_jpeg_hdr_layout *layout);
+void v4l2_jpeg_hdr_set_size(void *buf, const struct v4l2_jpeg_hdr_layout *layout, u16 width,
+			    u16 height);
+
 extern const u8 v4l2_jpeg_zigzag_scan_index[V4L2_JPEG_PIXELS_IN_BLOCK];
 extern const u8 v4l2_jpeg_ref_table_luma_qt[V4L2_JPEG_PIXELS_IN_BLOCK];
 extern const u8 v4l2_jpeg_ref_table_chroma_qt[V4L2_JPEG_PIXELS_IN_BLOCK];
-- 
2.34.1

