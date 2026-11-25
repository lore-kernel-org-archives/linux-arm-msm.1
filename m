Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593625;
	b=qfV1QUSz2faljdcRc8vYG4QA2raD6D9WZzK9OAs/HIoH+unOkaWxFDsvnxp9yeFj7YJd
	 ue3ySlTHxlWqZ2i7yrJw5+rdz6oePz9UdEtbPPdV6aA7tGqB1tpHd/rKEcZWjzXSdpn3D
	 u2wEbaysmhDH1zOL/59EU5Y7YnWXy6rS2272LgdR3MCC2Cp4ARkGjm227gPvo4q5jMu6G
	 a3QImZo2iYa1PU7EgE4No+sbyA2NG+6FAvbIx+H21nEzqSOMqD2XOx6SYFPWK9VFy3CY0
	 qmCaLSuXWyfe533sZhG/3KBolGXxqPqH9gLPBdZ22VS8xesHBIW7FPu5HWx6saBWAXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593625;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=L//rJ27NYEGRNl9DwAU81I8HdLBTfl2e192CabOszjA=;
	b=iYfog+7RNoCR/bZW9FWjBnWpb/PwplwYDoUFDVZa4QUHEBT6dKXw8s6OqWRWHSoCYjB2
	 qGf0gROr6C4tqUc2EpX7pqebr53/fNOhNAwm/3qwMcqucrJKJNAiXX+su6p978+Ljql+8
	 oybdWhJxXsa5Tti5TP6e1R2LO3BvtqZXqufclWhBhV6cF9ob4a9x5Kq5ZJyJMUcWNc5QH
	 ryiTNQF/7RTjtaySrobQO15N2qb/n1mmrNNb3UiHok+1Z1rNkRbGpvbctAYQpBr1CF7HU
	 2FOqjmpApuzfatXjkU3xpSfdRmG50b43dplLIqsxNdeh+gi9vuNLHSfaTBn0NPDlluQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=fail reason="signature verification failed" header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SEC0NXLt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DC960A2630
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:00:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23DC960A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SEC0NXLt
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68o1A3807889
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:00:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=L//rJ27NYEG
	RNl9DwAU81I8HdLBTfl2e192CabOszjA=; b=SEC0NXLtc6yoKbBMoLrovlZxJNV
	SVd7q2QiEKS2AdZes5SLqDaaGgiQW5yt7yhcg+ZA8hJz7rPgSgi+i6M4QnCICPKS
	e5YcCUIl3ACdbrlRhdPdTj/qVDtobbCPn9xmJ7SZz4Dzwh4kTD+5fMm1NVBl0A/s
	Dj0b9zTdEM+nN0hglqqt0DLDZAYMoK3nlPwZyKHMT2wCkTCmqreVqFk40gsl5Lsm
	4wWZsDGtMSog9Qc7k3OFivLS3CTdM/fl8XoCrXtrBQ7e3JPBc0ORvk7hIY6EWAjY
	FaE93WMyOh19QavRZUpbNNev/eKlRqHMClbe03Tg5KZLfZD3J43mKi3hfDA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5cxkbm5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:00:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb7f9bb86so1057603485a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 00:00:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593623; x=1796198423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L//rJ27NYEGRNl9DwAU81I8HdLBTfl2e192CabOszjA=;
        b=T8ie6lsGv17PrYreK/jNaU5amHA9i7il3WhYBM9dXfJFV1sK1jeeyS9WN0um8jzcZn
         R2b96H3NdrAV/zPGCuN5Xny5m8EXYLJWEshlcMHOPLb4kzI11l/SKlrYtOfUXZhKe4se
         xi4/RNilpB4IjgxcF16rNSn9lvkJadBdWj6wQ1BAzVIoOdms+B9Z65iLUYP7LLWHZ67t
         H1IMCWWcuwJXvd7gcy3L2aSi/+H9rkVrFoSV/SnL3nz+Y1CX9cMFy4yGIQsWBonGgG/W
         dEcp5hH1hJBJbV07cKDX9MXOuQHk39oSG+tCz5RWWTYXIcEobe1256NoHHJHgel+r9rp
         Nqqg==
X-Forwarded-Encrypted: i=1; AL+hErG6L3vmoRaV0ERHLptB7gkNHJNw+LxF68bsiY4EW5+dXfy7BqFyCjn+krHquifugESKv6Dkg7aaaQqZz0i4@vger.kernel.org
X-Gm-Message-State: APuU4Z9MqEIk0DnAc1nDvwrkt/iBlD48VxgFG2k409V9vTQSFFaY6Gau
	rUvFTkJfqITkDMyy9Y/blTYjqGKFe1pfzSPC5knaTIFmpEa88fbMS4VDgr1EjAhC/QdgkDF/cnG
	GrIaDPUqcudTwd8E83MQ7QQMPfddBsHfqWBJFSle/nTIvoztK0+Cd0NDcvbI1mOX9SnS9
