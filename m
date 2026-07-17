Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45834302F6
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 15:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784303654; cv=none; b=PkJ+/QIjJ4I35FGLksJ0ruLeY0YYKslZlpaA2e004ZldEzZL7/h9B4MEC1gp6CtT/vx6Bu2t+0DWsknFJc3N416WVL4EYeRZky93kLQgre4TH0GPqh5MY1qB16FARdsDH6+g+zWhvb885Xczn1ZBFHEEcJV1JiHJZti4dKVwn40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784303654; c=relaxed/simple;
	bh=q9N7xvaeFpdxSCk21VylCtI8nPZtUNdJ9Z4Mvdcp2Gg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gwlQGZDinF9O3ctvW83IEWBpaGxvTgIsw8CJGZHLdITKMyUleUInW5hIqkezLgvSsXbfPCNMSjWN9g7NSWvZ0/dELg4MTEVeBuoto/+/zZECZtVNlS5CdDtrYzeFZWCUDFxAhCNPqrJwV17+iUjV6xIUcoIsBHk/lLOri7V4BZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nklPZC5P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C+fzwevC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nklPZC5P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C+fzwevC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE7i4f2093883
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 15:54:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	onHSjGInX0rV0mVGlTmmcWeekHeD6EjKdPIS+Vcr65E=; b=nklPZC5P7auanFpW
	cqDz7hb5FHhOldc9e7EGx1GImFGDyndJDRKuBem7CjgW0dJsp9jsTT+S2/Drtm2k
	hh030J49c3tk7H3mrNMjOFtsL3bjr2wIvq3N7MJf4ZdC8LBydqy3QBhOV6C0C4AT
	Cb+h7ARXi1GQtX6KcM0ZdGOhNGXdyLsytunzk+txKoYzoGKnij90TGoG+kKynwTZ
	lmgJCmujHSa7UbHlUafOaRvPkRfxfNJXrGBWvS/tniUcirLM3kwd0p0w9wg5wm+3
	sI4UHMGTB26wD+pf1u0lLkhh6LlSG8nHYWpYOiBT712m4vGc/OEEfNvyVny9ZuVE
	wG9qDw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffbqujwes-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 15:54:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d30035dso98803341cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 08:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784303651; x=1784908451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=onHSjGInX0rV0mVGlTmmcWeekHeD6EjKdPIS+Vcr65E=;
        b=C+fzwevCeJr25vx6rRLYKCBFpCkZDJOQwr8g8ZSksfOEMKE13Z29qOphl7QkuGPoQu
         tKZU0p3qhhaQK/1UnbCgd/2dx3gOZOSk1G6snmWerOIviUumU9gkSOwKnGUrfZTjrujF
         XGt6KhFzfFwT3MXp4jONgwt7IJzNUZS8mAdcu9JFaAE1VrKXtbKe7a99GORauySNJ74V
         vFyaNGDzFGqHKecxE4fT3qrMmiqwMewAZhq2x//5gMwKC26dF6PS6duU0cx4cg8AQDTt
         4J+bHLJUkNrw+bzDZiGi+PCwn1OI3Vx4XYGU27+bCepecDCxIo4RJX7VVPXcVuII0gFB
         CfQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784303651; x=1784908451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=onHSjGInX0rV0mVGlTmmcWeekHeD6EjKdPIS+Vcr65E=;
        b=H6KkpOcDup9RyNTv70rLseKTosh5IKy2QYIJMDsHCCt9K0YzjCm9Ij/xi70YZDCnFd
         4T2xsm9wGK+rQ4JVxqg1+5//wXb4996pyEx72zr9Wp8k24kVrtxlm/hUMzFH7PZAPkfd
         rqTs12yBnICCiOciQYDzVC9ZcSDbPKF8MPfHSSs/WfUaxlwbHfKPdsUgahcHMB4pq+Hk
         20akIloaeeAjMb/YIUJROgyscZ44yevQ6cB9Ld805spGgrfxZjfineDYCTJj524cFPSa
         O1QI5YS+tqmztPrXd9hcpH7VuBKMJfQnQjdPjqxjUyBDjDqC388EufhwME9gdj6qPy/F
         M5RQ==
