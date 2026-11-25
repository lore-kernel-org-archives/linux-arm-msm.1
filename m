Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631039;
	b=RBY5k0YdA+sJj3Rat/v+X/Le5bNOiqin52ThYtt5TvGXLTW9ivzyLMH6E6u6yR+F8DaA
	 K+0Yl16UQdvLdFIWl0YxbLCkVVP8C7wXEV5ATX0DQvOaURtusZyd1HUSFbUSA6GOA1yzB
	 /ZqSdXo477pyef15kORdmLJ0jy/rCLyBTHSX9BOy76SLUh5gQtnJ0vJD5dOo0p4oiTR+5
	 WKEBmIQItpSDWUdVHSX1UaSR+rPdPk7rt5866Pq4HLye6qqCz+zAroVmGohX6VNgsCmA/
	 ZrXyXUq4Omeq3r1n4Cd5iTk3TH7kuJFbrbEj1UdLnrJqsVRv0exN1ZbjtID5+S+V7CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631039;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iBl3ztGie3scC2+QPz/6CcWsyfMw4xdKCUkFMvo4SHE=;
	b=BOt4VZPqoDjLb6p1qoF6/Ia19wMf1e1ZsQPyncoFMU5+li/zYz8xxBp5XDh82N8VPV1F
	 OzYq1CHrOP/coNnBn9ExW71MiYoLCbTiL0yG3HfqIqVe4HsS1scIJ/suFowyoLv4yIh6A
	 kRiZVhPi5D4fGS26i6CRZiTIC+xFYPCBWFLyLr4fQ6Zyw+bKoRJAvcTxWZVb2NuemcN8G
	 gnEErN6Sz/81JkJ9mG7+ilpma37liSP9VhxPgsKiWzl+CMb+p9akSbD00WcqbEShoz31T
	 ke2BGgVyEqnPiqbYceUysBXhldqTSqE0IqWL5OhjY7pFp1KqaAJtsM9a3LUhN4uPl0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L8EX9VIE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NhDqjmxW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D75560A260D
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 18:23:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D75560A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L8EX9VIE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NhDqjmxW
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQ7iC291189
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 18:23:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iBl3ztGie3s
	cC2+QPz/6CcWsyfMw4xdKCUkFMvo4SHE=; b=L8EX9VIEamhHga1wDYGfXKO1tDR
	uo9Gm0tAiok0DKT24f/GrPcopVnhZq+vPJGXwuXs1GH9uJj/cXd+9obNKP8g8NCy
	r7uPAbbKjaHexEKDga94X/EzDAmmJgv5jzlDr3dF6tZ1XBUFeNRgeKO6pdgeqvhB
	wN1QBQCuCwgvzX+4tyboQYpX7F6U5LI3ee14c9k6xhc6nNZYS3JHwEhB2nJaS3/d
	xpSZqbU4/8oyhVfBEyfrO5asYNE/ZzbHZap3wS/Wkn+eudxyRZzGK7icKXrKPzr6
	oQLOt80rpZKZ8im12XJpkEE/gewTh17dPET7L7umEmD8AsO12z0N6cxaDdw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahs0b8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 18:23:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f20addba1so937609585a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795631038; x=1796235838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iBl3ztGie3scC2+QPz/6CcWsyfMw4xdKCUkFMvo4SHE=;
        b=NhDqjmxW74JdhnfNYj/mJVPdLHMAzsoyHWNHyPiut4alqiPSWNhUWMGEZvnBDmL99Z
         2jZbcKe2hgFy2YI8iMJFinKCnPK70W1qlY72NJq/dkXJtitHPd39yoqq6iVgmEImxoaG
         UhHtC5PjyRx0fw1NGNsGtfMLnVFzOYzfp9KJfP1GvEC9OYgowh61OjV8otirmy6RhPD+
         NHYXWhcasxCRjLc/g/CmuHVRn81QnzA7L06tTqa31/q+9ua0LTPBweExcqWV6bgf+lk4
         1uzVfuaR86VkS/nAMOWX0ClHZfpXQd0vdEFo3eDeNRN441uGnzcLK6NUHKwjsyAMHOWu
         vsZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631038; x=1796235838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iBl3ztGie3scC2+QPz/6CcWsyfMw4xdKCUkFMvo4SHE=;
        b=nlDSgDTde7vvmidh2ZLONmpMk0ADQT4JZRdEKtyQ/5sH5eKFtcN4Epgt46uCu19QVT
         q6tUqV0KxNv3FznxWuQyyVlpvOQOY0FtLYjLrFu9fur9KQadVacimRL6QQlm/Yp3zOWV
         ptBxXWtcS98A8KPAPF442MiqKUMeNq7QIFoUlEmmUYJGS+m8P5GEx6IyapgwkUZkr5DO
         2Bw/DPFT+dXdc76Z0b5Wry2WdTsX067N4DXoeZFRRMiUulXYjxO6acIU2786sx01OoDx
         S0M3fx/zpPKyP1P94GQlMb8W6vgqmGW2pkncwnR5TACVifu/+MrmMJvx0cz3KgiWclms
         lRgA==
