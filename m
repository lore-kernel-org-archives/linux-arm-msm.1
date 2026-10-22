Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792636550;
	b=TI8hVu/A1kEk8JZe1+19CwwqJ2YnHJ2opCdNDnJEwEO7n2bpW+QFxoRAhOKO9HgyJS+6
	 7q9a/jbtB24I7aP4q4wu03bgY7KLt5kChSdaHahT+GnlmfCizLt6RSXkVoa/qjLFXDLHY
	 3TJ7Fpnk/ys3b12btQHKqJo1YWyYQ2Ci12GsbuIF+OM2x0e/hRA89ffg4cXq8iQ2WA525
	 mwSsA84pu8PxQMNSKArjydoCCnu7fBumVXeMYV/rB7Bc4rRY9UXR+47L48aB3iHx5+0HN
	 yZD/n36336eIW3jUm5+v4FbBHM1gndLk/+/x1dKJsX9DP0dbvyZTik0opktg64MBorQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792636550;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NX7bsqG292StQteEaBo56Z6RlMknr2B+M80QoiufMRA=;
	b=Ll388Cb1SdGfWvY9GxMejO2LRR6nJ0afkFFBS4m2c2fC/hcCunbwFiaFhtI514mtziIA
	 IfC4j9Ms0LZjf8VWysi61qMAaasHapUfQ9Lr6PDY+8HSy85ZL/7s9jqg6Iw3E99fNjTeb
	 lz6gsO2jGCKp7j8gs5aDdmqoUYrRJ7CAhsv3D2Ir0ace9GP+qSwsl3tMCACF2m7qGZKev
	 c5paorUlmgFkPmjeT/1RW4vNVFL9rgVSl0uMmUtN4E6vXD4miwAX7FItFTVAsnNed/u/M
	 84Ea5AnB85mnLcfQuSjm3vkNBrhrBnnRX98saT1OEK3JpqHriXVLSGNYA64jZPMvHag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pvsjUTz2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eZTqnb63;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43621606A31E
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43621606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pvsjUTz2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eZTqnb63
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M2Xfqp3015831
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NX7bsqG292S
	tQteEaBo56Z6RlMknr2B+M80QoiufMRA=; b=pvsjUTz2cj0zDLqbE07MDsCoQc1
	HDTaFprqfAcxjqajgEAHVmv2DtWJ70C0AaIPyo8F05NAAk4v07Jjg2znmQLlD3xI
	bmCF+q9m+QwkZvKJVvcUFFOLnesfG7Qe2zooD1crUkmuCU/K09vBYhR+DGp+I/RW
	ixFNWDhDnhFa8qqdMBp93nxCAg2eO2Fh7eJIt70ENEIXcwynktnUjCzr5zuMlmN3
	JmSLRrzE1UhPw+tQ1NRRygPSue0nxZtiANx+5ZVoxbmQ4YqKQ6bH4bSMibApKFpu
	i9uqhnRAVbLQj8ydfkYZwJGT3Z3TsYcrcL5iYj/RPup/jyqZhvSgpg+zR5Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93c88q1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:35:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e601800e58so18655285ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 19:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792636548; x=1793241348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NX7bsqG292StQteEaBo56Z6RlMknr2B+M80QoiufMRA=;
        b=eZTqnb63xvfDSMqmFioNjkyZP1WLZYC2rb/HmrRnJ/zWaHsW+zU5RDbp685uP2AEge
         YB+rbDaJEE3SlyuGLGxalCamUyto6iCx22JEVBHHW8L07d//963yaEUucC9B04jEi5bF
         g3l+BXQ4J1jZjNADxKcbJfSXSRVa4wILn8oNhRPaXgDlAv9e4aWYonYa2S83aYvRU9qs
         AimU2TnrBDvbx8oHBhPnnR0BQAwoAEmj7e/iAkGxhI2fp1Ww1QQ02WtFqV7pNQrKu5MW
         tznbS7vSZ+ce7Pgz6GxHGCU6uYzE+s4+ZZGgHprZvloxO9xhQRCcFbF8Ofng7nokBUeZ
         yymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792636548; x=1793241348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NX7bsqG292StQteEaBo56Z6RlMknr2B+M80QoiufMRA=;
        b=nepLGrfEGQnXq8kNzcTZK1q/vakjqxqU64dLrP+nJf8iyroj9XFN5eraRNaSuE+bnL
         wqRtGrO+pIKt2eR2buJ6JBuG2TUHTWW9MLA6Pjr+imqONFIAX67Sc89+0rAIjzsMMfBZ
         nDMacTOCokCLoDAhuZLccp3uuSf7RngjcyoVDqOX/C/hVRotAfkb5Fa9pE5i8XCxqKgo
         5snXJ5xicVLXS72ucRO2AsycFMRxQIx5oaTi8zld9zfVZxfmBCVjafKVTl4h61aSr/+3
         KiA/RZjBacXMbajqVt0cJDPMRhEO8fXy/1DEnnHTEyjINcM+AdnObKjVCZUFJj7Z8fA6
         alkQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbf4txrJQ/bZ4xHq16vkJEuVUh4YlWeXYOTd9wfO50eIYOXyrPIGXLRKX64QETI9+HhJj2+kt1hMJWFREi@vger.kernel.org