X-Forwarded-Encrypted: i=1; AHgh+RrIUbX7axTWsow1xQAX6ImbyKSnukLDN7XBRCVhfkQgsTLto1Yk9KEbB6nGfphomiWEC6L95AJoRBzIW/U6@vger.kernel.org
X-Gm-Message-State: AOJu0YzeTxKqeGYQZ7ayaIFfObstTsO9PKDul9+bpzUGWN5pF8spuXAW
	dma3EFnHxBcwNMG0hTQPtRlzAED2CbwHrZEz3+KzsiqeXC+4BukWoaidqXgLAswHuL3jOM4nEUi
	qmjLKegrtGajfGE2yflPpXnYk7on0hDBXghRgwon/l2yFTJDTH7bHdUz+P/yZjNriC9oU
X-Gm-Gg: AfdE7cksKxZkY22YExWwJY0mY71imwHEZClR9ntD5pCO5LklDteh+cI+uMwwRtqQRw7
	Yt5G9QyIThob6CJE8cmqSv6XUsjOj6zwyzumYInCM+8erF1exkl106i1XLDK0SzfRng75KRcU2h
	B3ukTZ9ybkcvjmROfEbJsVpj2fcKRv9dSzNqM7S0HMgJTVHKpnXYkqUIiJ1lmyIO5KI100DSXcj
	vyg1eptnt9uAQYgjiMWJSHC1Gf4vczijN2rqQYPZBJ14FtYO8uY7J5qx5wawwBd7zTX1lqbaSon
	il3gXsUBn4upraEIYRgpoDhQwC3UAkaPx/J0/VeuZ3MQkAYveUPoAPx8odmTkRXvXxTfWMXjhig
	ofiB0XpVoQSHLscCUmRdYRC01H/5vXA==
X-Received: by 2002:ac8:7dd0:0:b0:51a:8c97:938f with SMTP id d75a77b69052e-5213e18860fmr28892781cf.70.1784303650922;
        Fri, 17 Jul 2026 08:54:10 -0700 (PDT)
X-Received: by 2002:ac8:7dd0:0:b0:51a:8c97:938f with SMTP id d75a77b69052e-5213e18860fmr28892331cf.70.1784303650370;
        Fri, 17 Jul 2026 08:54:10 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dc44:5b1b:5396:79d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a2511sm47057095e9.1.2026.07.17.08.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:54:09 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 17:53:37 +0200
Subject: [PATCH v6 8/8] crypto: qce - Use fallback for CCM with a
 fragmented payload
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-qce-fix-self-tests-v6-8-455775fe5f6c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2908;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=q9N7xvaeFpdxSCk21VylCtI8nPZtUNdJ9Z4Mvdcp2Gg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWlAQXNCChL1UrK4bRfwA92PSlOjC2dUMwPDrz
 J1BpRodDGqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalpQEAAKCRAFnS7L/zaE
 wzKaD/4lR9hqCPGegnYdO7QAL4CJe9GaNy27JCMbb3siL5uedhPk96D3l279BT1z3jZEgRE8gFn
 cArGyFAOlxtlf1iVnJUJAtdysX+KAoYmyyfzudcN3PEuDHjW2l3ZQKmYJRHCIAN30Xhyv/w8N8z
 mp78f8PRdVbl3MH+2OZGVaX1S5ZcRNZV32AeXmLtLbBax9l1McFjZZvC5xkuy1PW3MauopQ/Q7f
 F2XU1jqjfqDXIYcCJ0sGjfC40vf1s/xvVPnfYp/EZqkwJ4mkdCgA6k20fmjJaGSNJTTh1XtjTK1
 EHFMvQMk0VLa8iJ4pLFhvgR14RIqdt4QEiBIAX7Gvoak4yC+CyDyeJHeAdLs1MQlmIz7vCnuiXc
 YRYuXI5+gJVKk+dKKCkSXYXriRocZYbJNzCPCVS1IFXoR2PnkSnRMon+MGivZmDEm2luSKMZ/nm
 tsbgZyub/P3PuCv4D8nussWkc0yJIU0wu0o0p1UiOC/21rmAHruj/p1VlFbsrKzm54Rz7tvS5YI
 Hu/iYd3mEY9XTrxvgx3Jl7JZDxuzs5bRP6xp9jWcl/GBsAF4pRPf6t6zWOgA6ntLX4I58QSDX9E
 yGsm40cqbJ1Ly+5zeNUVADcq/ngWpdk4LYbx9yrQIfcE++O48azRBsb+xz7rrZHtIdgw+xkJidR
 zxO6Q5IB+xUMx1w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: RpfeRZ2NJaZFfdrvCnAkXyEM6_ETuo9i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE2MiBTYWx0ZWRfX+rE1u8gnIpcU
 MKQl/R1t1z8e6JQ+a5FvJQjEgdBbxYqzJt9A6dqOv8e3Rj6z3mP3xGgJcIp7idermykUWLSTedB
 33VCDBfJFpiYGZU8Z3UwuZyUk6zmrZT3f+bz+EWCytyIyi6FV+Jt3L7R1nVIbzSBPlob6wjTdJX
 xfpxB1u1Yt00jjz9Y+IA8bYl0c5wcryQcGIj2Tf1ebHtFkfXD9CbGfjzIo1w2ZQ/gLOjZRxDwr7
 jtRBAZPXrSNNTGcQ10QJTvetZLlO2gr+GtL/wMMEFIJxa0FaDx+B4ZJBGDRqFk8ctDrTkA9yZJG
 R++D6NTEY0o3+CtEF+p7Z5vZPEqKaPFIHCEAmJK/qh3OQYb6sA1IlqNm/+3y3CyF6RKHy6CcGAT
 LvarZ9c7NKY17gHz5xzkbrSFV3On65J6KZl3/W+cNjv6fbI6fUQLHU+DQIZhKB9Q9UYIS8TuvFq
 +wEkxylVgnCmtUxvmVg==
