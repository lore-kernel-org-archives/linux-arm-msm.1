Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D233DA5D1
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 09:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784195938; cv=none; b=gsw4MN1WDmPnJslxE3oLykKj7i3Zwt67GXsV69PAB3FQ69xWEm2JGgGqHBuOpLKOilPVEwo1KzvCEH/X+CHGObqayvqgcqhKc/T86vJKvgnmnKv9cyb/kDyOj+9CwmtHSyRTT4uWGSasImJCI+LccomX41e/BuqqafwXzaKpvhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784195938; c=relaxed/simple;
	bh=AcQZtosfYtemaOyDM5dybG0Xlv62DeVMOciM0zdWtaw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ODi7GBq9lPcttNWw68yi5jeA0eaQqH/cNMkQ8HrivelqzR1rCKDr4JnKpMBOvPe83i/XVG/uE5DcNdhHTjo18oN3HRWOXtInmgGvyecpEa2lsKV1p5XH0uW1zR9PO+uA1xSqw2L7p7bnnhg+W5yVdaUHTNprA/iFr7uJR6PtLRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mn1mPHle; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ekAmoPja; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mn1mPHle";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ekAmoPja"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G9r90Y2215293
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 09:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JpsEaLu0rCn/373mwwPv0+tBDrJYa0gBUv7
	uufH8JPg=; b=Mn1mPHleX9Hw7rD+D5QvPF6SsK7uarwmjRavhwEOsQ3TkeiWkBH
	9jt/rxINC+Z/hQEboic21wqhS1gOamod0cDTdbNmYxdrblK4mkek7iOlywJRzCKU
	8xsQXWvwBUgrkxoWri7F7TxX7t2P5XeRC9sTlKFt2WBLIoV+Yry8aMSzf5Qm7IIL
	8VqGoMTBUzk29OhkD7hMqs4QpPuvV0S8OsSx6s754jjDBpzTqY0fyfiHQlQNCxjH
	7nUfbej3dnsxEHyQBj+Z6z/WTT0S+KE150Ji97MM8uxJUEnXoQ2qKomV5Smarg/z
	0CoPDDhyAMnPg+HO3JQHIASLHUCfbGNrRMQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fetb7rqrt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 09:58:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cf1c86963bso923855ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 02:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784195935; x=1784800735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JpsEaLu0rCn/373mwwPv0+tBDrJYa0gBUv7uufH8JPg=;
        b=ekAmoPjaUyAWmB3yTPzFzE/JxUfxiYabstgxudsoNMQl7FBHdXo2VHhQTFtqrV9MPx
         w21MgiVcSO5RNNH08QXl/dhF7NRjEzAS4q1nenwwP5JPUZ6qg+kUFatRCIbaFKK2dEgx
         Ku4rCVclnUv+bmXQW8fhOqS82HxJiFHoNOt1sBNynPWRSRz9CNK2Txxsv9ZOl/kmKXII
         ICqQGgZ1LOmdBwtcdt8A/CIxH0uPUYS7NlZG4lU9wNW9tK4h8HNDy5tFM1H52HTAIEEr
         ZHn7O2g8J4XSvQhzmamtA0igaJjLJ7sR0PMbsewwQHmbJMHJL8ybDv3/RtNuL1z+kPYX
         8bVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784195935; x=1784800735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JpsEaLu0rCn/373mwwPv0+tBDrJYa0gBUv7uufH8JPg=;
        b=CJq4IKUm9dYkzQnFc8F+BV4Vq80ritZJNT3asKOY7f2AUB9vApq0QJjg4HBRESO/bX
         x8O6UlyojeoHvl1YubA1L7Q3M4iytQzR4iHsiO/gw8RTbBwauPOypZEy6SKauli1BwQ7
         fBZ+EYG0sVUJHhB0jYPMEzqHTE8clswz45pyvqFmtnDrdqTuTUng/mXnj4/7sG9w0kgg
         Ja5KfswYDG1i3ckXBKT4rerN91b8eZbxco83B7BBW46Tql2SDtJieQH+X+MEjkWYzVa1
         iW4XOzPPmRlPigwtu3zelq+owFbvaJnupR+ye29zOFOSk0z/qC3SOdDJpLYtbmdB3Pm5
         g8ig==
