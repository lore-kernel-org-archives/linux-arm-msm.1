Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234081;
	b=X6zXCjNo7LgyPsebueQ7gV5UBGxnY08Iz/11YJgQTGSiVXirXYQUSNvODoowVcSZFVuN
	 2ZDyLCt5LXWJrpaWIMLZqcOaIpWDNWxH/lPfjphjVVTqtAV41EhCUeh+PJ/rU9c4TU8uI
	 firLcw6OQRK54PhDoijxzVCF1HqbCUGaT341DQ89ipqWH9F97YFGhYqiryeK+wBRV8uIp
	 1L+GRpab+EiU4H8PDYeMOzMmqlv29orfTqazZXD8ON/V/imd60ukI5F/RrK03st9wen5m
	 O9d8prF1QMkop7LidI7y7I/1oMcpGxk3PcIxp92JMrOZ6EA2Q81EzgbPILrjfsOZvLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234081;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GFz+vbFNjp98yDL7aPn7CvXpdfBv6TkNC36/BTBNT/4=;
	b=gAz7TovCN3VyzE5KTZAJmQTaBHsGTiUA4ylxmFR5L/cjfeiaotacHloWz2RjodzEXVyo
	 ugjRzDbHl+gYEFOMLCc2S+eGmaXIsAVwdyuudM02QjioS0SLp+7wQhLgR0RpvnSfuK8h1
	 NW4Vjq5JqDZkqceEzNK4Nl/GHcjz4C1ND0CIxvi3WtA5+cXn8xWbu6snioozWcNBKTEo4
	 MtIAaHPV2Pq9SUP7Dtjgi+YtQnRki5qKLKiryf29X8YgKZFHqEBwGVTN2aRV5623QoJtI
	 yHWzCr3PprEoz8dDzb84i9iK7i60tnt3R/t7i8ki1cYDAbCgzXL7e8PViPe3ahWPtoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mJlb9g6l;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PrNuk8CD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0378606A31C
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 14:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0378606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mJlb9g6l;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PrNuk8CD
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFAp51323420
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 14:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=GFz+vbFNjp98yDL7aPn7CvXpdfBv6TkNC36
	/BTBNT/4=; b=mJlb9g6l06guGTQ3Yvl/qryLcSUrNANRKHw4Lhngf2KjFbmEzFK
	AgC2dR2yyEMpearddtaMNALGle97Scw1/dyf4AfwFUG53CIKMJUSWZh5gkzvjKDd
	h6UzSvqxtVreCpDhh5o/BSj8nVDlvc9Dg/R9CQtoa/Jbnu5aQzf5gCeHvg+LTdFU
	Id3UZtMIBKUgODjSBlPKkH/nPWcObihmzx0W9H85q/iA98lTMyMV2OhLAuyxmzoa
	r/ZHYXzSAWKEQH2EAkme0EYT4/oekpucJJjnaF+31Wj4Rt09D8TSXGMJ2Ih+YaAP
	bWUf9jVpxgxhYAerhfbx0O/Unn724sRK3WQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hue0qrdpv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 14:21:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so792854a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 06:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794234079; x=1794838879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GFz+vbFNjp98yDL7aPn7CvXpdfBv6TkNC36/BTBNT/4=;
        b=PrNuk8CD/dvhiuLMY4f02Kh3F61AodNPpWDAqdBqGzLgltbHOeT3RZGnT0F1wKZsC4
         I6KxvVxhId97bmxIfNk3vK2GoRx9Pkqc0wkd2I+UIyJ5YCh8KrSNWurccubzOabHnRpd
         +rEF89ICXcvtM/2PF8b+19KWCE7t+TD6ogcnZKDNRwP9zeo4gsc4MKnjjxq/lh73pDKE
         FTKAJi3ZDZUq0iSqfm3gO8aqsnumqL1YjkDvCStoc8oukcSAAm82966qOU+s/ovu4r5H
         WrMBWcOeuFYaPvl856W95vcRRPz5HzDb3d6nIe2PvmF+Oho1MrwUi39MBl7XzmVuxtNo
         8P2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234079; x=1794838879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GFz+vbFNjp98yDL7aPn7CvXpdfBv6TkNC36/BTBNT/4=;
        b=px/LJuUbHJBA+zw4djDd6XmgOCFmu5uTYTO8I60y7+dNl37qK5aiWUNDhsIh+zy07a
         Cw0xGNfNJy61O+vfPwddvTtIXcDDENDkQum9WxK7ptWypCn84ojQ59GYccpHp4/K3Y5l
         A0exENgL7XL8hM7kTXSlMfjBus9wZrzqBP3k0XX4d9fIxJ99GMMK1zHVqd/4ksS+p3tX
         P14E5QmtgchKdPLs+kZvz42YHeR28Yv0IqHKxj/hZoa/S0z5oulO7o4h7DWNzaMhgXVd
         IIDmBBaM5CqrK8i5WIyWZ/KywFMnDRP3qwR8jd/O8a7Uv8IVxuqGZGwESqYHdYUGpHQN
         qSJQ==
