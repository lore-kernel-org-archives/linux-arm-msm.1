Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794007356;
	b=JewCj4mSzTsQOTovZ4ng28HPVqGEHig7YDNY6TzVqNSVQ1+QSC7K2qE612vgzD5YhtUW
	 PiY06LmxuvtPhRAqlfjDyaI3HrDXMWHcoNANEyfKudU2uhayFEVjqPH9dMrjeSnusW3er
	 PpIndM4OHD7NO6VSC2QRv3EBhQ592eHrpOCaOcvytTM9GcPzpcDJUpW1LwcPRPXV8Ru64
	 GbQeiFX8ahxQOb0dEcianLxpsoArEalpvIWeD3J4iAnIlKG8aunStHBAwJi0n/Uj+fveh
	 jTR8WL6SZbdInJlP8LVz5Rp+fBUhpH976gKz5RK1Vz0mFjzl7PSqFCmAJrLNhUIvhkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794007356;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=S055k6TyhPCYhS1fDxaEVyy6bLh6abktDuUjiQGLWqM=;
	b=Dsjnzd8xAqH20K3CDHiX8JSHirR2jybPQlafdZ4Rg2amXF8ikQofxjCsEQfqsPD44lrH
	 v62mdPHoyftbL6rSYZZEtmHn+VFg93YmG1krHu94FjCULiE0cCvzN6QvuQP3PTAOk2I0J
	 9pbwJzKBX7Q23jpEC2O5m2c3iOSq+iYClQwcje4ICe7diFFsit5/AF9LPrxIvEnWlanMT
	 6k+4NlbzblOXdHiQPuKw+PPnbam9as1VvLXOg20OEV/8xLD7Bjc2KWaggdRRTmkSc4Tgz
	 t8F36n1XX9keU182QcV/sK9dG783XMGPEZIIAIY2xtqwBeRbUQPq1+L69qTE3cPdDpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kmqbxN2P;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EmUZ1pqX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAA0606A32D
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 23:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBAA0606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kmqbxN2P;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EmUZ1pqX
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Mnx971063812
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 23:22:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=S055k6TyhPCYhS1fDxaEVyy6bLh6abktDuU
	jiQGLWqM=; b=kmqbxN2PDDtM9OnkPRNx2xaaUbxZAjNlVuJHuWWygwKyHJVx+CI
	poFHbBx89HZ2TPEcDfcry+4SncHRqIiUi0t3zIJll3rCb4Pdz6HPQMxOKAa5oFBZ
	JQRWe1PY/GVALfFwVC0STKdF2w0l3E5qx8WJWAPYs6L+4hMOdn/UjbcWdEmzPmjs
	JVie1mgZkfjiah2Y43DMW8JVJcnKBf6eddlM731SYC5b9X0xUZexFt4GXwv9Vpg7
	l+bJKFITzFYdpcHNKuVU2q661V6Bq+XAN28SZDQhGKxBKRQq7nJFif0Q+JeT0oEZ
	X1JBPyV2Ay+SWzRkLNfdFzu+oQw9Jdx5ROw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsmyv0r9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 23:22:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0a9de9c2aso841546a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 15:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794007354; x=1794612154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S055k6TyhPCYhS1fDxaEVyy6bLh6abktDuUjiQGLWqM=;
        b=EmUZ1pqX0mClcEkYEhHw+mfCn5vTg5dNH/mRkHFL9TDDOnGwjMdGTA9pMjMJvnaKxh
         UaZ5+Xa7CVRBHktgewdw9ftqK9zuSUFltn+/rQi0SejhuP0t8XCMQu6zMkgkshyGPra7
         cro1aN7309og0w8YKaHKkxE5oZwKGt17f9LynXEpqVJsLeTv1dQvQSro9rerJWv/bOm4
         nGGUSTYKWXVeQWlkYKELYKeSRdxztaRt6uXrK7FoCxIluTLjTFiI4XENLblmOGF3T9Yl
         8ERSBosNObWiuYYloN5kGKX37dHLkGlMXrNG/5A2TlOu3IOB8LsFw1B04TmzEKfN3dYE
         XPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794007354; x=1794612154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S055k6TyhPCYhS1fDxaEVyy6bLh6abktDuUjiQGLWqM=;
        b=QY7JhjrpnY164KHZ8VzRwneV6BPZVpMlcOSettCFKPiskncStSUtQ+tnETou8VVm+S
         ywfAgguEYFP5CtNeddiirAsCz2aBw8BOS/YotPjSqJ3kizKF50woczkcnsCLC4moFyJc
         MotXWtwOK9oV5HaQWAl4xExIU003IuyIBNksmr/FmXeuY3PD3Hhc/nziNJVmivhTLTtR
         cEKNK+GeOoRjZX1tAmne84RD71RPGB1WD8xKN+tjeBQwKdDkJDRW8S6xuQLYGs7hDVWw
         vvxLORpXqbtbXBkXGNxfjGhsDob0QA/ZsCqzbI/w2jy0nz7z2FxmTNT3NP6TwFIsRS/4
         LXEQ==
