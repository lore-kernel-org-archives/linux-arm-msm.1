Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7143042902C
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 14:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784298028; cv=none; b=BKV6NOQ+VO76h2ipktYppKq0jWTdyVVUcutdwoVN3oJuPO6fj3D4ja3FBUu/CotuXGd4QAvHKcBiFDw4d+wcZy8xl3gNW2UbmH/IWrQ5mRJBqTdEueeu6/QNkVPNPRFsgLZBwWcAgLr8qswM7xDau7KFro/8CkTwEUyTd0MQhH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784298028; c=relaxed/simple;
	bh=uYDb0pv7rCeIRG+2FBlE2OD2kUoCXYOvrw1iFnm1UCM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TSgh6NTBEl7XtwCAqhIQwwx3+9mDZQP0XEFVcdOefOIWgwsg8LYygou8m4naC0F+qJp2LZ+BUT1/N+DZyJbr4Ug/W+Uh+bI6RlmrkodPFeJAuHhzaI0Rn8H28yypp7OOcoSi/xYZi+FsG7S3slvB17TDNZaIWT5WrCy5E1rIMD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V7LkFsRV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JaRbw/wr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V7LkFsRV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JaRbw/wr"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE7vpb2106297
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 14:20:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ODBhmA7+M/K0jsHq686Cnv
	3yT9bkgr3Z8niEie0JfNo=; b=V7LkFsRVFWhTM7EmLKYWU8rouWnwClOgrQrrV2
	1x93sDjD8a3dUW1sNMWeaE6EaF5dk6F7fTfcrp+FrYgMJJwHWhsl32up2xyAc0Hz
	dijovmO1YFEtvxTtjrqpZAr96V7AmWgLWXik+0OZRW6Q8vgPGrJzaRAX4iKpgIHL
	M0dgfCMDspAxIRU8WBtOcNZTYvDMkPUzIOZUHLJi8QdrKxBllsOunwFeWOe3F9vP
	gUvMPDVFBC6cNmQEa4lBQwGF9sQv6t/RqwucS/4QmaSUxZfqlNSqxYk5tUXOnJqb
	eauq08yGgIljOFIVlGoRL0tR8M28uNrdZOzo70wxu/dY6ekg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffhpfh35x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 14:20:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d30035dso97581811cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 07:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784298024; x=1784902824; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ODBhmA7+M/K0jsHq686Cnv3yT9bkgr3Z8niEie0JfNo=;
        b=JaRbw/wrPGSvp1h5THAZvCfCvVVZdtcfpWncReXzqku1iZ+0XTfy5Dq1k0nZE9qN5j
         aJ+HpHQ7UT2BSFm8xW06kZSbsRHSpbhF00gSpVL0T21wqeFPDJNc0P337D1BqkK0R4gt
         6gU+BXttsy1Ag5OwUYj1m1un9G4MUiFig+ex8QBnbm64hAnoKr8Q+w8kmx2abiIurKSx
         TX2yNhXR4hA7Ei9yNjLoyIu/WUnKIkZWA4NGehL0R5tsWy3G7ah7YfIQKwZqoJMnYA1T
         aaOiSs3cF6N6P/i5GqElx8nVaR3RT+uWZNqztZJsmGH1OKWEvPfNGofXNfaBDp+e1Hsr
         tx3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784298024; x=1784902824;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ODBhmA7+M/K0jsHq686Cnv3yT9bkgr3Z8niEie0JfNo=;
        b=SeQkW0OdgnHG+wbmOWUAz5l1KEjGA7TCzZ0KgHXF41Wnvu3U09mzStG9EQS1gNymWw
         VF3E7kpH1MrjkkdDAdzQnVe/9+sNzOqYgp4fu0X5qnA5S8gpNnAB6CgKsKfd9jiXH8ys
         9SDDhTiAHXg53G4/KNJG6MY0R6fDySGMRlEGCNIRZpOSSjHCQzRD7Us94nhh57XDrSJl
         zZ2PWFkDWNfPB2llHJ2YHfkVe6mMRWukMoLKkL/H20UWoQF60LfZuAsainlkf9FhW0Az
         FmdkSyhmi45qyCgje/zxMFT6JkmNEN9+vTS05cLelFgThQZpHwa6FphzZHv2hak4XMej
         1cow==
X-Forwarded-Encrypted: i=1; AHgh+RrMR1nUv9dIUCdLwRs8n1SUXY4jABUcGUMZuOnRNLiaqijTLqC3G83eSBcjOuBieqIONPwoECGuSzXj0eKF@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu+kNG+b3a37NkQa3egMDgZE26uPkyW/V7IEFKzBFAqj3Te7e4
	WqYGghfN5dOOGfAVxU98E9YsbplS+jzlok/Xrb2L7FFV/dwpuALZ3tl0HRvKg2HxlpOzJKF9q64
	+JBHZwZHCOq8avO4qJf7QQVBJ8AmBykqPj/KzaiW7LYqE06dUSe1GGrWOSpv2EJ0s1Esy
X-Gm-Gg: AfdE7cmXW5Y8yGTRd+MyUddpa78tBbrFSkhnTHl7095JcBJcUruyQcw9x7O5EttwrSw
	JFslPdec6zzzneNk/OQvLUrbjrbFGGUCq89zNn3H+YqeLPthAQQvh9MG2sv3HDS7j3b3CwV6463
	GlvwHLWGxrVP1wPHNdqJ8+piso/WLPARzwrYbE80gJ4omMYQNcjBjjFU/ilRM5O0p35VO2Xg0hE
	ZKIPBcxWVGXJLioLX+E54ujijbNpys3QstBXp5l21W3llkuPSRF05IU3MDN+7p8LcnST+bIcj9A
	S34xk/xAQ5OzVoZbVeh4rkwBwXSIjjXzrWzgHgtWz+IvqG8J/k3f78/9xH2Uc+OC28epWZa80jd
	Y4retNpVmmyxDb9DauAuqjbou1Nt5hTfTAV3TxY0l6yJQL9kQqrohwdS+6qShY/fpYzhgC0TpLq
	fVKuEz+vJSsBAJG/IMFPjCGXzFqb9nFiNTMtEcyFRUzjj9DenZxOc=
