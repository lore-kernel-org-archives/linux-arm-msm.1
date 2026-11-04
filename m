Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803588;
	b=Mm1Yoi0Snu/1YrXmDe9p0sOG9lHUxFc5oc6wfkUI+svSrHhwN0krMYQiNI3naS1oC7+y
	 tRFYxuKf0ww/FovlQa0gE7a0qpaWIOvZXBx6hGwoJEmlVGhwczcLt9mSyylZQqrVN/0Xo
	 RRbBUpxuVksmn4zDo9h5YQ8KH6dQ4h+EbnzHMcT15X7Pn4bRhD3jGmFmoaCEhf7WIjiAv
	 bvq/MocfNzE2Mom322wQqDYxj1k8q9uOhHIe+nhJwF94GxBC3iJ9pgm/BVlXCsCEblKOL
	 bw8y+Uz38r8SF2tT8bBOxqtm/umcPaR7ZBN4Vg3/s8I5sCZqagbUXFm81Xo1VMkE/Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803588;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/4QbgBs/c0TTeo2pDtbxLuBrO703ms5M2m6y5vvr+PA=;
	b=Fd+9xreN4pDKLYJKekwbn5aNwKlx3y762tMUO7+8dqnZL0DapzJas68uHzpcKVlgUNbV
	 zlYO5LOLV7cI5PwJ3kTv27mdLobywSsQI841SnHWqBMVUEGZw5oX2UHg0jvYxYzSY5/j/
	 +GAUUT1R7LvjbQyYMd1dCc+u9O3FvKy6pXUFiVTJu3fNPP8Ooh8kI/VbWmwGrfPFIaSsj
	 g/OWHEEiZ0S/QizNvr97KJ9oaou9wSop1Vb4UN/a+OA0uO+Fe/mQx0jm1CS/LRPRnO763
	 W8vdtpTbrLB4eS40ZDaB+CMneGfQq9boUX4TxVxDCHlLnxWiUJiw9R/LqxhIQBz+P6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AMv+GR0T;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="T5j/2bzp";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24C6606A31B
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 14:46:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F24C6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AMv+GR0T;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T5j/2bzp
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BaOnX2310758
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 14:46:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/4QbgBs/c0TTeo2pDtbxLu
	BrO703ms5M2m6y5vvr+PA=; b=AMv+GR0TnUb97oyiyqdIN8lpHnOOw+83b5pJAc
	JoZqPs0Dq/QzjQoUiePj5mX0bX3rgS9/jUNWswXv/v6kQuyFYlQvZlAMKlOBlBVR
	p8flCZcQxo5xLrTccC1fQfrksG+cBPYLp0shgHcfQO26rGJBbzv99OojsGpCzwdV
	r+jv+zhmcpmiDh6Xxir7Gbu8WkAXWad3nP//L6YiVW2/SX9zBw32/my1XMvH389N
	W9VykiO0KlserBc9VTNF6gjrd/Ic4bdH2ScwzEzYT4Wdkl1571yd28DWiuhg1QxK
	Xhanbvt+UfPyaQeb4BQ08i3+WwDT+wKBocuaGrOQdVB+yJsw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8mvb4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 14:46:26 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ead18311ebso174436e0c.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 06:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793803586; x=1794408386; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/4QbgBs/c0TTeo2pDtbxLuBrO703ms5M2m6y5vvr+PA=;
        b=T5j/2bzpQH02t8oyr0N2rag8ImX3lxMxdIwIbhZ4isPp/CSvLCSmf1+vx5pRq5phI7
         kTQkEmxYLH8nCNn3rX1PDVE9ycPHWrvEyxV8cjyRXXdXpRC4pNilFGOfVz1mu+08It3O
         UHBg1M3FS8uhDwML1Bp9JiBBItMS/aaLyQ8PjVNskFAwKIFZ93DsC9RLmGi3H3Mr5xuk
         8gF/llNW10KyYChVPVtvDal31+ZWo02TKPRBgwS4EtE4STChvJENtN88prWUOFWxQm2f
         K22jhFYyq5w5uTutFOg+2f5u4dtxcEtkvvsAdvw0Gh7e1KtN3aZj1sd+Nrvw07buY/hv
         rAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793803586; x=1794408386;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/4QbgBs/c0TTeo2pDtbxLuBrO703ms5M2m6y5vvr+PA=;
        b=d6/Zzi4QZ3rzFFFeoiAqHJq7Dg36/2mb4DhOPdaEPVLNGUKr3JZe/ZRyqRtgQ10DHF
         J7Grfff9PyZIo8o1JyFHbQJJNXFXhpkSfFxtnAyUSi7UgCbqsb7Bgg45TF2Eu0HL12V6
         Gka9DtwbgY886FlAkFmBALqGwPXkMLeiMPT02SmZoRaUtz6yHD+xqCrXU/SlIhs2Sgj7
         oNebAwynmPE27gPxVG49qjo5qZ1W0LuP4uRG/5SCkE7B2YH5h/E1AZR1B3ERGz+4uEUN
         Sl8H25AS0uNKp4ok5qcxv9DO1Idw/heJC31zWH4N3B6nQGVa9jEv1jmxY2MsoYgAm/2T
         SEMg==
