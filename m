Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599EA4F96AA
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 13:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417708; cv=none; b=KXbzoYm6hPVDVOvLAVOzqSzgz2Fmv1L5iKlqLNbxnoVyzA8Yp55+T/679zLisgLKexHkq6SJG+E1+WoCaUqeSRkSwG7vLWSHeGV9YYS5z4S6KbCayULzOIUpo2viLbGStd7OpfYEVXb+K+ey2x6M0ABVXw3AiOedYeWPlxPBcu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417708; c=relaxed/simple;
	bh=5GHHihT8Q28Q2Z6IqnDJJLR49udVLHKyjwu/T6aBJ7g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iiHsu4lwYTbKMSXOvSLqrUqrtCN/x4wXQMq1viQT7Dwu3JjXgxlKnvYAA4/Fv5wZF6WljoPzqU30UH0JmTlyfWP7SA2w5gOxYX4fNLw/YV30xEoikLvDL7YRINv8RjY9KpqAMcYy6ODxjLxaqNsqzQrzgYD1Ng9Wya0+ZqjQtfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eve5dmsK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MT+gFx5/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eve5dmsK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MT+gFx5/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OuX92752288
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 13:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3z8i+KPSNZ2br0pM0JUREqSlK3MOF1iO3EQWQGWiPH4=; b=eve5dmsKKTHeRAik
	/3vr2+iutwPPDVeub8pyF0Dt+QIu770JipWdLd7OrSqlxu5R4rXEnbJcCywz6vwc
	vBB3+EwI3JairFp7cdDTWkL+xGnXqWDGQl6Zgh2ro0uhBuemdXG8oNCmieIa8yWv
	kqqzG7ccjnATqjJtyuqtnNbWaAXKvpXBubmyXc6ppjSbeDPXlrF45vFcLxEerp6Z
	xXmBOacReS33qdhEk5hxz4tsN/qgJknxV5TTAFkPfBYIUncqQyirIbT10C48gwGr
	u0BL0LvlJvTAYd9cLxrrsWHSHGW4MGDJxpIqd0Vg9vV38cmObKktOWSGJP8U2+B7
	BZpKXA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48hbt4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 13:48:23 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91be1227fdeso42791916d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 06:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792417703; x=1793022503; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3z8i+KPSNZ2br0pM0JUREqSlK3MOF1iO3EQWQGWiPH4=;
        b=MT+gFx5/b0j3SRmareUFElTCfHf69hK05lBQ3e2izDnpnxucolyVrcdg2GDx696vhV
         r9N3AC+k8GEY8zHCyZq26IQXTXMzNhXxEnBZ+AH7r4E2NsCWGPidYxZNs2HDonlP2m+V
         GTLQx+C4ZxpR15wos8gxJ4mjRcoKh3PZYFDdNoxvPNJWcuJiYvMZlqeKZ6PSF6iAK4/V
         NfpmC34JEIzBT2z+JU3DNGj4pwQ/LEA4BPaACz3YohbQbID5lrmjx+isLG1VPfolEe0J
         WMZIt8UavemgU6xE9IRrcSfD8riEvrj71yaiHgbMlkgf7kIOZvRjx2pvElL+uP1TvFXC
         jWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417703; x=1793022503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3z8i+KPSNZ2br0pM0JUREqSlK3MOF1iO3EQWQGWiPH4=;
        b=pAtZjZdODhNxZCPOgEBWYh/l1nOYHjPgH2hlORuhBlXhCT+QJ1JiqoFZKUabvKxXaI
         0L90Jr5FDUHzbMYSrWGQpJP3/0AloGuSEZ6NK+IQRSmCkwYRrSeCoUO+I0fmB+iR53ME
         PnEI/Iri5Ojpj6hWFJPezkBFXzbPJ6Uz7txq+nuf/11hBrj99L68deQTEwM6VrMZk2iL
         FYNAzFj5J+/dYJd4s9+VdYtdlwtRLzgBw5Uk+qf20fJrM/NY+knoGv4CI72oTks9Scla
         fdcI+d4oA9G9HpC0rscXXjeFR0Bqi3pjBmh1lWwCEOs29hHh2XkPswpcVRdGzn0mojqG
         pfDw==
