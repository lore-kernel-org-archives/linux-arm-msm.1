Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612179;
	b=dlWwxi4OzWa4YrYTPQ3mmYuycfiKLXyD7ArDzSSxJ5lSIc1iDI77DoAkwrOJbOithntE
	 4yj9PHNjnqTziHWk8CxwRHx2aJ/YBDL3g8Rrofe76ddTEw/Xxm0P2JnTcDhAX3m1WiSWX
	 2lCAhjbkNbWJCdgA+yJEWRVpK67fRkieWJLx59TfjXgb1luoL5tKAYbwJGDgT+cl3Qyvt
	 pPg8o+NYNAtp0F5l+isvlTP/OeG+e7ZSnzK79VtTnnNU5X4YCpmpl7r6tPFbWJdyY/TBX
	 U/H45IVWOhNw/oDBj8I5BKP7+Gij0XxSFIQ8/kBeTzBbBPfElW4sK0A3DQZSHhV1oNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=YWAtyNc79WQdkbROMhNY1RI8T5Lcky2yFJoGrpYRKoU=;
	b=cq7YDa374yhp4qfuYQNdY4RQoAe4cHVgPVIFyWG//6rYB3CfpXj8tpxVOWNr7hQyR7KA
	 EM//m0lTQ2wVUtE8FVTGeNPwWA0iSYz5YDjhnksf9BpPeBoUTjEEEsoL5EuGzsssxnYaf
	 nfgXs5gr2DOrL4EVn3Ell/GHc9naefH2YBq1wdasN1gQ8vUF7O1xCjhYufjsJAh6+q6ko
	 fK06gtUq8CBbA3qXBGRPMJoSyShwf9iJoJKK7Z5Faq08juqm2+HzJBExzOgj3Vna2CdaV
	 QbXtYFcrRGoHaKJE0IXOvlIpL44UZVUEVQpOPK8thcSRGAWE0IETiBoNv932clDK5fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="OZ/54F6A";
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EDA606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:09:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7EDA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OZ/54F6A
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-490f38e9688so4041804f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 05:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795612177; x=1796216977; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YWAtyNc79WQdkbROMhNY1RI8T5Lcky2yFJoGrpYRKoU=;
        b=OZ/54F6AnDomxSUn5Ga/Gp3jnOrpq7niR5rPB53XrTTu57ZWABWq5fOjT5sYRg/HC1
         s0CfYG7d64ccQQ3EVljEF2JQk1AYAkWWHtkrqNetrCKY1mOAAN1SDj9SIM4KyaNMztwc
         Di5quxXHDoAPv5Worctfs+HepxqYEDBaQ8Nhpd3reLsRvWbrQ0vUeDFRjG/nhTANdq4j
         vKJvO/uVOqWseVJmRJLcl/sLsyBAaovwGwnpTWypzIxdM6oHq+7iffa/PFFXrXoOxu3L
         KudWA877RxZ8rLCN6T27rZl5kxarUq8K650n75QP5b/jxrvxCmMz+rOuDPZY1chtFWvN
         XmLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612177; x=1796216977;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YWAtyNc79WQdkbROMhNY1RI8T5Lcky2yFJoGrpYRKoU=;
        b=P4qWhhyIbLIC09Y4JHiUrgpW34aPThkmHIuiNcin08gQ+rO+SlqPdPNUiWO1M5ot8q
         +2Ei/RHQd+fyZwkES5Fb4nf7l2Prryle+P1nKajjDwZXY2cG3nmnKDevcBmIJ1cTfsmp
         lt2gNMcXo84FOqofEfj+TlfOf/YTn/xifjk1/eGw00sGkoPfD4hyC9MuLKd5T8HNlN9G
         pBYaHety1R9yxQMumZ+qLNAcLRobLaDgBiHLChF1HNiI73yUYhXEmAqej+K+pdEfCpN4
         p30++Z1MPlp8EXg+PYRtVod9Y4mfL0bf3yz/i71U6jmqfme/j+OYGBZ42lxcprkR64u9
         5gsQ==
X-Forwarded-Encrypted: i=1; AL+hErF5UA23QReErbYh2gAP16rv+2eRH9e4p464CyE84pPqotAxif8NuyQ6LB9TsKKbWcNRankbPXiDa3adPlCy@vger.kernel.org
X-Gm-Message-State: APuU4Z/j8mBD+WeHN2Scyx3IZkat3u0BwVsRSNXfWzibywlMijbOu9Yn
	0KX9mNdhUL5f5edW5otFSsgXq9vJkgHuBXAWDXdOJfYLG6WMnkbT0Ej2r4LgJLt9/VI=