X-Gm-Message-State: APuU4Z9+mV3RWb5x4YURSwDhqKsZ4DPnjbpPUZtKIqc1gjbRUnBrwEC0
	9X+XW+tFBi+XCPYDTle7D9NFJckX6fNCC5GXyOqePZw5l8/+ZeBi5XWw4AI4k3TB7tXUpKCyZyH
	RjTZ06kb7NUkFTFdieIWP/4n2479yysOS4Kwbx0/Y1hMxkwJ06af99go6sGNx32UzaGOw
X-Gm-Gg: AYBFou0OMqdB+4KGdtaPQx4D6NUbcxcEcw8UgVlguvK1/dLx5Nw9gtYMzoZlLSMOy8c
	HWNh9s5ObA+SlFrVd83/ocJRQV8oquZMhS7gfEU7mQBd3knAcICe0rCTZ6ycgeq4n362rtdkt2A
	EzLryc/E72VbAfHKeVo7ecYtscfA6nlfCglkEU46g1hT+LCvoNcTO8uXE3ZkCW0pFqiM3ZWASbB
	HwoDqh1TJIYBtt3bi6h+VjAxoD10tJFbmQkfSKucCXqo3L7OnvUJ9MsMUP8GX8zvh9CIKOdoNmA
	6LF2qrycs8tMOIpAa+7+/leD36arYS6GF9Pnzl52KJHDiayGx1ozC2aySUu/GdoVQtiATuDApjy
	jnU9s7xYsVXRlAsdil6klypTTDbwTaYlbUI2N2ky00iEjyCRCfPHQwOUZ5NMWDmyCG99VGhEAUl
	5Ts5t10ktujNjlhYXvPYBHRTPs24AXtqwXBAL6OIvaP+HsX5l3cyJ1IpgL25Hu2A==
X-Received: by 2002:a17:90b:4acf:b0:3ac:b3c7:de04 with SMTP id 98e67ed59e1d1-3b12d590f5bmr3148874a91.34.1794234078870;
        Mon, 09 Nov 2026 06:21:18 -0800 (PST)
X-Received: by 2002:a17:90b:4acf:b0:3ac:b3c7:de04 with SMTP id 98e67ed59e1d1-3b12d590f5bmr3148830a91.34.1794234078169;
        Mon, 09 Nov 2026 06:21:18 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b127891fa4sm7142836a91.4.2026.11.09.06.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:21:17 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v8 00/15] drm/msm/a8xx: GPU state capture support
Date: Mon,  9 Nov 2026 06:19:46 -0800
Message-ID: <20261109142111.256630-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX6dDenEgcGDEM
 hcn1tGIstS4LPPMtiKmmv8lyF+dczC3HI26qR031MUI9cney1aUL/VI176SWSUI9G3YP8fjiATh
 q+yE/OpRygzR/9+apkxm9gbXdcFewgebRnusHVd8cWiLs6aAycLHC0GDYs1QQbaQZEWKM5f7QF9
 9Ngpn3mgwzau4KyaUlRtrmzLAvQZHNZcShFS9B2+LUIQ6x1StKSAieDEzIOxwLAAntsswlRGTPn
 jbqGx1kV07byITU7BYkxRf8E3R2cWNWFAn+xtS7IKTtr5AeXbY5aIs6wEGnviC6yOZQe+4dmdwl
 tHxURtdDxnjaC/8m1IQi2bx7EC5Q4ltEaARFxfSlRnt4DEhbOUswxOHbdxqGFTaY+SqKRJrweYO
 cIAgSQsAev87oFd2KLRUyM4aa+vTcCSRCLb4Edflq8bfaNRT+1aoXHElGEEf4Gkt+QVGBNSUc0O
 BQsi4YJPXvvi8+KGAnA==
