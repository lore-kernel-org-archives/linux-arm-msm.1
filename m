Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065164FC356
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 13:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417716; cv=none; b=ee1mnMKr3cYGPmTMgiaeh/Mvci3+nUMJVrU0PPhRfJOUPmcKbwW1/IPR8C2MHg61Ua9YihaZagGtQdzVJH8AOy1eESYlaV4n4PEdn0t2TNotfHarPszO9pZChe0zSeJRVXV77P1ctu7cGcXTWlOgX6qDo/f6I8/jbubCgujDfqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417716; c=relaxed/simple;
	bh=1hMzuROJV8vdtq+SPxtxFWcFHZLQfN64YbfzueOmtbk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hi+MvFF56tuT6mhl5C4+WHUWRBXZWzi1aicv8xEWMWkinzgLXG14SRX2yZugWCUSqwyNtze7V2IPs/DnDCXZ55EiQDRt1lCmL5sOOY5e6EZKcW7Rziv86ZHDR7TC8CrqDMLwxEu9KeIJC7NXRXaNrFMQLzLh1H//Q0sCiOQOP4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=octoAkzr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iG1MxK0j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="octoAkzr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iG1MxK0j"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Oucq1168055
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 13:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8MQmVTCoCCyaLYdia8eZ2MhXz2oL4yullhOBRKIMS4s=; b=octoAkzrATYM594x
	o5fjh6aHB0CI/s39uHHJs9XbOBIVK8vV6w7rNiibtcg3KYz6uu25AB5rdz+6Kprf
	iTDfSeo9ez1vmy7KiWpRHsvwucFQayCYNu9JGCJObHBUM/T66iz2YYQZ7vE09Mpu
	M8/NAOfTcj0IYsz94xfUun1rMxiwearodti69J316yyXicsXuLFKmJ1SJqHQqKmd
	42XNZ1lXgS1oFKDSK4oAHK4lt8ewwCKcvO8vKgOhmczNtWSoezwDOcw8l1QzdNhF
	GUF/jkHvtkOxqFVu2pygBHEeocYA5pgoj0AQcm9Sp6ZduKuaCZqTd/VGlirO7O6x
	WAYHFg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf5c9byc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 13:48:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f322ef7d3so352950085a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 06:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792417707; x=1793022507; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8MQmVTCoCCyaLYdia8eZ2MhXz2oL4yullhOBRKIMS4s=;
        b=iG1MxK0jY3Pn0m+QBM0VBeyuqeNvBJQGMqw5aymdGBKdcUKRomRYzr6HX3QoNaEyB3
         oGX8i57DWjZrRZ1dFD2AiHBIL7Wlsfcw8Whd/NokQNerSiG0lN/caAouUaA7lLp/24+X
         vm7yEfhUlIckp/+Rm/G9Qd19YJNnq8ImGBfWrjqTGYi6z3rYPmZbQBcpLLu5qiI1Irth
         KDNSTbJ6zTTqfM+mTP/fFcOY9OsZ38sJcLEj64QEaLly35eHg5s21NsGBuhNuDO2WN1v
         oBhV4sHs/2+JdJJsMTlRfu7u0BH6l4f09F0aOzX08pzpbM83Bw+ragHYn1/V2SFH5JoW
         Df0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417707; x=1793022507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8MQmVTCoCCyaLYdia8eZ2MhXz2oL4yullhOBRKIMS4s=;
        b=HZRBSShU/XmpCe9YBVuYru9NLnVHZmEX5vJSJK7jdh+2OGH058Wes82hq4BUhF2CYi
         IbVl8EKX2Ro8OZpBqXsJviRXBDVo6STSzEfi/DfpAXsvi27016j0YGCoHNF9HO1JpTIL
         Uk9frTEnSUh6vbYcICoOhJnKqPlc5g3vFxOsh1mOvipxcgY4YMTIXdD0P+TgEMNLzny2
         j940JMODwNjX42YQI5YFuJxZ88s5fqwZMxImJAQ4XX1faZFUMIv2cNvn4g3RsuSiYhab
         w++yDwZ8i1oP+ZZhtMUHUT0ynKdgjTi81gDwlIdalxAqNl2DsVsFikGpmqQ2ANOW6sMr
         YZkA==