X-Gm-Gg: AZFdTZfeI/q2omqduEuGwJ29xW2BFX/DCRn7pNq8kQi5EGiBQICEmM/p/jG6goaz6ch
	hB3hyNsDMvY4K532Ghz+Fx+X0Am3RES+6xXuSaghjJLZmhLtQTzpIKp4MM3b+nIL56EyKluCQeP
	6KA4rg+89Uyns25xOeHC+9qYWi8LS6FwHicwrBKQ4HGgHbSKY8POj6xDNIoGtXmE/jWntnKL0x4
	K4laPmnlSXSge9CZTiAFDWHDl6Nmu7ScV3G2zxSq4I8Unoz3n/g7CshYXZBMcf/ihlu1D06ssiu
	vGpSVKniVGtjL9h+S+5lhPzjc8gUOsbfFEEcZAROzgLpouFMkZKaMEomdXDFJeMo8Triu4MiGX5
	b9zq7wMfxE0G/IPJMvXtlYoC8LLfV1esNRL/PkPkfT96LYUxcIQ9n+VvUV8l7UGBoPUDSAcaQU+
	egjywSS5GqyofiR1X2YdbVePd47pW1oYL6waJulELarc8KjPcWNqiuZSyXUieCkuSeZQTUrXtoR
	NS7m0svgZxwXsslFPnPnUBb+XeTbfFqggRLzxwt8wSOisH8/DuIENLJyW8KfeyFuaL/8uFMrXUd
	pWnYGh15CLa+9lDxkxm4dwe1efcGGSY3ggoR0jOMwhkZezfNpg==
X-Received: by 2002:a05:6000:4028:b0:4b7:6dcb:e909 with SMTP id ffacd0b85a97d-4b76dcbeaa9mr10335716f8f.8.1795612176580;
        Wed, 25 Nov 2026 05:09:36 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm35240355f8f.2.2026.11.25.05.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:09:36 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 00/11] media: iris: fix the decoder source change, seek and
 START sequences
Date: Wed, 25 Nov 2026 14:09:27 +0100
Message-Id: <20261125-topic-iris-decoder-drc-fixes-v1-0-58b9f6b3fe86@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIAAfeBmsC/yXMQQrCMBBG4auUWTvQhDSCVxEXdvJXx0VTZqoIp
 Xc36vLjwdvIYQqnU7eR4aWudW4Ih47kfp1vYC3NFPuYQ4gDr3VRYTV1LpBaYFxMeNI3nBHyOKT
 cT+mYqC0Wwy+0w/nytz/HB2T9PmnfP+PQYSOAAAAA
X-Change-ID: 20261125-topic-iris-decoder-drc-fixes-e16b5460f474
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stefan Schmidt <stefan.schmidt@linaro.org>, 
 Hans Verkuil <hverkuil@kernel.org>, Vedang Nagar <quic_vnagar@quicinc.com>, 
 Wangao Wang <wangao.wang@oss.qualcomm.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6888;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Yancvovh0vbF1SIJKIvS9sf9FFE8pd8/0a9LLOuIbbw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBt4K/RIkAhiY9cW76TGXn7pTyol5aubi7+qQm+X+
 21HDncGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawbeCgAKCRB33NvayMhJ0UMJEA
 CjcAD29csAvC9RPy8r8UiRkoQRjA/XJ5FcKmlc19RiSMQ/MXpohvJj5rWCrCTjUj96VbgGxYg9vPsE
 8Pi3sq7o4p9XkW4T6ajbKoPLHwIduVbzE401+6yAZwlDtXgy01Rm3oCddy+snZgGo62KDcHAEz8n9W
 9jUQKA1V7YCzn2SDAmVZYooEJM5/b1LXogMUIKfS7rZs9nk/w9RN+kBLQwuSnlWcly4/xkjpIyxb6d
 B5mpRjsrYsvL5H/C7g6x9xrhaNjRYPy4y2Twu7ceYrOJB9DThKt/Uh0whm8+7+iTB/cVnFfkT6NIp8
 X71J1QP7nbwlzSYYuFV6kkfn8j2VqMvWL9td0DfqOcVnuW4+XWV4C0HOk7BPcq11nBmuWMg5FeKxrW
 4MzMMg4krXp6eozAWylzq+2KsmlGdq4VcU4yx0IYGmWS9XE9PJzoZw1uOVFiP1WfFYhXUjleszXsJH
 Uy5uZrZCA+B9B/9vExZMKxoKiPNeJa5k/2keP2zYfEmouOfZP7IPzBHcajkroJDbPnJfaED+4AomqR
 pzrQjMXHA3yiq8DAOM3t6o0auBb1VYaRD2NyGLmbr17iegeHS9UEHjs/oQG7LCB7kl5N98T/O6T69A
 Pdn4p7QApFK1xFlwb3tikFk8z0XtvYILedDPxyv4wFqjkcwHPYF+N3gqRKmw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The iris stateful decoder fails the v4l2-compliance streaming tests on
