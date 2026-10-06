Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CA33E40EB
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 10:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791284363; cv=none; b=IM2xXZLZ7/regCejNw6Y8AO4HPN6soYBpikIYJzW4kxY7zex7g6EvuBlhmYvdrhYPe7aM8aBKlxV0AWvxvRqfOAEemHc1Cl+/py8yROtWKmHJlGSRTHBAh6jMhaBMk6CwQjfOOEN8ZLqoiNZ1N+buijNhjJgrQA3q3oBfHb/EDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791284363; c=relaxed/simple;
	bh=OSrVOb6xHaeGjfxT6S+M5U1d4uaQudS/a+YMg8TaeUU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gyxfkzF5TTjc9m5bqVb1+HXII/hlL1e9DtOPNkbrv86xNZ2glksI//gt1Z0Ca7TH5iOmdCiGFScx/H/mn8eAx08k+jGo9dFWq48N0fuE6YTb5pvic+M3/Xs/pGU0mShWlYQeRnQXeDDt+y1eYiF3fqmaKPTbydxkShw3J3NZvqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i1hDTm0Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mi3j6+jd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i1hDTm0Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mi3j6+jd"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696ARlP51581303
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 10:59:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=U9Vi2SQFTero6+Fo3XoTyS
	iig5/4/965SWVCeFLIx6A=; b=i1hDTm0ZQaNUxKxbkSOz4UxR5kCtUlRHmN1zAZ
	BwC6JvNzGCKom4z5+sofIsd/vpKzgsU2It2wGzV18TJ8tYgZEZz5zU0KGrcKOtWK
	TZ9m4/b5tDRr5EZdRvPuyAdGljn/rGHESHCWd0oF6SdmarTMLPb9Duiv9sf486bQ
	675B/NhVBhwHMR4nRnnnuHj/J7lV1Io9EHTDRfkm/bU7AjpGxtvG947JSRZvQBA9
	EcYti0gzZ992NKu6t3eVjbyZDGMSccidxZ1zAU7qJpQgXQ2qQpCRbfAGP7bdJGc3
	04P9tdtMnlKIBdqwUzZMba4qa0/kAzQAt0VnupEZQyl5tcSg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xc509tt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 10:59:21 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a7fa5e0442so2839037a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 03:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791284360; x=1791889160; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U9Vi2SQFTero6+Fo3XoTySiig5/4/965SWVCeFLIx6A=;
        b=Mi3j6+jd1QXgicwHm92oZ64zKqT5g2wVB5735+pp7hKbrmWd71iulWTt+Z510nSBXd
         SiQNLpyA+a3YFHjgFTeHJBZLEIIJBUClxVNFA+jsz8KjOWtZIMFbge3AFX/LbUaT8eOx
         92X85jGSC9w+H7L06tfzpJ07l78r2pnYf/P+dOtKRMcXiJh7BWZrVJr43k69HBC/HYsx
         gCnFeJUoW0ftV4wo25NdniaCrMMOA3taYglKH5yKfAjyCOUBVfAiqcBZmVxwQZlpZvde
         Z1Spdxj3ChiV3+Q2jIE+GfiZkMHq73iGO7basJ3y43m1CJwPbj+YmmSLikOmY6O+Hc88
         m+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791284360; x=1791889160;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U9Vi2SQFTero6+Fo3XoTySiig5/4/965SWVCeFLIx6A=;
        b=a2Li14kSzTF0lvEgAgiRopk4NAmm7wIaatTetKeXKsVqcthF6aWzNhSA4Sqr7JHxm4
         i9f0ervfs8wBwzozyIumG32FD9AMdQF8azR6Vw9gXEPtTW/Kg2cvs/cbApfyn4IDNjvx
         S8b6sjwy8M++4iEmXkoE89RfYNIRX0118V1nai4CXJRAozzEwRKmEIV5M9ZdJvm7uaMc
         6Ntj99q8XRMfCRSkKT9VvV/6rC0V2tXJUKT428dMjzz/sraHuLjmINxcF5JxYfQJuy9R
         puQXdpn/roFVT/6BPpUkZYXNSDoJ4t47z4inKqG7bkoVxvbJWrzCachTOcagliGDXCiQ
         ZD0w==
