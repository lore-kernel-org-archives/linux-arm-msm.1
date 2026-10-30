Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395179;
	b=phUkaOGewUTDQO5BPuRQQOs+X3aytGvwQ+RnFRhWJhqbE3IpJY4tmxKAkXI/OnCDMIo/
	 Rq1mg0gaLh0wClvTlJmqKS1EKKr+O9FgdOF8ZYpjy6YUwBqDUYrvq0LjEqyDbSLA17rR0
	 7pH2rinpgKzG5wO7CHpvm7+0yHCJUJ6/SGi+xbm3cG5/Icd0t9DM8GLTkUnPU2t4JxL6n
	 LwhUvJ2aBIc5rNNj8zDUlgUk7Tx02LSARrhqKYLQEF7RKlPF61d4Bd2pfMDa3wzC2c7X8
	 zMO9nISSxWeq2SeCLRTIzisVd8YKvM3qgaEzwLTrUY1Z26ezxo9LirMSq0mfhZyQtYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395179;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3P2WBnm8wuFlt2BEKGAThp63jkomyxPqM2PK9B1Nd/Y=;
	b=KZ/lIsLS25goJowPDTlD4Y5+9UfEgCfK8xt+x+gCihKoaJ05Lx2MLdlq2WqKFs+6MVJJ
	 MD7gNW/yF6WthCLEsSHAN/gRRmdXIaZ/9z/fBNZiZWsHDk7TOfIdjWDXFmHyR16uWXKqt
	 gxr8+T7XCt+Yrw93hv7NJ3ZamYrzjazHQ4vOi12gy6J8UHx6GuwkXzhXbqeTqFU9gy/9S
	 uKWwTemAXCJlr0zXBZrjaLW/Js7ly4cJC7tAepIDgZz1PpdYlGk6GV5YlZL2e/uowpvn8
	 e15Lw81wEDJnrDRxvMiT5BCpuKmuYZ1WphY2xswWvgNY7TTH0DuDW/NW4Qf5S4OJ9ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GjrjMV9q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GXHxBzKL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DC6606A321
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94DC6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GjrjMV9q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GXHxBzKL
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULAnTL4086527
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3P2WBnm8wuFlt2BEKGAThp63jkomyxPqM2P
	K9B1Nd/Y=; b=GjrjMV9qAaecSsP6giBR0QwdcSIOJLVzkWJshpR2xiEV07pFWX8
	BypflwGjx59R2PqoUDZ0HJkTQD+E8vY9kpANBM4aS50lhllZJbSJcfISPkCh+dqT
	G/0/F7wTK6koHeESNTp3tgiXKgBSAq2kuR3U7szte/WPqYlkcmmGCrjRcwvfzbW8
	ngejtRfwYdiQWNLtqZ8xxJSJ2GJ2IKQAyTzkXPN4b0TWfYUhDpVmgEh/ll8x32+i
	YNiNriMoL3sIzjXgo/RNeK8lEelyyyl/yzv2UpO9yFt4OgVBKZhDlsQFIXDHnAdW
	Pv4bGdSf9btyL64P1eJ7l75xNTzQIRaPe5w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x1016g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:19:37 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ae72da2f57so1719251a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 14:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395177; x=1793999977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3P2WBnm8wuFlt2BEKGAThp63jkomyxPqM2PK9B1Nd/Y=;
        b=GXHxBzKLMNjVQIPQ55Dq7m56yiZuYoZ2rYjFitkxFsOx0aq5EsmkdsTjd8ZQYGg0OW
         4zkySUSsxuyTZTAU7D4A2BuluUkJkmb8ZQvKXkXbhwpMfWXAY1nJiRu8BwYgHwXNW4B4
         A8TN0FaySPlEZxtSn5+KudibB1PE73OARwqXBhnlEbL35RbQcsj6MiQ0WvnFKmNyo2GT
         HxaDbI3t3AmVSZakWHyZJ7b4QXd67dl4G+eV9lUUjIgdJweGVYpwL77v4gEycr2bhvQx
         aG933pNftA71xA43zDLj51IwUv6qrmK9APRy3grkNJyPn4ZFucVC0+ZAe76UTsiXG/Bs
         VXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395177; x=1793999977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3P2WBnm8wuFlt2BEKGAThp63jkomyxPqM2PK9B1Nd/Y=;
        b=1vBzejslpBPJMyMuLWV9rkvEjKN1IsJC79HTqqmVSFK1vR+aaoKy90gWGL6unQ+UZt
         byzSQilXX7FnR8sBY3SW41tJ/XEKh2wnxIX+mMM2RAskHObfsA6oDLmDBAkyTyJ/fZqV
         hKTvGuc6Aeyh0K3R29tbDTCeWL6NDfETyO5GY/or+5hOYGigNYUZPuGTtheHztU4OunF
         7HcyDrAkB6UDkmFt70lCTTiOM46XmOxvABKoU0MZ9kVNUBLHjYyhw3QQEhAksPW8Jav4
         kleG5FukvsimxMhyVA7oyDDE0pVoWTropBjMeQtJndDQthBF0nyaay1nKY7vZu+otkSO
         iBrA==
