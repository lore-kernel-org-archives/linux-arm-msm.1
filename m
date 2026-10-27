Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114909;
	b=h1ZuiKasAdYBeEjYJ18tHCc6b3xfAsb2YKL7Ktspn3GmUz8YiHgu81yCgww3xE6cI3Dx
	 BenOVovcU+GnG/HyTbtF1MfK9WKvSwYqHCKQj3e3H2RIEcPwBFaZ/BL8WKHJ0/Nup6Sue
	 zdN10yukDW61NGgnp3sEKD7Sc1Az/p4+epzWT5xi1vKKMh5jXrhiBd7Y8xyEIuUmH7wIA
	 RGV+ichrrFhgJWQnI6h5nGo9Sjj8XjZpa30SWi6p0wxJtl9psZx4g/VMNevTdCmf/5d6l
	 mf8JtxC68Li5zgDLUTRC+pnTcUfvN357ZZJJp6P6fQNrF8Fur/9JRSaX2brc2U6YU4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114909;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=j11pQ2O0YT41mdxr21xy8gY+VUqxGKTMnbtrD9kSBmE=;
	b=YbSJBpiqw2ASNKrpPe8vk014gNyNatJp7HD6zxYWLuXF2rOA1Xi6+jtahZLwfQO+rQRj
	 pFYu4Kd3QOB+WisQ8nr1sYa3B5U16SvKPrbAHkjMOmLLI9LrEFrO+tBUkI+eiQ7Jk2pGY
	 LI/1TDiUt7lE1OxyKeWqwsR4O1dTgftTl3evpPKHXaRI52y5WiQd7YGlt64LRirXpssCR
	 chwYALHw+2dgA9Kk57azpOpPnVoX9db3yXOFwWAF4UhFJD+5oqzPSgpQGhZCD6clfVl1l
	 PwxXh0BtV/a/eFIyvSxGfkCELMQ/kgJcRJUIr6GKSHgCTx/Zn+9R2k509xnH/gYmTFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lBy+oZfl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VJLKqphB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B45606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:28:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85B45606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lBy+oZfl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VJLKqphB
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFLKhT2563149
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=j11pQ2O0YT41mdxr21xy8gY+VUqxGKTMnbt
	rD9kSBmE=; b=lBy+oZflsvqtslCvzxtqG0c4xqH7dnJJhmMPkws2GM54rtmXjgc
	rTmyT0qxzT1t5EYzEkX6wjtNSg/Mhm4C/6WkBi55R4hnUhbqGE7+F3XGvfKXtaRo
	02phNg0ttJLlDC3fMAgYq7TXj6eMBnpBOfY6Au+gJBv94F2gbP0Yjn02q8rG9Kkb
	D0x0aLsL14PzGcI0mrhVOyxNhqEWOQ0Eo0bnA+kt5W7LRX/mFND5t3JbHCz/OaZy
	eOPGkQpU71kCwarIs4Mfpt5+Uh130y6mOl6iLn67RloI6bap3dq5uRTe5KfEzR53
	TkLwLc06N0IrPcw1ZY8y/lHFlFy/0i1meHg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjfavukwg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:28:27 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a01e2962a1so8028b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793114906; x=1793719706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j11pQ2O0YT41mdxr21xy8gY+VUqxGKTMnbtrD9kSBmE=;
        b=VJLKqphBtJEnkJYionBOlZEH2eCXiXkmAI8owrz2buMC5RbL7TC6W2mPYvSp1scYs7
         /JKeayW2GiE3v3VGB+0H6o5zi5j8lq5xbH0w8OerfSP9z04ZLdTK8TE3rk2CblYcdBLt
         xPL2ifWhlySwWIsGYL/SloutRK/xkqc3swDRC+UN5VBkM2iJdmmLm5GXvZyJYXZjOSu5
         bR0Z5FI6jnf5+ngJZAyEVaNMdBO7AMXhwOsg8BZWenpuTYTevhR18vEBqwSMLaXLoWwu
         QufCaLIqQZHyB2sb70aiJ2F9Tdu6PmEIrK7bxbzkAz0aDdfMYfGoW5pZyqx7V9fmEpvl
         8lbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114906; x=1793719706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j11pQ2O0YT41mdxr21xy8gY+VUqxGKTMnbtrD9kSBmE=;
        b=azxIoBBGYCBlC5lh6t6PTNm1S5rQf/pw8jfIMqjmhTxLiazqiVquKI6NFawRtm/5nZ
         RjvvGNX7Ix+1Zw+gaFqgpW2x6F5Ku06V5JqQJImF6zpO85oxerj4jlQIzfbR/wfHqKvO
         SYxR60j79bgozHnvE3z2KAVb08hbzFFquZg5D2nhzNZQLz0dMXAIzphhxtrocp3lucXe
         QZSJ5TQA8ds43D/rk3kDgOlFpY5mkHnJvFdJiQTSPp5S/2VKYxbCsRkA+wjSJ2hIvh7a
         VrOAI10ZqpvzfyhmBPAfVMyWdGNpERpEWpvMptqsHvfhfwuHUu8fLdI+T974VtehEjr2
         gNsg==