X-Authority-Analysis: v=2.4 cv=DZuCOftW c=1 sm=1 tr=0 ts=6af1d6df cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CMqLmQoervsXYc5HfjoA:9
 a=iS9zxrgQBfv6-_F4QbHw:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 0P8cpu2X9mGLXAABBQidzoDNSPh2OzPu
X-Proofpoint-ORIG-GUID: 0P8cpu2X9mGLXAABBQidzoDNSPh2OzPu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX2NGXqI63/S+G
 GJd7WXNbSjgNQaExRGrRFvX8pfvrkTa36+XbEELEXvMl0jDoAz0UFo2vzCLKpJA3KazTNX+ycXt
 vUU9ryK6BzHlmNHYFor7tbjWy/+QeeQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090057

This series introduces gen8 devcoredump support.  Compared to previous
gens, it:

1. Switches to generated tables.  Compared to hand modifying headers from
   kgsl (which were originally generated, then adjusted a bit by hand before
   adding to kgsl tree.  And then copied to drm/msm and lightly modified
   some more in the process).

   In the process, we also switch to generated cp_protect tables.

2. Aligns to the "snapshot" format that kgsl/etc use for hw state capture.
   The non-generation specific bits (SMMU fault info, capturing relevant
   BOs, etc) still works as before.  Everything gen8 specific gets encoded
   as "snapshot" sections, ascii85 encoded in the resulting devcoredump
   file (similar to captured BOs).

3. Try to make it easier to at least compare kgsl snapshot code with
   upstream, for porting fixes/etc.  State capture is tedious and mind-
   numbing, and the last thing you want to do when debugging a GPU hang
   is going down the rabbit hole of having to first debug gpu state
   capture.

   However, I don't love kgsl_snapshot_add_section().  It does avoid
   duplicating snapshot header stuff everywhere.  But the ergonomics
   are not great.  So instead I went with "align with what I wish kgsl
   looked like..

The mesa/crashdec side of this is at:

   https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/45304

