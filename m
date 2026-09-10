Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AB948EC67
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045631; cv=none; b=Ij1nkWD3dbfsE6/fnLujcX8KPL+Wwgi6F87uigUA3b8dEHYe35i5ufZrdPJZ5ld3DGIn4S2MPJqokCmt1+y6D/pwQBOo8QY02a6P0Gkl0PIR367zoCoigIr7YynoXmZdgKPqu1ZFykS6fadqkBZulq1b6rEylvH/H4DZbbien+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045631; c=relaxed/simple;
	bh=Uma3r3Qc44Y0Xz31JrEvI/Rw746qZICX+o0Zsz4ItL8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qj19K3ZTxLWujA19UjdN5aD4CbDeVe7ruH+1Urq3MAyOiqbsgjwsL/0FHwEV58WXXM+Q0UbDfZKaqm5iylXbPwTEjRbf81kbTCy5/ugReLy+q9c2+TlFBseBYSZyCxRjHkjC1UhldkYFqibXcep+ZjCm6F39eYRthxam97HXh3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GadzsUIg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KHckindE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GadzsUIg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KHckindE"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7ZeQ2029098
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/AX/Kem1ZM8Esmp/0yLI0NjEShE6PnXQcN8z1bGeCo4=; b=GadzsUIg2YzBBr0D
	XAFgVM1jy6rl7/SVGpPBAHcFAUPphOJFD9RTi3dEQzk/rymaMtlE884OdBid3NKz
	C23UA2mhV90HOmldiRUW4bJqiFbybB6JhSc05KyBIeJfAk3ymXQ7+C3/uPCQRH5X
	soysu5yYaOMTR0YF3IW/H8CAmBrDXCb9i0r+AlDYUE4ELnUmShccEzxImWU/38QS
	8gloyOD/WKhi4LdFIi/uXDU/QVZS4XfyFUnf+ngHi5Fz4/WKqNHMcbq5JG5hySXh
	fOhCQBM0t36sqCLk63TmfA2dbEmdTxuy3GJENDbkR2LdMAONwkKHVmsy0zWnAoFS
	n/wpXA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyhbw6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:07:02 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b3962f71e7so8484285b6e.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 06:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789045622; x=1789650422; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/AX/Kem1ZM8Esmp/0yLI0NjEShE6PnXQcN8z1bGeCo4=;
        b=KHckindE29r4zgGBLBuzExTpoPDjR85xbuhUCCx/E08SR7dAslBH9+pKbuCRSEGk+Y
         qu9IZYnux/493soXhqNP1QEkS/RVdgG/p/+dDybaYnbmucrr5JbacabHJOfbZ6pLcLLh
         1PnSghFlYKnvi/8vStj157uTRy28BnfkW8wsX7oGYRyo+lMa5myIG8cq8XIshhrDlQtL
         05g1vkoK21a9AyDRwpGIG8Nabj9oCEe3oM2jyfK4sS91Ueu7AsWBWminV8gsYEG+KCCI
         ENob2w6g9KvQTpftfHEl8fF38HdZU4oJ4nf2vj4+ajo7CahyPU9Esak2X6uj7Zf4ys8o
         HsHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045622; x=1789650422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/AX/Kem1ZM8Esmp/0yLI0NjEShE6PnXQcN8z1bGeCo4=;
        b=lkAa2+3q/ETk0QADrAuqFHnTQdyY365aOyUGoGxwmprpeMgg5P0Dq3vSycIfIH79M1
         CVQK/t3hKso4ortsPu8G7JBgnbWDllWVtyORQYpvL65GjSwVuXezYdILinQtVe1mHhXH
         xpctywicTaBlM/1VMao4H1DVA1i+YanMfdFfFfNdCSvRzDoTIKw0HKtYqRORFQJG4aBL
         cnxFm9K0Fe3+mjiBOff0yy3YBGT7Dzcx+kKpUnM943q7nlp4EllwHyBHI+KBF5bVI7Yo
         6qZRDXs3MU3F6u4MkGQagf2L/IptMdr01Bt4LcERmwD5E1MfSC8m70D2tdIAtIN4mrCr
         KICQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9JdN+85JJcFMrtSc4+ILeNdXbyNr4vM3L2aCICEBWuBx776zCD2nsneOdQwg3rsBAv/O60Oc/KCc4DDYS@vger.kernel.org
X-Gm-Message-State: AFuF++mimKGPCP2z5ql/yL0zG9TwEX0wWnGDE+v1+jmdXZ+ZnFPs9Vbg
	ZAf9tDG6aEOkcAi0YVi+xeAmmIkRrmapCtFy2hZwG9bnXsEeZTiQHzSG6xdMso2E54NfVNLYH9y
	eNBUKvUFVprVER8+PKIqFrn0aQRGaaotyKDy0LSKVTq+j65kh4HDqCtd9Nn3w524hFD0/yFYmIH
	+c