X-Gm-Message-State: AFq9FYKXE1sOytu0Wco1K0TI7gnU9FXOnfAwqi568sxlLoT3YWGZ3pk1
	Mt7uI5upWhyLcW26ubpY8AzHXDd4fB0ljgyZi8JFkj0Oc/5QY/dfWbz9/oz11K4DZMLBvamkBfw
	tIvex4ExMDq6RNFUSK0uLVAuqt9g+9D2hBcEgzHD7WOd8QF35hlOkyrRsCnjigqgJhOUl
X-Gm-Gg: AYBFou1X2u0mGISLSewo5kUcPGYlZKcQBhkm1xJsZCyZq7edAkwogFPU2PQms2FUVW2
	SYBSRHLVqCpI95NBXp3jIZCzcUaUpLKjiAcTEFd1RUaWcVrg0EwJrXrP/uNPBYMBTJSWFXaj5EO
	PP+SoS5CKknY9Epz6DSmCB+/0FASbR/XdHdTOec9FFAgUCkZcuYzikm06PxBw4rZlg2bM0ewSa2
	bC/MhG6k2Mm1NV4l3CnuBgnENCIW0ipufDwzSRfkeb72toZF6DRWvY8UFiDSVsFaHtLll6Dmkda
	cukWgppF132IjmCK73tHxPGTRxsqUy4dhw5q0pKxVQdFJPXpCqqzlgxYsUes8JsFz+iC4YEdtHC
	ptMwcl43+8+pI/CLI1usIU9RQd1aOT73Uq6z7zlZ2trlvapDhI0ReGEkz/ejMHX8klQN+JJ9qMh
	T6dgSI49yMn+Ws8bnSGOqi2so=
X-Received: by 2002:a17:90b:3807:b0:3a8:6a6b:596d with SMTP id 98e67ed59e1d1-3ae897f3745mr2749762a91.26.1793395176511;
        Fri, 30 Oct 2026 14:19:36 -0700 (PDT)
X-Received: by 2002:a17:90b:3807:b0:3a8:6a6b:596d with SMTP id 98e67ed59e1d1-3ae897f3745mr2749739a91.26.1793395176039;
        Fri, 30 Oct 2026 14:19:36 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85d24261sm2661296a91.0.2026.10.30.14.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:19:35 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v4 00/19] drm/msm/a8xx: GPU state capture support
