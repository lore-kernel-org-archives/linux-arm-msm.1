Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792780757;
	b=bT+cowUt49449q5fV/84FNm7xhCGB9W8UtG+GUBE5me4ih0qpF+WcKeEaroXdhuMzQ9m
	 7SnsCKM5xnMZXk2kcNvcuEcLT3bIZU929VFGg035PNtuYYrjJJbvQXGNIREVOegohTmzu
	 16uRZFPF/QB7stQQ76AiSq74O0ob6vzubt6Mx2jpr2il7OoE5m1XUdXAvUc65QDq0bVon
	 RLsaoVcHvbxu1YIEe4RYagd2fDrhOfG7RpFa9hTgBMLHtUkbGHBM9JfnDsPNsgd0/eH1Q
	 eHQNihCSHjlASZx7Omu0nPnT2jVoEzERh4uovJzjW776qY2JIrG3jGD5gbYV/3K9xJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792780757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EbTcPP7Zeb31nA00sj2sJMZP0sGFPUV33RO30j2J9fY=;
	b=bvwfsMUQpQGCK/9CB812CyMeOQMffl9zKTmHsBHgMk1Jl1ggnkyyxyHOSDob6Y3nwrH8
	 N5MMR2nklhc1fqCy6T99ZrDKKTowEgPfQsQZPFe1wyY3HOKnuGSIdmLE1HtffiYIBoeSJ
	 VTeuq7kntUq+oSViUS9AaDFR6NpxOqxmfHxThT9ziG9/ZHmKUzzHaggZFuhzrh502JQEg
	 cDrcen0Vu8vjs4cfe+3uGxb3wVDzVsuMCeWCrF2He7CqNoV/HHM9l67DO+rCiJQsfuwQH
	 b5jIzXGgOqSBEZpCQhEm20c96b4Ac+wKfX9CLaUkxiWq2W0gpUGMUMCZ8v3+0fY/3dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Ht/eO5DW";
	arc=none smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1A3606A31A
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 18:39:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F1A3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ht/eO5DW
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-917aca1aee5so12701016d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 11:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792780756; x=1793385556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EbTcPP7Zeb31nA00sj2sJMZP0sGFPUV33RO30j2J9fY=;
        b=Ht/eO5DW0qWxMT+f2LwybPDJOHocLWdKRtme+ZKSevOXmBDXiE44RFv/9EhWIq5eiA
         tWtiA0P4cluD7mjXRXmRSQNNy8HHPGj4sxjbZwCIzvAj5Xb0/mv+lOXj2MrMo6MGlCNt
         6BstMUcfvHvN3wbm8fk9wD8FqYgfgD13+OAUe055K36bxtq+ogQsf7TkmyJCCPDUjEu9
         ZWiIySrO6rtpNWiWR0YGDZjJnUXqfS85uIINFgBmtrZ18w0wUKTQExW8dLSxQU0AZ380
         GuJtHyFHEnz4VDX9rIKpgEgwfvdQzaKinBDSWabzlvgFDhHdL0QXL6WxPI8TQBlwwcbS
         /SCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792780756; x=1793385556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EbTcPP7Zeb31nA00sj2sJMZP0sGFPUV33RO30j2J9fY=;
        b=oL/kcG+Pz83oahW0I3S4wA1AbqGXkzSiSEDQGxJQT+lTbXGgOrk1U5ypvf2An+CWg8
         k9Y2YE7NE21heOnF9C2Z4JpwxJ2c3drsqQqBTyfjWv/Idx+CDRkKblqBQNqtdycgHIZm
         dzz6MnBv0dGbHXCwqzbaM/RLUCxf+RxCk3cqmF8WdtsNv7QnfPFP+nQ7yri2LyyLeugs
         HR4lz+ZpfNUEKeoby25Pcq8Ll5rF4c4Sl6UgvT1+6jRg2hGVYKVh+gFwcQRb/Erl1QMF
         TQGAJ2kHG0hTibhfhF00HSEiTQ7h0J+HouXTxfN+l+t9CeYJjmOfqtvoAm4l+43ih2j7
         24qA==
