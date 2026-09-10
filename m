Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7C948A2A9
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045284; cv=none; b=n051/AGW0xKwXwSMvUn6ox7GqgDvzlaoY7GgoimaFwGDwDQa/YOxT8YATXU5wa/ZxC4TPN7W3xDHx4neytdS3nFNjxxwPHeECWiI9SD4KGommHXS0Bt1P1UNS5AQyFz7VqS+lohPtO4CiPRWy93ZIlWj+BMwAe40rTDvG1U6mzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045284; c=relaxed/simple;
	bh=fiubGOpznSBlWjS81EhUbY8+Jvg8mdIEbz8sZifJeJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qsCzUD2vViIbxEGkaXrboDvz4EJNc2BdniiH/qR4rPZQbq1JDDloPmabc2VfsHzlwDl5d/g092e+RTzbE4iJinFybFy/Q1/84crHu082FY1BagzesnIE5KM5ZaYRUhojXJ9uaayY5PPO82618UBNE5AaIlKRZbug4va4MVXKjNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HjDllPDm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IbMS/l5W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HjDllPDm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IbMS/l5W"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7h8C244676
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	skjmTwe/2/9vsGC6HLJTSQTIY2ObikwZKwuHsPTlEzE=; b=HjDllPDmBNjrJIYe
	PCoW0BPGw4s5pa5PUZRjEHfunhly70NromYsN6NVcF50TxSaDUgnVbBFVC/FlkDz
	RAD0qXM2FEKgshz+fwo9kd+z1aiI5TLWdYJoed7fth2bJRpUi1LNFYXs4TC+JIci
	TIXU7YVXvQqUeXULKbvcXCqkikS5tz5feAt9hfcpQu5P3lodTWYg+QYlDSJO3a3T
	REq073oR8EpdP5+4fK+gwFgpQoPF4Vczvsm3YWC96UburMReAVCDEa2fppED0IZ/
	EjaaThXAvDAtJ/r6C4wqGRlpEIyb/a6idBxqdv8E10LXkkadeWYJhobMAx/9zDAe
	BCQqQw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyfkyx5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:01:20 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c82b120e93so540486e0c.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 06:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789045280; x=1789650080; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=skjmTwe/2/9vsGC6HLJTSQTIY2ObikwZKwuHsPTlEzE=;
        b=IbMS/l5Wy7IFd/wNioYO+mtEU8JiDEUgyYsAR81fzpvfJC188e7Wkn4fMLlGxNaq3e
         aLgcwMUQ2LXRj+Jee+XiMB2LnRp2I37PylIcB9ZFkx8CmATb5Z3MrBf940nYNz1H3HSr
         qVgBLoGNMhkzJXsIMGbX1xV5lPdseCnU3xZVzLQSE42p9GdM0lCqIu6+Qo9as5CuKlab
         IN1reJmJSARkOHF7vZDMavnzxxaH6zEUdJAJ3SQwv0G7nAoHAvjRb+QAcjmCMlJOM5Zq
         7xbSLwm1Z6K+W6hgUk0vEk2yFHGn5PQUiz9VgPGtPAyk94JJTgzwC3eksvRlUzZSpXYN
         gw0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045280; x=1789650080;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=skjmTwe/2/9vsGC6HLJTSQTIY2ObikwZKwuHsPTlEzE=;
        b=Luddifmj+dIDEJgz9sRQcTkAhWS7yI7XprrU0JFcgc0nDezAYrQipOVIplQQ1sUmEH
         tVi1Osm1Zx+MDlPISAMFWdu80kvjGqBwKTeEksvDiKvrMpCXkZyxQzB1eKHYrD0/p9rR
         CcnpKMqlWm8FDLHLaCGx1gsZvx53gE6Nm40+tVQ2QV26e6jnwTyVCWovQy7sWQEWwmk0
         AwccdRvjaN5xSli2zOE5PczQc6YUg1Am8voHr8P4dsoqMh0EEJy2QwaD+0JsMdTX3R87
         bcU+9o9ZMdZz38ODv67+4i4TIFElPTfTIUGWhDfnN3/GiyOlV20IzqIYONFGtpgDaJk4
         y3Ng==
