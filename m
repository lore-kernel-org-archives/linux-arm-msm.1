Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A896C42FCBD
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 15:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784303653; cv=none; b=bHk/a6Ie/jQw2EtNiOopSTguz5yyJGK3nthw+6C8wEkl6rCuH1/91qXzrfxYR6o7Tph0AaacWLaBMDLm/5bxg1bhosZR1jVdZKKTlTN1L1VDwxgJfxJU/mm6nmsw3E33vDAywkPcgyJLersj+fkLS0Zs5SqFfGOOOfZBYPVIjJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784303653; c=relaxed/simple;
	bh=Ejq3GCF3ALDtojefcexMkYFTMI2wVEXKIrBlhj81Swc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D0FhlSg95wTkx2jg6Vn43bUN1lPP2Aes32mjlRhr3VwApTlBzXxoEnWsnVkLGst/31GnTZeEkMLsUpFukYRwRy8o1CBYG4jd1fJq1nXN/5kF3CdgyCpHkJIbZoo6g4SUX7Gy/NFM/sQdPu8yW+Q5rBgopXfFWAo2kxhy8GIIDcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Re1956Jw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hzF6FiwW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Re1956Jw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hzF6FiwW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE7ups1675791
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 15:54:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EagaE396zMSCowVPFT/Lv2P0BLvUgaUxoxYWM76TMv4=; b=Re1956JwAckyOO7o
	adAI0amBabVaNIeGGa4UbKyHrNxHxhWnyGdw8RY0NGfM7in+VQsBr7IWv6ZTwRD+
	KxVFEnzjgBFmxeOCa7WtVt5BrvNFh1DZdeFmmnT3FUXJb8RvOSI6BlwsM7XvM6qo
	wIo8QLHyavTqHzoP4T9sfDK4fbLlDUTWz/nof5UdXhzBg06DAxaTIr5Bl2cGc/6m
	TVVYSDh/6zz0zOATU3jLECb0z1mqRHDeTYfr02GHznEw6tz/pMVGVYEhE8QOwaJl
	90oFrQoO8e2sRvJmwD44Wj6IyFiNNsYfzDauJuc00t7yedhnA3w06lPef3HsqAJa
	xbaipA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffj78sbcv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 15:54:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1a97644aso197320811cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 08:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784303649; x=1784908449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EagaE396zMSCowVPFT/Lv2P0BLvUgaUxoxYWM76TMv4=;
        b=hzF6FiwWqH550MyNSHqui4DT2z9rmk4DpbcwNSsFkYTsqq31+eLH7H6EpRUAqOOGyq
         XNzCBhh5D06+b3omxl9MbpPdsjs/xe3I6R3PTooWMuwm9VwVmv3v2U85mzLGXVPMNYpg
         9P+AhO5M+wm9kG/aBTWoiT+RplNPjEXUiqhEMYmVu+MFqc850AkwwlzBi6awB7sj5X5n
         1Tg1OhR2xxLb78J0Uq470TxDkV776jJVFbHZOzy2eIQk1I/6VQwfMqLsJxmlMB/SUy1x
         Wj6r9xv7EmRUkYUlDrDHJoYyebfQbPMPQg/crU2dHOt2Su/0skttjrygjhV4dZsEjNOS
         swGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784303649; x=1784908449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EagaE396zMSCowVPFT/Lv2P0BLvUgaUxoxYWM76TMv4=;
        b=qlxufDTGJYdqEx1ARZikQA7l4cIyCWVHnbMU/O3DwTM1NpnpN2Bu6JTZsbHnxeWI9d
         dePG6jyDpVy8N+f1g7pzAwPs3okTCpyxdFINUsHVsQALRFqORXaIymhWWjfkLVG0HAJC
         /D//vmqyYbwdH5TrUVyzt3NjvppC7Tf348zxZVrCQpJiaUMcOqndyhYWhLtGfRg41e83
         bWQ6QeksZg9RVDTektIko646EjDfIC+7C9QvOcd/0z3zOrslWz/5bQnGjsxISHvwgWxV
         H0mpLkbXjoRnEhVqfnhwBIEHgLGiV+swE0JtKqqR9wRUs3/cAbF5aHYTZe3WUxa7Bihj
         kFMQ==