X-Gm-Message-State: APuU4Z/nHSGMyjPsYd/2l6nKZE7BReRf1qzv9M/vJXHH1bqdKgOthZOU
	Xe6ier/fEV2CaXwbPE5zvnxx01n+y4buu5N3RUrn/Qi1fqDES2Pss8D0aq3UtA0y6WjpxV+busE
	HWFtNXZ3f2xODvsseojUAMKqwZDlKeOjkUJmXLM7EFR20saFmpW3qK0szABWROE2kNKJT
X-Gm-Gg: AYBFou3a0YqGw7yFqFEik6ofcoM7lP8vDzplghWGSwmKLkSncCxIjWWerQwqiJxrrSN
	UggVas5wReGmSh6QCdJOABcrJSrepq46InfGUajONHlBZ8zR9grhOsVRyBB5/NfKniA1dNReyAi
	URNDM2vuGwZaCTXK7/QZCrC2E8vjXKT6NgYWgG6dAMdjnXODND5FFM/CZ7G7p+YNbiuO4HDw0k0
	YCgjBxQ5OSV4Ez7KxXuVJ2OURj++Q5dnYACkWkMFNxAMV9qhQdXHWav4g9p+/s/teE7ZuebVUKO
	xjAR6ueYJEmuihNiPcZ07jdW8UOBFdtORn40REVyN3G6jkIwPkTMm/++EQXyxLAZToYyYJpAlTZ
	KOyb4GMNIj2ILot+gHC+duQ6F7umJjHGCCkRafRZVyLwj9rMXt5/ZtpEw9QjuzxqxeeoA4bQCaH
	gNKH++Z4M2b9fxePoOutdkjl7RFGhT7zekrde3VzFw0RZ5A5a89cMvCtz7YmLA
X-Received: by 2002:a17:90b:2748:b0:39e:6a80:dd9d with SMTP id 98e67ed59e1d1-3b0db6f507amr4043238a91.36.1794007354360;
        Fri, 06 Nov 2026 15:22:34 -0800 (PST)
X-Received: by 2002:a17:90b:2748:b0:39e:6a80:dd9d with SMTP id 98e67ed59e1d1-3b0db6f507amr4043193a91.36.1794007353794;
        Fri, 06 Nov 2026 15:22:33 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b105831cf6sm653732a91.11.2026.11.06.15.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:22:33 -0800 (PST)
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
Subject: [PATCH v7 00/15] drm/msm/a8xx: GPU state capture support
Date: Fri,  6 Nov 2026 15:20:52 -0800
Message-ID: <20261106232220.47602-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: H8HKgmCZHF_tPwitV7hYhZGCm4FDSm-I
X-Authority-Analysis: v=2.4 cv=IdYSymqa c=1 sm=1 tr=0 ts=6aee613b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JpdGgOSwG_CvbEWjDSIA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfX9fdNYryHtBQ7
 /PqDEVsP5xElpmmg6symBOttjKwA/S4+w/eSZTbTnWltN9gVlPFB+ls9YaZWWJTb/rFyWoQGiz6
 Z64ZWcibtJUGV5O/0ER6GqWQlsWmAig=
X-Proofpoint-GUID: H8HKgmCZHF_tPwitV7hYhZGCm4FDSm-I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfX/VoUZx+MmrwD
 13xiX+6mQeA5mnKwY/+6zbJzraxHwG8egwNyNsPFZZ1feYsW1/amUK3FOPy4Dax0+MRpAgHaCOo
 bVP74g1Rioj0gQtB5pj6Jvx6JyTnZR0dWXMp0QlzJGbe3zfu/4hdE91KICJKAmoTQ6yFoFChhO7
 8kkfKQT+gDozMQMCa9VMczz0JmAuVQhALR73VzGtIn2PgFP5lk7xJaThqLE7JZaoqSoRbfy49q9
 xQvX3/KEFmbY/lRNdhoRKBMq3nkTSdNX2UdJmtWF9/1vdlzWlNNuemZa62BnTy2mPKF02OeFm8q
 Mgz4HWwRmKMiBAy6ZQnBPrBHAW+VN6NpHEHfO8a3FYJD8tKzE26matww2LIp0Ov88HNU1wUedc2
 yleIjfJWkSPatL8q3Tb0Nu1GxLNUA6px1lxuSvnIl8uH1Qwkzdhx7+7qHZ86Ye+ziKL7L+fGbBX
 ZFaeG3opTcnsy6ZvdwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060093

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
 drivers/gpu/drm/msm/adreno/a8xx_gpu_state.c   | 1407 ++++++++++
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
 16 files changed, 15737 insertions(+), 324 deletions(-)
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

