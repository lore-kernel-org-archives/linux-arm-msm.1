Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A5141A57C
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 11:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784201585; cv=none; b=BS4SCrMHW0uqXYkOFpWCQ6UQsCBrqmR06So9iuGPQJ1+kqKp0o1Ibhb1MkaSzgLIrhQ2zihNh8rg4iA/eqK/slKaJxGnnC6OPbFp5Yi7SoitkICIs1nR98TE6cIYnPMJRLn8nedzWteOEfbAMfI5wkuQIl3X5TkiY8y11a4V0K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784201585; c=relaxed/simple;
	bh=jYEQSNSXghcx7Fw1MtIrQtYBab21ddmsYwTyeN7ku40=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eG7Q9OajZx8R87vguWwtxLPUnbuWuEBOMN2PFzQzmBu81waMCc1q/CL3uTNdbwlIAjWl2vj3u9aeBuKKiGWD683l5fAzGYvf+zAzlUkk8+FGSNpFxXPOJ8706vH8UQQ1P93ZICswHM/ENcnn7jJ6RYdKfQNrGVdeRogLHfbFFf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nIOEbz0x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kNP3aqFk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nIOEbz0x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kNP3aqFk"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G9rJsH2259693
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 11:33:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WTRAy0sFKkt4K0c5tsI7r8dGzDm6tiowQmt
	RyKw+h+s=; b=nIOEbz0x42ITX9HMEChRpQQdhLHg32UyJEKHCfy1gJSH5X9iIOa
	g+neUaME8/v06rQnmfBdT+PSZTVaQ7tqGnRsncARLEUQTeKjQo3DadGlA/Dk5ENB
	0hY/y8O9x5ZZJoVvrBc42gkNDKAZl+RPhXnKa3zEaUClGHOHat+7DUEPGksFhmaU
	RFnhfr0Xitvkg9JP1gzDFIm0M7HnY1sDmFRZ45dytQAz+Gtj5if8DFiyR8bDmImg
	Ew53E7EnBLoFI0JWLZNkMH2/mx4oNRsj45XPVGQwf6WjT54nnM4AGfl6an8XJEzs
	4XzN0Ufr8QJEkfEwx8djBsIy3bYecxrVFKg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fevkv0jsf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 11:33:03 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca8aee88725so9699841a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 04:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784201582; x=1784806382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WTRAy0sFKkt4K0c5tsI7r8dGzDm6tiowQmtRyKw+h+s=;
        b=kNP3aqFkBgZ9NH2crd3RgcWcqlnEPFLn0yGpROS4XJKEwj9sSe7cv1eQ9Raf1C2w1H
         FAXjf9DdLgdT9qysTra5kV7/CeuhIJOLWDUwJ1rql2WxmAJJ4fhIHLxBu5UI2Ybhhq5+
         1GaRBpFGbzccIApmYy78eRdWz5LnZJw6xzuCP4k80KPaY+3//6tupfVmvOdpEFl6McpV
         TFI5YWScnosIai0a13XYd+wjhprzd28jxN5xE608qGhlRYGMmUl8c4x8UXKwDdD7vmzC
         cKJ0FtvEmAY4NWhyU43RrEZL+/cwICiZFcSz4KZ8OnvtUwKkRe9OyDRfHUjCEmJ+lrTV
         /65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784201582; x=1784806382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WTRAy0sFKkt4K0c5tsI7r8dGzDm6tiowQmtRyKw+h+s=;
        b=fCjwgXoMnS1jgZDLDgJLRlw+IfXm+Ur21wzPPJ3wkPiUEHaQjNnfWgG3gkjA3/+38F
         TjDfSurQT9/rbEC9aYBn6LCIAx62QiF+4pnJXZA6MD/3y+asE4q9rZu6eNk8ZkoIPXgT
         cjui9n+6hSFDM8LBwXdUpFdlvIsW2+7VA1wGjOpefE391C3uGqDsxDIG/OSpGU9fzj/c
         t9yZv9KrKIOkAaKA98SJcfJKenvA/ps/FLgNLxtNB1CowqDRERvZBOfzYPWbu2B9RfuH
         Z84G2/cExmCZtTcxnCI6hnTC5VaOZ6WKNrFM0mh+RfKqEF6EyyRzrfaLQ5qTvrf5tiQw
         0OVg==