X-Forwarded-Encrypted: i=1; AHgh+RqQa2tvGtopuDGcA5QfFKfdyE7VvvWrtUO6HX4MEFAdrsErR3TmIwTTVWztGH0sEfYInqV01kLj8Rg6YZZK@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl7V21GtyR8JcC2ge3ySOeKpGKGDPzsOEDwvOcv2VuzAeQpMNl
	zgR5LNKPhUm3eqO79TEsdXr/XVFrk5Cqo8Vwxc+P/zylFFTBn0QsQc4gJ+Pt1s0wBCI5QQzi88E
	8VjIW3z0GO2k6xx+T5A9esg1DMjl1P0dPHHNeUhI/woWzd2FlDoQCTktY53b2Dk34G7sl
X-Gm-Gg: AfdE7ck6r6U2Oukf6BHzZWsQNGzfyE1+RCMyOvt9zVkZclRL59OGH08R1kZueJHrRtZ
	fveBy7iDRJb3959BcodYFDQLgh4C8MNym83cr+XNkD/08WqJ3BymVcZs4983CZp9QNxlTTCHtff
	JDMjlmelmup7ajlRK9XpU2Gdr+psb0kq/7m2Tzeaa6iOinqEalFnwDRSrALe5ocSjOXvoHuDSyf
	Q95NK1V9tSy8V9SO+NIIEK4PpoDrcDcIII0Mv/CHKPBnmQj2zLbgtbnD5BpcqmXm94w0PDCFw5N
	JT1tJ5njdX1D7fS75TjLQWRb/8ujsEnD/XHXMrZRdzndqSmxdu2QzF/a39ASSNuTWYaKhamVpje
	uV1KUaTEok+WNrtNH7jMlj1J0gNYy3el0dQ5vSyRcgDOqaeG2J2faEOcBnd/V7VuUlo6S309A+g
	==
X-Received: by 2002:a17:903:1aa3:b0:2cc:89ce:2f07 with SMTP id d9443c01a7336-2cf1f27ef69mr19283305ad.1.1784195935183;
        Thu, 16 Jul 2026 02:58:55 -0700 (PDT)
X-Received: by 2002:a17:903:1aa3:b0:2cc:89ce:2f07 with SMTP id d9443c01a7336-2cf1f27ef69mr19283035ad.1.1784195934598;
        Thu, 16 Jul 2026 02:58:54 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1015e45bsm17581045ad.33.2026.07.16.02.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 02:58:54 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, stable@kernel.org
Subject: [PATCH v10] misc: fastrpc: Allocate entire reserved memory for Audio PD in probe
Date: Thu, 16 Jul 2026 17:58:47 +0800
Message-Id: <20260716095847.479-1-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEwMiBTYWx0ZWRfX9fLdk4ebJ5F7
 joAZ3SOl+uB1h/fVYJD4gboOLJOvyVeVve76bUNOqgTJzLJXp1mD7NUVud5jKMdLjRs1jrz015G
 81ZS2j7N1W+1ZVPwx4OqIdJz7uOmcJE=
X-Authority-Analysis: v=2.4 cv=dM2WXuZb c=1 sm=1 tr=0 ts=6a58ab5f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=0G0rfPxOs2MEFri9fakA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEwMiBTYWx0ZWRfX5w8lxHKzqBJk
 4CronnAlmNVxCVc+m5shNXX6PPNU0GdJuHuFaEKRbwAEPP9iCBBZEDaJEavGCnHLc2Tae6A7m7X
 Hxm0ybkG1WHmieE/G/AYQ6c5iz7giYyPnNIjfbClWUSpYMsfMZR7xtG/s8pb90EtAi/yGsnHce+
 ntUH5cxnG5pgabw96VDTYVgCf48xN0uQlbXg0leFPzxpH5+ycH0N2FVB8G6ZxEgdr/kzeB/JQPI
 CzleVP+pqtDTPAH8m2XvvkWPTuhm61RXqFpGLwYvkdQVGC8m9IZ3OFzgeUgIVGvvKaRKDDY7uJ9
 L2v/01rEFwP8TfJJpMPRD1GM7YTY2p3nZQahmoIOv3ivyw2MUojC1pSffbFLO4GjCgjEd5rbWHc
 0kriqMLQ1t9P2COnfac0HivONBwnU25PaMq6Daj6/Ha9F04NgR59+ngHpDb8mNQOopNFIu2CRnI
 +kpHRjzLleVsGoluBrg==
