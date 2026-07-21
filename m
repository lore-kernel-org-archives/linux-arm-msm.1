Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C379A36A34C
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 11:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784632559; cv=none; b=rMCVBj08w5KsUyJm+NGXg7TSAC1jna1HaIUXGJvYrbH1Za8XWD4tUjmwS1q5NFlKXymoVqr9Wnt2mG2UC2VWdTsHozwg7UgL5BvJixowNOtxZHN5H5j4PmwN39CkxveKSzyGBKNOT59VSA/sU8hSLqs/Zdj66LJhL3Oe4H99WSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784632559; c=relaxed/simple;
	bh=NEBTq2qMO+3a3T1pVwTZ2uHZNFbfvbkcYWMWPDjDQVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bUZNoogY04rGezkwTy3CQdkm8ghMliZpHJdcwDmxSLYdGZmkqIjUrTvph5sqB8HZHop+pIiV8+DY1EZb1X9H9scaV+0rFJodtf9QkVcEnJPsy0CtOaWOL5Uvq4XHC8wqfYW9kfWOokhCj9rkgW8h16vofxw+D+A3zgGL3tDGZpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BlpayPPf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XgLeio6u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BlpayPPf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XgLeio6u"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LAR4Cv2502909
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 11:15:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MVsnZcPY5WUUaWj8/5K5hz
	/PWPFC6jvi3dDQkOYyYj4=; b=BlpayPPfW+g3+dk0nsVDuYKTyjD6MkAWe8hZik
	bAjDnpfKV+US+su5Imf+7mJWAd0QYufw2rOUjA2SoBSFRcwxyAWZpfRSgl1sH11E
	CTDUQQgZkT47UxbI3oYQ4KkFSCrzMLivLFnF6Verd+TkE0tGVyRWQheb8f4iddSa
	qB/dmJxNknasdUMDb4liLW5D0Li9MReA8tgxbsExfNoh5DKzlW7zQSGl/vqdQgVm
	kmfz87/O1e3RjO1ccLaKkBXCcMtQF8WiomxVpCh7WvUUBrWTk5b4i8ph9dSNL+YU
	aWH8ftipLdA99bGNXVQ2AdKENemd+9QWK0ve6sQnkIqxBI2w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6nsr9dg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 11:15:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e6d253330so2838288a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 04:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784632556; x=1785237356; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MVsnZcPY5WUUaWj8/5K5hz/PWPFC6jvi3dDQkOYyYj4=;
        b=XgLeio6uPSgk5gUy8Vp+AIPRaJOGYrfwCtVcX1q7RqgC1x/WIW7omX5BYUVcH/hf2K
         4ruselIdIA6rAqpNfSK/iMCVXKqsgzvHVp34w4eKFHHxrK6+ktsjZyKMGvEKH2dqJLUS
         kq66b8aB7HQqwHZIkHFlYtj0ZjzYYpkJ3YfKDLEYxR3eHo87qjLO4lq/t7lzHOhP/CWM
         Vj3MEy4FIRQSviQrgH3kVYz7Hfm96tlZ/WRPofCMOfL1DnI8UcHjqWOoNIYnS67iMscF
         HIiaoe9o19Wy84ggVs9IHENWr2UjYucTN9AyfFl50uLdU51BtF98fo2leWhaIX+RGf4m
         diiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784632556; x=1785237356;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MVsnZcPY5WUUaWj8/5K5hz/PWPFC6jvi3dDQkOYyYj4=;
        b=Fown0ggW6RhBSISJvgGIvDG0dWlFteQyGiFxlRYvWWENE1sVa1JCupdqo0giBkaNf2
         8oqNP04r4TnNVj70TeNHXeC3q3ljsxIclw0Y/Nx6BwWXgiRH7fFnsk5h2GJGYFI2+o7q
         Z/JkV6eHdAr5BOeA5f5e6nrIwA+wOOHmHZC4baZ//3nrCN0pelXhxojPyrY7vCecgdtr
         DKbyNKdTKRiAOGqdCen9966Taat3aIB69NhlTGx28CqNeA9KAr5lguc5PV8Lh6W7S/y1
         MJd0ZCWkbrD9sdaa70mPrMa5SsrUzCno1MIr5ui4QH8chPjBu2FTgV07K0cCQpiTotxV
         QKzw==
