Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0193E49BD96
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 11:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790596729; cv=none; b=Wan1XdIXtQ2TOtgExuKsW6oopDVfOR27YQRnwPTSkoho2Nx0EGB0UBbS7W8gt+WQsXRJCj4UDRKs+TjXNKPY0rJO296iIlIAwhrfWeuGMco9faKZsUti+N00iowd3m1LdWn2rSw3HR5e+QGRIaaTPjYx2Sv4cY6BeKVZBdsb7zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790596729; c=relaxed/simple;
	bh=a5KcPfO/lVWvSV/4F80VAySM5Pi85YzX0n3tROeq3fI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dsxvdJAaI7ciuMvgx9Zwvi+bPTXZJ7oN1NKoCxbHENcEsOjz2T83JsuPiKZ/TcLtz2hWVQ/D1I4wQv72gmEaSN94AKsG4u8SBxUkW+hUEEHIGp81VYd4B+dK4IPIpl1gFtr3tcD5SayNmP9Z3jFVvjWvCf23Kk5F+9H//uObINM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aMpjLb6s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=abrhiRd1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aMpjLb6s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="abrhiRd1"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAVIj1042611
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 11:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GWvcEfZFoPLDafBzTdcCM2
	UQzqRP8Ydg4Kuy7k8AJBs=; b=aMpjLb6sF5zwjCIthlnlTSZP7LWcH2cdRXg7MK
	6ut+DkS9JJNrkQr17zR1WNVAPzqT0O3S+On6sVE1oAH4aOR/ltSjg5g/Ggib+1uh
	syhfQ6b9FlfDYV2QzduiMEskG/5n5zDO2zzqDkSKOhzS6Gs0qKVDXps1lrr8gBFT
	YSWNSchv78a+eEi5miyUtJr68Rb9P/7iPUeBUjCEULtKRl2OUNS8u9Y0/cznwcAK
	1cZLr50+tfmJoXd9+gd220/Y3qw1Libj9a0Tvk9XLhIU//3uY9Tc2dG9uCFnypXo
	Ux9XoHWkZZ4Pw2uYvSPVQ/3abT/om7NXqIQ5xj5144DPgKHg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyk5ms4y3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 11:58:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a0ad137e87so4700973a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 04:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790596726; x=1791201526; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GWvcEfZFoPLDafBzTdcCM2UQzqRP8Ydg4Kuy7k8AJBs=;
        b=abrhiRd19ghEdqmBbGN9D2dPc+z2qmLCrY/yzIwa38pzu1L8UcE/xnOdstHPZqBLA2
         kQdBPTDcSzf5uuSFMKG0Hh3Ohy0Yrg7/llqMwN7RKn/7Aqq2WeVUOlhZ8zZLeEYDNHao
         GTN7/JGLQ4uyyCpXJbkvQc7/wMJOHr+a//RUFW+M9/PUYrvYYXB9UtfPH2Ct3VtW2BBe
         to4UILjsKgMoQSzXlrj9xq5DkK0t7YmB/FrKPQ5hbfoHA5XGq/0Xm8TUZryg37lhJ348
         /J9I1QW1toAfyhG8+x4qsqrPVQddfFRi7OyBLA8PqjrAcn/KL+D+qLSKDJTWG8roGXTH
         N3wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790596726; x=1791201526;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GWvcEfZFoPLDafBzTdcCM2UQzqRP8Ydg4Kuy7k8AJBs=;
        b=BG0Z2scjKk5ecSIzZyWxWCpyKhIQlupbXwJufDU8jgc2D8CciZeGXbdhiD/JTPybs6
         /BECbAsyGmbpRvJjSosZ7Vc2yPG/Xve+XoHq7xMr4N6F/nOEyH2u6xVcHaHOOZBjnBY3
         HMPM+pQpxXqks4Z9MD56FSqqozpoqMQMQf0S6rqJAm5LS3+dO10UQEsKjxd5moRtY0xa
         eERPMUDoY3ujBxmTjgjf+GmkRNOYVhdPm/2Guk1UJAK/KcnYt5EZwlDwP6H2dc3cE5Tv
         pyZsaJvQeWBRbkTZDaEAhsY5JVnNJLG6f8U9MAA+H5yt/Byq7cMFp2Gn5B0KeQgiqoe0
         t0OQ==
