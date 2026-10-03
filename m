Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303CC1E1024
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 02:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790995173; cv=none; b=G+wohk30RSfN1M3zd/W1/e5bqoOwSnG24EcFcPUXA5bi4b1p8ElT4lh3BjsjUJy/LEWUfhhtfutGZqaeVgNgm4ZjWqZrfpw/xt3Tjw5hvDtEKfrSBYSgKTxx8F+K5EGM43SdigqsaA9WDI1TiWIEejp0C5HG9buVzI3ZHoAzMms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790995173; c=relaxed/simple;
	bh=mniSz4vmZo3q3s4kcqPGn/KjAefUNnMUXv2gLg4hgv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ECNEG+84FMace6YEliDozXaOXUA6vRK4xqfGHxIhnBcSVs4t1xAJvVeeLf558pgbWZttaCX+sgt/iN6XSzyb5LPdf9dV7oNEUO1ieyEgoKJjSu2JPyJZs80UPcUvrNjWnpIkdPSTLyk7MIBaEZIcNXIxgS30NgpCd1dpno0VAhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lHZPvL3j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QcxJlM/d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lHZPvL3j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QcxJlM/d"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692Neu6K2929277
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Oct 2026 02:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Xl0XIvIGaHU
	gokNEPlpzOm5Y0YuFUhgfwpa57b3H480=; b=lHZPvL3jpcFR/NJ6+8jbtpR6VLw
	nq7UUCc3ru/+7p7cTz59M+Wo6nntcIvAhT9wfkOlwHTfyJx4oqMbMFPy91x4lzf4
	vZhGFlifA+8FFSHWcnGORerNg0i9lVWPYkRq1GiYCetuMJ7Dg91yjjR17MhoT+wd
	QHdWDMQ3PuiLF8I9kbm3AS0aH/9Fv/TVDwdSzy51C9FZ/qNV4sFTwrmYivgSuy4S
	J8dekgA/BnaQ4m8m4i6a9LCVDchYfCNJcxOifVq0rNL6HXgAXynDM7zv7kLWY7wA
	QVYb+U0E+x+UbdSkzeMpTdPzleTEWyBhHx26vZKjfpHV9Xfpav+njXj/ITQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h20nfw309-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 02:39:30 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34e676375d9so221305eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 19:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790995170; x=1791599970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xl0XIvIGaHUgokNEPlpzOm5Y0YuFUhgfwpa57b3H480=;
        b=QcxJlM/di1vXZkb5kljfx5Va7Ig/xSTdFik+vdSz4KMFQk0aVtwHHskWU2jMAYz/Dm
         3cFDJtvFbR7GC4bW9esf+fEEWFJeSjYmNyxu0tYLon2Of4FURzOrpVndwGeG1xmtwj1X
         4Dzmca+8fHf3tlQvHOI0M2mhhk6AdVUs3mb9AlbPOAdWHFT7RF0JXlRqx2hpL62gwV5X
         YjM5mKwHHa446D5azdAFr0e5zP+ZnB3t1bHIIAeLNIQ9o+6zBQ8nSgPyC6YbqeED7hNG
         hlOFaCB3fzWDk24b1tup+sp5yHxjmpgddc0dwf/cnZ7b7qJNYRu/L/PPzEscPrdmR2pI
         TMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790995170; x=1791599970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xl0XIvIGaHUgokNEPlpzOm5Y0YuFUhgfwpa57b3H480=;
        b=BSr8+ZfXK6WKsZ0xedQbBTAt58ScQt4n0yn3sIhARlwLXeagij8LPnTuWpYQ6JbIel
         +oUR50U1NXSQTU5X4iWA0+UGoqpoypMAQX5xajeB9/B+dugto+Rb9x1KQvOtckMX/pbA
         tdz4F4dNp0AkWqWMf4Hy+etDqXC2uKwj80OCL7lKeDMAXRec8c71RCXxia2MOabkQejc
         bexmn2ijq44GIzySpT4SkxDIF32r89HSSgZyOvsph6iFWxi/xgqrJ/ZItN3QwqTurgjZ
         TV3iiot3t9E5uFAB/ueKgEfljHQ9GpyPaUk8qBnPokM2K72JOtBVA2GVALFC4LuPW7gD
         BeCw==
