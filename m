Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A38030569F
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 16:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789057872; cv=none; b=EIun7pw6cANKBzN+CB8ltJM17UU9ao/gwfYZgCJv/cUVrWqyErTLMtLn3Zpm+ZjE/e2RIFi04pS1D/2HFjJVKO/lUs78ObeY+/MRoNiom6ypVyq3WNhM8+JGvPCmlp6rqn9hyMQ8WTGN83q2VaDEMvmYuGSoDnR92LPmes21RJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789057872; c=relaxed/simple;
	bh=kcJgGBv43uV4lQuuDHe4VjFldBPqvQ8pUtSwWNQ1PIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=t2IJeHrt5Ovi/+DIbrJoLiQ1GYRdWg1FnWYOraiA8CZtjUUxPHEipelsxGJTHfBglzHca3iwlNSQ9DqRjwLECTyRh8SxwVlpbVI02uz6q1KiRiIzxMMxhVogZqkgNlDLwy+cO5eDHr/AzwY55J8H/MTDvyhtc0ZlA8b8IQm4Uho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k46jxYaJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ks85O+sp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k46jxYaJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ks85O+sp"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AF4k5J1652845
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 16:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=m7yzWTdFaMYpCscxPwImij
	Ly8JVKI4jHgQ7Y/ei13oU=; b=k46jxYaJTuZcphY9IGriGaTx8KR/eHKegwy7iF
	mT3YB1cvTGLVdkkeJ5pk+eNt0AJhUzGvnklQlbKL8d9m3JJt4azqWnBN3SZd71j6
	tyqfPd+Kvh4tz3X+3tB+vpMKnq3+5YqNhwMiDTOQt9m7Z+BCdJbEaB/z/6I0+9FX
	fGCPs7h9qfaJWEZ9NO/daV7x9IqUSEGRLP9rkrFxfr9E+TbJwaXxG72c8+KhfI1P
	b9CDepIUA0arxpn62PiV8OPdbzSJMfvKGuaz0WLa+T7Xjx2Rx6Ve57MZQJMwfd58
	cN3g3qfJY5QKbv8L6co1n6IdAO8Q1U7QCppRIznbQa+7Rfqg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrcjtf4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 16:31:10 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dd188e16a2so12014075ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 09:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789057869; x=1789662669; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m7yzWTdFaMYpCscxPwImijLy8JVKI4jHgQ7Y/ei13oU=;
        b=ks85O+sp3zLzzbqZWdG/F8MCP4hN9OmTojOOa2H2w5vhHEOrHBc0UijtfeMmdNSeDy
         76Xj73gO3vjnibznEwwtOTU7iPaZy5BVzV9C/hywrLWW7QvslbayiD+jOQw06tc2Wweb
         rC+tfaMtuNnj08Am4Zll5vCW36K/S6+n8p817gkgEsOFTQy1084Ecjwjmmwzst1yUDcT
         JdIuKYySMic0N0GBRAwDhPs2bjp5TSqqgH+cLB2B2tmci2N4wvMcwFaOuFYDiD3g52D3
         WKevWuz2zqzy8YeVNrYVd0BSH+7bHNt1jAzdNpk1WcEvsb4Zxeep6hjtgUfzwDYqU8AB
         yElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789057869; x=1789662669;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=m7yzWTdFaMYpCscxPwImijLy8JVKI4jHgQ7Y/ei13oU=;
        b=PHBSfAWR6S4Cf9fb52Lurs698/mkZWCVlpG24JEC7czFvV8TygBQs1B6bOzIx1PPpg
         7odGNHhdZ4lL1R6K+Ke1hbPjYNoRv0PO8ZHg7/sDOV27/+DPqsq00XQa8+2syPUXJIVx
         tKF20eDK9A9+4PmeYjY1EOO/gft/FgdCTPs8gp/uxjdk8RwY4rJldgu9cGqU5WlfeP1Z
         Mx8Gp6nxkW2eWlyeQASoBs7A1KJ4RRNgq0lvSRtZXa6njFcP6xBFcEERQF0Gy9Sv38wk
         rPYqo4OqOv9DLkKI+glWWUTO8B+VcWkgmiWjELayedGzmIncFhq11KVa3/UCE8Mk6FB6
         iRgg==