X-Forwarded-Encrypted: i=1; AKwUvBx/Zj4UjQfazSfmqZihWugdPUQ3w6kw/n6ZRYDbAMhTktL2gTuAaX6tJ2HBXmU0OejHmhICs/Z1MWKTOqTc@vger.kernel.org
X-Gm-Message-State: AFq9FYJNVXUwlCQ6I1c8mJMVK+jRpKx1dmhKZldguupSoQtsiTeSKeFg
	M26MEneQZdZzJKDfsHcIVuhBTM8rDh9hOjO/o2S6AdQFKfdGpn5UktgNcc8IXiHyoxCV1YRUEyK
	b4Se6noncrWXwYY6WWW8LQlJ+oInlNmzmt2NTmrP5gedyOWaCVZX+wA0UU32uOrRxPzR9lDD/h5
	iP
X-Gm-Gg: AYBFou1y/VUEYu1M0ByyqX1YDJU9TH7ivaIzHAjv6OX+bZYQH7GbV/IKNvNgFEVAFEy
	qHhvh5a/w9lMcZi0caQJtJG9vq3nq2Op1ilJSjAUXTOcCR55+dVYWYvze1rPG6xr4fv/XuNQwQl
	MGcIZt6r5oTlvQTT39Zk2lpEIBn5KvX2FFbjTYjznRWt8V+NXr+bMh0JIOJU9JY8FNS5tS7pwRe
	6YVOC3hGn2vfE2Nzo4S+o+C10nziIkoa57jXaPA9LNylyfNxFLEg5JooU6PBO7J0V/brxuIginZ
	KysscDxMu200byeKuA97YeTEx5VHgOd0uIfi3UmKbQiLA19ZH3//h3woW7YEAVnwFIhj1rdTOTL
	8QV3ulOhQzCvD4+lKXLlYoqD/83cLzv/SkPqUkA==
X-Received: by 2002:a17:90b:4b0b:b0:39d:f6a6:60d8 with SMTP id 98e67ed59e1d1-3a872ae6919mr923687a91.3.1791284360507;
        Tue, 06 Oct 2026 03:59:20 -0700 (PDT)
X-Received: by 2002:a17:90b:4b0b:b0:39d:f6a6:60d8 with SMTP id 98e67ed59e1d1-3a872ae6919mr923676a91.3.1791284360076;
        Tue, 06 Oct 2026 03:59:20 -0700 (PDT)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6e592a83sm2182343a12.31.2026.10.06.03.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:59:19 -0700 (PDT)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Subject: [PATCH v2 0/2] mailbox: Remove redundant
 mbox_controller_unregister() on probe failure
Date: Tue, 06 Oct 2026 16:29:12 +0530
Message-Id: <20261006-b4-mbox_double_unregister_fix-v2-0-cd5739b60718@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIDUxGoC/42OWw6CMBBFt0L6bcm0PFS+3IchpI8RaoBqSwmGs
 HcLbsCfSc7kzpm7Eo/OoCdVshKHs/HGjhH4KSGqE2OL1OjIhAMvGUBJZU4HaZdG2yB7bMLosDV
 +Qtc8zEJzrgsozjoTuiDR8XIY14f/Xv/YB/lENe3SPdHFY+s+R4GZ7bl/f82MAr0CY0pwuOisv
 Fnv03cQvbLDkMZB6m3bvpHMIwHjAAAA
