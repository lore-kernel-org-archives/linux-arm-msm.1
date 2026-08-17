Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BFF31A7E2
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 04:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786942078; cv=none; b=Wly+u/M0ubPYmWDLgXfTpzg67PjT0hQgJZ2qObkSq1mpMlP5ZaSYgoiJoZZOrWkfQ6zU0j3Z89/lfklgHdsoG4W9U5gxK8mJB+8a7J4FzLg54yJkIKGr2/+cC0+TFsClTzPa4HLPsTAZAnAN/bv+hN5FSKu36u3cmv/Uarh06pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786942078; c=relaxed/simple;
	bh=1OHxMv2wBW5/+XF2J6E2XUpLe6qHFrIRQAha7890YB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m9DGx93emIzIbDSMvcmXtxayeLu23Y7EUBr2fN+0gD7xx/9PidRlzM/ZXPpm736mRO3k+KVhsNlCnJpfReCDj9wbDe8AM4xyT6hIIZqRfSdBjL2i+zFAYGnERoAObgsizWjuzA0jtvMjMPeM7HcY74vzgPvjZmLhDsAnDjoDl5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ALHMvmZ6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LwJvY9WG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ALHMvmZ6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LwJvY9WG"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GLDNFc4059807
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 04:47:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ts9F4LI3Qew7SgAApfg24zoA58LocEvNJeGMCkgto4=; b=ALHMvmZ6t/9PwqYJ
	3E8YSg6h4Maib+VpEguh/GuwaJ2ct2VBHS5pjl/rFKMMsuha1cwpHUvR/rwod2ax
	jjZa838V/LMZW/UKNBF1isRV7Js3CCzFofqL/OEBQirBdhlpsy+63MWXwjoui9mH
	Dn1uNa4geehPCbbHVVkRFZvvuyaAWtmMr2DnTOdouX3jLIi/1kLf+jwhqhIP2lgy
	Gb+FNOCtmu6jpZO1t0LKG2LBop6d3IBaOxuAlWf50gYi7smMKIYEk4HsgCZ0qtzh
	qxCUQGcdZi9WSwSZZsxon4RsHiKdWWoRLfRksJUEi/vsrJa71VLe+6ObtssiQBlL
	q/mkjw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2hd7w1ue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 04:47:56 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8484ba00601so2912447b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 21:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786942076; x=1787546876; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ts9F4LI3Qew7SgAApfg24zoA58LocEvNJeGMCkgto4=;
        b=LwJvY9WGL44mdUT45/m1auL/CO0H6WbGYQK3rfz2nROW9PfdBMbAc8qAfKlVFpGOpw
         24HQg0mQhzQGrr3DOhJoQSbOCkSl0YMt3GE+HtU2F4rqa/fhlfYQXzQMTByUSL/4xWBK
         Hc67PW3kmGqMNp+6LhmGY5JMGTzL94ZXHAsDMxjuMg+b5SXkMr/1Pqg1w5N4lgMTeoZT
         R6X8/LcrAsPmPGn4WyMYBqoYbN2blcdSsM/TFS/ySd0muVfWELmWHCcU1XAX2HKvk5j8
         e2v13Ks+RvbIORdYZB+aXkJ7XyYKAaIuac3Z66ZCfK233Me28u6gC5x31IlWokH1JENB
         bVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786942076; x=1787546876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ts9F4LI3Qew7SgAApfg24zoA58LocEvNJeGMCkgto4=;
        b=lh89X31Fr2FAShSxKvvf5ACawQq6LKtyYNSjHxswckhMFz6vICDbVcAsn3I9+cIkF7
         VIDFpPBhOeh7vKwyljeEJPIWqS0BqDrZjJEGc7K6Ys42T9glyO6UPTb8eXUh7sBJK6Cy
         a2e0ig5tk8a2PvR0l4C3nYa+prgv5piHPePE2K0d9Z36H6dMo95ewXgAOHBg4riJn4Ov
         gol2/U2aYj2qcNTQqOkAqs0E5HGUTzb430HHVJAgxj/uc6T94SXm0/QWG//49voZtvVD
         n8tuKh5E9mZVdc2UW/6stzuOL/PFg7jD2S0KBqnZ4Gj2uCFzIvvQHEt47iuyop1Y26XT
         4+ig==
X-Forwarded-Encrypted: i=1; AHgh+RoGq8okTxwI+ApYh7fxwBh9TpeYZhN26/vqNA4MGW5RI0sKvq2DGEVcoFsl/HU6vreWNYrgtm7awQw6Av6B@vger.kernel.org
X-Gm-Message-State: AOJu0YzW72G9TEz4L5wuJR9GRWh431I48QtQIIEPQ63M1GQ0UyWJQe5H
	xUtXxkxx4NTdZGoczCylAsQ09PwlHnHHyQKDW5qNEZgYqdFqUEMfsTeOp6jASK7RVAW2B7Kuhjb
	8bv1VJevugdqD7X2dnaGjOFMa4WRnH3Q3T66+n1OcxlPXlZoCaxpMsadqzuRiOp8VDvHI