X-Gm-Message-State: AFuF++mClHB3jCVD+KIsCzKKEWNFBPqi2kKWozV3x4TJe4biPn67Hxcd
	PIaGDiOSCVjoem0aw9qz3Pc9d37GD28nvzHyu00DccBRpbgGWWwuvIYbhHymOEM5JfZbfV00PK/
	ZAq0MSO6vZm/h2cPLduqeuuRoSDq+gLcTEhN1x2KQeeyJ8RPihJdgKNrMLSy2B4gFouGn
X-Gm-Gg: AYBFou29wxE9/nL8Hfd9GbR3tO3XGbp5srtalSAaJ1/p1sKrPajv+6kpdupWCiUu/7S
	m7dgIqt0TRYdw4pqkfGQeDfWxealeX5drO5oAXf7DO/NHdtCtBksrABEikyRAUrfC8BgK7XasSu
	2yng5DFWYTydCNFgAs3D9PHtqgnh4gxLtt3MNrBtNA/Q/7Zv/leteaaycMt5w0JrfeVeNQFvS4F
	mCv7MxPby9IuwMPq3tFOng5lTztsTH7wh9p+Ebf+m5QRrIlYYL3moaXdmJvuCTfKo2hrOqsQzJy
	F7et6nH64O6lxWx9FmGpq9VOwfsmygngJIEAvfdPJxThpU5CP/g/eOAoSmRf85KbnvyTmFZAjoC
	3Arzettwo7QTeXCrWVPnRZMOVXZMfE9bOAU+G4brnZIFJf+GUAqgeKzMMLmuGsA3g+JtT39g=
X-Received: by 2002:a17:90b:2542:b0:398:9beb:5c17 with SMTP id 98e67ed59e1d1-39b2620a2bfmr59984549a91.18.1789057869018;
        Thu, 10 Sep 2026 09:31:09 -0700 (PDT)
X-Received: by 2002:a17:90b:2542:b0:398:9beb:5c17 with SMTP id 98e67ed59e1d1-39b2620a2bfmr59984483a91.18.1789057868409;
        Thu, 10 Sep 2026 09:31:08 -0700 (PDT)
Received: from congzhan02.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d94bafb3bsm424320a91.1.2026.09.10.09.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 09:31:07 -0700 (PDT)
From: Cong Zhang <cong.zhang@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 00:31:01 +0800
Subject: [PATCH] virtio_blk: use synchronous quiesce in
 virtblk_freeze_priv()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-virtblk_sync_quiesce-v1-1-a883f8f31258@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAETbomoC/yXMQQ6CMBBA0auQWdukbbABrkIMsdNRR0mVDhAN4
 e4UXL7F/wsIJSaBplgg0czC75hhTgXg4xrvpDhkg9XW6dpoNXMaff/q5BexG6bcIqnaW6yqUJ5
 L4yCnn0Q3/h7b9vK3TP5JOO4vWNcN0oUde3gAAAA=
X-Change-ID: 20260910-virtblk_sync_quiesce-9b2c88d45416
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>,
        =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Stefan Hajnoczi <stefanha@redhat.com>, Jens Axboe <axboe@kernel.dk>,
        Ming Lei <ming.lei@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, virtualization@lists.linux.dev,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        Cong Zhang <cong.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-38bf1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789057863; l=2010;
 i=cong.zhang@oss.qualcomm.com; s=20250926; h=from:subject:message-id;
 bh=kcJgGBv43uV4lQuuDHe4VjFldBPqvQ8pUtSwWNQ1PIE=;
 b=n62tXsCZlwo3B+DeASbqVIAWgz6tguB52thgCTLihVpIEtl7yEH7lwlKoXMLJgcunsnLFSFho
 hgTCaG1bfqqC9qqcQSpc+BLyUiPxSdgV0tmhJCYlBGxIekBRGveLDX0