X-Forwarded-Encrypted: i=1; AKwUvByemiyTkgETD71hhsDivNtMp72lQbXQxFh1+n7dHWYG0IP63alDRmUgbsWRsg+mxXpXWa6nbHIAyU3LAr4P@vger.kernel.org
X-Gm-Message-State: AFq9FYIZm/+IDwVM2bIFksuPGi6Uq1qctffq4mMiLZRfdnSTUASZDHwW
	OqTLD8HLYImIGVdB1CyPPSKrkRnC+VF8nHrg4e7XlVIIoC4x6s4jeKk+vbzb6BuY4Tova/eWNn+
	IbhP8nPsmBxX+483NPGc/rdCa6V/NJMvDyhyiiaK2mT7J8i1mvWuv7ebRe+JQh6Z8tYLV
X-Gm-Gg: AYBFou3Ma7WObWYjrjgTVjcJT0evXKcC0xJYiraynJxYagAONVth259vGHfcLSVGAio
	V/oouvq8HPGZPyrXkfF9WASX1fBXOHOdx0qhthLTy/h3+DIozCF6eZt+R7dFZQNQ9KbcHD/9qOa
	hlgTf11bEsgbGhrHkL+ruY8ABYu7wYWGt8JJbAFDYWPsRTcRnGetCWze6vJ1Q0dwThjFyEJCsoG
	uubOyfmJUxhRQXeXuzuGpMQpZLcz073ORoMq/dtcuIL72uzgTMmhooNY9pOw2MnhyZXdHPfJvaH
	ySwP9JUDiYwLN6InDdf/FalH/9gDs10OKK5yhKMNI4WGQkZKk7siktBxgIGsyfMuMgtn+A6JB7s
	rwLzJxnLDPUaGIQfKIQMgOMJEDm0O
X-Received: by 2002:a05:620a:708d:b0:93e:96e0:25b8 with SMTP id af79cd13be357-93f29d3983bmr1284664985a.42.1792417706909;
        Mon, 19 Oct 2026 06:48:26 -0700 (PDT)
X-Received: by 2002:a05:620a:708d:b0:93e:96e0:25b8 with SMTP id af79cd13be357-93f29d3983bmr1284659685a.42.1792417706244;
        Mon, 19 Oct 2026 06:48:26 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c4fc4sm20595574f8f.15.2026.10.19.06.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:48:25 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 15:48:10 +0200
Subject: [PATCH v11 3/3] crypto: qce - Use fallback for CCM with a
 fragmented payload
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-qce-fixes-aead-v11-3-11c55cc7a695@oss.qualcomm.com>
References: <20261019-qce-fixes-aead-v11-0-11c55cc7a695@oss.qualcomm.com>
In-Reply-To: <20261019-qce-fixes-aead-v11-0-11c55cc7a695@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org, Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2870;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1hMzuROJV8vdtq+SPxtxFWcFHZLQfN64YbfzueOmtbk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq1h+hpWfGBIuia6d4nh65sDa9I1HnX7UAYTmxX
 Qm8J54iRtaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatYfoQAKCRAFnS7L/zaE
 w/PGEACl3i46kg1CwlzXm6p0G837vMiZAHNmWcJ9otgezPC7qpCJS5XVeo59XpfZ+0VoHuRAZUs
 lVlhL7+Mzj8AoNHkdaLRkKuxHIRNt2nQNmZd0OnMXBHHceMcvrQmFYak5xuE0/dfT5ac+A5bZSs
 5O8t8r9itJ4ozXLrUpwyiieTp7yb/LZ86a5PGx42L/deEhWkB/UWNN3y3dy53v+BVqSLUjsWjIJ
 ahIP7a3rCfbUHW91vuQ7kdcoLH7WVmlkOyL9Cxd+nGqUzqT/WQJy/0UYBWkKPTOrIh/RZ4GeVe0
 HUy4Yii9pS2xuDJKk8cboV7BaE6lBRaoYnhqzoyqgy1sA2K8836OcYP9QzQBEGi7R3BMlewL0GH
 mBXfFwzavEeOqY2JRsvjeDVWqOa5e4CAt05ghZe6OPeN6RTJM4kCfpUrMkLxoTJ8TcPN0BzfLjc
 gsx86zQHV9YBgH9vp4TdSUA9sBbEfvughVTYc1PN69bpUwFiOm0Hqux945Q12ZbK0EoOtm62Hwk
 IIgFQKPv7/dceFXCJzW28u2i7d+X1fk+rqG5hYCdMv/iPI4ZzCoc4pEjazfJYojoZG6OYrakz6Q
 D2gA8CT6L+JiVHJ50WkekWRAWAcuV/I/weDSjFDpbcrBLApNQwaiHX5I9uxEoHyl6zoaCI15CTI
 pAKLwAIQIRk4IzA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX+IW18obznY0i
 wXVS9GWrhA3FWd+fW/Jt79CSgv+c2HYmm4wSC9UWlfZvoBHe7DF7UAVidsmYOEUZlCukFAdoAv5
 u8sI4NomQL3eTxPvW00l/FbMfboWezw=
