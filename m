Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795756676;
	b=R4idARiUswU2aZbTLOoBRom/1eD0nNnWMgiv+MEwY7sUj6ANkig+ZC75y65gH8jtCevv
	 j2aeDmneDHHPl2oRf72XAVU0rZMz63bHPmPuBj6fABd/SVTBL2f9pNGS3f/Ba+EH5HQUG
	 HKGwSEps7hLaCr249l53/1d7WI4xA4bgzMwp3JhdLovaBLkIjpt79/AgFICM2FDnlAUJ+
	 iCuTrGPiNLlWq+GowiijR6sDrhoUcF3Njs6UrklqZLOSxQw99YYMx6AARBe3II8Pv1UcK
	 0t1tCf0iVhKSyp1C7VKuGKKuqmxpkwidzMREHVZMBpt0OfHAz2z62/MW+ByAyK3V8Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795756676;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yIWmRd44pxSJZoqqDDYPZZjasoO/WlBoNz/mYuxAQJk=;
	b=gT98PR++olq19wJWcqcTZdXcl0Cg46T1uwGpWD84xc09leOTyVOWWonwz5mrhEFDPCAt
	 nwbAr6WB9eP8YSm+v7fHp3tkkgugalhqCMNfut8wi9KWUj5349TGQ+0LZKixmMf7oajrx
	 XLXxpj2iw96aMP6bDM83s+YGCEgM1Dazb6StwB8VR+JzT64UFQAZXCmCNavTDV7oDT1sa
	 q/XNagwJuMVAZIvHL3UZNAlmhbUT4qE/T9MHeRGci3iWsI9oIM2sq41My3oEVoKRi8Nzx
	 VZQs84XbtJvdMcB7IxJgVuQvZ8X2w7UoL/BW8sm8n1NpfVM64a8DqVqVgQQgRzk/tiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hYCSNqaR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HCpbwcHT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B564F606A321
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 05:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B564F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hYCSNqaR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HCpbwcHT
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR55Csf2830754
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 05:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yIWmRd44pxSJZoqqDDYPZZ
	jasoO/WlBoNz/mYuxAQJk=; b=hYCSNqaRnQmQ6oxWX9A4AYhbWnXBJfG39uBtL/
	kjd/w6e23Jrjsxv/TuBZ2K9NbZhXFU8lexrAm/1tTAZDzEoxjPt4AnZsk0wkys/Q
	Svcgl23yuRnujbn9DQk0W30a56x//p2AKlvoHSSq1LsE3Pqh5NCkXt1Ww1+gDOfU
	hTEKFCXJDgWSlEnpLj0zU9T4ZiMGBNcs7ENNABQkL/4jXTagLtaAXu50OYv9BCLY
	YVPz3dbFabcBtm3RZYSRVQdJa35NiIWIk96wYG2v2SXRWbaxL3e5c3sLTXBQ4Yub
	If9KlfGH2di8KH99qy3YL1iozgqU6mKMQ2/mbwIucgVp30Tw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73dh817u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 05:17:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9496ff065bcso1029974585a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 21:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795756674; x=1796361474; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yIWmRd44pxSJZoqqDDYPZZjasoO/WlBoNz/mYuxAQJk=;
        b=HCpbwcHTyvZzLfj5tSQprGUjUnXwojn5W62nvKdLN/thQ5KqksxE9MToQ6C83nBa4E
         CKj4+5hj2V6V5yQJ7gR4fdrXRRpP9SAxKr6+UMT5trhS83aHDYXy7ZoBfgX3ZmrkIuoY
         h0uZ6THZO39caOTM1t+QVx/7vwoixfwcmV1DV5S1Nyvft00PCE6/IT/p9afDjPM6oFLa
         uE7nO2U5kUmQOA2Pv1cecwHufoRJQ2+kOPoJROfa1qoceuuFllcfw9yPqioYaIzak1M5
         F6CeVSPCc9icJ1B1khz2Uhi4vEs/1VbL54AKQn1XrceghWAABJD9xWYjJUJRdxStoCuT
         xnDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795756674; x=1796361474;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yIWmRd44pxSJZoqqDDYPZZjasoO/WlBoNz/mYuxAQJk=;
        b=P0CpFE11+QZa+Cycz8FBlZlHs0P/wfiHGQ0NV6hqzqxyNqr5QX0lBAsoRFWBglVxTr
         hq2QVr0LU9sZAplyuppIKyVSrwRRVnQEO4ntC3iKhSyxpknbJMrJQpSV+z4W4hpL4ZAS
         vsYs3S6QEiX+j3u8GoZoshbm62c9jXdfL9tce7bmHDI6ESpRpA0L882UmWfAvXLSEytC
         6zx39iXeOah/a8APtRMeEbN578oy029ygDnczLRUNFEt65has+edk5c7TN7mNY3mMaIG
         ILNeL33f1zH7YHqNemCKvt72fklBACABuu6YhjYHvdjyZYU9O9L5CQuEOwdHgaXVWPJS
         e+qg==
