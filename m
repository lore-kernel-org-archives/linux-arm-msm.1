Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EE7346782
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 15:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790954996; cv=none; b=ejBcX30OvhbZGAIBG1P/SNiypfs7Ir+fz0JaxedQA4W6ifHCdBmHOXq3T+LhoJKCnHgNlwlp9BMUUa0evMjNZO1EVhVa9+vtmxpPmBzydcSS/0+eyxcLoztS+g4ksLXeQXIHkBnQN22uOg+b/fTDE1YIEfGOUrqp9WSR1/q5/UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790954996; c=relaxed/simple;
	bh=7wVZVFOBycVl1QiQwjux3Irgkh9JqIpG/CXOG7dWK5c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=B80D+yt5FD2CGVX0fx6qlsMw9E7Rqu846PuIbq+7o5lnOsh3wnQBxB2GICm5wLTxCYAmp1Ui2V5GCgT99Rprq2DOLVOvOF+FJJjH7wJMOHyOqE7X5PXPj2mog5xji9TQeCqwuQauKu15aV8WnqhfKPu5gHtWCg91YS55LCWNSV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XyEBWpa4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fbhee+dm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XyEBWpa4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fbhee+dm"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692FGik82822856
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Oct 2026 15:29:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bkw3YBDFOEu19kurF50MpC
	Nfo5r6r28dnJOjgI9UeiU=; b=XyEBWpa4Rrb8sWpYcBXfcz8Y1Lbyv46i9ha8nI
	j54XONTTvjuVyDH0/0+lUmF79hN13PhjHzu9f++0YmBMOZEk9Z/a7v+n2i5DDaJh
	N0UZ3QXKnH1dvJWctZ0x2qesfTuiELtTg7R9X6J1O3XPAEyfO05ckYvEQYaCEvBz
	XHHK/iFcTD1NlD0EtVpwD9Cg1SGPMxL0OPjffJC9wy2GMKvKOCy3avQOqD+4wONa
	tPA2/8od2jprdWteECQCjHbilJR18tKtGzX4n7zjfm1+u0UBLHS6WbpbjyMDOrqn
	kH6evzH9QE//7cO1aO9h/hqXJJiffHHVWC8YZF4zHKCPW0lg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h26bp203x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 15:29:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e2e7d08ab7so25989585ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 08:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790954993; x=1791559793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bkw3YBDFOEu19kurF50MpCNfo5r6r28dnJOjgI9UeiU=;
        b=Fbhee+dmWSTfSdUZ2csFFXAvutwQ/4w0wrgARlBk4sC74lV1rP/JFiFcmAMfnNfWkQ
         JNUHfWZG0O74U35xx0FiPPE/+njcVII29X8nE1XfmF0x8OLmjVXYGKhOidrEfwLeq3ii
         WP2Ima5gYeydeZFkqhOHiTz6/tZm2Vb2VKXuOXspH+bpmNjHBqKWQDGGhpLlKDABBIGP
         e2ZLcfDTuut6d3CUbZvaMr+lgHYpydT2BLsltHP4zCMXd6yW1HhbaW1v4dw9Jkm1bsun
         T6v+H7vBaN22xxLCLBI5uON8HrbqwJC2QNQ7wGonrl9VlTX155/p9h4URrwyDhRKlJKs
         IhjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790954993; x=1791559793;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bkw3YBDFOEu19kurF50MpCNfo5r6r28dnJOjgI9UeiU=;
        b=mlI9PAfqTu06JKAQ311hxanUDyuWlKxWa43OKd6OVg8IrV68JM5+4h3sHIrFFYs1/R
         h8rU/7eFZntwoTveF6d2LASIsTegwXxdNfQkvFeFsjvjrCVpJKQ9epIj5T5fchJ609x9
         ccublIr7BgYGQ9GQPtOpue6HB6SBTxUoCfeGuQ97GCm4hwmQvVD63iTnp0W9PnwfyTEo
         bzGJRP5GUfS/wmJLwuX0DcTkR4F0MaHTS4aY5dvmiz2FoZPuJ3aNNrgUCcuQioO4zzoZ
         oL0Rez1V3zoBY7vuzf0c7793DVIAnI1GXTyysIAH1DWIp6mtZSNpiygFEtIZ+P35rWK7
         0Tqg==
X-Gm-Message-State: AFuF++kzYVru07Wa6LB4EHGNRzWamXyJyGZattFfrrMcdK/W/jvaaiMA
	33Z4OD2DEY0TzVg6tttAn2a2sgsJQjJaChlvH7ezPx1WiENSUaAkb5U/dT7kHo1rebDLpAc8tPD
	+HPQs+o2lAQD+LCBmHw2xOlRAyfujQ7Q6m5NYNqC37tFQ/tOtD/hD/gqedse3/2eZsk0V
X-Gm-Gg: AYBFou1wBzex528bR6cT+iwDaKXJ4ISQxmqtKb0cANIGzjDHqxAI0CgtVqlCGoYFZiK
	HSTDGdbdl+YfxyNVkuCbncGAZG/WeTOfa0PI9Sfp05yBAT1WxH5oKUjcy1aBGgm0hMApqMuGGVT
	mKWwrOkV2iLOc/bMXjJJwFduSgp/q5pQrHnO6dgYwrIhyMaHBRjsJlv6RswR7NEZo79SlNobDPb
	DI6BBvylkYmhtzI1fE0UuWIlYjfjrHkt2Syo5AoGPp+TWJk4IEH1BPUEG/7beyBDrBnybPMLlKK
	JnHA3L4g2P7v6+Yy29ovlPOKc5dH65FIab96c5HF6EzriTQHNGotraFxUYQ3F9Yz4MAAbrMTJLn
	0b3bJHarDDySxVHhArbm9WFCiz1Lp0MJL+oM9qpmCg8UxQiU=
