Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489524;
	b=kwDMTowSSpQK2FF1YP3wvFKbu3FqyBfkFg+0Nbmfmea9V1L3ytDLLZTlmzBrdOeJ/k9E
	 wNXPIua10VcBhfVI1h1pLrSJaBHD3u+veDMDYTQNfI+aoUNP0WQAvQppDx6JOT7trBeiR
	 GPnrXxyUp9QYHOl9mIbLG1p509WWFCT06Udiag0PfDmTfgu6O/0EdtO5mVhEn1eD63c11
	 AZEhRPzISJaJ564vgi16WLLVHGnG2CalNGNdBAxv5J+I4kj1uWzRwn+Nma9IhfWnRoACN
	 8L4MVx/TzupOhdujrydbP5hjK0XeN0SiHBV9C0cNzX71I9byjU07jnRQ6YUBb9k/Rfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489524;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xDEmza0Qe9pJQ58rhzT7ekkhyxXls7BABB13DbC82WM=;
	b=4ss5jWQfs9rp67DMsXTO1rxcy/tLgPEpoc50IJHnQPgA1pNia9X2xiO062o6yEuu6Q7m
	 dB01gjQxrhlK8BkwOIqboEqxHQsTRDeK3G/1Cm3ijVnDb0fLdqyhLgZNlfV6pue8n5jb+
	 eKxiqlXvzYJPI7+skHSVsv5LRW8KH3N5gVKdA010BPj0ztOeB0kw9wvWvAidFa3pBueUx
	 Nm7O2JKtIIQibb/JsNifQ9WwoYIuQlVYNihSK4na+f7I5/Ym+VdGMYgH8HYhGYmMnJWO9
	 XRZ1RBC4fpMDrhpldtD2EQEaW03PmxMrVAFsj5jKsjRJsgNadL1+8fCySnnjdUYrZsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LffXCecn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SWBDeRP8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981E1606A88A
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 13:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 981E1606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LffXCecn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SWBDeRP8
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACBJs5l442006
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 13:18:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xDEmza0Qe9pJQ58rhzT7ekkhyxXls7BABB13DbC82WM=; b=LffXCecnLuJWqkaX
	PCbiL/5J8Ih6Nxs/UP+CM7vECT9iwbAmKiFfeFPO12z5LGnjJajgdzsk2gtFebYp
	U0rdm6tLuNp5+jMuWyvM4wQYTMiy0pdN827kml8cRdOeY2M4HaymFJvYnogx9amI
	yUDzL5DHjUFd5Qvm/b3LyIQuNrfdBAOar8dQP0FfMRRyNlRDZRQfE2t/ysee8Pu7
	qnnT0TVJhKIItAMCA2/9Hgp5/GYXCUpUs3VXq5EdDQcd6OlUjzbkC1sGOafp6B5w
	Q1bB0vvI7qeP/N9vOvQYfC41VaHS8VgET40kuTx3DRmgDPAcxD+minMxKeXVMO6s
	n3aO7g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw7nc1k7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 13:18:42 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a3451ea93so5712031eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 05:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794489522; x=1795094322; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xDEmza0Qe9pJQ58rhzT7ekkhyxXls7BABB13DbC82WM=;
        b=SWBDeRP8HGmaYKgTOP7Tl/ctYB7/Df/nWGfpcbuwDaChWRnZyRSRVXT2MUj9YFCSxd
         T9cdZcoVwVvGTWAIioje60FrWIJfcG0pob3TPf1Lcba4p/PSFnMiutLPe1Ui7ZgYo70v
         RbK9/MhofnTpQuA/ia0sd+FFvzR825xL58i38TcxDXnzNT3pvI9/pB9Gw0w0EGPwoWVW
         Eif7y0BaPcIqCe3jNnTVIA2jyiKKhmjy3HKhjdFHtc0mnWfhcxom1A13q41uAFIjGGaF
         wV/IrOMsMfrpYdu/IMEaPI7WBWSmF3uqcAL2We5wOFHnU9CpX3ybUVPTnwESH3/Xzu1s
         22zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489522; x=1795094322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xDEmza0Qe9pJQ58rhzT7ekkhyxXls7BABB13DbC82WM=;
        b=F1S5dIim2y94bluygeU0sSZuBFR9Ev6i6osLS7TgznvRP+8Oo0MhGQVdzzuS6LL0qw
         Kt5JH7+KKfYxpxeSY45FGce/aOPeYsVFq243e54oxMYyFCeLbnydOqXo0oGQ6PomBHui
         SDlHkZpNeRIht6OvKGZmN17GgRGNoq/ZESbkNmoHPeukY12OCem3gUbBIoL0zQs3t5FV
         sgO8vRl0ZFFYdRH7/O0pGkrSzRNTirihnwd2cFzcdJAAVX7ez60XmKcPmAEJ0tO24Qp+
         T7EyZGjegwTaCFjj+LS1L7Px3romMkP49rQVrfQjfmm9kHeS51S8TfG0McMG4bDSDudO
         xe6A==
X-Forwarded-Encrypted: i=1; AL+hErGznCRaf/Vrnc+j8UqVt7/JTBIK07grOBa1Pv/Frd5wpHQsHt/5tvqscqTeQgSPN+MKGmYHChQkC3nkGq9W@vger.kernel.org
X-Gm-Message-State: APuU4Z/P0qnymDOZZCOI6OivNzdG9e7EpJ1FcjJ4ROlwQ8WVIUgxbV+t
	Dhzx4AJUgEX7+iK648/QMiQvvKKoIoVINC6kVYJSjZiF0DXtDmeKrMFLY9iXLbguYZk20WbEWmS
	A40/zbVar7Rm6XeWnP29wGHNRvYy5tyTIZZANiXzrJXeBs410MSDVQQqWkpwmVtV8o+4GmISJTC
	VF
