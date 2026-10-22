Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660179;
	b=sLSYU0nqhTj18Ms5hUTXnxBKw8HhI6KFcITDKlT+5fZ5NQmeqeKuX4bwSnfRi/sYhF8K
	 YxfwYXozPlc7WvoCd9zST5xYzGjMQ2NllvWKqtHZxmhLHYIpJg3VAHiNvcsVZZl1Q2CAj
	 kFMcA9yOEzC37tqC8Zdywnq4SqqB+5W2h3rj70E25j3fGHfrSdkKTrTl0uKkRGvOWZFGb
	 4Hbrrth8w7c1e57dUYDT9YrE3cGIQN//tZEG6zWPZ2anFN809LkC+fycakVtqt1GoF8qn
	 GdjCb1nA9QzMlZIPEKU261gof1Ai9/4uvCQ7xyn7/rMsXGz4EnFv4ReHipDylZnZSzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660179;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HjfWDRPzYl5PNTaWP9ttZL/Fu+3IQzVkWXRGbtuepsA=;
	b=WIJ9Tig+K+sxDU89uJKwhzhEqonOmmIDYR56Qpt9l6/vUQj0BvqLBwmABb2E5WvNbIkX
	 bQDmqYn3J7qbBJYqZFYZdHUXaLr85xqIzjQXqsZjY233foiIPEAd7fPmy2f6JglZhH8dn
	 ktaKft7vGqGJJGYcciQ6CdwfcwkXmmIvJjDM66MeCLXUF/8M8Pn8f5Ljbc3w425RxIEau
	 sjZ1TT3JhGWm9cQNC0WCrMR11CBMPt3K6QjpT+0B9WC1nK1ZO30/pM9OWKJs4Zht3fXnw
	 XVScdkQDnR5TzeNPMZT1+MLOfSedAdxrsnp56WUkw4RtC94W9AJ7+5+oQGbO8nJwYjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b3ErXA3N;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NUSImDFz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DAE606A31D
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:09:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49DAE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b3ErXA3N;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NUSImDFz
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M707AL4136673
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:09:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HjfWDRPzYl5PNTaWP9ttZL/Fu+3IQzVkWXRGbtuepsA=; b=b3ErXA3NK6BbgHoJ
	Xrfe5LF1YuKsQFI+mcFcBuqsTWz/ou9wj9dooSaVafC7BpmvW4I9DFPa9Uw3a9f4
	JxVWJvH9ss44Y5Zemv7KvroirpVXgx/eZ51LbiETmz/ejYQ7pX1GCyj4xikIw32k
	32s1r3XTUO+D0CR5iJK3jrJAYb/hxdPAMsOA1eYTZfS6juehv0NIySdmJwy4fudR
	I1SSRqc+TWc4TnOHwKkFm2IZAZ5Zl+ydlo4k8N5m6KvD5E8JVoQb2oJJMit7pSYA
	iGqXY13Py0+iZgzEQD2wKJ0LjhugBOmwKK6L/mUlqAVSShJHduUVqZJ1cRarOG3M
	KxFuhw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93d9m5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:09:38 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3101525eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792660178; x=1793264978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HjfWDRPzYl5PNTaWP9ttZL/Fu+3IQzVkWXRGbtuepsA=;
        b=NUSImDFzb3kQx8acUDLVNMP6oF2AfsSZlkSMY8wQb/QoQUCDcdJrvVCf8CstpVW88+
         sEzxKcPZ2+oMZVikP1Gcz7FPu88E4fiKz5D5YLiiW76iZuy3PEfjcsnPWf+YM5l9EhN6
         mFIhZ7l4cfKjuu9KlS83g2RwwrCzMeD+gotdQwQ1WR6/giI+Q+6B3B082NxUhtvn2Eib
         OGBSrax1Jzm2ZL9QCYDO720l8xy1H2LAt2smMgFewhtA/NRtyHbDqWeonYKvAo5u1JQi
         KTFDCGY7sXiH+vkcelXfJ8jh8nEwUzmgZcPomCy8LyG8i8SSJbRx3Hj6Tl6esM3HHxsR
         68GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660178; x=1793264978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HjfWDRPzYl5PNTaWP9ttZL/Fu+3IQzVkWXRGbtuepsA=;
        b=EvWXx+I7MAHOErOCo6pqQUVwzkTJSzp7ng7MUV6eQskD4sVpd7nfG31fHhqdU+DJrA
         513mPWSzWLwjq+7Ey02SdD8nmvmYYjAyMxbpu0wRFm66OflPOuFhy6kvM3eUwh/OIAIO
         oQ0Nn6+FtGZVMJ2heT6kUBosywyzB/bRRoypoyXGcSHtOLEi+UXaRzr2N5IzR1aRCZGS
         D2O/zNCtu/5f6Am+KB4VYDQxHXpoN/hSUSX9iD4Dvi9+K/yJIpg9AfCAKJe3a+/epCMh
         yffkj5Z4OdACg1ugR9EYzZ9sSr04SX+0gHBdSui1k9ya1IBab7o661DxgLDBzvBySHJK
         Qa/A==