X-Forwarded-Encrypted: i=1; AKwUvBwTckGi7I5bIqSW3NjOLhfll6dV3e6KRg8gS7qE6mRSIPowjOHY8Nn/6CAU+0GzRQkeL6PzXcL0VBd/LdwG@vger.kernel.org
X-Gm-Message-State: AFq9FYIJwvpQlDo5NkgFlX6tER8XyV4RQMXp8YUjcA5CAEOPutv7iwy5
	Xmre5P6h/2iN7GmLzf4QVHO//QQfwZjOtGHfmGivz6szzhnmjfLDA9dZ
X-Gm-Gg: AYBFou3jtEqyMfpkMDNT9TleaUMSXYfabKatriGFp8lJdPHUwjDiSHzH3GlCW9FDxZH
	jRnJjSz9i+YcdfB16Qk2mcIcUgz8vKCCKjYNbNvG/t0Bn6IT6MDYuA/SzrwFBkfvaTkLLo9R0ck
	3WGv+c0WtcjK3bqUPUFc7WUL+9/yC16SkhL5xzGye5FCCufn4doCvkVeWioa9QvxKGF7rnPxYZx
	x2dE/au8xn2f+gOI+N+BroweEh3cqdB2livzFgMH9IqltePRkKx9lV46xH/187xxaX2f6ofk7D1
	FZe6Sb0FXLVU6KRuFhhmoUao5yDcu9kpW1/ASY37TD3Eu4MUdL7tCcTDvoVRQx6pbXm8e1fi1KF
	PFI//c6NZ7cx8EYD8Wu8GKg/2lhbyBSmCWD95MoqgFDeg/SXNSNZc3T9/DpneidCHsMXGtN1nrO
	GwEnQ5YDyK6QMEnvkIFH1e5xQ/YaDmoD7ss2QyDb8ZIPnivScND5G394F3jINjSgyVX7/zXk78D
	KD4sG8lMunvVhq4z/+vwSahTQMbpxLegzFd6eOUE/M3dd9OzpMd53tvELzE3Dg+ZktuRJf4aPCm
	P0mqeIl3DoyEaCrbqoP/N88jr61PjPCm
X-Received: by 2002:a05:6214:d65:b0:91b:5d3a:f127 with SMTP id 6a1803df08f44-91c3aa06456mr43947506d6.50.1792780756045;
        Fri, 23 Oct 2026 11:39:16 -0700 (PDT)
Received: from localhost (h159-112-31-107.euclwi.broadband.dynamic.tds.net. [159.112.31.107])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47cd9dcesm1497096d6.42.2026.10.23.11.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 11:39:15 -0700 (PDT)
From: Christian Cortner <ccortner@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>
Subject: [RFC] drm/msm/dpu: glymur (DPU 12.2) second DSC block at +0x84000?
Date: Fri, 23 Oct 2026 13:39:14 -0500
Message-ID: <20261023183914.6984-1-ccortner@gmail.com>
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

Hello,

This is a question about DPU 12.2 (glymur / Snapdragon X2E) rather than a
patch. Short version: on the internal eDP panel, DSC over the DP interface
gets as far as the sink accepting the stream and displaying nothing, and the
vendor's shipping Windows driver suggests the DPU has a DSC register block
that dpu1 does not model. I would like to know whether that block exists,
and if so how it is clocked.

Platform -------- ASUS Zenbook A16 UX3607OA, glymur / X2E, DPU 12.2
(catalog/dpu_12_2_glymur.h). Panel: samsung,atna33xc20, 2880x1800, 10 bpc,
120 Hz, eDP. Link: 4 lanes, HBR3 (810000). DSC 1.2, 2 slices of 1440,
slice_chunk 1440, target 8 bpp. Tree: 7.3-rc based, with a local DP+DSC
implementation (upstream has no DP+DSC path).

