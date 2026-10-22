Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662729;
	b=Tv0aUegHJ7tIOkmx+ejNN08lG9VOMQZhYl7yu4wpOPRnHI7a0mgI7z9Ylx8ijQfSkycx
	 /zrjkMcIwJ3JeNNAxGcxQEbe9Jr5qC9ni+Q3Ltv/kIwP5/Y5qJnm5iZLBeOMKjQ0nFH4B
	 hkVs7PmmIQ7ozKFz5UZtUnF2YaRr/DTiVc4xZwov3Z6K3y3Doy6obocfcvjNxIL0L5Wta
	 U0vMEDM4Bc1fXQ5/pzWSEDA8TK9ca3OLhJNXcy5BTpYIdF2rGPQA4BUKqfYvlcn++Rr+o
	 omN2g8NYggaAtJEY9+4Rh8KPbOYa+2E5d+298FJS2cFE+i601uT6JSC/nLQDuqWXzOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662729;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=g2TlYvXtYyp8Er721IC1PRai3CL4Jni3K4YQoaDrd38=;
	b=qZCgS+p4ppNi2bdjmOdgmRjSZS0LyJ4th7XwvFbfENyR/09txs/XjwtrLPh9+3dTMaAR
	 lTVnCyMLIiNZfOMOPh9J0A84NIa+rC4WPsM8Gp5ZkTLzw8QTfYWpOUU0c+MWoL6EFNIKt
	 mo7ZiUA5tXsm7l+pXmdQ6ZwdIsrb+yoUwuooi+Y9W+s8au6wrAWm8UysYHp3jCLCP4J2o
	 V+Vj/ZnY4W7stkyrZ2PEoWbVhY3NfD1RfC0XvEDT/ZH5n/aMyq6kwdIxuyhytABcs46bZ
	 v8KOz7vQRkrypQMhtCvgQbCNJSA5yw18HqoGaUun20HrATFgWoR9VbBNCfmtp5YX8fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rfq6P8qn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="R/vyHk3O";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E3A606A31B
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:52:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46E3A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rfq6P8qn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R/vyHk3O
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M705Us1995955
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:52:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g2TlYvXtYyp8Er721IC1PRai3CL4Jni3K4YQoaDrd38=; b=Rfq6P8qn7eTM5IEM
	8ziZrLKUzKDtP1/mhjWh6O6ORDn7ZZLeRd7IOUvMamy9fLP4ZCYLYb9yQaybAOz4
	wo/7c/SJnLdIJqYZLywtqCTgp+ImjqroYW8oZeXwz4t2Q7qDI5gYzt7TCJQZbZuQ
	8T9q63wxiefY34rB4kb/7XBecaeU0h5yBRRpxGMXZkmlKTEjsL4EATvBPMKz8FaN
	Wrx+X02DOHzXMXObZq3oRI9uzIqRsF03RlTAniuRSAo8R7g3qSlptU2MCOcZJAUo
	Eigu3l6SuxoxuRE7+G7KT0DvJjZMOBcjXGC6H+RXduBf2AfsLESUtRFNgo92kr6E
	IS0ShQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bsrn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:52:08 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso2771410eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792662727; x=1793267527; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g2TlYvXtYyp8Er721IC1PRai3CL4Jni3K4YQoaDrd38=;
        b=R/vyHk3O7Rkw0AsdW8nlr16XrdGaBFVQyviunHUkWVa6jdHHL5hKsIb1SgFEGnVpz+
         2uh4zR4S6zFrVOFD5fcqc3qeunBJQ3UtOPNIBwqRAqKB/LAQYt5Kz/njbn6NG6QLlm/E
         JRR1mU30LtbjhK0fhX6Lqbx/pJCqxxcM8hmPyDwBnoChce+FBof2fwxi0b+uIzT/0+og
         N831Y6PDo96dbzM+iUDBuGBmJKi8PdpQqNbU5mxWFlTUb947zeqLGppQRhG50CP/ujf0
         q5ssKSZLYoRXrTGc74da1vQffIZmkPFB/2ul9KzJMDlJeCGCvP2YehEf5/vbfKbW+CcK
         G3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662727; x=1793267527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g2TlYvXtYyp8Er721IC1PRai3CL4Jni3K4YQoaDrd38=;
        b=e0QX/dzKGHQO2HpEioGvw0U3z9de3zF5PKzA6D6khFheZ/ae2jEa4tOaJc1/59XZEj
         660xhsWCFXSEfay2nuQRXazJ3GDVYmz3BQvOmm9oonum0zT0hAKUTiCygiSo0Az/Izwc
         9Nzxl76xhCFPCJEU0CEXlGTZp+DY3rgqFj7fgUOV9xpLn3QYOptpvqkSO1/U1BuN5A2n
         nJxRv0i+Nz/tPL7XfuHQV+KgXTUQ/kPuEU56K0up+JHhoM7nSHCGq59N/oM/l9VvmpWx
         4dPTJE3iAlQz5trqJxEKvo+8Ixt42auuQ8O73NbIiqNEs/94bd9K/V9iBXavCrVV0FW5
         MQNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQ2FSm808Rji/H+JwQkvHpEnev2tsTZy0fAPu3PrO3RbH62cDCtVwJqXaLw/NhL2U3PleOnOP4n7hs0FTk@vger.kernel.org
