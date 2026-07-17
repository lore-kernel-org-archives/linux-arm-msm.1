Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD0D3BADA2
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 15:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784303640; cv=none; b=O5KN/K8s4TP1gVUBDb3Mn2SRZ7xASfxF4w/Zyn9TU07wcKesMrucSOSSlizin8vsenVvk6qtPzt9DGPXCg3N2RvHx0Ejzq96WrMiw5VEik6alwhDowt1/zDZ+Jj4Uj4rnl2EKL6xi7vb28uAx4MRJrIpxUvhaKCwuaw4voZQBYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784303640; c=relaxed/simple;
	bh=CIm+OFp5Nm1xQddRse/kgkRqbKVFHtQ2VOHAIUGGPho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wbq9g0ZyiY67ya7lGjjDmgrSxN/Y8pCR7wHLIpqgfqal+9F7Y5CGG4qoHzO50CoQHFNA6FekUCEBc4s9jwY9Ej9pyDg+0288iu5rhsnC0hiIPVGeFDz9gKeXcrxfLnN6PFttHK36o+f+q3HE8snWJ8KBVn1D/+hGpyU+L4dj/gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eJraoD7k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WBM54rFO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eJraoD7k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WBM54rFO"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE7hae2093878
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 15:53:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aMqbdOpIropXCADEsUAHHr2t4mshJ33rF/tISH1SWLs=; b=eJraoD7kfA5wnpap
	m8tg5eVOG271ZnUvPCuC0ECO4/jLdCSgHKK34/ty99vOrOGGtTBWw1oxoVv5cAHZ
	b9VFATa0YFZnyW7tisiuzlMIYPtWZ6A5+jO/UopEcu8yx3iGFm5dQtKWLjCklfRU
	vmcwrtXsfnZLtDJKNyJb7Ml28q1NsgBi6wq5ZcySURi+mjrECTdAhNgL4WZPgqah
	joy2g71ghcLKWlS/9LQxHoo3XYiOYuDlnuRL8Q7sUkSa1CTPXLTTer/1rESq138o
	PTrltpYv8dNV8sZpISkwxMo80iRg4QdHT3/lwDdAd0dGd0xSFDBrAHfS3SBKaIfk
	TSZLhQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffbqujwde-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 15:53:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51ebdfceddcso63461601cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 08:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784303637; x=1784908437; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aMqbdOpIropXCADEsUAHHr2t4mshJ33rF/tISH1SWLs=;
        b=WBM54rFOAvmt5lrdid1oYdEhJczzT4EWQobvlQfjDOC8l50LBUmadid+F8UsL4/Bsm
         pK1SzUriRTnk+DkwULuvFV9Ow71ihTY+uQur4TLFcUS0nI39QrFR33rYeOIn7WQyARuV
         Q3h384cofjXbFWEz2aTKfFYXTcEZleg6H6Uj1IidtsUh37YXo2F0g5Th3qGdxrZEF0aL
         Y9d1WXV3Nj9BwcvapRemumvT+Yv/GvF343OIxhA8p1QUYjf9zwIgcf8fWd/GVgksCOQq
         Onin7tmYON1VPAgIRWhgLYkUNktpKCN3VEtGsS7nOOqnYpgSgIBIEIO7zkQL5Uwtm9FM
         kgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784303637; x=1784908437;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aMqbdOpIropXCADEsUAHHr2t4mshJ33rF/tISH1SWLs=;
        b=GiCYCcHhll90lg9DJBuY1aMcfc2fp3vNpdGlfVVK2a/IZImnQ99tN1qvHx4GySB59j
         3xhMDfuKaX+FmU3hH60RKyorfWzF9sQmz6GA8PX12LOFRfaEzbEnfx/4GjujFX7d2BrJ
         zjYma+aH0IhiSXCmdGsh+8YgRoetHbHvzQwJ8sLaDZdZcI/f34SKo+IT+k9boKRD0Z7G
         wQ2/xjC9mVEUkxB+SlIWGNJ8lA6qS+F46ZUS+mXojs3f4Y2ZYuuZAMUmx8BDSP5/ZwZY
         Dcu9GVRv/SPUe7yzez1R844e4ZGa8zqXB3RhRu3e1iv57UMbSI49XC+5TBWMZVLabIVr
         caOg==
X-Forwarded-Encrypted: i=1; AHgh+RpTJK0hRwKsom7xOOWAozp7juoJthYTo9KiwXMTRtIs5u12cKE28lsNnvMLwLOb4Qk7sf9hHjR0MWZQDYoO@vger.kernel.org
X-Gm-Message-State: AOJu0YyFYf3tgt5chFX/CNRzYDiupfd9jJJAHEvcAnRha0oGMXzhRPUj
	ENACZflqSwZGASwJ2Nrd/tkzKGGsgszgOkdyEW4bM9BtvcyIgoTtl1lz7XpFVBv/xuMY2ubvEvR
	7anlX7C1Ve8olo6oismDBaJGwl+1+ovtGhSIYjxWdl2IhleLHfYgQYqkzsslP3BMQaG1q
X-Gm-Gg: AfdE7cmMABDL5Ox5pHMXokalUzXvUkj2ZE0zzjKkrqSY/rLT1BCEt0nx8k9LC6sN5nY
	AgYjrmsJNOeXjvB+SQu1TkcKODKC2pOUbJXYB4bmAZazh0MWTHDKMoiftQpObjQIEtdU8D8jGzk
	bTkPQCa8XvVkYE/dqBa7gx4gdTEd/pCXdeJcH1hryVw/0rIWMWHQUR/pdskYb0n6NZK8m6bvCjt
	ekGiU38KFTmZNY+ShDHVvvIN9d0IWZE0xC2PfnJNHXHKC4QkT7+HIH7q48xoc3YbCBVM4GbwjZ4
	5zB+wGb4BlyY7YC8u2/nzYF/ZMwvLUDxC/1M2GWtBZHGMmFsSz/mA+0c4MpGQ2eLqk+zjim2S4V
	CQAgFZNVOS3uUF12X4p8ZsbwJnMMulQ==
