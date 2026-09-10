Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB6E48EC6A
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045289; cv=none; b=sMNCNmsYEKWXlYJYKMCWnroy0giwHnZJCnzZFq+ajSkKv5Sxi4bdcTBlCFbHM1finpLRPwKMMJHozl2B83dUYXkGKkf/SBe82Rg1f1GidwK132SUKArTN9wlrxsbkWPhF+FM7e6UtzpTlBUM/PMFxq8eOpasiDjty9o5659XaRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045289; c=relaxed/simple;
	bh=jX9qpTLTDR3AaV4kn5vvkCsyHxUfD9CKGQiGMuz5O1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sd+mrqh2BdzqSyw+2l8Fb7KoEnByiXkrvNOPm1rhwsdekQCYExVQ4jihDX6lbueojwvbkAH6Xb1mWBHAzbyEfk9mmJKIDf5hDCLmTm6T8JhAlXV7d5mcNN47QCIV3HJR4SVCJuvTStTdpDEud0dvCjnz5X74LGjd0eP4VT1FqpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oRC6i9BV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IveMBF+0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oRC6i9BV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IveMBF+0"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7l07245046
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:01:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iY/I37otMekVp4HI+AJzj1qeI5YD4C956zvxiF3oYgo=; b=oRC6i9BVWBHapb39
	gtHHkqihreFDxI2Z7J8RUkiFhjBOBeV5KT2n3VbTlMJNxed2leY2MzGI2NWQaE4R
	MKkHKwIH/voOfXwb7ZoxneH9yAEMttc6POED5z84qOrIhhm43R0LC4J5eG5j3tjY
	JSi2/VI6WHiKCRCXBf6nzyoVEMuGDvDyltI8LfjxiS/rYn2lrAuP+s3UN99IrLZI
	ViCDMeo1vkbC2bbuspKMgrd/1vwrx1rvJH3TVxxgfXvJ7R5JmjGPlW5Q0vRuCGXC
	zE9S+gSSdvbS0KiRTPCeCb8XDi2oq6QC7+O5yPuXG78uPiYpGvGSH8oaSjCVkuPE
	2iN6ZQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyfkyxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:01:25 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c8323b8464so1596001e0c.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 06:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789045285; x=1789650085; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iY/I37otMekVp4HI+AJzj1qeI5YD4C956zvxiF3oYgo=;
        b=IveMBF+09hS8G1n2Rh+9GuUJumnJ0o4it/Up0hnlsBZrz84Um1N/RYWqA4kwfYLJao
         hGjDtxXI9L/T6VfI9YSsUgYYNTWLMTZ7+E4wxsTZtTFnV87rIOgA9ItAqRdncVQrcKH7
         1MY8raDynVBq06nnR2MnS8i8CVVOZw/h/w++/n1fqLTeoHM1Lbw8r2eDm1u7sLwIEa17
         DvK3T1EFwp2WG0AgdOIpTA9NF0BpfDxdT9c4rSvdxHa72ZZO1BstOyTRaaR91eyz126g
         hJPrx6JEwG/lQhKROXPYaLiVe1sL1E+5NW+mAUzGEvFNiyWG/Bokh+CZZMPRZT0Ctiog
         Jmtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045285; x=1789650085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iY/I37otMekVp4HI+AJzj1qeI5YD4C956zvxiF3oYgo=;
        b=RFo6vP3yUtmOBcSwqcLhNHDW/XSSGrF7E3SnkvnOdfe1dVmRA2soIkLwrMelL4BaJy
         IM8pqCFHLZlhU8nDHAhjsNuZvNEX2DCSlMi3FGdzsBRm7cXkB8KvJyXdDck+qPbYzQKE
         AQ4D5iFqODcMDXJxRxG/hd7BwJHTh6feFwwBQeuxTZ0poV2LxGtqCpa3DK8JjJ9XjzRL
         hDOW1gmqO5D51k+cSO5Zx/Smq5mC8qhkPHIZJvAvFq8IEGXTpY9q/uMhj2xHHuLDxvjM
         rCvFrIR8QUKM/QoVaaKBUwlYujMnRc1HYAM5yuoz8/sa6DWTfz1qgrxBY4uIKt0Ovtga
         TjVg==