X-Gm-Gg: AYBFou2hgzJU9ygqw//1hnoyynRyiBV5z5un5gxs16nXZFs+fySgr0GVs8jmRCbewY+
	VYngjbrTmPUf48GgUw2FbWP4lgXPseqklomRgywusbbOkkSOjraCBj5ReudawBPAz0X13VmeDiK
	Tgk1+VL2ss/z8NOtK7RINRdlze8QmNERL9QIbvrtUT8DuJlb/m8T+L3yEDVLyV/QTWSudKTUc+R
	Oq1hiSU6YX86EaRcSDyIbNV1M7OjYgwYvxFo5lfQeSnVP73a/B5BtD2w5Kg+bnnjUGOW59jcQvJ
	4axROjREO4iJiy6qbbrVQE5ighc5QQyHK3EfNPNnGrvD72iYmJmPqbjKO5xeHQ0l7fae8NaKfIO
	gsoV8+ffn444+YADDGHG1ZSfxIXx1
X-Received: by 2002:a05:6808:1926:b0:4b9:a8ac:47f with SMTP id 5614622812f47-4c1426e4f4amr4751067b6e.29.1789045621596;
        Thu, 10 Sep 2026 06:07:01 -0700 (PDT)
X-Received: by 2002:a05:6122:6c1b:b0:5c8:4409:602a with SMTP id 71dfb90a1353d-5c844096071mr109779e0c.8.1789045289387;
        Thu, 10 Sep 2026 06:01:29 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:c9b1:abfb:f300:5e98])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c26204ecdbcsm831849866b.25.2026.09.10.06.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:01:28 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 15:00:48 +0200
Subject: [PATCH v7 07/12] crypto: qce - Use a fallback for CCM with a
 partial final block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-qce-fix-self-tests-v7-7-cdbd2718af14@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1622;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Uma3r3Qc44Y0Xz31JrEvI/Rw746qZICX+o0Zsz4ItL8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqoqoQWFinvRcFAnUPd4tcM/rD2YmCQ7Yz02TzF
 kzcr8WKelaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqKqEAAKCRAFnS7L/zaE
 w/1OD/48D1BIRVEjmOTkZ1OTGEWgwaQ/dwyRiP644llwbqISK4/pqV/Inlwv5tE4QpyEdtpTxdA
 Df7w5Bz12wbRguaAd02lo31r61KrjHVTbBVXqoEo80ceuMRk1J+8LfrSYx0NnQ8KtBD2OnSdXZH
 UGbX4HI7FbSjGSOgUMaE6I2wDWVrAPcia/yWFtyS816NpAytkqKHoND3dlHmXNPA17Tet/FO80U
 WeuX5kRPrxp+jcnU9H8af1GuR2T1lV0SwqZ8nsxqjuVoH92nKd24o5UTxcMA0Qpf5WwIAJYcn5p
 P4oN3MJphGRyLvnQ9KS4KHsfejsoGDl13uRKAclEI6TcwUGYooiVrzgqbjcZExh21imLVS2iOO/
 rA7log+daqucMzjZxtW/xMGCdazuGXKL9w5ujt8z5GdSJDNuzpX1OModWvWo4izz+Q0XPrnOFXV
 HBQ1QHPrmlkk9Jnaf2v49MSx1C+9Mvb1GtnID+H73kSN9k9qYSF0uf+z86TYeGJCfuG0OXm03OP
 VQ03TzoyOKAVkTZuN1IDFsd+peHkQ4/H09el9UHpYI8nJgNUdk73/rAFud+y8pGSNzRK7/x39P3
 dXgJX7c19T+RD5BCxZtuFOUU+WoXtnwrcCPWhVg+DY9179m6Ut9dWqgHupDiSryMW3ja44w8yyd
 r8Nz89K4h5eKNUw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE1NyBTYWx0ZWRfX9PY2ijeuWsCK
 Pm24bcuMR5CRbY69n3g9MZBj3D7Hh+B4fFH/iV96nUKlmrK6/V78lDblDOPFMOHSWD60b4iniw6
 9QmLASX1hBjojUp26e14I7iICSpA4/8amqIuLF0Nt5UyilrxciD6Btow6V0iKd7AFNIlThu/X4N
 Savewe4l85pS/PU1ux4A84IddEBBxCTSdkACyTuep/3LxoIbEiMgoVSAjy3rnU341R6nLlRhJhs
 8MB5B9P0pe58lKcZEJH4A/NwcCHY7bjDIooJEm1ADTaDi6K5WDhgv3U32ru64DEBe3rwk/GBEnx
 Yd0VXeasUzHdeVD8RQ9DN0Y7ZeXw9YwqDztKdKQvZS2Y0660+zJ4xsp+RrAeJNbQp2SUK4Q21ew
 3JXguBnAnzip18M0vjoJTURBDg2cjw0BwI5x/bjBdFWvXOsrWmNVmGdZwdA9apLbnBQEVaAXsou
 Y4kHN5KPWBrJTkEHRXw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE1NyBTYWx0ZWRfXwU5Ixqgx+M6h
 0t1HB6QG7tCgMQwtBd7KSUG2iTFYnivxcE+SsIGgI7dQVEsuYwDbqPJXA0KRc1njuTDqMp30YRQ
 XtIoAeFUEwktozanSpUuftew1vUdnJI=
X-Authority-Analysis: v=2.4 cv=YKgKWhGx c=1 sm=1 tr=0 ts=6aa2ab76 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dx2SfONCXZg6tt9xEGkA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: GL4wFGtV86alzLbH_uWC7R_xT7ep8SUq
X-Proofpoint-GUID: GL4wFGtV86alzLbH_uWC7R_xT7ep8SUq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100157

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
index 0453b806408c96db9d67e8f1fcfab83f145ffb26..ddae743903229f248d1dc7037c4ae78537476563 100644
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

