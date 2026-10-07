Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8638342EEC4
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 08:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791362710; cv=none; b=BQw8lwZs8DPD6Eukn4/Qo/xU9XXgzSx+0Uea6UInpbqp6zmj8ebJ+8Cg/gaHKWEZ6MNvPsBXTjUyfI/Yp+0mTum648sdIo4mnS7BXpLsb5INtWGmNLKwuF/jhWwize1l09X+yJ/449ZuJA3Vu6+1Nsqss0wgRu/EZpCHHCcoGAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791362710; c=relaxed/simple;
	bh=wUBfnAtW7ikwRBMDesTAqtXMrqSWV+pk/4ISNsj2Xug=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AbrUVBWbsCpvhyjx1mBfW+6glsjFUQ4VgmQBN+M0By7XFl+DScz0x4Kc3PWnT5PkRCoCunDFagRpRsYG5xZRzrgPfN4Al+CJE8MOGnFbxNqqUEmbVR7k+vvaQaO/sD2oHRkxDlPj4i+H8Z0lAA2qGlyjEWwKAkkTiXOfdq79acc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pPtTSZib; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W4bW4fGD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pPtTSZib";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W4bW4fGD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jmZt3686141
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 08:45:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=22/EzgF3eNH
	k3tF3ZBt8AlBMV+Qj6qZL9Uo0C5iD4e0=; b=pPtTSZibPL4np4OcArWt5IJ5USQ
	OtGrAURpfc6cVrcHCBbWznYzpat0zVft44H7L3obzge5yDPoGBdvWOuXOKUHKr5Z
	e11AlAf0RwNmwPLJXc0DUTT9eiB5PD9DXAjSr7/09s6iJGjM6SHL+TnQ2ohkyQjK
	7Ms1l/RrjHp6DaY0Cd7iZXXEPbKtsk5I7elcObHMYwLHvOKDHCrtzhhqK9KsfAqU
	kZAgEeYf3irLEAiYkJ5xS2Bqt1LS0oxMW8G/PUcqxi6S+7EcGJeNQsPFzPalGVJp
	ZvcbIyl9phP5wzbrwrU3JXhIxAhkVKlpP3N8WnA8LrhzpkeZE21J2gCPCcg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c609a77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 08:45:08 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc7ce00b8c6so3068881a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 01:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791362707; x=1791967507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=22/EzgF3eNHk3tF3ZBt8AlBMV+Qj6qZL9Uo0C5iD4e0=;
        b=W4bW4fGDYL1oj9niDcoPJZhEH1GuwlFAp7kwoa3Vds1W4lCFhVc9KfQgG2LNKaCrdn
         eG1OsGraoXuleirpSwk3OxrUV0X9LBCgvtFINcAMl0KVc5+VBzN9tex5r9m5oS717DBZ
         mwKkCPWPv1tbOT9vYLT3HT2hr/0XXHGR7+E1eOZTt9YKIlfIrmYzOXHpJ75hCmldwo9o
         Z3rLY2h0AMLcZCtzcQpzdrfBs5XlQFgUimgrl8/os3Ed3BcMaHr/+cvP3994V/boQRYd
         vXdP8IzF9fLv4MLMCF6u+NXCL8+bPs9pl86BBbukTr6SjxsNYsNlCDU1xo0Hel3Wh3It
         7hug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791362707; x=1791967507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=22/EzgF3eNHk3tF3ZBt8AlBMV+Qj6qZL9Uo0C5iD4e0=;
        b=DBOHpQrJcL9gSm7sUEPbr3md0xyR2Up9oKeMpwdzcTS/eXrPiCqTH2BGSi9nC29xd7
         XseruDVVcDubdRLy+Q1kcWh1kotfDTQfJ8K/lLBK2wxbQzokSDw/eFaqmbA8yJ54QQx6
         iNFEnaZFUzvdMMP/El2TBSHdp6m85nKcxYTr24CS0hcXZsneRx2JSCNOHCuv1ATiUBVw
         5FDPiIyBVzwotzwXgJy8iLiV7EI2vU0ZY571LWrJt/DC/JXRwb80wvDJj8sYdv9tDydk
         f7DaTWJoSjtyH2Jv1rABGYBwOjY15R9nrgzfdTKiJcV4G472pLhI+bVlM+c0/jf6c72L
         cwcw==
