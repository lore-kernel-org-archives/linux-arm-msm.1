Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803242;
	b=0yLlPNDHPvshgvSEexfvCzPeWFdYvcBKcNLVy3xUPAhglecs0BnYRkyX5JCFe/jTdEWr
	 S2XX8AUHIIu/03I1eGQze4SdSmZ0pTDE+fYFXsN0FnvXX2W3MV0//I+NmUzNjnpEoFiUB
	 6EkEFP4bNWsD0d2RiWo7stYnxfuw6PKvIhTpVmFjQma2g/UiUmKNxx35QQf9ES0XOyJC/
	 EUeBJbDElQNlhrT8J7NoXTjgvWEcuZQKh6fkwUm0ilgm3kuky1RshYWoBvCAL9sG3SxRq
	 Ff+Q8r+rhXSwJrmb2h7Gph+7WSddYyNPjm1EyCDExmMJAR0/3bAh3sSX7PRVosdVhlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803242;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YUThmGPJuRTY+/MkH9mkmVSk815/jCpzFpL5hSBqw4c=;
	b=UCSlrylu5q8zMLrKqMcMVqwVhGJTSr1HGOKeT04ZTKNBVGDItmtMw/A/I532xb/nDXGK
	 0rzRV9WpF2oUZy1y13Tyq09a7wsS6mVoRysv+y2Jh/pkxvf7c548EdOuAqyR1Rq+BKjD8
	 C3t66HOiugSxRsvbl6xuu7v/8uX8IdowuqCtTdWs4vBi6zDk5JynFzYFDiWb5AqF09S1Q
	 myTQp4ifds06BkQrtnzwSHsJ7zRnTVEK0ZtbNJMzlxVQ8cMCqM+DhxcC3oF+RkhZJGvHQ
	 kEGZSb/7a/UtgpcpElsX+y+p+jb62tTuTbNglE2GPQGHsZXiqcOKXjOSv3aTWxAEYvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mOGrOIDX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aeElI9jo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF8C606A329
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 14:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CF8C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mOGrOIDX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aeElI9jo
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Ba5Bx2310421
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 14:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YUThmGPJuRTY+/MkH9mkmV
	Sk815/jCpzFpL5hSBqw4c=; b=mOGrOIDXbtFnOB86NQYAgCbaTeI4aalIaOy5bV
	0e25t/v0ZZnubehxFyZz6kuW3u/45zn1JOqJF4OYjpE5y3o+hwSd9swEmBtEzb4x
	ELu9KGYib7JdxaZxCF+S0+uGH3qw3v3gH0IDwlPKKf6O1XQU8BxtgR2t6hsMVyxW
	b6Ou2yYWRNzmdlLHieANXPKqQ+Yy7rl/BcYN9YPHMNYAAzt9jXLrzcVwhdreX40c
	AvpzDl70CJ1gxUsD2Y3poYh/UmigA31x3DmVtKelUAzKzBfbTNIxV8H3C5/sl0Dv
	gPMeaEsRRP2G19M/I9Ee/fAqOR+STHjQi6oanKXzfpWcWeSA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8mvaet-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 14:40:40 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-990634bef80so79633241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 06:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793803240; x=1794408040; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YUThmGPJuRTY+/MkH9mkmVSk815/jCpzFpL5hSBqw4c=;
        b=aeElI9jomig4Uv/VzUxsBNlZim0N9kZWBUckTrSTLtisH0hcH1U3sSOO/fliGc3h2A
         2pi5Ctlz8O+kWxmVgLm4KggiuUTUZBHu2YOZOKDelUeBlgDagDfqKuccSr+OhjkP3AjG
         VWzcGRcl1li+G089QsOuOGrYHTLPJWYlt6akMAbg2inY0tStbDaK8un7LOtlQ5i/UeWS
         efUYoRmLjRI7Qewz8DMN3h4AgkoUmZIdJ0SqYgtBryFngDnMGPPbPL90sKuYaPHy6EoE
         0tVGrJ31iESn8CdsXnUC6rpCfuoDCSiPSni+3c5NClwrJ/Z4daDkdJgShzf5FYqpJFH5
         svIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793803240; x=1794408040;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YUThmGPJuRTY+/MkH9mkmVSk815/jCpzFpL5hSBqw4c=;
        b=1r+/DRSMLbgO/5XDjQP/X0tEB5DYxNOIMGGsfvrztvWvFX8A5d8WRlV0yV0+1Z1iXh
         Hl9xr/O0UuTkEfHFxPw6CsxCmK1s7lFuqWDtTTevDcdSwxbmRcTOhTy4jAYlyY6mmxej
         Wbg2wbrrYsCtLHnam9th4GOKst+vN6L31Oj3BUWV6ZNKuQ93gKLhzT0n2q+Jb523HGje
         4SjpJ0MUpFC9g1rC5kUhwSkR3ebB7FmYJF5P9HvV3Es5Yczex6sRdnN5MBwi2DpLSciA
         kjXq9HlMLv2vXckOsooTUm55cYuW7ibOWCCry0bf6um/chGM1zHHvkldx4/2xc6v1Xbg
         TVHQ==
