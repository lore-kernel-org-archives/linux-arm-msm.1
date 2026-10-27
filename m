Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142312;
	b=yL7/qK7WOjrSw3cVy+fHxUa8L6/1SHpQ/G5lEKCMcQkLurjta3jAPSQ9wPSXHVEmCj8J
	 duCg63bPcXDTIJPk87c5gWUJAS+H2xeZAd/4N1np6ZQPJKVoy/r6krGGAyxvrb1Leu09R
	 gHRg7BQQih2ID+hVMcxwN1n5BJkYk/cYZgeIPTiAKBfuTwD5mvzpdcw3d+K3pCbnxZsuC
	 2M1pwciTHNx24Ld9EfMKUNzrgm3Eq2meAkBvnVohfsk0UPhjhjmel6KGmc3ZdgrSntPQD
	 6dpwgo3rE7YymocJP+6kv2Invbjm7llT4miKk0h5fuIz8wsEVK1HzHpwtYztqdU4sYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142312;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=nwXaotoqXsySYhmtZoW8iErlGXBt4yCAJIzc7fNEC78=;
	b=W7y9vAILdvMxUHQwuCHWWBZbKIKVvYPd6lOjowwwwW1PmX8G4RVrmpBzWI8KXeBqQHCj
	 yl6BbjzFzy/eukH8JaJXFqs3k+DLiO04ttdyUJlS3fTATlTd4sa4jdwVc4ZkOA87PI/wg
	 kpNBwS0KwEUsrK+UWzFt5W1G4AGbQaIv6378fbKtata936H48AKgsoyhNJJpDFdgxse1p
	 YvZvd8D9EwzaGiRsHwotDYmwVq7ZeoPWcdV9YB8XiM3xADdbMtPeyIO7+xcCe55WTKKIr
	 g7eo0qGS9MWjdllUXkVZiaL2oDBg9jqhlJJj92gr4ofLnnF6PbruzRa6thgbbNtQY0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e6cgj6DY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="kXlom/Dm";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100C7606A31A
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 23:05:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 100C7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e6cgj6DY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kXlom/Dm
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RKsvM13334441
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 23:05:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=nwXaotoqXsySYhmtZoW8iErlGXBt4yCAJIz
	c7fNEC78=; b=e6cgj6DYA10IAmENer0b2vhHva3a1v9yqSmL971iqALvaC9WOTW
	imSeV+Dpy9yHzLozwDfE2cqc/5w3Nv/5m3yWNIcyamfjdEjOhFYTFGyEngn8rSEh
	/AMd7xNUOikq9ogBjQtO67gecdj67bjcDeI4BEAtdc0pTTVFIQ9EhfzBrhd4B/dx
	pfHkSZXrSPKwEO4FvbelRw+Y//ZVa7Uka8Ag+4GkSyfP4Pjq4d5i/9QHaFm0+877
	shUs0fKqsbhn9dWGKj31u9O2s0+yMd6UNCgaHntUFgR8wQacRIdzPk1vamF2WupM
	qcCneKTUat3PFMIHTHhLwIzks91j6/Yo2dw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjst1k1xn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 23:05:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so317291a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 16:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793142311; x=1793747111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nwXaotoqXsySYhmtZoW8iErlGXBt4yCAJIzc7fNEC78=;
        b=kXlom/Dm7qcX8KOUPVz5+1eev/MNNuLRJty0EMyilxohJBrd7RkKWBYCe2GoPat6lx
         LOzRgtKcMUMAA/4KvmOtNVGYL09WCXxIflsNiYAKQZTYiOZU3mnIAnHmgjbADAS8GnPo
         JDArAgdf7PJ6jLWAwQdbZcyefXbCTvxGybeN+RcSq33n9o0/yzljVYU9rUd5GJypQr9y
         XAxk/T5TT8mPickZp2KWX4K6Yyi78hQYAT+SVrzcLOGYImLVV8Bvm9MiA/jyCsS+eyKt
         zD3JyzNnsvQ+I5cjTGDZGzVEBGKM8okOyZZImdNj17ce5+38boyCP2lBAWJAPpjd9Evv
         5WtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142311; x=1793747111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nwXaotoqXsySYhmtZoW8iErlGXBt4yCAJIzc7fNEC78=;
        b=ASOBRqQFSO/SqGcybzqNOrEgMm2bHYni1W8cIZ9tsu3FDr1yD3yGwH6ZISQTmKMCDC
         Oa10DczTuSFJHNw7O+V6V0acjALL/hBp/d96C1I6Cd6GRi/VZwGIw0aRAHO13wxFHAQZ
         yGsLCSYkvkRzb/5BlncrTKXTi12aBrQCbtf8q+lU08RmcNVFdj4NU3f2PPFZSQvqjAdN
         Og3ateGxzVm/znLOQ71o5wJSvp4Kdvzt0Znur7RqsLn6l9HXEqi+CSnEnsbFaSz5TN78
         vVIBa/dDUmte2b7jPVO4Fm3gg3PXObwwvl8npNaooOOSE15Yoe2M0rbpEF0J1E9/yHfO
         ncGw==