X-Forwarded-Encrypted: i=1; AHgh+Rr4mHhqkrgFKBo52WaIhTO+InQJa3CNHUyjAtkFNbhL2FJo9226mgnVytbdflUT/BGdTjW7nsaKdkg8a7Y8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9PfIXPUVr3mK5TWHWc8xk3ztyRQnUnGhwKTl1PMNshaixXR4h
	sxf0lhByBgi764+U7+zYRayb+fPwLGvMel0DEsAKXWgXkp+bfiZvG1ewOJeGrhyed92T4byGx4U
	MIIi1M6wzHrBXtHQqb1Jb9tvPSjPolYLSp18/DLlGrV2mctMIBND8GJA1G9mPPXcDUngj
X-Gm-Gg: AfdE7cnwg9iviaAYTMdmo3qMsA2EXHqsVHz3R2HjGgP0TMeo0Znc/a2daF8xrow1Mhh
	XT30rabz55gKgcHpjoViS5Cpo2IIkGlvn4H1mzDgBCYcVlQZ0/MLO/nNix7Qq3U9W4TKDaeVekX
	T2tqGMiGepRIBUoofcOEUh0X53BAYDNhNM7+2E0O3Va1k8vLR3yzr3fX2uxd+bcth28BTsS1dp1
	eoEFD82ajIk8V+eenBt0eKu/KhtBme6U1PS4yZ9QsQUNkOeU3bMvqrSFjDtZvTFb4nbc8k95hr/
	MbuKnp6KVOnmnQxamw8OneSE4caK9KuXNe1xEIXM2OerdJWUnVkFYKHyRLp8jKNlS3ByYy8mCBY
	YXEeK/a+XuJVDv8vt/MBl40kOVK3/BGsOkR4qkz9JacjExNGDrOPkOwtdh2VOIPZuxhlNFa5bcQ
	==
X-Received: by 2002:a05:6a00:4c8f:b0:848:4d4f:d477 with SMTP id d2e1a72fcca58-84a51442133mr11053312b3a.18.1784201582138;
        Thu, 16 Jul 2026 04:33:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c8f:b0:848:4d4f:d477 with SMTP id d2e1a72fcca58-84a51442133mr11053277b3a.18.1784201581521;
        Thu, 16 Jul 2026 04:33:01 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4ff2ea4csm4624667b3a.23.2026.07.16.04.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 04:33:01 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Ling Xu <quic_lxu5@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, quic_chennak@quicinc.com,
        stable@kernel.org
Subject: [PATCH v2] misc: fastrpc: avoid duplicate DMA mappings in fastrpc_create_maps()
Date: Thu, 16 Jul 2026 19:32:54 +0800
Message-Id: <20260716113254.570-1-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDExOSBTYWx0ZWRfX3tZTymjIAhe0
 Z93D9UmKdJUiju8ncRbAtB4136IFrtnSXUtL/chRSpXlrhiMeA8uMkBiYG9i01YGYaIFM4O2RxE
 vJulFUZcEMOb2xBkrgFHIGkoHgQxIK/PJJ5eoFmNkMKG2i/Aexpdcsr3MgOQ4kvZzOdIpjMYVIQ
 ysOTbx5fsWQfvz9H7PVlLSpzEJ4nV5D3N7QJVFVP4Eg4g07pV2NKIic3PfEGZThTk7ljTC60ZhQ
 0yaSB4RBZo0NNLVP2T4Lvl3C3yVMWvWOfBdDfAQvphCQ132EpmxQFOo7DSqACxeQlq2XzJAtjQ1
 kv27f7Wu6oC1pdhK/kal1ixSRrSP1CuUQ37jTfolRp4X+oTqmIhnpEMvVZGnOdXPDVebgmu+t27
 vISm0KI4sJqR4qr24ax6iSmPwCNRpekDh8BBA5ArY4Jgyf6D70Bv25TBW2FvlknbX9yHK/OmM/d
 Tm9IUDN0Tg5pwCWGSWA==
X-Authority-Analysis: v=2.4 cv=WrEb99fv c=1 sm=1 tr=0 ts=6a58c16f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jcsToSEUEPbHcpESBJIA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: g2gk-Q2uUTO1pw_eMhm7CrAykTJWACm_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDExOSBTYWx0ZWRfX7JkQPjbXDYGp
 FI0eOxZ2pvrj6UbT0zjfOesGtIKFnAk8z4CI5I1BdoRc69hNj5YLb6DAXsJNiQnVEFbBb+JjJk9
 AKBlxfAWsnAoalIxbAA5sZYa6rskYU0=