X-Received: by 2002:a05:622a:1c0d:b0:51c:db4:3cb2 with SMTP id d75a77b69052e-5213e182aabmr26323711cf.63.1784298024275;
        Fri, 17 Jul 2026 07:20:24 -0700 (PDT)
X-Received: by 2002:a05:622a:1c0d:b0:51c:db4:3cb2 with SMTP id d75a77b69052e-5213e182aabmr26323271cf.63.1784298023757;
        Fri, 17 Jul 2026 07:20:23 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1740bf91bdsm79085966b.63.2026.07.17.07.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:20:22 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 0/4] media: qcom: camss: Report CAMSS hardware version via
 media controller
Date: Fri, 17 Jul 2026 16:20:19 +0200
Message-Id: <20260717-camss-version-v1-0-7ed71fea95e8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACM6WmoC/x2MywqAIBAAfyX2nKBCGv1KdFh0rT30wIUIxH/PO
 g7MTAGhzCQwdQUy3Sx8Hg1M30HY8FhJcWwMVlunvfEq4C6ibsqfqXAkdCYmpCFCa65MiZ//Ny+
 1vlag7MhfAAAA
X-Change-ID: 20260717-camss-version-a8ea61dfae5d
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE0NiBTYWx0ZWRfX1cfBrKJtQiOF
 LnD5AkS/xKX4IzMywctc9fiwgCNMoY2/CRo1R5h0HvndJVMchMbNTZsgstSKfb2fjxQoSJcgt0j
 dzY/o0lQxF4/CHf8zX+iXS1Plm0s1f2GwaL3i8bEwKXIo5Y7zAanH58m2jQqOj9tDBmuN8mT/ob
 tKU5Z4b9Cbwg592ELMQSkIGqyXX75LqRpgrKmXHzwhlpguP5MiFYn+/q3pi2txyrC6bJ0vj/Eoe
 19X6x3sCEaXiM2ZOMYTgD9TyF1usqV2ii8Ft8A0LBGe3vMfhlor8EcSdd0Vm2/SYsEmltZHv4mT
 Pd18Eh81OpE67JXm/Zsa54INFNbnGnFAgaTRQV9osJWlnXF4/bcXS/v6wQNZYMOIO7ofKkDngao
 tKjAm5KIZ03MKa2tqyQL7UoAemj1LYK5+2YUWxSEJmqFKvy9mNzq/5sl3ZuWCrX5DNC7rFhutRj
 g0B7pWRuoHUumW/RoWQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE0NiBTYWx0ZWRfXz7c2yVAwE6zy
 C/miwIaR/f306BxcsphTX+sG1mWycunL4Eorhvp2nIxmqTTxz2R0n68pJCb/20//rHM0T0dvUXa
 7dSMkR42NaLPss+KzhPZohN1d/hdOEk=
X-Authority-Analysis: v=2.4 cv=YeWNIQRf c=1 sm=1 tr=0 ts=6a5a3a28 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=1vSG1W2a-9V1GRHXi4UA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: me4V-bo6h77NyNTLP4-lPtbSgJgZHNeJ
X-Proofpoint-ORIG-GUID: me4V-bo6h77NyNTLP4-lPtbSgJgZHNeJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170146

This series lets user space discover the exact CAMSS hardware variant by
reporting the top-level CAMSS hardware version register through the media
controller (media_dev.hw_revision), queryable via media-ctl -p or
MEDIA_IOC_DEVICE_INFO. This helps identify the platform variant and adapt
behaviour accordingly, for example allowing libcamera to apply quirks or
enable features that cannot be discovered through standard V4L2 or
media-controller APIs.

The version register is exposed by some platforms through the top-level
"top" (or "cpas-top") reg region at offset 0. Accessing it requires the
AHB bus to be clocked. To make this possible at probe time, the series
first moves the shared CAMSS clocks (top_ahb, ahb, axi on QCM2290) into
the PM clock framework, so they are managed by runtime PM at the CAMSS
instance level rather than by each individual sub-block (VFE, CSID, ...).

For now, only Agatti is supported. But support for other platforms like
TITAN-based ones will be introduced in a follow-up series.

Reported media info on Agatti/CM2290 (Spectra 520):
Media Driver Info:
        Driver name      : qcom-camss
        Model            : Qualcomm Camera Subsystem
        Bus info         : platform:5c11000.camss
        Hardware revision: 0x00050200 (328192)

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Loic Poulain (4):
      media: qcom: camss: Add PM clock support and integrate with runtime PM
      media: qcom: camss: Add PM clock definitions for QCM2290
      media: qcom: camss: Drop top_ahb/ahb/axi from QCM2290 subdevice clocks
      media: qcom: camss: Report hardware version via media controller

 drivers/media/platform/qcom/camss/camss.c | 113 +++++++++++++++++++++++-------
 drivers/media/platform/qcom/camss/camss.h |   2 +
 2 files changed, 88 insertions(+), 27 deletions(-)
---
base-commit: fce2dfa773ced15f27dd27cd0b482a7473cdcf2a
change-id: 20260717-camss-version-a8ea61dfae5d

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

