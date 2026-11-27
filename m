Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795799011;
	b=PfCjBVjvnpVOCgyRlYOImnKUg8Cju3lmTIPYH9sAgSwxJ9+k5v7YG19P7BX174AQzkwG
	 tWoPc3koWoBP640mf/8Ztrh6cScaiNggRizJBpW8lmVU2rPw4pu6ZCIfROcHCyF2wGfZX
	 vFndObLhtjfhMZyKhSqY6lQGRsHL61F6Tz9Fi0XXYDySiVK3M6EA21vU/Es5i7PnWwHvX
	 99u2ClyAEs/LI+sIkbusSssFaFO6LfCadRhTsRUiVtNq8ljCFy39qL0dMaKGGIc8fX6QB
	 3TxxtS2HtraDm4VSMb2QC4PKO6bT59qvoFWMfdTIt0DV0gC783dMqzdCF2FWllW7LHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795799011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=n/rsmG3FiGD5JF7kMgaJyBlIxTvJ/3kpRDtF2VUvB18=;
	b=x43IwwakGfKelNip2ITHKM3SQ8Jqx3cwnuZ/V9ylLF1ltXL8+nTvqSE/n5Xp5RV1IbO6
	 sWVVSvRqntetnCYmUdbPcj8kpGDOuhUYQiNW3kPabNIeMLvFlNkw+NoMgBJ1vWMzwXRjv
	 uS4y3K48D6PHwMa76z9pAkzl2RUcJcM+bp2Ibs+agV6mQYQUfX6PeYnT5NczX+e/9SDzB
	 nfIukNYJmQlX51HGGp+k/4W+ugPbSKKqrvfw+GVosMUhPnxN/joo4UDrmzBPDNr+SacOn
	 0OmFZG5rrDUAjLXwlk+VtqHtvmm+QzL4gnPMdis/04nyUh+rhBwqW8iSKdvEB4j1JgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ztnZMdZO;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8251F606A31F
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 17:03:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8251F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ztnZMdZO
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb5e3cbf45so8037025e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795799010; x=1796403810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n/rsmG3FiGD5JF7kMgaJyBlIxTvJ/3kpRDtF2VUvB18=;
        b=ztnZMdZOX2jBt+ZK4PnUsmvjkbVGItNMycAKUDMByLEp5jSlSiLLjgcFFSUHF186at
         fw9mYPdfwDoh4XYlxvWX5jkysSxzMUF27VEFeRga+/FMPYGW7TmH9+tAPVxp5FhJSLxC
         IfT4FNIoKiOce25DsDklYDASSChvmvFv2RwCbVDJ1gDIAidadZaX+EQkwdQ6AqGU8X4P
         aoUoBMTc9JwJpi8ci05YHu3wQvMSfjd2TGC3yZMqHljZ9ooxHXIRRcHumdtZRB0pkyk+
         vRZtOE6pghMkTsJ4AYqgFrr0U9FJ7/cNZWNfLGnC1wd9SHxxvWGmx+SslBOuOFJNZD0/
         Q1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795799010; x=1796403810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n/rsmG3FiGD5JF7kMgaJyBlIxTvJ/3kpRDtF2VUvB18=;
        b=XDv45XW0nQ9rKbB507O/i1YgTMtPbRSiFc9j/uZBXveolEEJCke5jA5cZ2Hz9GRyYS
         p83/mVydBXprpGL/ym294saVDAvSYnNnHXUA0unX9D/PvgE9tUvJYt1n25xa5RmWAFW2
         NPt7Frm0UMCmQ/IfUPxkdLL7usMknLPSnt1ZbZUPiTACZPPBDGtCvGAJZLQ7SaPZbQmG
         eq+W/HtMGW09MrgXi98OKEHBP5fv+nZh9MMtaU6wsXbORAowyJd0Rzt50/QiHeK8RkbA
         q6+4WYJlrhB5HsVKRAX820dBBgfMq19wzAB/bEDcY3JKsJ9ixt6m8Sqpvah+1eqiveb9
         tvzg==
X-Forwarded-Encrypted: i=1; AL+hErHwtBQW06rtXCtY7lV2fkXy1LHyYGPqLl9XVeoX89igv3bMXp4HRDWTcf/mE9Tst3QRDgah6LW3YYUsMkED@vger.kernel.org
X-Gm-Message-State: APuU4Z9ciT/ZwIHX5VUW4u0kcc/6fYPA2us/gWMA4K0AzQ0VPsbzu9rC
	vSKgT0o8flb7Ljb4ZuGPAl0p/kAmzcKaHpkl9hqLd/dXKQChNsXCMZVA