X-Forwarded-Encrypted: i=1; AKwUvBzq+cF4BSmjqNcFWEgwrO8VlTwlFc1cntWytChPpitQobR6b4eDIG/Xn2oIm9Jh/u3noYN+E7+1kg0VzfDz@vger.kernel.org
X-Gm-Message-State: AFuF++lXfpCgUxDVd9WyrLuy24qSq+2ykjxcqcszDfRy8/DpmQliClNC
	/HqzU7qsHTIijfpi90swKQqgVzzIjY/U5DOmx4F4s/8OKVLvQjxuumNJ6pzHobhtGUIZ8houojU
	s4TQS4f+GCJozZ6k/fRtrH38vTLmMCgzajHhKzYZ2BYSHqmqXUAw0fRk93ScfssyZcuA129s0cN
	oL
X-Gm-Gg: AYBFou2QeWXZ5GETVUS4XC9MMOj0u8y2kiAb1smA5bGTuaqN9Yj6Fy5lF2UAWjNjKzB
	VOdkijFTbYgHj64hj6s17w5H9lLYie84HtNvx29CoCm1xoO+a50xrF5Hh4Ov4BXpqeOqcgBShhN
	Cb/Y6eS6VQthqSjfWgW7K1Kr1JnVpRoRbEGTCe4A23aMjKzz23GF0BN0TXDruDgPTzoXiiv6w3V
	QC2uOT5T/uN71tHgn6sLtD23+xFhzuTDUpbAb0ZqIRqC5BvG5qJfPl1ySd9V5mclKWgWgovpuBA
	y2KIqV/8OzPOTDgQDw2OyjRj6z+E3/5yHqb7pd7aHL92A5qUn32ioe0gDLOoaolfpg8kBNsWdKc
	QozwxkDmS7+BiG7YrAh0I6E0Jv4Nq
X-Received: by 2002:a05:6122:21a4:b0:5c8:3a2f:a497 with SMTP id 71dfb90a1353d-5c83a2fa886mr2861419e0c.0.1789045277766;
        Thu, 10 Sep 2026 06:01:17 -0700 (PDT)
X-Received: by 2002:a05:6122:21a4:b0:5c8:3a2f:a497 with SMTP id 71dfb90a1353d-5c83a2fa886mr2860320e0c.0.1789045273518;
        Thu, 10 Sep 2026 06:01:13 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:c9b1:abfb:f300:5e98])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c26204ecdbcsm831849866b.25.2026.09.10.06.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:01:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 15:00:42 +0200
Subject: [PATCH v7 01/12] crypto: qce - Fix HMAC self-test failures for
 empty messages
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-qce-fix-self-tests-v7-1-cdbd2718af14@oss.qualcomm.com>
References: <20260910-qce-fix-self-tests-v7-0-cdbd2718af14@oss.qualcomm.com>
In-Reply-To: <20260910-qce-fix-self-tests-v7-0-cdbd2718af14@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5101;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=jX9qpTLTDR3AaV4kn5vvkCsyHxUfD9CKGQiGMuz5O1k=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqoqoJZIWIXW+j0hk5IgiX33WrCjHTt7/ixBGq2
 +/qS7cn5jWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqKqCQAKCRAFnS7L/zaE
 w9tBD/48irHDb7sH9v/HqkpxveTDaGlk06v6VDQaPN9nBIWEiQvigDJ61F+iY8ErzOyzbFJQBRq
 kutA4DsjJPSmajJTAHvJPdBNVCEZ8YyCbuWK0GYP9GhjthzjDXHltJaVBrJkQYWVZcX75s8PG0V
 CW30tpXYJbDpC6p3z6ibjAjtODfGTXKEBfZaAS1cZNbp9CMI9jVqb/s/2M1qnrL7+mpPgx8C7Av
 CybJfJB3UENNhFoyV5JabQACN6N5SAGYsjZWooT5BrFk4G69yD0vSApqqQM3SCbq6r6KMBrLiji
 qneqkQdfPVjOch5DraXSyeer+dAg7k21iq703C1nooqzNPh+B5xy78xekO6jbsjrefVnk3gbHqw
 sLPRcXs4UXi4tMn4v2qhupZ+GHZ45Z4C8aQYxBNTvVC8+VZ0gvwDHpOvBgY17/lqTAHGfj9tgef
 W4dVb+olsJmgp7aRINxwItU4sJdzXdBdjxVTauO7RP0eM2fqxsEDzmXZ5RnLhRZEgOuDjYJ3Qa4
 CiCwcRS0ayl4x4SuUm+VIIl/hZN9XvEh5D1YjdWn4AQ5KIBav077XTIyalwNwiqiNVzaMxAWooT
 8H6jNo7C0Iq3eL4xF/OjVT6oaSFSWRfqWF0e8ilPvKdhnOHdcSE3Qc20kmQ6phc1CtXLVyhpEFs
 vFD5P95mdPuvD7w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE1NiBTYWx0ZWRfX5IaPpgeRXov1
 +iBoioBrJBSYYPLORT29KYl3+iWSvDfTXItJmBiUr5E2Na3IYtzm1nBEugTD5Tc5NaPvVgi8/fb
 Tlt2fUpqn2M/MRQfGj8XjZfl13R/QfY=