X-Forwarded-Encrypted: i=1; AL+hErF4LoAjFe2rzfABOBmXygeE6DE8aTMVqxCpXqt2XKx4S8xbAGAQohC3sghf/tA/9uEjiqfOn5HhiKdPhNOn@vger.kernel.org
X-Gm-Message-State: APuU4Z+lCW+9NLXxhzW8Uupz80sUsjYPmMGu2iXIgdCiCavPydEDCDlU
	EJuD52k60+sAC0wPiaWvzsA3CeiLjo9QtqOohiFdr8oq5Zz6Y9SyQnlJGjSaTNcoEWjniVt8Lpd
	7S2vBnpRvlukfij1X/PfA/VLcv3B0pd9jtDFK4rgYpGyf7Za8hKsEm1LV9G8Ijmf0oa/+
X-Gm-Gg: AZFdTZcWAOstFxdZ6OV0NSlCxHnJbgbdPBA+SB9ouYdG8OqNLX2FnlZzWlFVpvtDBER
	U37pEyapjEvcmbBORri5R4n7Z9KeNAto2bSYXQCdRQeKMHSuXIX5gs/q1FclUuDOP15gDoZVKn1
	eTu1w7g3mfKzrzY9WYGY2LMsW8Puld1jFMMATpSjfThE5dHhhliw1U2loJa9iKZ1if1yro9XAhe
	h1ZJq1DsUFVUQ1VZzuRzJXtMT1uKt5HRdlzS85dc/6KGnOl5rBCrPHBvvkP+zzTaoccj7qWPLXz
	/T9fb/DcYgjKw3XhNqjQ3NZCjMYgZPhn+WpX0EJJ7BjiKtyB75AhiHUWqxc2gEfXHGnQ99aZ6dA
	5RQEl7IAX6GlpKjClWD3xxPHh9FCfKXtIig8jFPm1ErU6UFfh2rtuXQO3cN0xhfSQn9oNGakZPY
	yREHjBmTQ8Y9cbGwJ8estKC8e2NW8umW6EX8UgOoUXBA==
X-Received: by 2002:a05:620a:6f0a:b0:949:7710:37ef with SMTP id af79cd13be357-949baa0f7f0mr3738380785a.61.1795756673576;
        Thu, 26 Nov 2026 21:17:53 -0800 (PST)
X-Received: by 2002:a05:620a:6f0a:b0:949:7710:37ef with SMTP id af79cd13be357-949baa0f7f0mr3738377885a.61.1795756673077;
        Thu, 26 Nov 2026 21:17:53 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb349db3sm1725278485a.7.2026.11.26.21.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:17:52 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 13:17:42 +0800
Subject: [PATCH v7] media: qcom: camss: Add support for X1P42100 CAMSS
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
Message-Id: <20261127-purwa_camss-v7-1-b28b72e05214@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHUSCWsC/3XQ207DMAwG4FeZck2mOM2pu+I9EEJp4rJIdN2St
 YCmvjvuQJRK9CbS78hf7NxYwZywsMPuxjKOqaT+RME+7Fg4+tMr8hQpMymkEUrU/Dzkd/8SfFc
 KV1ZbZxtnERSjjnPGNn3ctafn75zxMhB6XYrHVK59/ry/OMJc/cFBrPARuOCIMbQm1tEhPval7
 C+Dfwt91+3pYDM3yoXQAGtCEiHpwvmmBmnCBqF+CRDCrQlFRBNagKaVwWixQei/xPqXRk2EdgG
 qGGxQUW4QZiFo1jVhZoKWsB595ar/iGmavgAB1hEizgEAAA==