X-Forwarded-Encrypted: i=1; AKwUvByh8AqbjQUOIenOwjcAG8k6JHX49sH+7IwuSVES7q5gKu2gmWaNiQVeKzU3tSy7e1m6WGUX1svmyCT4kPgJ@vger.kernel.org
X-Gm-Message-State: AFq9FYI9XUI/C8RGq9fB6l4dirZAKSDhP3eUmNkUSw5XIPBBzuDdIZAq
	jaN9LQykaZZnyOrD4EeL4RVcsoYZ6T69o7ihr/fMxC82Ly9PD3VNCiKcw1ZhBySSGiFkpolGHWa
	x+hMF5uQDMAROr4YLvfw5J9Rn4O4pTJ0TK9h2o2c8S4kspT4jOumfrX8inW+5ape3NERk
X-Gm-Gg: AYBFou0nzYKoW3GhaizyRPiP/cFirnYV6GWs/DsPTLS80TVBoaYplCT2tk51jpUUJfI
	AdWXlr91BZnArWG25s2lCu1+ihkVfyg1+VZxmqJEl9dl0CWyNR7KDyj6UaOubkR56bIgaaXQEJG
	rpizFj54Upyw96nAhL2bitGEy++HmjCf7fdvgupbI+DUX/bEnYM0zMr+hhvGtTAygzb1Fr4xNdm
	UU6/7vNJVW/wrQAOjNqP++1BCdVwgKs5ST7i9qYxRElMBMUJPA+IrfMfFv6cP8ddNJgo6DQleru
	pBvz+NTa4RYz4EmoUmKqPxY71Y/8Ywm5adT7BV/fd7/6XPsC435jvsdOETK+swwbEsACZcHtv2h
	/gGV75ivA5sX6uw==
X-Received: by 2002:a05:620a:4547:b0:93f:2610:fb6d with SMTP id af79cd13be357-93f29cc832bmr1363861385a.13.1792417702277;
        Mon, 19 Oct 2026 06:48:22 -0700 (PDT)
X-Received: by 2002:a05:620a:4547:b0:93f:2610:fb6d with SMTP id af79cd13be357-93f29cc832bmr1363855185a.13.1792417701785;
        Mon, 19 Oct 2026 06:48:21 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c4fc4sm20595574f8f.15.2026.10.19.06.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:48:20 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 15:48:08 +0200
Subject: [PATCH v11 1/3] crypto: qce - Don't modify the TFM context for
 per-request fallback
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-qce-fixes-aead-v11-1-11c55cc7a695@oss.qualcomm.com>
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
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2422;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5GHHihT8Q28Q2Z6IqnDJJLR49udVLHKyjwu/T6aBJ7g=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq1h+gMOTqjQt6l7IKLo91jf5mwj0P/GJHk24Py
 KKqGkk9mZmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatYfoAAKCRAFnS7L/zaE
 w94ND/4k+pDq8J3I5zsCSvWVpqkCQyoYt9nrtKvRWvKqvjlYsSe6yybcwAtZuig5BWOUTwzi3QC
 8KcSiGBv8klBVo3MBblAG8tByLMV5Y89PGJg/DKdpA5ULdhS/h6iNkMEV2m48n3WlU62ZPSPG0E
 NEiBZHkqktVGjYaIxsWE3qhuHLfn+5zYV007HtvsmkRBLSUja/5uua+fZmpXiGujUe6pTTIec3O
 qxQhIdPkEf+oNItFdiCJblNNtoL05mo2KHsaCgmJ77+UqozwZLZmUf2QvhxdFTt0oazP38Kun8a
 Ci9CynxK5nB1X5s/QaPV6/Bp0/0FrWiQLMc0nhpGFgu3PBDBeLec1qq/sz1kFmp4eSl0IwzI9eA
 60hXOPVQbWUhg7klpEKfVDbE6iDY0OxtiBtt6H0JLWKFxmxlYHMcx+Q1EIpH5t073DKDdSOzvOH
 4gt1Zr3hEzKpin5+dRQBASjn6itMEOTMvqEHewA1VS0TAYYBW8g/5MoaxCp7g9VoR/KACh+xU+J
 C6sxjVRND4U1me8UiGrGE6B6qjMXd0Escb3C+9BAn3XK+NRiWsq36r+v14K7Ox0JjbaU5JO3Tv/
 Ag7qxUJ+ehUZM67aF14ifyFZS5VVZzC2mEVGjLdUfyfidpM8QPDEwrcS5i/GeOwNL/LcvJAQafN
 kBCTaQrv9OgOMHg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX9+oSaj2oTM/I
 kL6DgLnfwVa5L3Nwm7Af7QLtc+Ws7uVSrIhZ6NvTqnoETXKJ6ZsPOw0bEc1RTbQvq16kn2FC8h+
 Jv9o0ZWvamX7y+DAOT1nfaGP4KaMVeUgCDAekOz6tgpNxK81KtG0rmU0a+il8HUQ0GHAbt1ZKkI
 4WSLjXxExElX+0srd1N/Y41YPuzar6XDaQeXmd0f81T0cSq7hxiW/7aKF6jGvPzbqoLV/22laNh
 tghjL+FuPIoIKt5JLLwPYlcsyQhSZl4KloS5gIlxB6dcci1prmeSbMY2E0YvZr+Vu/JONlxe1eM
 IKl2ovTgvDReNMHkuRaqCzdpmnbsXP00ajRD/cs5d08oefBBW94yhpyYCZuySLjqhvTRunIuD2F
 WUc5JGRYAOQkrp41CgnQ61iKl6fcRbjEHrDZ1cMiTGRJ+24va7CP3cTnpzpoCpgRZ1kjdnWAvyj
 C2kJ47LROD63e77El+Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX7z57Z2SbYpt5
 cuDTQhBW1hCFZWGg7SKxrVBUZhUSbnN70FMlnhM+e5bYZYST7/0CTgr+uz4aJjUutMm3V7XImSw
 AQ3OkT71S+qjeJQaKUl2D8bsUSDPiqw=