X-Forwarded-Encrypted: i=1; AKwUvBwIOPOJA+Vp60L2mXBu6MQICwcn7b60sJspwl+i+cgX//HIjfC9WhZk+Cmjl5C91Jae31LIb7nWa9tezKmp@vger.kernel.org
X-Gm-Message-State: AFuF++mV2PsxmjmS6oaHRUKuPVjT0DJU5HfZxKhTkQmUHtvBC2ergoVN
	eE6GPOZXqg9nPcu/lwvUauWvOLo5qGax14uaIKWIOE1BU/s4vEwbdXnxHrBFN27p1d76KAwSM6/
	YjNjPs/I8xiiEHHODvmNyVyigMRYVGwTdIS6lPZxPN4j5HWRPja9DUUto0I5FoZ+XYgK7
X-Gm-Gg: AYBFou3vD8hFoqaOzU0asovTkOqwj4TXnyRudNTbWOBnyE6Wj1D5x/uGJ/dN7VzLUPY
	h/udaju+91adGRGgAIPpH2qB+oYQ9xt4z4DKxfzcVoXDH/h1GjNl0EGVjL4Jac/xyuH91HpNPVw
	VMdSaJIkfpB8q5RhH3fDR+0jd4U3BAdqFwMqxmh1btNf48F6NT4ogUWW/PIwzAyEDgcoVVbS454
	ltrVmhuAxhyQhziGRF5QOMf6Yexk4L57glxXbNtEFXMO5E6OgSWtXQ1/+6bbZ76EkJSL3ItlKzW
	RbFaRPtJkGId50cvrilgJHlD71JjL8x8uDyO742KgtQ/YAp7Vi1a2zQOGfYQFbeQ81icnNkhl97
	NkMxwxkqG2+WL/qa0AgvsYRXnO3RmN+IuUKYyrLSMeoRkSNAIcvzBLytOEdGCuxuLDLbiLYk=
X-Received: by 2002:a05:6a21:6b0f:b0:3da:5eda:d167 with SMTP id adf61e73a8af0-3e133db9c3bmr1118663637.5.1791362707357;
        Wed, 07 Oct 2026 01:45:07 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b0f:b0:3da:5eda:d167 with SMTP id adf61e73a8af0-3e133db9c3bmr1118640637.5.1791362706877;
        Wed, 07 Oct 2026 01:45:06 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd0a8b0616esm1075091a12.6.2026.10.07.01.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:45:06 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Escande <thierry.escande@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
Subject: [PATCH v1 3/3] misc: fastrpc: drain in-flight invokes before tearing down context banks
Date: Wed,  7 Oct 2026 16:44:47 +0800
Message-Id: <20261007084447.922-4-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007084447.922-1-jianping.li@oss.qualcomm.com>
References: <20261007084447.922-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: PG75kkQcAZGkbc0d5q8K6ytVhh5HAyrB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNCBTYWx0ZWRfX0OpDlZKNXv8o
 7LGu7WOTegjQxwrMTOvxEMc5yEe37+zdWt7p6n2MXrkp5LOUwwn4uA+srvK0EHs3uoeOsn+CPyL
 0XNhtAj6iYWEPaDqONipAwGIC9pChXA=
