Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB4B4B4027
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885499; cv=none; b=SyXrSCoPje45Q5kUPtDEV36trPJvtdFgzSHBmr7TAMOOdoruLe8evyahghFkuXm3+dQ19sJY1WmMvA6xeon4FyHN+sF0Kp2qN2hSIh8yJ65D5Q0yDbnYdYnc2gyQyiJiJZtF7UIzbaxRpIWKimNaNEsy9i6nOdKLqckXHh2G12k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885499; c=relaxed/simple;
	bh=tEyC+0i3JYi+4o+oeZoSxb9j/TTBdIukaHcLIW/MMlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i9jt/i1HLaE7ibcLaPMVON9JOmkSkgGLU3xU95zIOKERKKpga/5wbHjlQXUO33iRY42p3DV7M2qPP/5sjZtgxSLc/GcL1FlI5kxky+1yjz442+OkBxXDwCe2azLAJWLuudDm0VzBVCTcJzxM1RULjjXj5YPa0z9GMBCjyTRYiVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FMFoeXlS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PikiduRK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FMFoeXlS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PikiduRK"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8Q5C4988763
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/VgdH68pAygOIbbHjawhqvf2/ukjbs3WFpFquZcEkEg=; b=FMFoeXlSMjKGktWS
	tHjdZ5H9dwDsfVuMMkXLFRapQmoc19rWNWWDLkVJiGYuNu8uJtUaJlrPKdwt3jl/
	WnCMXazdNMl1NKOEOa6dH7t+6erR6Nhx5RRcMZf6uX5z2xakV8UNocmmKZfscpZZ
	i6vRciBnMg9PR7sdwHWGCqAtk8BNwvbhV8Wt4Kb9+406q/P/uoh94fUh3axpgpF4
	GKzqEm7VncuWFaH/SIzNeydJ3nncIsXviaH8CPctU7oYwsunGGme54vOs5H/kJUP
	9VR9qG3T/bv8jufsWZ6ndqdxMjajWD4D28c2EMRCFRMCtIPt8+8UPXGaHugJs04E
	wMMMdQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98hcaaav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:58:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ae8e7e546so583413885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 02:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791885495; x=1792490295; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/VgdH68pAygOIbbHjawhqvf2/ukjbs3WFpFquZcEkEg=;
        b=PikiduRK+z344AzqWqRGQgCG2IZUge+mDCPd6NvtH4B7KibTVY/U1VOVJlZYThIEzW
         NJKvVkQDY80j+NphsSmJ6JFdG6FYm5kaXWdymJUPV3ZYxx3MIkD2WpIavPeZgb9rbkte
         5gg+ACE0V8OYxy0s0SfE+xdiX/1GgUQHtt04bvVTHSoKVjmw4jFR7zoja41AuCB7PHHQ
         fMaGSo1HrjWWICfY3CX0soRizDQMQF7RP3OJhFuB3ILhHXhlvvuWNKUGodsmSQwt2l+K
         IYVQnl+JT2t1pnugfuaU5VWSjs3SDX/axRnGhsf0Sn2i2uvTEE8JM0JRxDvDyTHaE8zC
         PlZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885495; x=1792490295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/VgdH68pAygOIbbHjawhqvf2/ukjbs3WFpFquZcEkEg=;
        b=T3BC42lsVBZa18AdNPXelgX/Jrv1b4GpHbp6H7JH9E6mXnQ5Fl/HaDE32SvMXVOJmx
         +B9Sb0+c8Wio9kDrZy3dQ83Bdg0SvDkJPr6QPLF5NKcxQr3rB5iY+SB2AD9h0dXiw6nD
         /3mmTzNZtQGu5c7CjtNjugaclvxxT8EFS+Ue89//6muLfMQIhyKo3ixzrwU045GWAqSF
         8zUBuEZ2IofMkHF6/055fc8dsLpjXclhAiyrZpja5/YH54dWxUCiMwmli+t4UwQgBC3G
         QBeeUvbLIIqIlE0gsU3ru/oNznJ0Ij5nTvOHUfR+nbaze+JPiaexaGMRQpzWAaGj8zzE
         azHA==
X-Forwarded-Encrypted: i=1; AKwUvBzX3IRfJpMgFBUwtqWZZovsa84PIVOF7yPRn4PqMBQ27hRXSX74NHDm5d3QMF4m2Pq5KitPME+Uh2C86Sr+@vger.kernel.org
X-Gm-Message-State: AFq9FYIDMootttP27z+2Z8ol4sM26fPjt5KdXjLl16+Zx0fBX+sHvZHn
	VVcI4YGr/TgIGRxrIN7xofvgbQp+qsNQu33KJuOGckkBuvunicdQ0UoxWvKEquiOyBmONFig1sN
	4vq6kBY79SpQ4JV3e4GDYDDmI9kkoQAJpJMOhyXElmdTqEJY42EuKDfQMKNyMaWWOFG87