X-Gm-Message-State: APuU4Z918FpW9jdtKk66UftDejSu44rsuvW+R1S+Ox2pNyMLpzqhRIa7
	peRhplA68FFBPQgD0Ocr2KJCUo5BRM8krhK2VNQMXBOrDYwBShsgfyTY0LFgqb721c/2p6h13CO
	vKNwNv/YmTumctG/c1pcOwx8xR5SCn7xVtYw4mcXzalJFLK/XstIIR4DG8mnoC/ksG7Vj
X-Gm-Gg: AYBFou20qcXWDgZczEqj1HJ8bsjnNl/UVD6G16uAQPHGQDH6PgGYtdBKP4J8JM9CQ7T
	E3paijZhvFFL8fr3sGRlxUKLPlSJZQvF1GBqob8sNSl3lD5GSfE/HT2xVfc0QY4AYyx/+OJJt1H
	lHMM10daeKjkJNChiCfetH6YZoWVA2jfzPp5DiyWqOwuuhsy/pygSUn0I9zNmNBFW3qXFyEcG0e
	7JBS0ZIesU1grc1Nq0FE9Bp1llKJA6U6KrVqBxVH51+kQKFssb/t/8r0i0kgxOP0FAEmmWwxKpv
	4cS6QTgUUmwkLGXSWTPDj7fPe9ZpiCNPswCab0DCdOQzdatsUgMavYBo2poRUsns4HzPz4fX0fm
	NIjkpMGno0Y6QulnWFNLy20Dipp8nV0QL1bhjU+uJAHf9zz4ENozE6HFN7VXW06PEQs6ecw==
X-Received: by 2002:a05:6122:1b82:b0:5ea:c084:6f19 with SMTP id 71dfb90a1353d-5ec688253ddmr6391688e0c.12.1793803586125;
        Wed, 04 Nov 2026 06:46:26 -0800 (PST)
X-Received: by 2002:a05:6122:1b82:b0:5ea:c084:6f19 with SMTP id 71dfb90a1353d-5ec688253ddmr6391628e0c.12.1793803585526;
        Wed, 04 Nov 2026 06:46:25 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed553116sm4194906f8f.42.2026.11.04.06.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:46:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 15:46:20 +0100
Subject: [PATCH v5] ARM/arm64: defconfig: Drop redundant Qualcomm
 interconnect entries
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
Message-Id: <20261104-interconnect-qcom-clean-arm64-v5-1-395baa0c0bdd@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43Oy27DIBAF0F+JWJcIhodNV/2PKgsek4YqhgYcK
 1Xkfy9OF940cjcjXenOmbmTiiViJa+7Oyk4xRpzakG97Ig/2fSBNIaWCTDQTEJPYxqx+JwS+pF
 efB6oP6NN1JZBS2rRB2s5KsEdacZXwWO8Pfz3w2+uV/fZdhd0aZxiHXP5fjww8aX331sTp4yid
 l4cu15AcG+51v3las+tOezbIMvJCVZUcbWFQkNtQHS+E8ro8AQVK9oB20JFQ40E7BE7dME+QeW
 KGi63UNlQ5cAz1NaA+Qud5/kH5pZp+eIBAAA=
