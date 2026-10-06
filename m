Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CD13BA244
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 22:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326496; cv=none; b=IP1Hy0hfEDrxr/qhCLIfghpdB17zlbPUKCWyjdk5vUJqgkmXaeUKobuaY+DMPgfhzr9DrYcJ/dnza/kl2KIPKH7SdtHOgpF4CWXh/UxBtbRLca/tiqUFP8iohiJXdShloEBdCyRyDAVC38BZ8WdzMgk9vfx+AjW7klnJUYzDeLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326496; c=relaxed/simple;
	bh=a61iNzjTlj5EYjp8kMT4hI97L5A1x3WL1zMjpyRYt0A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z2rl/4sUWujp4vRjzp55quevtsqp2SAXRVztsDQ9zMKQ5glKPbYDKiDW1tMgwxqtS39/ILPUu8S0A29UP1QQ9HzSS0850ihz+F260NIIjLqcapsjgs/gqyETFrHXMkwLunaD2rEl5zJCdn/lXSTEUkkPUvOY/i+5WbOpVznzrzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FKFXN+gE reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FKFXN+gE"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeUS11676103
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 22:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wZo1SiuyUeG
	k0p1Dd0+8C0DK4QKg6hk7x9uPquKwVbQ=; b=FKFXN+gE0Veh8c/LD5kChaZqgMT
	zxXByVsRaJWPBSudKOs6lohZC5/e9XyGfecUb216/yQUrh1q+MCoeD+zJtb7uLrv
	ph0QpwUJokKmaed8iaadv/c1KZtM9HhxgyeQPxFv1aTSyxCeQ6rCjLHKEiCBStSP
	uxGDOYO5Ag7GCSfqksqmLOr3aIDISVDvy0pHMvRkcfVDMqr80cUDzMb7eW4Qcc6Y
	cvNFVzia+cHNu3+HUmr2MRXeGo6wqd5eUiytmniRowUkErGNBRQ7ZPyJMjThF1lS
	wZdOLyrhe8bD7RuRJSMrw9rw//3bgsSTlgD3S9VpoVc8sPe234+7f5r0mRQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xdub108-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 22:40:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93dd3c3badbso650856785a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 15:40:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326454; x=1791931254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wZo1SiuyUeGk0p1Dd0+8C0DK4QKg6hk7x9uPquKwVbQ=;
        b=0itxT10oecby3Phxv0tFCd4ehTkBJQt7UuJRYC/lZkaJGdkWmatW+bSpg4KtTelWHv
         4be4KC6M36xVQQmYcuBcjwHUuX5AEt42bR7Jx1o4r0fVPZOB7pjMZGmr7VAqIsz9ztOb
         kSN/xntRWBoRDQHgFptSWGWXnrvEG9XEl8cF1BhiFqbgIoF2MB7SUd5MyKrQvgYbevN3
         dYFOgvPmvszM1WhlZONZ0SJY/pf0vflzmxo4vcuPXkIzSoWabuS+XcDo3oHP0xVDiWkI
         dAVNB03X2lu/b7tdjjm+OEPpVClPbSRPpP5zCJPFimND8Af5t2rM89P0KylNrbCfVDP4
         ijuw==
X-Forwarded-Encrypted: i=1; AKwUvBxjSmqIVMj+YuiKw1XS9y3yXqfNSjF99cUJA3jN2bbQ23LjmPN5dw2kUMDAWAhOJZCEDu5wRcYfxjGRnjmB@vger.kernel.org
X-Gm-Message-State: AFuF++lC6SjZP59CnWuQgTOUxFFM+ZyfpU1AUnmYi8msYLHhA3aQE5/G
	VF/7vnplNGqSjkT+rlAMd31R1xrel9JTkGUpBWvndsoQcyE9+5ohdgGfjiuPcOVkixWu/GO2DF6
	c+NlK/h3NAIyCqK6kemhwaj8P6/guKqXC+UdFi3clk7B4XsUxTsB94O1XaVcc6Iwb3Yf+
X-Gm-Gg: AYBFou0eWivteb7FB6tEy/WniXRDD57etbzkUCAo3frc6HznXDPGF1YVlqUlZ4xkMqr
	NtNzHEsd6eQyaMPZRBWzByH+M0bjKL1BVFSEJO9VFS3RhYBh54L0MwZVqNNw2MhqAPhlS1lTBJf
	otqG9yUPGs9KGWfYoEpSPBa8UDKH5rs4lrpPcslYROFZ3nEMTp3b8bPk1Pahve5Covkc1X0BwWb
	o3S5LA+icoMbLRdM8cyoFyXw+u3mRSpMMJVcDN9Ky1DUD28D/FVQX8MzBXd8rLIiW3k6a0uZ81h
	Z2npUz1H2k6od04Ydp3Pm24QSbgbrnw+jKgb2PxOjhw79NuklA3yDtcex18=
X-Received: by 2002:a05:620a:2728:b0:93c:6450:9ceb with SMTP id af79cd13be357-93e9b2ea998mr81116885a.1.1791326453900;
        Tue, 06 Oct 2026 15:40:53 -0700 (PDT)
X-Received: by 2002:a05:620a:2728:b0:93c:6450:9ceb with SMTP id af79cd13be357-93e9b2ea998mr81111785a.1.1791326453437;
        Tue, 06 Oct 2026 15:40:53 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:40:52 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
