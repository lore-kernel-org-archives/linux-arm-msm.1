Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6692E717B
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 03:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787715493; cv=none; b=X3ZpOG6GMhhfW9cOnIzTXk09mkr8HReang3vG/E03b2y++tXlaHhtvK9oR6Qi3fVKJnhVBQ5FEdyush9N/Xm5ML1etd0d8ZaTxVZxHQ6dNW3F3EQBba9ix0ocF8ahhlQ7BentmHWqccbZ8MSVfl3lu7J4j53Xp+5o93Go1SqA44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787715493; c=relaxed/simple;
	bh=A9WPthLqDmQWeDNjw+HZW+f6p0FAm1wVG86sTp0dyKU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=epLRtIt54mDY36UMhIFEBqKSg5CwfH3+0FB/2gYL2qfFhqWJd4VoBHRa7XiCYCcpqe+LJd41rhiiqfVnlL8q8nYDV9xq+DNUIhHH+/QBEqHVteQ1+8uyRtYMJgJgnL6jGfVOcXWiTGbg7Soio15JxHEoCaW/D1D+wSi8AaGpGus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YwMdu0xx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FeQbpJaA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YwMdu0xx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FeQbpJaA"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q3HERV713654
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 03:38:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7L1HH1SV4UKECcl7A4Q4VvEr/8i7bUzPh/g
	ZMR9t50g=; b=YwMdu0xxzJhXoO+7uspshInznRFeZctE7RwbUMATv6FNEKETFJx
	qhA1GlGrM04DClqY/xxueF0N2IsWrTouVNxcE7IS4QbMvcLQpv8bspghE8EWPHGr
	SA5DdbvBVCbOjLnvh3UJukr2frS9m73T2gWEnO4CpwKjRLHt7BWgr81XOuB8xIIY
	ug4MGsfasY4ILSDQMnQpf1EX9JdKuRzEtY6dBvECg6g9OW6IFECCK3x5LvbThiWq
	R4HNsTofdCyFydzDqevEtmhRqkxmIpprF4uGH6gk598+/QCTCRKqAhj+vsJbDuWe
	vPl0MNKE+p6JtR5l2kCrnRECjvg5LohEPZA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9bnjb2qn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 03:38:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e6d253330so860716a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 20:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787715490; x=1788320290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7L1HH1SV4UKECcl7A4Q4VvEr/8i7bUzPh/gZMR9t50g=;
        b=FeQbpJaA1eXf5KtAdcQnWdCVQvoDab+K8A/uNo42FcbQzSzbUD3CDsZAjR2yOLgJo4
         bY3qr9CEk4GCDbKJe5o8bS+bae18XgvIkXgQOVaCYg0vOamIlf3fTiNKa6pRlgl64qQC
         Vzx0xS/qH9UTQ+Fql+2rjjhFRsJOfzshGP4JD98H7vCabE5eet8jsQ/SuaV8JAFcnZKa
         MZ798E59AgtDt7GQkkHfRIzyvBHHbVFLbvgMYFw4lDtht4Wyg9two8xxJLfEB3ccd5Vy
         NohZvJMhJ6ocbaPlOyyfdATzUp/b0pmNCVs62SaJuo3gWjm3SV04KqPg0zyrC2mGtuly
         3g7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787715490; x=1788320290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7L1HH1SV4UKECcl7A4Q4VvEr/8i7bUzPh/gZMR9t50g=;
        b=qLTOe6Egfcvz8GKx1FYxRPzuAup7hn27vTM4ZOLdL2bmy+ABYSY2ankTJ1AyrMRi/d
         inO7KFUK+zrIzhOKXV/RJX0uGBhp29RPTkNLwvzTjy7NPaMEGC57lJTUT6qBe1vGvKH1
         HIyMm+nfWU3P0Ts4tknF9Myl3tDz/BxEArg7P+KtKHL10JdCyxBcgU3DeG8b/NKfKgLE
         D0uaUdJodGgMx5TPrJ8GrRd1LEcxnRTt9/46uwyc1sZLOzYRYuzuQKkZl7tGiIGJmiO/
         SMx8V7qZiu4mPiglt9UQOWMYoiE65cQsWfs6vELTNh+gNAdYi43rTk+pvSgpyESZsLKr
         mTyA==