X-Gm-Message-State: AFq9FYKLy13WKhknw2t49QOFiOkYSxgqvuLs89NXABzyDeD2kDTuonl9
	9xAqBg+tB4DlHyAXbIFKaL7CO3uFwKac9ag34otYzEMJpFXFP3nAs+tz2UM/H8sfcZ/t7XsO5Q4
	oWMCOXwGt8NDBPOGD5rEk61en+DaluxcgRrnmo9AyMQDOmjcK6cOkVK56+T3MbaZh5wH6G5z3tz
	uR
X-Gm-Gg: AYBFou2tjvEr/w4GXxydT1i5cw1BK7sWbuNmLUZsvJHwQQM0/BP5iW18FYcRiw4FwhA
	i7ui00bnJtZfGV1Ol7n860T7fEMtsC+cFSbfurQ4dFGlAcp9UVCGHriZWJ7yNJwOl/AP+poToRW
	idg05/l92V1A+0jSQLiy1ZehjClN5dtUtKJWheGSh118rdZWDPmij3rKTBHPGheH9LkU7J7thLl
	hflR0++beFEXJTGsyUAa0MRYL7LbgEUvb7cqxsODTaR0wgRvLSJZ5N/3RrIQTCbqfmat86XPQL+
	HRdpJu2zoHaheqEDaFuPqYUrmw2EL1DU5I3gw+cjk5/fu423uAppsK0gVSUwo11XCLus9HoElZN
	Yaw6OvPf0Iqknr/eQU9LxMf3cnBTOCuJ4prnfr0w4SnlTZsw/n0Gzp2huoNIbl+3U/Fx5OiE=
X-Received: by 2002:a17:90b:4a91:b0:3a0:bf26:f24a with SMTP id 98e67ed59e1d1-3a0bf26fc15mr7372241a91.45.1790596725741;
        Mon, 28 Sep 2026 04:58:45 -0700 (PDT)
X-Received: by 2002:a17:90b:4a91:b0:3a0:bf26:f24a with SMTP id 98e67ed59e1d1-3a0bf26fc15mr7372213a91.45.1790596725186;
        Mon, 28 Sep 2026 04:58:45 -0700 (PDT)
Received: from congzhan02.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efb156sm22054562a91.1.2026.09.28.04.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 04:58:44 -0700 (PDT)
From: Cong Zhang <cong.zhang@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 19:58:38 +0800
Subject: [PATCH v3] virtio_blk: use synchronous quiesce in
 virtblk_freeze_priv()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-virtblk_sync_quiesce-v3-1-a037e6e2fdf5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAG1WumoC/3WN3Q6CIACFX8VxHQ7wJ+yq92jNAWJSKgnKcs53D
 2xtXdjN2c52zvctwEqjpAWnaAFGOmWV7n1JDhEQDetvEqrKd0AQyVGBEXTKjLx9lHbuRTlM/is
 kLDgRlFZpluIc+OvTyFq9Nuzl+ul24ncpxsAKi0bZUZt58zocdl8F3lc4DDFklCY1rRNMMnrW1
 sbDxFqhuy72AYLJkV8W+cMinoUKhhDO0oIfyQ5rXdc3ejIhdB0BAAA=