X-Authority-Analysis: v=2.4 cv=PM+aavqC c=1 sm=1 tr=0 ts=6ac60694 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=XraR69nYKyiK7xGMLcsA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: PG75kkQcAZGkbc0d5q8K6ytVhh5HAyrB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNCBTYWx0ZWRfX6LkVnVBP9+CX
 r+0zHln9vd3fn3hNMXpCW+WRb/n4RQnZ0qVDJq9EEoMvMTuzc9xbcV5QPWRCWgRT5tsmKGb4Ysw
 nwljrafWOgVXcqB8Wz+L465el8rv3Kstxc2uJDBl1RyrQeu+IgB50Lodw28xvfK9pcfnX2Jbh7m
 FU6Ku8E6yejj/PucPO+WBRicmUBI2pOFC6GwQMB6VKuZc3NTgNtnnVrlo8DlwwEE/ndz1l2RSbv
 apGxq/eZt7OJ7j4bvXjBEcCoRQeJTP5G62ugemlxWAg/BsT3NE9qAcsB0WDqWSEucchyxNwAPAO
 HInF0iXjbM7c9c3+dRDlGHQtxjVR/AhMKYZbOFBAFowptlZpD7cvAXMhzg6qr/0ECCp9VcX4wvs
 JugLqCB9rGTLDI87XgM0adQUZUi8Zj0e6rJPw67QIfGrq5XeC5YZsaRmX5j/1fD6Lo/vvZqdW6t
 inBB1gx5WGD3xJnJ/tg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070034

fastrpc_rpmsg_remove() clears cctx->rpdev, wakes every pending invoke
with -EPIPE through fastrpc_notify_users(), and then goes straight on to
of_platform_depopulate() the context bank devices, with nothing
synchronising the two:

 - The only thing stopping new work is the unlocked rpdev check at the
   top of fastrpc_internal_invoke(). A thread can observe a valid rpdev,
   get preempted, and resume in the middle of the teardown.

 - Invokes that were already admitted are woken and head for the bail:
   label, where fastrpc_context_put() releases ctx->buf through
   dma_free_coherent(). If the depopulate wins, the call runs against an
   unbound context bank and falls through to dma_direct_free(), which
   treats the IOVA as a physical address.

Close both windows under cctx->lock:

 - Add cctx->teardown, set at the start of fastrpc_rpmsg_remove().
   fastrpc_internal_invoke() checks it and, in the same critical
   section, increments cctx->invoke_cnt, so an invoke is either rejected
   or counted. The count is dropped on every return path.

 - fastrpc_rpmsg_remove() waits for invoke_cnt to reach zero before
   clearing rpdev and before touching any other channel resource.

The gate lives in fastrpc_internal_invoke() rather than in the ioctl
dispatcher so that it also covers fastrpc_device_release() ->
fastrpc_release_current_dsp_process(), which sends INIT_RELEASE outside
of any ioctl.

Teardown is kept separate from rpdev because the two have different
lifetimes: the gate must close immediately, whereas rpdev has to stay
valid until the admitted invokes have finished rpmsg_send(). Clearing
rpdev up front, as the code does today, lets an invoke that was sleeping
in an allocation dereference a NULL rpdev:

  Unable to handle kernel NULL pointer dereference at virtual address
0000000000000358
  CPU: 2 UID: 0 PID: 2003 Comm: adsprpcd
  pc : fastrpc_internal_invoke+0xb40/0x1398 [fastrpc]
  Call trace:
    fastrpc_internal_invoke [fastrpc]
    fastrpc_device_release [fastrpc]
    __fput
    __arm64_sys_close

