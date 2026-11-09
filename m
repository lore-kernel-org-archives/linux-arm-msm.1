Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223579;
	b=IjNJkvrRWot3hViSQJg/eCimYaTUKSRTKXE9Bpj1earHSUTZw3j/NUltlj1ocPImkNoZ
	 ISckSPyOISy33Pj7ohEcST8IdIERo2NUcqOZLS39EpMwB4MITiln7FWxgfI6G2vxrmPaq
	 GE5yaCw2f5Y/otWbuEi04n/LxeG3oRRwCsd+Gj0HpnaNLlsgdAZEDygZO1XrW10ff09Qg
	 dxFVV60yBOitDzceINPsGq96Tiy37nHzmEdcaL/jj3vKHswlpfu3aGL7XKmxSbg848AYa
	 ACQ0X5uGodds0IgL1cAvEm1kKLvy6sZO1TkOz+Xly9d7mzMK1xrgnyzS6nDewBSNRgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dNtLjhgObu2PN0FqT/rwaIVMj2e0X946qXdrYNXFUf0=;
	b=BnvnAo4aQZoSQUI756s1jU95VH1CS9yXiRqSKap7Yjn4rYYLnrEIRfoFFU/TTtd/oL4w
	 Va9zj281Ww6Kh9I2Znv+4kFCzDt5WhjNxhOtfS/udLIBJxmrhMDukk+FI2PIwQTiFCoXa
	 pRWWsC+m01GhhcKFPUT1/SohdLhwDogvODbMu9LxqdQI9wRtLTEkJh0ixZ/ZLOqz970Aq
	 4lXPsWVdLlpzuMAtLF2XhA7k/cnwg4A76DfiR2HP+7K7jPFknAoXs3Z5w8ExfuMM6+VJl
	 Exaoad+qLT1m1fRNZm5W/p0mzJt3RtLWcqFLiUeze6JYo2zz5vwvbiq2F3qd6h99Cag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=cwMU7Vl7;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E3B606A333
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 11:26:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3E3B606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=cwMU7Vl7
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b33a08df33so5607827b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 03:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1794223577; x=1794828377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dNtLjhgObu2PN0FqT/rwaIVMj2e0X946qXdrYNXFUf0=;
        b=cwMU7Vl7CG/DONRqv+abAClPlkALTsE5+RuvRltjGouPECQC559lKGnWKys5NzDnHm
         YYopORMwb+Wq5+mwBgXwkjBbYw0JLFM1JEXxHJlsQ4f1IDm30h7ABAFt/V6SICRO2Drw
         hXY3nHSFT2sdIPO32zCS05rL8SpsLNrfGwphxtAxIO95YFzsJF0rwO1Y+kecAsi+4xWB
         uhBJ7aLDK5zXgbswpOtEUS/OaPCznqwpy5ejtQ5Wa6ptdKsbkuSnqFzWx6u4tO++uyCQ
         CIWJvnupq89ZkG/k0RL94GjV9/D8pAwwP0Jgo3QC44P3R47kkE5KMXGnXrcHjjNbdaRl
         wuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794223577; x=1794828377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNtLjhgObu2PN0FqT/rwaIVMj2e0X946qXdrYNXFUf0=;
        b=1B+yh2hejAE1fAxact/gnfW9g5tJUdFBoXOMUMIt5EEJFH10VQw7LKWpVRhcnWLiUw
         Dvfj/qoWXuOZ/1gBn4TVS3irM33oaQizFPZyiGbXyd1gONADHNzh8HSoknqwWElU/0Rb
         fhixevX3I4FNyEana0eADCCnjNfLYnpt2/KhtQ3b6RqMci7saJ6KTeA4vUbk6Cf6I3f6
         AR52uvnwN3jyCKXklb73c7BFZgrbfXKfoVKYEDV9NdrZ34jKYrzcsTJ0ywnYQb2XYcyU
         pgog421WNsLCxBb8cjqhfU5Mnt8Gv4Hr86dpLtG1iRYMkHkFeQ/TGqOLhuO2VT3j6HGk
         BoNg==
X-Forwarded-Encrypted: i=1; AL+hErEnUZgPR+ka9rz7F99Ph4YXUt3B8N1jlzMT+ZVpNldGNmNUoJ6yD9s+LdJ9+7PDVF3WtXqe90DAv8ai75PW@vger.kernel.org
X-Gm-Message-State: APuU4Z+MDGYzXg6GwS2i69rQJ8gtaD6dxrZLuvPjv5EKiSznHX+9u1+l
	c8tI4fmUcL1ct8QqqDc1S6s16WDOAHq8NMMDpOTV7wo6n68VRFjPOxgYvtBO0Ikafrs=
