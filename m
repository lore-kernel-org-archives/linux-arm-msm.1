Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793159018;
	b=BjUueZ3ojjCyaq67oOvb4/vxrteZeMwYTxVw2GootdRii/ID7l2fZ9M7zdQA6phyAdrp
	 +gocuHExzGOXGCgMFRmwdbkX3RRtab1XX9d4X9nTjouLKMJjOwXLul7gztA55dLC1b+9B
	 Y2DEA48wZjlBJgGr/PU73gDY/VK+gjUVDxiqAn8UXsLDjHio/FMhUgaoEVH7R4UR9MRq+
	 1WZ9H48i6ucMurgsHkyVKNGGFVH3Hi8jD31UmpG/t44VagJ3XB8dUwhC3l4xx1RZvwwZk
	 GBWs30G4z5/W/KZ88jSr/EVzuK0eOzNBuu7O1S5/nrthUGT6pRtlDA6NYHotT8sgcjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793159018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mPIPaScXxM7/HZ6U1XsdkuXcXnpJuRB9yur3ZHgAH5A=;
	b=sHt+Snst3e5OcgaXLc97Q1ksM9Xy2myGSBNmFxdLGCjsr+LQqPqZ4s/WdDf/foGZYkdN
	 Cw863gdz8aAmVinBNISsyKR8AZvhKmMw4mkum3rLQXDpAsxuHyWBwpn84vackQPOLYT3D
	 6g/g1tuxVQwiqjy4nMUTqT6xtScE2XSCiUm+DMLyIH3xLMhGdYNnfO0zxNw3JJhJnz1Ly
	 bhIDlPsbzsHteKac4FodlNJidPoYBGYYCxoRsGduUR/Nuti/TZgxIZKYoIT+vhU+DEc2B
	 8yDyNT+bbuLrJqPYFtBiKzbqOsWSBXOv4pgLFMh9isCGSqqYD8+tWiQf7uX0iL8hj/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vuBEyJqj;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F7C606A31D
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 03:43:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8F7C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vuBEyJqj
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5365b48238dso5911341cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 20:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793159017; x=1793763817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mPIPaScXxM7/HZ6U1XsdkuXcXnpJuRB9yur3ZHgAH5A=;
        b=vuBEyJqjy2Y/qkxHE8f7LSkZYKjbb6jNCDeiCQvtCAw4aKQG9fR7Rhyo+QcfqmEZPl
         WLNqT0knDQcvbEBDxwUN9pa/JBur5HvrlMLwC8HGkb2ZjAoflrPpxhKxmYK5EbsyA5Zi
         a3dDLjI7A7nupnVBucwgtjsyJu3NvvWJPSwdzw4zf0YEasgAL2Ky4rA6KY0Sl4mcQBVb
         /V/X/Xgrw7OHddSkJAA36v5HAbzX8T0jQnGRBEj0TjsFMJseRKxLgIV39qS+4zsMn6fU
         GVb8+9PcmUBRTgOJyJh5WiaTGEsPx0LNpt8SEMq//Xe2r9biTq8vR4+6qwo6oH2GYcmU
         nxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793159017; x=1793763817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mPIPaScXxM7/HZ6U1XsdkuXcXnpJuRB9yur3ZHgAH5A=;
        b=OwjBwMxikzg3TfbVKf0hTXW633mZ4UJ9VHxWQmsrCYz/AgBaHaf82cvljfIw0Vp8tM
         HDwZvS2U/hIznGvx0xU8CoaH9Y5oxRczyfkLWaX4TkL+2OBoxYPk4ACt6Fm73pnJNbx0
         Atz+icg3z0yxp8ZLYLWNUUIewBZNTMfgCYggO9Xhe3WLgWFqKZpMKzOlIomPsmqKcsIm
         qy1oQh9aKgzWjyvo5ecN13/yiiY3hiB8fZtjHvfvjcYKJ2ScMLGQAmmrEmsIxDKPuTtI
         sanPdAWjxmt7STNLAiuNv/sVibLRQRzlxQhV5tgZ4K0S3FktpyufoL/1cq01yzHR6qLX
         uonQ==
X-Forwarded-Encrypted: i=1; AKwUvByLQbpE1d6HAJ7XDc4SCjiqfHrqVDUVvpNEO4bk1we2jTGItgsUY+cJukChRLcs+hps/EHa+MmkhMz1M6Pt@vger.kernel.org
X-Gm-Message-State: AFq9FYKrNKqjfTVV3isZlN2WqG8gq8mGRfpYTrAx/W6zAiLSpRNthbw7
	u+aisJvAOYowwI7wV2AX5+VxKOLHdp8nxrEgVCvToJCyc4AxU56pmSDr
