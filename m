Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793309032;
	b=ojriIMwhDEaaxNXS1Was3quY/j+im55kgLndS7Rvbq0ya9Ne4k12DDE5UTj1LKFY1GLT
	 utBt29pLGZKLfsvJNf7qq8n0ZoQiFCM3u+HN9e6P/EYTxrrNlki/dDZvxEKZTVOADtWDK
	 5Q+tUABLnTJCtMADJ1PDrf92aCjnVtxffx77/4MTmfApqoGA7ukZqhMdbWc+zLKHvHjqt
	 5b/8Ek7gmykBNyid9I7IE/WQSk2OLPHcdVQIGveDSig9aQqbVJ7DIJYxKHYHNBiNTlRMW
	 gS647S5y0tVLRyS3r4ITxBGvw9tEj1i+Us/uTx7LPQjT6wMgM7/G4Xofs4cpiP0tybQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309032;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Kvbi14Ro2Jet/rtwBr/WGcCUE+sLT8/ztxkoluFqXzQ=;
	b=UDa3HFTlrY3w0bG/dWlS99/8zlXP53PkdM6mGCdwK4XNx17d+Dhm7cQEo+jsfE82M6pe
	 k3npC+11EzbI5OCLT6P+mS2y3YcEUm6zMZGbnAWwug590WbYrRxyc/D+YfmN0482oZqgG
	 NdgiX3PdFHMmWB69WKwXTdaN87kithry/OWRoPpkJXLMgw6CxPfX0/rRlVaz/n5jNavsI
	 cclyI7tXldpa2/hJHQheg6xzXGjXwEqHoIpwtaKjzc1GU+dnhSqqc2Un3GZEzfhxXugoy
	 ZIYVLT78hP94h52nuEZVxkHaubgvTwfaMOnlTbPgDw0q9X+wO6AuGdu8jzHte+FtjuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="juhMW/ei";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OKvEKU+k;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177AD606A31D
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 21:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 177AD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=juhMW/ei;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OKvEKU+k
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TJjTG81657149
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 21:23:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Kvbi14Ro2Jet/rtwBr/WGcCUE+sLT8/ztxk
	oluFqXzQ=; b=juhMW/ei599lYu0rJJYdPUNl7t3bA3+SKsV6j+954pbIu9Kj8eo
	Ciq6ohXOGQyAPNBqf8lCxt/sacTHwRTKTNXkZNYYxoLNqGU2wXydcw5IfxE5okHQ
	i0TPywtx/1Xb68BcgkEK5yA2AI8qMzmx3aumAVh3Z4wkXXMP+rGEg/KRsidyTFft
	Fcf6UooKpooD7wFPR0cEkiJSd6y+Tpgk+1c4eIaCGIjQvtiHKrBTDCo90B6F+YqG
	UoolplzT5fO0tfB6L7v4GIwI+yMuu6X54xZvT22B6coCxhlq7x0INmtrxg9y9NB/
	gIQ54PYY1jalU8w/LKiZtcQlO0pu+2snuTA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hmaunhs3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 21:23:49 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae73921fd1so36146a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 14:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793309029; x=1793913829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kvbi14Ro2Jet/rtwBr/WGcCUE+sLT8/ztxkoluFqXzQ=;
        b=OKvEKU+k/ViPDOQALWh/LfSmiDbVUi5Cuqrk56QhvkLMoAd+gIYS2xpuZo/La8FfwU
         K+ClGYA0g16A3D12/9FKg6TJHAtsk3rMq3ZNXOeCbVjWQMx7qYhLrPnWIQsvyIcReSpW
         ptetSGkkBeAzJmgMHRWwvH6VUf5Blv7kgZqkHPSKVSZZpjIGx93Xqa+VQy62Sxi3c3zV
         FVy7dQg+zGIZIWIGnXYjgOpOE/HNvtDOQ3bCS1Arqs2TM2JOGnJ5Ncot9m+wY1pnprhC
         rjaxNP1tcZbneVn+Sv6fPN1pVflnqVtBVvJqb1pAXr1EcfGTuSwF96lBAI2x0AcIkp0s
         i2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309029; x=1793913829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kvbi14Ro2Jet/rtwBr/WGcCUE+sLT8/ztxkoluFqXzQ=;
        b=zlpZSkPK6fDZ3Ei8fhYhOGyS/EGjcH80dTCdijQVfQQUuiUj7m7E9voyo0PxGLi6Nj
         4DzojFCjpExYoxspaRd5p6xLQOrsOojZIxZpMl90SnPKXyeeUhqjFsP+YuktEoSVgaS8
         3hZIY4vCeTGi/yDMQ2TqcI69HMWcBlXFmyPxiw4VPG53g6xjCiwwfFgbo5nlNYqkNyeg
         Unowhl74f9Nud6em9T0fpB6Cfi3jL1mYcO5fK/jBZ5YIsOJCTALdjC/aYk6BPGhZTPy0
         V/Oj2gNHVOwxrGFebzEHzZvK/y0kZNipP+it99SRkmoRJqDxPnRzkZ/IALVhJtTo69U2
         NJ8Q==
X-Forwarded-Encrypted: i=1; AKwUvBx3PGbgYCas1tOUwRRMvWLtIuLXgKZFhhJV7d+i5sCZswS7j6YKfdg8BOdkmW3ZihDzdyq4T6717iPhnRoS@vger.kernel.org
X-Gm-Message-State: AFq9FYK78VnqMflfne8pcm04giw5pmAyDMk+wKB8P2s+Q+x0zm4sesDo
	iKnalDDUSBlwoNg9KGD0u6WizkiiuU6akvo0ObmLQhqbPxT/dpjbfB2fNu5cN67QO+yXgDRafUS
	5piLicWzQ7yo982ng9pLiCn55+VpmO0BXYaHGcgmcpaVnNSCNeuhu77sIDNFfUfEVdRDx