X-Forwarded-Encrypted: i=1; AKwUvBy3Hdp1LmlLsPypVDrvrPirndzJ8VLXBwCzRdzMhTGCSyAwhCstxT5i0XmyW9oQKEd74fCJB6Duq9IY42OO@vger.kernel.org
X-Gm-Message-State: AFq9FYJpDVWdN6PzOCEwmz560/YVs3AKRblqb/6OOifc1J8ge1k37A/U
	GTjWcSfv7ju3vlsNuATw3cOYlcSmkYqKPDj4mosXEMzFNgmTJkw16pyyySnC4ovlfGdJNwCYAT8
	JzLuXrozsP6k2NlYWEE6/jzkArP8eWdxGGFStNmcbnUT+3vVsBzk+uoCKdxx8urrVPPyPcOwQql
	K+
X-Gm-Gg: AYBFou0o/xBJ/5UlKJmrgfc2dtzISiWSBEduB9YQ1U8TbQ/K4j8X7Fn30KIP+uPosxC
	52GEJZt/XdoBpXJEB6SFKEO9N6nW/csZ/X/rLvdOBZTzFAnGIgakB+Qzqi64e5NgfSGdv9rQL0n
	KwYmPwPpS4mQBRgNaF/LGqSFeLKbI1424lWqvdc59V9kk/lF1eDSjkd7i70ftrlQ4kDzsVkDm3P
	moDgwdEzyZZZQlmTrgV6EaQZoiQYtEUbqBXiip/nbeS11eWERd51mPb04mk8DqdHPTekYb10sxO
	N6bVXDiEyKWocRKSDjjokye8XE/mtAMAyhD7Hd3zmARG+V9/X3uxk0mpRXZ1R7zMq1ZcupVoTe9
	4lV+eTByf9VnODdMBa39PK9GDYYMZnkBH0I9I/CQfugzuz+5+vYPSBaJx
X-Received: by 2002:a05:7301:90e:b0:34c:9b33:f384 with SMTP id 5a478bee46e88-34db66065d7mr7911848eec.11.1790995169957;
        Fri, 02 Oct 2026 19:39:29 -0700 (PDT)
X-Received: by 2002:a05:7301:90e:b0:34c:9b33:f384 with SMTP id 5a478bee46e88-34db66065d7mr7911823eec.11.1790995169385;
        Fri, 02 Oct 2026 19:39:29 -0700 (PDT)
Received: from carlv-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3510752b575sm7665736eec.6.2026.10.02.19.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 19:39:29 -0700 (PDT)
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH 6/6] accel/qaic: Use reduced size allocation for FIFOs
Date: Fri,  2 Oct 2026 19:38:18 -0700
Message-ID: <20261003023818.1161666-7-carl.vanderlip@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261003023818.1161666-1-carl.vanderlip@oss.qualcomm.com>
References: <20261003023818.1161666-1-carl.vanderlip@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jv3s1YjZ8S0QpoUmLxPAqchAJItSG_T3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAxMCBTYWx0ZWRfXw80VVXGEIhZH
 HYCSMD5/R4wHkyk7daX7i0NhjB+YxibmdBjzURCq3CP58aJvW2Dh14edsJWN+TyZYMwvdMRPUtw
 dqjDDg5fzf/exC/H20aBk+/qoyW5vkA=
X-Proofpoint-ORIG-GUID: jv3s1YjZ8S0QpoUmLxPAqchAJItSG_T3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAxMCBTYWx0ZWRfXzWJdx9GW549P
 IV7DLifL3VOquV4Hff3LKn64YV2tSXdgrEBi4IRjtyIGLKzyOpfer20ZUyCAhvY81DoTOv2odkB
 Q1wOKU9lXk+sl8ni1pJwoIV7pmFkztZDjyLzfKT26wMxKAuvNxTpkDAa8USGB4RItxxdCiOAw+u
 wUxMcmclumS3RK7pRLoGFmAB0vPKb8n6QytcQycHwqP9aC7m6WDOYca7XDwnRsT5dJjKACt82Ew
 Vh/uzBbPa6aml3ah6FreK3ZdTtIGYa1s5zH5erRsaWNh7d2wcAqxXhUYAC9QBvKxbRkTdlyXuM2
 WuZJ/f/KcF81rGe4rXwtu19w7pDXkHxA7XSgnulvbeTmx3WFcb6n5X0UGRv21/cBM5ZuLFTS9p+
 G/VcOk0G0euqtQGsuk3pCh18yrzmyK14ZhskH7liVOcHKLeU0uwcrNsSv0bv916KI1huwIkxi/N
 sWmugql0wnmv7jklEIg==
X-Authority-Analysis: v=2.4 cv=f+jdl+yM c=1 sm=1 tr=0 ts=6ac06ae2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=idRyZ63dR-ApLRvqdSoA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1011 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030010