X-Proofpoint-ORIG-GUID: R78WkCTIHYxlU-OUd60NYiaQlAaX8D04
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE1NiBTYWx0ZWRfX4V+njciUP44q
 +Oflwpy5aOfBpnQ9/MnlsmEZPw5tKNQAwQZ9Q4hmV1nH2tDArceBnBBVMeqSRE0FEU7HW0CcYuQ
 2HetVRTCMch4orlBd0ynMN6xoa+ZviI7Vx8l5vE1hnUzwy1XOhvrnJ/QaalWrUzHZqULc0jKuwM
 5FN941IsEXnF+yQWxDKy2GNnJluWmYrTuQqusqQpYsHa0B4zyh4hP0Udw5CVlyE7uJK6ZeQkPge
 +aCUx0QRZnOETa8JDywOPONapscqaHhhqMR/IQ2Wz2b6+8iP0EoJx+PLULsptDsMmibzpodITID
 uzN0n1e36Vwwtlnw3hP3Il+T6GKnHueJSEPr1YsUwkdT2JKeeHYHNOg8lh4h/SjB+9tUYL5XF+c
 cCQmqUu8NxkGdLK97VUOzcZZkJ95do8XHbMQjk51Kfgco+qod2xaFc0+DerfBfOjvsdBeNTbhTl
 /ml78ukxGuJqJ0PVcvw==
X-Authority-Analysis: v=2.4 cv=H5pOUOYi c=1 sm=1 tr=0 ts=6aa2aa25 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7HxpRQPu5N1oW2hdKb0A:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: R78WkCTIHYxlU-OUd60NYiaQlAaX8D04
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100156

BAM DMA cannot process zero-length transfers, so the driver always holds
back at least one byte to submit to the engine and only ever finalizes
with an empty buffer when nothing is left to submit. For plain hashes
this was handled by returning the precomputed hash of the empty message
(tmpl->hash_zero), but HMAC's result depends on the key and cannot be
constant, so hmac(sha256) produced an incorrect digest for an empty
message and the crypto self-tests failed.

A zero pending buffer at finalization time does not necessarily mean the
message itself is empty, though: the caller can also reach it by
importing a state that already reflects some hashed data with nothing
currently buffered (crypto_ahash_import() followed directly by
finalization). Special-casing only a genuinely empty message would
silently compute the wrong result for an imported state in that
scenario.

Handle every zero-length finalization consistently through the software
fallback ahash instead. When nothing has been processed yet, let the
fallback compute the result from scratch using the key already propagated
to it via setkey(). Otherwise, reconstruct the fallback's running hash
state from the state kept by the driver and finalize from there,
accounting for the HMAC ipad block that the engine absorbs internally and
that never goes through update().

Cc: stable@vger.kernel.org
Fixes: ec8f5d8f6f76 ("crypto: qce - Qualcomm crypto engine driver")
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/common.h |  1 -
 drivers/crypto/qce/sha.c    | 58 +++++++++++++++++++++++++++++++++------------
 2 files changed, 43 insertions(+), 16 deletions(-)

