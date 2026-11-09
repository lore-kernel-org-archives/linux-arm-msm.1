Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223591;
	b=F6ZY/jbQUZl61FugIRSfqb4OUzl6tYlHdQIeUWoQ/HW54JCVKrguecO1raN2s1Qk/iz0
	 edapKObvGqjMbHASxbg/cPRCohJIeoP6rygnGdHBlkH7sz3qAZBfVK7L7uNsd0TUAj+Zr
	 U1lgRILniDpiQggordD/v5UcWB4n31SqQ/NbncVcjYvAa6UO5OqgvQ5sCgkciyrwJcpDA
	 v+TMi9beZ1+kZ7nMyYyVhcp27/dhUie7IC4eK8Jx7zBeFrqJHkb2CoWAZZTBA1eE0jmRv
	 ea3cDSp8RbU86SQYZIurGFi07s7mMZmINwCF7iMYD3wzF+AGPPNnFiy7vV8ZHMectFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ohyyU3d5fCDMIA+Xz1oydu2LA2MYuLIcnUp0rP9irJk=;
	b=TtfKHpyaBo4I+j4cd4vRaduuzGl6+JsJ0lbdRUmow8CdHVmCjal7Pc/otqQ5WmadELt3
	 JN3Wlnfzs+gfqE8x0EYnWELvIuTnmCMbglmbTDCbvEVHfq7ZOw3Gw75TIQz53FmBiQZrt
	 seA9AEFdW3ph3CqbpgTc0ko0zY1LNQZnjfZDogbj2/aSc2x+8QAUkRpWAn4ivPmT8Tv/d
	 O4X8zLGJieZQJ1iMUj5asbNX85VQzgJ+Uwqbo2xWBJOd41aC0MsmkrQ3QHv0VoIb7N1UH
	 aFModsCtZKNaVlqeJoWs28zX6RqJ7dcuyQVjXTfewullwaBa7uDzu8M8w/gR0CmEwYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=L+FW6aib;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C590B606A326
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 11:26:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C590B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=L+FW6aib
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b32bbd39d5so4594537b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 03:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1794223590; x=1794828390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ohyyU3d5fCDMIA+Xz1oydu2LA2MYuLIcnUp0rP9irJk=;
        b=L+FW6aibCHTP+TRnSSxMUeKf4LzOHnogNwEmXqAYaYmIX6MWtcdz/OajbMNlosZUI9
         ZZsGPE3sym3Ru6n0AEIsmx59ZH+FsE+x7pG+5EG0U+M2z4wHBmX6g3RVbqmfWjKxEIIh
         FGrm8MpLIJ1OUqLf4UM6xWFpOPY0g/6xfAZ0Odx6uo6D/iDRzKjnsNVU9r6k3+k8YtRj
         yKgMqp3EDHqsK0Y0h2Abm8xQ22laYhHb6laCY/JBAole5v5VvIEc90mzzjgwPQpcmt9l
         I1jPXBj9wqpxX3Na3IM1JojEJ+ab18U4B/bsV9ov3ZqhqRbWtpkEV5GLAZimogZmjNrW
         qUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794223590; x=1794828390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ohyyU3d5fCDMIA+Xz1oydu2LA2MYuLIcnUp0rP9irJk=;
        b=P2x/c5v+UE3bmlw7b3ebMyGg5o2U1DtAGBJsQLiqP0sZ/BhdMqq9XY5DaUWoaZ7G4e
         KMYzNQRbBL+SgMBrXn4Exgjn0XfXcFhOjsjdgCL7l7G6ZfU/G300DZM/CdoB7eiAEXKW
         8i3t6FjU534gYVi2JnPGQ/FsO30G+nu1XkcQNd5iEaXSWtifhrNpMF+BIcQDreTyIWVu
         jZUEMLZCkewgHWCzAyZ3i6EgZKQn0ZWV38s/I1dIYBEcOlxAOFfHSvcLcRDU/GMvnILq
         Wd/QEESSw0MgHm2Y0quV52ArVsOIVOYUqUthEE/TgwMLUBGfEqwI7NrtJj3qT06wD34Z
         MpUw==
X-Forwarded-Encrypted: i=1; AL+hErEVFVrrICJWgzi3rA35GIHsuiwSsv1uGEE2QYeXgnifbe8Qvg656ewShv9ya++IY2l2WB26CaC5hyH8hlQ7@vger.kernel.org
X-Gm-Message-State: APuU4Z8BkTGnBHBfPEFiDirmjcq51Iwlf1et5AN/4BgRoGuWIqKBmEB5
	CMJGum+tt41R+7RPvlBuqV26jAQ1L8SKp3Q6Dg4gUzDHWutteEnjLqmUg3Ju6D17B4w=
