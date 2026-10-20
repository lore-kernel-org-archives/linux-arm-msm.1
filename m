Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500439;
	b=L4i3bCT6VWnQsVlEDaYcN+CnpAnTG3bwH3rASKgMEeyVvrsWFXt9o+xWU/eljkfL0AlR
	 jc7Cej/v/2Sl5LP0J6IP5sVkq0TGGC2LChoXnQLrBfQl8sosGaA+VYSJxTRILxCeDcA9V
	 Xv7UwGLhKemZWrBUufsBkarJNvhfWwXikavmJdJY6eWzmgxchtDMVp4V7uEOkvlBvEzQS
	 VpItx67w1rn5J/Cb5m0l20sUj052Z69zrPqWCBQtP6EOZre9UX1nOKd/19BxlpV7EsDg7
	 I9aRtrK8LA9/lHjthA8ToSyqXVL1QipDVAI33TtULcscAbrtmmRPfutpqkS9TCqxqKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500439;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=huFKBQDlZuVavcX0HkWyC9IVz+ofFZPmUDE2CCpGGhw=;
	b=oDbtbfNO/0+DQP8dy0og6wZywssmOZtANWlXCZtfRpUVOB0YRF3HTOkROyrJwluuYCCf
	 yb3G/jdf7UVW9YESVXQa6D8UHKMl3mnPPwwt1NgSPbndf5W/XIXAVAy8X93HAwsdVFJM9
	 O3dxK7LvS4+zZsPBN8we5FWbFEbzaHOuhI7KMM+Zdp4WJaN4nkMV8qsg0yK3aei67iETk
	 UOytVn3J9CBTWcV4cAyvsRt2raWmOLxvTEhmcOHZPLGumbiwfhs2BbLScF89tNswaKtuu
	 H2hb4rmoGKycy7Fd8ZSaVkemaDCqmyQO2OLyLncK0JJ4f1z9pZt6L2XKd+fHEscOiVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M4rHAd6D;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HLV5jyKx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7000760A3803
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7000760A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M4rHAd6D;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HLV5jyKx
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KCaF051657370
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:47:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	huFKBQDlZuVavcX0HkWyC9IVz+ofFZPmUDE2CCpGGhw=; b=M4rHAd6D1FJIOzeo
	ZlW02DqDIcBFHQK6ttTi+6nivdTF7yZq0PqRV0LJm2dZlqM4C5u34Ix2frU8xjwe
	78t+MkIw2EfvFDGCKB6MBPrNjb53Fts94lMPa4+NX8KcNybfeXY91La5cIRo/3/U
	aCiylSbMA3wbLsQJOxHJVBzp7JOBGFq1zlgaVjs0AVy2wvPv2rSmRzrrfyW6/DOa
	lb/SBoqCszMAq+9orbVa1rQBgQP4Lj/1nyGsXiqc0TJ+pX0TaL7bLSSO+0QRetbn
	LMu2ivdRQv5ZZUERp9C8vrQNpKWu3KVFexTwoKSf88G7SJDU7too5zMDxr/EcUHw
	xT7bwg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2gct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:47:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ce7a85f04so639676585a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 05:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792500437; x=1793105237; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=huFKBQDlZuVavcX0HkWyC9IVz+ofFZPmUDE2CCpGGhw=;
        b=HLV5jyKxFGVxD1OAThqrzqe+0u+x5aWPYXjXPpjFoEBacG0vk+K50+PyvXLApAjkqC
         AAB6IsJTHGOqO1pFJMotND7h0/Bqy/A82Eog9I72KwYo9wCJSNcR6vApo8PfFQJWnXXU
         HQzheh4/XpoMy57e78tEABZvfkMJy97dZtGuUCo335enoe5NeLkUtS8iFqjgDoaypKby
         DGS0Y42XHZS7nY5Hmw20Hw1D+hGvIw4LntYTc/CSJNt+eK4NverIE9TNNTuWOwrG1yi3
         woTAhM9l9eVvvV1f2ChtUn52CQBNZ+7+K4KUKXEuz/qZzFUTbODALqiDCFo0ATU114aA
         Nu4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500437; x=1793105237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=huFKBQDlZuVavcX0HkWyC9IVz+ofFZPmUDE2CCpGGhw=;
        b=ECfGW5dqGXP40VKgbPax3E50XlDwyWIzRgoWe0+tAvtXcKXBSl1/cjKQ0ySF5AnDFx
         fmqmN3drwg72VGm/90ildshQxPfbhKs9fx0fnYVYU4cxuHGaxzDcead/RfjCnK0YL/QR
         lfgFtopKEhZe7xiAK9R/ZDshqqctYQwJ+L28iVvV28HsDOEm+ren/gdTPFRZSldNiOd7
         lPj0R7AMAhtzBy11LigPqo0jZxBk+LNBewXz0kQXw/Ewo0GMp7VQvuItFIHBwxEcNL9k
         Ls4bTa1Nm0a9wDQreSeVCXM4bI5X/TwgJmV7j4nQMSC24wlHJNhXDNBqeW5EYD10fXo7
         Kdjg==