X-Proofpoint-ORIG-GUID: OHHDJypu84usy0bXFDTpEEDRea9vxl9m
X-Proofpoint-GUID: OHHDJypu84usy0bXFDTpEEDRea9vxl9m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfXwRnwUH/JPtyL
 po90Wg0p+H/H1XPhnVjtwnQ/fCoHbdSMLteMGLhgUB6njGVIuQs8dbY8ALgH/lRBZAaTl4hMzjR
 YZCIu1qcr+1tFyQyxKvDBZmLR5JpsmACLLW6tqDnSg8RcQBg+wNCsXYllCeB1GS3j5va/62iPPs
 wwxkHzWgeBuiSWwYgwR7Pekv0l1d6lzRDZ81nSoNbLX6n/dRygijMjHKyTLztPxxMihM/9ZP4a1
 i8YBTirxCifAKGkowAuLhCEVL6gNqoC/ZV9pqC6qfh4HjHKbst4hzrzidTDoCkaxsJWc4uG1Fs/
 32vwYrtGyoRkyfrnC07FF6q6qDksGiHfT5czNZwR0z2JZA6DsM4Wgnj+ucAVqPyadyqL1JLvL1j
 K2uX5Eq4McCo9VczmFkEzkTc1Tni37CWny91UiIgxDQItr7ZMCvrwhicd6qiR1/eaiwW+8ZreuS
 zbFDXt4aiUcVFdQiQmw==
X-Authority-Analysis: v=2.4 cv=K6O3jCWI c=1 sm=1 tr=0 ts=6ad61fab cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=phyxH6jkQibGXiXynFEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190054

The crypto engine reliably processes CCM only when the message payload
is a single contiguous buffer. The associated data is already linearized
into a bounce buffer before being submitted, but when the payload itself
is split across multiple scatterlist entries the engine stalls waiting
for input and the request fails with a hardware operation error. This
was uncovered by the crypto self-tests, which feed the algorithms
randomly fragmented buffers.

Detect a payload that spans more than one scatterlist entry (in either
the source or the destination, skipping past the associated data) and
route the request to the software fallback.

Cc: stable@vger.kernel.org
Fixes: 9363efb4181c ("crypto: qce - Add support for AEAD algorithms")
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/aead.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index f34e4feb3004d9bf63c2c8b2aeb3975d86ac486b..ecc33570804fa435db9ec9fd6fbf38c3c8708e2e 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -498,7 +498,8 @@ static int qce_aead_crypt(struct aead_request *req, int encrypt)
 	struct qce_aead_reqctx *rctx = aead_request_ctx_dma(req);
 	struct qce_aead_ctx *ctx = crypto_aead_ctx(tfm);
 	struct qce_alg_template *tmpl = to_aead_tmpl(tfm);
-	unsigned int blocksize = crypto_aead_blocksize(tfm);
+	unsigned int blocksize = crypto_aead_blocksize(tfm), authsize;
+	struct scatterlist __sg[2], *msg_sg;
 	bool fallback = ctx->need_fallback;
 
 	rctx->flags  = tmpl->alg_flags;
@@ -523,6 +524,27 @@ static int qce_aead_crypt(struct aead_request *req, int encrypt)
 	if (IS_CCM(rctx->flags) && !IS_ALIGNED(rctx->cryptlen, AES_BLOCK_SIZE))
 		fallback = true;
 
+	/*
+	 * The CE reliably processes CCM only when the message payload is a
+	 * single contiguous buffer. The associated data is linearized into a
+	 * bounce buffer before being handed to the engine, but a fragmented
+	 * payload makes the engine stall waiting for input, so route those
+	 * requests to the fallback.
+	 */
+	if (IS_CCM(rctx->flags)) {
+		authsize = ctx->authsize;
+
+		msg_sg = scatterwalk_ffwd(__sg, req->src, req->assoclen);
+		if (sg_nents_for_len(msg_sg, rctx->cryptlen +
+				     (encrypt ? 0 : authsize)) > 1)
+			fallback = true;
+
+		msg_sg = scatterwalk_ffwd(__sg, req->dst, req->assoclen);
+		if (sg_nents_for_len(msg_sg, rctx->cryptlen +
+				     (encrypt ? authsize : 0)) > 1)
+			fallback = true;
+	}
+
 	/* If fallback is needed, schedule and exit */
 	if (fallback) {
 		aead_request_set_tfm(&rctx->fallback_req, ctx->fallback);

-- 
2.47.3