X-Gm-Gg: AZFdTZf0QluZyEN5a5sS5CUpj8ljtD/6KhLWOE5UNPcw+l4an1T1aN0mwa0jMd4GJN+
	CsmHJLy2KLQoOQSTTZ5/p9eSDEEjKmoatmf+/EsGkM8XqnXlKEeEth5+s9boQkrzQACJI6wEEQ+
	c+co+T9miTSzS005DqXbXGI3B8l5nfgNctc4J59koWhSP3gbWzUwAO2qP0hGnWcW8rykb/BvJ+G
	3JV8VlZ1geUDFwj7pB2hlzzmTWjx7S3tu4IWWqsfflABl7n6ycnJT97I0Ty2jA5KgH0bBV7IwAT
	nHzF7RhQ3XlAYmlbmC82VTtvHxUkrNvwK63tsBnjOE5qC+t/ELEBPsqZYhoQGK/n1OrQNJstJj0
	MTwW5n3Y4Q4H8AicY1Tdy3qIopIz7D7An
X-Received: by 2002:a05:620a:46a9:b0:949:730b:53e9 with SMTP id af79cd13be357-949ba98d292mr2980046785a.31.1795593623289;
        Wed, 25 Nov 2026 00:00:23 -0800 (PST)
X-Received: by 2002:a05:620a:46a9:b0:949:730b:53e9 with SMTP id af79cd13be357-949ba98d292mr2980035485a.31.1795593622230;
        Wed, 25 Nov 2026 00:00:22 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm585912015e9.11.2026.11.25.00.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:00:21 -0800 (PST)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH v2 09/12] media: qcom: camss: Add streams API support in camss-video
Date: Wed, 25 Nov 2026 09:59:58 +0200
Message-Id: <20261125080001.2540101-10-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMSBTYWx0ZWRfX9QSUDTxxX4S8
 nNZtByUU6gYpoKrJEoXKG0kSQATCeQNKStmbFmtNUIVkysQpBWDGy2hiWiRS8pyRNDnPYIsmQOJ
 KAYG8OGgZDMG96HPP5WWUyPELZO9EcY9+qv11SuTYZsckbxNev2Lofcvm3R+plMmhyUfQZR7l/d
 ITdWTgUMe31X3MBDCfHnPN5NIK4BkTMs0qtriigxeI5Eq5zmToh67gt0dVzfyaRm4QzRSUQPcBO
 OOf49gb4hQtS9QGMPHMozjMakGEBMpYriMIX1q2ibaTOtHo7dYO9BcTkZaaF9Je3pA/ImhIP1vf
 soHe4VRGBWeK9Uz4V6ctyX1P4hElgjYL+LQsQMY2Pr227gu1HFEg77jsSNGd6JnTxFv9VLl/DdN
 Hig9azSvFsxW3STJCYr7BzBXln3OfOzCg/BDOCCQigtf+x9zUt3/cq1ufKS335YU9tNkgMPLeEK
 38mdB9SIP4xGmyA+xYw==
X-Proofpoint-GUID: B1nklsPDdlwyhxzhIWrCnAemvLbHR4Qi
X-Proofpoint-ORIG-GUID: B1nklsPDdlwyhxzhIWrCnAemvLbHR4Qi
X-Authority-Analysis: v=2.4 cv=TLbQ2Fla c=1 sm=1 tr=0 ts=6b069598 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=ZovgdgjKAAAA:8
 a=KYIyY8g0vu4ecJsuFiIA:9 a=bTQJ7kPSJx9SKPbeHEYW:22 a=VOxKbm1zgHvARWIDjr3b:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMSBTYWx0ZWRfX7N39oAzEF2Uc
 lEHd6Q+yYFT3+dL0feUlDWXr0Exj8dZsl8/401cUwSCGzHev/OHrq9OSbvJ9RQeOXd596WgDdvJ
 pUNBf7s66+pvLLYpdoqoIS8JiJ7dck8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250031

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Prefer the streams API when starting/stopping the capture pipeline:
if the subdev directly connected to the video device's pad supports
.enable_streams/.disable_streams, use it instead of walking the whole
subdev chain and calling .s_stream() on each one.

The legacy walk is kept as a fallback (video_start/stop_streaming_legacy())
for subdevs that do not implement the streams API, so platforms that
have not opted in keep working unchanged.

Co-developed-by: Hitesh Patel <hitesh@ebytelogic.com>
Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-video.c   | 119 ++++++++++++++----
 1 file changed, 94 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 0852eb6f1315..7f7212996c4a 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -249,26 +249,27 @@ static int video_prepare_streaming(struct vb2_queue *q)
 	return ret;
 }
 
