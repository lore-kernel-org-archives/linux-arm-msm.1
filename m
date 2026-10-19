Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134004D73AD
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421198; cv=none; b=n2oqwy6vYKOb/27UdtQQNzp8H+6jGLpl8JaOd/LV9xwTzz0Vcjbhz/xyoKnEp+g2mdNrcK0Yiwh/skR1efkwDMWxPPaEjrQ76olAYav5gFN0CEtFvnVoUMJg6PjhD2DXykkoDaqzvp64hnk8Cc+Jhf8Kb1tIV49guX5v1QH94DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421198; c=relaxed/simple;
	bh=9e1xHrVqrngx1q2w5pMlAxQNUMEvWrkxxUwvMH3feU0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vB3xPBfyHVkigmtkjsy9lEJv8ZFzu9oiZOl0d2ZAqMqRnAb4IJuUpOEZpxZiE40Vlgpq+DR2eQmkvWkLGlf14iuRHULm80kmuS3ZTSi4ct0gKALbb+9UKYkXOho1/pEVlGfSTCvMIbfqzzF+PIszBMKfDeWQrZH38MJ1SmD4oCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jC3tDrwj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J+7jdokM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jC3tDrwj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J+7jdokM"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0lb71457260
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ai5AdOZWiu8bcWDZTo6oewJmsAcdheSei39MPbUjKzQ=; b=jC3tDrwj+e7EnAm0
	kIva6ThOIcyiTDhdYutmjYVUqJQZbBaYhCHWlKJXCuO9C5B2huBulQNZfgYIcuhI
	a1a8J0W3e6lb0LVNCtoi2LqMiIh0vCrKthNVOv5WnjFjgVeF91sNvIyGuusyhMK1
	bQUshCQFS5EXJK5GnblSSiaxJ6wQ3oWcwp0nZitSTVbZUmtssAHzaBWl+2tkcWuK
	8VGXkVaPdqLICCcDJQ6yKIM332NB/oWH34apFjK4lRGleBwZxj2f9krHIa5qhIg0
	jpH8SDWn0KQpCv6+H6c5XBnUtJVJeFB1xeToYfpH2RXO+U8SqhFYlYnhSzjWcUl/
	7G7MRQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf65hqes-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:46:34 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eac4820d15so349604e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 07:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421194; x=1793025994; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ai5AdOZWiu8bcWDZTo6oewJmsAcdheSei39MPbUjKzQ=;
        b=J+7jdokMplyRL9IxwlPAxORyL5Qi43u65Sc1HOvl8SbN9ioLj5vXGolC84SuZxLpUj
         jz2Ie8vgk9hThs+iG9tv7LmgYMuCai6AOgV4afpUffn5nSf6zWtcRQbpIN4K+wbfBO6D
         OpUJZZSOVgm4FoJvbDtVy/peKD7k+5NCPErPSLEQEchHz2UPd12Cji3J2KCNRhUS1eoa
         fQkPHb+IfVSU5bHXZpSsbpTmrHp9WsdDLc153oGKWRYzJYkmGgJrWUePW2Vf9dHU0rmp
         BmC3+jJPoK2OqeDqU00MBXmGB/9LRFZBd5yCsh5JHwPVKQy+f1yi6+CpVHenXpnK9P6k
         a2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421194; x=1793025994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ai5AdOZWiu8bcWDZTo6oewJmsAcdheSei39MPbUjKzQ=;
        b=v5J/HtIe/TQbkC8cs5nUJ+rg9cO2BssohVspyV8D/uSFBoV33mQq151fzmKKq0pX6A
         jLFJx8+pl2EMfg25hF1p65If5XM7S5W1tjzVBz3BrSDGPw9sXoUk8DfcKgdMRC+9yvTR
         Ij9tkE9Ewtgor9nyz2+BG2cX9xEdkd/paQugMtTr/nN+8TPxeP8VH4bA18RYoVJclI30
         GyMft1x08Wn2C1XiJ06nUOUyJADkgqMpal/P1bTFpG3G4mraj9rrP+GQ52gDu0tOF2L6
         N1FOZsC9F8V+Geb1/Bo0fL5UADf/8IPVW9yB/HSGcx8d8fQjyNjKzyy13vl6lEDzBSJ9
         26TQ==
