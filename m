Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395978;
	b=Yk0BEdyJ5DiM4kAOva38aQWr3wtb/kPmcTf6CGneeyPeTrscQU24ak1S4Ncq85/i+PGk
	 7GcWVbizIzMIOUEDiOYacJCeAnishuyQTs5WAfTK3hk2LUMzhMh9NAqYRuL6yZ6/Kld2+
	 hj9xWIstmdK1qUlRIAat5OzjD6ymvGnnRSIMWHQ+4aZ2XCffaHNg21jBmqeYwb1b+X3aP
	 5/odPOF5ipZ+ye9w5PILsIHFmoWUcW8IbwgEZ54Ebb3g0W1DTtyBJMC0Rnet9S8HRmMvm
	 JSPW7wu4VzoVkDgl2/1bK86iI2r9t23McgzE8UOU6Pf6G38Sd26o/HCYgab5h9pkqnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395978;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=paS89U6ae6+JjAm7XDJVwYgoty+ZJJfzu7sx98FlssY=;
	b=DXgz2VSCSMlQXwtJF8jTJzknGY9WQ3SarqFuMV0xJBukM89JenhXhRbUAA1zJQq6lQH9
	 iK4iIv6TVMqd4R7CchsmpM2C7Nhm4e4hmI/tQGkVzXhRoOtkqlAFP/ZlYTPtQanQUYRWy
	 ejaVumH75qz6abWQFaE5oHRCw5XqXg6P4h/0qtURK4sec3QtDluzBu25p7JlzpTZBbndc
	 MQyZDyeJDCGPk/18L4NavC86IYS/Zl486wOEw0Pl0FmYt6fRCCvuby+GUZqWoEjk827Hm
	 9lEvgRgAsgrXDd94SRW1ARADEqAKJPobbSJRQ3n6OC9iB/5E/dEZcO2P4AQxBv9dSqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YI3GF1n0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SoTWyd70;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E9E606A330
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69E9E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YI3GF1n0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SoTWyd70
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULAjc6202220
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:32:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=paS89U6ae6+JjAm7XDJVwYgoty+ZJJfzu7s
	x98FlssY=; b=YI3GF1n079bAY2C8ujlc8Po/Y3jsVu6gXtBMHCDwaYJgbTCKOwq
	vP31L01GlI+GjcvFCTWgzxfn324og+cD+s20RI4K0S1HAN8SX4e9EIj7VjkFoEff
	rAZrCZcRWxRa9OH2MobRaGCKphCp/JgPChiZmMLTUW4Upc8rXzzbueTw9nUnI9/3
	BDDR9ohj/DKvo32alfb4KPvpqL2FQhf4SA4UFawF/Wmg5VXg5ZLUyeOoPMs9HwjB
	VX+rhcNs6LK0fwuKpdCDb8DWTvRq8m93yMPcJap7wkdfRZMO++GFH0wnBigZ0gsh
	BtltwK4OZmZ/SM2sa6iPcx5me/tOtlfNTDA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x0g39e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:32:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3abfcf726dcso1535170a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 14:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395977; x=1794000777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=paS89U6ae6+JjAm7XDJVwYgoty+ZJJfzu7sx98FlssY=;
        b=SoTWyd70Uu8G3L5iHParACLiuiThIyEmdqgYZXuO0Q29CEidR0B0nmK3iHCbsvs1/T
         mxYnWJNbsz5+xMFc7JAeagL1mdgVIRblNC+Kgk6uSppbN3EiHFjLmBjClomncEmACvnN
         FeON9XKD0ePa1A1YwDjC0WXXQJlU0UWSwMkbBt45g+6f9LpFlkO7HbuoI4BUi3IvN0T1
         9A8dIgwWMjCfUEgBAw965mEF4ds7H+NgVlCyBFv4lI0SGFVJeRq5VlPQrDYx5nTV/EEr
         MTDrbhIf+u+tDYI+UEofWLsD5M4wqtnuZ/AfSLt1wb1Dr5x1Kh1la7cNjXx0e6il3Oe7
         ZIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395977; x=1794000777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=paS89U6ae6+JjAm7XDJVwYgoty+ZJJfzu7sx98FlssY=;
        b=Ds/NGWwGxSlKGkkUCbow1PFRCFj7xUoIiOa2hKz5pK9qF3x99Dnb0ZVkOj0YoFH4lv
         /OFB7AvLWBMK01zGrfdTPxdBL7VqkEma0GV76sZRZvrWNwb30NJ8xh7HNBo+icTvylEh
         PfY/8awU2llGT4IJRvg8eDFhy2oWqIpRL0l3V2MPn3y4y2G9Oz/wK3iysCwjTHqwzNaF
         cj8doKlgIBfIw0xCVpfrD74XOQEDc5OKzqUcND0SEgJEE66dyivhGOzEWwus2ZTDrrb0
         G4HtCnaa33Btl/9uXdSVQD5WbvRT3lXDoOPYMxwFPNTwCnfhMRmz2n/zEZuNHaAavYsi
         mvRw==