X-Gm-Message-State: APuU4Z9SFGTXl1IkODm1cetfXJuyX6MP2371U/z2THgfCo8+ut09o1O+
	zl24IaoWhBT7sO7JzmbFVk+g0BWDvy79/phY6IRJTQvirX43Qsl81OEVcYo/sNUMFvW/B5/rcKM
	nagdKRr9/Dc2u5PzYbnyXflgSAZWcqACI/u3gHfs27qlu8QwbuLj6vojUhghJP1O6f4YCtueueR
	fh
X-Gm-Gg: AYBFou3XulRSn3JT2dhlujX19txeFXU5XPjvhFJ66RUZR3/Js3Pmb2yToUfRxSDi7oJ
	DSNRDAmbD6cqK2narSWbPHIUeJH8QK9PYS1cZuPFqEtOzKBV2ZmWp+5LuqxQH0pnzJQMu+2IAGM
	QSmKeyuNFFt1sirdKhXMgy1R5ECWck87nnd/n5dfayLWo6xqrsDjpLsG/Q4gevICpJpoC6AY0Ol
	14o8DtdwyWtnrH2vzv/02F/vGEZJW1NGVnu29uQXi5nLqqlv0LLlC8oPDrQi0PJPh0KWvA8GayJ
	c+CS57viO7G+DOR9jnTPZoGYXF1jY9kAhTZ69Jblzfk7TRRuBPmOxiGzi1bUSI6oodJ1N6neRP2
	4pk4PUWqdbgJaZNHMD3fl86RNNQfxljb7iMRAQhqq0C68vCKlOHvs+Bb8FUYtOf0fUYKY2Q==
X-Received: by 2002:a67:e9cf:0:b0:7d2:7266:2c71 with SMTP id ada2fe7eead31-7d2726664ebmr541523137.0.1793803240086;
        Wed, 04 Nov 2026 06:40:40 -0800 (PST)
X-Received: by 2002:a67:e9cf:0:b0:7d2:7266:2c71 with SMTP id ada2fe7eead31-7d2726664ebmr541510137.0.1793803239544;
        Wed, 04 Nov 2026 06:40:39 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea181085sm4381946f8f.1.2026.11.04.06.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:40:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 15:40:26 +0100
Subject: [PATCH v3] ARM: defconfig: qcom: Drop Qualcomm SoC drivers with
 defaults
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
Message-Id: <20261104-qcom-soc-kconfig-v3-1-6bd233ccd1ba@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33N0Q6CIBQG4FdxXIcDJI2ueo/WBeBRqZQEZTXnu
 wd20U3r5mz/9p/vX5AHZ8CjY7YgB8F4Y4cYil2GdCeHFrCpY0aMsJJwJvCobY+91fim7dCYFlM
 lVEFrUREmUXx7OGjMcyPPl0/2s7qCnpKTGp3xk3WvbTPQ1PvDB4oJLoWSe05U0YA4We/zcZb32
 OzzeFBaCezrVJT+cFh0uBSkAlJydqA/nHVd3xDCDUgRAQAA