On memory limited systems, large allocations from the DMA coherent pool are
likely to fail (especially as memory becomes framgented). Leverage the DRM
Scheduler to be able to break up submissions and make them fit within
available allocation.

Signed-off-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic_control.c | 31 ++++++++++++++++---------------
 drivers/accel/qaic/qaic_sched.c   |  2 --
 2 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index 9c4400c0fd17..7619f87043d2 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -30,7 +30,12 @@
 
 #define MANAGE_MAGIC_NUMBER		((__force __le32)0x43494151) /* "QAIC" in little endian */
 #define QAIC_DBC_Q_GAP			SZ_256
-#define QAIC_DBC_Q_BUF_ALIGN		SZ_4K
+#define QAIC_DBC_Q_MAX_SIZE		SZ_256K
+#define QAIC_DBC_Q_MIN_SIZE		(ALIGN(2 * (get_dbc_req_elem_size() + \
+						    get_dbc_rsp_elem_size()) + \
+					       QAIC_DBC_Q_GAP, SZ_4K))
+#define QAIC_DBC_NELEM(size)		(((size) - QAIC_DBC_Q_GAP) / \
+					(get_dbc_req_elem_size() + get_dbc_rsp_elem_size()))
 #define QAIC_MANAGE_WIRE_MSG_LENGTH	SZ_64K /* Max DMA message length */
 #define QAIC_WRAPPER_MAX_SIZE		SZ_4K
 #define QAIC_MHI_RETRY_WAIT_MS		100
@@ -635,13 +640,13 @@ static int encode_activate(struct qaic_device *qdev, void *trans, struct wrapper
 	struct qaic_manage_trans_activate_to_dev *in_trans = trans;
 	struct wire_trans_activate_to_dev *out_trans;
 	struct wrapper_msg *trans_wrapper;
+	u32 size = QAIC_DBC_Q_MAX_SIZE;
 	struct wrapper_msg *wrapper;
 	struct wire_msg *msg;
 	dma_addr_t dma_addr;
 	u32 msg_hdr_len;
-	void *buf;
 	u32 nelem;
-	u32 size;
+	void *buf;
 	int ret;
 
 	wrapper = list_first_entry(&wrappers->list, struct wrapper_msg, list);
@@ -657,20 +662,16 @@ static int encode_activate(struct qaic_device *qdev, void *trans, struct wrapper
 	if (in_trans->pad)
 		return -EINVAL;
 
-	nelem = in_trans->queue_size;
-	if (check_mul_overflow((u32)(get_dbc_req_elem_size() + get_dbc_rsp_elem_size()),
-			       nelem,
-			       &size))
-		return -EINVAL;
-
-	if (size + QAIC_DBC_Q_GAP + QAIC_DBC_Q_BUF_ALIGN < size)
-		return -EINVAL;
-
-	size = ALIGN((size + QAIC_DBC_Q_GAP), QAIC_DBC_Q_BUF_ALIGN);
-
-	buf = dma_alloc_coherent(&qdev->pdev->dev, size, &dma_addr, GFP_KERNEL);
+	while (size >= QAIC_DBC_Q_MIN_SIZE) {
+		buf = dma_alloc_coherent(&qdev->pdev->dev, size, &dma_addr, GFP_KERNEL);
+		if (!buf)
+			size >>= 1;
+		else
+			break;
+	}
 	if (!buf)
 		return -ENOMEM;
+	nelem = QAIC_DBC_NELEM(size);
 
 	trans_wrapper = add_wrapper(wrappers,
 				    offsetof(struct wrapper_msg, trans) + sizeof(*out_trans));
diff --git a/drivers/accel/qaic/qaic_sched.c b/drivers/accel/qaic/qaic_sched.c
index ded0bdccdfdb..20ad8c13cf26 100644
--- a/drivers/accel/qaic/qaic_sched.c
+++ b/drivers/accel/qaic/qaic_sched.c
@@ -95,8 +95,6 @@ void set_dbc_scaling_ratio(struct dma_bridge_chan *dbc, u32 nelem)
 		dbc->credit_ratio = QAIC_CREDITS;
 		return;
 	}
-	if (QAIC_CREDITS % nelem != 0)
-		pr_debug("Credits not evenly divisible by queue size: size = %d\n", nelem);
 	dbc->credit_ratio = DIV_ROUND_UP(QAIC_CREDITS, nelem);
 }
 
-- 
2.43.0