X-Proofpoint-ORIG-GUID: g2gk-Q2uUTO1pw_eMhm7CrAykTJWACm_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160119

DMA handles passed as invoke arguments (scalars beyond nbufs) may refer
to the same dma_buf fd as an input/output buffer argument. Taking an
extra reference for such DMA handle maps leads to duplicate mappings and
an unbalanced reference count, since DMA handle maps are released
separately when the DSP returns the fd through the fdlist.

Fix this by not taking an extra reference for DMA handle arguments
(take_ref = false) and tagging them with FASTRPC_MAP_DMA_HANDLE. As
these maps are borrowed references, fastrpc_get_args() re-validates the
map via fastrpc_map_lookup() before dereferencing it, so it is not used
after being freed. fastrpc_put_args() only releases maps flagged as
FASTRPC_MAP_DMA_HANDLE and clears the flag to guarantee the map is freed
exactly once.

Also reject FASTRPC_MAP_DMA_HANDLE in fastrpc_req_mem_map(), since such
handles are already mapped implicitly during the remote invoke call and
must not be mapped again through the explicit MEM_MAP path.

Fixes: 10df039834f84 ("misc: fastrpc: Skip reference for DMA handles")
Cc: stable@kernel.org
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
Patch [v1]: https://lore.kernel.org/all/20260625080832.17477-1-jianping.li@oss.qualcomm.com/

Changes in v2:
- Rework the commit message to describe the DMA handle reference and
  lifetime problem more precisely.
- Introduce a new FASTRPC_MAP_DMA_HANDLE uapi flag and a 'flags' field
  in struct fastrpc_map to explicitly tag DMA handle maps, instead of
  relying only on the nbufs boundary / take_ref.
- Plumb an mflags argument through fastrpc_map_create() and
  fastrpc_map_attach() so DMA handle maps are tagged at creation time.
- Re-validate the borrowed map in fastrpc_get_args() via
  fastrpc_map_lookup() before dereferencing it, to avoid a
  use-after-free when the map was created with take_ref = false.
- In fastrpc_put_args(), only release maps tagged FASTRPC_MAP_DMA_HANDLE
  and clear the flag afterwards, so such maps are freed exactly once.
- Reject FASTRPC_MAP_DMA_HANDLE in fastrpc_req_mem_map(), since these
  handles are already mapped implicitly during the remote invoke and
  must not be mapped again through the explicit MEM_MAP path.
---
 drivers/misc/fastrpc.c      | 56 ++++++++++++++++++++++++++-----------
 include/uapi/misc/fastrpc.h |  2 ++
 2 files changed, 42 insertions(+), 16 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index d86e79134c68..fa8c58a97e35 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -223,6 +223,7 @@ struct fastrpc_map {
 	u64 len;
 	u64 raddr;
 	u32 attr;
+	u32 flags;
 	struct kref refcount;
 };
 
@@ -833,7 +834,7 @@ static dma_addr_t fastrpc_compute_dma_addr(struct fastrpc_user *fl, dma_addr_t s
 }
 
 static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
-			      u64 len, u32 attr, struct fastrpc_map **ppmap)
+			      u64 len, u32 attr, struct fastrpc_map **ppmap, int mflags)
 {
 	struct fastrpc_session_ctx *sess = fl->sctx;
 	struct fastrpc_map *map = NULL;
@@ -850,6 +851,7 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
 
 	map->fl = fl;
 	map->fd = fd;
+	map->flags = mflags;
 	map->buf = dma_buf_get(fd);
 	if (IS_ERR(map->buf)) {
 		err = PTR_ERR(map->buf);
@@ -924,13 +926,13 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
 	return err;
 }
 
-static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
-			      u64 len, u32 attr, struct fastrpc_map **ppmap)
+static int fastrpc_map_create(struct fastrpc_user *fl, int fd, u64 len, u32 attr,
+			      struct fastrpc_map **ppmap, bool take_ref, int mflags)
 {
-	if (!fastrpc_map_lookup(fl, fd, ppmap, true))
+	if (!fastrpc_map_lookup(fl, fd, ppmap, take_ref))
 		return 0;
 
-	return fastrpc_map_attach(fl, fd, len, attr, ppmap);
+	return fastrpc_map_attach(fl, fd, len, attr, ppmap, mflags);
 }
 
 /*
@@ -1000,23 +1002,25 @@ static int fastrpc_create_maps(struct fastrpc_invoke_ctx *ctx)
 	int i, err;
 
 	for (i = 0; i < ctx->nscalars; ++i) {
+		bool take_ref = i < ctx->nbufs;
+		int mflags = 0;
 
 		if (ctx->args[i].fd == 0 || ctx->args[i].fd == -1 ||
 		    ctx->args[i].length == 0)
 			continue;
 
-		if (i < ctx->nbufs)
-			err = fastrpc_map_create(ctx->fl, ctx->args[i].fd,
-				 ctx->args[i].length, ctx->args[i].attr, &ctx->maps[i]);
-		else
-			err = fastrpc_map_attach(ctx->fl, ctx->args[i].fd,
-				 ctx->args[i].length, ctx->args[i].attr, &ctx->maps[i]);
+		/* Set the DMA handle mapping flag for DMA handles */
+		if (i >= ctx->nbufs)
+			mflags = FASTRPC_MAP_DMA_HANDLE;
+
+		err = fastrpc_map_create(ctx->fl, ctx->args[i].fd, ctx->args[i].length,
+					 ctx->args[i].attr, &ctx->maps[i], take_ref, mflags);
 		if (err) {
 			dev_err(dev, "Error Creating map %d\n", err);
 			return -EINVAL;
 		}
