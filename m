Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792615956;
	b=5seMChGL5RwzvMAeptU3HKbxc29oBv7K1612pfJu9r6Bu/2SUxoD+X1BXUYiTSN0loPO
	 co5d9an0Y5T0mLhPYQzeULna2wVGWNEB1G1B+bZMXoJ+ilxPaqEAepkhfw0HSqdd9nIKK
	 QIfJ4BdozNAMXJcZj0yYPHCWg6mtxgOcBFB5V5VTi0ap8PLJXC7dOS+b9z0PUqY9D4v9U
	 QY8agyYYyTlSKMQqc3UKuZNOFMDns4nzF+REBQ6KUXhx0GM9EhTU98CF/TrRg8oEnktVn
	 hKLXJURDkeaOQ0SkqjiVuAPw1LV+n1Vz3/Xi1+EQpieEkKNGOmP9BZEhHh+z/5aA4cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792615956;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DvWm9Nv7PxkmSAxRTYuuUpcfA5dz0Ks8L+zcIVXOSyI=;
	b=4fYorQ6mHPRe0+BvfU71QP4CtGHtzQeMMAQq6BQeKb3cz/is2aJ2jZ2vg2H9pU2Z76Sw
	 ybooIiqk9zIyqIURJL0MsT142mlxOh1286QqrtTc8Y0mD74UQE4gtWagZxrriHauwgPob
	 AH7JCsP/cH8TqkerJFZoTZatuWE4mRa4+Rjp1mJpQdGZd/UsUPpzTd1EOATeF0XKCRQnV
	 kjMKbPUbNJC7aagbPoaZ1fi0xTkl2BClDnZaVyWK931l2zvu+irZ7Gp0PgVz64us0TBfT
	 FE6my6DzKttQ4f20m/nGBOYGN/3UYAPxxhAEVTrCPSw2ujfsbveId8Siq7CUHi073Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VeCPMOgh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="aj/qXn4/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A23D606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 20:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A23D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VeCPMOgh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aj/qXn4/
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LKf4Wn2161826
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 20:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DvWm9Nv7PxkmSAxRTYuuUpcfA5dz0Ks8L+z
	cIVXOSyI=; b=VeCPMOghPhJQ8i4U7k+LoChfc40+Ghio5YzQUJ6oDUSZBFdrgp3
	hREUOvLZeYTVzniOYEUqCvzros6bPxrv3Ixca8umIEtEAC56AKDBhSJHMYtr756G
	BGw6+19rjIl4srj8Oj9pvBcah3nCuJCdxgF6X1MVewqCG8pQ0+Fx+5kIEN6wx2wt
	kg5me+iKPAi5Wmh7mkctQej8vw4/dN0+lADwaRvvsW9uVKGrRQG6xSRsSZBqQdz7
	WzHFCiBEJafa+Tm/HxLQyR+tHih2hog0kcTNAoIgNfEswRxSRW7lQt6KQcrXl/Qt
	k+cCOymJCo27Nf+BoB1jOx+T46IyLaTT0vA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf1u3gpn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 20:52:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad840053c7so1094197a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 13:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792615953; x=1793220753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DvWm9Nv7PxkmSAxRTYuuUpcfA5dz0Ks8L+zcIVXOSyI=;
        b=aj/qXn4/P+mMu8bE0jtw65MnT3T0XLwQ+6ipCJ7g32xZdN6DrrlBRVAisOPWhaJ+Er
         C2IE1L/G0kMJqolcxiBzGPpk8qlEoU4Ndo6BDtpf8XtdodShTcrojv8zaySfj3J9WirJ
         Qw8D+P9tsuAUGIf0nft76kSrAWsAnNyRY0yGxx7LmFA71dy8aZ6ezk/5GFtwjEB2Elig
         o30p5d0bG6f10RsrKoEuCzqd5w1alv3ID/PeVVmpIkjHSB5H1Zzi1s1Ibyov3cW3KCtk
         wSGBwwmfE4yuxAA8eiLt/YEU8YIpauwlZGH0RwsZtP/H8CHIFaEBtluhYIxYNOnENlTy
         FevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792615953; x=1793220753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DvWm9Nv7PxkmSAxRTYuuUpcfA5dz0Ks8L+zcIVXOSyI=;
        b=tJ1w0gV8ClP/6gPlAHk7HU599Oh0WvXPfWTjzqzrwlRhGZzLwi3A3ZDEMx9DbUuOq1
         uiXxbHkLc1bWqXYTbgU8KijWOWg4um1BkFlWO2AcRExrRnoO3MP4c6tVH9l5rCMl4gVq
         sLH2j4ijlLaWDEl3Y0YHcS90Is7wUW6lpjTgzn3YUoYFkJtpeAy7GRxbMENWOqc+P9kI
         /w8DtHLAa+nd3WWpi3VfirFUMKBQ4Nu6ScChEh0Xi0UvObOfb/BOiWrJYEjkGyzCuwJA
         HdIIitS7mGMsSNT6Ak6qtDk9V5lTCKbLoZfcwuD616/Sczk7CMP4C/6Piwt3o7lHve9H
         3gXg==