X-Change-ID: 20260910-virtblk_sync_quiesce-9b2c88d45416
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>,
        Eugenio Perez <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Stefan Hajnoczi <stefanha@redhat.com>, Jens Axboe <axboe@kernel.dk>,
        Ming Lei <ming.lei@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, virtualization@lists.linux.dev,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Cong Zhang <cong.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-38bf1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790596722; l=2486;
 i=cong.zhang@oss.qualcomm.com; s=20250926; h=from:subject:message-id;
 bh=a5KcPfO/lVWvSV/4F80VAySM5Pi85YzX0n3tROeq3fI=;
 b=KMwGuSH+3ziApXG5QlvjxI5qXg+XS3sB7eaaGysM93gcZmk2lo8uADbhVuFwfleEvAg51bq7p
 5GaiSm4r5+CCauqVc4qPd2kBSoQBiy/axVIbTxwOXVqwOhEVB6UpdcD
X-Developer-Key: i=cong.zhang@oss.qualcomm.com; a=ed25519;
 pk=8SBh3ey5igz2nlW+UFC6khFvaNPgG7MmbWtAeO2s6n8=
X-Proofpoint-ORIG-GUID: Kh3_PTpGZZfM7sDrXONMlJuJ7IgUq8u7
X-Proofpoint-GUID: Kh3_PTpGZZfM7sDrXONMlJuJ7IgUq8u7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0NyBTYWx0ZWRfX2N5PybLGregV
 8AC6QGSBJvitnL54acr5BtLkhIxc3/m4Kt4wzxyg45Duwzjz7EYwdYn51ZqSKa8OVEAAdnGHSwu
 BWN4Dt9OXDfk2uDTSodOjgt4X7C3amwDT/F/UcR/bMOTmDciu/eZrvr2eHV2WAFnEAJKnMs1OsT
 7FjMCrHcF0THv0UjtEoNRxA92mYA4qtt1i0Pz9OrEtOGXQ1mEmpfw70DTZVntOsBPIDRWH6qHdB
 sq8txmzvEyYrh3Zneko9e4A6LxP8VbGDl4Z6rA2KZ5gKyDDaA762JuO1yUKhNjltL0bVlqh7f8H
 nQOXkAAU7Fmsv05SJJoOhnM44XKdBEwTyhQBFsLBhfctFoyLl3M0hOJ91fPVSvClToGNJhCQ2mb
 b7IXvTGgn/NgQAYsnI8G66ViRHihbvExGs8cMSunHBhbH9TADpsG7k+jzdztZlsjCwe1KlQ0BOA
 aSSW4dXFOd45ubC9Nrg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0NyBTYWx0ZWRfX5Kbkn1F9XTKD
 JPqH1HrtGJv4MEfV1PPSruhhv1uLRlT4jtBtE1Tl9Tr8TfmnE5gMFhN2LPgVLuMxE/28NV6RzgG
 PitGsS2HbC0Qt0xKvReW3LtBjl0JMxI=
X-Authority-Analysis: v=2.4 cv=asYnmiZV c=1 sm=1 tr=0 ts=6aba5676 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=20KFwNOVAAAA:8
 a=kkXLOB11zRU5SlhL2XgA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280047

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

Fix this by using blk_mq_quiesce_queue(), which waits for dispatch code
that was already running. Keep the existing freeze and unfreeze order.
The queue remains quiesced until virtblk_restore_priv() calls
blk_mq_unquiesce_queue().

Fixes: 7678abee0867 ("virtio-blk: don't keep queue frozen during system suspend")
Cc: stable@vger.kernel.org
Acked-by: Jason Wang <jasowangio@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Cong Zhang <cong.zhang@oss.qualcomm.com>
---
Changes in v3:
- Move the race description into the commit log.
- Remove the blank line between tags.
- Add Cc: stable@vger.kernel.org to the commit trailers.
- Link to v2: https://lore.kernel.org/20260912-virtblk_sync_quiesce-v2-1-09a001549b72@oss.qualcomm.com

Changes in v2:
- Cc stable@vger.kernel.org.
- Link to v1: https://lore.kernel.org/20260911-virtblk_sync_quiesce-v1-1-a883f8f31258@oss.qualcomm.com
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