X-Gm-Message-State: AFq9FYKf5HunI81oSNxJMNgl5cPNLsQDAAMjRg5V2kjeZck1Twei3Izx
	ygdiAJiG+jiI8trRkNc9EAngitTgUA6w8thW952wnTwTK4gmQHIFsNuw+GhALZhJ/j3iEzkIrdi
	S+UokECqA53z6R2RwxYolIyuXsWSXLP28djYd4c7SLtRYNiyTJQs9m4zVJ7oO8Oq4mJ9q
X-Gm-Gg: AYBFou2sPj+HW6b1opSrwpecRoQO6ikD8P0Go+1S8XRa1GZsXpmOsnI+dll78B/BNr9
	7/jGKhDbvxN6X5hIcYxsMHttbanpx0e6nG3gitDLn2AliyG1N8vvsNSA58MPdBySwlEf+lxTElw
	Cb/ocKrWGLxQ5cRCVBKZCDuSnMmkwpYP89ZbXQbbma719ZD/JL5Ugh+rRfi9iC2Z5kFHbnjAGFy
	DIqMNxmK26uoxq9dZJolIRbpFQfNX51K5P1mwutIqZrSPFrHZnGwyoF0kSljAwIx1iNFSbcPu+0
	n/zUW40/1fd/1Tewre4Dy65Db9qrMCpyzrYWlEoVQOVzRzibVMtvpPy0MW7nde/DPEqeQSgPWRs
	hrAilprKi2OonRwuI2ekBF/5Qk1iUWzkIAftKIDmyuYe4TlIfeQLlIIIXP4+ewIr+MhjbvvaNja
	/iaogyzJSkAqXpJs3xZ8545A==
X-Received: by 2002:a17:90b:28c5:b0:3ad:ce24:acfa with SMTP id 98e67ed59e1d1-3ae897c652dmr2778878a91.20.1793395976804;
        Fri, 30 Oct 2026 14:32:56 -0700 (PDT)
X-Received: by 2002:a17:90b:28c5:b0:3ad:ce24:acfa with SMTP id 98e67ed59e1d1-3ae897c652dmr2778859a91.20.1793395976351;
        Fri, 30 Oct 2026 14:32:56 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8454327esm5313128a91.4.2026.10.30.14.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:32:55 -0700 (PDT)
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
Subject: [PATCH v4 0/6] drm/msm: DMABUF_DEBUG fixes
Date: Fri, 30 Oct 2026 14:32:42 -0700
Message-ID: <20261030213251.55365-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: Dk4U8yBdQDwFHtpmptmf8zGpHmL1OJUn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfXwadEMTum2Wi5
 wCKM0FeUnvp6QjyJ3ECNEHQza0BKEzJGDN3bJhxNuewhLs+h7MsxYFYeV7CqPOH+8RtZoTEOLhi
 uTYDti/lIvg+2koS8SMC6wI0uS+BWHg=
X-Authority-Analysis: v=2.4 cv=IpyL47/g c=1 sm=1 tr=0 ts=6ae50d09 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=oIYrXKFyhTD9TMpG1_EA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: Dk4U8yBdQDwFHtpmptmf8zGpHmL1OJUn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX0QaIybmd8miP
 mU7TAH2AumZOROCU+KTb2oSpQ87zEqfUi1SkO15qWNHLDjcKeq4Jw5vpjjlCWpQ8VwG0VaSmX7q
 Aa9G1W670R6ITPVZkhoNLhXcGFKQ6aM5zoi4lmFY8lWUuVUzHxZOjxOWHYaVMTxMJq5goUwioOI
 6kY7X+wxEFhoiHYT7x6Ki7wZyOwBMcNO5JVe8wvpK9v/jIceSy8GbM9ApY0Ro0niROui1BvGIaT
 DnfKMdQlC/AZG7KZuAFOxeXKqrz8jPX4vzPUCSZOuuqhJqUAOGfeEvuehnofU10/FwFXIWRjoOO
 WdDsQoOJvpRNgzdSNtqJVQwJ91Jj06qmvRXKKOTj41IGDyTLZNd4Fq09goxG1JdNbCHTPUDOTiJ
 fVNrjkNQE0jIEg5N4Vmk90WJYdMTUYyRcIVuE3HjchIJ3skoHm0ojrlsNASFPS+D4bDU4klgWdV
 MbPiU8cn/jZnWPeVfBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610300085

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

Note, for older pre-arm-smmu devices, this iommu series is a dependency:
https://lore.kernel.org/all/20261029212344.346069-1-robin.clark@oss.qualcomm.com/

v4:
- Fix get_pages() error path
- Link to v3: https://lore.kernel.org/all/20261027230452.130031-1-robin.clark@oss.qualcomm.com/

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

 drivers/gpu/drm/msm/msm_gem.c   |  96 +++++++--------
 drivers/gpu/drm/msm/msm_iommu.c | 210 +++++++++++++++++++++-----------
 2 files changed, 187 insertions(+), 119 deletions(-)

-- 
2.56.0