X-Gm-Message-State: AFq9FYJeLmR3RU26vFfk41S28ZgMoH4GhlPP7AbHvtoeCN8W1+Va14fv
	6mz1RmbJ4t0oLOUMLZq4uZspcwcaYI9pGZ1a2GTkzmf8jG3AtgfxU0yKaFWBTtlwRYsgHXB9YUp
	GeZ+ZqY4wwqX9dqbmV5hDIUAkTzDOY1LHSXYKMfSRoj7ynEMtjDyTuODY9rOreEKCoqMZ
X-Gm-Gg: AYBFou0FYC/3hOWqdfSUXYHo5fqok39ZKEDz5rnX0ijTZ/Ia3Vmpu0xnBhZWDhZStI1
	jvidKVbqy1BZ7a+8PwuiXmuR1MH4smVMKgKqp4eDApHvE2n34IV9k1NAGYM680ENbdIxpe8EiNj
	wR7qIYNNDk286EFprthvOAEzGr1rK4OI3XRxZXfgqfALEhheTXRBguQhbREIf250pyZrXid7SOP
	FgKyZB6aZ5fzUDBqZU+OVB61dOdco73vz67tFF3lizxQuGV7/BTaHd7XT3UKWcaVHdO8ubcYNz8
	IDZ3Kjy6VxbloigBzxQDiH1C5bCHvV8T5EVw6IGtSR1d2vTf4KuAJCapgt86JdNc77l+pZdu/qq
	ps/0hr4bgz39goJGUYHkPKTT5zKMcPigF5d+FD7z10NYAxeav
X-Received: by 2002:a17:90a:e7c8:b0:3a4:b0a1:c7ed with SMTP id 98e67ed59e1d1-3ad86e97f59mr2458354a91.13.1792615953336;
        Wed, 21 Oct 2026 13:52:33 -0700 (PDT)