X-Change-ID: 20260428-interconnect-qcom-clean-arm64-aecdaa1e531b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3712;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tgc5oYY7RgZCSYGAvdoJW0IQ9Q4bRrF4qkJ4QRoOlSI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq60U/VlCr4Vvfz0y+8WKIa98Rh6Qke5D4vneXc
 Pz9yUs+fB2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCautFPwAKCRDBN2bmhouD
 12VAD/0WF+pAz2t1TjvxbHvL5Z3A1503H7KbTgiDdEv30JFilHv5EuLhvlgliIPNEVqWU3m2vlj
 V+4TGlX91TnE+1Wdc8txA0Vs5BEobr+dit0eQSFqWxOP1aGhQ2HO8est8MQ7C7QlLROKj5wtlo1
 x+AVukxjgXCyBrbhcUUbnb07UH7gzvp+TBygn1furpcwnfIx27CK2y/tN7mXVV91Na3vnvoBLlA
 IeVFHTyU9sGexShtVv3GM1T3WQuY/i4wWqQ1u2uiXPTLfYnJR+bXd7jXZotaXa4q/ALRdM0jCGL
 K5qo59/xsweGBOzu96+4xGd6oJ8TGPlmgk/BYxBZKqm2L8gX9Qp7kOw2GbL07/FSrtEb2pJdQY9
 abILLcE+nn6fJdDEFBdKMBxaOvSBhsEcVMLmjpknj92FJHBo3mM4prOg6kvWKmEId+d+pRpeCDD
 FLeUt2nVFHjwrE8zei2cCwLEwCODHrzyyJyZlA0AdXIgfpF2W9yPb8xliOE8Onva/gem00KJQGs
 jnXvX4o5KQmPwbxLsKfKU4RxHn6HFfkhPxo6u0B3w6VtHNdfEFnHothw4RanGxbDXFN7kqZg2Ck
 FOKfKLGVLOweMJO0QgTIAfmobApZuoAMrcDpHrJ1Rpu20ekxAawQyYoEmcRxNalGrEwYuDBkhBZ
 Lcf7loGAH8cxhjA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: UZLvSgHLzM9y_AVTLvcHLANE0m4_TGOe
X-Proofpoint-ORIG-GUID: UZLvSgHLzM9y_AVTLvcHLANE0m4_TGOe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1OCBTYWx0ZWRfX86NpSjUyMyRV
 afwmF1BQ++EDwsdADOK1vcst+ru9JM+aV8vjGqURS8CnfPbRqgXJ03apC1sB+vTyAv6S6aGudP9
 EvOeHOsM0bP6FHPnhKCLi1jPdTIXzEN7oVg78vDzuQ38ZSIQWVbSyAGT8PCSlsZmripoRDRXLas
 i1QsHB5VMLp8IhpJJL6RtQD5mdgi+BAcC17jA55IGgkn/9uJmfv7HE8l40HXwY1iydw4Qe7hsfu
 ADjAtctYcAiBS/cGt6jYgx1bcjnJwi+X2+QJ9tkDwhbe+1kqNrXfErZyzJzxOOvlibR3u6EYaBN
 W+0khjz0+lKDWK+gkXhFAc0K97a32sty1din0TTJgJpxDoeq0X3DnTQzRW26PoWvOmjOvAd+Bby
 UT9dy05At1LnNpYYacXJvf6pQUOfb7/PDyNQYLoOVgG+pCyH686NqBioKV4od/dyZ5rdpWzKkan
 mlqMBKoUsZDZfEeLcBQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1OCBTYWx0ZWRfX1y4MiYgaJs0f
 VBJ/YXKPoG+41Q6CKMugA+nYKiF3UZXMXpraY0yLf/HlbXJcIlTwgjPohxXCt2COUF9/sEsx9QB
 QO6RaOy4ETYrci9LVUSGEVUh9TnK4hQ=
X-Authority-Analysis: v=2.4 cv=HbWB3SE8 c=1 sm=1 tr=0 ts=6aeb4543 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=b2TuYX_1WW3iVv7oIL4A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040058

Drop all drivers from defconfig which have defaults in Kconfig.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
This can be applied, all other patches were picked up.

Changes in v5:
- Drop all interconnect patches which were applied
- Link to v4: https://patch.msgid.link/20260914-interconnect-qcom-clean-arm64-v4-0-5b2c0e6a929a@oss.qualcomm.com

Changes in v4:
- Add also Shikra since this was waiting so long that other drivers got
  merged in between!
- Split out defconfig update.
- Link to v3: https://patch.msgid.link/20260720-interconnect-qcom-clean-arm64-v3-0-942e8ee7ebda@oss.qualcomm.com

