Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421AE49BD97
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789995537; cv=none; b=Q1S0KgOUFMtH7ugnFLcTnOaOWtuuFLvqu/kiHL6x803DE3WOCtB7fIOSWwVb7fCpBDX7d1MQTAtz1NVSTN7J7E8ihTZn0n9+GHaXbPipCXA4UXCe1vj8mm7JnSoo4ki2yagfdbD93gPTZyKqszZ4ehUOSPs6porKqnfKpWDLv90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789995537; c=relaxed/simple;
	bh=bR7rcpx8onqzBSepmnCRtUu5K6IkMCBMdI6sMN2Sg+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pxPDjSCAQ4Lm2YaPaigjl1TjFG1KFZqUrHKC5p37Gxhf22Taw2ggN950/8WcGlCcoxe1/uEnMj5FU6JC7Mv/vK2eF/O2P0n7frMssAmVfSRecMkJQElsyY/1H1inIcqOJy3XHu2kCsyUGbfUkOVy7/jVb1wpBJx+EvOGaORy7NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lhAMprkZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YUmedBtm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lhAMprkZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YUmedBtm"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdu0R1926522
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:58:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y8KgtcfuuaZKDzeqQLlE1f7UrQdF8/SBl/S+AsYWcQ4=; b=lhAMprkZ5Gd+p2Bl
	zapGRykvf7aKToBxc8zGNoaMhaBWSB7L2eti1GKQO1p1txhBuow6ejUZZ1XL9eBr
	/FWu2c0eyBhxHScIFHpIrC1+NW7y3Wd1KSuG0Lnuxwop9jCFOl8Sk7lk1GlUvizT
	5MEee0gSkgZU4CO1m0ygK8Q8/iRXSnB5PLtiKwEfEvGtuTbei+T79nS7/K6u+BpO
	LjyqPGy6FLGh/P9b56TjF6eOAPR2Gn1jkoc/9k4t8ChMwH7bvmFYh0xQmC4L+Yux
	mQ0U/ur8lFHegpfyiRV+GLi0hwglZleJanjGFvOL2lJ2j+rvStGzpTdV8eIk6Nv9
	RB3oBg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3vaf6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:58:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939a6937513so457789785a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 05:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789995533; x=1790600333; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y8KgtcfuuaZKDzeqQLlE1f7UrQdF8/SBl/S+AsYWcQ4=;
        b=YUmedBtmCXz7UWY40CZaWhGqi1IwgUist6GNt5C/oC0+JOzCTkL7UJYoDiHDYeVh1G
         YT9ArOl0PRDlP1SWMAkcu2IzJhjtpDq16RCu9K6M9Ch8Nj+ft0iW9UogX7jp1DpT0Ilu
         M1gTd4MbxveHiYdeXs5ppWLTCdARMnK4PY+69IKk9q82paFcZiGoxlFO3GwcPqxntMbT
         bEdRxCsEhNfGy/q8QO2lawh6OkshIJ5iaEwxWeaNkl4k6ACRNGQTr/eVXWnZ1EPJqMiO
         Xdo/Ib2xPI8FHjuecF15hVBCkEQoQ/4smAhOS6ptAu1r83VXyNvrc02p8gFTF+DWivAO
         8Szg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789995533; x=1790600333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y8KgtcfuuaZKDzeqQLlE1f7UrQdF8/SBl/S+AsYWcQ4=;
        b=uFbjXDjVqXvgT9XiwxlcgPnx4rjIykSGfA1I7/6F0hPrY+GdOUHq64QNQEl7F9RY3s
         2hjr+6Za1aDZVDzr5Ew2z6vbsenUaJoyS8FRoFUswlJ+G4b6Sd0zO/8tZ2B/pzC9oUO9
         HIkv43J3u8x/uAfF9Qq8NCJ23JM9N27/D6gX6pehIvn/+hn3yuQxSm+dmzxmc351FnR3
         VyMY0MEU4BywYuGN4wBLH9qvBGBFrMTxRIpzuzYUx7pzrzO4o6+vfwifIB3VwFldoq34
         zW6lNa91p7bFJiibXP8xbk6BKh1VpVB2nBk9u8aWp0nQMTd4vUytG5dHn6gIvp0DwYhX
         p81w==
X-Forwarded-Encrypted: i=1; AKwUvBzD/frV4OXcFd2UVYisUnQjFFrJk/Tl64V/iYdLuaZkIPZ0vlNjBNXcHh0w3mjyj10ZzZlNoJlcGZyY116M@vger.kernel.org
X-Gm-Message-State: AFuF++nxig6SGhcD16GQ20oSCwPXaGCLSeKTpQX44Z/uuJnvmsga116R
	ih167kD3hv56tJkl67K6OKZrb6NBau4W7g2pKKtwnybDwhO2mDzEzoCHRvll2/2GS4A0iVEth8x
	UP+t/3XTkn3+ky5XGdl2AyjZFRoq9p7IAMVVkq0V9jKdB+oBpFYNYrt64eHbOVA96GzDE