X-Forwarded-Encrypted: i=1; AHgh+RqQhftwWUMAYxsy0peSjlq4b+t+ysexymvZKVaosZErRlbJorfpuZy6D0wL+LHTmai5jhcmJxx5iT5xbhb6@vger.kernel.org
X-Gm-Message-State: AOJu0YxCr3jfCcKHSppza3XyamHQajTQP0oIiZu3WKwgImY2CAl4gr74
	57Pk06TjAN7JnyulQLFxb+sL7oOwq14v1AGfxiWst5TMJ2XN+j6HGXpyyLGzho+M6kOvGJU8ap9
	eBRwdAzjQiJUJl/RKh68oAfQspgClthQnk5WZ3Up+UuwrJAa/W9JyIVelggSxk9qLEpIp
X-Gm-Gg: AR+sD10aguMNsaCGx7H/Ut2YPdBqia0OiYiEYDxxUJgyw2NGd6ZnPjSe2sVhIm4BdrB
	hWHmsiP3MW1drtB7a3qex2Dm+yCITcPQ2yCCwSbyVfPBm1CUf7vjebWLDxnFi/b1dBPVmwbmS9a
	3nOS6UaWV58YCr5I2ZiIKVyjMZMqpRxxeWF7S88ykIu0CkerSiVOKPOlVIxcYBS40kNrMWwWPcv
	2TF38SsXhm2ZLjPL7HLvLo+p8Xqm76KY93S2VUQCimBTj2XRF9NxO8BGgM7UYyKK9e6gz9VwLVX
	XXH8D69GeyyfM/Io6F+ZqYOK/3svYrlrMwiCrlVBEZBiid6CBpbQ4+6b2jS6w/WhdhCPfQtJjYo
	km3XfsKjG5atWErEjkIMKZTUx7o+NOI+h3UN2aHxqUl/bx8a1ss/EO18lrp8LZlc=
X-Received: by 2002:a17:90b:3e8d:b0:386:ca4b:16a9 with SMTP id 98e67ed59e1d1-38e4b686025mr14627250a91.16.1784632556188;
        Tue, 21 Jul 2026 04:15:56 -0700 (PDT)
X-Received: by 2002:a17:90b:3e8d:b0:386:ca4b:16a9 with SMTP id 98e67ed59e1d1-38e4b686025mr14627233a91.16.1784632555716;
        Tue, 21 Jul 2026 04:15:55 -0700 (PDT)
Received: from hu-cchiluve-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e9232c388sm1358096a91.6.2026.07.21.04.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 04:15:55 -0700 (PDT)
From: Chandana Kishori Chiluveru <chandana.chiluveru@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 04:15:46 -0700
Subject: [PATCH v2] dmaengine: qcom: gpi: Fix SE ID and SE Protocol fields
 widths in SCRATCH_0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-fix_se_id_and_se_protocol_fields-v2-1-ee1d63d6c549@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOFUX2oC/42OQQ6CMBBFr0K6tqRttA2uvIchDbRTqUGKHSAaw
 t1t0QO4mcxL/vw3K0GIHpCci5VEWDz6MCQQh4KYrhluQL1NTAQTkinOqPMvjaC91c1g8zbGMAU
 Teu089BapVY45kFyeKklSzRgh3eyKa/1lnNs7mCn35kTncQrxvf+w8Jz76cQfuoVTTuHIbdtyp
 mylLgGxfM5Nb8LjUaZB6m3bPqgvAI/pAAAA
X-Change-ID: 20260710-fix_se_id_and_se_protocol_fields-d7f0fe616596
To: konrad.dybcio@oss.qualcomm.com, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, bjorn.andersson@oss.qualcomm.com
Cc: praveen.talari@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com,
        Chandana Kishori Chiluveru <chandana.chiluveru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784632554; l=2400;
 i=chandana.chiluveru@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=NEBTq2qMO+3a3T1pVwTZ2uHZNFbfvbkcYWMWPDjDQVA=;
 b=Qe4keT7HCz1AgMg/XDMgDqta4qcDs6+JohgeQSgDZVnpPoKXa92NyHuS7BN8df8wZHLD1VvxS
 6YXlugjjUiuAXhZoPi6NYlN6vX+eDJiLTa7nv7Udel7aV57zovLq3tR
X-Developer-Key: i=chandana.chiluveru@oss.qualcomm.com; a=ed25519;
 pk=JOK6siShQPtXwMyPXnFlFIPPNGXclzVFIJL1EuyLmy4=