X-Gm-Gg: AZFdTZdOo+o9cxbPK4Fsf3gMCHKP8vK6k+J+AcK6n25LJtX3MZZ7jF7t392iwoyS/V8
	eaB/Tc2vt0DeKDtKWfNTC8kRpRr3x52VFs94njrKKzBNUSDGeRBaM/AtrtDgf0+8p3+rkFKqPQv
	ehVLnJSSuxGRhLHTN70v/q/332YHrMiGb/SGMnt1Fbcto6kmYcrHj3bzTdxvocX0vQOpx6d2szt
	oZLTDq3x56KB4xqrb9XILy3hoKOqwzqlMcbCF+DraYgd0JQbVr2+5boBZ4H7/d5VnmkYoPSE4i7
	1dPV+Td94cZB61mO0EYXuZlsFcYwiZXLRwwD50HC3anUL/D460JRkbLdPuZ+57kwtzdENWnxVrT
	HYN9GOF63LoI1P3iYJQv40nutVFFsxDLnhc4WXuItPyO5SPnN+cHXdySQKeAe/ARRQZjl3IpxlO
	UyhWraRIzjXEg5RzX9UUl12jb1Kbi7Bl5CNoFKPhRWqc/+EWCz8eKfP0W6CkYH1H6UJYP7Qkfjz
	SrSR/QTfQ7Vek5IPD5KiW3Er6U+yp+7rAA5ccqbOKvK/IdgP+F79V/7sV7SMcmqgnBXDJSrIZYz
	aQ1xNvysZv5NlEaCJqCGyNEOzqDfNRbhm1llEfbl7E/Dpw/YgLSQDRG668vyZROtbLf3YqTOPi1
	nhDoAIzH8iAhJCd2COlXL
X-Received: by 2002:a05:600c:2909:b0:4bb:b39d:d447 with SMTP id 5b1f17b1804b1-4bbb39dd4famr49921115e9.1.1795799008808;
        Fri, 27 Nov 2026 09:03:28 -0800 (PST)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-006.paris.inria.fr. [128.93.83.6])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb8533579csm607680575e9.2.2026.11.27.09.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:03:28 -0800 (PST)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Wei Yongjun <weiyongjun1@huawei.com>,
	linux-crypto@vger.kernel.org (open list:QUALCOMM CRYPTO DRIVERS),
	linux-arm-msm@vger.kernel.org (open list:QUALCOMM CRYPTO DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] crypto: qce - aead: unmap the scatterlist that was mapped
Date: Fri, 27 Nov 2026 18:01:59 +0100
Message-ID: <20261127170201.62667-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.53.0
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

qce_aead_async_req_handle() maps rctx->src_sg, which for CCM with
src != dst is a table built by the driver and not req->src, but its
error path unmaps req->src. The mapping result is also checked with
"< 0" although dma_map_sg() returns 0 on failure.

Unmap rctx->src_sg like qce_aead_done() does and treat a zero return of
dma_map_sg() as an error.

Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
Fixes: 5c0ecc2e81ec ("crypto: qce - Fix some error handling path")
---
 drivers/crypto/qce/aead.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index e0061bfab216..54cc6bb8fd4b 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -450,8 +450,8 @@ qce_aead_async_req_handle(struct crypto_async_request *async_req)
 
 	if (diff_dst) {
 		src_nents = dma_map_sg(qce->dev, rctx->src_sg, rctx->src_nents, dir_src);
-		if (src_nents < 0) {
-			ret = src_nents;
+		if (!src_nents) {
+			ret = -EIO;
 			goto error_unmap_dst;
 		}
 	} else {
@@ -478,7 +478,7 @@ qce_aead_async_req_handle(struct crypto_async_request *async_req)
 	qce_dma_terminate_all(&qce->dma);
 error_unmap_src:
 	if (diff_dst)
-		dma_unmap_sg(qce->dev, req->src, rctx->src_nents, dir_src);
+		dma_unmap_sg(qce->dev, rctx->src_sg, rctx->src_nents, dir_src);
 error_unmap_dst:
 	dma_unmap_sg(qce->dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
 error_free:
-- 
2.53.0