X-Received: by 2002:a17:90a:e7c8:b0:3a4:b0a1:c7ed with SMTP id 98e67ed59e1d1-3ad86e97f59mr2458334a91.13.1792615952851;
        Wed, 21 Oct 2026 13:52:32 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada48a55d5sm981845a91.9.2026.10.21.13.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 13:52:32 -0700 (PDT)
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
Subject: [PATCH v2 00/14] drm/msm/a8xx: GPU state capture support
Date: Wed, 21 Oct 2026 13:41:25 -0700
Message-ID: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=S8ZMU4sP c=1 sm=1 tr=0 ts=6ad92612 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5uKouOo8jYOmxnCoqBwA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: RAsezGNwU9rnZWfZkQ95v5NU1MLRwEK9
X-Proofpoint-GUID: RAsezGNwU9rnZWfZkQ95v5NU1MLRwEK9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfX2hbvmCga7Wod
 /ZotN3Ge66pP2+hwZ7MHoEs4UMvc36uObhk4DeY39W22V5tzplBrL/8P1IiiziJHcEEzRQkVVGd
 EHstWCwqZAFBDvafP+NWKkkyhjE+UNCWqvN0dZB3XksV2VfvIj35MhqythevS/8JkppdUJGLEEd
 smusz4/PlRcQOU879dy4oMN1yDRUrIUCO26ILSEIqKvNFcm9VITtW6CGpZdeKdHU+vCvooq0FVg
 5ku86sm5I2Yh7VpKGwcfuHgBmnyBZj8wmfZmkMmbhAziHDkSWQy7vAydylDzQ17GIAAQDSWTpJx
 sshtzIJHIyaKRCaTeg2jnxsmwuvevhT/D3lzbVbWlZ7aRTatlU4/z35u3zFdBVQW9Cxexue2fEr
 17+W22ffYMOYX4BuSsJNxy/1SzggU/gDcpU+TRJEuuKyYAev/NLsZQRzEHAVE+EdzdYOIvuFrw4
 OpZ3TwBPjuJ+BHit0IQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfX0b6TfBjf0Z2H
 wxtYQDTMipnpdaCiNXe25DFtl1v9AhPLd/94U6asKprxx487y/zrDCTQIEW/gBGmLVrrD7j19zI
 0/2KGnJbKAupA6t6sA7l1cSGzAdeWEo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210083

This series introduces gen8 devcoredump support.  Compared to previous
gens, it:

1. Switches to generated tables.  Compared to hand modifying headers from
   kgsl (which were originally generated, then adjusted a bit by hand before
   adding to kgsl tree.  And then copied to drm/msm and lightly modified
   some more in the process).

   In the process, we also switch to generated nonctx reg tables and
   cp_protect tables.

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
don't have these devices at-hand to test myself.  In particular, do
things look fine after the switch to generated nonctx regs.  To test
devcoredump, you can use the msm_recovery test in igt.. or just:

  cat /sys/kernel/debug/dri/*/gpu > /dev/null


NOTE: Uses $codename for generated file/table names, rather than continue
      to perpetuate the equally meaningless gen8_x_y naming from kgsl into 
      upstream.  At least the codenames are familiar upstream and this
      removes an extra level of name translation.

v2:
- Fix incorrect protect list for Kaanapali
- Use __free() for snapshot_sect finalization
- Fix missing early return error path in gen8_snapshot_mempool()
- Fix aperture setting in gen8_legacy_snapshot_mvc()
- Fix first_slice in gen8_snapshot_mempool()
- Remove GBIF regs in generated nonctx list
- Link to v1: https://lore.kernel.org/all/20261020204728.28844-1-robin.clark@oss.qualcomm.com/

Rob Clark (14):
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
  drm/msm/a8xx: Switch to generated nonctx regs
  drm/msm/a8xx: Switch to generated protect regs
  drm/msm/adreno: Remove temporary __maybe_unused

 drivers/gpu/drm/msm/Makefile                  |    4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |    7 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h         |   14 +-
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c     |  675 +----
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c         |   46 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu_state.c   | 1278 +++++++++
 .../gpu/drm/msm/adreno/adreno_gen8_snapshot.h |  582 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |    2 +
 drivers/gpu/drm/msm/adreno/adreno_snapshot.h  |  527 ++++
 .../drm/msm/adreno/catalog/adreno_glymur.h    | 2308 ++++++++++++++++
 .../gpu/drm/msm/adreno/catalog/adreno_hawi.h  | 2403 +++++++++++++++++
 .../drm/msm/adreno/catalog/adreno_kaanapali.h | 2332 ++++++++++++++++
 .../gpu/drm/msm/adreno/catalog/adreno_maili.h | 1893 +++++++++++++
 .../gpu/drm/msm/adreno/catalog/adreno_milos.h | 1987 ++++++++++++++
 .../drm/msm/adreno/catalog/adreno_pakala.h    | 2171 +++++++++++++++
 15 files changed, 15572 insertions(+), 657 deletions(-)
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