X-Forwarded-Encrypted: i=1; AKwUvBzcpoviEZrwxtNQqKmKLheGgycELHd5jFdoV/ZSsju+GGyTSW+D+Jsjmy3T+mlBd05ljfaojNyriwZJgEzf@vger.kernel.org
X-Gm-Message-State: AFq9FYJQAojr6o7nUjFvIy/2dY47EHr2nKvYjZirveQvUt84MaSSq8F1
	ORGiaEukoWWKPNhbkG20h50IHnzxeFEdRvL+rUApbpCLLd0eObQAeK2StiQkbFRYPPAAHr9gIF/
	HozcrC4PH7ARktXcaJ9mpDuinlS4Ls5jeC3Tgb3Td6Hsm7+rkRdeySJaVPCaE/o0DUAet
X-Gm-Gg: AYBFou1GeiI4cOx7PlYx0xL9Iv6WyfHdzsfz7I0S0iiH7F2iCu0Mlj7ySna22+CL/aS
	mZWWED0S4w2V+fZfPZjJy7/oInLvUre4kUwmhcXvqzyZHidf/nJ92AWewGDR1FxRKaWBbyfQJc/
	ATzXZ+OXDYsd795WJzBgnoAoyKCQsXq1Slgr1ZX2hbq4TiBSkNDx0HqKxK4opobr/FJSEDc59MN
	fKyDaUAKsv7McLB2QUhubWSIkopMmlkPIwJ4FoIqVnVeOMjqn0UU0Nv+6Ia/aB96m57hhAjuChl
	g1aNrcKaw78cBJNksP6353gvYw/hMTK86lWziirENpQn+370r768qbgmw9YcUhLSmoRbxJaoG1U
	x79/1UWCheC9kig2geGaqRTtv98FL2BOe
X-Received: by 2002:a05:7022:691:b0:149:d501:b990 with SMTP id a92af1059eb24-190a599a59fmr8274769c88.25.1792660177730;
        Thu, 22 Oct 2026 02:09:37 -0700 (PDT)
X-Received: by 2002:a05:7022:691:b0:149:d501:b990 with SMTP id a92af1059eb24-190a599a59fmr8274735c88.25.1792660177165;
        Thu, 22 Oct 2026 02:09:37 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a180b9esm20475694c88.4.2026.10.22.02.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:09:36 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 14:38:48 +0530
Subject: [PATCH v2 2/2] misc: fastrpc: fix init ordering race in rpmsg
 probe
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-fastrpc-probe-fixes-v2-2-a6b3f6f62571@oss.qualcomm.com>
References: <20261022-fastrpc-probe-fixes-v2-0-a6b3f6f62571@oss.qualcomm.com>
In-Reply-To: <20261022-fastrpc-probe-fixes-v2-0-a6b3f6f62571@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Escande <thierry.escande@linaro.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792660163; l=7445;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=zUgEbnWLsDTknLyFxpzFJGnr20DIE7GXMRNqYKnIzjk=;
 b=rmpt0ZUKSJ5j1Ux8PcHksq0tkZILGFGnayKQum0+doGDcNPo84jXam4cm0VCiRZunLLFhVusl
 zEbfz+cg7LjDJUs7v9wtC9r9xYt6P8EdcjFRNLoXFHUlcz49rC15cb0
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfXwS1e0bzn5eUO
 HlG+0TGLfDG/kYIIBx2ksx3QWrjDa2rfhA0cO125CEOeAiKYm//RO3LzWBGQAewET5gaUdr4Z3N
 8xclGpUwNwTJxypcPZKIil55koyITEg=