X-Change-ID: 20260409-purwa_camss-475787b87e14
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795756669; l=10578;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=vBkc3xHpvUrB/gMXuUWSTEyJ8Yz4oFONkBXbxzQOidk=;
 b=9EFIHn342I6QAsdl2C4dsBiUKkyTeeFjpKv9jO79mg3H9JCZmfvZL0TCAZLyJR8MLK2EbX3vY
 Hm35FUD35iQAVfzW5vHYC6PcYqEcANixY7L/bLJ5TNreAIyzb5MD6s3
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAxOSBTYWx0ZWRfX1vcblVoXvMA+
 8exCnxLV0BQQzuWHi18GGnEWEjoZzTbm3BR4J7ROxE5haR8FSNQQO4ZDwXWBy9ca7Z52vDh+w4a
 /XhlN+7ttLJMhRwKShgRIRZCTAYio97aNFdQ79paDieqseuN63tG3s1eJA26slELb5emwN5ViBb
 5YbW7Yjx5RYKJ4qLX/Z+WP5EvQeFhA17Pi2FSlcrsylaw6MKQPNKnoBaFw0iJPf5n2oq0xWNJUl
 yGlktwB2w5MP1irC/K+yePi5tJ3yhgnLTeNlbRR3o0CV/jPLS1Pd5XO04pvWIusiBLK4R7HLRv4
 hDqK85E69agZ4w/WlMoIO7iAvHNE7WJl4TFCVZAyPj/HBO9QRPkhpEJqe7xF37iMJsQ5TIjwlBD
 db3AlkbuaubZPm/bPPqISMcOdjR0owqebgkKW4D2DvzC1PbSPKn7hIs781V79P/2z/bcGfky3dn
 Mzn7GZ4Y+SkmsZ+HYeA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAxOSBTYWx0ZWRfX5qkPn4jHDXY5
 RwoO4JGVaE9bQuNgHi8MwpPiECFfl074y3YXQn6zA2DLXjYArRscRUz9wV6Kv54FxGWlHePcpUR
 z8tepDlyt+hP7uSAlKspEmAEdMy5IPQ=
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6b091282 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8
 a=j7ZsQ5hsxSTuYjeljD0A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: KtetQMS0M2-xoMf42HiaG4U0TAoWswyg
X-Proofpoint-ORIG-GUID: KtetQMS0M2-xoMf42HiaG4U0TAoWswyg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270019

Add CAMSS support for the Qualcomm X1P42100 (Purwa) SoC.

The X1P42100 CAMSS is a cut-down variant of the X1E80100 (Hamoa)
CAMSS. Compared to X1E80100 it has:
- 2 x CSIPHY (CSIPHY0 and CSIPHY4) instead of 4
- 1 x IFE instead of 2
- only the ahb and hf_mnoc interconnect paths

The CSID, CSID Lite, IFE Lite and TPG blocks are the same as on
X1E80100, so reuse the existing CSID/VFE 680 ops and the X1E80100
TPG and CSID wrapper resources.

CSID1 and CSID2 have no corresponding IFE on X1P42100, so they cannot
drive any write master. Leave them out of the CSID resources, keeping
the 1:1 CSID to VFE mapping CSID0->IFE0, CSID_LITE0->IFE_LITE0 and
CSID_LITE1->IFE_LITE1.

The CSIPHYs are handled through the PHY API, so no CSIPHY
resources other than the lane format are needed.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
This patch adds camss support for purwa platform.

This series depends on:
https://lore.kernel.org/all/20261127-camss-routing-fixes-v2-0-b7152f0af49a@kernel.org/
---
Changes in v7:
- Remove the duplicate patches and rebase on Bryan's changes.
- Base on bryan/camss-next
- Link to v6: https://lore.kernel.org/r/20261126-purwa_camss-v6-0-5ab97aea3832@oss.qualcomm.com