X-Proofpoint-GUID: 7Zgpx34g6NvJe0EnvJN1Iqqny9vK-kyo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDExOCBTYWx0ZWRfX5muEYb4ZONUC
 eUx2PsvxjTll1vUM/4IeZVJ8soBJBsIgyj4dyU9kOxaD08VDA7qyeMYpUfQbQydg/xtRzbSxOm9
 2eHNNKzeTj+i0WrJItVwgORTVUy/p8k=
X-Authority-Analysis: v=2.4 cv=ZJjnX37b c=1 sm=1 tr=0 ts=6a5f54ec cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=ptTHJtPLR270ybZWXd8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 7Zgpx34g6NvJe0EnvJN1Iqqny9vK-kyo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDExOCBTYWx0ZWRfX9uIAtXaxQlrM
 fTTjuNgJMsjkOhTQY2KAQkm584y2Y+e5UVVoKlaX5RrbhUjGnMbx4eMc4jMJS9U05KIDs8CzdRK
 NRQczZqheEgMzKs/FPeGfANznc6hKMNk4r4hyxaXfUqARb0fCqvpckw7K5Po9wpsekbxwe/sssh
 LmFzeQxI+4R733167q0cPmPG06fmlay/l8XJR+XivtMwU6QHabivwzp41Jiq2WWPqslNg2kiB++
 4RD371ivKYJERDpPCk4KtNbnKhnyxtD5T0s6ZvoIVpMk8+CgBIoIi+B5kNAi/ABePNbrcr1BlJ0
 /AxCzq6/XdNU/UPuCD1HR2lVswVSo4085PsPF2PA7SafNkAmvqW5mxQqM+vgR5Xl9Az7RVvlVF2
 ePABX3ZykOsoJGRiLT/dgRb6TdmeGa0aUyQDDvhgv7G3DkKQVfudwkxr4Cbhr6zk9ftSSP+NGfm
 siOusYEtlabCQ4gTx4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210118

GPII_n_CH_k_SCRATCH_0_SEID is currently defined as GENMASK(2, 0), only
3 bits wide. Serial engine indices >= 8 get silently truncated by
FIELD_PREP()/u32_encode_bits() when written into the scratch register,
causing the GPI channel to bind to the wrong serial engine. The
channel allocate command still succeeds (it doesn't require the
target SE to respond), but the subsequent channel start command times
out waiting for hardware to complete the handoff to the (incorrectly
bound) SE, and gpi_send_cmd() returns -EIO leading to GSI usecase failures
for SE8 and SE9 serial engines.

Older documentation, such as the SDM845 hardware programming guide,
describes the SE ID field as bits [2:0]. More recent QUP hardware
documentation defines the field as bits [3:0]. Use the wider definition
to match current hardware documentation while remaining compatible with
existing platforms and enabling serial engine IDs greater than 7.

Also update the SE Protocol field definition to match the documented
register layout and keep both fields correctly packed.

Fixes: 5d0c3533a19f ("dmaengine: qcom: Add GPI dma driver")
Signed-off-by: Chandana Kishori Chiluveru <chandana.chiluveru@oss.qualcomm.com>
---
Changes in v2:
- Updated the protocol field value properly
- Link to v1: https://patch.msgid.link/20260720-fix_se_id_and_se_protocol_fields-v1-1-e41dbb107d97@oss.qualcomm.com
---
 drivers/dma/qcom/gpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index a5055a6273af..fc12cf9122f9 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -207,8 +207,8 @@ enum CNTXT_OFFS {
 
 /* Scratch registers */
 #define GPII_n_CH_k_SCRATCH_0_OFFS(n, k)	(0x20060 + (0x4000 * (n)) + (0x80 * (k)))
-#define GPII_n_CH_k_SCRATCH_0_SEID		GENMASK(2, 0)
-#define GPII_n_CH_k_SCRATCH_0_PROTO		GENMASK(7, 4)
+#define GPII_n_CH_k_SCRATCH_0_SEID		GENMASK(3, 0)
+#define GPII_n_CH_k_SCRATCH_0_PROTO		GENMASK(8, 4)
 #define GPII_n_CH_k_SCRATCH_0_PAIR		GENMASK(20, 16)
 #define GPII_n_CH_k_SCRATCH_0(pair, proto, seid)		\
 			     (FIELD_PREP(GPII_n_CH_k_SCRATCH_0_PAIR, pair)	| \

---
base-commit: 34cf6dafc47441dfb6b356a095b89c3585a93714
change-id: 20260710-fix_se_id_and_se_protocol_fields-d7f0fe616596

Best regards,
--  
Chandana Kishori Chiluveru <chandana.chiluveru@oss.qualcomm.com>