X-Gm-Gg: AYBFou3oLuN6bDQ6PtUjbjen1cJGxAe/6D0kVoSYysP+2SgXLwTCCHQy0qkMN/DtX4n
	clec6NGCv/Txci5XXqVD4CVGmrS/7qdtFaBMSbU7/csiNDiMJ4b0K0C7y/mA4+6BRDWvrEd9dLt
	hFXvBbxlgcfOaWlfJCsrEVQYUOQCy1VOTWI7PpwdDa2iixO7QKYB9Y9JmMPko8u2MNvv8z19Q/L
	4P+XrLHmCA2SXpOis6XXaKhwRwQkf3fZ6pXIIhOstrujRvJJbEN8luGEG6iLovou3diaCvNs81x
	Y5anzRkcGNJecACOA+WHHLFFyZGEOXAqTDpLRe+oNSuPRoRfZJr1c98ZWTET1WVvOmvtX3JV/lJ
	eDEjEjcTr0gEx2E00Wb0h069VIvmo3dq76AE/ZRn4iG8J5Twzec/2BLmxR4XG/N0VHoNJ2nJ2gi
	UQTsAOvks=
X-Received: by 2002:a05:7301:2311:b0:376:19bd:2af9 with SMTP id 5a478bee46e88-376832816ebmr5975409eec.5.1794489522076;
        Thu, 12 Nov 2026 05:18:42 -0800 (PST)
X-Received: by 2002:a05:7301:2311:b0:376:19bd:2af9 with SMTP id 5a478bee46e88-376832816ebmr5975385eec.5.1794489521438;
        Thu, 12 Nov 2026 05:18:41 -0800 (PST)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e7d24sm43798356eec.22.2026.11.12.05.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:18:41 -0800 (PST)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 18:48:17 +0530
Subject: [PATCH v2 1/2] mmc: sdhci-msm: Enable ICE before enabling crypto
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
Message-Id: <20261112-qcom_ice_pm_enable-v2-1-177e454d6f22@oss.qualcomm.com>
References: <20261112-qcom_ice_pm_enable-v2-0-177e454d6f22@oss.qualcomm.com>
In-Reply-To: <20261112-qcom_ice_pm_enable-v2-0-177e454d6f22@oss.qualcomm.com>
To: Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <mkp@kernel.org>,
        Eric Biggers <ebiggers@google.com>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, linux-mmc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: zAUgUoXaGlCHYj6VlLDAF1v2U1JnEDiq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MiBTYWx0ZWRfX5jY9SOfe3E46
 hU/ecuov3tMPuRHfYyAbZ4t8qw2ktg5cLMR4Hdo5qfMJIfjh7sdCwTVeeaDtiPNlgS8TGlsH4iu
 K+sWdAc0Zjil3yFQhaiRVxLEg9ybQPI=
X-Proofpoint-GUID: zAUgUoXaGlCHYj6VlLDAF1v2U1JnEDiq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MiBTYWx0ZWRfX5qdzgthhFy1F
 d3g9Qt9eh+jrvKXVXOs3YQP2KUMtYIyu4fYNvsA9f6lgg42Ip6UI+M3FaFO/+7uQA487uvLqWBe
 ehHIbJS3MLM5r79qUBQvEN9cdkr3bujfw5T3kONCDfyX24o+PH1YLjBHE8gOGFjNdl9LL3VWb3b
 XHNbQXfhDcm3a06wNOvFVnELQV0yIgrIYcXwi+tz6jzFfN8z36g2JCkCdTjWFuIZ8eO+P/tgZxT
 Hil6UevwczES3dcRwy/xT6fq6+SewrBU5Xz2+k+UsNbQMmZMuGY4b+O1QYR5Gysh01esQ/PgppJ
 9RMjrW4DEaiotfTZQ2jeTza5SvpywjYnRpAH8/0jKctA7jS9lCV2dIX+rJOsRkXKuzhn4KfIllu
 YB3+JoWrO/I1Vp9VUTrb/VE5Jo/s0XcXYMGdzFG2Q7aXkKG8uiuMwOcKOOBLAxVSnj6HfIbS67G
 5Jg6Y0YuTux0/ayFFWw==
X-Authority-Analysis: v=2.4 cv=A8b5rKWG c=1 sm=1 tr=0 ts=6af5bcb2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jhS48lKipzocA6WHYXAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120052

sdhci-msm currently exposes MMC crypto profile and sets MMC_CAP2_CRYPTO
before enabling ICE. This leaves a window where blk-crypto can issue
keyslot programming calls before sdhci-msm has explicitly enabled ICE.

Enable ICE during the sdhci-msm crypto early init path which ensures ICE
is ready before blk-crypto can issue key programming calls.

Remove ICE enable call from CQE path, since ICE is now enabled
during SDHCI crypto initialization only.

Fixes: c7eed31e235c ("mmc: sdhci-msm: Switch to the new ICE API")
Cc: stable@vger.kernel.org
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 drivers/mmc/host/sdhci-msm.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 32b1bcba47d6..b3e0356a03ff 100644
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