X-Forwarded-Encrypted: i=1; AKwUvBwPBL7ELesXeTF2xOfNdNlw/F3JNyCVRvmHMHjk6jxd3ewYTNdP8FBLr0vzwgHlxPPHwgMk38KRyAFBDuvj@vger.kernel.org
X-Gm-Message-State: AFq9FYIj0wuJOPLpRJB1eVLC36SVugzli8jDYKKi+CZhmJW3MOiHH69Z
	FmurpP49RSbykLaP9kVrwB0NKT+lu7ZtmD4tryHvOOv9w3dwnhWyxVz1je6Gw48rYmu/sY3AfgU
	CsgvPKXWbuoQmPEFrNdnAetDInNUGo1rnTp+KwX0uGHZRToR+DmFmz6E40KLE2xDQ6z3e
X-Gm-Gg: AYBFou34Sb7y1d5wpEElwJxIo/8pxfR0trM8dkqNo+kqVm/NJR24daOPj0nUN/9CDFo
	YGHvRtV1tZxDJdixi/0J4na+Mgz3Vlepb/iTnlG8VjhtlG82TVsJnSbt40WQL0epYYp0xFJWJTI
	ndhn2ggszvQQtZalsCMwlcpUu8JCt7AhlT5wJJpQOoGbTNuXwS6pzKU6OndHnGZ+MnVAx9lGPyc
	m1qTrvR9n3hP2K7gOK4i4YWqZuTGUcTlcpE7ILqGjBHjRx+KYEfPMX6/K/2GbRSlF63Z+u2YS9j
	7Do1zXTMsVBHcF2wVVvGE2p2m9Fxdr6AnZOjjRUxFFsPM97sylBJYtgoGEEcRzvSl97AL6DCfJV
	1IcWT5420TkRqBRLa3rWbn5Pc9CtT
X-Received: by 2002:a05:620a:288b:b0:93b:d7a0:d9e5 with SMTP id af79cd13be357-93f29dc760bmr1784979885a.63.1792500436747;
        Tue, 20 Oct 2026 05:47:16 -0700 (PDT)
X-Received: by 2002:a05:620a:288b:b0:93b:d7a0:d9e5 with SMTP id af79cd13be357-93f29dc760bmr1784974985a.63.1792500436235;
        Tue, 20 Oct 2026 05:47:16 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d82456asm6544253f8f.42.2026.10.20.05.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:47:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 14:47:02 +0200
