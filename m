Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911221;
	b=g+AilbWDH4ZJB7QsP/kH6+JvA8BUNIe3CvCMaxnjO8d+ZUwZ1FTwcpF4/GRhhF8ucQd+
	 svRLn7cAaxeLPGnC01JdPCKY194YtaQWnvGrftL3b2frMHmDr+GgEGEZb2GYvYdmRlLXS
	 OIn5OvwmbkJD8034ae40cQ86qiouTj3JJS/g4FMemqc76d71xcmBgejv13yAg5HtaJq2P
	 dx/dpkso7mjTbQvnV28MRJuaVyAPsS1HSBjZaqgPizwX1g26muZQ6V/UpTSxfqpnU9o/s
	 0oOnZ76UBfqFqaiuqJvsX+ehYioQLDjJDmaG+fC7Ul9EwnRzYkDVWihIoK1nEtpx2Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911221;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ejJX0zIY3UTvwm+Dr1cQT9BYGv3Db+um3b5u1jzCIvQ=;
	b=YoiI7IOmhJnEklmkHOaqDhhX+1MzvysLtLF08wg+BFPnHMDzW/NX1yIl1NrvWbXxFLUh
	 NkwEdZFeo9LRqPQzEVUtYo5Ddx/zUOTBLzFC0NkCyWetqUQLZDzX92yqOdv33tTmA1KjK
	 kudruilsdT5Eu2dcpePo71IYvMkcM164dU/GpVPheIWMV3JiCz4A99W0VAFIDZkVQSoBW
	 joHv5x9sk6ZBIg6nwz77Ah6to/TbqWjvbBaUpSgMjTQQwwLhh0XlXjlWndx48KUe9To+m
	 OmOmdWzLnI6tyKV2zpcHn1oQJW9g/or48OqsMoCOvd6aXWD4QP9ZBeAWI9y/s28uQMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BXosqJ35;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WyeexI5o;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8525606A326
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 20:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8525606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BXosqJ35;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WyeexI5o
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeKcD2090975
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 20:40:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ejJX0zIY3UTvwm+Dr1cQT9BYGv3Db+um3b5
	u1jzCIvQ=; b=BXosqJ35GFC3hAFSGBBAdFfrLr3DMAfTWfcGKOwgu8igZlAYn24
	1zFHy53sTDUoShIqYFEzCa8GGZQlo7lNDXA+eDDCUhquiBlaEUjFK8eqV+jpZkEp
	4G9nLxANAbMHduvgIsdfr2CRlk6fkDGgChA8AHVf/oZR4fkD8qXxHeeblChKjJHq
	hIET/694Y1YuqM9HdUNv0oDNEDUS07DF8qNtwzKehKTkoLtkRUWuTsJw6e3edqVh
	8w9Dm08a9HdXgZE/yJseGUpUA7kLtMA09FmYxj9XX0yymI8RfHafiAP+XYpJU4i8
	Jaazqps2rpzPaMeF9dSxnY0y+17HPbYtSrg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq9faupn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 20:40:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so3936762a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 12:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793911218; x=1794516018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ejJX0zIY3UTvwm+Dr1cQT9BYGv3Db+um3b5u1jzCIvQ=;
        b=WyeexI5oNj6WLgWICmKm9lMsREhi5YupTHnMCGXQ7wdTSdZCFc+AaMGXfNS6rbYx2f
         aH5DTqGzrllsY/wkkfbCQ5CWlS33zUXCCoXmVJFFcxBIVTtYz3DZ78IUO/BawWXBOIek
         5rxt6stAxWg+whKOpbLxe/IRoGRV/ype4oJ+tIQs3U2QC4gkY2OhlFxoVutuIosJrtuR
         8+7RmacpVW3xmqc4AT33ttU/xYGJnb4B1HmiKmfJscXgAvgNgY25FvUchkIgTOVBBJg/
         Qj7T3rzvqbzzYPNjglbxl7InB6K5a7oJ6Z53Me3x0WooCeY9WhEWlixKqAAs8eV4Nd5K
         S/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911218; x=1794516018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ejJX0zIY3UTvwm+Dr1cQT9BYGv3Db+um3b5u1jzCIvQ=;
        b=UJNhM2lHvYM0RQ/ku10i7vAXuGntVvw+kuhAkBlu25DMLJekeaQJptHsngAhNPIQyb
         gP3oAnH9aO7J3HpyGD6PKxzCqLHzgODFYS+9WgcwR6j6N8ElLwkRNvgSi56Rhkmlisp0
         RLyWBsBN8r7Ddup6FnsXG9qvB2tDU9it4GOvgusBZ5B3G7pLwE9LnAD3WXVaaUdBC8mG
         UhBSVJJd6HVQgwcpapA/dYOaVjOAhQARRMA+wk5caKAhOcysjPeS2JaaVBoIN8k2Opba
         ZzLdgZDv1sRji3eMBueLsJZyikMr6v1S/gmRMCOB9uCjlpmxie4yheQ3bXydP++g0JSv
         eKrQ==
