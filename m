Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792636541;
	b=yRCMdQf1De8cfWqo20L7+ymS00jglkdNVi8nwqkU8T+nV/9YA0bwsonaInLk/WYQYdeB
	 FdSdiJ/RvAs49Yju9Ou9ad70Itt0TmkvBdvpfR5nHWvI6voW3XTOjjdEXXjjEFDovovKA
	 Zzf1+oXJXI9URFoeGTnLT5Qgm8f5/QfMCH4ZZnqfQiEgetZg2aTIAcuryz5E/VXLvMsS9
	 5C+ofiZM7qMm2qIaFpH9ywsEhsLr9MMsBV6MAScH+oKUitLsEMPCzLKKVoaPEenOmWQfU
	 nwo3+2T64H5nTuwlrjDDrm4ax66VQlZ9n80M3LlLRUICBaUFJavBu6xu15UIsw1zWeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792636541;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wO2JUr/7Oi69Jsq+qOpX+DQVSRoBTZ6KKTrlEemvdT8=;
	b=Ab6TtIuil89mWPAN96XYaa4j5TrJ/kf2jPkjf+BKyx5uOi7FqZLZK9Hx2HyBhtCOdp0r
	 NVkT7MeKYgS0yBf+/0YgmhT/YFpA01Vc21N/TDTUEmD4OG1afaBXsiAuVLuWHKFlmMO2N
	 7BxvgP8ywgfupTg63NGSRdLBbykjvXAbAHBXVRqIwkaGNrVFsyv99fykj6SeOds05tLDW
	 fj/FtKh5l9grEmnlaKSU/NNTFBEOkwOrmT0Oej8fHqZkyBNriqk4fHoxBH5ol9Hw7A42D
	 l8Fyv7fHx6O5LyXKBc4umcJ0C/WA3y2jy9CjyokKdmegaWLvx+wPvkIqmIiGBNQ6A9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QImXKpdC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LoagpPVH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA4D606A319
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:35:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFA4D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QImXKpdC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LoagpPVH
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M0jPuu2024010
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wO2JUr/7Oi69Jsq+qOpX+DQVSRoBTZ6KKTr
	lEemvdT8=; b=QImXKpdCrXGRkby/CbBI+KGvwR3+OwrAqV3tQTc0WwvTDuK1mtx
	bs7yZk8X7crznyMYlwX6DVULxm8mOJfNJLz7RmJ3LBCksK+KweXyDVbhzLrrTHyu
	eYVOA8OYF5IFDPOonEMA89Zp8xS98EjS2jxPpTkCixBCl3e7wPsijPuVOOCdzeuH
	UZSZ7EKsEw/jND4wHfyyxN/zail/Oyy9n2fA4R47/86CXcrIrlGfg4Uj1LUBJp+u
	ol4QrBPwHI95XqV2VzXUF8vczV3xdBURclzvchpYnuNawEQ6843Nk0UluHUGicOg
	DV0OObVCcc3RvQK/ULLGg2P59u1r/XQ6fgg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf0k2jqan-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:35:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ada8bc8575so537830a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 19:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792636538; x=1793241338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wO2JUr/7Oi69Jsq+qOpX+DQVSRoBTZ6KKTrlEemvdT8=;
        b=LoagpPVHbQEtuYoF6gG09z0hAqAAWgV1xjoLdIc7xpd5kAYek5I7n8BMyZkf1vT/IT
         52PT29VbPXQi0fVqGkNxf+sy+mnQDJbcEMynjmfba9+jfL1PY4/gulsW6Snmv4+pBF9Z
         XTx5B6aUcJV30EkW7/FLVU+rHCgrjz5SWvIDfn5VmNlqq7t6w8zHCGX3AVwurwclEogl
         HtLi2Nnh4zY0q/zXogijHPmgAnboyKyj+vtrR+4p/DJwof79e5Hy+mlCcqFdSwlji8yR
         lJ4ADloqe87MvioA0jCUoSJzqcUOg5WsEoxqF4vrPJETlF6u++1cpvJxJZTQrF4fltXB
         K3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792636538; x=1793241338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wO2JUr/7Oi69Jsq+qOpX+DQVSRoBTZ6KKTrlEemvdT8=;
        b=p96BS31mEElY3F5ObxE3mFU5vGKBOzVfzCxS91Gnl8ZYXvJLONVEju0IAJfHEsEmka
         Fo7vJ4Ou4dHwQJW/N/Rfcj9VEr1kdBspOOR588yrNskveoiHJd2llYw17Gm0f1Xb2fp0
         yzLxKV8ZikmlrIgVz2RKRFvrVjNenywUO6yBmBEWqLJMjc8PbOiurAucNVM7U6jEn4XW
         z5x/D9WyVDEmCGL/KI0+SmrSOhAzISQgI+Ji/8QzkRlzOSazLRolN58bn1262fGtDJ8N
         AkzkJ7j8WxthypuQRE/+U3I1oxd4pavlVuLX79S6ucPTDrtnExaME1s5WlHErXNg9CI6
         oEpA==