X-Received: by 2002:a17:902:cec4:b0:2dd:c100:b2cc with SMTP id d9443c01a7336-2e49b807643mr24166955ad.55.1790954992685;
        Fri, 02 Oct 2026 08:29:52 -0700 (PDT)
X-Received: by 2002:a17:902:cec4:b0:2dd:c100:b2cc with SMTP id d9443c01a7336-2e49b807643mr24166545ad.55.1790954992174;
        Fri, 02 Oct 2026 08:29:52 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6ac12esm9644065ad.41.2026.10.02.08.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:29:51 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jianfeng Liu <liujianfeng1994@gmail.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Andrei Kuchynski <akuchynski@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Hsin-Te Yuan <yuanhsinte@chromium.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Johan Hovold <johan@kernel.org>,
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
        linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
        linux-usb@vger.kernel.org (open list:USB TYPEC CLASS),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Pooja Katiyar <pooja.katiyar@intel.com>, Sean Paul <sean@poorly.run>,
        Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH v2 0/6] drm/msm/gem: Drop use of pages for imported dma-bufs
Date: Fri,  2 Oct 2026 08:29:37 -0700
Message-ID: <20261002152948.85308-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OMqyTiaB c=1 sm=1 tr=0 ts=6abfcdf1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tIciJ6vaqEqC_qAMQbIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: IV_ceVb3owhOJttuXsMlYslZhGz9dfhy
X-Proofpoint-ORIG-GUID: IV_ceVb3owhOJttuXsMlYslZhGz9dfhy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2MSBTYWx0ZWRfX0t6l5hXNrsoY
 HDS+n4zGkOYknrsAiwhwDjJCEzbU53R5VvWt/Xkbs4T5/2dYsURC39vzk5V3uPxYRRDsXPVBq2e
 jz0Cyp0/+BaamdXP/upHNsMwGZ7HYgI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2MSBTYWx0ZWRfX2I+sta/CY6gz
 zM6LytSLfCfpR4YD69Fdh2RZgnLAz01QxANm0GUkpU7VbQu4x5QGFFAhyw7MnDhKTeDaFke8agW
 FF0FBpVNJqGPyZS/FcZC03dHCMYLm41lyH8hG6V2HjfgGe8i5dJEsKnwkIaAQUh/QRi/4cpXuf5
 LplFx4hSsJZhCxxpaab+S3OLKS5rczIIUAAtdAR7WIHnSSz5C3C6KZpyJ5WaSXEV1HhYt1Z1SYC
 mvAfnULGt6H/piXUbWcw5fQYUPjnkTtrXibZox+J+rA5sCylTiGzogpWgHnjDoIJqs4Ci5tj6QJ
 CrU/lydvl41KD06ldeYu/8Ff4axgP4XTPavQSTK2jF8B384is/ueh4+iTwsuIIwAMSybWHVYauK
 aEgQV4tbtIuacBfF4hhf2m/zj1neWY7i83yw8N0QEeieBaSnHyHLoGjL7kIqgnrNBULyy1l0l4e
 RprLXip4bQ3aGQo+UeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020061

The use of msm_obj->pages _mostly_ served to mark that the obj is
resident in memory.  Mapping to the GPU, etc, all works in terms of
the sgt.

The exception was the fault path.  Resolve this by using dma_buf_mmap()
for mmap'ing imported buffers, like we are supposed to.  With that and
a bit more cleanup we can drop the use of drm_prime_sg_to_page_array().

This doesn't solve the issues with DMABUF_DEBUG, mapping to the GPU,
either via iommu_map_sgtable() (display, and TTBR1 for GPU, aka the
kernel managed mappings), or msm_iommu_pagetable_map() (userspace
managed mappings), still requires pages under the hood.  That will
be harder to solve.  But this is a step along the way.

Changes in v2:
- Drop dead code spotted by sashiko in 4/6
- Collect tags
- Link to v1: https://lore.kernel.org/all/20260926183051.25754-1-robin.clark@oss.qualcomm.com/

Rob Clark (6):
  drm/msm/gem: Add helper to check if resident
  drm/msm/gem: Mmap imported dma-bufs via the exporter
  drm/msm/gem: Use get_pages() directly in vmap path
  drm/msm/gem: Stop exposing a page array
  drm/msm/gem: Stop calling get_pages() for imported dma-bufs
  drm/msm/gem: Drop use of drm_prime_sg_to_page_array()

 drivers/gpu/drm/msm/msm_gem.c       | 107 +++++++++++++++++-----------
 drivers/gpu/drm/msm/msm_gem.h       |  10 ++-
 drivers/gpu/drm/msm/msm_gem_prime.c |   9 +--
 drivers/gpu/drm/msm/msm_gem_vma.c   |   8 +--
 4 files changed, 78 insertions(+), 56 deletions(-)

-- 
2.55.0