X-Forwarded-Encrypted: i=1; AKwUvBxg9nkWizkIrMGMX1uQWfXeabEMNuPjV9PYYUNApsURkA6ySsPgOA7SNuMoI38/iMy2hz5thCf76k0PIyQD@vger.kernel.org
X-Gm-Message-State: AFuF++kBrVkDQ5fx46KYUFneoBQVCguS9ydryszBfJSzwT8e7ZqJIL03
	N7Kz0EHlUlUwcPEpeP4qLKua/c3qXnX28vNIPHUBeK4k/uZi5ha2XBQBBVEhDbw+NZFyzEqu4i/
	SmYdBboGaPYGCzjQXFFpmKnLVdtAyRDtosR2f/DQ248bqGcG6S5HHHJbV1HvWb7Y6S3VfSz6o5c
	/P
X-Gm-Gg: AYBFou2+SMvwSZ2DDRCJA8b8cTXLMY7SnCjlcttA0tadixpjWAh2eJfhJQdqDJp/PFY
	2hVlsE+JDYYhScOrCvlMi3xyjszR/xeY2pVapSVIloWgPeLx2HFxXEdd47tcxFATGqEkZbYcNaS
	kgzUg2eOcahbbQB6lyl4Cd6hWRJ7BdJufENhTASw7bFapziJixR2aynw3YpeFDVE5zTF4Hu6+lV
	06cSPCmttIZfhR3rUDWZuOjN/eT0D8WsZYZnVdhrrVC7buRBtE+ZFuM3qBshMhKrCfQwEu+EIc8
	DWWq9zIAPdsecJULkA84/cakn3Pfn9hXo5VYW7o6zkvS8SNuURzYF1Lti8074/459wJotug7+M5
	k9n0JBUp3lzv3XZwA/3RenMv6wsad
X-Received: by 2002:a05:6122:f18:b0:5c7:a814:b987 with SMTP id 71dfb90a1353d-5c7ed298f6cmr2448681e0c.2.1789045279847;
        Thu, 10 Sep 2026 06:01:19 -0700 (PDT)
X-Received: by 2002:a05:6122:f18:b0:5c7:a814:b987 with SMTP id 71dfb90a1353d-5c7ed298f6cmr2447218e0c.2.1789045275485;
        Thu, 10 Sep 2026 06:01:15 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:c9b1:abfb:f300:5e98])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c26204ecdbcsm831849866b.25.2026.09.10.06.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:01:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 15:00:43 +0200
Subject: [PATCH v7 02/12] crypto: qce - Reject empty messages for AES-XTS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-qce-fix-self-tests-v7-2-cdbd2718af14@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1491;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=fiubGOpznSBlWjS81EhUbY8+Jvg8mdIEbz8sZifJeJk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqoqoKcY6VeoV7uAaQfnvTc+CvguzwaEw7NG/Cu
 8SLkUH96GuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqKqCgAKCRAFnS7L/zaE
 w9+tD/4qzI8NshC9kwQ3NuRh/YcmU37MwUDDOclQjTz38ZU+o2+KCUP9p/TGSWazcK3zGYqD1+e
 +XnoG5b7OAvUhlgWmxZpCJHdm4rcxsX8BNpFbaF7Dw7VE2rgIoT3lF8FpwGv+XilOEb/doc4N+V
 VlwYDiwqFgsO/fW0Xu+Zve/BbPDA3amixlqiD1386ijpScbGs+mmJ9gsyeprV1RBS6XuGfzhLHP
 +EOLCUgRBgjW59Wr5A8hvNSN288iz2Xf/VRWvbI8tzqweRefG+qxbHA+bUjg+5atscpqQRf85d3
 jzAr8mIQ/6YZHglJJg1CmhYDZXHLQWYDmpFORVPdUyReWKLa+IoSEV7GmH5VWFOMasDzKdwzX9k
 ZLW7afyjyAMgtwGrHKoMR01nuC80rYzRmRyc/fivWDbiR0R5urhxfsBLoai/tluyhRp7vXAP7kZ
 7jnRr6Swty2XIkRdvQlBtWLKRW4QJ23ygkSPn+hzMFBD4r+Nm6DfFXzcz6CFwa0rRL/Z/BtLzrm
 PDxT1u6tq32+OiianYYqDeanLAu5qAsv0vCmHdiGvzAbHGF2CV2tAYCvE5Fdk7gUuvewEKu9J0e
 5nlWL7/Z7Av76DKee/jCxCEC7vqJasO6C9e5LQI/hHqPwQ+pKdXbAN3X0+7YcuBDXiVUlWci/Sk
 Rk00/MmhPKktKTQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE1NiBTYWx0ZWRfX4wIpnEC8qkVO
 A9PzeTc0ReUVCEolTl8D3MXneIEimDJmptka8s0xmXDOhdDIixtJtz2oEy1nNa7RIWPaollRe13
 jZd2qn4XNEEBUl0nFMN56OyTlPKdJyA=