Date: Fri, 30 Oct 2026 14:18:02 -0700
Message-ID: <20261030211928.45761-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: ZNr7MrGB0_KrSFG_FrI8f8yzjsTtUhlw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NCBTYWx0ZWRfX1QIYh+IhZ5Nj
 t/F9gjFe/wvsAKRv5gAky4emNISHLSg+dlfkU0unEZQOU+f264V3tksjKqdEoK9ZfnwXhbkdOSS
 NnAVjoDrpDOm4GHVkZWItQvq0ZlNfZ2MCO6Lw5Wie3OAqLs9RBwfKPZmrWlcJRPlcMzmvO393xT
 tNAhpC/v9qZtRUh8hBlU3tARm2/OeKasSG7eCH5LlGkX42hkefD699j1LDFPaXmRy8a+Idfls+l
 9xDz9mpQb8z4D9xo+nHiiVbp6/G57SY9YQJx/REty8YtkDVUMxOcVrITfoTV2hIrndXtY8guQXK
 Ey7kpJ8VcVVl8RDDYICtqbXpuZV0doXdv68eFZeZZkwJNZeDdWNw2ghqEt8ECxLAugb0RNVXH0U
 2TE14QMjq1t+CSTFkze6wMF6KCbHrg==
X-Authority-Analysis: v=2.4 cv=abD0Dhot c=1 sm=1 tr=0 ts=6ae509e9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3qWqBt1DSER8stsMlmIA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: ZNr7MrGB0_KrSFG_FrI8f8yzjsTtUhlw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NCBTYWx0ZWRfXydkYj4Fotggq
 zJniVl+pjz4yEXc6xYA7qlAchEhov23zCCN5ywDAW1/eEdrrd7SV6v79RYUYEVzBk7M1NuqaQ4i
 fNWNPah8TVqgvtRn50X9WSk6vPkXUW8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610300000 definitions=main-2610300084

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

Rob Clark (19):
  drm/msm: Import adreno_snapshot.h
  drm/msm/a8xx: Export aperture helpers
  drm/msm/a8xx: Add a8xx_aperture_acquire_raw()
  drm/msm/a8xx: Export slice helper
  drm/msm/a8xx: Add missing a850 ifpc reglist entries
  drm/msm/a8xx: Allow nonctx reglist to include GMU regs
  drm/msm/a8xx: Stop getting GMEM_PROTECT from nonctx list
  drm/msm/adreno: Fix PROTECT span length
  drm/msm: Rename sysprof_setup()
  drm/msm: Add cleanup help for disabling IFPC
  drm/msm/debugfs: Use cleanup.h for gpu state dump
  drm/msm: Inhibit IFPC for state snapshot
  drm/msm/adreno: add temporary __maybe_unused
  drm/msm/a8xx: Import generated headers
  drm/msm/a8xx: devcoredump state capture support
  drm/msm/a8xx: Add all CP_PROTECT_PIPE to pwrup reglist
  drm/msm/a8xx: Use CP_PROTECT_PIPE regs
  drm/msm/a8xx: Switch to generated protect regs
  drm/msm/adreno: Remove temporary __maybe_unused

 drivers/gpu/drm/msm/Makefile                  |    4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c         |   17 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |   13 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h         |   16 +-
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c     |  404 +--
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c         |   65 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu_state.c   | 1401 ++++++++++
 .../gpu/drm/msm/adreno/adreno_gen8_snapshot.h |  576 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |    2 +
 drivers/gpu/drm/msm/adreno/adreno_snapshot.h  |  530 ++++
 .../drm/msm/adreno/catalog/adreno_glymur.h    | 2307 ++++++++++++++++
 .../gpu/drm/msm/adreno/catalog/adreno_hawi.h  | 2387 +++++++++++++++++
 .../drm/msm/adreno/catalog/adreno_kaanapali.h | 2317 ++++++++++++++++
 .../gpu/drm/msm/adreno/catalog/adreno_maili.h | 1882 +++++++++++++
 .../gpu/drm/msm/adreno/catalog/adreno_milos.h | 1977 ++++++++++++++
 .../drm/msm/adreno/catalog/adreno_pakala.h    | 2161 +++++++++++++++
 drivers/gpu/drm/msm/msm_debugfs.c             |   31 +-
 drivers/gpu/drm/msm/msm_gpu.h                 |    6 +-
 drivers/gpu/drm/msm/msm_perfcntr.c            |    7 +-
 drivers/gpu/drm/msm/msm_submitqueue.c         |    4 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml |    4 +
 21 files changed, 15754 insertions(+), 357 deletions(-)
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