X-Forwarded-Encrypted: i=1; AKwUvByQ67G1Cl30OUErSKvOCARDjStWiO6yWhG3gCYWECnYycWn9UI4HjPRDBlYgUG3WS+UsdPqo7otsM3FC7Dm@vger.kernel.org
X-Gm-Message-State: AFq9FYIWWwptckVuU/HKQhw8MDMkpWtUwUDqejLjcXhsrtUw83rHr1e9
	mgMVpGMACRuuzzIbpa1iCDjaNLy9jn5MZtEKhCi+WwErg64mN/nOiVoujsg9034uNAMYzMqfz5O
	yWkmbEA/EuB8iYIlZ3KY3KJ1QVaMDsBGIDXataJ/yZJNzctcwvA2dnM0SNJmGzdVEX34W
X-Gm-Gg: AYBFou1fdve9qAuXCGLgJxHAvV/988pZxEY+o94A7nHY3q6WeyoOl/AvMRJhqyZFWwm
	Ac/Y7DH8FO/p8C6pUm4Th7zRF2NdZRgJg09/+e/tbhrY/gbYwM0Xloa0iWn+PTQt1kPD3+VDM0c
	QQva/s1jcDgl6UNPRo0majjR7P6wAKVSHzYMj8DyXcDeR4dSS8YyKRsIc1Xm6wKtmUKK4+rcN4B
	JO1TT3u5WM1Ir2c7Rp4VPfzS4T+K+plNoq5rikd/9NPSdr2GjcNKikeA9o6vsxQixZxgnUDLKbc
	hk87JaQwTgyiGJhcx2sn9oOnTyuQKkUM4LV2Wh3lSxCTLSTrDEQQ0DSRkw9L6OdeVKjqAObTtBX
	k+aUmGNOhe4T2FQiA4M3BXj7uUylzSkGvVAPuVJiMsK4sxG/nI5ak8ygQYZWnBxeuSjuDCbYJ
X-Received: by 2002:a17:90b:53cb:b0:3ab:884b:65b4 with SMTP id 98e67ed59e1d1-3ad870a3362mr3274119a91.59.1792636538455;
        Wed, 21 Oct 2026 19:35:38 -0700 (PDT)
X-Received: by 2002:a17:90b:53cb:b0:3ab:884b:65b4 with SMTP id 98e67ed59e1d1-3ad870a3362mr3274086a91.59.1792636537687;
        Wed, 21 Oct 2026 19:35:37 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada488550esm1959935a91.3.2026.10.21.19.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:35:37 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Escande <thierry.escande@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