X-Gm-Gg: AYBFou3UqiVEo151a7aLIu0OQV7tnW70kvt0bXsDXJ7DHs/E6iy3pqIdTXT8Gc9ngoN
	vcKeaPQ8sFWUaCUb2C+YXkv0cpwedzyjf0ePhaUR90G4OyHThM3W8rjQyAj2BAJVNJ7NPxYYqkl
	8mFj689PSoO7zEg4o6MIQkVKaMN8cgKplAdJc9Il2Fft+dzP9mFmgERnu4qJoeVhMt52K8br00Z
	JHA0fZRafDBZA6OQo5yTtOPSeueWA8X4md7/jZEHV2q1Wmb6HZC6Xdj6/XnhFXAM2VXB7mseBDk
	uXiJmOd7NNPidiTvbHzB4TBOTxVqMCXxgFpTXpZ3grYYUXoKqnmC6fZH925u1F3kXsCEEaXqSLm
	lMGZjoOe3EcLvR1X5zvjwAmvD4+Fi
X-Received: by 2002:a05:620a:a193:10b0:93e:e500:7f53 with SMTP id af79cd13be357-93ee500800bmr619291785a.65.1791885495222;
        Tue, 13 Oct 2026 02:58:15 -0700 (PDT)
X-Received: by 2002:a05:620a:a193:10b0:93e:e500:7f53 with SMTP id af79cd13be357-93ee500800bmr619287085a.65.1791885493956;
        Tue, 13 Oct 2026 02:58:13 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb6beaesm209412025e9.0.2026.10.13.02.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:58:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:57:34 +0200
Subject: [PATCH v10 05/14] crypto: qce - Use fallback for fragmented
 skcipher payloads
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-qce-fix-self-tests-v10-5-57162a38a554@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3055;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tEyC+0i3JYi+4o+oeZoSxb9j/TTBdIukaHcLIW/MMlg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzgCeD6xBUFrJDXXdrUNd3BY0VxZzHne6oO5jJ
 NrUxltShHSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4AngAKCRAFnS7L/zaE
 wxdREAC5y98/3wrnRZghKq5EX5Swf6izweD8gFrBpKlmSbONDHjtsX+0ktTT88nFg3H2y3AbvZe
 8Yly1P/cFxH79JMEZVx3aL+/H5IKd4f5NgWTQ2DZU0dW9PgoXXhZuVqB/+AxDprSldIWmZ4RQGU
 aBu/UlIQhsbe4TJaIvxi4EAmaOWs0PMU/Kq8ZObuRi9ePo6cE7ansGm1WY8SlP5WP0RAfYxROrE
 9DtKFyJsQmpztDhXS1uJ2R0gnQZBHmqJQpvl28/Ge/+6GfFaYJLyuCtl9MHZ8bC1sVbjlwOCs7S
 1n4moC8t08AkRhC/20sjFsyOuBLvhF8MfYZcC6x6YtLo/KhwSPs+x6plYNLAegb/DpdOnjevord
 Ayw4zSg/8joy/KdDTJpn535mePMZwxFXMMdzf8UCoNUAooDAL8MB8a+J9/mR4qvOXYQhhE8Z15w
 3e+h6voQWdvQ+fY/pT8vfE6ANRfH5xfyU6BKJKqNATWJpb26rlkg+NZGOWPQQ4FGQbi43fdzJx/
 Zk25PKptJKn9JZ4UJc2Aev+CPZLb4mp8NmzVg/NUc1zpCTwPMwV1dGFXU0tGob6/0w2SRhlTAMr
 8VEiASrYO7HGrLY2evTUXI4idD6vzYYQwEK8IkC2C4nifrinWqQ9WH0NoLZPAKkbzGgqpe0tzpP
 DZ3Qxruykmm9kjg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX8jb4resFbgbe
 zj9L+0fdT0p91drm38EeH5AvJcb1h9lxUdZZBEkU30k4aJBhhj6y5UzAnzOabFLW/WDBiMVCDEJ
 yLtPMvrDUUkStWpfTaZWfPwQ8Lf14diSDHaQkrcVtPI2evcGP3ESB9+ADVuOngnWZ6Xi5GKhxbR
 YbKcCLrI+8ApNCT90rjYm/Vsjd1fygsxwRjnKqgNa/98YJ9kozUKUEaAbWJ7Getw6F1b+z8doOm
 HIugoR52wj5Ug0wdQemyNuPT/wnWt6KyfAL9NME7FCEl1gZq3Zjo7QjUBnIPn0WYUiE4xW3gXRM
 a4DIkLS3T/x596P1GOuw0f/xxVnfSJZpPeR2Ry0V/YuUJBz0Cw2pAoyJQn4qRNip2kMWXcqwrWX
 wRWO9TtVjwovJcMNEByoGLCHd4REYZ3eAq0Kd/ABi/5k+L72rUd8RarOn78Yolzbl8Ipeh1EeQu
 P/2znudDdqzCt4rlsVA==
