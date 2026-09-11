Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517483F88BA
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789107770; cv=none; b=Tk9maUBuW7BCH4doq52xA5NYX0vRWpAi1GP3zBOl/unZQaTk4gtcSYyPojX61Ga8DhYbIGLwwsICS8unozkTDZvK5lF9kZUYc3wRdJucwzspWz6inefR+DalAc9senbUw3SoxH3qj0kt9LXUNwnziUrbK2rc5FzHmAAy6uIfc/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789107770; c=relaxed/simple;
	bh=P4yejfQoXWEs5WCIo/uSBIMrvzn27wZhAYZfF4/HElo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uNMqKmwj0J/Pmr2f6jDpsACRI/Tz75xTiU5tkIokUbDY76uXPL1TOt6t+AM3+UWjAEq171vuuolQoMKXRP95x+h+glLj0VMCB0NU1EjP7+UV0mIeF0CZx3ZVDrLxgFbKlpjEFnj93U2EKXiXDY2gm/rouhCPH5OTF8l4JNNt6P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lx/aQ248 reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lx/aQ248"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B4vGBe3305540
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PfojdtiyVIg
	osMA6X+iHeGMye0+VmyZKBg4VC9xW9VE=; b=lx/aQ2483xB8JntsTK70Vs6ZrBC
	Ho7PlKVSau9VG6ZB5ObLmWTvREKVo7fqxc5wwNr17ViJA/HTwOKMIwAWek7IPZrX
	CzbBk18RbINJmHKM9HoqFDegr7b/4gAtkvh3d2Dg+6d/uEyPEQbgdLwlF5Qkew1y
	Ojh9md1zwZRU06fDNyuRAsMMTMKfmS2n3OzYL1MbDClbunUbltPudVXN4dDtnwau
	/l+bP1PFp+070JNGcLT4zvS6GdU9gEq4f3VjDVAHajRoWsXndaq5Lqfi4+OC4P9U
	braS7XiYZZkuB59ZYJRwamjWzo5sEXFIdZN54aqKP1Cgy7pOA4dh8aEGygg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmapg0cd9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:22:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so100920085a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 23:22:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789107751; x=1789712551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PfojdtiyVIgosMA6X+iHeGMye0+VmyZKBg4VC9xW9VE=;
        b=IF+G+TfZcjXjK1ZX3Jz1f3wiCQ3LA8Zb7LpoubW5TUQuXYgTwyPpndUs1saSiwl6qZ
         ku5hUw6f1XHVk8N+f8r/20oyvPk932NpAk49KbHSAUuGE7VpxUzKfcShahz6x4kfqA4E
         crBA1zmnL344S8w7oBd2EQcQ33m8STtjpbwPNVS//efbScbXtFTrGg9JZQvrVD/5xl+w
         XAzN17kVvqwYitejmEBDL10CgbmMI0y92swI0H+XPU21pdLy9sAHlRud0NJsSlTuMLfF
         3yelyx22ouOs3h7iWdXjORKRHE4yYaDzZjmi4+zJhpK7mQNolk3mxnABBNR9UkF1AAST
         aHWA==
X-Forwarded-Encrypted: i=1; AKwUvBxgkcQzhWcfvJFE6+AGsBmQvOXiKyYk5TbwTk/zXZ4WJF5iwK/6sfYZ5hH01WY8Tgow5JAg4Ogzr6Jm3QV4@vger.kernel.org
X-Gm-Message-State: AFuF++nxEM+sjGIiFQqKKfPXezcAUxwMQ942bePiVHfX0pXTlqA8wtAJ
	Tfh+LhvCvP6Moypnc+HJ6XOxXhjPe7iY1h5xKswNGkK/rXS8WmmHAEJfV1E1mF2QSU16Dta0Z15
	sdWW/ZjvsHDHVhV4KP0n4qG2sVA5J0zhWYvP/oU7lW1N3iwTaNnZWuL9z0umFo8RuHEWj