X-Gm-Gg: AYBFou1UErPURB6ib1WQ2NiIm23/kVZpBPu9V1+Q5dTqvPpw3KQeuzc3iRB39ZuFzg0
	Ts6PoqIxSsjzocYdE9IOCEsPTfIkEygINYmt/tza8PjmCjYBTJ6mtg5bDv+3cMUqz1v1yd0Z009
	I7YefOn/nmF+4rQk4AIF9VCY9PSDqRmfBslMfBadHIJPIOD+eI4VA5DByWbUAZo+HzqTmPHJnsl
	GQ0HZ4htsnfT+w/9TjKyvLo1936wi4fNXF7udj8TMv6zu2PzmliPm7oq/HaLc2cYrvn6C4/zGHo
	/0G7ZKxJA+eQjSfO7sJwQZqJ+YmppG1cegFjT0AEpb0Tg0D0Ajx7sZjEGL5LyL1gnJJpZhlMAyx
	yWqXxngxlK0KBDD2b5L1XjOO6za+sX/CEEnntMk726SMKuuQaUXPlHUGLALpBhhtai5kSXXpHPs
	jnI4oJpK0K1ck/gnWdOIGooRad2XsHyGjE6DZPbIU9Fkh4fn1iE/XGBvasXU3xmNnfsWOgAE1oi
	5yoeOMq2GZEU8Sbp+DRlz4SJN0ijJ9UK5XuN5GJJQN5pABeorchr61/GbFAqXUCMfWA9MgzB/uM
	Gdhydd8XDx7RlI5glfK2D09jmrSAW7YMzbCu6EHXKn7niTL90TrZLX5ZJgBQLILg4aI=
X-Received: by 2002:a05:690c:6892:b0:8ae:b617:712d with SMTP id 00721157ae682-8b36c9e2fbcmr22297877b3.13.1794223577562;
        Mon, 09 Nov 2026 03:26:17 -0800 (PST)
Received: from localhost.localdomain ([2a09:bac5:dd4:1c96::2d9:5d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36bbffb49sm32385477b3.28.2026.11.09.03.26.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 03:26:17 -0800 (PST)
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
Subject: [PATCH v2 0/4] media: qcom: camss: contiguous buffers, RDI and CSID1 streaming fixes
Date: Mon,  9 Nov 2026 08:26:07 -0300
Message-Id: <20261109112611.94010-1-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

These fixes came out of bringing up the CAMSS on MSM8226 (Moto G 2013,
"falcon", MT9M114 front and AR0543 rear cameras on RDI). The MSM8226 has
an IOMMU in front of the CAMSS, but it is not described in the upstream
DT yet, so the CAMSS runs without one there today. The MSM8226 support
itself will be sent separately; the problems fixed here are generic.

1. Loic's patch: the write masters take one base address per plane, so
   switch the queue to vb2_dma_contig for every SoC instead of reading
   the first entry of a vb2_dma_sg scatterlist. Without an IOMMU the
   frame was written over unrelated memory (on a 1280x960 RAW10 capture
   only the first 656 lines landed in the buffer and the device rebooted
   within a few frames).

2. In frame based (RDI) mode the VFE 4.1 write master buffer size is
   never programmed. Program WR_BUFFER_CFG as the downstream driver does.

3. video_stop_streaming() bails out on -ENOIOCTLCMD from a subdev
   without .s_stream() (e.g. the MT9M114 pixel array), leaving the
   pipeline started and the buffers with the driver: vb2 WARNs and the
   next STREAMON / "media-ctl -r" fail with -EBUSY.

4. csid_set_power() powers up the VFE of the same index as the CSID,
   and fails with -EINVAL when there is none. On MSM8916/MSM8226 (two
   CSIDs, one VFE behind the ISPIF) streaming from CSID1 fails with
   "Failed to power up pipeline: -22". Skip the VFE power up there.

Build tested (W=1, LLVM, ARM) on next-20261105, each patch on its own.

Runtime tested on the MSM8226 with the same four patches applied to a
6.16 based kernel, not yet on linux-next: both sensors capture, and
STREAMOFF/STREAMON and "media-ctl -r" work repeatedly. Known remaining
issue: on the front MT9M114 (UYVY) the first frame after STREAMON can
still run 128 bytes (one burst) past sizeimage; later frames are exact.
Patch 2 does not cover that case yet.

Changes in v2:
- Patch 1 replaced by Loic's "media: qcom: camss: Use contiguous DMA
  buffers" (vb2_dma_contig unconditionally, no contiguity check), with
  his Signed-off-by moved above the "---" and Bryan's Reviewed-by.
  If it is picked up separately, patches 2-4 apply on top of it.
- Reworded the IOMMU statements: MSM8226 has an IOMMU, upstream does
  not describe it (Konrad).
- Patch 3: added Fixes: tag and Bryan's Reviewed-by.
- Rebased on next-20261105.

v1: https://lore.kernel.org/all/20261104202313.72494-1-allan@fatecpompeia.edu.br/

Allan Siriani (3):
  media: qcom: camss: vfe-4-1: program the RDI write master buffer size
  media: qcom: camss: always stop the pipeline in stop_streaming
  media: qcom: camss: do not fail CSID power up without a matching VFE

Loic Poulain (1):
  media: qcom: camss: Use contiguous DMA buffers

 drivers/media/platform/qcom/camss/Kconfig     |  2 +-
 .../media/platform/qcom/camss/camss-vfe-4-1.c | 34 ++++++++++++++++---
 .../media/platform/qcom/camss/camss-vfe-4-7.c |  3 +-
 .../media/platform/qcom/camss/camss-vfe-4-8.c |  3 +-
 .../platform/qcom/camss/camss-vfe-gen1.c      |  5 +--
 .../platform/qcom/camss/camss-vfe-gen1.h      |  3 +-
 .../media/platform/qcom/camss/camss-video.c   | 28 +++++++--------
 drivers/media/platform/qcom/camss/camss.c     | 17 +++++-----
 8 files changed, 62 insertions(+), 33 deletions(-)


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.43.0

