Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1E44FB9B3
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 13:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417711; cv=none; b=GBNKueXpoPmlTjAL3oGbXANBINd6lFQSoqZggIZqZqDndikkzfM1MOdmJIWsl+XUlzc34MaxgC8NzkNy3XAHiamJ9AcLoM4+ylOy8Gq9BR8vt6lUeob9obylIqG3mJet1IobiWETePLIp46gEd5pj3eMk1mwPp4nddsDQcalxkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417711; c=relaxed/simple;
	bh=4Da89M3KYk+MUTlXl4U0p4CK2jrKgzqnU4AawRHAVfk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aRyt4S33bKDxut66UHQ9NjV11bNnvGOqYdV3Vg0Vbo6PPc4ps1w5UaE5J1HN/0Bt3jZ35N8erajIOvPt1vhRmXktCPlgEQTzDQdKSTvnnMLJp9VuoNewK3XbE7fq/nVg8M2d7thfTBeKZDthAs8szW18rCgkogO1u7VvBS9u7/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bCIB2Kc8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WpmtDnnf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bCIB2Kc8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WpmtDnnf"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P0oR2041862
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 13:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o9BDH63wczIj2YAI5qdwIKZTFwks5QWcMeHl9cdUdl0=; b=bCIB2Kc8YwnJ0ofR
	kxLYyZ3c7O3T4znOVPakq+qrdvTxAiZuuIGzx1r/JCE6O1r9eLtNRAzOZcH1w0Ao
	S5G9uDkCcGcsHO6LIkeibUjYTgIta6RmLhrq52waHKzraxIZn+oGgv3EwpFChZj2
	YwiJlDN45g8dqZon5C+308j/ueyTSQ3pQjldVCsT6vquw6qHyLs9yQycPI4Zwo+0
	5nPOuRdYI9/net2Tqz/JG23b3N6I+i4dtwaLKXS05AqGiXvmOtqVelBW7h7YZZHy
	yK4/LarHYZqzOkjrsqNVkEPcOmDqvnhZtB59glUOqbb8/LT51cX50oCOBUWN7CO2
	jq2eTA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5ur303h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 13:48:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a082c014aso519734485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 06:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792417705; x=1793022505; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o9BDH63wczIj2YAI5qdwIKZTFwks5QWcMeHl9cdUdl0=;
        b=WpmtDnnfI1gNrLSzycEfvIKVmUOmQWYvkI46xRD2zVtus1qQU2+XjdlmxZnalrrewq
         hiQCUSMhalu3+GPPQEbnU/2laYD5IJy6Lwr1cxl9phbqPVJ93IjpboGxqGCHlznj5sdw
         JeD613IsjDFGb09hFMSXdibGLI5phBTKzVTo6i86ke6jESaargLtl/Pw0AnhFM3i1xrL
         GlR/UBfKjam+EsJRueVNx4FboauP4qb4GjsqAfSdITnurmDyGOMwRHg9zz1NdiRb+Ozx
         9bFexnsQgYMxYXjjidUErP/Gtpu4k8jqW0TbMlgmDbaTubpMAng9VyPLsFXVv2/kXoU7
         8wCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417705; x=1793022505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o9BDH63wczIj2YAI5qdwIKZTFwks5QWcMeHl9cdUdl0=;
        b=QR8joxfGrpeMqUaJOkFEmfym2U4yPG6k4bGhT0AA21UswNMocvvNG/YBPAymuHBBoV
         ALPEHoBZlYTp30Zg8qsm0Ha6OLT6vxa5a0Rm37X3VJDD2MAYbySGqyFhxrzRl5ALAGSN
         kiX+95JjNBY3Rtf3RkAXKAMoq7flIjrhupmK/dAhk5G+aRfBkpljvdc1vBr2EQAogV5t
         AzseVG6ER2nF7UnpavJ1bDWM7qdyPjgXSo+Zmb+Kvt2TlFWzKVJGW5v2dmERWMaY4YN9
         pq3fJOZb66NlRKY/yQSY7z9MGa8a0GgGWDKlPvW2lZZt3su1gEuH8uMIdw4Z91xJfl10
         Z5lQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBrJlmqbF5ptSRvVO4NzvHUa88kIo+8spwYILZ2YgIVaKpCofGS2cO+pAGVw5bjRp8KxD45Vs4qT86vrmV@vger.kernel.org