X-Gm-Message-State: AFq9FYImbGJSi/JtyK1EmbyD7yOD7Dn8CkNUxcWGWtDlULRGgJvG3LR8
	YuEZRNOLTPtvMF0MiT4dvhHSTWmKL4sxkqYzzk5m/7yFKe0AzpcK17CYJEqRh+5T8jUQqqCetCI
	EqIgXl/QRQ2NJfkrMAaS5e+vGUwocBJaw+XZqK+mst9EEFlDcTm3pk4R54p2rjwQEtW9h
X-Gm-Gg: AYBFou1olTZc45KA47w5DqlinFUkldAgex4tqPm7HHCanvJXK808XYAON2LQhThQzHa
	SNR1tCbhEJVLjDLkYV0hsizGFQQwrD4ADW6F7SqHbAsqmahDT/mFNYXCZmDNqNNQZTcWRieYc5I
	POuxg5QzOzUfzryUdWZNFqzFuKNWN8339qNgwhh5eUXJdfHiJcv1RRXCDCnoKHu544DVwfFZufe
	hy53PMSImVo+zJj6pbb5OvZmlZlSNZCGbPmrTCbxC9qKDon0pS1th5lLE41s/PyV3bS5D4joaAb
	hexIJvC+cAO5gj5gQYuHw6tKDRdAQBFLAgDXOndDy/6S43xE4FLGSCQCbk1LQZlRfPaEwHVehzq
	6qJyKFBWM0A1jkeme+wdkPGnq84SwUoEgA2LPNNDSzlMgjVyRC4843ZLYIstgpynmvN88A+xkpZ
	NgSGKPMPb0dG44g6+lyt2UKA==
X-Received: by 2002:a17:90b:4a11:b0:3ab:be66:ddd3 with SMTP id 98e67ed59e1d1-3ae5816379cmr248216a91.32.1793142310472;
        Tue, 27 Oct 2026 16:05:10 -0700 (PDT)
X-Received: by 2002:a17:90b:4a11:b0:3ab:be66:ddd3 with SMTP id 98e67ed59e1d1-3ae5816379cmr248185a91.32.1793142309880;
        Tue, 27 Oct 2026 16:05:09 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a5839besm248297a91.11.2026.10.27.16.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:05:08 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jianfeng Liu <liujianfeng1994@gmail.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        David Airlie <airlied@gmail.com>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v3 0/6] drm/msm: DMABUF_DEBUG fixes