X-Change-ID: 20260429-qcom-soc-kconfig-1b9b31d9702a
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3289;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=p8GWd+LZo6xbYp9ZyzCcCx0yLw7NoaI+cPAfAFUemgo=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGrrQ9zIKyKsIVfJ7bndpRgMBWu7uZcvhYtzMTI3bDb+GHXdm
 4kCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJq60PcAAoJEME3ZuaGi4PXI6YP/2JC
 DDNNrk/Q5ZOAwaG4T9Amdayf/NjGT8Vz1lzXJDuO+Uc98RSDlztt/ITPc3Cce7WoCrCwyjjzGHj
 TzKqMRR+a00PSNk1QUxPtCaFVPW0e3HVY2W0ZwB9sf6X14/zVo4bLZhEdSf3w41ENItCyczRFyz
 DL7Ge2WFbHcLeMZCC15T1bJ248fEZzB5fqYseJK716FIJAeFZ5XyOwkn3vfxd3oqswd5YiSMzh9
 IKa2o1bo0SN0U1+L/kSFuuMDzh9RFFa0DP7ZQfWDYbza7ppyBUN2y+2DElc35kVzNfOjVQSRx3P
 UZl56XDpec1zwxHSzIjIw+OQcthmClz8f9avig49JAE92ChXRYwB1QdOXUlSq3xXZEnRRz8+FCc
 ENz6qniC2ry9WDOFBM7aqIv7noxMcITZvvRdFJXvAJlZ6pDQ/BvoYS9UASdLDUoQV2sObrzcsrJ
 E0Xz7BK1JIleMYDaW+IC1m/xDIC2XHdPuKf6N1qwwVcRAFXlywRpDQIjFTFfyiC4/ImdABBwiBF
 ZY2JtJZfTGovx0XUHbjuRlFogavZbSRn9abwpbL44KI34yAK3Z4JtiWL+gsyWwVmnje/A/1O50e
 fAHv2mRF1yPt3m2aGVTgiMptO0vG/+9gZEQSfY7hZ//VdV9UOmBRtwTBBN3ZzqiHSfIrPQx56ZM
 Q+1hZ
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: d2Y40L2EWTlf96GP-Bg96i_cCzlguUrE
X-Proofpoint-ORIG-GUID: d2Y40L2EWTlf96GP-Bg96i_cCzlguUrE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1OCBTYWx0ZWRfX/T9uM8W8kcdP
 vSH8hD8vg09D7A5jT7wzkzoJ3/hcrQCcJnh8AYo2L7pkNK0KZIu8+RfnFGi9H4Wg5zrwnxDmu89
 1p88e25yPDQ2lu6DHXX2yXgFFO4IwcrUtpRvaH52uztXuCXoT4ZsjQjMsRUC36y1bbQfwsiju1F
 L4QXQTEZr6RcEJjjmGj6uL+AqUGizAHA87VxQ4xrxbAd1bViUvDa/MvjAWUkKDi6Qkwjqn/ZRBG
 fi6ZvGy010497evf7PeS9+zEhkWbTaZ7hcGTU2INlF0lyu1Rm+0qlRLXp9lVd0SI2mX1djvQJqK
 wBZTU/NhEWj57l/YwLwD1Hbuh2Q2I5TQOWcEC81c1hj8ic4QxyvVlAqQcC2gU35qeRYFjncBfz0
 nrcKhLnl5U7gnHgW55YPcsOCfvgX1eAyaQG43LAR/BVnovmyq3ay6jBpWDUsyPU3g+wJTtrmxXG
 PRiCSSNVo8YwxWAucbQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1OCBTYWx0ZWRfX1R8Sp6t6wiDQ
 FFPucRQk2s1smzjiuhl4k7JiiUNydWdfPI2WMYCFa7jU2e+CEx7Ymyd1rkSHnR89B4tpl8bFJ7K
 flREbxQosC52RarJ9AZ8OO++XVkFAaM=
X-Authority-Analysis: v=2.4 cv=HbWB3SE8 c=1 sm=1 tr=0 ts=6aeb43e8 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=P_Rs_jpJqzNIsTW6RbUA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040058

Several Qualcomm SoC drivers have defaults, so their defconfig entries
are redundant.  Keep the few options which choose specific choice
different than the default.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
No dependencies, this can be applied as is.

Changes in v3:
- None, just rebased/resend and dropped all other patches which got
  merged