Subject: [PATCH v2 0/2] misc: fastrpc: fix UAF and Oops around SSR teardown
Date: Thu, 22 Oct 2026 10:35:29 +0800
Message-Id: <20261022023531.465-1-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAxMCBTYWx0ZWRfX3I/dtKSDtrrD
 lab6+yHsVH6x3m9DKMqG315vRSbUjjfiXd4QTzC285R2Nq33Ze+aaXh7C0tSoSoPuKL10mGta/w
 akSL/9EGxDMt1q9jlDaLjBP/XhTLfws=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAxMCBTYWx0ZWRfXxaNCmyH8fqXX
 ayhlFZhU+Gw4WRrLz+nc0HxL6wccWe6moPfPTj3tjY5jELYJfxHzW0dJJ+MkrvaJBk2UH9Px6xD
 BXTxYqIBb0qocmsRkArbUSNZdxakiBZOv88Zre6cHzPXNHfDUHL7iUUGNXyLJxyI2dfIr12RwYm
 Rq5bOZ8bZQnArwIm68JiEB88ojKwt8GaTdPP+9dkYttJDy06suKsFe3ArbcMa0IHJGtE+Z5NIrq
 b5IQOjXC0FwEqIsPBlKIqm4YzBQWGAgR9jEtx4g/1Wz5L5G1gsjz1SwIPB7M79cKnxa6H8+jc4f
 El8oYBKIPTRnqrK5RLngTtIA9lBnOY4ChipAuAPpYtUatjbBe/7AD0mCyUCfq5jx6KTUNxTZihs
 p4mLDdalwYT7iH2EEGTdSc+ORARxUs73Ne6TiAuoFFxKy317ArZI42HK8y3s9/sRg5o1xMMpQBE
 23IanY+b3A5ug81HHtg==
X-Proofpoint-ORIG-GUID: nZBJi8m18uyR7Sopv30pN8Us5M9Eige_
X-Proofpoint-GUID: nZBJi8m18uyR7Sopv30pN8Us5M9Eige_
X-Authority-Analysis: v=2.4 cv=K/+3jCWI c=1 sm=1 tr=0 ts=6ad9767b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=BpxS1hBXepmEKCCl2oUA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220010

On Hamoa (X1E80100) IoT EVK the ADSP can restart repeatedly, and every
restart has a chance of taking the kernel down with it:

  Unable to handle kernel paging request at virtual address fffffdffc1ffffc0
  Internal error: Oops: 0000000096000006
  CPU: 5 UID: 0 PID: 2766 Comm: adsprpcd
  pc : ___free_pages+0x24/0xe0
  Call trace:
    ___free_pages
    __free_pages
    __dma_direct_free_pages
    dma_direct_free
    dma_free_attrs
    fastrpc_context_free [fastrpc]
    fastrpc_internal_invoke [fastrpc]
    fastrpc_device_ioctl [fastrpc]

The faulting address decodes to a struct page for a PFN that has no
vmemmap backing. It comes from dma_free_coherent() being called against
a qcom,fastrpc-compute-cb device that of_platform_depopulate() has
already unbound: with the IOMMU torn down, the call falls through to
dma_direct_free(), which takes the buffer's IOVA for a physical address
and hands the resulting page to the page allocator.

fastrpc_rpmsg_remove() wakes every pending invoke with -EPIPE and then
immediately depopulates the context banks, with no synchronisation in
between, so woken threads race the teardown on their way to
fastrpc_context_free().
The series is ordered so each patch stands on its own:

  1/2 makes fastrpc_notify_users() wake poll-mode waiters, which today
      keep spinning on a buffer the teardown is about to reclaim.

  2/2 counts in-flight invokes and drains them before touching any
      channel resource.

Jianping Li (2):
  misc: fastrpc: wake poll-mode waiters on SSR
  misc: fastrpc: drain in-flight invokes before tearing down context
    banks

 drivers/misc/fastrpc.c | 61 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 57 insertions(+), 4 deletions(-)

-- 
2.43.0