X-Gm-Gg: AYBFou2GyMW1Tm1Ow3jcR1Q5/T+B+TCioDJclADJh235yw9mXVIXZrsvseuueUJiy22
	pS1uMIUetfiJ2h0dYUJq3AkBOgOTQUCoIyJHstpMefNxYrKUk6Je56Pa6G/U/aGEzIrgyA0etSf
	bNZE98PeyHR2Tfq9yFKbHf3gYAugGquqghhA86WkR75dV1hgWNAeurc9OkMOE4ds+1t+uwFYreg
	LzibC3M9Oc5YHVmjqvj7l3e42ZIWsMqWnrRQEwZDUMYM+4NI6ks+23Dli9QutIW7GoMM7oEcPQs
	Epl+ypjxvDMK8RBkZZ/4AwEXY6GVZnx8NEfFCC3N9Gr+rIAdbYuCRqVlDh0=
X-Received: by 2002:a05:620a:a0cc:10b0:939:f27c:7433 with SMTP id af79cd13be357-939f27c802bmr47740785a.50.1789107751005;
        Thu, 10 Sep 2026 23:22:31 -0700 (PDT)
X-Received: by 2002:a05:620a:a0cc:10b0:939:f27c:7433 with SMTP id af79cd13be357-939f27c802bmr47738285a.50.1789107750457;
        Thu, 10 Sep 2026 23:22:30 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ea60sm3681969f8f.17.2026.09.10.23.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:22:29 -0700 (PDT)
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
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH 7/8] media: qcom: camss: add streams API support in camss-video
Date: Fri, 11 Sep 2026 09:22:12 +0300
Message-Id: <20260911062213.195007-8-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: O45p2TwKrEDMJK1sJkSj-0r8T-xhqNJu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA4NiBTYWx0ZWRfX0eckr1Oeoj4N
 HwkBeLx4kzB3yJsAzLtaFq0by+x25wmwXtmIfGbaV3rDZmP3Z/Xb8ro5o+tOPll+MhC4lRqQKh2
 Uu3yWxBSLAdrdk+OlsEBxOwoSCHRtw4=
X-Proofpoint-GUID: O45p2TwKrEDMJK1sJkSj-0r8T-xhqNJu
X-Authority-Analysis: v=2.4 cv=DLoacCNb c=1 sm=1 tr=0 ts=6aa39e27 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=KYIyY8g0vu4ecJsuFiIA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA4NiBTYWx0ZWRfXwdz8CYXaxSsb
 syVk88pZNOYIDkX83lzw8QE0Q8wfpfgKTYFAtcPm5002zvbRcv4QmgrHSXIypAbWdH6woR1zzMx
 30HhlRAqshJq52Xv4aobHjIenMIWd4SPUzjlY5bCnaUTsyx5ESQi4YdK9H9JGtEFczCSdf0zRwv
 Zkvmgdw6pwjBc+KhhwaTdja5yz2JV2OnyZhAu65/oVqFw9GJD4WJMsuWqdoShrf2/Bsmq5teReH
 xXQmV/mhM4lmpwP6k/Fu9pm/zH/V5Tw3aDzHoAnnihNPUuUts2+WIlzDp5d7EPlp89IyyLUkvN9
 H3lpe8IAHvf6CGZIzoUiVhaYCbcz6my/psufiJt3uNEjYYQgrU0dVsq6Lo9OgLRmUJYRg6fN2Dp
 UC8RN/enymJXKBZfvLQ3tDDwhtT4guPnTiHJRbvPE8fpz0PmICBWiv48zcU9DOvaV0jWrY+xxOM
 NX8ek9OqFAXDkVvhVCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110086

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Generalize the video device pipeline walk to be streams-API-aware:
when a directly-connected subdev supports enable_streams/
disable_streams, use it; otherwise fall back to the existing legacy
start/stop path, which walks the pipeline one subdev at a time via
.s_stream(), unchanged.

video_stop_streaming() must always call video_device_pipeline_stop()
and flush_buffers(), regardless of whether the disable path succeeded:
vb2 requires stop_streaming() to return all buffers, and a successful
pipeline_alloc_start() must always be matched by a pipeline_stop().
Make the legacy fallback branch match the streams-API branch by
logging a failure instead of returning early on it.

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

