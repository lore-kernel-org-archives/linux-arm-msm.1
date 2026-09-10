Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA38648EC74
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045712; cv=none; b=ZVIq0wXtijP2VC8TSdV5dlwRqi8SpFgLHQp90wkI/N/cH4tKQVAZcXGnx6lpLO7Sz7oHQWZr7zCMt57XZEIzBJpj+guzpkynqjO3SE1tEdOQeRumS6veDKjmSozjTwCIfhOPDVE0Kq7d8Y5EaMjoECLEKmyoAK6qpkhT3kdir54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045712; c=relaxed/simple;
	bh=+q94hW+kiltzd6oZ8H14oSSW0osx3J/1PTA4e8Zi7ro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KHqyRvGpewhLei1nUT1rElCeeMf5BXGI54DEaIVu5171SpICdIeiC9k7YfC+MjlpUeBahlQ+nsvp9ao1a/r9loLsL8Eua1Om0jFYx9ZxtXTEeKAz5EcfOrOMOwrQxDF0EoU5SXtkrBxJe7Za64pzDNkCo5inD+RjXeJIIf42cLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P+Sm01bS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a/+61QH3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P+Sm01bS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a/+61QH3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7vPa1440988
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:08:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Apr68ly3hCT/cD0oaIKI9KYaRUniJ63SnCFjliTBbmo=; b=P+Sm01bSkMAvGkup
	dVKFfucx9enT6NmWax115NJ25NxPUw0H4GqTMoA1ZJR9L/4Dn+o+9TJhgS2Lyvbf
	uzEbB1K9Bj9KVRMs48a/LlPLyvyDNFJjmP397VgzzcnTDvk0HXWcKrEfxeQn7oy+
	y53XvphpRVGHb902oAohk2Q2IzYmvPLeXoKIQzjh6+2UKvMxCCwhMBVxf/faeg09
	o0cviNhrIg8LzlyK+Bac9ReJzLo2ai4n1OycTAzgfS6mRG+IZhmAQ2rDCAkOtXbx
	yR45jy1hFCjmkSdhW2wg/moM2dbWWHWnS1VPQulwhCfh1U0XrZoXQkT/gxwolt/t
	+exAtw==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkqsvscg9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:08:29 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-66f92d36b8bso6719344d50.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 06:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789045709; x=1789650509; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Apr68ly3hCT/cD0oaIKI9KYaRUniJ63SnCFjliTBbmo=;
        b=a/+61QH3rUdwQyonFHTSXFu9p5ssqD6fzdGkNSOcG34O67V2VMcxVpDCp27TtWKEcc
         aqGrHbuJINT3l5NQM3qdqOdU406TGv3F4oiMg/PnJqlOlDiO7m1rQq+ebnZ3AiRAJWOK
         Y1H8+kIKGynQHcvs60X0zS7ojWryl5+j8P9W6T2/MxfLqc/zlQ2Hr/JbOPx0chFZ3ptM
         Yp6UHn7w7rLm+5ZUzrYimVaucyXK8KAJxUTOoqsaYXGPDa6R3E67Vrc58QDdfYIqj3b0
         Zt5q2wSr4OgY/pfRVpM65R5bgE/lxGFgN3AkPt/O8ZmlOfCAG2Ire5n6fCo5vjx2qOME
         wGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045709; x=1789650509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Apr68ly3hCT/cD0oaIKI9KYaRUniJ63SnCFjliTBbmo=;
        b=gbtuzMZamUdtsxg2f/4vPilYOTa5f0mIkEsJ1N4D4p3K5mnpAzjJfpLfWFzihF9UUq
         uuFPnXBJBTRh+TowD7Bq7ZkzWAHAFANPYHJsRnjInYdtxVjaV0hN8tyCXi+R1Ct9IzVc
         I+I4gphooio9O7gn2yMAApp1x2woh0WaWwE+8pBYyZsK5fCU/NTEv0GYZDqZOXv+NOIg
         d23WostaN2hmYWvsEyXSTzuAaGot6AH/T0XzMsWHxl6Md50FLcQmrxxmZtgR1b3OJ1fu
         seZG6jbu5Sfvted5mMfe3ygpXMkcsxOVAF7LKAXXPOs52MS+FrPzE4W94/kc6SiJqHtx
         nUOg==
X-Forwarded-Encrypted: i=1; AKwUvBzQ1YOdgR66Q3dHBvSQmfXSCqP6TUa4YiDviF4TE2GPdcSooczzK4rM7DJSc1Cn2zxlYKSxnOWVm0OK0XIB@vger.kernel.org
X-Gm-Message-State: AFuF++nCFFMDyD47msy4CcnAg/FVdTPkGI4NyKcauDK1DSoDA5HnN8m1
	ZUgWJuna+YQfI2xUYqaUFUkVXu9hquw134u6sdQQIP+hEpxDnqYa9F+LC2T4McpCGggecqaQwF0
	fBIU3HupZAX73zDK7krhwzXmKXNBOqH4CjkDxHugJWkRkmKCfftzD9bg53hfnOQwOz5uvt+VpJ7
	ZL
X-Gm-Gg: AYBFou040N7L1K9bSYOHO185pGXXWvP62fj16NlzyL0we0gZv9Ct15tGoNK/HyavzLg
	e3de2MQRX8y5jv2uLDEU+sZ3/326l2/Btpb9vMOzd8NLdpKjF+IcDHmXidXxDvpEWqQJ9JA93j1
	U2gV6Srph6AsfLoVqCCWIWRE1DavpUgW7H7SKBV40IavIPHTUofoUVwWJRzN+9evfiC3CL/xAA0
	jfugrCYVv6nfj7tQUYuCMU0b+GD83o/YjyWi/qkfA51yuwbDvaxKZU9t11uQ1KtrdemLaty+ZtM
	JogXLmolW8tU23muaYSxW2TlT88dV8Ipcl+qFN8lYg78Dbb29K0RAL4ZwuSVw9uS1E5tqEfDMQp
	KAei8FBQl+nrGB5mYaA6P+KyBECzS
