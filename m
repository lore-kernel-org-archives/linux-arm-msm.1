Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDC749BD7F
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789995535; cv=none; b=F7MFdmuNZsi0cnzBp7m5KgRuqfWB18EyEhtH7pZfk+X9vqJ+yq0lTQ3g9H2/eeMvbCI/Ji/cAEBRFqjCYyUk7bBrs0wEFpOIiml2QZE3H5wxLx9QvEwjzPKEHN1AT3sPIbd6oZX3GbT3J/2Mcy4Pf2jbuZl5dAMYylro2SuSZhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789995535; c=relaxed/simple;
	bh=KW1xboFDIw7GUw5/K1L/QGR8hCZPAPAXS2iVODYVr6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z7bfZwMA5oX3scIpojj89+v/GMxJW5layB9m3u15NPxyZ5q7/uLwiyXjpohIb0W2UwKUvyQc5bdcCb+kmT2lmPlHC1y1JCHv98pzbjmH6LF7NH44rae0nC4SSakP5AlDMsCYDJwlmUKX1dHoGCv4j21UJqlEVZJ0TtpI7CLKag0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mvzE3FyQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wqo66AvW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mvzE3FyQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wqo66AvW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LB4pZ61130013
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7EU+wkow0wdDIWrKXMXcNY/o+lSeS9qvjpj3PNv9N8s=; b=mvzE3FyQb5phIviS
	Lttt/eiAx5l5oZ+zXOp2Iqdy+/8PP6bDNk0FkDQcQUzcFAX0s/5EdUlm6YpY/VHl
	seXXzQ6TNY9+aOih+z71Teu4mHHe7y88AkgW+HMLY7KDSNOsw032CWP3xIeMniUD
	FPISZPyVvzR2D2aCVvireHFrc2GuDW02sAZ+VJlgtBJ7AOTCqruupi7tOwnCUjbb
	k8PSaPdRY9xm77g2qUe6zI3y/GNg2EqyCVvbafgkxZ1I9mig7n4jOuKIjbiboPAC
	ae6iNokv591RAjmaHLoqQG6jGFJjmoNrSvjVTPweDzFLuj6U5mo55cDsl7SZRO3I
	QJ0Aag==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu3csgdjv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:58:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a0c7126e7so539765285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 05:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789995531; x=1790600331; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7EU+wkow0wdDIWrKXMXcNY/o+lSeS9qvjpj3PNv9N8s=;
        b=Wqo66AvWoCwBxvsKnjP77iP4gc7DDxxMH6s+EFARecB+K0v57ieDuX1uJP2PxS8Oag
         EDgh5NX2ml28UtIZpQfb1y3yo9VX3LxrY5s4YOORIL33pkPKQGdQzjr1zopGt+9wpeTM
         qAGGD1KojqNUowxL4RupDaLAxYz5JTZ4knDGPF555KbpX+skgIKCqNRfjcT2HwaOE/LR
         GhO3MNDKx/wfIVVRjYtur8SieiXtMEPFCk24osCLTTU78hMWEBymrBLuScAJ3gUKb+Xa
         7qAAPYEcow0FhcXiCPAs05S4O9IGUUF3C99aXs33R5y4lhr3zdm+vg/CDJBCWKMlbjrE
         723A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789995531; x=1790600331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7EU+wkow0wdDIWrKXMXcNY/o+lSeS9qvjpj3PNv9N8s=;
        b=OMJi5uBlkxl693Dkj8Weyrj3AhaFlucGaciZCLBOWCYXTNuZ89+AnIuh4Oaa+tVbaB
         da16mHoYMat4Ek4yksflpgbZcuj3UZ8K47NihCKld1hlWU7hw6MywxHbV3PMh14XogWQ
         dGl6EOYsnjPVdLUh1FpfWNO1X1CJ89vdLl94UFzp0qPTJbTkw/Y1dorFfmmQHmwVm62Y
         7jk0gzY+wewEiSRmpv1vUcb7RACEWkejEtcFZkI+i/6tZbD6LcHNl302hlO7pIVcfZUA
         UiPSnmCNk40f+JM3uPqHOPbgG4wztAwUgOGaRE7qigVCly9FqY1Xi0TD7PjHiI/P8n6G
         wU8w==
X-Forwarded-Encrypted: i=1; AKwUvBxH1PJa6TRkGq8muwCpfEyxTMo3yBAbLZhUlJiHDGpp6+r42D2AW5S/vPGpjh2NhK+LcC+44fsqC44qEX6n@vger.kernel.org
X-Gm-Message-State: AFuF++ntV368prWgLafmrxFJKFAsS/hIueoFpoxbr9BDy8DTr9yXEcs3
	p6xqwYxt1bxFVnvGdfnvbqMeZ+iWQIcpnIzc5ZQJ6WzBlgZVHykYEwOP4EvYJGuEil5c42nF4We
	RJCzhFhUXj4Ve1Qru3JoycjSBb6FNNX6q2Mmar6dvndfWt3SD8UhYfpSfekZ8n6v64OdK
