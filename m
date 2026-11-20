Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795203319;
	b=u+th8E582OLsvjCMAPpy0usTRSKjNNV/jevAuIcVycYNp1NBBPcYmwJTUMWPp7cVjyt4
	 NbAibgZLfTYMiW3zxfIbKrxMZfUJ1Ado6am41GOoMg0a1B38+TEZOGC8bFfupDyhQfwDd
	 rc2npZvLSLSR78GB6E7xO4o0b7hD56B9FmYIQCo1ItkRFnJnHLPArUaMn++qSESZm3Qof
	 zlnQsNYSMkG8IVwo21nfFG5jNQCQihE0VdYUrTgbFFwPTejfUgKQXwHW5zFFFX1qe5LrA
	 W8PjX7WJvJAGasZacts6+5k5ki2Y/yairsLKALTL3DbJ2dqBpt7mf0ffEbKzuvKAlZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203319;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dL5qrymGK7O2V/TlXMiVhWk57sq0Wg6NLH/zPnd4phY=;
	b=g1SvzpV3Hgu/j+MN2/zZAI3x2kPETooESueKTgDQx62EYkAcB1SJ2xa2cUTZf1Gj3Pzs
	 budee4Z2uUzY4fLFpWzZ2vWbBeVrNBw/LrIMC0SPejUn1egfNK4/7iU/Bx8iQPSErN1NT
	 Jl3pKEHzhZ5udsdePAuHu5u5ojtlL4d0o+pV0ys+wmaCgcrMkHsrzgMMGz6DvtP/UUteN
	 u3XPGRTtNbSyzyc9vut02OpzUXj47N0ox0USthnB84VYqrXKkGjbBsZSRHRPIzsU44AnS
	 zSYyMRORb2X0pa7inhJZ9NCbn3OYMbWBXppwzen4o5Ftl/696uXRtgHCHTnMtGlygyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LseF7q10;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f213JjZ8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE70460A2612
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 19:35:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE70460A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LseF7q10;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f213JjZ8
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKI9fjD3121267
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 19:35:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dL5qrymGK7O2V/TlXMiVhWk57sq0Wg6NLH/zPnd4phY=; b=LseF7q10Yx0HSNMi
	Hv0eYmithUeK60i1eJxe2XOogdFyikPL7D+DwgwA6DsjXOrU77m1Sq2GMWfFHuQp
	ByoWaJiHBNquvMU3eU2AWBxkI0mUulbgYYXPIKgjXNkJnmFsqvczd1JxY2qDdj8o
	ZNe+DY0wf5UXI+qZI5ZivjQBdObZ9f+X3Loai6Pg/vfCK3NCGTbxwiFG3sZDhP1X
	aRHJPiBnvASughAXzUWfWojG4KIhbKf7i/il+gMeU2RNAnsh4jWfBIkRJ4IurQhg
	JS1QltTyvArU202mKhqgeV/PyIv1Sl3Tf/EWjRxwCxLSi0ubazge3bflzPwMiqTR
	NQvReA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2u868acq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 19:35:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94970ad532bso208326185a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795203311; x=1795808111; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dL5qrymGK7O2V/TlXMiVhWk57sq0Wg6NLH/zPnd4phY=;
        b=f213JjZ8Ng57i6U8tU8MtyyO0Ei8RWBSDL7hEgAQrQ6r4X835zQHKMdSNTjLe3CryV
         RLz8/JvrMQGfP5DDmHPe72N7TjxEVXd1OBR9Nw988+P2wo+9vb9NYA7PL37o8adnzRqf
         iGnwR179Mp5fQaQjmUaGfLD/I2DGpo05XIB4OB9Dm+0uph7yyamKaC3o+oA2/yyIBAKy
         pnGQqsHEtBDlJajx4VMyHCtyIsCPXzDL+uXoBO9JSBBaol5MNGNe09AELq9J/jtRdvIc
         qSav4AO0MSeAD45F00HIds643rFqsu95pnFkRWyDTI+u2jQmxA8QEXRAtDpvvuTyb1cn
         ycBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795203311; x=1795808111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dL5qrymGK7O2V/TlXMiVhWk57sq0Wg6NLH/zPnd4phY=;
        b=q8NUgsfX0JE2r6nAm7dlPiKetA1Gqi46kqSeQyTgHt83knbV3/Vnf+pvfjdWj8PfF+
         UH+fTSYfYUvidrwbleG6lPLvsM4ZRkn6O8Swr0xmRa4LBj8kKhXFBA5CQx7m5ZnJGG8e
         D1SNMczMo8u5gjYMfp6GQC0fevzmXrc+2JYVBGMhCFo8fiubtAaedo7LuYWZKDaJ93Ni
         GAaatpjZi3Ld0eLdCJFeT/C1VNmf1EbnHXrw/YDecEJ+ZZhLQlDrA3A7wCs6zO9qCO0+
         3ZyRtFFz5vJQmMxXSOWR2FoEfG45d8AP5M9Y8PrgxIzh0UTkiYirXicGBvBX7o2u/Tlh
         09PA==
