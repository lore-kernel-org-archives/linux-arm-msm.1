Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030994;
	b=qcH55DY03JT3SpFQCTZGf5R/ZiOaOlqlFXff0hfQM2ri0f8kF3+4QsMusTdtk8sqHvsN
	 OvQZCgZXzF+SwnX6kHKa39fT47HfYOY2+rkC3+vo6Mc8y3/zNaYCIB+Fcl/yeKMOfGu1g
	 KarcLW8g75gS25Vcvz7PhGXVp2RObR9oBX9KtEIg0czXDd4IC1BOFp9pG1FnXvtWJgEBk
	 8V6znbEDw9P4vH9Trkh86Y3MId7VGpRnYUTDdhQR2UAQJiJAYhC6175tx5rKpHD3wG2qF
	 5Axlimje5Vl3uirGzx+ZmhHeoE6h3Gn2Yxz5bKEpAA48S/8YgKp2v1DHIvtXMLuq/lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=1wVVjAN22ulQJKFqD/QUSRwh146acUkCNkVGGsaACqg=;
	b=ZYOjvO9Y+H3ZJMAv7MvIY4n9N1iNENjwYuh7XWoKBE07Z7n4eAewSiOldabGVs1oEv3t
	 gohn1ngHH9rAFg58FnvXS3LvT2dGabToej8DQ59QOQeiww6K7SmALg/syOof+9icoiVZJ
	 YHQfi1uaNL577fp1kJzfXQFMWWiWfT8oZk+phzxMHC3t97q7VT35RI9ZdhY9CTkdy/3xN
	 QO1bg9xw5ZPwC3+PQJXZzHEeHwJFShPeWmD10TFzqCZzR7p3uLlHXyKc7xtY2B2RvJhyN
	 aTdN4PNYOvN603ifE/qXfdt0Yv30s/hneXz6d1+ff9NVGAeGGUKTuPTlFqGPua7tFWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mDoNb3i5;
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749F4606A32C
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 16:09:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 749F4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mDoNb3i5
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91c60e30054so10270036d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793030993; x=1793635793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1wVVjAN22ulQJKFqD/QUSRwh146acUkCNkVGGsaACqg=;
        b=mDoNb3i5V67k287VPFUWt5FSGms4m4CnqPGfNhiOXYwPH1hgFlxD6yKZpnLXYC3v2s
         wIV9spwbePrYyJpZAZEXwaPbw2wBLSQw9/om3xpinxxUWe+8MSPBwIwbo/ghEyGecaf7
         wMbT15HvgZaXqITpQN6gWd72J200NhFwT5D5nQtZ9zxRv+Zl/+0yoxYEt8u6rIZNOYj4
         KGPGtF9z33isBh59rUpt+qcQOs6OTbK2Vacg1FiN1GFJa8Tyh7alBVwn/VNoLLEavf82
         vaReFuazlCTWIvJowrwIfcNMApAOsglYbnZC4XV7CBU2i4INoVx3qOjlH4JQ8LWj+eLx
         rZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030993; x=1793635793;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1wVVjAN22ulQJKFqD/QUSRwh146acUkCNkVGGsaACqg=;
        b=y1jZ5FOi4A50cXtI6pniQ6hGCGPdv+MPmyjzRCMCWJOm1AWCw8yOBPTGoUV3mXm456
         y6EyFDcMsG25QghkiBfzEDhpebcz6cw5r1ESUO18PQHQ+YdWRIxP6sYfwl6PLfxgQ7uH
         Iv2XXQ654nByABzI5addnl3aYhRhXO08FoljOQamCsxT7CPqF5J1of8+ox905OYVK4kJ
         jyYdrvCgdOSe2e0u+UdatRzUgtSfAFwVMfMEYI6uMNfWle1NfHNrJ/tg0jAECEIyWVWG
         N68AeMRj9o6zXtLXbqs/pzUW0XipI4ts4J8R6oQ/Wb8bj9mD13UjHxjbOLdUo0BJ2Egb
         roqw==
X-Forwarded-Encrypted: i=1; AKwUvBx/ZGj9Iyv0V52Le3miwk6MDUDboY5LtpEfEmvdKIw1ySciRATYScFAVspdatLOpVQHsEpvldZUrzeiCHf5@vger.kernel.org
X-Gm-Message-State: AFq9FYLGhhoXFvi+dLnmgOA7yTWQ4VJadaTmbe9E7xbk6otTdH8VTn36
	3A1UgS3JgL0LgverKe1Zp23tTjzXaUSqfEVOx47ObRZuMvjaWoYQVtQy
