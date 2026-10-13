Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0C84B405E
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885500; cv=none; b=S88jytipfW0trqRoDC7pMYBKimOLXTuwTIppHKzPz9Obkz/YfpLLQqM9duBdlFPT1TsnH6PX5kFZjxUozycFew5R+hykCN6xeZn/erAykVLW7xIrtL6LUINE0jwkmq58JIOWz1QgJ6lEVoS1uDX+J3lekDOUQ4l8n9r3/hxtObo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885500; c=relaxed/simple;
	bh=TSSQy2Pd8JjpT7NJKetxLQb7e5YRFQB11d01268HeZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kqCFOmKdgCz+Ve0g9A8bHBAaXBZ073mjmm6aGCd1TCZzaTmfwnVzeh/+Ji+fDuy0MrL+DdEuor4F0jo8ydNV+jTRry810RZgKYDIh9IBZO3s3T2DLHMjkEFKEw1kq7pXj/wgqYL7It7kV6hFFmuW3ZkhbT9uuoiwkXDHWt6yPTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KkI+Q7OD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OrA6vIA1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KkI+Q7OD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OrA6vIA1"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8PIQe302832
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:58:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L/k/0iM/N4yej6IPPB7ZfZaha1rAj6nESNlaiiveJ9A=; b=KkI+Q7ODHNU87gTE
	IInkh7Bp/zX3Sk1PAwMtG5N2WYEyFtbqMulHzKE9HqOLlZOx7kjDgT6wiwd2iT5g
	i2KlPGsthoX/WI2dZweB56d/eGiu/WTOmwdmGHgFJSh20PmkoCG0LiOumgHXjL0R
	s4R0A3tXlZfhqqpl4fChQ20SIu5qftXvJ4dAg9T9cOQP34NTMffcn56gJtRFSPNq
	qX0H4hFrdAhg9aHyE8hU9frfKv8Ydxb1ekgyDOgBAgzNtmohr4WlS9Aw9J+hl087
	7Te1v/B91BGPgekWcK2ejIX92zCLo1qBF0ZCxxDIPf0R13e5RP8miK3vqJDERcgE
	l7bvNw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98sqa8j0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:58:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caf6c528aso487329885a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 02:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791885497; x=1792490297; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L/k/0iM/N4yej6IPPB7ZfZaha1rAj6nESNlaiiveJ9A=;
        b=OrA6vIA1ncmeSqMIgjRDk4A8a30ZF8WOeiDv7qLzN9vFPN56bVUW7azoibZaurdRWI
         9wXHUg0q2zx6u32VPcr0F7YpYLr7S2seiOyGTtnOWwLm4EnshWG/qcTDyCrKn4D9cC2P
         UvUM0dZcyMCqi5cvgWLfFIFeKqN3iIz5IOemjh1VKZzP8pNsT/TiLlJEnC00zho9B0+H
         /SLQX9bFDKS+G5/R63Txwk51F+dn6hUr62p7/wZ0mmfYXPEpq1I7LcsFLl5v5jh1gXAj
         Af12qfAb5zoh18UQdKGnduqm7UC2aPhMiIQYK+VYVKfI1Wh3iwL+rl5MahfnaXtRv3Om
         z4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885497; x=1792490297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L/k/0iM/N4yej6IPPB7ZfZaha1rAj6nESNlaiiveJ9A=;
        b=AhyUMGEYEZajVMRQQDSDcqIUkiWKA/6xbA1/3bCiVtHmxeNEYayI7Y7e2JRHYo1gTZ
         Wg8D+t/pZcJ25EmElTyroBezwhXOC2z/Fmikb2RG/KkS+zN6r6f1CAOeBFcP8FLGlIKW
         7TbuZnE6MNsqrEaMv3azso+Yi4wgbqWuxitpE9PaMj5yPs9SdTbGDRH36thMeE69PtiF
         jKTiOqoxZ7sZZd23H7s9WAl/NGF2vqB2lt0fWRbuceM0qYT41/5Mba1rJfuSunJxvX54
         iS5YzuaOPC9MSTIbz4HmvqDG4BCWpS45HtJgB8wRerikvNhxaJuYYtVj6nHsYbhPmFVx
         HScg==