X-Gm-Message-State: AFq9FYImUg8uuhXnF069glfQeBoTDR/LuPqkPUun6PkUY6HAkjDVFGq3
	0OEMlkSYt5AolipyGGnSyVvLSSRtbsydWxz8Faz76qrphzP/3SV3lH7kog7A+1bvsy6IE3u6hIT
	JNBITO9KXp6Q+bOl+fsxHS4lYHssNEPOAMfdqW5xdLMkVxpT/v+eCpnfI0B/KTKC7lf8R
X-Gm-Gg: AYBFou196QTbnD9ElR0WXPsH68Ghmpmo5J6k2RE5PkoVlToT5201QZhK9LJLUr9IFn9
	y6JMV6LMbeql46Pz4rEorzOz21Eqcc5CVvN3IBq5O3s/F9wWkLUJi5/fLnzGITKdfyMsavbvw47
	6/BDt/BhWExaq2puNLv9FlVkfMSLq97kbmqlGQWNgdWZDwOea92+FHXxoEocCo+kCiHc7dMq3Gj
	JgmlppzkHabfNXapOMCmdkkl5WC9kzpPOxBOGym0gXP59lWsS2ey0PX0TJolOWPGfJsmJViRTHB
	1PeqEDWP7Uw3hmPT2lOcMnipkrq87m8It4L/+vdEvNZvdyOq7PknVjvm17u2Uw54CfD+th1vXtu
	WMz+NOCC5Mdk2IrRGBLWOhpDpWdYD
X-Received: by 2002:a05:620a:4608:b0:93e:fcac:a91f with SMTP id af79cd13be357-93f17f9f371mr1746255585a.37.1792417704733;
        Mon, 19 Oct 2026 06:48:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4608:b0:93e:fcac:a91f with SMTP id af79cd13be357-93f17f9f371mr1746251685a.37.1792417704178;
        Mon, 19 Oct 2026 06:48:24 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c4fc4sm20595574f8f.15.2026.10.19.06.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:48:23 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 15:48:09 +0200
Subject: [PATCH v11 2/3] crypto: qce - Use a fallback for CCM with a
 partial final block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-qce-fixes-aead-v11-2-11c55cc7a695@oss.qualcomm.com>