streams with resolution changes, and FFmpeg stops after the first frame
of some streams. This series fixes the decoder sequences of the
specification a player uses: source change completed with
STREAMOFF/STREAMON(CAPTURE) or V4L2_DEC_CMD_START, seek with
STREAMOFF/STREAMON(OUTPUT), drain, and CAPTURE started before the first
source change.

FFMpeg is largely not compliant with the V4L2 M2M spec for DRC and seek
handling, freezing and stopping for such streams. While the kernel can't
and won't fix an userspace program, we made sure the basic FFMpeg kept
working when fixing DRC and Seeking. Proper fixes for multiple DRCs should
be done in the FFMpeg code instead of the kernel.

Depends on:
- https://lore.kernel.org/all/20261125-fix_dec_seek-v3-0-66c9889def2a@oss.qualcomm.com/
- https://lore.kernel.org/all/20261031-fix_v4l2_compliance_unlimited_opens-v1-1-f20cc9231ee3@oss.qualcomm.com/
- https://lore.kernel.org/all/20261028034335.26075-1-ccortner@gmail.com/

Log of v4l2-compliance run with an H.264 stream with the following DRC changes:
- 176x144
- 1600x900
- 1264x800
- 1592x1080
- 1024x768
- 532x312

v4l2-compliance 1.33.0-5524, 64 bits, 64-bit time_t
v4l2-compliance SHA: d2e89246cefc 2026-10-30 13:45:36

Compliance test for iris_driver device /dev/video0:

Driver Info:
	Driver name      : iris_driver
	Card type        : Iris Decoder
	Bus info         : platform:aa00000.video-codec:de
	Driver version   : 7.4.0
	Capabilities     : 0x84204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
	Detected Stateful Decoder

Required ioctls:
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video0 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 12 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK
	test Composing: OK
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)
	test blocking wait: OK

Test input 0:

Streaming ioctls:
	test read/write: OK (Not Supported)
	Video Capture Multiplanar: Captured 556 buffers   
	test MMAP (select, REQBUFS): OK
	Video Capture Multiplanar: Captured 556 buffers   
	test MMAP (epoll, REQBUFS): OK
	Video Capture Multiplanar: Captured 556 buffers   
	test MMAP (select, CREATE_BUFS): OK
	Video Capture Multiplanar: Captured 556 buffers   
	test MMAP (epoll, CREATE_BUFS): OK
	test USERPTR (select): OK (Not Supported)
		warn: v4l2-test-buffers.cpp(2223): Cannot test DMABUF, specify --expbuf-device
	test DMABUF (select): OK (Not Supported)

Total for iris_driver device /dev/video0: 55, Succeeded: 55, Failed: 0, Warnings: 1

Similar check was done with HEVC, VP9 and AV1 with modified compliance
tool to allow setting the default decoder format.

Assisted by an LLM for generating test suite, test streams and issues
pointing in the mainline iris driver against the dowstream driver and
behaviour of the firmware on a SM8650 HDK device.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (11):
      media: iris: vdec: accept V4L2_DEC_CMD_START on a running decoder
      media: iris: restart the buffer sequence numbers at each STREAMON
      media: iris: vdec: update the minimum CAPTURE buffer count on S_FMT
      media: iris: vdec: reconfigure the decoder on START after a source change
      media: iris: clear the stopped state when the decoder resumes
      media: iris: don't return a spurious LAST buffer
      media: iris: vdec: keep the visible rectangle on S_FMT(CAPTURE)
      media: iris: gen2: don't align the decoder input resolution
      media: iris: vdec: resume an unchanged VP9 settings change after a seek
      media: iris: vdec: complete an unchanged first settings change for FFmpeg
      media: iris: record the LAST buffer returned with an error

 drivers/media/platform/qcom/iris/iris_buffer.c     |  41 ++++++
 drivers/media/platform/qcom/iris/iris_buffer.h     |   1 +
 drivers/media/platform/qcom/iris/iris_common.c     |   5 +-
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |   9 +-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |   3 +-
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  53 +++++--
 drivers/media/platform/qcom/iris/iris_instance.h   |  10 ++
 drivers/media/platform/qcom/iris/iris_vb2.c        |  24 ++-
 drivers/media/platform/qcom/iris/iris_vdec.c       | 161 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vdec.h       |   9 ++
 drivers/media/platform/qcom/iris/iris_vidc.c       |   5 +
 11 files changed, 294 insertions(+), 27 deletions(-)
---
base-commit: a78785697f5d3851eecc3f6bdcc05f357fd89695
change-id: 20261125-topic-iris-decoder-drc-fixes-e16b5460f474

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