X-Change-ID: 20261006-b4-mbox_double_unregister_fix-42d5057d3ad5
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Huang Yiwei <quic_hyiwei@quicinc.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Jassi Brar <jaswinder.singh@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791284356; l=1227;
 i=anup.vishwakarma@oss.qualcomm.com; s=20260805; h=from:subject:message-id;
 bh=OSrVOb6xHaeGjfxT6S+M5U1d4uaQudS/a+YMg8TaeUU=;
 b=9vJoMr0EglLAktZ6G5qan3Qwxhtf5lU+elvFCxVjhecT2tsP2NnllLlpdSo2vkgT3o+pAQdoG
 UswvvuNHwPiCfvRTolGz6tQOG/c4wt4vya9/plOKkT6cmrPfng+n2X3
X-Developer-Key: i=anup.vishwakarma@oss.qualcomm.com; a=ed25519;
 pk=Y9ilCu91UQrzHOM14SG2IjnmQ1QSroH5uVeBSWEmEDM=
X-Authority-Analysis: v=2.4 cv=X5THu2Te c=1 sm=1 tr=0 ts=6ac4d489 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=ONVsfYN4t8-gLpPBeRQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=FO4_E8m0qiDe52t0p3_H:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA0MyBTYWx0ZWRfX2k3V/mdPjFfr
 zmjAkBp/j6u3SJzj0WcE6vlpBlV4x5awebRLzzBHH4C6+YSFDuAnH/wqYgKAg4nQMpVz3A6Wfi+
 5kWWAhWum3w09jSrbhmJg/4TrBxXYQg=
X-Proofpoint-GUID: QKj2udT6mttt5E8bTyPdz-JEqTFObTOY
X-Proofpoint-ORIG-GUID: QKj2udT6mttt5E8bTyPdz-JEqTFObTOY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA0MyBTYWx0ZWRfX7u/NCIpdtk8R
 T95Gi0fuIervpU87UDtaPgAxlY0rU3Ngm97v9yMG+u30fPO4/Jr0v+SmFh8pLaghBEsRaGaPeA8
 sVdCbPVqsY9rMbS51mszDdEv2ZwYYBxkOaKSFuKQckX31WYwOfp5l0jJ2M40Jvyzq5np0b4KWLS
 PV4n4g/wE3Mv2Kk0/HojkEawgPItBKvdP5GNthKAUIWVrghDq/mp+ISfnq9YcNTnPvv7loKrkez
 DjJYe6rf19RH7bba21qTq0e8s5y107k1PhTPFMqpgyu17Cm3jUvT3vKVasjVmJNo+0ACwYlyKJA
 PGWE7ZFnyq1He/hqQJQqbKcj+7c4oXgcDE9HByJbJvZ4EYeSSSS5AzxjzBg+ln9QanVep7fXqLM
 WHIM0o5THg0soh5vU9CxgaRTcxrwzvG+WL3cUxEpRfO4g23sTSld71Qse7KuLzpsXPpKMcStZOP
 1GfFX8dFYH+qAiYnsAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060043

Changes in v2:
- Remove now-empty err_req_irq: label in qcom-ipcc.c (patch 1/2)
- Restore original alignment of devm_request_threaded_irq() arguments
  in arm_mhu_db.c (patch 2/2)

Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
---
Changes in v2:
- Link to v1: https://patch.msgid.link/20261006-b4-mbox_double_unregister_fix-v1-0-9011ca208d36@oss.qualcomm.com

To: Manivannan Sadhasivam <mani@kernel.org>
To: Jassi Brar <jassisinghbrar@gmail.com>
To: Huang Yiwei <quic_hyiwei@quicinc.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Jassi Brar <jaswinder.singh@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Anup Vishwakarma (2):
      mailbox: qcom-ipcc: Remove redundant mbox_controller_unregister() on probe failure
      mailbox: arm_mhu_db: Remove redundant mbox_controller_unregister() on probe failure

 drivers/mailbox/arm_mhu_db.c | 4 +---
 drivers/mailbox/qcom-ipcc.c  | 5 +----
 2 files changed, 2 insertions(+), 7 deletions(-)
---
base-commit: bf1ee2bd5c2da8992f33c8950ef194aaff74ed6c
change-id: 20261006-b4-mbox_double_unregister_fix-42d5057d3ad5

Best regards,
--  
Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>