X-Proofpoint-ORIG-GUID: ghhs8kD5TeCBio69zsqEBHrZ0bIM3WKe
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad61fa7 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=8On1wDE6BETRpeAr_T4A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: ghhs8kD5TeCBio69zsqEBHrZ0bIM3WKe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190054

qce_aead_crypt() records a per-request decision to use the software
fallback (on zero-length message) in ctx->need_fallback, which lives in the
TFM context shared by all concurrent requests on the transform, and then
clears it again. This has two problems:

1. Concurrent requests race on the flag: one request can observe and
clear the flag set for another, so that a request that needs the fallback
is sent to the engine while an unrelated one is diverted to the fallback.

2. ctx->need_fallback is also set by setkey() for AES-192 keys, which
the engine cannot handle for any request. Clearing it after the first
fallback request makes every following request on that TFM go to the
hardware with an unsupported key size.

Use a local variable seeded from the per-TFM flag for the per-request
decision and stop clearing the flag.

Fixes: b51dcf05c1e9 ("crypto: qce - Schedule fallback aead algorithm")
Cc: stable@vger.kernel.org
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/aead.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index e0061bfab216861444e36700d6530e7a3cd347e7..81c1a9598474c7c1623e71a9eac876fcc0c111b4 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -499,6 +499,7 @@ static int qce_aead_crypt(struct aead_request *req, int encrypt)
 	struct qce_aead_ctx *ctx = crypto_aead_ctx(tfm);
 	struct qce_alg_template *tmpl = to_aead_tmpl(tfm);
 	unsigned int blocksize = crypto_aead_blocksize(tfm);
+	bool fallback = ctx->need_fallback;
 
 	rctx->flags  = tmpl->alg_flags;
 	rctx->flags |= encrypt ? QCE_ENCRYPT : QCE_DECRYPT;
@@ -511,14 +512,11 @@ static int qce_aead_crypt(struct aead_request *req, int encrypt)
 	/* CE does not handle 0 length messages */
 	if (!rctx->cryptlen) {
 		if (!(IS_CCM(rctx->flags) && IS_DECRYPT(rctx->flags)))
-			ctx->need_fallback = true;
+			fallback = true;
 	}
 
 	/* If fallback is needed, schedule and exit */
-	if (ctx->need_fallback) {
-		/* Reset need_fallback in case the same ctx is used for another transaction */
-		ctx->need_fallback = false;
-
+	if (fallback) {
 		aead_request_set_tfm(&rctx->fallback_req, ctx->fallback);
 		aead_request_set_callback(&rctx->fallback_req, req->base.flags,
 					  req->base.complete, req->base.data);

-- 
2.47.3