X-Proofpoint-ORIG-GUID: FVLyQaE4dbySRMeD6DQnMD2N12GpwaYK
X-Proofpoint-GUID: FVLyQaE4dbySRMeD6DQnMD2N12GpwaYK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160102

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

Add explicit validation for remote_heap presence and size before sending
the memory to DSP, and fail early if the reserved-memory region is
missing or incomplete.

Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
Cc: stable@kernel.org
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>

Patch [v9]: https://lore.kernel.org/all/20260707061733.495-1-jianping.li@oss.qualcomm.com/

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
 drivers/misc/fastrpc.c | 121 +++++++++++++++++++++++------------------
 1 file changed, 69 insertions(+), 52 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index d86e79134c68..03f633028c00 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -276,6 +276,8 @@ struct fastrpc_channel_ctx {
 	struct kref refcount;
 	/* Flag if dsp attributes are cached */
 	bool valid_attributes;
+	/* Flag if audio PD init mem was allocated */
+	bool audio_init_mem;
 	u32 dsp_attributes[FASTRPC_MAX_DSP_ATTRIBUTES];
 	struct fastrpc_device *secure_fdevice;
 	struct fastrpc_device *fdevice;
@@ -1344,15 +1346,17 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
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
 
 	args = kzalloc_objs(*args, FASTRPC_CREATE_STATIC_PROCESS_NARGS);
 	if (!args)
@@ -1376,31 +1380,6 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
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
 
@@ -1412,8 +1391,25 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
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
+		pages[0].addr = cctx->remote_heap->dma_addr;
+		pages[0].size = cctx->remote_heap->size;
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
@@ -1431,27 +1427,11 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 
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
@@ -2418,12 +2398,29 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		}
 	}
 
-	if (domain_id == SDSP_DOMAIN_ID) {
+	if (domain_id == SDSP_DOMAIN_ID || domain_id == ADSP_DOMAIN_ID) {
 		struct resource res;
 		u64 src_perms;
 
 		err = of_reserved_mem_region_to_resource(rdev->of_node, 0, &res);
+
+		if (err && domain_id == ADSP_DOMAIN_ID) {
+			dev_err(rdev, "missing mandatory remote heap memory-region\n");
+			goto err_free_data;
+		}
+
 		if (!err) {
+			if (domain_id == ADSP_DOMAIN_ID) {
+				data->remote_heap =
+					kzalloc_obj(*data->remote_heap);
+				if (!data->remote_heap) {
+					err = -ENOMEM;
+					goto err_free_data;
+				}
+
+				data->remote_heap->dma_addr = res.start;
+				data->remote_heap->size = resource_size(&res);
+			}
 			src_perms = BIT(QCOM_SCM_VMID_HLOS);
 
 			err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
@@ -2431,7 +2428,6 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 			if (err)
 				goto err_free_data;
 		}
-
 	}
 
 	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
@@ -2490,6 +2486,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		misc_deregister(&data->secure_fdevice->miscdev);
 
 err_free_data:
+	kfree(data->remote_heap);
 	kfree(data);
 	return err;
 }
@@ -2512,6 +2509,7 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	struct fastrpc_buf *buf, *b;
 	struct fastrpc_user *user;
 	unsigned long flags;
+	int err, i;
 
 	/* No invocations past this point */
 	spin_lock_irqsave(&cctx->lock, flags);
@@ -2529,8 +2527,27 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
 		list_del(&buf->node);
 
-	if (cctx->remote_heap)
-		fastrpc_buf_free(cctx->remote_heap);
+	if (cctx->remote_heap && cctx->vmcount) {
+		u64 src_perms = 0;
+		struct qcom_scm_vmperm dst_perms;
+
+		for (i = 0; i < cctx->vmcount; i++)
+			src_perms |= BIT(cctx->vmperms[i].vmid);
+
+		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
+		dst_perms.perm = QCOM_SCM_PERM_RWX;
+
+		err = qcom_scm_assign_mem(cctx->remote_heap->dma_addr,
+					  cctx->remote_heap->size, &src_perms,
+					  &dst_perms, 1);
+		if (err)
+			dev_err(&rpdev->dev,
+				"Failed to assign memory back to HLOS: dma_addr %pad size %#llx err %d\n",
+				&cctx->remote_heap->dma_addr, cctx->remote_heap->size, err);
+	}
+
+	kfree(cctx->remote_heap);
+	cctx->remote_heap = NULL;
 
 	of_platform_depopulate(&rpdev->dev);
 
-- 
2.43.0