X-Gm-Message-State: AFq9FYKaiGfi8oQJvReZiVTxYO9dTPF8QK30Dm5r9u27ldIQonysgAgV
	3nQxBt6LkOBNUUjH/vTiEL3KAdsP8FGd110U+6peHBwUi8XVrI8nDYNDvRaVvQCxvOBbEisLyxz
	FzPsXUAEHw9EUBw5FfB261Jrg5TNrmxulFthdn2LBvSGrJm/g2aTBWgHM38ezZJ5TyNu/
X-Gm-Gg: AYBFou1BuL7GJlJLHa6WTUX2oLZ5oeHvOex1YCdQp45jxV+9e0Wi2q7Hb0F1iRgwu9l
	4pO9GsU1FZW2GlX7QCnTAP7joYEcbiXVrtmlm8hr1qmujABhIG/yceb7nFIojAv9qwHVEdhLBHT
	bAZjIWN1m8RvAdaAjU2kr75SA43c9mRyIIy490AmqeypKgr4OQrKgZERyDFDtj1C1t9twJyvN6W
	LI4JE0R8VH4Vr/V0gD7f3cJHh+YF38XMDmSDBrxX9nBsHDL17KmhNQJHzo1h/xkumcjPyC+QNPe
	mk1cDom8xfqd+cyNfM+1h8X45EVbT4b3X2bhVkmcP71AC9IOZoBLgFv9tmGcwQmZA6mmCOyOYIT
	aA+kCd7K58hzU8Wi6Pt2MfFcED+c92znh
X-Received: by 2002:a05:7301:da02:b0:358:45f5:daf with SMTP id 5a478bee46e88-3674e35502cmr5978250eec.29.1792662727289;
        Thu, 22 Oct 2026 02:52:07 -0700 (PDT)
X-Received: by 2002:a05:7301:da02:b0:358:45f5:daf with SMTP id 5a478bee46e88-3674e35502cmr5978228eec.29.1792662726780;
        Thu, 22 Oct 2026 02:52:06 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e153519sm15742170eec.3.2026.10.22.02.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:52:06 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 15:21:50 +0530
Subject: [PATCH 1/3] mmc: sdhci-msm: Enable ICE before enabling crypto
 support
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
Message-Id: <20261022-qcom_ice_pm_enable-v1-1-f7a84086c651@oss.qualcomm.com>
References: <20261022-qcom_ice_pm_enable-v1-0-f7a84086c651@oss.qualcomm.com>
In-Reply-To: <20261022-qcom_ice_pm_enable-v1-0-f7a84086c651@oss.qualcomm.com>
To: Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <mkp@kernel.org>,
        Eric Biggers <ebiggers@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-crypto@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: Eq22ILaMe1YOl8ZRLBXJ2vcm2MjfMIyn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfXwEyR97eBitYq
 ZzCVOjRLJFgGXHJPQDCpySoAPWPs9SbCUQSxjf1bLgchin1gPEL7BKbQ659Adm99MMZ9YOpTo2W
 eeLSEjkEnPVQ7FvGLE2Ko6fGoDQQU5g=