X-Forwarded-Encrypted: i=1; AKwUvByW4pnxDYI1R5mfaybyDxp+7Xcd9G+mPbLvVKg2kkRyt7PGrL1q4x57uKMV/AU30xU4uthDECMWR4gEJBhL@vger.kernel.org
X-Gm-Message-State: AFq9FYJaitGbsXxIi1a+pkY4kdUBvZ35ffuZPy6NIGUynGxhKGFK89tr
	D2gi2dCS9C6LjLuhYXyxv40D5Z5zoWGw2Vqa5Ktns11WZ4yeGcpDXexnN3Pk6CJMz1MbM1eDCKr
	BM5P0oG2dfuy8xoj4g4w4DU4OfnBRd9T0tOohrPXGsur+mD0klMVUIl0oLFx3yurj/qFz
X-Gm-Gg: AYBFou0RIqBEqspjHKD0zlsiCasOTxNcbAx/VJHQDnQbsMsJ9W7zDhIUHmik/jBZySb
	lTN05sWGL8GRG0jtm1GqmnSlGBjdVDcgEGgNQlC0lG72oU3yhWJ6tXVvsbrbn8NrVzcgfoArsiZ
	Ghxj0JW4mqBURFInRM0wCqYoAGS/xrrda+5EPPBTRXByoVKaGWEfQhpvsxAG3VOfcoFwFKNzAXp
	kT9I7seoHGeoc+hy9tC9LtTSfCy/iAWTnEY9xcyVUYoyWpxR6Lq60REh0CDVDV6I2hNILjIKOe+
	KTra0QYXqXm3UgH7YuKtzotvbkEIAKufe0QYQ1PV/pdV4omuJCgQT+lTD3FC0O5/RpfBY6JXPi2
	uqLLsH4KIUejv2JmK39xkRo80HIrZ
X-Received: by 2002:a05:6122:4f8a:b0:5d6:36d0:d20f with SMTP id 71dfb90a1353d-5eaaa99dc41mr2969623e0c.23.1792421193988;
        Mon, 19 Oct 2026 07:46:33 -0700 (PDT)
X-Received: by 2002:a05:6122:4f8a:b0:5d6:36d0:d20f with SMTP id 71dfb90a1353d-5eaaa99dc41mr2969600e0c.23.1792421193463;
        Mon, 19 Oct 2026 07:46:33 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e7657d4dsm98504635e9.2.2026.10.19.07.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:46:32 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:46:06 +0200
Subject: [PATCH v12 2/4] crypto: qce - Use a fallback for AES-CTR with a
 partial final block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-qce-fixes-skcipher-v12-2-046e6be9bd83@oss.qualcomm.com>
References: <20261019-qce-fixes-skcipher-v12-0-046e6be9bd83@oss.qualcomm.com>
In-Reply-To: <20261019-qce-fixes-skcipher-v12-0-046e6be9bd83@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1821;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9e1xHrVqrngx1q2w5pMlAxQNUMEvWrkxxUwvMH3feU0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq1i1CQgYyGhEyNdGfXYCF6P6beEIQCaiWExaql
 WrjVVESvpGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatYtQgAKCRAFnS7L/zaE
 w2ZhD/9wMKfU9yqgeSWTiGkZtiMnwvoJEBxSjbyFtLdKdwJZ4k3RUecBcJkFg3MuiOI9i/o007v
 fIyujnvRWL1qthyj1+6F9fGpC+sj/kqgnSxO+XRMKdblPomGLLsf3Qsl+KXWS989n8X3jUZiKVn
 48n86lQqU8CXbzUaPJWEk5JseZ8eeCNmvsvU4uKAKdWpjWS673z+wl2VgAaZkgE3fzJbIrmgVaf
 amRYb5VCu52Nv2R29m4CZlv1O/6HzK1Q9IyW9M2xVlM7nwx9lJn/EBWrqid090OYtwLD3IsB08a
 XtV01gJiXH4OGx69eflQwKUe9k7nZoxdbfrBDjbMVvZD+OBQsBFd/8N9KDQukSlsS2L1OdTkHJJ
 8x9Bo+odm16fpSkPrcvg3/XwwyFzQHt3nY5p3s9ALXYASvIke2ZvypFdLTacZ3XwBfPo+wov+RW
 8d9QsETpaQep4YqFJGtSRRme9HFV6k9csqM+BefuZbo0QZBQVMKtKXL353awfElqzearXjUkIn4
 6AZUjnObIn/mdnonDmSjtOKds7dD/fk9Wowvv3F/y7nqbKPfDxp/pxv2em0ia6sNeUaXpqoIPkD
 V/fYQ5T4E6HOwHFu5WPt3J4p8juM+TS2x95ItUlexf7KSCoqfPT0zU7o6qMP1mJWm5amsoaDvwu
 8UtNitzuGK+3hAw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OCBTYWx0ZWRfX0l0dsV4WQSZH
 lWq5vkzveqzYNSyi1obtJBaTwAP0DB5WZ2f9fa2TsbYvlEfQZqqNqpz/jFN1TCWuv0s2s7XGvGa
 DNbDqU3MzkWgtVhzTjRyD6uC8VHm+O8=
