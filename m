Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18AE489FAD
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045305; cv=none; b=SHvj7jySbczaTHxsVjhvf/+WVO9HDxpttmS3bTIxCnXSvze7idFD4wnZN64exqPzDYAPBM4Onyyn77jgKSU98XKM+1ZH5XHxWALN+rxRgITTqMbn/NeG5GDf2Jjf4hMT87ITYYwTvgo1xEupqiTzRgooKbmo4R9lJgEmOpA9fwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045305; c=relaxed/simple;
	bh=tX3TRtZACxaWj28Vd3tV97Cdc6/vFpH99oExqmgwzeU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LhhSWKVd7IrJglBYTaT935wqlaxl1xd6rhKS8W5RZGYPdD8rkoqzQak5//M2xCa9L2ITc144822EM5JsrsbYqfbNx4hOYX2jEBxY0Gf2iOAC7zgPr4sB5wiorYadB7i/x8ddpZ6XxS0s74arizfx0QfdqfB4TV22RXAQ3TU37f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=izw17Hbe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZVBH1SDh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="izw17Hbe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZVBH1SDh"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7kpY383785
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XpAwiJrGurnLU7swiLYwHwGFQJ26CvgKoaprZ+5NHTo=; b=izw17HbeX/LIWuew
	ez8d3p5bVpW5JjGeoho24IeygCL+WiVIb24PY244bZ3XluycwT9gvuCbxMro6Ftb
	cOCAQjkSuN1TNnnN06BfdKyOoCTZk2HhwuDGQFoc4yxwxe4qUWVmW2q0qwA6eR59
	u9R1UpN8jSYmqro9ZR/KUxMGJu1PLGt9F7Zxo0nO4lIE5kWH89aPSuYgesTuNMuP
	Q+XlONIW0ljrLQoej4/seVMYcwOW4KqE1d23jzScl+Iy+KojTQ2i2iRTE3BjM43R
	V8Gjm2Y+gnUNGQ0I8AttEKSuwtmTm6ky4z1yURTCmSllTYL2zM98J9pK65mBkdic
	yAFfSw==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyduvaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:01:42 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4ad778bacbeso10522036b6e.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 06:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789045302; x=1789650102; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XpAwiJrGurnLU7swiLYwHwGFQJ26CvgKoaprZ+5NHTo=;
        b=ZVBH1SDh82VlUjdAPqaxuz3Y8M+OLjxHk5rI0FcJu2bPlLKXpwBlqq39fxx2qeGKmV
         SvmPrkOkyHEJ66HSS8wHtRb1S7TNYCgs0wO3fiLCfY2E0SjxFfvg14dL1EWsDLOHdciU
         oxGYP4jf06mDRSZ7XRh3uc5VWva7MJX+fwNEdP0Mv4tMQ0zovDg88l5DVkA7TLLWkLBw
         +gsCQeF6DX0e/gpnhRemHdGtcPZfTpFlQf1/UAlNo0hRn6rIP7zWqz8LRMIqoiZ8+syE
         ZFkLrob5emnJ6xUyIvRim5HbCtfVvmejDuQs0OZMASMRlbRPPZy6yGoBvYM9UtJBehfR
         6R8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045302; x=1789650102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XpAwiJrGurnLU7swiLYwHwGFQJ26CvgKoaprZ+5NHTo=;
        b=PjFuyqu+Sw7M+tISpwxf29SIthETBiSYH+yFo0OZsv140ZUZ69zRtAajkjMoJSIQ0f
         thDV83DBx+69x94rJriHP9eno3MEHXQxc27PrwGetlwCOvYXx6s+k9Oow1hHV3LDngUM
         CKeAWxs+klw0crVrkWeph2ePM0VRT6LD1EC36rQ3M6Ek6Vo2bc7Ii6aaOPex9b1zK01U
         zIAgFW919bFkwmdL1gW6wHodNLwpm4SuTGV638BH7hU5Jyb9ZMr1H+9VuvroLtYWU6tg
         YVPexB8BcZjlirHZE4xyOuWYS+2M3r2zw/q9zpubnoHQBgWIKWZWqLm1AvZmUq4o9HCE
         zDZw==
X-Forwarded-Encrypted: i=1; AKwUvBzEmUpsQ0X/8awO7ereExOXfvv0EkbUfb3g2s62idTocPDJLsjawEld6rZ2GSHv2eVyGU3kDDa/978Qf+j+@vger.kernel.org
X-Gm-Message-State: AFuF++lfZBVkyfeBYS02iGNdQvX9wFbgkeU3Xdcdkl9ewwQG6N5SKhwN
	SK6vPfwAAAuT8yeM5zXLnQw1ki4iTaGcf0DL1Y5Qq4R0rorqAVFZOpFuuocxy2nkkrPaNXLnWdi
	4P3J4CGl/IoktyyaKIHo7tPcn9w7ut3nDy8SrBxFIR6nqYm4iSWIBVNgZMsUo8eSAN1ZZqa+dh1
	ZQ