X-Gm-Gg: AYBFou1D9rG0Wcq2iTW8iKASgyIOSGY47JiYO/50zDZhtwdp03RSWHQUoEhWr+7UQTU
	8EJk/cFyvpmAKbZ5g/LQTG34cmY36f73xC9ZY4vdWnHvkXDEeiWYCVj0MeLS/XRlCfvR31vjf6F
	3Suc/+ivrcrSSEOVJzIH6mDhXpVAWIuJrk3AeXki8X8TbZkPATRg01TuZ3iRUMygpi3Re6IuIgv
	W2Qku1WtOra834/CHoA51miOJF5rnW/Z715NGndwywFrqcMub1b4aW3gZzeM6O0KMRuZ6OUmDTJ
	3lfdMGOyZqRMFHUKLOAGDoH6JWgiLVqYFlMQGZjhZBQ/Fc7po0ij38QkvXl0dFusghg1++2iPZf
	HPYMNuNVNqNiFFXNblGMpKh4SNsc=
X-Received: by 2002:a05:620a:2b8a:b0:939:feee:630 with SMTP id af79cd13be357-93c15da20ebmr47385085a.30.1789995531168;
        Mon, 21 Sep 2026 05:58:51 -0700 (PDT)
X-Received: by 2002:a05:620a:2b8a:b0:939:feee:630 with SMTP id af79cd13be357-93c15da20ebmr47380985a.30.1789995530752;
        Mon, 21 Sep 2026 05:58:50 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a359037aasm320278766b.63.2026.09.21.05.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:58:49 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:58:15 +0200
Subject: [PATCH v8 06/14] crypto: qce - Fix xts-aes-qce for weak keys
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-qce-fix-self-tests-v8-6-107537869a72@oss.qualcomm.com>
References: <20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com>
In-Reply-To: <20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4152;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LHxn8qZQ7172JYTQczFIpOi+jAmwYv5eGxN5U2DeL2I=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsSnusXJ6mTA2dg++3IzzyqwVSxIsPDRSVAq4i
 1m3jU1alFKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarEp7gAKCRAFnS7L/zaE
 w1aID/9ZmjDlAMsP0M5cpuf554DLhUGaE4Lowr2sd3k7pPhqfNfXWruy8SC1J6hISelxpyn6o1M
 taFwiXJ8fuSwuG+nO6Ft9ZCTltVrsLdCz0Sl8bgO3oXvqGFDJ620hBdlNLFckAGsJ/mRDHG2VKM
 9w5UpUVpehVIQx9K1ra+QBioFXjpk85MiOLHe/mHQbNGMn+PFc67dvJESO2CbyY0MIKydcawIrx
 sPz1Jv8/RW5tKQPxAH/Ij3I/NnG1d1Q5IgYxMP2FqMnTDejyLO9wyBPqpi0F76X7hPfaKUwbuqL
 YG2x3dVKOzgWBb08lI2zfcqya4BwYoMFlU1f5eeqzIKttRmNmqr2xFN4/Lx4np5hbeOZfG+waow
 tenwoWzlXp8DlclrFNn87Dec6O6/+FZ/opUhzulx61KoYGWRXPwnk+oU/QupOflQVu5b8vYWl8M
 yoia0TGCwKhbsbrenvXSIU5u7kA8A16aTqLqHVZbiip/X40P8/b4/zbth4cXFm5exYGVkD9GfST
 1FQUbtZ+noH2ykXe5aCkkoahNXxsVmvXz65eTNLOt+q/eNLAu8eAdntWYnKOaeD4M76jaVF/ekw
 rbypKAoQ7vRPz3soFJGlZSAlhTvK1xIIfh1ERCqsJJCylpShh7+08MWQpaCh5HNYq5/BAu9SaUW
 CJqgrqYKAc+D18g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE4NyBTYWx0ZWRfXz9b8IiD/CTrW
 W6mnRkZhYg+2L8aoOSjHw0rp85lhEPnNc9IdnCA3a2TS9xRhYIOTp9RvgIWj4zMddBNlfidd3tX
 dPDlhJKhKuZ5vKC/zV+JOU0gaT9bRM4=
X-Proofpoint-GUID: kjrM6WPnDqJysDuw-UoBZv-Eq45JM2gI
X-Authority-Analysis: v=2.4 cv=QovLTlyd c=1 sm=1 tr=0 ts=6ab12a0c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=tpKvEUOkdOp8HkJiz7sA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE4NyBTYWx0ZWRfXxW4Xkwl47u+i
 PLiPEuMMjVbghMgJ3EVGsqkPp2PU/5nlVZxGQqqMyJTHTw+nQJOyQvMrFbH2V5nWE/g5z3lm5Xt
 i1gd0jupPhtMiX1zNeYvZg7TqgCQXDTXX1nEiNf+soaHHitEtCZHhWWePoy0Tv4zbJyCJ9dmx5E
 XiSFhL1Cd7l1PA8Yz2uPzDWvndKN4xqGPpmKnuXzlK/prDdEmB6rt+1Fw/C3I7tVKpGhiawIYn1
 2As5y1Sr8aU0PYhv6fSZ72jKaYnzKqaejnaKGj8mC0sjvf98pjVBvbOqCA0nSv+s1DSGBJhH0ge
 R2pglnSg2DwEODNf1sdpJ1g/gEVuSTm0lrkIEow55O8E+MYjysSa0Q0qqzFQ5/3/OC5JdmRcqfg
 m4HBqpnGY30K4q/rN6gdGa688D6WxddTIUtAIbJR3gcy3dr7f21mwyH6ygbghYc+yAuI7KHiADH
 IJG2c+elC0fpbTas1iA==