What is verified, so it is not the DP layer
-------------------------------------------
  - PPS packed and written to 0x184..0x1fc, byte-identical to what the
  vendor Windows driver writes on the same machine (HB 0x7f1000, per-byte
  ECC parity, 22 PPS words, 7 parity words).
  - COMPRESSION_MODE_CTRL (link block +0x180) written; read-back matches
  the written value, so +0x180 is the right register on this silicon.
  - DTO programmed (count = pclk_per_line; ratios 1/3, 8/30 and 5/12 all
  tried).
  - Data width 480 / 960 / 1440 tried; common mode with and without
  MULTIPLEX.
  - Sink accepts: DPCD 0x160 reads back 0x01 after enable.
  - DPU side reports compression active: 2 DSC blocks, common_mode 0x7,
  bpc 10, bpp 8, CTL_DSC_ACTIVE set.
  - Panel stays dark; the compositor re-prepares DSC 148-264 times per
  boot (12 measured boots, median 169).

What the vendor driver does --------------------------- Target:
qcdxkm8480.sys, PE ARM64, sha256
cc4c7ff9d09bb3aabb46e24937a66a6d927f28d0189e7517d5f53afa9e98afe7 - the
display KMD shipped for this exact machine. Decompiled with Ghidra.

  Its DSC page writes (FUN_1401ce660, called from FUN_1401c2508):

      0x000  read-modify-write, mask 0xffffffc0, 6 bits  -> COMMON_MODE
      0x004  one enable bit                              -> ENC
      0x008  value selected BY LINK RATE                 -> PICTURE
             RBR 162000 -> 0x300, HBR 270000 -> 0x301,
             HBR2 540000 -> 0x202, HBR3 810000 -> 0x103
      0x00C  written                                     -> SLICE
      0x044, 0x074, 0x084                             -> RC thresh / QP

  That is the v1 map in dpu_hw_dsc.c (COMMON_MODE 0x00, ENC 0x04, PICTURE
  0x08, SLICE 0x0C, RC_BUF_THRESH 0x3C.., RANGE_MIN_QP 0x74). The vendor
  driver writes nothing at 0x30/0x34/0x38, which are DSC_MAIN_CONF /
  DSC_PICTURE_SIZE / DSC_SLICE_SIZE in the v1.2 map.

What we measured on our side ----------------------------
  - Our encoder binds dpu_hw_dsc_init_1_2 with the sm8750 sub-block
  layout: enc 0x100 / 0x200, ctl 0xF00 / 0xF80, CMN_MAIN_CNF at 0x000. At
  runtime both DSC blocks sit on MDP+0x80000 with enc sub-blocks 0x100 and
  0x200.
  - Writing 0x004 / 0x008 on that page and reading them back returns
  0x00000000: those offsets are holes on the page we program, so the
  registers the vendor driver writes are not on our DSC page.
  - MDP+0x84000 and +0x85000 are inside the mapped DPU window (mdp:
  0xae01000, size 0x93000) but no catalog entry, for any SoC in the tree,
  describes a block there; the DT declares only "mdp" and "vbif".
  - A read at MDP+0x84000 hangs the machine - no panic, no log, just a bus
  stall - which is the usual symptom of touching a block whose clock/power
  domain is off.
  - Neither our dispcc nor the vendor's dispcc-glymur has a DSC-specific
  clock, so gating would have to go through DISP_CC_MDSS_CORE_GDSC or an
  MDP power domain.

Questions ---------
  1. Does DPU 12.2 in glymur have a second DSC encoder (or a v1-style DSC
  register block) at MDP+0x84000 / +0x85000 that the "dce" blocks do not
  describe?
  2. If yes, what enables it (clock, GDSC, power domain) and what is its
  register layout?
  3. If no, is the v1.2 "dce" block the engine that actually feeds
  INTF_DP, and is there a documented block-to-pingpong pairing for DP that
  we are missing?

I can supply register dumps, the decompiled snippets above, or any logs, and
I am happy to test a patch that models the block if someone can tell me what
it is.

Thanks,
Christian