-static int video_start_streaming(struct vb2_queue *q, unsigned int count)
+/*
+ * video_start_streaming_legacy - Walk the whole subdev chain and enable
+ *                                streaming via .s_stream()
+ * @video: Video device
+ * @sink_pad: Video device's own (single) pad
+ *
+ * Fallback used when the subdev directly connected to @sink_pad has no
+ * .enable_streams op. Mirrors the pre-streams-API pipeline walk: each
+ * subdev's pad 0 is assumed to be its sink pad, and streaming is started
+ * one subdev at a time via .s_stream() rather than the streams API.
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int video_start_streaming_legacy(struct camss_video *video,
+					struct media_pad *sink_pad)
 {
-	struct camss_video *video = vb2_get_drv_priv(q);
-	struct video_device *vdev = &video->vdev;
-	struct media_entity *entity;
+	struct media_entity *entity = sink_pad->entity;
 	struct media_pad *pad;
 	struct v4l2_subdev *subdev;
 	int ret;
 
-	ret = video_device_pipeline_alloc_start(vdev);
-	if (ret < 0) {
-		dev_err(video->camss->dev, "Failed to start media pipeline: %d\n", ret);
-		goto flush_buffers;
-	}
-
-	ret = video_check_format(video);
-	if (ret < 0)
-		goto error;
-
-	entity = &vdev->entity;
 	while (1) {
 		pad = &entity->pads[0];
 		if (!(pad->flags & MEDIA_PAD_FL_SINK))
@@ -283,6 +284,42 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 
 		ret = v4l2_subdev_call(subdev, video, s_stream, 1);
 		if (ret < 0 && ret != -ENOIOCTLCMD)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int video_start_streaming(struct vb2_queue *q, unsigned int count)
+{
+	struct camss_video *video = vb2_get_drv_priv(q);
+	struct video_device *vdev = &video->vdev;
+	struct media_pad *sink_pad = &vdev->entity.pads[0];
+	struct media_pad *src_pad;
+	struct v4l2_subdev *subdev = NULL;
+	int ret;
+
+	ret = video_device_pipeline_alloc_start(vdev);
+	if (ret < 0) {
+		dev_err(video->camss->dev, "Failed to start media pipeline: %d\n", ret);
+		goto flush_buffers;
+	}
+
+	ret = video_check_format(video);
+	if (ret < 0)
+		goto error;
+
+	src_pad = media_pad_remote_pad_first(sink_pad);
+	if (src_pad && is_media_entity_v4l2_subdev(src_pad->entity))
+		subdev = media_entity_to_v4l2_subdev(src_pad->entity);
+
+	if (subdev && v4l2_subdev_has_op(subdev, pad, enable_streams)) {
+		ret = v4l2_subdev_enable_streams(subdev, src_pad->index, BIT_ULL(0));
+		if (ret < 0)
+			goto error;
+	} else {
+		ret = video_start_streaming_legacy(video, sink_pad);
+		if (ret < 0)
 			goto error;
 	}
 
@@ -297,16 +334,27 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 	return ret;
 }
 
-static void video_stop_streaming(struct vb2_queue *q)
+/*
+ * video_stop_streaming_legacy - Walk the whole subdev chain and disable
+ *                               streaming via .s_stream()
+ * @video: Video device
+ * @sink_pad: Video device's own (single) pad
+ *
+ * Fallback used when the subdev directly connected to @sink_pad has no
+ * .disable_streams op. Mirrors the pre-streams-API pipeline walk: each
+ * subdev's pad 0 is assumed to be its sink pad, and streaming is stopped
+ * one subdev at a time via .s_stream() rather than the streams API.
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int video_stop_streaming_legacy(struct camss_video *video,
+				       struct media_pad *sink_pad)
 {
-	struct camss_video *video = vb2_get_drv_priv(q);
-	struct video_device *vdev = &video->vdev;
-	struct media_entity *entity;
+	struct media_entity *entity = sink_pad->entity;
 	struct media_pad *pad;
 	struct v4l2_subdev *subdev;
 	int ret;
 
-	entity = &vdev->entity;
 	while (1) {
 		pad = &entity->pads[0];
 		if (!(pad->flags & MEDIA_PAD_FL_SINK))
@@ -320,13 +368,34 @@ static void video_stop_streaming(struct vb2_queue *q)
 		subdev = media_entity_to_v4l2_subdev(entity);
 
 		ret = v4l2_subdev_call(subdev, video, s_stream, 0);
-
-		if (ret) {
-			dev_err(video->camss->dev, "Video pipeline stop failed: %d\n", ret);
-			return;
-		}
+		if (ret)
+			return ret;
 	}
 
+	return 0;
+}
+
+static void video_stop_streaming(struct vb2_queue *q)
+{
+	struct camss_video *video = vb2_get_drv_priv(q);
+	struct video_device *vdev = &video->vdev;
+	struct media_pad *sink_pad = &vdev->entity.pads[0];
+	struct media_pad *src_pad;
+	struct v4l2_subdev *subdev = NULL;
+	int ret;
+
+	src_pad = media_pad_remote_pad_first(sink_pad);
+	if (src_pad && is_media_entity_v4l2_subdev(src_pad->entity))
+		subdev = media_entity_to_v4l2_subdev(src_pad->entity);
+
+	if (subdev && v4l2_subdev_has_op(subdev, pad, disable_streams))
+		ret = v4l2_subdev_disable_streams(subdev, src_pad->index, BIT_ULL(0));
+	else
+		ret = video_stop_streaming_legacy(video, sink_pad);
+
+	if (ret)
+		dev_err(video->camss->dev, "Video pipeline stop failed: %d\n", ret);
+
 	video_device_pipeline_stop(vdev);
 
 	video->ops->flush_buffers(video, VB2_BUF_STATE_ERROR);
-- 
2.34.1