X-Gm-Gg: AYBFou2BTxvdD0Gp0p13wgdnZ4KKzJEINc4V6x5c45NIo52bpSX2fjo5JpLF9Qr5riK
	E70ARRImbyd6ps3YhEoAyJgrNHp0pOW8hUK8QIQnwGyqlhyQFT8L94y6JgYE+h9v/XTcbRCBU0x
	y9kFOyHP9PUTEJsfZHNVjF0ax5zBi+1Epj97v+PNdpG3hh8VzgTm5r4ht+tu9wjqy9y2DygaF0o
	o+fn1WwQbtkGc0fZtu92vHogCDLG3oImuT7zFaR6SGVkhEneGVfYoQPKIJWtJEwG86U4M4OSQKL
	xIJXTyzFJv5IHmxkyPKUHMmnR4bXwfOk4buN5kUpAq6gftbKrcsR1kHlUbDgv6Us05C94idIMIs
	0MkTrEeUuOepM7Mo28G6t0YLHYiMt0V9KLfPZig6dYp9mgdXvwqbc9zgEeu4JbbgCFPNWZx0qv1
	tBqnDgpssHrnVkpG0I7rOMnKa3dRRpVGmNbnE0y4qUQ51Me5zQswWyZLMW9ZFpjcixoinrZAOxG
	aoRPTTpmQUPYAZupEiq2giGzlJzlbJx6+EQzLLcf6SLlTLgg5JcEWWfOcY2O85ZsSFVa6JNCFy6
	v72yBOzKdOdDxDDc5SmjKwi2orMM94+B1uhkICHZnqPsKBBtBBKkY1wOrHItmJBC68MPiKY6oZe
	MT7HgYg==
X-Received: by 2002:ac8:5d8b:0:b0:536:64a3:aaca with SMTP id d75a77b69052e-53fcc6caf38mr21641081cf.62.1793159016752;
        Tue, 27 Oct 2026 20:43:36 -0700 (PDT)
Received: from localhost (h159-112-31-107.euclwi.broadband.dynamic.tds.net. [159.112.31.107])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53bec3a256dsm70148171cf.22.2026.10.27.20.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 20:43:36 -0700 (PDT)
From: Christian Cortner <ccortner@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Birk Skyum <birk.skyum@pm.me>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH v2 0/4] media: iris: decoder fixes for resolution changes
Date: Tue, 27 Oct 2026 22:43:31 -0500
Message-ID: <20261028034335.26075-1-ccortner@gmail.com>
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
Content-Transfer-Encoding: 8bit

Four fixes for iris decoder problems at resolution changes, reworked
after Bryan's review of v1 [1]. There is no Signed-off-by from me,
since I'm not a kernel developer and can't vouch for the code; please
take over whatever is useful. An AI assistant wrote the code and the
logs (Assisted-by in each patch). I'm happy to test.

Tested on glymur (Zenbook A16, laptops tree 65f4ae73 with these four
and the iris patches listed in [2]): v4l2-compliance passes, and
GStreamer and a spec-following client decode bit-exact across
resolution changes. ffmpeg's h264_v4l2m2m still stops at the first
source change when it sets up CAPTURE early (problem 1 in [2]).
Build-tested on media-committers next with W=1, sparse and smatch.

Changes in v2:
- 1/4: shorter log, with the traced firmware flags (Bryan)
- 2/4: shorter log (Bryan)
- 3/4: one helper for the EOS check (Bryan)
- 4/4: comment states the 500 ms limit, no domain check, warn on
  timeout (Bryan)
- v1 5/5 dropped: too much for stable, and broken (Bryan)

[1] https://lore.kernel.org/linux-media/20261027021934.22113-1-ccortner@gmail.com/
[2] https://lore.kernel.org/linux-media/20261026160952.22082-1-ccortner@gmail.com/

Christian Cortner (4):
  media: iris: Don't flag an empty source change LAST buffer as an error
  media: iris: Update the CAPTURE stride and size on S_FMT(OUTPUT)
  media: iris: Signal V4L2_EVENT_EOS only at the end of a drain
  media: iris: Let a resolution change drain before stopping CAPTURE

 .../media/platform/qcom/iris/iris_buffer.c    | 26 +++++---
 .../media/platform/qcom/iris/iris_buffer.h    |  1 +
 .../qcom/iris/iris_hfi_gen2_response.c        |  7 ++-
 .../media/platform/qcom/iris/iris_instance.h  |  3 +
 drivers/media/platform/qcom/iris/iris_state.c |  8 ++-
 drivers/media/platform/qcom/iris/iris_vb2.c   | 26 ++++++--
 drivers/media/platform/qcom/iris/iris_vdec.c  | 61 ++++++++++---------
 drivers/media/platform/qcom/iris/iris_vidc.c  |  1 +
 8 files changed, 91 insertions(+), 42 deletions(-)


base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
-- 
2.56.0