Changes in v2:
- Implement review - changes in individual patch changelogs
- Add tags
- New patch: soc: qcom: Avoid SCM and SPM for cpuidle drivers

Make important drivers default, so people will not have to choose
obvious things and few other re-organizations.

This matches my other work for Qualcomm drivers (clock, interconnect,
pinctrl).

Best regards,
Krzysztof
---
 arch/arm/configs/multi_v7_defconfig | 11 -----------
 arch/arm/configs/qcom_defconfig     |  7 -------
 arch/arm64/configs/defconfig        | 18 ------------------
 3 files changed, 36 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 069d5a49f01c..92cb615b76c1 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1133,17 +1133,6 @@ CONFIG_ASPEED_LPC_CTRL=m
 CONFIG_ASPEED_LPC_SNOOP=m
 CONFIG_ASPEED_P2A_CTRL=m
 CONFIG_QCOM_COMMAND_DB=m
-CONFIG_QCOM_GSBI=y
-CONFIG_QCOM_OCMEM=m
-CONFIG_QCOM_RMTFS_MEM=m
-CONFIG_QCOM_RPMH=m
-CONFIG_QCOM_SMEM=y
-CONFIG_QCOM_SMD_RPM=y
-CONFIG_QCOM_SMP2P=y
-CONFIG_QCOM_SMSM=y
-CONFIG_QCOM_SOCINFO=m
-CONFIG_QCOM_STATS=m
-CONFIG_QCOM_WCNSS_CTRL=m
 CONFIG_ROCKCHIP_IODOMAIN=y
 CONFIG_SOC_TI=y
 CONFIG_KEYSTONE_NAVIGATOR_QMSS=y
diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index cc93a32342af..8dec2a56f169 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -221,16 +221,9 @@ CONFIG_RPMSG_CHAR=y
 CONFIG_RPMSG_CTRL=y
 CONFIG_RPMSG_QCOM_GLINK_SMEM=y
 CONFIG_RPMSG_QCOM_SMD=y
-CONFIG_QCOM_COMMAND_DB=y
-CONFIG_QCOM_GSBI=y
 CONFIG_QCOM_OCMEM=y
 CONFIG_QCOM_PM=y
 CONFIG_QCOM_RMTFS_MEM=y
-CONFIG_QCOM_RPMH=y
-CONFIG_QCOM_SMEM=y
-CONFIG_QCOM_SMD_RPM=y
-CONFIG_QCOM_SMP2P=y
-CONFIG_QCOM_SMSM=y
 CONFIG_QCOM_SOCINFO=y
 CONFIG_QCOM_STATS=y
 CONFIG_QCOM_WCNSS_CTRL=y
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21..37075de6c727 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1546,25 +1546,7 @@ CONFIG_MTK_CMDQ=m
 CONFIG_MTK_DEVAPC=m
 CONFIG_MTK_PMIC_WRAP=y
 CONFIG_MTK_SVS=m
-CONFIG_QCOM_AOSS_QMP=y
-CONFIG_QCOM_COMMAND_DB=y
-CONFIG_QCOM_GENI_SE=y
-CONFIG_QCOM_LLCC=m
-CONFIG_QCOM_OCMEM=m
-CONFIG_QCOM_PMIC_GLINK=m
-CONFIG_QCOM_RMTFS_MEM=m
-CONFIG_QCOM_RPMH=y
-CONFIG_QCOM_SMEM=y
-CONFIG_QCOM_SMD_RPM=y
-CONFIG_QCOM_SMP2P=y
-CONFIG_QCOM_SMSM=y
-CONFIG_QCOM_SOCINFO=m
 CONFIG_QCOM_SPM=m
-CONFIG_QCOM_STATS=m
-CONFIG_QCOM_WCNSS_CTRL=m
-CONFIG_QCOM_APR=m
-CONFIG_QCOM_ICC_BWMON=m
-CONFIG_QCOM_PBS=m
 CONFIG_ROCKCHIP_IODOMAIN=y
 CONFIG_TI_PRUSS=m
 CONFIG_OWL_PM_DOMAINS=y

---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
change-id: 20260429-qcom-soc-kconfig-1b9b31d9702a

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