X-Forwarded-Encrypted: i=1; AL+hErELXKUe2bxSzSOoKS5d8XZ+B/ZvZaHj1i7wLaQipmeaPNrB/BibtX3BnkO2V6tY4GXya0ndgG5eCnLXh4PA@vger.kernel.org
X-Gm-Message-State: APuU4Z/XsRgnPbj/gU6+wPrQh8S/Tk1GwehzS8au/qvnO4r7W+0SckDB
	QS6UpU6SWsb8qIrg7gxOVjzu/31s1wumFENJp/l2wLsaAPvE/6xMxzlRNiGbahx+1MUMUGmF/YD
	MwzVgsMqcRjXXID/vcD3RXAU+U9qqI/1c1UzHPkmEfgjVoi5TOpac5pkG3m3qba4Gr/hI
X-Gm-Gg: AYBFou0RjY9HH60FzpM0HmzesgSEfT8MCRQnms+QFvN+RtgImpNOVX8jqpaGv/5eIlY
	i1GJ4he881yiUARmsJmj6ylGve7DhU4CVw/NxZC3lqrpmdY5K8FGWUzdOdiMz8EQyrX0Y5EZV9q
	TsxdOKK2pK1qdlaiDdgvBNKvTh9rShhsKB6NQF4XZURhEKKFFRguTodJd0NW2UGcNWa3/2wrTyx
	aGVcTguaLel7XyCqyNYmJgDQGQWEMCiYbMJnPHc1nXEubnX2fSgH5OprQmTui5AdNieumSvYpD2
	BoOtbvWu6tVjuGgtcCziJtdlIMr7ZefzSfrgMm9n10N3OaZ/MbDzCRTihgHMjD85+cdXBmzZdRe
	9KlHVFJq7TgPJYr/m5+rYReOw55GSLtUig7pab9lkZENmFYBbDksnX4nsnM94YQbQ2ifLIefWe4
	Qf
X-Received: by 2002:a05:620a:2a12:b0:93f:1d5:9973 with SMTP id af79cd13be357-949bab5a6a2mr648561085a.73.1795203311236;
        Fri, 20 Nov 2026 11:35:11 -0800 (PST)
X-Received: by 2002:a05:620a:2a12:b0:93f:1d5:9973 with SMTP id af79cd13be357-949bab5a6a2mr648555585a.73.1795203310736;
        Fri, 20 Nov 2026 11:35:10 -0800 (PST)