X-Gm-Gg: AYBFou2kEJAuGt/oKWlDM88zZxM2sK2O4ko1BVR7RwtcaWl6El1LAXw/6hUq2hEgK7Q
	gE6dj7PxB5Wzjy4fMoxcbVh9wopewpHWNyn6MTFcYITiJ/stovMFAK2lMHY+NL3spV96Tl1nHpk
	+7bT+Yr9YNzAN15szuG7kBAYT3sWJj40uo1WT+URggqV7+nLo2bklFU7LpkmEly5XPEocDHOJq3
	73/dXfnr0/8w5yv16I3WNWg0Y0hHeyDQwE0WABuDVb6sVQfTA6ug1MyvphYwkOqhr68kLqruMJZ
	0X5f7641vZw4Jk2/doo40NjKhFgghL2T4T7j9fW8k+nDaKMhEjbW1Dp4f6xmghXqCz5I4Vtzm4W
	PcTst5I1aMTGzd9f1++BUvOirW66ZDl/h4+FfDZhIVE3dxCBIJ9K/MMIYSkxeKe5qYXqxw/sYzB
	ZM0Z1g4vLDu7VmnSnUBBr1YxgwKW1mYg8m6U6+wHqQdLKUq2rTg9mAI4fhS3XpJL9I02yY0iVGB
	HrClKnmkdfJ+NhWskeiBMsD67eZgo8snyKLbtLy/p/aI4JyYrdKJCI6nNXYK+tSxO1C01+GvH5P
	Hjdx0aMChgjiW08p44ytAwWu2Du8lYzumiYblpLVeIwu2BEsTbz3zA==
X-Received: by 2002:a05:6214:2426:b0:914:4bd3:d984 with SMTP id 6a1803df08f44-91c48e5295bmr123146416d6.34.1793030993136;
        Mon, 26 Oct 2026 09:09:53 -0700 (PDT)
Received: from localhost (h159-112-31-107.euclwi.broadband.dynamic.tds.net. [159.112.31.107])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47c6ffc2sm76425806d6.28.2026.10.26.09.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:09:52 -0700 (PDT)
From: Christian Cortner <ccortner@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bod@kernel.org>,
	Birk Skyum <birk.skyum@pm.me>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [BUG] media: iris: resolution change handling stops ffmpeg's h264_v4l2m2m decoder on glymur
Date: Mon, 26 Oct 2026 11:09:49 -0500
Message-ID: <20261026160952.22082-1-ccortner@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On an ASUS Zenbook A16 (UX3607OA, Snapdragon X2 Elite / glymur),
ffmpeg's h264_v4l2m2m decoder outputs one corrupted frame and stops,
on every stream I tried. GStreamer's V4L2 decoders work. Below are the
two driver behaviours behind it (1 and 2), two more that stop ffmpeg
at a resolution change in the middle of a stream (3 and 4), and an
inconsistent CAPTURE format that ffmpeg happens to avoid (5).

I'm not a kernel developer. I tracked this down with an AI coding
assistant (Claude, by Anthropic): it traced the driver, wrote a small
V4L2 test client and tried changes to the driver. Everything below was
run on this laptop, and each local change described made its problem
go away here. I can't review or defend kernel patches myself, so I'm
reporting the problems instead of sending fixes, but I'm glad to test
patches on this machine.

Setup: the linux-msm laptops tree at 65f4ae7320b8 (v7.3-rc7), which
has the glymur iris support, plus the iris patches needed to run it
here: patch 06/13 of "media: iris: Migrate iommus to iris sub nodes"
v5, a driver-only form of the restrict-region IOVA fix, the PAS ID fix
and the runtime PM reference fix from the list, and radxa's libva-v4l2
kernel patches. Firmware: video-firmware 3.6 (aeb98f00ce9f) from the
Windows driver package. ffmpeg 8.1.3, GStreamer 1.28.8. The functions
involved are the same in media-committers next.

I could only test glymur. Birk Skyum's h264_v4l2m2m decodes on
X1E80100 matched a software decode [1], so problem 1 probably depends
on timing. Problems 2-4 are in code that runs at every resolution
change (2 and 4 on HFI gen2), so I expect them on other platforms too,
but I have not seen that.


1. A full resolution change at the start, although nothing changed

After STREAMON(OUTPUT), the firmware reports the first source change
about 2 ms later. ffmpeg has set up and started CAPTURE before that,
with a format that matches the stream. iris_inst_sub_state_change_drc()
then takes the IRIS_INST_SUB_DRC path rather than
IRIS_INST_SUB_FIRST_IPSC, so the client gets a full resolution change:
an empty LAST buffer, then no decoding until V4L2_DEC_CMD_START or a
CAPTURE restart. ffmpeg sends V4L2_DEC_CMD_START as soon as it sees the
event, gets -EBUSY because the drain is still running, as
dev-decoder.rst allows, and never sends it again after the LAST
buffer, which is a bug in ffmpeg. A test client that starts CAPTURE
early in the same way decodes all 60 frames when it sends START after
the LAST buffer, and none when it behaves like ffmpeg.