Changes in v3:
- Update also Nord and Hawi
- Split defconfig to separate patch #3.
- Add new patch #2 for arm64 dependency for Hawi, Nord, Shikra and Maili.
- Link to v2: https://patch.msgid.link/20260515-interconnect-qcom-clean-arm64-v2-0-adeebc73596d@oss.qualcomm.com

Changes in v2:
- Patch #3: Switch to built-in for everything, with explanation in
  commit msg.
- Tags
- Link to v1: https://patch.msgid.link/20260428-interconnect-qcom-clean-arm64-v1-0-e6bc3f7832db@oss.qualcomm.com

Similarly to clocks and pinctrl, interconnects should not be a user
visible choice.

Best regards,
Krzysztof
---
 arch/arm/configs/qcom_defconfig |  3 ---
 arch/arm64/configs/defconfig    | 31 -------------------------------
 2 files changed, 34 deletions(-)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index cc93a32342af..8e3278ec2d21 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -258,9 +258,6 @@ CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=y
 CONFIG_PHY_QCOM_USB_HSIC=y
 CONFIG_NVMEM_QCOM_QFPROM=y
 CONFIG_INTERCONNECT=y
-CONFIG_INTERCONNECT_QCOM=y
-CONFIG_INTERCONNECT_QCOM_MSM8974=m
-CONFIG_INTERCONNECT_QCOM_SDX55=m
 CONFIG_EXT2_FS=y
 CONFIG_EXT2_FS_XATTR=y
 CONFIG_EXT4_FS=y
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21..df780e5ca99e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1764,37 +1764,6 @@ CONFIG_INTERCONNECT_IMX8MM=m
 CONFIG_INTERCONNECT_IMX8MN=m
 CONFIG_INTERCONNECT_IMX8MQ=m
 CONFIG_INTERCONNECT_IMX8MP=y
-CONFIG_INTERCONNECT_QCOM=y
-CONFIG_INTERCONNECT_QCOM_ELIZA=y
-CONFIG_INTERCONNECT_QCOM_GLYMUR=y
-CONFIG_INTERCONNECT_QCOM_KAANAPALI=y
-CONFIG_INTERCONNECT_QCOM_MSM8916=m
-CONFIG_INTERCONNECT_QCOM_MSM8953=y
-CONFIG_INTERCONNECT_QCOM_MSM8996=y
-CONFIG_INTERCONNECT_QCOM_OSM_L3=m
-CONFIG_INTERCONNECT_QCOM_QCM2290=y
-CONFIG_INTERCONNECT_QCOM_QCS404=m
-CONFIG_INTERCONNECT_QCOM_QCS615=y
-CONFIG_INTERCONNECT_QCOM_QCS8300=y
-CONFIG_INTERCONNECT_QCOM_QDU1000=y
-CONFIG_INTERCONNECT_QCOM_SA8775P=y
-CONFIG_INTERCONNECT_QCOM_SC7180=y
-CONFIG_INTERCONNECT_QCOM_SC7280=y
-CONFIG_INTERCONNECT_QCOM_SC8180X=y
-CONFIG_INTERCONNECT_QCOM_SC8280XP=y
-CONFIG_INTERCONNECT_QCOM_SDM845=y
-CONFIG_INTERCONNECT_QCOM_SDX75=y
-CONFIG_INTERCONNECT_QCOM_SM6115=y
-CONFIG_INTERCONNECT_QCOM_SM6350=y
-CONFIG_INTERCONNECT_QCOM_MILOS=y
-CONFIG_INTERCONNECT_QCOM_SM8150=y
-CONFIG_INTERCONNECT_QCOM_SM8250=y
-CONFIG_INTERCONNECT_QCOM_SM8350=y
-CONFIG_INTERCONNECT_QCOM_SM8450=y
-CONFIG_INTERCONNECT_QCOM_SM8550=y
-CONFIG_INTERCONNECT_QCOM_SM8650=y
-CONFIG_INTERCONNECT_QCOM_SM8750=y
-CONFIG_INTERCONNECT_QCOM_X1E80100=y
 CONFIG_COUNTER=m
 CONFIG_RZ_MTU3_CNT=m
 CONFIG_STM32_TIMER_CNT=m

---
base-commit: b0c953dba88a3412a700058817f08e7b5de4c338
change-id: 20260428-interconnect-qcom-clean-arm64-aecdaa1e531b

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