Subject: [PATCH 16/45] media: qcom: camss: video: add managed streaming callbacks
Date: Wed,  7 Oct 2026 01:39:24 +0300
Message-Id: <20261006223953.3382273-17-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfXwmqDKf+wypWu
 1s+RIF7OvZsz1U8lzUjU7vMB5oPqaDIjPhnXS8DyGtcdtioHMsxCfmD3qK4du4B5jmUsbF7MC9k
 WNNEB0RyOgfOMdD1EzUInWjQRfyTY2g=
X-Authority-Analysis: v=2.4 cv=NshE4MdJ c=1 sm=1 tr=0 ts=6ac578f6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=WDhTVHpYbZKqloR8QRsA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: TIKi67oJBcnDPaKX2bOHydxaJHwsu-4S
X-Proofpoint-ORIG-GUID: TIKi67oJBcnDPaKX2bOHydxaJHwsu-4S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX9qb/wq50eejk
 1OFaE3BbdV3Qu2qdax8AYx0XLnqGHRT0fRYAsyPdMBSC+21ZP1cZgTyj7JxfgU0Ksz9Qy0ZYwEM
 aVbLTacG9mSiAlFpuVm5O7bfuEEDcVfN/d+ZVaJBeyPOkDP4Wd34HLtr/0WT2ME8iKuKmkrxH3B
 tOasuUy2I+b2hGhfc4BTEdJMNXGSCpoRU9aO9iGfSmYcNun7JQH8de13PUuSZn72IpIrqm7j6q9
 oNmrz7MD9OZjo19/V30mcCJCjT6f5kd6dmn5bMLuHtD9GX6JC6Jqag6ZDOHhlq1/b4/VP0t8Uv9
 Sn3Ms3+wRlayWZPilh0FMmEj9GDsar/VQlBAu7G+1jFHC/b2Rk7Wbp4nSBJZpC/lw8D2iYpX3A/
 0IagQiElhJqHBeTcPeQVidc+Tuk2PodXF9rhVjUZl+s9kJU68oVSF2cwjZB0tMd7aURQzyojzg2
 4KFMd/B+TlzVqyKcowQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Allow a CAMSS video node to start and stop streaming and select its
buffer type. Keep the existing path when callbacks are absent.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-video.c | 17 ++++++++++++++++-
 drivers/media/platform/qcom/camss/camss-video.h |  2 ++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 803e5ce9b9fd..cb9e08e9ff7e 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -159,6 +159,7 @@ static int video_buf_init(struct vb2_buffer *vb)
 	struct sg_table *sgt;
 	unsigned int i;
 
+	memset(buffer->addr, 0, sizeof(buffer->addr));
 	for (i = 0; i < format->num_planes; i++) {
 		sgt = vb2_dma_sg_plane_desc(vb, i);
 		if (!sgt)
@@ -303,6 +304,14 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 	if (ret < 0)
 		goto error;
 
+	if (video->ops->start_streaming) {
+		ret = video->ops->start_streaming(video, count);
+		if (ret < 0)
+			goto error;
+
+		return 0;
+	}
+
 	src_pad = media_pad_remote_pad_first(sink_pad);
 	if (src_pad && is_media_entity_v4l2_subdev(src_pad->entity))
 		subdev = media_entity_to_v4l2_subdev(src_pad->entity);
@@ -370,6 +379,11 @@ static void video_stop_streaming(struct vb2_queue *q)
 	struct v4l2_subdev *subdev = NULL;
 	int ret;
 
+	if (video->ops->stop_streaming) {
+		video->ops->stop_streaming(video);
+		goto stop_pipeline;
+	}
+
 	src_pad = media_pad_remote_pad_first(sink_pad);
 	if (src_pad && is_media_entity_v4l2_subdev(src_pad->entity))
 		subdev = media_entity_to_v4l2_subdev(src_pad->entity);
@@ -382,6 +396,7 @@ static void video_stop_streaming(struct vb2_queue *q)
 	if (ret)
 		dev_err(video->camss->dev, "Video pipeline stop failed: %d\n", ret);
 
+stop_pipeline:
 	video_device_pipeline_stop(vdev);
 
 	video->ops->flush_buffers(video, VB2_BUF_STATE_ERROR);
@@ -766,7 +781,7 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 	q->drv_priv = video;
 	q->mem_ops = &vb2_dma_sg_memops;
 	q->ops = &msm_video_vb2_q_ops;
-	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	q->type = video->type;
 	q->io_modes = VB2_DMABUF | VB2_MMAP | VB2_READ;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	q->buf_struct_size = sizeof(struct camss_buffer);
diff --git a/drivers/media/platform/qcom/camss/camss-video.h b/drivers/media/platform/qcom/camss/camss-video.h
index d3e56e240a88..f62a72c29a5a 100644
--- a/drivers/media/platform/qcom/camss/camss-video.h
+++ b/drivers/media/platform/qcom/camss/camss-video.h
@@ -31,6 +31,8 @@ struct camss_video_ops {
 	int (*queue_buffer)(struct camss_video *vid, struct camss_buffer *buf);
 	int (*flush_buffers)(struct camss_video *vid,
 			     enum vb2_buffer_state state);
+	int (*start_streaming)(struct camss_video *vid, unsigned int count);
+	void (*stop_streaming)(struct camss_video *vid);
 };
 
 struct camss_video {
-- 
2.34.1