X-Authority-Analysis: v=2.4 cv=F4fC5ahN c=1 sm=1 tr=0 ts=6ad9dcc8 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=jhS48lKipzocA6WHYXAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: Eq22ILaMe1YOl8ZRLBXJ2vcm2MjfMIyn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfX5dirQ7btgbEf
 INXZXtQ6wIGpaJClpPvmXYBWl/2hXL7IzB4pCGw7NlUCtPcC1yj9MCL2OblGJTHSBZPXKtO9nk3
 mmlD85UgpZ7F5iQfxwlYDCvuk1vYHhBdbl+YY99zyFqiebptLCpITwk91p7N3rmyzlGdi4Mbpvr
 CvWsGlPQ/hIixLRiXZHrMvCHXG/7wmExy7A+HmErd+6RG8Z3XcSGs9kCrNCYQsyel2zTJSsgXIj
 D3wxnCaOTXzgNApyITX5khHxRHV8qkde/QrU9MS/IueGHEJgFlioA1qBGcEW7oP7AgBFxhQ+OMm
 +mXoKZB5d6t+UMRE0x8d6m2orM8VFvUF+yni9ivDVB80gQdhZ3SLVfkmtde8SiC8d4yj1ITall5
 BXuERWlKxggPbQhCjkXprAdAwYsWXw4olcAMdxDX+Ir74fIjzjIM1YmzD41+CwdvY8Lh4gUHT4L
 A24LzUIjWdIIUHV6cug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220039

sdhci-msm currently exposes MMC crypto profile and sets MMC_CAP2_CRYPTO
before enabling ICE. This leaves a window where blk-crypto can issue
keyslot programming calls before sdhci-msm has explicitly enabled ICE.

This works today because ICE clocks remain enabled after ICE probe, but
the storage consumer should not rely on that implicit clock state. Once
ICE supports runtime PM and clocks are suspended after probe, accessing
ICE registers before qcom_ice_enable() call can fail due to unclocked
register access.

Enable ICE during the sdhci-msm crypto early init path which ensures ICE
is ready before blk-crypto can issue key programming calls.

Remove ICE enable call from CQE path, since ICE is now enabled
during SDHCI crypto initialization only.

Fixes: c7eed31e235c ("mmc: sdhci-msm: Switch to the new ICE API")
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 drivers/mmc/host/sdhci-msm.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index aecd425bf095..85065cfae132 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1928,6 +1928,12 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
 
 	msm_host->ice = ice;
 
+	err = qcom_ice_enable(msm_host->ice);
+	if (err) {
+		dev_err(dev, "%s: failed to enable ICE: %d\n", __func__, err);
+		return err;
+	}
+
 	/* Initialize the blk_crypto_profile */
 
 	caps.reg_val = cpu_to_le32(cqhci_readl(cq_host, CQHCI_CCAP));
@@ -1963,12 +1969,6 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
 	return 0;
 }
 
-static void sdhci_msm_ice_enable(struct sdhci_msm_host *msm_host)
-{
-	if (msm_host->mmc->caps2 & MMC_CAP2_CRYPTO)
-		qcom_ice_enable(msm_host->ice);
-}
-
 static int sdhci_msm_ice_resume(struct sdhci_msm_host *msm_host)
 {
 	if (msm_host->mmc->caps2 & MMC_CAP2_CRYPTO)
@@ -2141,10 +2141,6 @@ static inline int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
 	return 0;
 }
 
-static inline void sdhci_msm_ice_enable(struct sdhci_msm_host *msm_host)
-{
-}
-
 static inline int
 sdhci_msm_ice_resume(struct sdhci_msm_host *msm_host)
 {
@@ -2182,12 +2178,7 @@ static u32 sdhci_msm_cqe_irq(struct sdhci_host *host, u32 intmask)
 
 static void sdhci_msm_cqe_enable(struct mmc_host *mmc)
 {
-	struct sdhci_host *host = mmc_priv(mmc);
-	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
-	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
-
 	sdhci_cqe_enable(mmc);
-	sdhci_msm_ice_enable(msm_host);
 }
 
 static void sdhci_msm_cqe_disable(struct mmc_host *mmc, bool recovery)

-- 
2.34.1