diff --git a/drivers/crypto/qce/common.h b/drivers/crypto/qce/common.h
index 9cd2e6ed8bbb0f76e24be187d8ae7e2fe2f7b932..587d349da91d1faa2bed7cd488306d4358467b2d 100644
--- a/drivers/crypto/qce/common.h
+++ b/drivers/crypto/qce/common.h
@@ -82,7 +82,6 @@ struct qce_alg_template {
 		struct aead_alg aead;
 	} alg;
 	struct qce_device *qce;
-	const u8 *hash_zero;
 	const u32 digest_size;
 };
 
diff --git a/drivers/crypto/qce/sha.c b/drivers/crypto/qce/sha.c
index 406c33532612f0b37300abfc9c8c13e43d0c0392..a9a55bc5bc310d82a52b5637655007990da5b7a8 100644
--- a/drivers/crypto/qce/sha.c
+++ b/drivers/crypto/qce/sha.c
@@ -249,18 +249,53 @@ static int qce_ahash_update(struct ahash_request *req)
 	return qce->async_req_enqueue(tmpl->qce, &req->base);
 }
 
+/*
+ * BAM DMA cannot handle zero-length transfers, so the driver always holds
+ * back at least one byte to submit to the engine. A zero rctx->buflen at
+ * finalization time does not necessarily mean the message is empty: the
+ * caller may have imported a state that already reflects some hashed data
+ * with nothing currently buffered. Handle both cases through the software
+ * fallback: reconstruct the running state when there is one instead of
+ * assuming the message is empty.
+ */
+static int qce_ahash_finalize_zero(struct ahash_request *req)
+{
+	struct qce_sha_reqctx *rctx = ahash_request_ctx_dma(req);
+	HASH_FBREQ_ON_STACK(fbreq, req);
+	struct __sha256_ctx core;
+	struct scatterlist sg;
+	int ret;
+
+	sg_init_one(&sg, NULL, 0);
+	ahash_request_set_crypt(fbreq, &sg, req->result, 0);
+
+	if (rctx->first_blk) {
+		ret = crypto_ahash_init(fbreq) ?: crypto_ahash_finup(fbreq);
+	} else {
+		core = (struct __sha256_ctx){
+			.bytecount = rctx->count,
+		};
+
+		memcpy(&core.state, rctx->digest, sizeof(core.state));
+		if (IS_SHA_HMAC(rctx->flags))
+			core.bytecount += SHA256_BLOCK_SIZE;
+
+		ret = crypto_ahash_import_core(fbreq, &core) ?:
+		      crypto_ahash_finup(fbreq);
+	}
+
+	HASH_REQUEST_ZERO(fbreq);
+	return ret;
+}
+
 static int qce_ahash_final(struct ahash_request *req)
 {
 	struct qce_sha_reqctx *rctx = ahash_request_ctx_dma(req);
 	struct qce_alg_template *tmpl = to_ahash_tmpl(req->base.tfm);
 	struct qce_device *qce = tmpl->qce;
 
-	if (!rctx->buflen) {
-		if (tmpl->hash_zero)
-			memcpy(req->result, tmpl->hash_zero,
-					tmpl->alg.ahash.halg.digestsize);
-		return 0;
-	}
+	if (!rctx->buflen)
+		return qce_ahash_finalize_zero(req);
 
 	rctx->last_blk = true;
 
@@ -292,12 +327,8 @@ static int qce_ahash_digest(struct ahash_request *req)
 	rctx->first_blk = true;
 	rctx->last_blk = true;
 
-	if (!rctx->nbytes_orig) {
-		if (tmpl->hash_zero)
-			memcpy(req->result, tmpl->hash_zero,
-					tmpl->alg.ahash.halg.digestsize);
-		return 0;
-	}
+	if (!rctx->nbytes_orig)
+		return qce_ahash_finalize_zero(req);
 
 	return qce->async_req_enqueue(tmpl->qce, &req->base);
 }
@@ -431,9 +462,6 @@ static int qce_ahash_register_one(const struct qce_ahash_def *def,
 	alg->halg.digestsize = def->digestsize;
 	alg->halg.statesize = def->statesize;
 
-	if (IS_SHA256(def->flags))
-		tmpl->hash_zero = sha256_zero_message_hash;
-
 	base = &alg->halg.base;
 	base->cra_blocksize = def->blocksize;
 	base->cra_priority = 400;

-- 
2.47.3