X-Forwarded-Encrypted: i=1; AHgh+RpcOZVwNFwYCpbnH8ZxdvjInPXWfK64DQpeVoIC2Fs+5SsGVhybiIk02D8sTJHWyvWUfOcysclU2dMfaEV9@vger.kernel.org
X-Gm-Message-State: AFuF++kMB6u9chEsknrN1TdCHdWR/IEXZ2rNZk3PCyJX5hh5MZ/enmJ/
	4EHnW1IcuP6h4ATRWN2OFWIBCoS4Hi4XNzbYClSWDpKdCPRyb8XU4jNixHt2DAVOGzCbIfd9d2C
	gCloZgb7B83F51lP5YYQy6bIw96b/T3D8aE3cAmRgLtjSz7nMfYZ0vdVQyTBPL2CLTHQm
X-Gm-Gg: AR+sD11P3pesRIe3PgSpFnRfbm5FrS4GWXN+pESfrVe8+Jh1Bi97kn20T82IMI3ZgyH
	wS1zMzIdPsbbkg8lrDZBslmd3iyCh55Ohr38jMXIfqYmVrKFnR3Hx+QgSmxFvyew2l2/7nvB4Qt
	OSvhpOHh1GpNocHKiZszyTZaQ+ymupaUzevZpksFFRNaJMMQnL86Qe/1GS6AJiNLG+QIzQQ5+GV
	G7vZufKWopOzJ1+k+lH9LEkpvlzNXwvw5f8BY9aecWiUpdODU4ieIEXHOCeC2A1+7ZtfAe659Qo
	Ev9pQje6iMA/7IwM4w2X/vI4KYT5LBK3CdW4dYrx1ZxnnRh3W8w0SfdSWua6xr3iXzpQx9q88Si
	scmszOoxpdHiEvMejkoFHUI/igyhcUME6m63e0gUEe3WdY3bZ80ZeiQpYZQGKJMVBD6D1dfYtHQ
	==
X-Received: by 2002:a17:90b:3d81:b0:38e:6d55:b1a6 with SMTP id 98e67ed59e1d1-3966d3d1262mr4805018a91.3.1787715490277;
        Tue, 25 Aug 2026 20:38:10 -0700 (PDT)
X-Received: by 2002:a17:90b:3d81:b0:38e:6d55:b1a6 with SMTP id 98e67ed59e1d1-3966d3d1262mr4804942a91.3.1787715489706;
        Tue, 25 Aug 2026 20:38:09 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39670607ea5sm514357a91.0.2026.08.25.20.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 20:38:09 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, stable@kernel.org
Subject: [PATCH v13] misc: fastrpc: Allocate entire reserved memory for Audio PD in probe
Date: Wed, 26 Aug 2026 11:38:03 +0800
Message-Id: <20260826033803.475-1-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 631q_hEOK-gjuJoUHgD5o7zVI9LzuyZ2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDAyNyBTYWx0ZWRfXxGfBrgv0xdRw
 BUX1z9iyxETSTekLjVT1kzH0ncOZp4X9q36nsXRLBGgq525iiY3Ng/+6FfhqJYqszKtTUBhmdE0
 4RKlT4y2vU91+7DRWHChBN1TiHcrVIP7m6TptUoHv/AiCgNr3aRFvK0JUqMBUIE4IERE4vVg2xP
 E4uf40HzGpsd2r9MGPzp19mGEY14g0YMVh+S7Z0WwZx80GsQUsKf6r8UypIbjGUAZjKZwT4B6ZD
 l5xTkyT54MMdIXHcM3JvlhrGJN/omFKQFmhgnWBhZAWSo41CK7qnTzHR+WABOEC3oCsiDSvASjX
 MUxC/yCL9pR/zzNhAtHo8Woxq4BtqUim6wuvY6ZX7Rz5Tonti9+J2Nr/zVhp89LAncSoh4k5Mtv
 gMPV9ndhULJxIKP0XAnhNKVsAah7TCfdqPcSb8dqe3I8RhwhIPS20MzgfDYtHbUFwwG6tE5RLCe
 yFVdYkT1w5NgilXPJvw==
X-Authority-Analysis: v=2.4 cv=ZuHd7d7G c=1 sm=1 tr=0 ts=6a8e5fa3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=1D97j8aAK20nWj_7C5gA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDAyNyBTYWx0ZWRfXy8X2tqtZOLC6
 A1tuofmMANJ2RN2SeXCGH8OIqkY9LIp31gNj4+KKOPdmoeIf7383n8ur+xpCUk6AGPbnyDJW4An
 hdr0CG//XVYlFaKwxS1eInQxtqmaevw=
X-Proofpoint-ORIG-GUID: 631q_hEOK-gjuJoUHgD5o7zVI9LzuyZ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260027