X-Gm-Message-State: AFq9FYKYkgLJbrESlPWWW7kf4UQM15Yj7dj1oAaLK90siZKGQZZcSvuT
	18hcrax68qC3zTYB4gmG0Ee7GLYEuxJtaFtv7b0OGx0EtMxAY8YmZi+avBOrfYBHtEEjdeEMCS+
	VCYzeU8m914vSzLsPvDBV8M2g37ik8pnHi1e0oLDxkVIj8dS37EJliE39EePES+IGTPz1
X-Gm-Gg: AYBFou3Q476LU6LFo4AxnJPCL0TKmqC+8QzdwcdzHFf1nYVC0ca/t2FdjsqCYvApCNR
	d8OGhP/ZZ88g6leybkOhmoIGZntS4XtMEXXRQMOPVwUpmYaDSgkEdUGv/F+3512swhrgFxkkar9
	7FlY4Wegb9KZhWEJHd8rfT1YvdgPKD3Hp4eYUs6Az6OSXfKc5hw/JLtmhW4flkIzlvosN+vle5l
	BGe7CkiPGqUQZs81Pkwv4w0V5FQ72vr/r3Jpe0xEVnQ8N/vlG98KsyZNmMH7O3Zk3Fo18X1MfUh
	Rw05oyE+STe13/Cfs8ZsW50YSbFAD3EvQgzUOUxZwZTZqAqu/gdd6zfVS93f7H6oULyvfXlsq4Y
	kW4RFw+J44OmCrehTllch/Yi4u7MauRgEu3ImOjzl1Fu6TZOxCii6EhtFdZn6dgBpRQomj+Px
X-Received: by 2002:a17:90b:37cf:b0:3ab:2d46:1dd6 with SMTP id 98e67ed59e1d1-3ad86dddc3bmr3988936a91.4.1792636548150;
        Wed, 21 Oct 2026 19:35:48 -0700 (PDT)
X-Received: by 2002:a17:90b:37cf:b0:3ab:2d46:1dd6 with SMTP id 98e67ed59e1d1-3ad86dddc3bmr3988903a91.4.1792636547619;
        Wed, 21 Oct 2026 19:35:47 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada488550esm1959935a91.3.2026.10.21.19.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:35:47 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Escande <thierry.escande@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
Subject: [PATCH v2 2/2] misc: fastrpc: drain in-flight invokes before tearing down context banks
Date: Thu, 22 Oct 2026 10:35:31 +0800
Message-Id: <20261022023531.465-3-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261022023531.465-1-jianping.li@oss.qualcomm.com>
References: <20261022023531.465-1-jianping.li@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAxMCBTYWx0ZWRfX0MvFD+91SltJ
 CiCmG6x/fOzAEM1/wiq+H6FIWNjXJE7I4Fl6mOLj+3ZT8POHu5PYYf9ClLYS8/Gc261cZexMlBV
 awRygx2+0sYjAWCD+rHe1H8k0oTbhDY=
X-Authority-Analysis: v=2.4 cv=ReAFmFtv c=1 sm=1 tr=0 ts=6ad97685 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=XraR69nYKyiK7xGMLcsA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: oMMj1-qtFfJIs_ieV-OTzy-cVDZcn89Y
X-Proofpoint-ORIG-GUID: oMMj1-qtFfJIs_ieV-OTzy-cVDZcn89Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAxMCBTYWx0ZWRfX3/qQoNXIsJR1
 Eqk+Md+xPsyI4k9VPMjg67Ol2tvbUCb652u+vkb+gc7zzui7nxrsfmqgKa1VVwCqPJM6kGZdY+s
 hFfUnuV4i59Pr6q75vQ8RO7jFavlx0FOhnD5SpPDR5UdrfSyTRgoZza/6/+6xXagMCWstg53mR0
 Q8XCQmTtEzENN3/5WRpuBjWmWmkQncfN28ipp8efn376O3Tnu2FhGsHY146dcRF+GyVLqXz+WN1
 uDvOeVJxfG9QAFH5DOvSKzrf85mo/Kg/VxNiAz0VqF+yGRafWyWiDWtXjTZKaB4vwoHw61RrQHM
 xDw1Yuq6VBu8IQj1oJJr6NZq6j96gQJ6fl4KzbAIo8m25CLqXnFxYyvxerTwVkMRq5CPPVtu/fD
 y4sd+iWtvw6mnD4uStE40yKsa/1lv2i2ue1NXLrNos2CTgAYrKEBCJopmUv3mKgnn88YDFax/cU
 fdpuOFqli6+mrxqpB+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220010

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
index d201f26d8e46..cffe96a181a2 100644
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