X-Forwarded-Encrypted: i=1; AKwUvBxFEf+xqROfQ9vcr3+6513THbW4PA5ki/kFNgqO26OEU+Jx99aUdeDlZwQETOTGPGFb1Kspy6yqMdP7pa4T@vger.kernel.org
X-Gm-Message-State: AFq9FYLc4oaWVMQANZ+FyRla/lEIvP9tSDmhc2Ta4jygG9YM7MjWdS+l
	BPmH/jaqadk6n83VYUQVqjjT5fxhnJRUMHVkRAb31P6mc8ka+kJEvbBsLnyPCwMGXOQaVJZQo0G
	YR9DiJ2Xj1uRheObCbR5fm+HCPPoNSQHAAVP6qgkb+ojnAxByxpTYCZ6+H+KyVvWqIYpC
X-Gm-Gg: AYBFou2V0jMC5q+ilnI2AUXRXBp/NKk74KCIgB2FkGf9OT9z8tniEqfbhYXWD9lDmwF
	2+ROI6Fru6jQgZhzMFl6+7j6NHCp0P9Er0+2jBIj+GlFylRGDXDj+VM0SRkdx+bJCP+ZxO0JUKN
	2je6TqwZaq9/6WNnEAtR0rCO7fEJStmDu0VVvQBbtdmW3c3Bs0qdcrzxIb9AAIBduos0e+LP/Mr
	zxz0pHJqZZDJqcWXUq1fSE5SerifEyt0ChCjbsSA0rdDXSdDl3ljIpIIkcCvVXr5j4rpi/64Z9S
	c1UY4l31JjVhFUVBkok+wA9hKfIc6wiKAjuesnIb5L7q+hr47XTmhZD6tW7fXb56bmnOl6fmch6
	+1D1mJlYGAhP6OtH8zqxEG0EgCoqk
X-Received: by 2002:a05:620a:6601:b0:93e:4dd3:bbb1 with SMTP id af79cd13be357-93ebd1e0104mr2033996585a.19.1791885496587;
        Tue, 13 Oct 2026 02:58:16 -0700 (PDT)
X-Received: by 2002:a05:620a:6601:b0:93e:4dd3:bbb1 with SMTP id af79cd13be357-93ebd1e0104mr2033993085a.19.1791885495908;
        Tue, 13 Oct 2026 02:58:15 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb6beaesm209412025e9.0.2026.10.13.02.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:58:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:57:35 +0200