Received: from brgl-qcom.local ([62.245.128.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm6806343f8f.20.2026.11.20.11.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:35:09 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 20:34:56 +0100
Subject: [PATCH v12 3/4] arm64: defconfig: update the Qualcomm Crypto
 Engine entry
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
Message-Id: <20261120-qce-fix-self-tests-v12-3-b5a2a44bc5ae@oss.qualcomm.com>
References: <20261120-qce-fix-self-tests-v12-0-b5a2a44bc5ae@oss.qualcomm.com>
In-Reply-To: <20261120-qce-fix-self-tests-v12-0-b5a2a44bc5ae@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1275;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3i3hdwFui/8ynH47JNYu7VqIYczjdvme1AY4IJcpfg0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrAKDlAWUz7MHSnecvkIFD8fzhr78XWyGqTiqFp
 ba6dRuHuFyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawCg5QAKCRAFnS7L/zaE
 w0QGD/47iqPh0erUxpbyfM/v21ZsiKW4cVcUfs2IqyRlfHRc5SzLO0mtLaz5LB7MedcpOhE9QEY
 iflgwSDDEmM+mz7j7i8fLtuCvCgTI11KDajRLFCoc+NW3UsnLRJZnl0CabUcb79OXJmNgWxy8lG
 tqRyaC6eyWhVlmVFwHAT+1e1TVQyOJ07mGfcp3m6PCZDUrFmJQawmfJmSMyPX4BdNbli/3Qzav4
 r1tDg2hK1n4CmgArmOTwEdCb/Sxbo0xq40yX0HjnVhNmm0DKll6MKBTh0vUAFrWc7bzlfXG3K5f
 srXIiqYIEmjXsOEATKEjqdP2CSd150YKi1mq3/eHL3zmvyGjgWk835y1DmqtvjTH826EDdkG+3y
 6CeUHNdC78aMVYldot1iia8S75OikmhaAbzpOp6bLYaCaIwavutP7rCbHbc4H3quvZJOzCjTmaI
 lhXwZFMV8zRBNRHVNR8Dha1NCnJwc3Uyvs60+M7aLRV6zGhl3v0EFZRvkRipCFFRfXdX/q7TQ7G
 fLnpeW9nBP+a89DJz1CDFjhLDNLBqf/eu+ZWUiFMj8sIsa6cyCgOJSwS+bwETqDttqwbB3eTxdw
 zQe2biR8a+XHr4BrLfHLPZxeMBfmmIxJnZmkcaA68nG+y4GqFJY/lHzv0tMs2BM0hPlQke5goUh
 Ttbiw4m8FjdMLlA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=X+zHu2Te c=1 sm=1 tr=0 ts=6b00a0ef cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=y0NJeVxnVzJs6a3GlOz7RQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=5AW58fNYxLuDjIPvRSgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: ST5sjRZo50z4RP1i0IYNqeBl0IPqM2xA
X-Proofpoint-GUID: ST5sjRZo50z4RP1i0IYNqeBl0IPqM2xA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA3NyBTYWx0ZWRfX+6gvJqOSevgU
 srRVP+MKQo8tvX+lfJchQ+gtatwZu0MPqmIU4nnyTdU52luSyMtYLDHHLRlEe/w69Nnzg5mRbou
 MQCOgqQBJGgZ3aKAT1haz8ItDxn3kqM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA3NyBTYWx0ZWRfXz4P1Jvv9hR8c
 QOl/s6EqMB6a4CrEPtPrTWlA35S2ZyjS4+zpn9fu1h6YxJidR/eoIPPiI+lRnd8ZqSE+Pr6gR8I
 KOWCP2ZUHAyL0y4gjNqulgj7JbQ5ZjMD7HAQocv+/L69jlgZo5zAlydZllK5r8FYwOLQwBXutOu
 TsCSnVnZinmUek6+jR02qFeVQrq4U8QNZsBJNPXrRn+c7V5NyQ1jQsgE9n0RTaJdWjghKhRSWID
 r4i7++OWwL51b8inu26JbuonXkwB5TIwbSngowPXtKX0j215g68EaynCj5pjTNZ6IiSLKW1DbLI
 fewrW18AVUc/O/iu/cNSC3KydLZt+zeiix7fm4H6gcPYpg3lhL3+rVgU3P+xBwcqOSsnHYzTRQm
 6IoL0CeIjeZgQYUvWenhLTV2o7PP27lgFIr5O8doxCCZl8DsKeynYa65qkyTnXqXjIsVt/6R1pL
 Juj8gaKZQJk65yD6lKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200077

Most Qualcomm SoCs contain the QCE hardware offloader. The crypto driver
for this IP is being split into a smaller core stub that doesn't register
the crypto algorithms on its own AND an auxiliary driver than handles
the crypto part. Update the arm64 defconfig to only build the core part
by default and leave the choice of building the crypto part to the user.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9c5b64f34a228883a216cf205181416ac2f95edf..1e0a7b81c738f62367df0ed59c005ea1500714cc 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1553,6 +1553,7 @@ CONFIG_MTK_CMDQ=m
 CONFIG_MTK_DEVAPC=m
 CONFIG_MTK_PMIC_WRAP=y
 CONFIG_MTK_SVS=m
+CONFIG_QCOM_CRYPTO_CORE=m
 CONFIG_QCOM_SPM=m
 CONFIG_ROCKCHIP_IODOMAIN=y
 CONFIG_TI_PRUSS=m
@@ -1801,7 +1802,6 @@ CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
 CONFIG_CRYPTO_DEV_SUN8I_CE=m
 CONFIG_CRYPTO_DEV_FSL_CAAM=m
 CONFIG_CRYPTO_DEV_FSL_DPAA2_CAAM=m
-CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_TEGRA=m
 CONFIG_CRYPTO_DEV_ZYNQMP_AES=m
 CONFIG_CRYPTO_DEV_ZYNQMP_SHA3=m

-- 
2.47.3

