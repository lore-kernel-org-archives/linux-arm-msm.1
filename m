Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657059;
	b=Wu+Zqea3HjjcuhSYHUi6YmPU9Eg2Zh0eEpKgJWxRr1Y7hEHk1BXFPd4+U0JbM0DAPtD7
	 3lS5MaGChMawnPEGmv83v/gbE+lyPW3wbJyQbhfhzegKaJi/CYWA7LBNVHq2C709u64z+
	 g/ghaii3ygElhVOPmoiGI2dHHPgkdFohj+dYfFaakUDG2bCY7HrFCn3ne4AK0BFzIhenr
	 bUWcspylvRxTLaYWB8029/4dQAzsN56Fu+AsqeNGHQYLO2psgw7vaRyCsVWfBn3QGm+zY
	 /YUGSi0ZZE/e7znszhtffPiWWG7xSw6g9bSXwtyKo34KxuVAEWc48tyPPOEXzavEa+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657059;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SvXcR8+6AOMRF6azzS7zhFa6baaJR1YMpk1sV0Vz94U=;
	b=M9ETousM+Iv4MWFy1bsmy6CsDfOPHpT469D7HTCSyxG380zOHg+aEgpkqGM6o3bgexWR
	 IlrXXuhKHtiV6uxsG9vaXcJXBajeK+zOxliArxYBUeickRoYK2tyFtUilkXw77A0YmfXd
	 tvM/0Fp6sJiVNKI0H3B3zkp9HmTPmBWnuCFIoxrEp+fmjszp/KNkn3K9WKz2hKp+0Aic1
	 j5fVALJPFvd8tOWS88hFRbNyVO6MzO7Sw5rlMzc7h7fqqZik/hOjlvcjdlZNFeMuUDRk2
	 /yxbOnqWo0HRe/1kOh5y0QSEFmtpWtVvUPNtvsc1ewECGVYpfzYwU4zv+wx+bhMq4cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nWdki1D+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c7XwxmF0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2123606A331
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 22:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2123606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nWdki1D+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c7XwxmF0
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K6AVv372213
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 22:04:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SvXcR8+6AOMRF6azzS7zhFa6baaJR1YMpk1
	sV0Vz94U=; b=nWdki1D+sgOdlxjmk+wsea4EpAq/Ax1+WrlP/Gf5VcFAo22BeEi
	U7w+VP6Q1qLX4+rKcVUKnW/b5/wpnkCydrr/L7d9seJ+cdVdrxcNZQtDNIssY5J+
	t+UDqbXCaGgihZbwZQcXeuME8/yCrZP/bAXhqEvJLYTq3houNgUzRBtKtlXuXksQ
	CnXXxYjZbpcBRDNoeM8sm8VKBp9Eod9u0Iw9p954NkR3CSVoT75ySEvJtHTaFBrr
	x/lx+5uC7Ugxi4EVbM1VAN5TI9onhfsas4M74IMMOMzucYgJw1FQLOHs18wZjf/z
	r2qU7HKYtgS7bF6ru0pH+Ls915FYPLurKhw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07r0pcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 22:04:16 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab67ff8ec3so2350626a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 14:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793657055; x=1794261855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SvXcR8+6AOMRF6azzS7zhFa6baaJR1YMpk1sV0Vz94U=;
        b=c7XwxmF0oU6am+qgeaiTuAc4kbVqBjxZ8jTmMsaPd3RGKTe+zI5iMIaH/iMYjCUgI2
         xF9EdSy/BZN6swttdog2MjBWUDRhVR6jP70t/mwRBqeWSvbK5XwwZwye0AR5k2rM8MA4
         p2KDZFd2ni3Lgh6gCXwCO900A0SWVBYwR1/5/+AkaAw+lOtBp19z10M7fH3txLxCKIhj
         1NeLbY7W7KGO8Xcn/jmhg4xLMBxOArrPTsdjv1BT1bZnHcPX2NXcvxfJHnKHJ6dc9/Pl
         sveyipLJbj9BPlwZzVJj4P4j00kTNEmmBgY/92M2b6Zu21JMTvzb87Li3dwnY1JcFlJ5
         KG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657055; x=1794261855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SvXcR8+6AOMRF6azzS7zhFa6baaJR1YMpk1sV0Vz94U=;
        b=OYLbht+GJRZfGctNPq/TBfV28awKTvO0l83OMH62WUNap+tRDVnQCj2ql7NTQcWK7Y
         /gN2/tWdZGNLifxlrtLHCcrtQGxFn1RcpZNyw63JOoyoNPehl+XEpGnQcJQ2OF4G5RZG
         JihYoQ02aDmbZfxPJI95rL8Vu7L8bZfOYXazqdj3QdwKu2Rsx5/DGbDNXqiRr3ZjMLCv
         RSYoISj4aZ8OycHarXekHSATop283wa9Sy94GIiMIAROVR37fzgVUUEAz4ZG+9TO+Lbk
         A8E9Qat/+jf+uPuw1GmeKmEB93ii/I/buCsupPOCBeGtRm/kqxFVXLJz7+jJwcmVqdIY
         8DSg==