X-Received: by 2002:a05:690e:450b:20b0:671:120b:da48 with SMTP id 956f58d0204a3-671120be6b2mr1899650d50.45.1789045708394;
        Thu, 10 Sep 2026 06:08:28 -0700 (PDT)
X-Received: by 2002:a05:6102:5e91:b0:784:b882:9567 with SMTP id ada2fe7eead31-78a4a9d9306mr22259771137.6.1789045285030;
        Thu, 10 Sep 2026 06:01:25 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:c9b1:abfb:f300:5e98])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c26204ecdbcsm831849866b.25.2026.09.10.06.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:01:23 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 15:00:46 +0200
Subject: [PATCH v7 05/12] crypto: qce - Use fallback for fragmented
 skcipher payloads
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-qce-fix-self-tests-v7-5-cdbd2718af14@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2137;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+q94hW+kiltzd6oZ8H14oSSW0osx3J/1PTA4e8Zi7ro=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqoqoOYC9y0PnnwCtT9kBv8b0ovnRcrryw4KSyj
 wGEI5TzlV+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqKqDgAKCRAFnS7L/zaE
 wxskEACFOaBj8VCu5B2daTrv5BL1EJdlpaGjPEAc0+autgVw4uDpHrgV+3wQF3YrzSRkh/fJvpA
 hbD1xtYeBJiSF2Ufat0CflOkswP9FSXfiQRPHThyNoRWSS33fwoflUiKMJgGcQqFwtb3fbb0Ntw
 kdthQfMGge4Cbc2g5veN43m/7MpABusDQfWkoWy+RPYyJX1Xc4q/VZwNoVPzUEViD23Bjtp7oV/
 QORX0mTsV9En+Ac5bpj98aM4C1zgYbyF29uemcDC6NwAUEuL2NzpmLjY3OcCPJl83pGNOx+ND8g
 GKAEHiaSouMnH5Gz7P1md81OLNWq65D0nSThs67VRqOaX3q47TSr5BBRvWY9FniDfWR0eMjth4L
 L/Q5u6sVi2IfDxrN+e3LhTOF2L/Du6mTR3yxafNhyke3I1IhBn3cq8IGk2BfQsKpnqiyQ7h4xEd
 gNWzwFH3+IXb1b/vclTk2sIPE41p1kkNcdGqzrjbjp7pLHNu1odQAdJeyMs3iqQsbuMgJqApxWV
 dSH9x53GNGoylA2PkFmmDmhU4FqUowB9r6DzPK+gPWwx+hpo+IX/n1mxV5XVyKhwNEaCdfjy+aE
 Yw4Td64K0jdXuxvTWoL4F7Vk9KReUSLCyLGByeDUmJIr0HsLDJFsfwNnedw1YkSk/VdP7Ii6kaG
 JLQ/08FYJW5Z0VA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=DdOCOftW c=1 sm=1 tr=0 ts=6aa2abcd cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=2ArJjka39wvl4ErYtigA:9 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE1NyBTYWx0ZWRfXzztzP3/HgRFR
 uQW/5w3Q6dhyfP52h/05cazm1QYkEToCc9ovOnaq3D5JtVszTeHSRwmSTHDN207abeBy5unVw7C
 P716XVZfyH06PUYRGMvbjYL9plK8DoXkhq8N9mXmBgE8xPYWOuIPq5M6I9npF4/jh1RW6yfMVZg
 E9kep9ESBwGM9I73w7ke/PioHt2GDzYdRXErD1Vnbh6FuQoJV/gn/8ODPa9sf4yh+oxBO0hHJ8N
 LRByWbFw9xF4w6jw89khLoM0jWSUJKQwUB9evwZtqKLokD46iVmFM3bCtmHRiAQyLLUHt+yHkTk
 8dnLvXH6JV/M/lOLyJ+KwTGHMaY7Wcd8BcJAhlOn2pRnkkYpneADppIzY8DDIiAhT9tq3Jk+csJ
 XeZSE6DpUL44jwGrxj/IMKPsXRYOAcT0+wfljagq6pR1NEdpsQ3OALpoC+sYPsRY8odsBHGsA5w
 freq6nczsV9LnBytPWQ==
X-Proofpoint-ORIG-GUID: ejBpJA-Ht-qYLe42s1SHVFd2J7PQbIyZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE1NyBTYWx0ZWRfX0G8SpIUrOEDW
 RavRVHE0yqV1pBAy5ya2rvhNmLO+Tkm5vUcE9vUvQ1hbhNJx7twQ7ZiHY3cXkeGaA5ZjRz9CBmk
 NNzkGKWfYjpSAu+/oJPRdt/jp68+y2M=
X-Proofpoint-GUID: ejBpJA-Ht-qYLe42s1SHVFd2J7PQbIyZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100157

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
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/skcipher.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index e2ca2f7a6eea1129edb724fe30659d55aaae8190..4b7545e6aed220b7fb5af7dbf20ab47db5d1d180 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -261,13 +261,17 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
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
+	    sg_nents_for_len(req->src, req->cryptlen) > 1 ||
+	    sg_nents_for_len(req->dst, req->cryptlen) > 1)) {
 		skcipher_request_set_tfm(&rctx->fallback_req, ctx->fallback);
 		skcipher_request_set_callback(&rctx->fallback_req,
 					      req->base.flags,

-- 
2.47.3