X-Proofpoint-ORIG-GUID: kjrM6WPnDqJysDuw-UoBZv-Eq45JM2gI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210187

From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

The QCE hardware does not support AES XTS mode when key1 and key2 are
equal. The driver was handling this by unconditionally rejecting the
keys with -ENOKEY(-126), regardless of whether FIPS mode is active or
the FORBID_WEAK_KEYS flag is set.
[    5.599170] alg: skcipher: xts-aes-qce setkey failed on test vector 0; expected_error=0, actual_error=-126, flags=0x1
[    5.599184] alg: self-tests for xts(aes) using xts-aes-qce failed (rc=-126)

In general for weak keys,
- If FIPS mode is active or FORBID_WEAK_KEYS is set: return -EINVAL.
- In non-FIPS mode, Accept the key and encrypt successfully.

Since QCE was returning -ENOKEY for non-FIPS mode whereas the
expectation is to encrypt content and return success, the selftest saw a
mismatch and failed.

There are two problems in QCE behavior:
  * -ENOKEY is returned instead of -EINVAL for the FIPS/weak-key
    rejection case.
  * key1 == key2 is rejected even in non-FIPS mode

Fix xts-aes-qce behavior by using generic helper xts_verify_key() to
reject keys early with -EINVAL for FIPS mode active(or FORBID_WEAK_KEYS
set). For non-FIPS mode, since QCE hardware cannot accept the keys, use
software fallback mechanism to encrypt the data.

Cc: stable@vger.kernel.org
Fixes: f0d078dd6c49 ("crypto: qce - Return unsupported if key1 and key 2 are same for AES XTS algorithm")
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/cipher.h   |  1 +
 drivers/crypto/qce/skcipher.c | 18 ++++++++++++------
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/qce/cipher.h b/drivers/crypto/qce/cipher.h
index 850f257d00f3aca0397adc1f703aea690c754d60..daea07551118d444d2f749588bdfe2ae2c6c553f 100644
--- a/drivers/crypto/qce/cipher.h
+++ b/drivers/crypto/qce/cipher.h
@@ -14,6 +14,7 @@
 struct qce_cipher_ctx {
 	u8 enc_key[QCE_MAX_KEY_SIZE];
 	unsigned int enc_keylen;
+	bool use_fallback;
 	struct crypto_skcipher *fallback;
 };
 
diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index 4b7545e6aed220b7fb5af7dbf20ab47db5d1d180..35bd59656931c5f12614405490f1e254849b9eb5 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -12,6 +12,7 @@
 #include <linux/errno.h>
 #include <crypto/aes.h>
 #include <crypto/internal/skcipher.h>
+#include <crypto/xts.h>
 
 #include "cipher.h"
 
@@ -194,14 +195,17 @@ static int qce_skcipher_setkey(struct crypto_skcipher *ablk, const u8 *key,
 	if (!key || !keylen)
 		return -EINVAL;
 
-	/*
-	 * AES XTS key1 = key2 not supported by crypto engine.
-	 * Revisit to request a fallback cipher in this case.
-	 */
 	if (IS_XTS(flags)) {
+		ret = xts_verify_key(ablk, key, keylen);
+		if (ret)
+			return ret;
 		__keylen = keylen >> 1;
-		if (!memcmp(key, key + __keylen, __keylen))
-			return -ENOKEY;
+		/*
+		 * QCE does not support key1 == key2 for XTS.
+		 * Use fallback cipher in this case.
+		 */
+		ctx->use_fallback = !crypto_memneq(key, key + __keylen,
+						       __keylen);
 	} else {
 		__keylen = keylen;
 	}
@@ -261,6 +265,7 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
 	 * needed in all versions of CE)
 	 * AES-CTR with a partial final block (the CE stalls waiting for a full
 	 * block of input).
+	 * AES-XTS with key1 == key2 (not supported by the CE).
 	 * A payload fragmented across more than one scatterlist entry (the CE
 	 * stalls waiting for input in that case too).
 	 */
@@ -270,6 +275,7 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
 	    (IS_XTS(rctx->flags) && ((req->cryptlen <= aes_sw_max_len) ||
 	    (req->cryptlen > QCE_SECTOR_SIZE &&
 	    req->cryptlen % QCE_SECTOR_SIZE))) ||
+	    (IS_XTS(rctx->flags) && ctx->use_fallback) ||
 	    sg_nents_for_len(req->src, req->cryptlen) > 1 ||
 	    sg_nents_for_len(req->dst, req->cryptlen) > 1)) {
 		skcipher_request_set_tfm(&rctx->fallback_req, ctx->fallback);

-- 
2.47.3