Changes in v6:
- Rebase on bryan/camss-next; drop the dt-bindings patch, already applied.
- Include Jesse's "x1e80100: Use the lite clocks for the lite CSIDs" as a
  dependency, already reviewed:
  https://lore.kernel.org/all/bf48f3c809f33c060e2944e5896f8a5a93fd78ea.1795196107.git.jesse.casco@gmail.com/
- New patch: use the HW CSID index for the CSID 680 wrapper IO path
  config, the lite CSIDs program the wrong register since CSID2 was
  dropped from the X1E80100 resources.
- X1P42100: set the CSID hw_id, and use the vfe_lite_csid and
  vfe_lite_cphy_rx clocks for the lite CSIDs.
- X1P42100: align the clock rates with the X1P42100 camcc frequency tables.
- Link to v5: https://lore.kernel.org/r/20261009-purwa_camss-v5-0-58c13dc7c4d2@oss.qualcomm.com

Changes in v5:
- Set line_num of IFE0 to 3. -- Bryan
- Introduce CAMSS_CSIPHY_RES_PHY_API() to describe PHY API based csiphy
  resources and use it for X1P42100. -- Bryan
- Link to v4: https://lore.kernel.org/r/20261008-purwa_camss-v4-0-bcf11bf2c650@oss.qualcomm.com