X-Gm-Gg: AYBFou3syoGcPX3Ffhp+7Suui5rIQqYbD/GtneC1t5DyfHp8WUSAzhzh8CnUCZflIB+
	1qb21qU4fsWfG0QQLqscbUviOgaTMLJmF38oQBImZgckCg2cbP1blCa3C60hh4KLbz2MToMYpfB
	BosjvF+ErsYYFYMgrrCe4Foh4Hr6lfmEdU+D9yPtl59gz+R8nUmkWxGo2D5kpIC4SWpIU1aZ17U
	pYkdK6ivDARd8HkSkrxWD9qLwwWrI+tB4jjZ5DYMJIo8zAyEv63CJnb3dmLFXL81FQFm9UFrKQU
	swkys03fYXd1mrq7Y60XcaSeEbYu7RimW187uwg38Ky3gjF55TQ2K2MD/RQskPw4sgrS1lr2cwJ
	cnbvjJkjTRhgL2LUMK6fyi6PRGL8=
X-Received: by 2002:a05:620a:444e:b0:939:1864:343e with SMTP id af79cd13be357-93c15ec573amr44085785a.40.1789995533441;
        Mon, 21 Sep 2026 05:58:53 -0700 (PDT)
X-Received: by 2002:a05:620a:444e:b0:939:1864:343e with SMTP id af79cd13be357-93c15ec573amr44081785a.40.1789995532985;
        Mon, 21 Sep 2026 05:58:52 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a359037aasm320278766b.63.2026.09.21.05.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:58:52 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:58:16 +0200
Subject: [PATCH v8 07/14] crypto: qce - Use a fallback for CCM with a
 partial final block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-qce-fix-self-tests-v8-7-107537869a72@oss.qualcomm.com>
References: <20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com>
In-Reply-To: <20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1622;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=bR7rcpx8onqzBSepmnCRtUu5K6IkMCBMdI6sMN2Sg+Y=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsSnvHJiGUrC4aXm7TleNYXA7PepLc1wPa2hbD
 kfU5yixVxCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarEp7wAKCRAFnS7L/zaE
 wyk2EACJIdLOHvcyKrgdEHuj1c7IJ7Q+gb7sVEzM9lLn1SDswRn/fWkqvqJIpO3P3/NmM5EiaOX
 Hw5HMjEzPxRSMpGluZXC9d4j+amGCaC9uSisPhcO38/tndUG+3Bv3+Suv+aBMQfjuNxGQrReWeK
 TzOQ0eHj7fjm/pk4/dkJn9boC4Kf1pWZVzokY2kxTTqE6FBfHlSuoYO0Lg63q4YniDKhAe8K71K
 3gbnH/bxR1O5Z8OGcBTTzLHFLmbX6vR+zlW8WA3x3W5BOoPimLPqSNA58odwNC6ttl1jQM9qFdc
 cmlXU7do70hYcmSlWZOZw20Q8sPDLCtB0aNdweicU3u3yZ251YGg4T8cDbuzqEgoXqZBOBTIcZA
 rK8YsY9G24xcOKbTCk+9+cFFuL8tbE7RYH0wFeN8sVz9Gdk0HvIR8BdQzYqstElrUGYNSDzgALW
 mnc9dLC55W62VhZS7LE6RkbgZlo/bpnQQ/DIiJYQCaSQM+mIAbrrQZ1Qan3GNo11FVl7PVIdZOx
 cmikZoEA1wV7jbfNXB5iUPuNxZI3ijYJe69hV0GjdUCtBHZYXIBxmm/bMhT5FGA7o86xY6B4jP0
 98qm04tPUmT5nGQLery+x+PPVyjvFqQuwKkDg8m9JoPAy1rPhTggSW45Ymtr6JHadxSumNfBEcM
 dkzb+N+vlnOKt0A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Ytia1IYX c=1 sm=1 tr=0 ts=6ab12a0e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dx2SfONCXZg6tt9xEGkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: cIziN4FLb0TrTG_wVZAqoyfyCTioFj8l
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE4NyBTYWx0ZWRfX64Gr+sZCLBWj
 +xrXhUanjuo5FyuJFLebwmToDDrWyYWz7qOFkw2hcISE77vtlLKDUIBYSGxf99G0FokSvgDAZUQ
 Z1W9wo2/j+k9N9xb2MGcdDqvrm2atcY=
X-Proofpoint-GUID: cIziN4FLb0TrTG_wVZAqoyfyCTioFj8l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE4NyBTYWx0ZWRfX7eowOr9S2Nj3
 iF4mlQEegSufV9FDOx2RqONS6ft/VJHIYg3efuONGAIW7E1tDw/r2dvFTJsLiqq1tujeOCpICu6
 fc5ASThegSk85HFq3rJK70xVxEuZdOabIUNmvcxfkpYGm4bCK3rOpo+ks8p97KjSllkkEWzV2+A
 8EaVGw8g6X+oieCm02xUAG0cDM+pV9impbloZd1EejaE/EjK9aRIt9fS9lKAvPU/HnyO1qe0hkU
 I4cwoSr0If0yBLEdKdD4Thr1wAHOGu08cV9fv17uQB1CSfPE6HJkOQsPwjliXW0QMxR/wMYQvbt
 OUeTij2wNaHNOVuNaO51ixtON5gbCp9ND70r5ejl0pwL8mdOuxHaeaN15xI3qXpJefdNbs902xv
 rRA8zbuxjeY+mupEfU2B7XjzzYGEK9RWm6H0IoC53mrkl/7CU+cUyWBJEFf/N/cQBHCYcn8Anjj
 fiEUEr41QFJUdjtFBhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210187

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
index 2324aeb4d4d90f30f999108be00a0d98e4f67b43..dad2478bae0e2aa70d31c5f3c7b37003e9e15e2b 100644
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