X-Authority-Analysis: v=2.4 cv=NZ3WEWD4 c=1 sm=1 tr=0 ts=6a5a5024 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=phyxH6jkQibGXiXynFEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: RpfeRZ2NJaZFfdrvCnAkXyEM6_ETuo9i
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE2MiBTYWx0ZWRfX8n90ifnKpjY2
 KrF4ncLeLXINZJdujMIJ9ZeOd+DqR8RLihqPlVhkMuT1lkVPS5bzijA9TdUpyMdKIlVWeS3fT1e
 i/TUAUM6lzk32q9y0y+Q94VUFqasN7k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170162

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
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/aead.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index 4fa018204cb628c112f64c45ff6c7407df73b945..9ff8fe2a7efcd2734e4ff029744961a7b1101013 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -498,7 +498,8 @@ static int qce_aead_crypt(struct aead_request *req, int encrypt)
 	struct qce_aead_reqctx *rctx = aead_request_ctx_dma(req);
 	struct qce_aead_ctx *ctx = crypto_aead_ctx(tfm);
 	struct qce_alg_template *tmpl = to_aead_tmpl(tfm);
-	unsigned int blocksize = crypto_aead_blocksize(tfm);
+	unsigned int blocksize = crypto_aead_blocksize(tfm), authsize;
+	struct scatterlist __sg[2], *msg_sg;
 
 	rctx->flags  = tmpl->alg_flags;
 	rctx->flags |= encrypt ? QCE_ENCRYPT : QCE_DECRYPT;
@@ -522,6 +523,27 @@ static int qce_aead_crypt(struct aead_request *req, int encrypt)
 	if (IS_CCM(rctx->flags) && !IS_ALIGNED(rctx->cryptlen, AES_BLOCK_SIZE))
 		ctx->need_fallback = true;
 
+	/*
+	 * The CE reliably processes CCM only when the message payload is a
+	 * single contiguous buffer. The associated data is linearized into a
+	 * bounce buffer before being handed to the engine, but a fragmented
+	 * payload makes the engine stall waiting for input, so route those
+	 * requests to the fallback.
+	 */
+	if (IS_CCM(rctx->flags) && rctx->cryptlen) {
+		authsize = ctx->authsize;
+
+		msg_sg = scatterwalk_ffwd(__sg, req->src, req->assoclen);
+		if (sg_nents_for_len(msg_sg, rctx->cryptlen +
+				     (encrypt ? 0 : authsize)) > 1)
+			ctx->need_fallback = true;
+
+		msg_sg = scatterwalk_ffwd(__sg, req->dst, req->assoclen);
+		if (sg_nents_for_len(msg_sg, rctx->cryptlen +
+				     (encrypt ? authsize : 0)) > 1)
+			ctx->need_fallback = true;
+	}
+
 	/* If fallback is needed, schedule and exit */
 	if (ctx->need_fallback) {
 		/* Reset need_fallback in case the same ctx is used for another transaction */

-- 
2.47.3