The faulting address is the offset of ept within struct rpmsg_device,
i.e. the cctx->rpdev->ept dereference in rpmsg_send().

Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 60 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 56 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index c54c450cb571..3036925632d0 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -328,6 +328,15 @@ struct fastrpc_channel_ctx {
 	atomic_t ctx_seq;
 	u64 dma_mask;
 	const struct fastrpc_soc_data *soc_data;
+	/*
+	 * Set once fastrpc_rpmsg_remove() starts tearing the channel down.
+	 * Checked under @lock so that no new invoke can begin afterwards.
+	 */
+	atomic_t teardown;
+	/* Number of in-flight invokes; guarded by @lock */
+	int invoke_cnt;
+	/* Woken whenever @invoke_cnt drops to zero */
+	wait_queue_head_t ssr_wait_queue;
 };
 
 struct fastrpc_device {
@@ -1350,12 +1359,23 @@ static int fastrpc_wait_for_completion(struct fastrpc_invoke_ctx *ctx,
 	return fastrpc_wait_for_response(ctx, kernel);
 }
 
+/* Caller must hold cctx->lock */
+static void fastrpc_channel_update_invoke_cnt(struct fastrpc_channel_ctx *cctx,
+					      bool enter)
+{
+	if (enter)
+		cctx->invoke_cnt++;
+	else if (--cctx->invoke_cnt == 0)
+		wake_up(&cctx->ssr_wait_queue);
+}
+
 static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 				   u32 handle, u32 sc,
 				   struct fastrpc_invoke_args *args)
 {
 	struct fastrpc_invoke_ctx *ctx = NULL;
 	struct fastrpc_buf *buf, *b;
+	unsigned long flags;
 
 	int err = 0;
 
@@ -1365,14 +1385,25 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 	if (!fl->cctx->rpdev)
 		return -EPIPE;
 
+	spin_lock_irqsave(&fl->cctx->lock, flags);
+	if (atomic_read(&fl->cctx->teardown)) {
+		spin_unlock_irqrestore(&fl->cctx->lock, flags);
+		return -EPIPE;
+	}
+	fastrpc_channel_update_invoke_cnt(fl->cctx, true);
+	spin_unlock_irqrestore(&fl->cctx->lock, flags);
+
 	if (handle == FASTRPC_INIT_HANDLE && !kernel) {
 		dev_warn_ratelimited(fl->sctx->dev, "user app trying to send a kernel RPC message (%d)\n",  handle);
-		return -EPERM;
+		err = -EPERM;
+		goto out;
 	}
 
 	ctx = fastrpc_context_alloc(fl, kernel, sc, args);
-	if (IS_ERR(ctx))
-		return PTR_ERR(ctx);
+	if (IS_ERR(ctx)) {
+		err = PTR_ERR(ctx);
+		goto out;
+	}
 
 	err = fastrpc_get_args(kernel, ctx);
 	if (err)
@@ -1428,6 +1459,10 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 
 	if (err)
 		dev_dbg(fl->sctx->dev, "Error: Invoke Failed %d\n", err);
+out:
+	spin_lock_irqsave(&fl->cctx->lock, flags);
+	fastrpc_channel_update_invoke_cnt(fl->cctx, false);
+	spin_unlock_irqrestore(&fl->cctx->lock, flags);
 
 	return err;
 }
@@ -2635,6 +2670,9 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	INIT_LIST_HEAD(&data->invoke_interrupted_mmaps);
 	spin_lock_init(&data->lock);
 	idr_init(&data->ctx_idr);
+	atomic_set(&data->teardown, 0);
+	data->invoke_cnt = 0;
+	init_waitqueue_head(&data->ssr_wait_queue);
 	data->domain_id = domain_id;
 	data->rpdev = rpdev;
 	dev_set_drvdata(&rpdev->dev, data);
@@ -2678,11 +2716,25 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 
 	/* No invocations past this point */
 	spin_lock_irqsave(&cctx->lock, flags);
-	cctx->rpdev = NULL;
+	atomic_set(&cctx->teardown, 1);
 	list_for_each_entry(user, &cctx->users, user)
 		fastrpc_notify_users(user);
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
+	/*
+	 * Wait for every invoke that was already past the gate to finish.
+	 * They have all just been woken with -EPIPE, and no new one can be
+	 * counted, so this is guaranteed to make progress.
+	 */
+	spin_lock_irqsave(&cctx->lock, flags);
+	while (cctx->invoke_cnt > 0) {
+		spin_unlock_irqrestore(&cctx->lock, flags);
+		wait_event(cctx->ssr_wait_queue, cctx->invoke_cnt == 0);
+		spin_lock_irqsave(&cctx->lock, flags);
+	}
+	cctx->rpdev = NULL;
+	spin_unlock_irqrestore(&cctx->lock, flags);
+
 	if (cctx->fdevice)
 		misc_deregister(&cctx->fdevice->miscdev);
 
-- 
2.43.0