Allocating and freeing Audio PD memory from userspace is unsafe because
the kernel cannot reliably determine when the DSP has finished using the
memory. Userspace may free buffers while they are still in use by the DSP,
and remote free requests cannot be safely trusted.

Additionally, the current implementation allows userspace to repeatedly
grow the Audio PD heap, but does not support shrinking it. This can lead
to unbounded memory usage over time, effectively causing a memory leak.

Fix this by allocating the entire Audio PD reserved-memory region during
rpmsg probe and tying its lifetime to the rpmsg channel. This removes
userspace-controlled alloc/free and ensures that memory is reclaimed only
when the DSP process is torn down.

The reserved-memory region is now mandatory for the Audio PD domain.
Rather than failing rpmsg probe when it is missing, validate it in
fastrpc_init_create_static_process() and reject only the static-process
creation. This keeps the fastrpc device probing for all other domains
even on a misconfigured device tree.

Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
Cc: stable@kernel.org
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
Patch [v12]: https://lore.kernel.org/all/20260814101955.234238-1-jianping.li@oss.qualcomm.com/

Changes in v13:
 - Replace the fastrpc_domain_has_reserved_heap() /
   fastrpc_domain_uses_static_heap() helpers and the open-coded
   reserved-memory initialization in fastrpc_rpmsg_probe() with a
   single fastrpc_init_reserved_mem() helper.
 - Check cctx->vmcount before calling qcom_scm_assign_mem() so the
   secure assignment is only performed for domains that actually
   have heap VMIDs configured.

Changes in v12:
 - Do not fail rpmsg probe when the reserved-memory region is missing,
   validate the region in fastrpc_init_create_static_process() instead,
   so probe keeps working for all domains.
 - Add fastrpc_domain_has_reserved_heap() / fastrpc_domain_uses_static_heap()
   helpers to replace the open-coded ADSP/SDSP domain checks.

Changes in v11:
 - Replace the remote_heap fastrpc_buf pointer with dedicated
   remote_heap_addr and remote_heap_size fields in
   fastrpc_channel_ctx to avoid leaving a partially
   initialized fastrpc_buf.

 - Drop ADSP_MMAP_REMOTE_HEAP_ADDR support from
   fastrpc_req_mmap() since the user process should no longer
   grow or shrink the Audio PD remote heap.

Changes in v10:
 - Move Audio PD remote heap validation into
   fastrpc_rpmsg_probe().

 - Treat Audio PD remote heap as a mandatory
   resource and fail probe if the reserved
   memory region is missing.

Changes in v9:
 - Make sure fastrpc_init_create_static_process()
   only sets audio_init_mem to false when the sent
   address is actually invalid.


---
 drivers/misc/fastrpc.c | 188 ++++++++++++++++++++++-------------------
 1 file changed, 101 insertions(+), 87 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 90fd669636ec..d47e2d01092a 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -70,8 +70,6 @@
 #define ADSP_MMAP_HEAP_ADDR  4
 /* MAP static DMA buffer on DSP User PD */
 #define ADSP_MMAP_DMA_BUFFER  6
-/* Add memory to static PD pool protection thru hypervisor */
-#define ADSP_MMAP_REMOTE_HEAP_ADDR  8
 /* Add memory to userPD pool, for user heap */
 #define ADSP_MMAP_ADD_PAGES 0x1000
 /* Add memory to userPD pool, for LLC heap */