X-Gm-Message-State: APuU4Z/+L0PXOlkHqRDLJ872fddxEdIIKSl+VHCcbPYviDCVdIKiMa4S
	F1JTGlsmOTIx5gICLgVhxoVdbgWx/TjPF7QIhZ/NVkTHjboO/k0smJxPbqS6Cp+zP7+CSQNxhQ6
	dPlT7zQWylAaE/2oTCHNNbyx9URCLwDCFV+XX/MC5mbviERfcREkLO9ClxsU1hYwFz0E8
X-Gm-Gg: AYBFou1AIjejCcbAHyi2nv8U6VQiacawy9zzHXyYYzOHMSTyVvow5OYa3bvWXZ//MTd
	NdtA1Q6rKT98bVxpl7iFRhc8OCIsxvpfT3QIRm5f77YsQ0mJIK0auQwopdPbX2I1e/sNiQFcz6r
	n8xamEsKVihtA9KZhHAJ2rnFJhnXIqsITrtitGpVVwOhmcSzD5FXLhtIVWIxYcAiWpXnt0Ipxgg
	v6SbQrpeXkXHdl2T+hNvK8G/l/pJkJ40RyvGOwyifws0MhbrLjmJdwRg+QjkJvglPqpn1AIgspG
	+slS/qaK3Jq5lukSxRejocAvW0eOOJ0NC6LlYQmsZNPZuiTo2/f1fvNRgxzmagCUopAYp4H3IIQ
	tJrQptOvzRvqVpUi0puyZMFzQprMlxFhovJSIsMxZgPUCRo3Y1w4w3vSnkeu1xws0UdOkS/W3KI
	Bt6uZR6y/35b8ztOcQSGkvAw==
X-Received: by 2002:a17:90b:1a85:b0:39e:6a80:dd9d with SMTP id 98e67ed59e1d1-3ae898194acmr9615678a91.36.1793657055368;
        Mon, 02 Nov 2026 14:04:15 -0800 (PST)
X-Received: by 2002:a17:90b:1a85:b0:39e:6a80:dd9d with SMTP id 98e67ed59e1d1-3ae898194acmr9615648a91.36.1793657054882;
        Mon, 02 Nov 2026 14:04:14 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c9928c4sm974146a91.15.2026.11.02.14.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:04:13 -0800 (PST)
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
Subject: [PATCH v5 00/15] drm/msm/a8xx: GPU state capture support
Date: Mon,  2 Nov 2026 14:02:44 -0800
Message-ID: <20261102220405.30730-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: ojnLlDnSPHw8EKUc6IvXSzZP0vybIfYH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfX587rUXXG7+4H
 pVD0zpox8jx5eMvjYLw6MbQvZNQ2tYLq0+uCj+uh3BX3LHIRVBRuoII4tG1/6uGxnjVq5dhxxIP
 m0eYSUw/X97IpHhAhngis78Xo+xmb4Cq+11itZRW1fOm8SG01zF7HRJgCzaXvCXAn7jwR3oI0y9
 tRx09s5vPYT6zrnhuOGZX9xrvj++4pGGelYDLcfmgoXLD5yUjuDbq3LxOKthI2HmRSsaMJ0Jjq+
 J/uHoWAYGukP6a//X5/ZifR1sy+CHlKNO/MJN926JdkWZ4bCpQiGDLPS044xuJcovvfOvT/FLLr
 heGTTNL00isF6pBFX7Hd945ZbvW/mmyx/Kctefj4dkwa1LG6yvYXjK+ZPFQtDLa2IHKYjcO/Ob5
 H5eg700jmhrncriAgq/iyZMKC3EV+DhfJdnT0N9Heky81srIeB8fiwDqqkCo6+sNShXJVZglEQI
 EvA3RpcqGqD8CQn6H/g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfX2JpiK+OdnYmK
 9jKAHfBp/APveBPzHO2cairPgBsh2/SH4by8sbG8OTIkllrLbmNF2HEc6C0J0ptRk8uoFkgFG6a
 vm/qVh9CxgOXlbAMkn0hF6CadagrhUs=
X-Proofpoint-GUID: ojnLlDnSPHw8EKUc6IvXSzZP0vybIfYH
X-Authority-Analysis: v=2.4 cv=NZlzRGD4 c=1 sm=1 tr=0 ts=6ae908e0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ATBJMNQxfpEraPvdLzsA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020087

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
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml |    4 +
 16 files changed, 15716 insertions(+), 322 deletions(-)
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