X-Authority-Analysis: v=2.4 cv=VPVIDNPX c=1 sm=1 tr=0 ts=6ace00b8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=2ArJjka39wvl4ErYtigA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: U1ZHlC1mHtNmPzdURAKpqvuDX09hTm97
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfXy0A2Er5yAzeE
 PV6G3F1w+viAZrfrb/6qBCgPDuwlBlJz+ocIHqCjjSqMfHS2O07j41OB9SDdk1VYYxxpVTbAl0g
 yfDHcphuhGhKmmBp9xYyLLEZTZ9omHo=
X-Proofpoint-GUID: U1ZHlC1mHtNmPzdURAKpqvuDX09hTm97
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130039

The crypto engine reliably processes AES requests only when the payload
is a single contiguous buffer. A payload split across multiple
scatterlist entries makes the engine stall waiting for input, failing
the request with a hardware operation error. This was uncovered by the
crypto self-tests, which feed the algorithms randomly fragmented
buffers.

Detect a payload that spans more than one scatterlist entry, in either
the source or the destination, and route the request to the software
fallback.

Cc: stable@vger.kernel.org
Fixes: 25b71d61d631 ("crypto: qce - Improve the conditions for requesting AES fallback cipher")
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/skcipher.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index 6c578bda8363c6656b61105e2c3c62b9ed55e7b4..9df0b7254c659e83e5a2c220dde853d587b3824f 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -223,7 +223,7 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
 	struct qce_cipher_reqctx *rctx = skcipher_request_ctx(req);
 	struct qce_alg_template *tmpl = to_cipher_tmpl(tfm);
 	unsigned int blocksize = crypto_skcipher_blocksize(tfm);
-	int keylen;
+	int keylen, src_nents, dst_nents;
 
 	rctx->flags = tmpl->alg_flags;
 	rctx->flags |= encrypt ? QCE_ENCRYPT : QCE_DECRYPT;
@@ -245,6 +245,11 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
 		if (!IS_ALIGNED(req->cryptlen, blocksize))
 			return -EINVAL;
 
+	src_nents = sg_nents_for_len(req->src, req->cryptlen);
+	dst_nents = sg_nents_for_len(req->dst, req->cryptlen);
+	if (src_nents < 0 || dst_nents < 0)
+		return -EINVAL;
+
 	/*
 	 * Conditions for requesting a fallback cipher
 	 * AES-192 (not supported by crypto engine (CE))
@@ -254,13 +259,17 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
 	 * needed in all versions of CE)
 	 * AES-CTR with a partial final block (the CE stalls waiting for a full
 	 * block of input).
+	 * A payload fragmented across more than one scatterlist entry (the CE
+	 * stalls waiting for input in that case too).
 	 */
 	if (IS_AES(rctx->flags) &&
 	    ((keylen != AES_KEYSIZE_128 && keylen != AES_KEYSIZE_256) ||
 	    (IS_CTR(rctx->flags) && !IS_ALIGNED(req->cryptlen, AES_BLOCK_SIZE)) ||
 	    (IS_XTS(rctx->flags) && ((req->cryptlen <= aes_sw_max_len) ||
 	    (req->cryptlen > QCE_SECTOR_SIZE &&
-	    req->cryptlen % QCE_SECTOR_SIZE))))) {
+	    req->cryptlen % QCE_SECTOR_SIZE))) ||
+	    (IS_XTS(rctx->flags) && ctx->use_fallback) ||
+	    src_nents > 1 || dst_nents > 1)) {
 		skcipher_request_set_tfm(&rctx->fallback_req, ctx->fallback);
 		skcipher_request_set_callback(&rctx->fallback_req,
 					      req->base.flags,

-- 
2.47.3