X-Gm-Gg: AR+sD12+r4GC7qFxHfMLF3Mr73BKqVe7r2llKaZpLhDf0kTtxX4dxqVu/ZL9bTlfjCv
	1wb5mXDNUWDqv2x59axY7XwPg3vU+d9qt4uppkZrTpsU6DLzYS8GYs21Bg40EBsjC/TxGsupRKP
	mh+R7v2NTZbJ6LsoQtjxdMJwdzkh/Fm0nqHFDpRgFsSTrM9hNqBDYiAhuNapgvYQwN9v1UKGB4+
	H/NPBcpKoUxehMTUsTB0cuBrOgLDVAlboN8qpe74B/YRAOWtoCY92zwr8aSmZQWAtRl5/IfYROS
	kcj7K3I7bkCXW4/tWNwOmOdbpkwISsbJM04u4wcDw7xgXQghnbQLRwh77R8OSMgmMxrat+iJJ7S
	+iajvIBZHtyUmI7MUPx9Pk5SpSE7B4cXu
X-Received: by 2002:a05:6a00:8086:b0:848:7731:d95a with SMTP id d2e1a72fcca58-84fde47a4c8mr24275341b3a.37.1786942075802;
        Sun, 16 Aug 2026 21:47:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:8086:b0:848:7731:d95a with SMTP id d2e1a72fcca58-84fde47a4c8mr24275302b3a.37.1786942075362;
        Sun, 16 Aug 2026 21:47:55 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d046638sm2149250b3a.27.2026.08.16.21.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 21:47:54 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 10:17:36 +0530
Subject: [PATCH v2 01/15] MAINTAINERS: Add entry for Qualcomm DSP
 Accelerator (QDA) driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-qda-v2-v2-1-69a02e9090d4@oss.qualcomm.com>
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
In-Reply-To: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786942058; l=1175;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=1OHxMv2wBW5/+XF2J6E2XUpLe6qHFrIRQAha7890YB0=;
 b=HyeeU74f3CsKVkGnmRyBHt0hVqLHg6pHSrSomMARbCMj8ww1CDL9Y/CwmryCZtNpCOfURrc7T
 hBv2bX9LYjIAjAhLgISSrFUBT4+VfnI3DUZj4hbuPuy/jsdJu5xv35r
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDAzMyBTYWx0ZWRfX2qVPeSdGZQ66
 bmko2n05ucFfiLueG6sLCYgQphbEmtSrLOcqdgArbqN0Af/P99m8qlBh42nSpwuFqewgKLI/gxg
 B/doAnd1MLcih5dcmV9FWHVQN6XFNgz4wP0VqY7UqwBf5RBrgvnKd0QMwJMJ7p1OItYqJmdUiMh
 eXdExm1yTwh8DXi14gLpweVGxbwtyzN8LfNcqtYDcxoaUDg1UKKN2yzUiA0H0AfT6ZSSslZb9EB
 9UPk2jofj5oznw2kUlxXWSAMJv7xXWa2j0a8lGQzzAWMs6s3y/r5fvguy88jQlxcY6vWqQ0dGNz
 SDSb+RVaZhwEegOri6qsfnIl4522CeO5vQcTVmgPJO2IzCl0ywIxHx5fLvecUnVLxhFnzKQiue9
 5ppQ5WWd/c/a2g6DrrK25ViOs7/R3ODEtsRKwzP/ARhyZMvSy7mV4h+0kxmfT8HtHqVgPOraMlu
 QH6wJrmcvSxa864lL4A==
X-Proofpoint-GUID: G27cIPeXXjci_LKByslBiLoNh2jAKAg8
X-Authority-Analysis: v=2.4 cv=Ja2Ma0KV c=1 sm=1 tr=0 ts=6a82927c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=-nEfFi9kuEQa9ToJtW0A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: G27cIPeXXjci_LKByslBiLoNh2jAKAg8
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDAzMyBTYWx0ZWRfXwMZdXjAT6VEo
 FWSPKLcpvmoK0hDGI0oWbexLmKZjvYXtvXAQiNvEtbvzjKHC2CEWsCHjVOAoD+To8BexenGZPtA
 I34fu7uodmrM9XH3XpFKCn8UzaAnZwo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170033

Add a MAINTAINERS entry for the Qualcomm DSP Accelerator (QDA) driver,
covering the driver source under drivers/accel/qda, documentation under
Documentation/accel/qda, and the UAPI header
include/uapi/drm/qda_accel.h. The linux-arm-msm and dri-devel mailing
lists are listed as the relevant review lists.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 912837dd4640..75fa90c137c7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22388,6 +22388,17 @@ S:	Supported
 F:	Documentation/devicetree/bindings/crypto/qcom-qce.yaml
 F:	drivers/crypto/qce/
 
+QUALCOMM DSP ACCELERATOR (QDA) DRIVER
+M:	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
+L:	linux-arm-msm@vger.kernel.org
+L:	dri-devel@lists.freedesktop.org
+S:	Supported
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/accel/qda/
+F:	drivers/accel/qda/
+F:	include/linux/qda_compute_bus.h
+F:	include/uapi/drm/qda_accel.h
+
 QUALCOMM EMAC GIGABIT ETHERNET DRIVER
 M:	Timur Tabi <timur@kernel.org>
 L:	netdev@vger.kernel.org

-- 
2.34.1