X-Received: by 2002:a05:622a:1a8e:b0:51c:478:32a1 with SMTP id d75a77b69052e-5213bb216b1mr31172571cf.18.1784303636807;
        Fri, 17 Jul 2026 08:53:56 -0700 (PDT)
X-Received: by 2002:a05:622a:1a8e:b0:51c:478:32a1 with SMTP id d75a77b69052e-5213bb216b1mr31172241cf.18.1784303636353;
        Fri, 17 Jul 2026 08:53:56 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dc44:5b1b:5396:79d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a2511sm47057095e9.1.2026.07.17.08.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:53:55 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 17:53:30 +0200
Subject: [PATCH v6 1/8] crypto: qce - Fix HMAC self-test failures for empty
 messages
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-qce-fix-self-tests-v6-1-455775fe5f6c@oss.qualcomm.com>
References: <20260717-qce-fix-self-tests-v6-0-455775fe5f6c@oss.qualcomm.com>
In-Reply-To: <20260717-qce-fix-self-tests-v6-0-455775fe5f6c@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5101;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=CIm+OFp5Nm1xQddRse/kgkRqbKVFHtQ2VOHAIUGGPho=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWlAH3isuiL6By3Bw2C+V0aJJnnjvI/ejHwyGV
 V4U6yBqn4aJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalpQBwAKCRAFnS7L/zaE
 w2rIEACg+QmuikTyoS3d9YDDi0u32F0LDWMviw7k6QgAGu6GYIvraxfCCmayeU/OaSr+uPLMwze
 VB01G+dodcKPjCIJU/q2HVzdZfeDN0rEHRO7qpwKHntDbvgCe9/xJwPx3Thf9ioVvo60QeudSZh
 SiEireITOTfcq472mG6h0AkQUjBlAOEcl3HApFzkWH3obBO8g8YGZhKHnxpg8Q8jfpbb1tF2EfN
 wcPpi0FTPq8RwxdGoosqdXKna1K3Gt3L8XklxEA9gYntTJZr7CLqkKu8JWrSN/OAvkFezrLFmob
 Ea88g/q09GZak4/4MBA6RkFDj5gw8F6Y/pm5vgfNoOmCEYh5OGv6lAfV4lkiBLCwFV2g7TnXRi9
 mDAxo+1rNrEvS3Dw2dmL/yItmDP9U8Llu9jQpPaeYpDVftLelYrCHrMRm+E7FzehO6Wf2vx7oTD
 lon2l5lBi7KScE7Y/6dHXkOpypjj1ago7NfqNlkQ2Wl7l1xfvOzctI9BrEOTJxONcSzBEkQawoI
 igdR6kFF4/7qgVTegdI+Kolh1M97uUV1IBl+rWLt9O2l2IwWEdYcPrH5BbJjQiMOi2gvjDYG0zx
 QWtZtwsrdmV7Y0RJJWYIvY+dBhIBA51qFNDweBacekKDhRWUP2O/w4MCoODJg9CW4vX5aai0QHY
 l0nMhKBX7By+OkQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 8aGVCCLgl_dPsoUsSgMXmQIsKcHvXowY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE2MiBTYWx0ZWRfX/wgflvc0jXk+
 4lxReFOMcuL32IVGc5m3sRKLeme9xl69uoAxIrVMnCz5FRbJhzsA3koeGS2BHtV3Nq1no2ipMSJ
 6PRavJ9+E20nvXuTJNK1zsOHwpO7AaMaycyre20EB0Ny4Mb64cHxq3P6sIIv+nQNYkdVgYgL/ih
 VAH00LhiojEEHEE/vl0VF173XYNUVWDDXuc+zvICq38GaMHIYa4cKDrNEhM8QyMi8yeizYIfdLL
 fqb1dJAQvDzy6OBwJdJTZE2omhkINuJjJeJAWAwIqm/fL4tSmsFwaAQrkCDfZKP1j3BNKOoDRq2
 A/L/2NzhXtgLtI98J3elMRTucuPs7N+7DlUYs/hK337SkVx5Ixcp1MQQiGjNbuKDDS0O2MymQV3
 AiGPEaa7PZudehVMjIw5ARELJPGOyXW6KVYB8vlK/gaEz06vd8D63d9bXyMqQogKzaslRw/SRgs
 UPxoOM/dwd8g5UYD5gQ==
X-Authority-Analysis: v=2.4 cv=NZ3WEWD4 c=1 sm=1 tr=0 ts=6a5a5015 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7HxpRQPu5N1oW2hdKb0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 8aGVCCLgl_dPsoUsSgMXmQIsKcHvXowY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE2MiBTYWx0ZWRfXz5mxut3kGCVX
 B3yzXQaYZu9RjGRbNctz4nHJixFChMra3UWSobg1lSH4E0bY/gmhUhIHbhJbogyllZNv3q4T6CD
 7vLU+QQZVkruJWt9NPc5Xkz9MLULKyw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170162

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
index 2215d6023fa5a06d741dea8e7c4ee8ec0a6cc45f..ac2d22d55d0838c2a7f12a4f3387c5d5021bb55c 100644
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