X-Gm-Message-State: AFq9FYIJNyo+uYcZNmB+fDTTgxcigqtUqSCoBJ+BcxuDYx+lGfUAfsBR
	D/9M4BhusT2rX7tdJzDJqX03w5hHqCvBY5HtbSDzSPmuahEoNO6OFE3InJ2knVV3j6e9+Wfk0NH
	QX5DaTqjMmGPAP3wpQ+yNI//eOJeA+WsMQiNZBOM/LHttU7h5tmKA2/WVjcuDErdqSG+j
X-Gm-Gg: AYBFou00bm9wS93XrT8u7eRUyNgbRwYujZVzdpfmNlC+6ycLZz7XiD4UEqyRKziP+4P
	arv3SjWWuzIRRdsFVB6fBUwZ76kPZpHKUMs9RtWlJUh5Ph35dpU8q1bJHlZof8/hiUAVSt3WUt5
	yCRkaSCDwBL7PAGxCn6SQjHLSg8yK15AzGzjJ7ap2HKUZcyroR9q2T7NeBD+7YRqZtLFhQ7P7Ql
	iUxS1JttwQZtXv1H9PZwIEiUWz4qMKecEdFDEAFrSaX/mZ0GqionqL1H/RsJpBCVQtxa5l73ipT
	CwHK7E+9vZGTTjhrQlLboF/m2R+PJ+hzoAkdnA3aeH8cN+w6iU/ov22mAklhV4WKcnbOjZZAH5C
	QWTGmWFWThsIid5wpbz7lnIeezcBGCAicuE8AFxWdLqQUYwcYF5OejPaCf0jgLBYlwTNIbl9/vm
	PIIkwS47P3VncCDeYQmsWggVM=
X-Received: by 2002:a05:6a20:9c17:b0:3e2:26fc:2e1c with SMTP id adf61e73a8af0-3e7bfa9cea9mr7731256637.39.1793114906393;
        Tue, 27 Oct 2026 08:28:26 -0700 (PDT)
X-Received: by 2002:a05:6a20:9c17:b0:3e2:26fc:2e1c with SMTP id adf61e73a8af0-3e7bfa9cea9mr7731232637.39.1793114905906;
        Tue, 27 Oct 2026 08:28:25 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdad33b99b2sm985434a12.26.2026.10.27.08.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:28:25 -0700 (PDT)
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
Subject: [PATCH v2 0/5] drm/msm: DMABUF_DEBUG fixes
Date: Tue, 27 Oct 2026 08:28:14 -0700
Message-ID: <20261027152821.51144-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: 7BF3PjZ0T3vhh3FtP-81TuIwOZ6ZhZ2x
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MSBTYWx0ZWRfX9nFscXW/M2sr
 GgO1I3fy8MIYGsh/sGqMTFUNk0bQw7jOYPT+Og89zcyWKRZeBJahHLgOmKsaK2trwo54e6qQnou
 XsAuAdNG8Q2Bh8o9gabsqujC2pvmvpM=
X-Authority-Analysis: v=2.4 cv=EIeTQFZC c=1 sm=1 tr=0 ts=6ae0c31b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=puu_XB033Gd1UDA3wS8A:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 7BF3PjZ0T3vhh3FtP-81TuIwOZ6ZhZ2x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MSBTYWx0ZWRfXy/nOZkuv/TFc
 cBAeLVptnATBGbIVaXz0xiXth+s1dnInhqROj9gH+oPeMZgjYBb219tqugKFBxGfC98D1lA/yvX
 ls3EeW/CKTU4eGvNJeuJEo4EsJGnwr+JKfhKI/DXtJabjzVSk7GPidkX7FeZp2oy2CrttNBsfQP
 33YNWwJcR5TkbHoSt+5x7iDn0/wrxuou8W459Yn4ChwMwqN0hYYXWjwnpxBnQTlzdgfDlcdF4YZ
 CCqt4X3k2obfYV4yEPP3SFyvzWynS45KnoUsvh3WPIR0IpSJHia8smQPo4v6/02GXc+JLLDVarh
 QVrrXR/SHK96TK7wsZBAX7mK93m1m8ep7K8sAlO1DQy3jDABlzckKPO0gBLpu8EHeEheuxXJcVw
 fUGbYn6K1PV7PHH1RNjF+XHTa+7WeKTfMrMam3HMQ2S+9artiB8F/UM+uqONOUaFfxzGt4s2OpA
 mhnJr8+5rM4kaWuXHUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270061

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

v2:
- Fix missing tlb flushes in error paths
- Link to v1: https://lore.kernel.org/all/20261006131000.81501-1-robin.clark@oss.qualcomm.com/

Rob Clark (5):
  drm/msm: Cleanup if pages_to_sg() fails
  drm/msm/gem: dma_map/unmap_sgtable()
  drm/msm: Extract out map/unmap helpers
  drm/msm: Convert iommu map/unmap to helpers
  drm/msm: Convert map helper to use dma-address

 drivers/gpu/drm/msm/msm_gem.c   |  57 +++++++---
 drivers/gpu/drm/msm/msm_iommu.c | 190 +++++++++++++++++++++-----------
 2 files changed, 165 insertions(+), 82 deletions(-)

-- 
2.56.0