X-Gm-Message-State: APuU4Z/62u9Fa/ypFepg1zn6WyUxRHCOsz8rf+s/Nh13/xL9FoQhbxKt
	WjCOVvDdEODKW0B0vcG5RqE52zaMO/ginZ7DdvcbmfhK2hv5KYhbLxQ9WfW2psl+/J2ShgeMPvM
	Oo6oNUtl4+Pmg/oAjhpfrwrjwaJbk1YuomlqhOgGtdUq2F17PoTNEBbf+pRanPEvEOWW8
X-Gm-Gg: AYBFou1tv94ZU2yBSgiBvXuM0Kf7MiHeY3UbRb90wBANSs+qKArw25Z6J6d8DP2R0wx
	knu/wzGs5oFxkitXS0RD+4OoYABf57Z5RbgtXVP1Xo/I4TRPTXd6vKEUHsctq88Ru7CKilUHAzj
	9MFEY4d0cgOJ0NgOF1d7BNBcrgluNDKJ4tVnzAUcJKEeEFsiEaVfZNA8xCs6wMJa6O+i500reb1
	2QJHMXl1BcsxkcBHVdfpKMvDvyiclrhuCwPe36GIM/3q/Od5SlZVvV3nLwCppBBOAPsFSDkCgM4
	rfyC3rIkxYhuMT6l1uyMD2/xg3Q6SoboAKxqgSE9F1DolroBv1MEQxgh0dy6q5XMPTDFVkgj/eO
	J10o2R4jxLSRKL680DlcESFGKGL/KMBXBKpvbtJ0mjkLXIo+DUUgbBjAVimPhw36ikszG/itdC9
	0NbXH+TKtzqBMOqp04Pik+3KkKBGPdK8BLxC+YLeHJ9x6py1DT1adjLaTazn4OnA==
X-Received: by 2002:a17:90b:1e48:b0:3b0:97b8:d6b7 with SMTP id 98e67ed59e1d1-3b0db6f8c29mr187961a91.42.1793911218444;
        Thu, 05 Nov 2026 12:40:18 -0800 (PST)
X-Received: by 2002:a17:90b:1e48:b0:3b0:97b8:d6b7 with SMTP id 98e67ed59e1d1-3b0db6f8c29mr187931a91.42.1793911217867;
        Thu, 05 Nov 2026 12:40:17 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323a1fdsm5075510a91.5.2026.11.05.12.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:40:12 -0800 (PST)
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
Subject: [PATCH v6 00/15] drm/msm/a8xx: GPU state capture support
Date: Thu,  5 Nov 2026 12:29:26 -0800
Message-ID: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX2OIYB0Q2eWkv
 X6fXxYn5V/bnfAzQklYcQS11XaXYoCGgUsAhzmiZBhf/1/EG0GF3qMKw9DXJJUeBYpbRKAQZ8aY
 diwxVtRP6KgnJ7XNp5O27vEEg+tWA73aG5nz2F1f5sV55gUAg9y3RNMyo1L3f0ypqP1JufFFPQU
 htmWY2Hx+wCDHK4fawua5cR5zcfG3ahoZ91bYilltMYyxzOQyI9oJjrx4dkCBoqhjPdndPmxkVW
 GBCGNPNURa339/n5d+zhHThubyfcTZBrp2A2EVnla/tivLd4LNp5hYuwwDcTSX2ZBpwiuWh13wo
 kQ53Y2oFVYMv1/dMVxMkPJAfVh8qggeY2MWWuefbtOz8GUKpeuRz06ALnlGd8MijTcRwQLgstRq
 KVXUmbd0J0Hmgkoipu3VV13OpPXYqXJk4hE80rZkDssrR2W+KTRpWSC4C7Do69aWFXij0UCoZS9
 iG6zGBGDRjSJZjH5hFQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfXx+xzm0W+Ru3i
 xWETs3QwYibSba3vQKDKjUVsG/iaVR+uHVxWF29LI/nXOeGV7MMWQp+3VQXgGf2ecpFuZz8E0+9
 TOPu1fDpCYTFQ6rdarnZivHWPBqyzIo=
X-Authority-Analysis: v=2.4 cv=Vdhir1p9 c=1 sm=1 tr=0 ts=6aece9b3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=K31SCvzAQ5oPMqjnjVEA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: aK5H8FFbnGgas_2FBO2E4FMNm2eAoVE4
X-Proofpoint-GUID: aK5H8FFbnGgas_2FBO2E4FMNm2eAoVE4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050082

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
 drivers/gpu/drm/msm/adreno/a8xx_gpu_state.c   | 1403 ++++++++++
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
 16 files changed, 15718 insertions(+), 322 deletions(-)
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