X-Forwarded-Encrypted: i=1; AL+hErFAv4+ppPnx/HFUVjzBIjVxQa/kq+egQwvXd9p8gVWCPKYzruyYcx7pHFu41rF5a3KNQGNxzELCGZ5PHcrG@vger.kernel.org
X-Gm-Message-State: APuU4Z+wOVzX/iJrSWWi8gXdNn4HJoKXXwtrmGljmm1b10SqgTrmpn7b
	9mUrGgpsH+YikZ0GLOOuo7GVZglofCBSvEWPLZ4oPOQdaPNAyQ5nqudvYS7RD36Fe2RdiMpZWFL
	fD65AjyQuXvWWUHOMklJ5Y64u2puDNCy9UCuaCkVjZvpaGxz3eMOuYLg2LhYpr49S2FV/
X-Gm-Gg: AZFdTZdy9FQieaItS0HHiVlz96kb5d/vn2PctoEsgKa5k5Uz3sq7Bs5LmHIAlQhl25A
	Dxt6Gx/Cy+tW9uGa2ez0dCnxhlHcrUfMXILhK8Ig49eJkeig56RD5hjUibspx/LpnhZM2yHR0hm
	iRAMZarDROXZsHjrYbg2GbA8Cc3p/2N2WLw1jDmrr9FQh+HmIqQtdrC8bIsDuCt+6A0lQWWw5YP
	b71eyhyWj/xyto3U2xLS9sq0JgXg07r7hgDYDbcTuNHHpg4LBIvn9gQELNBUbiwLRSv59PtAiw8
	snZh+/T45hFEg4gyBS2JO5qwkJRIMLcx8DtTKvqJyQQbRQhSJZL8tVa6y2F15M+gZIGbiJztFZ5
	ZIgSGc/2mKlyIk0lLc8XsUPCAMs1qOcHA5KWxZm+2lX9lIfhECMiIpncjrV9EDiaHdR70Gh1Bt1
	BUZS74
X-Received: by 2002:a05:620a:6603:b0:949:8d0d:6f66 with SMTP id af79cd13be357-949baa15529mr2853758585a.68.1795631037581;
        Wed, 25 Nov 2026 10:23:57 -0800 (PST)
X-Received: by 2002:a05:620a:6603:b0:949:8d0d:6f66 with SMTP id af79cd13be357-949baa15529mr2853753585a.68.1795631037101;
        Wed, 25 Nov 2026 10:23:57 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm37185609f8f.1.2026.11.25.10.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:23:56 -0800 (PST)
From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH RESEND v2 09/12] media: qcom: camss: Add streams API support in camss-video
Date: Wed, 25 Nov 2026 20:23:23 +0200
Message-Id: <20261125182326.2767771-10-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125182326.2767771-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261125182326.2767771-1-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-GUID: BxCW9z502hDsi0MQ3ZVUT0Qx6greZJ01
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfX8bDQxRPFXhAJ
 JwZMMbMmrnpFH2m3EC/7mdhSPkCu3CqLRGP+Wsk9gum5qRaq6NYWVUmTHmYFNC0HBxX5su8LAnO
 xM7lysAJzNKfz9O6kSJsSwXZY76kOR4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfX1xnFER+TlbzG
 YJNrsFLjxxr6rRSTTwA82MP+9iqYM/eB5CSe5XDFdYKKOXI+Xzrh59nxT1AOcCnWNh9Bls0RmVW
 8roFOnONTMIzJSvZ/V+b8pEyLLrBKOKtO24NplzmDIqoER5B/fDqy53I0dTu9zDic4YplSgNxAq
 JMuE4Zki7b1GqM0Py0qkRGPhCxgxRPxB1Xtojktsio7jCbnpxKKLMnmi2MtUkTd8/oPKNTTm9LF
 uTZnHRX+S9eG2UjemX03831gWYdXjwKNlXuKHbsHlhfyTHgAdyRd84lXcBYTngKTf5UIzHE6gYD
 1FoYPORZZ77plVOfcpPyRNWRndvkiwfEXIEHV10TPpl1AgkCAHK8Ls+aeyPKePhqs2tOGJwCqyI
 qSskr+nXG220IW+F7xJcYAX5IVsQSNVfuiFybFNCmsZBUhXCpy6KW9nl2QHfJiK9zwP0RStXoXm
 uJxpMfrF6l0NQWlTP9A==
X-Proofpoint-ORIG-GUID: BxCW9z502hDsi0MQ3ZVUT0Qx6greZJ01
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b0727be cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=ZovgdgjKAAAA:8
 a=EUspDBNiAAAA:8 a=KYIyY8g0vu4ecJsuFiIA:9 a=NFOGd7dJGGMPyQGDc5-O:22
 a=VOxKbm1zgHvARWIDjr3b:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250073

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