X-Proofpoint-ORIG-GUID: KbGfg_RZb0Ua7nAwXeBctveal_Cfbq77
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX1UuDuEVIi9sj
 7Ls7h4Ac/cJ7N3sOC/hghbjuscoYpOPztx8zEge5lJ6hB6A0t5TIYMv069oc+t1sXamRdHJsjqV
 BHsjLaQ0QxMektWyMhPQM20cyj6i+9Sqbz0LCyaWvdhlqEASZdc3VubgT3Z9BTCGYFPzkh0XHdf
 fnZZQnyceF2vba5XA9P1Iq6Y+KXAPqqm8FLKHwd8eioosy/lgYG2NcfwTGRMHUNGkg9leNz6g9C
 O05tXErod2h/L0Hl0nnKshLvmp6cCW1JGwrwRnKsF5P7cg1qZgnnjG9ixKzwwbuAxukovhCAc3h
 XVt5u7GLmwSILBOw4x1keEYYNHBxwnUTjYM9R3cJRZxihaQlbVAFGpd+YDsV3r/cWxSZLE5Jxbb
 ssCVsV4dCHsnVXKkingFTOGMNR19lUp3FQQr+V2FirnvtgiS7Z6Nu6PSptrauVVmhuFAkmvAEXo
 rUN25TK0R6LgCOpIfiw==
X-Proofpoint-GUID: KbGfg_RZb0Ua7nAwXeBctveal_Cfbq77
X-Authority-Analysis: v=2.4 cv=TIPQ2Fla c=1 sm=1 tr=0 ts=6ad9d2d2 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RafEaDNIwz_KoXd2q0MA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220036

fastrpc_device_register() calls misc_register() which makes the device
node visible to userspace. However, kref_init(), spin_lock_init(),
INIT_LIST_HEAD(), dev_set_drvdata() and fastrpc_cb_devices_create()
were all called after the switch/misc_register block, leaving a window
where userspace can open the device and call fastrpc_device_open() on
a partially initialised channel context.

On a concurrent open(), fastrpc_channel_ctx_get() calls kref_get() on
a kzalloc-zeroed, never kref_init()'d refcount of 0, triggering:

  refcount_t: addition on 0; use-after-free.
  Call trace:
   refcount_warn_saturate+0x120/0x148 (P)
   fastrpc_device_open+0x204/0x258 [fastrpc]
   misc_open+0xd8/0x1a0

Additionally, fastrpc_cb_devices_create() not having run means
sesscount is still 0, so fastrpc_session_alloc() returns NULL and
fastrpc_device_open() hits the error path which calls
fastrpc_channel_ctx_put() on the already-bogus refcount. This
triggers the free callback, kfree()-ing the channel context. A
subsequent IRQ-path fastrpc_rpmsg_callback() then dereferences the
freed spinlock:

  Unable to handle kernel paging request at virtual address ffffcd5841510ca0
  Internal error: Oops: 0000000096000047 [#1] SMP
  Call trace:
   queued_spin_lock_slowpath+0x414/0x5e0 (P)
   _raw_spin_lock_irqsave+0x74/0x90
   fastrpc_rpmsg_callback+0x4c/0xf0 [fastrpc]
   qcom_glink_native_rx+0x6c4/0xf10
   qcom_glink_smem_intr+0x1c/0x38 [qcom_glink_smem]
  Kernel panic - not syncing: Oops: Fatal exception in interrupt

Fix by moving all channel context initialisation (kref_init,
spin_lock_init, INIT_LIST_HEAD, idr_init, dev_set_drvdata) and
fastrpc_cb_devices_create() before fastrpc_device_register(), ensuring
the struct is fully ready before the device node is visible to
userspace.

Add err_depopulate label in the error path since
fastrpc_cb_devices_create() now runs before misc_register(); a
fastrpc_device_register() failure must call fastrpc_cb_devices_destroy()
to clean up the compute-cb children.

On CDSP/GDSP the secure node is registered before the non-secure one, so
an application may already have opened the first node and hold a channel
context reference when the second registration fails. Freeing the
context with kfree() there would leave that user with a dangling
pointer. Handle it like fastrpc_rpmsg_remove(): after the nodes are
deregistered, clear rpdev, wake pending invocations with -EPIPE and drop
only the probe reference with fastrpc_channel_ctx_put(), so the last
holder frees the context. Move fastrpc_notify_users() above probe so it
can be used there.

Fixes: 3abe3ab3cdab ("misc: fastrpc: add secure domain support")
Cc: stable@vger.kernel.org
Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 83 ++++++++++++++++++++++++++++++--------------------
 1 file changed, 50 insertions(+), 33 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index f280bff2edf0..fc09cd27af4b 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2548,6 +2548,18 @@ static int fastrpc_init_reserved_mem(struct fastrpc_channel_ctx *cctx,
 				  cctx->vmperms, cctx->vmcount);
 }
 