X-Proofpoint-ORIG-GUID: kod89ErAjHHaGQooGy6oWPH4fDhbMuF2
X-Authority-Analysis: v=2.4 cv=Y5ptIReN c=1 sm=1 tr=0 ts=6ad62d4a cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vUpbTSJP45I4i0_vGVUA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OCBTYWx0ZWRfX6dRW8tE3gl8U
 HtStPAWjIpUD8cYrjWHkMk2jguCipgS5nYPJKrAFSR+A+7j9BeT0xRS0Ry46a/6fp7D0dnhM0MM
 yScE76fKrDIkpKC5is4M4/Iy+4rAB6Uwe3wtowFxM0H1a1fpMdZhbRDnds4uVN9uE+0nIafAqVn
 Kf9mqkxuy8vCysNKiwQYYKW0mNC/Wf6UxKKhtPCypW+aRT2HdZPimLv9pEC+bM6FmT5ZdUXOHgp
 bEu2D33npyiM9fTfOfcWV77uwQtYcTC/708hItNU4IjeEybJIXP9W7usGCUxz+GZFvJYChKvtjG
 5mPGzEcxjGIj5wsnh/oRjElVKuRC9fdLr8hPiD1sg6AZV/JPqHmSEtSdw5MCUVOh6rMP24VSVQz
 SMB172pxX8RigyW0bai4HdpGa1gVGA2P4PG/yjQqRgFVmIfRSewXVEf5u+Zwf40ggpMJUgZvI7v
 LcUQ+Z2615KVhNMp61Q==
X-Proofpoint-GUID: kod89ErAjHHaGQooGy6oWPH4fDhbMuF2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190058

ctr(aes) is registered with a block size of 1, so the crypto API hands
the driver requests whose length is not a multiple of the AES block
size. The crypto engine, however, stalls waiting for a full block of
input in that case, leaving the operation incomplete and failing the
request (and the crypto self-tests) with a hardware operation error.

Route AES-CTR requests with a partial final block to the software
fallback, which already handles the other cases the engine cannot.

Cc: stable@vger.kernel.org
Fixes: bb5c863b3d3c ("crypto: qce - fix ctr-aes-qce block, chunk sizes")
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/skcipher.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index d9a5b255015341e741515bdfd6ff54bd3b24f1e3..8d4cd1d08c0e9d78f044057ecb45e5aa8b9a40a3 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -248,9 +248,12 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
 	 * AES-XTS request with len > QCE_SECTOR_SIZE and
 	 * is not a multiple of it.(Revisit this condition to check if it is
 	 * needed in all versions of CE)
+	 * AES-CTR with a partial final block (the CE stalls waiting for a full
+	 * block of input).
 	 */
 	if (IS_AES(rctx->flags) &&
 	    ((keylen != AES_KEYSIZE_128 && keylen != AES_KEYSIZE_256) ||
+	    (IS_CTR(rctx->flags) && !IS_ALIGNED(req->cryptlen, AES_BLOCK_SIZE)) ||
 	    (IS_XTS(rctx->flags) && ((req->cryptlen <= aes_sw_max_len) ||
 	    (req->cryptlen > QCE_SECTOR_SIZE &&
 	    req->cryptlen % QCE_SECTOR_SIZE))))) {

-- 
2.47.3