I'd appreciate tested-by's on Hawi, Maili, Milos, and Pakala, since I
don't have these devices at-hand to test myself.  To test devcoredump,
you can use the msm_recovery test in igt.. or just:

  cat /sys/kernel/debug/dri/*/gpu > /dev/null

NOTE: I'm still tracking down some descrepancies compared to kgsl.  I
      think at least we should be matching on the excluded access-
      protected regs, so hopefully collecting a devcoredump doesn't
      make things go boom.  Tested on glymur (windows fw) and on
      kaanapali MTP (android fw).

NOTE: Uses $codename for generated file/table names, rather than continue
      to perpetuate the equally meaningless gen8_x_y naming from kgsl into 
      upstream.  At least the codenames are familiar upstream and this
      removes an extra level of name translation.

v8:
- Also fix PING_BLK_SEL size in cx_dbgc path
- Also make cx_dbgc capture conditional on modparam
- Link to v7: https://lore.kernel.org/all/20261106232220.47602-1-robin.clark@oss.qualcomm.com/

v7:
- Fix PING_BLK_SEL size.. this bitfield got larger on gen8 to accommodate
  a larger # of debugbus blocks
- Make debugbus snapshot conditional on modparam, as with earlier gens
- Clear aperture at end of state snapshot, for good measure
- Add missing bitfield.h #include
- Link to v6: https://lore.kernel.org/all/20261105203057.66520-1-robin.clark@oss.qualcomm.com/

v6:
- Fix gx_is_on() check
- Only capture preemption records if preemption is enabled
- Link to v5: https://lore.kernel.org/all/20261102220405.30730-1-robin.clark@oss.qualcomm.com/

v5:
- Fix inverted IS_ERR_OR_NULL() check
- Drop IFPC fixes (moved to their own series)
- Link to v4: https://lore.kernel.org/all/20261030211928.45761-1-robin.clark@oss.qualcomm.com/

v4:
- Drop RB_GC_GMEM_PROTECT from nonctx list, now that we are computing
  the value directly
- Add missing 'break' in switch
- Move RBBM_MISC_STATUS read to after we check GX is on
- Rename sysprof_setup
- Add cleanup.h support for disabling IFPC, and use it in debugfs
  snapshot path
- Collect tags
- Link to v3: https://lore.kernel.org/all/20261029201730.151754-1-robin.clark@oss.qualcomm.com/

v3:
- Drop generated nonctx list for now
- Exclude access protected registers
- Shuffle around some debugbus blocks to match kgsl
- Use CP_PROTECT_PIPE regs to pickup the extra spans if we exceed the
  64 CP_PROTECT_GLOBAL regs
- Inhibit IFPC for gpu debugfs dump
- Fix cx_dbgc capture
- Misc other small fixes
- Link to v2: https://lore.kernel.org/all/20261021204244.67160-1-robin.clark@oss.qualcomm.com/

v2:
- Fix incorrect protect list for Kaanapali
- Use __free() for snapshot_sect finalization
- Fix missing early return error path in gen8_snapshot_mempool()
- Fix aperture setting in gen8_legacy_snapshot_mvc()
- Fix first_slice in gen8_snapshot_mempool()
- Remove GBIF regs in generated nonctx list
- Link to v1: https://lore.kernel.org/all/20261020204728.28844-1-robin.clark@oss.qualcomm.com/

Rob Clark (15):
  drm/msm: Import adreno_snapshot.h
  drm/msm/a8xx: Export aperture helpers
  drm/msm/a8xx: Add a8xx_aperture_acquire_raw()
  drm/msm/a8xx: Export slice helper
  drm/msm/a8xx: Add missing a850 ifpc reglist entries
  drm/msm/a8xx: Allow nonctx reglist to include GMU regs
  drm/msm/a8xx: Stop getting GMEM_PROTECT from nonctx list
  drm/msm/adreno: Fix PROTECT span length
  drm/msm/adreno: add temporary __maybe_unused
  drm/msm/a8xx: Import generated headers
  drm/msm/a8xx: devcoredump state capture support
  drm/msm/a8xx: Add all CP_PROTECT_PIPE to pwrup reglist
  drm/msm/a8xx: Use CP_PROTECT_PIPE regs
  drm/msm/a8xx: Switch to generated protect regs
  drm/msm/adreno: Remove temporary __maybe_unused

 drivers/gpu/drm/msm/Makefile                  |    4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |    7 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h         |   14 +-
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c     |  404 +--
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c         |   65 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu_state.c   | 1409 ++++++++++
 .../gpu/drm/msm/adreno/adreno_gen8_snapshot.h |  576 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |    2 +
 drivers/gpu/drm/msm/adreno/adreno_snapshot.h  |  531 ++++
 .../drm/msm/adreno/catalog/adreno_glymur.h    | 2307 ++++++++++++++++
 .../gpu/drm/msm/adreno/catalog/adreno_hawi.h  | 2387 +++++++++++++++++
 .../drm/msm/adreno/catalog/adreno_kaanapali.h | 2317 ++++++++++++++++
 .../gpu/drm/msm/adreno/catalog/adreno_maili.h | 1882 +++++++++++++
 .../gpu/drm/msm/adreno/catalog/adreno_milos.h | 1977 ++++++++++++++
 .../drm/msm/adreno/catalog/adreno_pakala.h    | 2161 +++++++++++++++
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml |   20 +-
 16 files changed, 15739 insertions(+), 324 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/adreno/a8xx_gpu_state.c
 create mode 100644 drivers/gpu/drm/msm/adreno/adreno_gen8_snapshot.h
 create mode 100644 drivers/gpu/drm/msm/adreno/adreno_snapshot.h
 create mode 100644 drivers/gpu/drm/msm/adreno/catalog/adreno_glymur.h
 create mode 100644 drivers/gpu/drm/msm/adreno/catalog/adreno_hawi.h
 create mode 100644 drivers/gpu/drm/msm/adreno/catalog/adreno_kaanapali.h
 create mode 100644 drivers/gpu/drm/msm/adreno/catalog/adreno_maili.h
 create mode 100644 drivers/gpu/drm/msm/adreno/catalog/adreno_milos.h
 create mode 100644 drivers/gpu/drm/msm/adreno/catalog/adreno_pakala.h

-- 
2.56.0