+static void fastrpc_notify_users(struct fastrpc_user *user)
+{
+	struct fastrpc_invoke_ctx *ctx;
+
+	spin_lock(&user->lock);
+	list_for_each_entry(ctx, &user->pending, node) {
+		ctx->retval = -EPIPE;
+		complete(&ctx->work);
+	}
+	spin_unlock(&user->lock);
+}
+
 static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 {
 	struct device *rdev = &rpdev->dev;
@@ -2557,6 +2569,8 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	bool secure_dsp;
 	unsigned int vmids[FASTRPC_MAX_VMIDS];
 	const struct fastrpc_soc_data *soc_data;
+	struct fastrpc_user *user;
+	unsigned long flags;
 
 	soc_data = device_get_match_data(rdev);
 
@@ -2605,6 +2619,23 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	data->poll_mode_supported = soc_data->poll_mode_supported ||
 		of_machine_get_match(fastrpc_poll_supported_machines);
 
+	kref_init(&data->refcount);
+	atomic_set(&data->ctx_seq, 0);
+
+	rdev->dma_mask = &data->dma_mask;
+	dma_set_mask_and_coherent(rdev, DMA_BIT_MASK(32));
+	INIT_LIST_HEAD(&data->users);
+	INIT_LIST_HEAD(&data->invoke_interrupted_mmaps);
+	spin_lock_init(&data->lock);
+	idr_init(&data->ctx_idr);
+	data->domain_id = domain_id;
+	data->rpdev = rpdev;
+	dev_set_drvdata(&rpdev->dev, data);
+
+	err = fastrpc_cb_devices_create(rpdev);
+	if (err)
+		goto err_free_data;
+
 	switch (domain_id) {
 	case ADSP_DOMAIN_ID:
 	case MDSP_DOMAIN_ID:
@@ -2613,7 +2644,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		data->unsigned_support = false;
 		err = fastrpc_device_register(rdev, data, secure_dsp, domain);
 		if (err)
-			goto err_free_data;
+			goto err_depopulate;
 		break;
 	case CDSP_DOMAIN_ID:
 	case GDSP_DOMAIN_ID:
@@ -2621,7 +2652,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
 		err = fastrpc_device_register(rdev, data, true, domain);
 		if (err)
-			goto err_free_data;
+			goto err_depopulate;
 
 		err = fastrpc_device_register(rdev, data, false, domain);
 		if (err)
@@ -2629,30 +2660,12 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		break;
 	default:
 		err = -EINVAL;
-		goto err_free_data;
+		goto err_depopulate;
 	}
 
-	kref_init(&data->refcount);
-	atomic_set(&data->ctx_seq, 0);
-
-	rdev->dma_mask = &data->dma_mask;
-	dma_set_mask_and_coherent(rdev, DMA_BIT_MASK(32));
-	INIT_LIST_HEAD(&data->users);
-	INIT_LIST_HEAD(&data->invoke_interrupted_mmaps);
-	spin_lock_init(&data->lock);
-	idr_init(&data->ctx_idr);
-	data->domain_id = domain_id;
-	data->rpdev = rpdev;
-	dev_set_drvdata(&rpdev->dev, data);
-
-	err = fastrpc_cb_devices_create(rpdev);
-	if (err)
-		goto err_deregister_fdev;
-
 	if (data->domain_id == ADSP_DOMAIN_ID && data->sesscount > 0) {
 		struct fastrpc_session_ctx *last_sess;
 		struct fastrpc_session_ctx *dup_sess;
-		unsigned long flags;
 
 		spin_lock_irqsave(&data->lock, flags);
 		last_sess = &data->session[data->sesscount - 1];
@@ -2673,23 +2686,27 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	if (data->secure_fdevice)
 		misc_deregister(&data->secure_fdevice->miscdev);
 
+err_depopulate:
+	/*
+	 * A registered device node may already have been opened, so a user
+	 * can hold a cctx reference. Drop only our reference instead of
+	 * freeing the context directly.
+	 */
+	spin_lock_irqsave(&data->lock, flags);
+	data->rpdev = NULL;
+	list_for_each_entry(user, &data->users, user)
+		fastrpc_notify_users(user);
+	spin_unlock_irqrestore(&data->lock, flags);
+
+	fastrpc_cb_devices_destroy(rpdev);
+	fastrpc_channel_ctx_put(data);
+	return err;
+
 err_free_data:
 	kfree(data);
 	return err;
 }
 
-static void fastrpc_notify_users(struct fastrpc_user *user)
-{
-	struct fastrpc_invoke_ctx *ctx;
-
-	spin_lock(&user->lock);
-	list_for_each_entry(ctx, &user->pending, node) {
-		ctx->retval = -EPIPE;
-		complete(&ctx->work);
-	}
-	spin_unlock(&user->lock);
-}
-
 static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 {
 	struct fastrpc_channel_ctx *cctx = dev_get_drvdata(&rpdev->dev);

-- 
2.34.1