@@ -314,10 +312,14 @@ struct fastrpc_channel_ctx {
 	struct kref refcount;
 	/* Flag if dsp attributes are cached */
 	bool valid_attributes;
+	/* Flag if audio PD init mem was allocated */
+	bool audio_init_mem;
+	/* Audio PD reserved remote heap region */
+	phys_addr_t remote_heap_addr;
+	u64 remote_heap_size;
 	u32 dsp_attributes[FASTRPC_MAX_DSP_ATTRIBUTES];
 	struct fastrpc_device *secure_fdevice;
 	struct fastrpc_device *fdevice;
-	struct fastrpc_buf *remote_heap;
 	struct list_head invoke_interrupted_mmaps;
 	bool secure;
 	bool unsigned_support;
@@ -1454,15 +1456,24 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	struct fastrpc_init_create_static init;
 	struct fastrpc_invoke_args *args;
 	struct fastrpc_phy_page pages[1];
+	struct fastrpc_channel_ctx *cctx = fl->cctx;
 	char *name;
 	int err;
-	bool scm_done = false;
 	struct {
 		int client_id;
 		u32 namelen;
 		u32 pageslen;
 	} inbuf;
 	u32 sc;
+	unsigned long flags;
+	bool sent_heap = false;
+
+	if (!cctx->remote_heap_addr || !cctx->remote_heap_size) {
+		err = -ENOMEM;
+		dev_err(fl->sctx->dev,
+			"remote heap memory region is not added\n");
+		return err;
+	}
 
 	args = kzalloc_objs(*args, FASTRPC_CREATE_STATIC_PROCESS_NARGS);
 	if (!args)
@@ -1486,31 +1497,6 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	inbuf.client_id = fl->client_id;
 	inbuf.namelen = init.namelen;
 	inbuf.pageslen = 0;
-	if (!fl->cctx->remote_heap) {
-		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
-						&fl->cctx->remote_heap);
-		if (err)
-			goto err_name;
-
-		/* Map if we have any heap VMIDs associated with this ADSP Static Process. */
-		if (fl->cctx->vmcount) {
-			u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
-
-			err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
-							(u64)fl->cctx->remote_heap->size,
-							&src_perms,
-							fl->cctx->vmperms, fl->cctx->vmcount);
-			if (err) {
-				dev_err(fl->sctx->dev,
-					"Failed to assign memory with dma_addr %pad size 0x%llx err %d\n",
-					&fl->cctx->remote_heap->dma_addr,
-					fl->cctx->remote_heap->size, err);
-				goto err_map;
-			}
-			scm_done = true;
-			inbuf.pageslen = 1;
-		}
-	}
 
 	fl->pd = USER_PD;
 
@@ -1522,8 +1508,25 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	args[1].length = inbuf.namelen;
 	args[1].fd = -1;
 
-	pages[0].addr = fl->cctx->remote_heap->dma_addr;
-	pages[0].size = fl->cctx->remote_heap->size;
+	/*
+	 * Audio PD is a static PD and retains the remote heap
+	 * information across daemon restarts. Therefore only
+	 * the first attach should provide heap information to
+	 * DSP. Subsequent attaches reuse the previously
+	 * initialized memory pool.
+	 */
+	spin_lock_irqsave(&cctx->lock, flags);
+	if (!cctx->audio_init_mem) {
+		pages[0].addr = cctx->remote_heap_addr;
+		pages[0].size = cctx->remote_heap_size;
+		cctx->audio_init_mem = true;
+		inbuf.pageslen = 1;
+		sent_heap = true;
+	} else {
+		pages[0].addr = 0;
+		pages[0].size = 0;
+	}
+	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	args[2].ptr = (u64)(uintptr_t) pages;
 	args[2].length = sizeof(*pages);
@@ -1541,27 +1544,11 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 
 	return 0;
 err_invoke:
-	if (fl->cctx->vmcount && scm_done) {
-		u64 src_perms = 0;
-		struct qcom_scm_vmperm dst_perms;
-		u32 i;
-
-		for (i = 0; i < fl->cctx->vmcount; i++)
-			src_perms |= BIT(fl->cctx->vmperms[i].vmid);
-
-		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
-		dst_perms.perm = QCOM_SCM_PERM_RWX;
-		err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
-						(u64)fl->cctx->remote_heap->size,
-						&src_perms, &dst_perms, 1);
-		if (err)
-			dev_err(fl->sctx->dev, "Failed to assign memory dma_addr %pad size 0x%llx err %d\n",
-				&fl->cctx->remote_heap->dma_addr, fl->cctx->remote_heap->size, err);
+	if (sent_heap) {
+		spin_lock_irqsave(&cctx->lock, flags);
+		cctx->audio_init_mem = false;
+		spin_unlock_irqrestore(&cctx->lock, flags);
 	}
-err_map:
-	fastrpc_buf_free(fl->cctx->remote_heap);
-	fl->cctx->remote_heap = NULL;
-err_name:
 	kfree(name);
 err:
 	kfree(args);
@@ -2090,7 +2077,7 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 	if (copy_from_user(&req, argp, sizeof(req)))
 		return -EFAULT;
 