Subject: [PATCH v10 06/14] crypto: qce - Fix xts-aes-qce for weak keys
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-qce-fix-self-tests-v10-6-57162a38a554@oss.qualcomm.com>
References: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
In-Reply-To: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
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
        stable@vger.kernel.org, Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3725;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9Xor9mm69q42wbx9E/x9izwBUzzCROBZMUU9VshfBv8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzgCglm+HZI+nNTD1FGwOKNWwCxZeamuNOAWWf
 JOom6r1SRiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4AoAAKCRAFnS7L/zaE
 w0xkD/wMW/7gyo+N4GVP6phFvlk/WE7iA8Z5u0vw2OV9Skm7W8Ggjg+LpEcNje5MqGKVK7Dr6CD
 ee4jbPrLD/B47NtdKXPW8a8f2dsTgorkyTwHdKl2/olMkWO5rXtMNsi7K2RxKOEB0uazUDKhq/a
 Fqp0ci8vnmFjG/+RSYhdbCYPGE2MHRWVf9kLfqJ/zZb+ypx5PNNHmm4tKC9w9o8fjeFtXA8AO5s
 VYV4+zxVmcaez0UyOxK7Co4tEBpyhNRKv9Yy6Sq/gJLS0pMWSI8wdVQmcNZnTKTg106CnEKioFp
 VWs7DE0riKfEOmu0BSlx2DzD8sxFRsoKCjXGAnbHjXE9iWH/42tkKypGSg48q0bOT+/FJx7UK5L
 jMwpjICjtwM0S1uWuHZJGSbMGZ4psazuOe/I/xz/OFTj8TPggGBQDdRqp36PdrGAVylxPCMpHOm
 uY1nx06NJYTi0tTCms/W7V2v4lbZCR/7FM0/xZ6kB16phq6xx19YifR92GdqlzmnLVpE8DmwRPQ
 GF60H1866RyPyotex0syDmXwkBYsZEP87j+EcUCS0yPREub8z5RMwu6zHVGM/CGFtf6HnHaheCL
 J9b6snNywgMDMoFqhafvBKUDmmOYfQTl4peCHQeBcQ+TExj0VlaVskH6JZXiVVop40gBbgf3gRD
 +hhTW4aII7PoGow==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX8tjrbQlDUeQI
 fOl5XdDG4NVAmnxCxlpA8Bwq/IdVx7gl0jV9wsnfRZ+8hgpvaONqTxat7mIV208/TiBA/5ObfEB
 2BgvwVSIeXdcg/L9pMtLg30rhhqbIvxoiO91EsbZ1ancQ8qI9QxZ2FeUbLdzU+nbsHyEzhQUFfZ
 vW0eJhLbERMHi7RgFnlmoVpOJfGIfBr2ah+9oHmHBeJxafqc9OQXWu0mmoXECT2Itz+7qxf4h0R
 CbGwV4+WG/4dBk2uQqAr0HcLrmXsugCuo6iQYFcO5Owir14u2K3svqQLCKgRv2iiDBIxd9d+zPk
 CakKdK/MXUglfkXxAAln6rm70C3K2D1cpi/nzQcC6bs4sigBhImS3026JxxqQ+dmdi15VO52l3l
 IJeIddp6ivrTZ8zfIq2q8zXvW9mkTe8Xd6Xpo+6ZTFp6Z3bHRtnnglMKsVKj1OU2jBLy/gOJL41
 E9zc6zSSyMVBZgnSKDA==
X-Authority-Analysis: v=2.4 cv=JN+uIMKb c=1 sm=1 tr=0 ts=6ace00b9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=09uMWaUiLw9_HUPRBkgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX5+NmiBiAQkA4
 g+BwBwpgVKlXR79eEsFt3O0LQMOD9tNn5wGv6aNcPoACrfr9U35jxY/nP8qQqLjrJcoT3m5nw/V
 8vHEf9dsV77ghnXRPM5JcFSgqZVzvKY=
X-Proofpoint-ORIG-GUID: zdNVxEowwKZzPpsVURpamrAiEdPwT37r
X-Proofpoint-GUID: zdNVxEowwKZzPpsVURpamrAiEdPwT37r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130039

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
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/cipher.h   |  1 +
 drivers/crypto/qce/skcipher.c | 17 +++++++++++------
 2 files changed, 12 insertions(+), 6 deletions(-)

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
index 9df0b7254c659e83e5a2c220dde853d587b3824f..adad399c2026d7cb3057ca4d6a4766276d01e045 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -12,6 +12,7 @@
 #include <linux/errno.h>
 #include <crypto/aes.h>
 #include <crypto/internal/skcipher.h>
+#include <crypto/xts.h>
 
 #include "cipher.h"
 
@@ -187,14 +188,17 @@ static int qce_skcipher_setkey(struct crypto_skcipher *ablk, const u8 *key,
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
@@ -259,6 +263,7 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
 	 * needed in all versions of CE)
 	 * AES-CTR with a partial final block (the CE stalls waiting for a full
 	 * block of input).
+	 * AES-XTS with key1 == key2 (not supported by the CE).
 	 * A payload fragmented across more than one scatterlist entry (the CE
 	 * stalls waiting for input in that case too).
 	 */

-- 
2.47.3