References: <20261019-qce-fixes-aead-v11-0-11c55cc7a695@oss.qualcomm.com>
In-Reply-To: <20261019-qce-fixes-aead-v11-0-11c55cc7a695@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1628;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4Da89M3KYk+MUTlXl4U0p4CK2jrKgzqnU4AawRHAVfk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq1h+hxxbP5TLmg+guVtwwAV1Z/viK6g+mJwxGz
 3YEt+OUdjaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatYfoQAKCRAFnS7L/zaE
 w83oEACdTr55eATu9vC0zIWQRAWflkOCGQQ0OTUZmNsYmqleZkTfOzeJFIG74bPhTqQpYIZgFqB
 Ct4lKB5b8W3f0Z4bjGVqGRNWBvDU9isJdWhmfoDpqD/J/l1Hq1Q7+QVivpXQ9yaFMb8Qog6mPP5
 xnvNq4Jvdarr1ssr/CQGl4EMUJpdIpJIM/EaxE0EFeAZ4yfomZtGIMr63GRUQLF1Oz4LyygGFmB
 DUnqHjMsVt+aVPCdjDSER9oFY2Z2e2V5gg1QyTFRYyyWsWVUl5zZOnG1YEQniDGHKwE9JSCQOqX
 7UKHo/09RZhEqDOf/GdJS3lrT+HZHdo996BufTKZeYVd5S0+f+LarPNcNaKjX0meAUA5Yz0VX9f
 BiD70KLo2Wmwu4ECBldVBQt2dL5UarWhgVasMDHq/Cg7NPWw0iecX3uX3EDerz9dBn6RywjbOiH
 E48+tY7NIR15+VJV1d5hrpkN6LsijnBM6ZwoLRLp+IVv5qvDH/MMCLSRc+HzSwMqu5jarsmJjBA
 6SsB4TNagSKST299WROryEx0QEZmcLGdfA0/W3qPz1tV6Z1FtaA+FMeE4FcRd66JdBHmwA5N3yc
 VG0+TlWfIesqKuRflwJ2v9tif9ql8adQ3Fs1NfS2lQnbvNmYoU2dW+nyLv8idYxMELdZadrY2hl
 0z49ZvKlYeMiD7g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX4j8IyK/DDvGx
 P7O01EBRe7UOBb7wYN9AwWdjo5I6EZIvSv/DCbTE5xqZygFVmGW4NLtDsq0ax7ZCaN1chOH4QJ+
 MLEkyaVlGF49I8jf9MuE7FTTBUBc55c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX3/g97UHKhxFH
 mKdpJVG2gKx0ovaBnl9z4KSQy4Ln9IQa7Y1WZKK6QsxjTmEddw14DTzIqtocCUjAiCdd3JR49ew
 d81t3U2Wc4ApPGkD674bjfLn1Qlciz3jYCnjCGkX7BmR2StR/hN2a2oz91qUDRQLR0LIAEe5djj
 OYE73kHxwDyTo4eauR+xuEUFyp+/RcQHReu70bYuDzMF9leg0QFVe/y1l2kjDI12xStgBMUoeSH
 TlRTg2YG+xMrYjkHEGKs5Rl/Ntp8r6GSZqRvy8YXR9gfsunYp3bqegqNvfK1QBPypCPn81f6R/r
 E1Wm1z9F5sxC7GfpnwnJfJcOAjs7YYmbPVqhMM6T6TdXIvqx7T9hXuqmlfrpXvBrFs3HpkYuWfJ
 Ql5T69wEjhnrJWViSya/g6Oemmouakz0qsAiufaWde3i6tcgZbsiUFPGIBgi16D+HKJjo8Qnlov
 WI7wqWcGadjDDD5Zl/g==
X-Proofpoint-ORIG-GUID: EXouj34FTJQhaWIYhq2by55Tw4vDJ9gk
X-Proofpoint-GUID: EXouj34FTJQhaWIYhq2by55Tw4vDJ9gk
X-Authority-Analysis: v=2.4 cv=CP6/zhrD c=1 sm=1 tr=0 ts=6ad61fa9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dx2SfONCXZg6tt9xEGkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190054

CCM builds on AES-CTR for encryption, and the crypto engine stalls on a
partial final block just as it does for plain ctr(aes): a payload whose
length is not a multiple of the AES block size leaves the operation
incomplete and fails with a hardware operation error. This was caught by
the ccm(aes) crypto self-tests.

Force the software fallback for CCM requests whose message length is not
block aligned, reusing the driver's existing need_fallback mechanism.

Cc: stable@vger.kernel.org
Fixes: 9363efb4181c ("crypto: qce - Add support for AEAD algorithms")
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/aead.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index 81c1a9598474c7c1623e71a9eac876fcc0c111b4..f34e4feb3004d9bf63c2c8b2aeb3975d86ac486b 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -515,6 +515,14 @@ static int qce_aead_crypt(struct aead_request *req, int encrypt)
 			fallback = true;
 	}
 
+	/*
+	 * CCM uses AES-CTR internally and the CE stalls on a partial final
+	 * block, so a payload that is not a multiple of the block size has to
+	 * be handled by the fallback.
+	 */
+	if (IS_CCM(rctx->flags) && !IS_ALIGNED(rctx->cryptlen, AES_BLOCK_SIZE))
+		fallback = true;
+
 	/* If fallback is needed, schedule and exit */
 	if (fallback) {
 		aead_request_set_tfm(&rctx->fallback_req, ctx->fallback);

-- 
2.47.3