-
 	}
+
 	return 0;
 }
 
@@ -1144,6 +1148,16 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 		list[i].num = ctx->args[i].length ? 1 : 0;
 		list[i].pgidx = i;
 		if (ctx->maps[i]) {
+			/* It is possible that map is created with
+			 * mflags FASTRPC_MAP_DMA_HANDLE and take_ref
+			 * is false. Check if map still exists or is
+			 * being freed as take_ref is false
+			 */
+			if (fastrpc_map_lookup(ctx->fl, ctx->args[i].fd,
+					       &ctx->maps[i], false)) {
+				ctx->maps[i] = NULL;
+				return -EINVAL;
+			}
 			pages[i].addr = ctx->maps[i]->dma_addr;
 			pages[i].size = ctx->maps[i]->size;
 		}
@@ -1200,8 +1214,13 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
 	for (i = 0; i < FASTRPC_MAX_FDLIST; i++) {
 		if (!fdlist[i])
 			break;
-		if (!fastrpc_map_lookup(fl, (int)fdlist[i], &mmap, false))
+		/* Validate the map flags for DMA handles and skip freeing map if invalid */
+		if (!fastrpc_map_lookup(fl, (int)fdlist[i], &mmap, false) &&
+		    mmap->flags == FASTRPC_MAP_DMA_HANDLE) {
+			/* Allow DMA handle maps to free only once */
+			mmap->flags = 0;
 			fastrpc_map_put(mmap);
+		}
 	}
 
 	return ret;
@@ -1511,7 +1530,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
 	fl->pd = USER_PD;
 
 	if (init.filelen && init.filefd) {
-		err = fastrpc_map_create(fl, init.filefd, init.filelen, 0, &map);
+		err = fastrpc_map_create(fl, init.filefd, init.filelen, 0, &map, true, 0);
 		if (err)
 			goto err;
 	}
@@ -2107,9 +2126,14 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
 
 	if (copy_from_user(&req, argp, sizeof(req)))
 		return -EFAULT;
-
+	/*
+	 * Prevent mapping backward compatible DMA handles here, as they are
+	 * already mapped in the remote call.
+	 */
+	if (req.flags == FASTRPC_MAP_DMA_HANDLE)
+		return -EINVAL;
 	/* create SMMU mapping */
-	err = fastrpc_map_create(fl, req.fd, req.length, 0, &map);
+	err = fastrpc_map_create(fl, req.fd, req.length, 0, &map, true, 0);
 	if (err) {
 		dev_err(dev, "failed to map buffer, fd = %d\n", req.fd);
 		return err;
diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
index c6e2925f47e6..142ddaeed85f 100644
--- a/include/uapi/misc/fastrpc.h
+++ b/include/uapi/misc/fastrpc.h
@@ -44,6 +44,8 @@ enum fastrpc_map_flags {
 	FASTRPC_MAP_FD = 2,
 	FASTRPC_MAP_FD_DELAYED,
 	FASTRPC_MAP_FD_NOMAP = 16,
+	/* Map the DMA handle in the invoke call for backward compatibility */
+	FASTRPC_MAP_DMA_HANDLE = 0x20000,
 	FASTRPC_MAP_MAX,
 };
 
-- 
2.43.0