Date: Tue, 27 Oct 2026 16:04:43 -0700
Message-ID: <20261027230452.130031-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=HJ1WhYtv c=1 sm=1 tr=0 ts=6ae12e27 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=puu_XB033Gd1UDA3wS8A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: hMzBN11mmuIILIt2RUS9Ekctm13JxVGB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA5MyBTYWx0ZWRfX2c5HEsZB8XnS
 zMuPO+wkf+J2GAltITHyp1vqxS6NV1uGQcH4GwDhd91txnWy+NSObXN6U3nkPdJGTN7YV1epcNG
 AMBIFgeionoOOnliWlQUm7s1Ow+CryY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA5MyBTYWx0ZWRfX5VemKyi/2K3E
 XQs3qXmfU1U7sK6x7/uP74nXc2Rt0uplMZobIdeQ0GtImypz63ryZtOKY0ljg4eOij3A1rg0Cj+
 BPWEWC3+h0XihmgxzQqvCxeiDm/6pagLWFi5kjKPkG3JVjbgwyqMZ4rlk3PrlmnoM005MfSLKvg
 gWTW+xyGQOToe2PLufzH1gYfzMtiYUKZrm68D6HGW8d3u4sRNnWI43A1M9AdXtmuSAnT45qPL6s
 5V8CBK63yy3BGD5lzhDCyQRvNr9VhUwe93/XMMMs6zKXEkvej2LEIEs5ty6lpb/wSnWjppyohy2
 QC9+Jkod6v87yxSxafDjg9qRKzfPsL6hYvJvWIPpFeZsgsff5L88/CaZ6Ko9rmTdEMJLelSBKci
 antbacHeO5BH7Uo4LojGu3Um/MpFpi0gZR5JTp9MNIaafB68ocPH0Rt/LeM0uEjHnU0t2E3NKKO
 TEYihuktQcyLdQh010A==
X-Proofpoint-GUID: hMzBN11mmuIILIt2RUS9Ekctm13JxVGB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270093

With DMABUF_DEBUG=y, the page information is stripped from the sgt that
we get for an externally allocated buffer that is dma-buf imported (as
opposed to an exported GEM buffer that is re-imported).  This is a bit
unfortunate, since we need that information for mapping the buffer in
both paths:

1. Userspace GPU pgtables (TTBR0), where we use io_pgtable directly.
   Fortunately this we can fix ourselves easily.

2. Iommu managed pgtables (scanout, kernel GPU buffers (TTBR1)).  In
   normal usage that iommu subsystem envisions the dma-mapping and
   iommu-mapping are combined.  We can't really work around this but
   we can stop trying to pretend to be a normal iommu user and just
   go directly to the iommu_domain_ops.

This all depends on being dma_map_direct() for the dma_map_sgtable()
to work.  This should be the case on modern things that use arm-smmu.
It's less clear when it comes to older pre-arm-smmu hw.  It's possible
that this series causes those things to catch fire.  If so, look to
commit 0e764a01015d ("iommu/arm-smmu: Allow client devices to select
direct mapping") for inspiration.

v3:
- Fixing missing tlb flushes in error paths harder
- Do a single dma_map/unmap_sgtable()
- More paranoid error checking on map path
- Link to v2: https://lore.kernel.org/all/20261027152821.51144-1-robin.clark@oss.qualcomm.com/

v2:
- Fix missing tlb flushes in error paths
- Link to v1: https://lore.kernel.org/all/20261006131000.81501-1-robin.clark@oss.qualcomm.com/

Rob Clark (6):
  drm/msm: Cleanup if pages_to_sg() fails
  drm/msm/gem: dma_map/unmap_sgtable()
  drm/msm: Extract out map/unmap helpers
  drm/msm: Convert iommu map/unmap to helpers
  drm/msm: Convert map helper to use dma-address
  drm/msm: Treat !mapped as an error

 drivers/gpu/drm/msm/msm_gem.c   |  93 +++++++-------
 drivers/gpu/drm/msm/msm_iommu.c | 210 +++++++++++++++++++++-----------
 2 files changed, 184 insertions(+), 119 deletions(-)

-- 
2.56.0