X-Gm-Gg: AYBFou1+ZndGmedN68DZX6TFiPh9bBc6opeBENWGDj+FDrou43UxRswmyqLQ4/VwgTL
	uLSsMUnw4TjLIYVT7LG8bgIHP+ulsQ143RLl3LNawMAHKfAjbmryXGQkMz9swptDFpPqi1CDZ78
	Aub9IaeYjHqd8dkSF/oLWYRiVnEksblzheo8F5AJZ83mMc98GCXCF0MS91sjzWLra443UJY3QJL
	mz/3i3NZ+QNdX2700mBRo+F1P2yi+7ZjKrWKbDqYq6S0+OieC+0W2bhWT0p+h2+dQ+oH7QwmCUJ
	gIkvzeQ7keztFYIzJFz4t8gbns2gqncdlfeyQJiPeY9YGMxRITluY61UV7gnTkg9P8XXRd744XB
	SUdh5oLruoron9sEnfFgsXrN713NiORAbbYi+PZ+ALs8g8HCt+8nl0kqPw/m2sxh/gsoB+HWWXv
	vxaO6PFaRTPqb+VfjAnGaJxA==
X-Received: by 2002:a17:90b:3d4e:b0:3ad:1841:6f8b with SMTP id 98e67ed59e1d1-3ae8981e41fmr175462a91.37.1793309028762;
        Thu, 29 Oct 2026 14:23:48 -0700 (PDT)
X-Received: by 2002:a17:90b:3d4e:b0:3ad:1841:6f8b with SMTP id 98e67ed59e1d1-3ae8981e41fmr175434a91.37.1793309028255;
        Thu, 29 Oct 2026 14:23:48 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e99b267sm5559785a91.14.2026.10.29.14.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 14:23:47 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: iommu@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
        linux-kernel@vger.kernel.org (open list),
        Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>
Subject: [PATCH 0/2] iommu/qcom+msm: Use identity domain for display/GPU
Date: Thu, 29 Oct 2026 14:23:41 -0700
Message-ID: <20261029212344.346069-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: oPT4_0wFSI7B0s8eLRgW3cenDhfMbT53
X-Proofpoint-GUID: oPT4_0wFSI7B0s8eLRgW3cenDhfMbT53
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA4NCBTYWx0ZWRfXw6ybOtZPIPwO
 b2Uq9SyXOuXbaMdURvMJJlNElCqQXFfG1Pwc+nTBfwE90XazwSOpPLxhkwD9UCUcsRuNB603SWH
 WtICRwUuc6ZrvyXG5pMiAwpMnauVMaF/0sSbkoDWolytH3Obt2CbZT5jORWz2x9dd3YFQQKO3i/
 3HCyxPCVt+foKrR4ATCh9u4pvzaa+5w1iuBLw+8PosXX2lDEWbjWToy1NROfVHh6LW1YXCdDqv9
 2UKBXs/ZHE+omYpftXdspsrFIf9bSvDVUtVbQGwuMxOJc3ezEvg4rJkAwKS2HyXSrVbafAVLikb
 63cDu5zS3gDrvtY7UCHLC3y2RjQq1ct4gASat0xfQYKw8tuFlEVLlN+t32ie4b0dGCJdROTrgzS
 jp026wscnDi8G3d6va1hZfxERixMh80220Sko2d0y8Z7vlLWtwW7TtDO4MgIIb0FWrp3ykFOOxm
 Kl2wPZuQ5oB2c0qidQg==
X-Authority-Analysis: v=2.4 cv=It2L47/g c=1 sm=1 tr=0 ts=6ae3b965 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=e5mUnYsNAAAA:8
 a=wtkIETcKxqgH55doulAA:9 a=uKXjsCUrEbL0IQVhDsJ9:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA4NCBTYWx0ZWRfX74LSDMd16+0+
 8ORv2Rwdwp+kuJYPkWxEFStyG2T8wJs6nxfIBiWjuz1vYfYEuDqQKAf0JORbAebanYjD8txUzY6
 pbvkRGkE7+E4crl0iysXWO0dW9+lsvU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290084

Similar to what is already done in arm-smmu-qcom, match display and GPU
compatible strings to pick identity domain type for them.

So far, we have an "evil twin" domain kicking around after drm/msm
attaches it's own domain.  Until now, that has been relatively harmless.
But it becomes a problem with [1] when we start using sg_dma_len()/
sg_dma_address() for setting up mappings.  Which is required to avoid
problems with CONFIG_DMABUF_DEBUG (dma_buf_wrap_sg_table()).

The first patch is at least compile tested.. msm_iommu seems to be
armv7-only.

If there are devices with bootloader splash, we may also need some
work on qcom_iommu_identity_attach() and/or msm_iommu_identity_attach()
to put the context bank into bypass instead of disabling it?  Not sure,
but that is probably going to require someone with such hardware at
hand.

[1] https://patchwork.freedesktop.org/series/175619/

Rob Clark (2):
  iommu/qcom: Use identity domain for GPU and display
  iommu/msm: Use identity domain for GPU and display

 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 18 ++++++++++++++++++
 drivers/iommu/msm_iommu.c               | 16 ++++++++++++++++
 2 files changed, 34 insertions(+)

-- 
2.56.0