The question is whether iris should run a resolution change here at
all. The note in step 3 of the Initialization sequence says: "If the
values configured by the client do not match those parsed by the
decoder, a Dynamic Resolution Change will be triggered to reconfigure
them." vicodec raises no source change when the stream matches the
CAPTURE format. Keeping the event, but resuming the firmware in the
driver once its drain completes and giving the empty PSC_LAST buffer
back to the firmware, when this is the first source change and the
parsed format fits the CAPTURE queue, made ffmpeg decode bit-exact
here.


2. The empty LAST buffer of a source change is flagged as an error

iris_hfi_gen2_handle_output_buffer() sets V4L2_BUF_FLAG_ERROR on an
empty capture buffer unless the firmware flagged it
HFI_BUF_FW_FLAG_LAST. The empty buffer that ends a resolution change
carries HFI_BUF_FW_FLAG_PSC_LAST instead and reaches the client as
LAST|ERROR, although dev-decoder.rst says such a buffer "must be
ignored by the client". ffmpeg prints "capture: driver decode error"
for it and outputs it as a corrupted frame; that is the one frame in
problem 1. Exempting PSC_LAST the way 7adc11e6abf6 exempts LAST fixed
it here.


3. V4L2_EVENT_EOS at every resolution change

iris_vb2_buffer_done() and iris_vb2_buf_queue() queue V4L2_EVENT_EOS
and call v4l2_m2m_mark_stopped() for every LAST capture buffer,
including the one that ends a resolution change, and ffmpeg stops
decoding when it gets the event. Nothing in iris clears the stopped
mark again, so the EOS of the real drain at the end of the stream is
never sent. With a stream that changes from 640x360 to 1280x720 after
30 frames, the test client, following the spec, got an EOS at the
change and none at the end in 6 of 6 runs. Sending the event, and
marking the context stopped, only when IRIS_INST_SUB_DRAIN_LAST is set
fixed it here.


4. Stopping CAPTURE during a resolution change's drain kills the
   instance

ffmpeg handles a resolution change by stopping CAPTURE about 10 us
after it dequeues the event, which dev-decoder.rst allows as a way to
abort the drain. When the stop reaches the firmware before it has
returned the PSC_LAST buffer, IRIS_INST_SUB_DRC_LAST is never set. At
the next STREAMON(CAPTURE), iris_process_streamon_output() resumes the
firmware without reallocating the internal input buffers. 1.3 ms
later the firmware returns the PSC_LAST buffer it still owed,
iris_inst_sub_state_change_drc_last() rejects it because the input is
no longer paused, and the instance goes to IRIS_INST_ERROR. Nothing is
returned after that, and the client waits in poll() forever. It is a
race: the test client imitating ffmpeg stalled in 2 of 4, 0 of 6 and
1 of 6 runs in three series, and ffmpeg stopped at the change every
time, from this or from problem 3. Waiting in
iris_vb2_stop_streaming(), for at most 500 ms, until the firmware has
returned the PSC_LAST buffer fixed it here. Completing the resolution
change at STREAMON instead did not help: the firmware then returned
nothing at all.


5. S_FMT(OUTPUT) leaves the CAPTURE stride and size stale

Setting the OUTPUT format updates the CAPTURE width and height
(8aadfd445373) but not bytesperline and sizeimage, which keep their
320x240 defaults on a new instance. For a 640x360 stream,
G_FMT(CAPTURE) then reports 640x384 NV12 with a sizeimage of 147456,
and iris_vb2_buf_prepare() rejects CAPTURE buffers smaller than 368640
bytes, so a client that allocates them from G_FMT cannot queue them.
ffmpeg is not affected, because it sets the CAPTURE format itself.
Recomputing both fields as S_FMT(CAPTURE) does fixed it here.


With all five changes

 - ffmpeg h264_v4l2m2m: bit-exact against the software decoder on raw
   H.264 (5 of 5 runs), MP4 (3 of 3), and across the 640x360 to
   1280x720 change (2 of 2).
 - GStreamer: v4l2h264dec, v4l2h265dec, v4l2vp9dec and v4l2av1dec
   bit-exact at 1080p, H.264 and HEVC also at 2160p, and bit-exact
   across the resolution change. The encoders still pass.
 - the test client, with CAPTURE set up before or after the first
   event, and in a mode that aborts the drain like ffmpeg: 27 of 27
   runs bit-exact, and at the resolution change one EOS per run, at
   the end (12 of 12).
 - v4l2-compliance 1.33.0 (c6600a7e342e): decoder with -s5
   --stream-from=<720p H.264> and encoder with -s, 55 of 55 each. This
   tree predates 1facae9bc3c1, so the bus_info prefix check had to be
   relaxed for these runs.
 - 60 s of 2160p60 H.264 with 15 IDR frames: the firmware raised one
   source change, at the start.

[1] https://lore.kernel.org/linux-media/179224901845.60580.12634525576974095945@pm.me/

Thanks,
Christian Cortner