Subject: [PATCH v12 2/3] crypto: qce - Use a fallback for CCM with a
 partial final block
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-qce-fixes-aead-v12-2-77a2e09abd0c@oss.qualcomm.com>
References: <20261020-qce-fixes-aead-v12-0-77a2e09abd0c@oss.qualcomm.com>
In-Reply-To: <20261020-qce-fixes-aead-v12-0-77a2e09abd0c@oss.qualcomm.com>
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
 bh=GqhpiPEpEa1I70oxqqZo3K9AEP6IrLH9DMi8DVCLwIs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq12LLD9DtGJXaTr9T04Ert0KoYT+bbygA4vMVf
 PJyAMr6eI+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatdiywAKCRAFnS7L/zaE
 w44hD/9clJ7ieqwrkF3q+9179egCOT3Rx0KvE4ovz+1T6uYEAT91Veqf2tZapFUdq8H+NqE5s0H
 OMHt1J5Lpd+vGnJaReYbYagXOBYNUST9ZXu5W9e4r+wptn0kDUWb7e9hp30K5xZ4O33ixIADjgU
 KoAOtZo0I5pJQ1CTXX2gSAOya8sf1/DMwRtFVNNIwXFi2ii69RJaXyq+iea08vFaFSAwIruZxyL
 B02PwJYSBfSithkOgsx2DcAmabxbfI5ZSEg6i04FtdlRpbK6VgekszSoAtXFrQLpMhBzjKsVjx8
 do2UNTz6vUcXLYmBQzN9gt4NXljvmAEElt/vWycQxpg4nNmMZqFdLeI4NqS3kvQf4MOJD9r9/vq
 V1SPA/CrSXWo4UqvOf0funuk14tBCTyPp8CvC/q3cEye/PqtyzNIOGsXkG8PmS4kDQcttuP+nK2
 L/un1xjZRxcDlcIxxXaevMqgIXUAVxP+cpYPil0HeHbiy6+uH3iVovuyVXMCmubczEL3nfh/+H3
 dzHhs2P39OgEHgm/UQ5De2zBP3/t9oIbbYG5IvAT9L6uLZEfpONWsJLHDNxUR9yUA6/tm3YTNsY
 FPFxr73LIOXY36roVVhOPsFYpV2QXwjba8P+D47SZEMPmKQ9rylbNRC2xrqj41NpsdWBL6SI6rl
 bBq2xfNNIfAoh4Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: L_gDjYAxi6XAsFlNpJK4HrCdy0t7ZBNN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MCBTYWx0ZWRfXzBwntipMwiBg
 zOWWzTZIkZwN9scLhZAN+i7Fdu5rv7MwQ/1oHdsApZQ8jCs2i4EIwhY/d2xide4MkPbWEU3eG74
 jPAaISaFnOODAhEJJuXlrT7RTKuqBPQ=
X-Proofpoint-ORIG-GUID: L_gDjYAxi6XAsFlNpJK4HrCdy0t7ZBNN
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad762d5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dx2SfONCXZg6tt9xEGkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MCBTYWx0ZWRfX6bq76wJxB5aK
 7QE0lJcnwzzbew89lrmjHBpanj+fArfj2Osmxyrtcpw90ORG4Hf6+0IWo+z1tMBw1w55vBfLTHi
 Le0nb+J9Q72bQjmiyxUsmFD9LX5wq543uQHNoDICaZigEuQSicn+4KTi2l7fq1BzDGwhWTWUvAS
 MtO85rx4t/GE2ID993yGBdwrAbrhSrOK8qiUBIQaJNCarTUuwz/qMpv4+21zlCu7FcaLrHU+tzS
 NB3+Mc4qlji80ZGb8naSbs4dx/nrTKHh0nCDuTpCIZvQlr+j5bpYoNTOPcrcspEqj1fi6axohwF
 BxGUMNZ4DjiVI9pit+OQ9Gg//rIrXpr34NAuQBIXc0y+Tvvu7vpzd4Iesoy7Zzcf2kwEwYwrAlv
 M4j0b6tVpmac3csBGhN+dlVm7hGjqAElT+zmvy0ECdi6/Aby+SHx/mkz2630pIONedj42rMHbQy
 od+2y+RQg7lo6Ua6Lyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200050

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
index b7873852249dffeb91d09df3bae6534f77c08b7e..19d7e92aaeda0df1072114fa0435dc40e1eb6849 100644
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