Changes in v4:
- Collect R-b tags from Bryan and Krzysztof on dt-bindings patch.
- Rebase on linux-next and add Bryan`s vfe patch.
- Link to v3: https://lore.kernel.org/all/20260930-purwa_camss-v3-0-0fe2a5b11208@oss.qualcomm.com

Changes in v3:
- Rebased on the latest CSIPHY code.
- Link to v2: https://lore.kernel.org/r/20260511-purwa_camss-v2-0-22608ab9126c@oss.qualcomm.com

Changes in v2:
- Based on the old version of csiphy.
- Remove Src clk. -- Bryan
- Extend the register block of the VFE. -- Bryan
- Add comments for IOMMU. -- Bryan
- Link to v1: https://lore.kernel.org/r/20260410-purwa_camss-v1-0-eedcf6d9d8ee@oss.qualcomm.com
---
 drivers/media/platform/qcom/camss/camss-vfe.c |   1 +
 drivers/media/platform/qcom/camss/camss.c     | 176 ++++++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 3 files changed, 178 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 7183081e357846bbdbbc2c6bdf6e134d723e00da..c684de629e3a4685d4ff04b24db86c12f962b50c 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -2054,6 +2054,7 @@ static int vfe_bpl_align_rdi(struct vfe_device *vfe)
 	case CAMSS_8775P:
 	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
+	case CAMSS_X1P42100:
 		ret = 16;
 		break;
 	default:
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 86bb1df811ea0e96357d18dae0a5bdce6507fb15..0404f95a35fe659c6f9d945ff5bd32ce749b0991 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -36,6 +36,13 @@
 /* Top-level CAMSS version register */
 #define CAMSS_HW_VERSION		0x0
 
+/* CSIPHY resources for PHY API devices, only id and formats are needed */
+#define CAMSS_CSIPHY_RES_PHY_API(_id, _formats)		\
+	.csiphy = {					\
+		.id = (_id),				\
+		.formats = (_formats),			\
+	}
+
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
 static const struct camss_subdev_resources csid_res_kaanapali[] = {
@@ -4859,6 +4866,158 @@ static const struct resources_wrapper csid_wrapper_res_x1e80100 = {
 	.reg = "csid_wrapper",
 };
 
+static const struct camss_subdev_resources csiphy_res_x1p42100[] = {
+	/* CSIPHY0 */
+	{
+		CAMSS_CSIPHY_RES_PHY_API(0, &csiphy_formats_sdm845),
+	},
+	/* CSIPHY4 */
+	{
+		CAMSS_CSIPHY_RES_PHY_API(4, &csiphy_formats_sdm845),
+	},
+};
+
+static const struct camss_subdev_resources csid_res_x1p42100[] = {
+	/* CSID0 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "csid", "csid_csiphy_rx" },
+		.clock_rate = { { 0 },
+				{ 80000000 },
+				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 400000000, 480000000 },
+				{ 400000000, 480000000 }, },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.id = 0,
+			.hw_ops = &csid_ops_680,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		},
+	},
+	/* CSID_LITE0 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx" },
+		.clock_rate = { { 0 },
+				{ 80000000 },
+				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 400000000, 480000000 },
+				{ 400000000, 480000000 }, },
+		.reg = { "csid_lite0" },
+		.interrupt = { "csid_lite0" },
+		.csid = {
+			.id = 3,
+			.is_lite = true,
+			.hw_ops = &csid_ops_680,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID_LITE1 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx" },
+		.clock_rate = { { 0 },
+				{ 80000000 },
+				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 400000000, 480000000 },
+				{ 400000000, 480000000 }, },
+		.reg = { "csid_lite1" },
+		.interrupt = { "csid_lite1" },
+		.csid = {
+			.id = 4,
+			.is_lite = true,
+			.hw_ops = &csid_ops_680,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+};
+
+static const struct camss_subdev_resources vfe_res_x1p42100[] = {
+	/* IFE0 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_rt_axi", "cpas_ahb", "cpas_fast_ahb",
+			   "cpas_vfe0", "vfe0_fast_ahb", "vfe0" },
+		.clock_rate = { { 400000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 432000000, 594000000, 675000000, 727000000 }, },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 3,
+			.pd_name = "ife0",
+			.hw_ops = &vfe_ops_680,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		},
+	},
+	/* IFE_LITE_0 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_rt_axi", "cpas_ahb", "vfe_lite_ahb",
+			   "cpas_vfe_lite", "vfe_lite", "vfe_lite_csid" },
+		.clock_rate = { { 400000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 400000000, 480000000 },
+				{ 400000000, 480000000 }, },
+		.reg = { "vfe_lite0" },
+		.interrupt = { "vfe_lite0" },
+		.vfe = {
+			.is_lite = true,
+			.line_num = 4,
+			.hw_ops = &vfe_ops_680,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		},
+	},
+	/* IFE_LITE_1 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_rt_axi", "cpas_ahb", "vfe_lite_ahb",
+			   "cpas_vfe_lite", "vfe_lite", "vfe_lite_csid" },
+		.clock_rate = { { 400000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 400000000, 480000000 },
+				{ 400000000, 480000000 }, },
+		.reg = { "vfe_lite1" },
+		.interrupt = { "vfe_lite1" },
+		.vfe = {
+			.is_lite = true,
+			.line_num = 4,
+			.hw_ops = &vfe_ops_680,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		},
+	},
+};
+
+static const struct resources_icc icc_res_x1p42100[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+};
+
 /*
  * camss_add_clock_margin - Add margin to clock frequency rate
  * @rate: Clock frequency rate
@@ -6264,6 +6423,22 @@ static const struct camss_resources x1e80100_resources = {
 	.vfe_num = ARRAY_SIZE(vfe_res_x1e80100),
 };
 
+static const struct camss_resources x1p42100_resources = {
+	.version = CAMSS_X1P42100,
+	.pd_name = "top",
+	.csiphy_res = csiphy_res_x1p42100,
+	.tpg_res = tpg_res_x1e80100,
+	.csid_res = csid_res_x1p42100,
+	.vfe_res = vfe_res_x1p42100,
+	.csid_wrapper_res = &csid_wrapper_res_x1e80100,
+	.icc_res = icc_res_x1p42100,
+	.icc_path_num = ARRAY_SIZE(icc_res_x1p42100),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_x1p42100),
+	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
+	.csid_num = ARRAY_SIZE(csid_res_x1p42100),
+	.vfe_num = ARRAY_SIZE(vfe_res_x1p42100),
+};
+
 static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
@@ -6284,6 +6459,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
+	{ .compatible = "qcom,x1p42100-camss", .data = &x1p42100_resources },
 	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
 	{ }
 };
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 8154fab54f99b12456cb377dc4ddfcadfcf8278e..734023839abe9ec6a89b1a5c2a0bd5e545846c0e 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -99,6 +99,7 @@ enum camss_version {
 	CAMSS_8775P,
 	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,
+	CAMSS_X1P42100,
 };
 
 enum icc_count {

---
base-commit: 8d7367eeff00296ca3d780f8a43294539b9c6c65
change-id: 20260409-purwa_camss-475787b87e14

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