X-Gm-Gg: AYBFou3QQdb5XCb04zf08P90WiInVZ3ZjG4hdgG0+EyKE83XaxXJaZXSOnGhdL9Wf5w
	jnhlosCZ3ApOFbpaYRYRBHUbnqrBNk/0LpAQfCGXoQQMH1/tuxb7GbHnRvotJt5MnQvcncl87mZ
	5r9swNliY0i6Xdk5Ejj9t/hZpmAqQ27RNlsHLkQav2gdM3kVMd1WhMEDdqQDMqXkeMFP0cR0wV4
	8F4Sn1FDQrB4hYpjcgDdEckpCru/GhEAJHTES4FxUb6s8QuvqBviflPTOIBj7aq/w81totTEHU1
	UXBQTMt51Z04Vm+Kd/8bfOSGV++OnT91O/kV0AVViExGipXCSJ136RTl5ua3iO7MkCyqyWj3SW9
	P8wDYm1E4PbMRvwMUvCwq3ysUs4Ci
X-Received: by 2002:a05:6808:4f51:b0:495:fd9b:1808 with SMTP id 5614622812f47-4b9613f9418mr27851818b6e.8.1789045301584;
        Thu, 10 Sep 2026 06:01:41 -0700 (PDT)
X-Received: by 2002:a05:6122:490e:b0:5c2:c0b2:9880 with SMTP id 71dfb90a1353d-5c7ed478a49mr26853962e0c.1.1789045282599;
        Thu, 10 Sep 2026 06:01:22 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:c9b1:abfb:f300:5e98])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c26204ecdbcsm831849866b.25.2026.09.10.06.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:01:21 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 15:00:45 +0200
Subject: [PATCH v7 04/12] crypto: qce - Use a fallback for AES-CTR with a
 partial final block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-qce-fix-self-tests-v7-4-cdbd2718af14@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1764;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tX3TRtZACxaWj28Vd3tV97Cdc6/vFpH99oExqmgwzeU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqoqoNxRtwkAolAz49O7BFo35y6dlM5H7PtpM0H
 UCYJgUd+ZiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqKqDQAKCRAFnS7L/zaE
 w7OEEACx2OmTFHwHBMdYiM46jjJfnDB8QinT0zeL5ug9AvvELNZNFb/PQiO/QznG/MI5WQVfmx5
 zDIqeM3GUL9j3yheB5Y42QGiG+U4+iYtcYOOiVblTvr36W24isO37L48/BdIW7w9nO+0APskpyC
 ziXVRFyihsQ6hXWsZjYaKd+y24MY4jJmYxUfqHlOfwBHOG7JVChF1jm5J1arqDZMDyC4kv4JrT9
 QpZ7y/tO8DUEwXhcbui02S1CtUlJx2St9ZQnTI0ljA4FVni47ykIzjqdj98mrcjYGVfO2az8xTS
 E+Ji/vBh9QpsD+p2UMxydfyzJeAso1S3pP4w8lW9tX+TrGEuD6yBetNzhtSkOf6Uvngezk8mvbX
 mnMO7k1TeLqWid1/jhPTIRS9TOmeByIF0QSKljIPVYeVnatomIXiaWpLmZKV3hNuOWqzooJdfM1
 9sTMlClLUH3D1sLAQmiQ1ttcejB9Ej6E9IuIzTerajRRBLeMemstXeY/iwryG1mae51GVWpK2zX
 jLWmuoCMnzgqQYd8e2NoaWMy9Tzg/Fnkw10uk4TwSxFPJqA31pc691ERTxSRHQ02bZUelr8aSiR
 7SASGDgPrdIxZTyF/CxH6ddAWvE2SPHAph1h1JNad2ibDsVWWAaNUud2fs+XqaqFCMkBrUOpngY
 iRdWRP9aAcmF+Sg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=IfsSymqa c=1 sm=1 tr=0 ts=6aa2aa36 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vUpbTSJP45I4i0_vGVUA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-GUID: 32QRrc5MNcTb9lRrEKjMfZizOf_8D3bV
X-Proofpoint-ORIG-GUID: 32QRrc5MNcTb9lRrEKjMfZizOf_8D3bV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE1NiBTYWx0ZWRfX28vLquskBjzd
 3ciS2TKZUT5QeSmLmh3O5U4XIY9S9IU5U+bNXjhDJ1HlLJWDzTHK+w5grA4lMy4Kh3AVgzl/862
 AQ5OEjEpG0AwR2rMwLm7qemwL+DAwTM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE1NiBTYWx0ZWRfX+AZIoz/W5xwc
 N3fk3Jic1uP7Ps8Zf/c+pz3CDuAXdt7ipAx7+1ciC68baDcn7N2D7D1sfcEgDyGp5yXyYVtUcGc
 d3fz/kGc3SKvCDEp91YSmESOHC4BlJTtQ3eUF4mLf9PCh1vkqvgc0QoOejROuR2fHvA9SlRoivM
 imMbmaN1povjCzU2n4QRrAZWzi5MtFwwmHcngAHuiBZNx3eTjX380zSMSvV3dQRK948X78rdHWm
 DQaaa+zTZP6QpaVEBDU9x7oz4erVWJCIiLCPcdZDEtLInX8fq76v4K4ERKOnTIznzRzwG3iKYWS
 rA71UL1v/JFT6frivMX4k24R+8E6dZOdnBnCWkiB5U+mvqevkuqxJhmx9ldDGba/8mqiUW24cqq
 /JL/w/tJKHMyT3b5o4WZvRNaSgQPg3CRYILrrKFCTiPYEPH86lvEOzFkRF735VmZOgL3QepCdnc
 NL2h4DbPderrI2Dbhcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100156

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
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/skcipher.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index 0a872beff4807e6e5af612e336630ea7a36e203e..e2ca2f7a6eea1129edb724fe30659d55aaae8190 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -259,9 +259,12 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
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