X-Forwarded-Encrypted: i=1; AHgh+RrHCCkOIdoYbdEdln8OyhEBFcN2uuLKx4OU/w3LpS2BgrqtYRZ4K6pkgNskHEYYJFfaokrzTYX4t1r83lHE@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7NX7gSoVPrAC/8i9hDMZUCqfOGxY27Q0G8MV7fRFHEq5mYRHW
	FuHKWG4wFY98kiJ5+oAKHNdwaaqw+xhdXCu/etPMPYPZsUIjij7RhTB3u1vYbYq1Zm2MKWMXYzb
	t6bIcDOKBhVm3MlkpRNDTKQmb2Ge/KlwHzqBW9XWsUlRF0xdLYUMmeiJwkowBMkgmarVm
X-Gm-Gg: AfdE7cmdXc3XT4rqKkZXt8QkRFOU/KHeAFdBmN8BHFaEzat4v7hH9D6jPGTxJaiHAn7
	mPU42wkOd340hJG/Iq8hrAuSSHqQAXj3mn4sCFMxrAlZ8EmP8UxFCB4vMyQimMKjzMUQdVH1khW
	Ko26e7zhJF7DUmuIMTM8QBbKDnAkaXDlw0hwvHF5GRG0S8XoqMd3wvCtb8fpHgnlaZTz34ZjrOx
	IaT0yi9KchZWwRk718ONz/OnxNhvrFDQo51H0Ixac66g3l1mQUGNrguuxmRZcFScjJXEsnYB9dU
	xodl8bgzzHXdVsBOAPqAqNcPXA4CTw1COYF6rnHFuxNouW1w1O3OssxcW5TDB5GMFjfUhRDWkGG
	BABX3Af+atMYno4yitJMHGkX7KRPRcw==
X-Received: by 2002:a05:622a:1825:b0:51c:10aa:9cd with SMTP id d75a77b69052e-5213cbdbbfcmr31141181cf.38.1784303648746;
        Fri, 17 Jul 2026 08:54:08 -0700 (PDT)
X-Received: by 2002:a05:622a:1825:b0:51c:10aa:9cd with SMTP id d75a77b69052e-5213cbdbbfcmr31140621cf.38.1784303648115;
        Fri, 17 Jul 2026 08:54:08 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dc44:5b1b:5396:79d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a2511sm47057095e9.1.2026.07.17.08.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:54:07 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 17:53:36 +0200