X-Developer-Key: i=cong.zhang@oss.qualcomm.com; a=ed25519;
 pk=8SBh3ey5igz2nlW+UFC6khFvaNPgG7MmbWtAeO2s6n8=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDIwMCBTYWx0ZWRfXwRf9WB7/5u7B
 cjhOrqTcznVqNGfBKyO03iicC2vL/aMcbztgfmiBRg0bu4tDtk0L3u0Hd+bhzSOcy3vHhyaHWlS
 rpAAyo6oxq/NjHDYpoEcAbzK6XjkE9s=
X-Proofpoint-GUID: IGI4o1X8YZZQJYVSeabZ8iKtG1tIeWAO
X-Authority-Analysis: v=2.4 cv=aef0Dhot c=1 sm=1 tr=0 ts=6aa2db4e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=cmBj7K86vS66_wzKDlEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDIwMCBTYWx0ZWRfX/C2e162UhOng
 u68OAtzDXe/FZaZ30xTNQfHTxfn5grUVzD3cqc1LGhk5W3Ur6M15BRHx9rtc0WGAxs4iY9kF8xF
 WU+1MedCa+350Y7yXX8IOdSMCvllKS54VJhTKqL1/m1k0QYdMzafDoXqChjx6aIZ1HmTDnlxGt1
 FOhhpF16067SGB3/nlFNG+mRAy7FK0mkMHKqm5GgVN8Vs9rXx84AGQiyGnb6eu8n2BLDFgNc92x
 XskemZw+D6Tp0H69dEZ1P3t5FCFB1rTg/28MOurUpfSGU1g+pYf2+n3Y3RUlOFUmaxtWIGw1lJE
 5E6TCQ0Xz+7dCFJnZG2ZHhj2s14/Fc1dM1lLT0RnG0u+Zf++vnUUitCOCc7jmoLIOoXv7KjdcJo
 iBQ16zB7Jkq8+dsHCjiiMTAKQTYTyTlbQQgQ9m/RlPC4e6oEmRugkygV21opwMwVwoj2llFPblb
 1a+eAsP+kvA0Lru5DEA==
X-Proofpoint-ORIG-GUID: IGI4o1X8YZZQJYVSeabZ8iKtG1tIeWAO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_05,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100200

Replace blk_mq_quiesce_queue_nowait() with blk_mq_quiesce_queue() in
virtblk_freeze_priv().

Keep the existing freeze and unfreeze order. The synchronous call waits
for dispatch code that was already running. The queue remains quiesced
until virtblk_restore_priv() calls blk_mq_unquiesce_queue().

Fixes: 7678abee0867 ("virtio-blk: don't keep queue frozen during system suspend")

Signed-off-by: Cong Zhang <cong.zhang@oss.qualcomm.com>
---
blk_mq_run_work_fn() can call blk_mq_sched_dispatch_requests() through
blk_mq_run_dispatch_ops(). The dispatcher checks QUEUE_FLAG_QUIESCED
while the flag is clear. It can then be preempted before it gets a
request. At that time, it has no queue usage reference, so
blk_mq_freeze_queue() does not wait for it.

virtblk_freeze_priv() then calls blk_mq_quiesce_queue_nowait() and
blk_mq_unfreeze_queue(). A new request can enter the queue. The old
dispatcher can run again, use its old flag check, get the new request,
and call virtio_queue_rq(). At the same time, virtblk_freeze_priv() can
reset the device, delete the virtqueues, and free vblk->vqs. The old
dispatcher can then use a deleted virtqueue or a NULL vblk->vqs, and the
kernel can crash.
---
 drivers/block/virtio_blk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index 32bf3ba07a9d..7a570591e040 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -1595,7 +1595,7 @@ static int virtblk_freeze_priv(struct virtio_device *vdev)
 
 	/* Ensure no requests in virtqueues before deleting vqs. */
 	memflags = blk_mq_freeze_queue(q);
-	blk_mq_quiesce_queue_nowait(q);
+	blk_mq_quiesce_queue(q);
 	blk_mq_unfreeze_queue(q, memflags);
 
 	/* Ensure we don't receive any more interrupts */

---
base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
change-id: 20260910-virtblk_sync_quiesce-9b2c88d45416

Best regards,
--  
Cong Zhang <cong.zhang@oss.qualcomm.com>