-	if (req.flags != ADSP_MMAP_ADD_PAGES && req.flags != ADSP_MMAP_REMOTE_HEAP_ADDR) {
+	if (req.flags != ADSP_MMAP_ADD_PAGES) {
 		dev_err(dev, "flag not supported 0x%x\n", req.flags);
 
 		return -EINVAL;
@@ -2101,10 +2088,7 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 		return -EINVAL;
 	}
 
-	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR)
-		err = fastrpc_remote_heap_alloc(fl, dev, req.size, &buf);
-	else
-		err = fastrpc_buf_alloc(fl, dev, req.size, &buf);
+	err = fastrpc_buf_alloc(fl, dev, req.size, &buf);
 
 	if (err) {
 		dev_err(dev, "failed to allocate buffer\n");
@@ -2143,20 +2127,6 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 	/* let the client know the address to use */
 	req.vaddrout = rsp_msg.vaddr;
 
-	/* Add memory to static PD pool, protection thru hypervisor */
-	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR && fl->cctx->vmcount) {
-		u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
-
-		err = qcom_scm_assign_mem(buf->dma_addr, (u64)buf->size,
-			&src_perms, fl->cctx->vmperms, fl->cctx->vmcount);
-		if (err) {
-			dev_err(fl->sctx->dev,
-				"Failed to assign memory dma_addr %pad size 0x%llx err %d",
-				&buf->dma_addr, buf->size, err);
-			goto err_assign;
-		}
-	}
-
 	spin_lock(&fl->lock);
 	list_add_tail(&buf->node, &fl->mmaps);
 	spin_unlock(&fl->lock);
@@ -2537,6 +2507,45 @@ static const struct of_device_id fastrpc_poll_supported_machines[] __maybe_unuse
 	{},
 };
 
+static int fastrpc_init_reserved_mem(struct fastrpc_channel_ctx *cctx,
+				     struct device *rdev, u32 domain_id)
+{
+	struct resource res;
+	u64 src_perms;
+	int err;
+
+	/* Only SDSP and ADSP domains use a reserved remote heap region */
+	if (domain_id != SDSP_DOMAIN_ID && domain_id != ADSP_DOMAIN_ID)
+		return 0;
+
+	err = of_reserved_mem_region_to_resource(rdev->of_node, 0, &res);
+	if (err) {
+		/*
+		 * The reserved-memory region is optional at probe time. For
+		 * the Audio PD (ADSP) domain its absence is validated later in
+		 * fastrpc_init_create_static_process(), so keep probing here.
+		 */
+		return 0;
+	}
+
+	/*
+	 * Audio PD (ADSP) is a static PD: cache the region so its lifetime
+	 * is tied to the rpmsg channel instead of being controlled by
+	 * userspace.
+	 */
+	if (domain_id == ADSP_DOMAIN_ID) {
+		cctx->remote_heap_addr = res.start;
+		cctx->remote_heap_size = resource_size(&res);
+	}
+
+	if (!cctx->vmcount)
+		return 0;
+
+	src_perms = BIT(QCOM_SCM_VMID_HLOS);
+	return qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
+				  cctx->vmperms, cctx->vmcount);
+}
+
 static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 {
 	struct device *rdev = &rpdev->dev;
@@ -2584,21 +2593,9 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		}
 	}
 
-	if (domain_id == SDSP_DOMAIN_ID) {
-		struct resource res;
-		u64 src_perms;
-
-		err = of_reserved_mem_region_to_resource(rdev->of_node, 0, &res);
-		if (!err) {
-			src_perms = BIT(QCOM_SCM_VMID_HLOS);
-
-			err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
-				    data->vmperms, data->vmcount);
-			if (err)
-				goto err_free_data;
-		}
-
-	}
+	err = fastrpc_init_reserved_mem(data, rdev, domain_id);
+	if (err)
+		goto err_free_data;
 
 	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
 	data->secure = secure_dsp;
@@ -2698,8 +2695,25 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
 		list_del(&buf->node);
 
-	if (cctx->remote_heap)
-		fastrpc_buf_free(cctx->remote_heap);
+	if (cctx->remote_heap_size && cctx->vmcount) {
+		u64 src_perms = 0;
+		int err, i;
+		struct qcom_scm_vmperm dst_perms;
+
+		for (i = 0; i < cctx->vmcount; i++)
+			src_perms |= BIT(cctx->vmperms[i].vmid);
+
+		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
+		dst_perms.perm = QCOM_SCM_PERM_RWX;
+
+		err = qcom_scm_assign_mem(cctx->remote_heap_addr,
+					  cctx->remote_heap_size, &src_perms,
+					  &dst_perms, 1);
+		if (err)
+			dev_err(&rpdev->dev,
+				"Failed to assign memory back to HLOS: addr %pa size %#llx err %d\n",
+				&cctx->remote_heap_addr, cctx->remote_heap_size, err);
+	}
 
 	of_platform_depopulate(&rpdev->dev);
 
-- 
2.43.0