X-Gm-Gg: AYBFou0QSIGg5ACc8Lz+U+HU0VsBPBFifOL4/D8p2eDAhlF50L7rxHoGw9tgkonnk5Z
	Lsb7lucz1mNwVyS2JRWtu5iq9HHHKy30PZsHqjDuLrdUA7O/cupqAkstEtSEDws3pcF4C/pYelk
	uudPNUIEo0+Og9tHzXptL+vIh+yzxh+5/aATFy9XPxqN+kKbzr+OW6NUwi42UoiD5jx0bYf5wxq
	6ycJuKXa9jGK6tro5JF1wPHh79s8Vt3Zv3cXxK576plZLuAqtsIAKwWlzoVcE/Y7kST+JfCLcop
	Kmr6nLzNQHVAoWAU28d6CvFhbkd4uWwXF5haT6odHpUZlamoJG8nFszpiEYl/fgOlzGykS3yVpH
	6viSVxdFaXy87Trg7Keq7gISEw6Fnvn+QQbmSqSsWc1sEb2EJRXrI0bOj/CifmQss2vDEYc8tAV
	0GBOrLinLPLyF/0QR8rGPBN0/Zliu4ByK9QmIotj4bFciYC3omdG7nROTbMG+201UJpfmp3xN7E
	8elBwSerzpCpnEbFDWWnA7uwRIV9HsuL4dIsJy5O+jtbIdgAQurKhZ2fYnjW2w4gYUoFbril3kY
	0jURrCD8x3ft+lxOhJsYP6g2C+Nxdwaxck6AqW+h0ZlCJu+ILgzROrNURkT+Z+eQ6FQ=
X-Received: by 2002:a05:690c:a211:10b0:8b1:ce5:be39 with SMTP id 00721157ae682-8b36cb386dfmr20292887b3.38.1794223589604;
        Mon, 09 Nov 2026 03:26:29 -0800 (PST)
Received: from localhost.localdomain ([2a09:bac5:dd4:1c96::2d9:5d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36bbffb49sm32385477b3.28.2026.11.09.03.26.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 03:26:29 -0800 (PST)
From: Allan Siriani <allan@fatecpompeia.edu.br>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Todor Tomov <todor.too@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] media: qcom: camss: always stop the pipeline in stop_streaming
Date: Mon,  9 Nov 2026 08:26:10 -0300
Message-Id: <20261109112611.94010-4-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261109112611.94010-1-allan@fatecpompeia.edu.br>
References: <20261109112611.94010-1-allan@fatecpompeia.edu.br>
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

video_stop_streaming() walks the pipeline upstream and calls
.s_stream(0) on every subdev. It gives up on the first non-zero return,
without stopping the media pipeline and without returning the queued
buffers to vb2.

A subdev without .s_stream() returns -ENOIOCTLCMD. video_start_streaming()
already ignores that, but video_stop_streaming() does not, so with such a
subdev in the pipeline, e.g. the pixel array entity of the MT9M114 sensor
driver, every stream off:

- triggers the vb2 WARN about buffers still owned by the driver,
- leaves the pipeline started, so the next VIDIOC_STREAMON and
  "media-ctl -r" fail with -EBUSY.

Treat -ENOIOCTLCMD as success, as at stream on, and only log real
errors, then always stop the pipeline and flush the buffers: a
.stop_streaming() callback cannot fail and must give back all buffers.

Fixes: 89013969e232 ("media: camss: sm8250: Pipeline starting and stopping for multiple virtual channels")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Allan Siriani <allan@fatecpompeia.edu.br>
---
 drivers/media/platform/qcom/camss/camss-video.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 5de6ff5ec..8341666f9 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -313,12 +313,16 @@ static void video_stop_streaming(struct vb2_queue *q)
 		entity = pad->entity;
 		subdev = media_entity_to_v4l2_subdev(entity);
 
+		/*
+		 * Subdevs without .s_stream(), such as a sensor pixel array
+		 * entity, return -ENOIOCTLCMD, as at stream on. On a real error
+		 * keep going: the pipeline must be stopped and the buffers
+		 * returned to vb2 in any case.
+		 */
 		ret = v4l2_subdev_call(subdev, video, s_stream, 0);
-
-		if (ret) {
-			dev_err(video->camss->dev, "Video pipeline stop failed: %d\n", ret);
-			return;
-		}
+		if (ret && ret != -ENOIOCTLCMD)
+			dev_err(video->camss->dev,
+				"Failed to stop %s: %d\n", entity->name, ret);
 	}
 
 	video_device_pipeline_stop(vdev);
-- 
2.43.0