X-Proofpoint-ORIG-GUID: n837K1qTCQu2zThpmnUIUQKcUJGVdMVe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE1NiBTYWx0ZWRfX4RZi60kH5JC8
 fZw/rdSz7lXLacbXwTZLfHb2DS6lbkAzypg5x5GY/EQ/4lELhufHsdhL+tqFHj2KDWz3NfB5wpM
 BnL+YlHmhA+qnIDWSInLmXVBXbSxlzbIEUDsy4EYv8j1+P/0bxcAM11wKioVLpiwWT2O5W7OMsW
 P81HfZiiKx5R82IA7iZFcsfYkX+TYNDJP4cY9dVyiI+z4mAmski8dWGydBI5IT03FJmv2Wau1LZ
 /eLQicTC7zSFhw750sGsP2qdnk25xdFcVmWtJGA653Np6f9DNW/h59K1YDxg2sqAcR1bW5oBOk9
 XNruJTolF93zA9nSUI+SIv3wLevcC5uqKOjIis4n2YK/XAvX2bvLXYDRIApqxem0coMVQazU3kF
 eyZGRQA+mIMKqp7fv7dkRDticvzmXLQPT6w5Ffj5318gshYWxUz6gHCctlxEow9+/EAbSZC+f9C
 lhrAipY85csGgJGh65g==
X-Authority-Analysis: v=2.4 cv=H5pOUOYi c=1 sm=1 tr=0 ts=6aa2aa20 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=kiYxeA6Iecqc4QeK3QQA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: n837K1qTCQu2zThpmnUIUQKcUJGVdMVe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100156

XTS is not defined for an empty plaintext: it requires at least one full
block of data. The driver treated a zero-length request as a successful
no-op, so the crypto self-tests "unexpectedly succeeded" when -EINVAL
was expected.

Return -EINVAL for empty XTS requests while keeping the no-op behavior
for the other ciphers, which the crypto engine simply cannot process due
to its DMA not supporting zero-length transfers.

Cc: stable@vger.kernel.org
Fixes: f08789462255 ("crypto: qce - Return error for zero length messages")
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/skcipher.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index 84263ddbd62733f4d1ed42a2b94ae9f4d0d5c6df..b49c1aeb0d27d4798e3e3d0b30299f48ef8ae453 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -222,8 +222,12 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
 	keylen = IS_XTS(rctx->flags) ? ctx->enc_keylen >> 1 : ctx->enc_keylen;
 
 	/* CE does not handle 0 length messages */
-	if (!req->cryptlen)
+	if (!req->cryptlen) {
+		/* XTS requires at least one full block of data */
+		if (IS_XTS(rctx->flags))
+			return -EINVAL;
 		return 0;
+	}
 
 	/*
 	 * ECB and CBC algorithms require message lengths to be

-- 
2.47.3