Subject: [PATCH v6 7/8] crypto: qce - Use a fallback for CCM with a partial
 final block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-qce-fix-self-tests-v6-7-455775fe5f6c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1622;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ejq3GCF3ALDtojefcexMkYFTMI2wVEXKIrBlhj81Swc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWlAPaFTiZJIikiS+XIqgLGbRUYSYPJnKjbz9N
 KdPL6DgEn6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalpQDwAKCRAFnS7L/zaE
 wx7sD/98xG5RZf4PJvVVfk3S7ql5N3aOH5ILUH2o3aR53LkEfo5TM2M7sH5EVQNWK9j4vkTFNVF
 /GO77AUPmFfCvpI5sejifI9saF2+CkDeTpKnAfdkLx7jdodVj7XLLIwqNoI+F2QrCfJL37V0VKr
 fzU7+84itQjV+VMgcFrRm3K38vr1TY1ThxEgFa5wcaBzltqPVpBQn8Pq9k0YgUUL6xD2TxA/Dpk
 A9MsFidVnUzV6n1QBc0hPmOyMlIvzRIMsHU/7EvqkTG8Cio5mdM1ky2mluMBmIntRCHrFctEZyU
 Kx3PBv6jxv2EWG3P72HCLEg8vUAQccpnMW4iwjDE6KUI8EQaHiMuDmUpw4zKE9iFbKagMGN0qUW
 kHGJf16hKAgo/DCgVsYNE8FACQ/ZCx5EXqXXNLTyegjRq1Dft9W/RXSDHPB4w2UeVNYuNs1XbXY
 3uIak4BMu/3m07FmtCYEKeizDrzscV1iBZrdE9QRYdyAxxQJDWW6ruosSHH+dazDoQa5lywFWr/
 rFqlhNYcqkEmgPfs1qKJf/YNHPLhXBFVskSKjHVPPeTCIr4pdefIAi8e+FKDPqqfh3m6M4v9kUP
 5MbErzwEAnaqtZNLbh/NdpazUmpZzTMafOm6RzyH+AkCBHJSnloppqoWD+K3r0sabnguUWUV4lz
 dZv3CQl1zZQ31vw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE2MiBTYWx0ZWRfX825IKpkMX5P+
 4crdlAqGeQ1kg5i1gEAQQYpTUnPFBcjYMzFoG5RS1NX3shSeyYZ0XxO/7aGvvIQxG5c+5JNdvDx
 Oq82it2FGp1n4RPWn+8dYQqV1hXtPbuDsOOZIeLtdbVcoKxq5SYD+4jON2xudVpdGxdMnzs4JKf
 PHmcBjHy+jBhklXsY7zi+s4/H1PIPUSBGpDSyV2A1HyW/+Kk8NLACP1dWV7V9MJIKCOnQW6EhY0
 ZL00VSBgR4kNZxYAEZC9DgibA3YZo+exZ9XGIvGkBZ6WVDmPA/ZXS2RU0/7oIRc2EzFyfuzJh8D
 9hW80NVZgf0NDn+78irmOh7d1ejTLwxy4cP8J0HGBKawH/Jspye+Xa2mYzqpulq2UDDvp2F3Ewh
 ZQc2TdA2Ydtx+1gPgIQaLN72pRGqZlyiVMckqcsiLOEqh4RcvjFvV8AcwltuaSGP5qHiWE7/W/L
 BT0BXYihq2oFCCMgH0w==
X-Proofpoint-ORIG-GUID: lSA5JDn-GZEgXlYD_yI3obf9BVqM2TCF
X-Authority-Analysis: v=2.4 cv=U9Ciy+ru c=1 sm=1 tr=0 ts=6a5a5021 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dx2SfONCXZg6tt9xEGkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: lSA5JDn-GZEgXlYD_yI3obf9BVqM2TCF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE2MiBTYWx0ZWRfXy8ts4F0CcBRc
 9/dKWWV1G17gmgdy1B6OI9E+HaH+4b+akzf9OZbN1e8IxwNjzyvgb+KTc6QPCUulePP2ppbgRCi
 9q8B+DMF0lVkPQVmsypLPuT3SvmiI20=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170162

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
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/aead.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index 336614a11377e0be246817da584296124f4de5d8..4fa018204cb628c112f64c45ff6c7407df73b945 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -514,6 +514,14 @@ static int qce_aead_crypt(struct aead_request *req, int encrypt)
 			ctx->need_fallback = true;
 	}
 
+	/*
+	 * CCM uses AES-CTR internally and the CE stalls on a partial final
+	 * block, so a payload that is not a multiple of the block size has to
+	 * be handled by the fallback.
+	 */
+	if (IS_CCM(rctx->flags) && !IS_ALIGNED(rctx->cryptlen, AES_BLOCK_SIZE))
+		ctx->need_fallback = true;
+
 	/* If fallback is needed, schedule and exit */
 	if (ctx->need_fallback) {
 		/* Reset need_fallback in case the same ctx is used for another transaction */

-- 
2.47.3

