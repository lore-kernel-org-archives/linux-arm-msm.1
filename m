Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA883D411D
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 04:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792213113; cv=none; b=Gy9zbWWLu9dw8NVNi3J9QwH2QbplMvqp0Yl5NfL1YW2cwSsxMijqjmv6ag9NP8DLP+qLbhN/xb8HrWbPbcZdqmrQL6nD77TAqGNslzNFm+1W/EGD8Uk00J1JBy4eKxooioa9U9N0twF8Erwb4t1YwJMzCHN2S45Y3HOiaFswZnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792213113; c=relaxed/simple;
	bh=hAkM+QMIr1WwT7Vb/or3nGf70MZ9cHw2QoAdSm6hPo4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ICFMgFnWt0P0ogcTyA8XK6qA4/rJ4tesCWRUuesVhVcPUh42O4WaYvFarpuUL5o4RSx58JV9SO8Bo8DjVMGg8KlTlcZcN7zGZ6ByMoiwROYKY74OIS0VtYMTzACZkxh9oLWBltSNC7/JLzpS2ZBxrJuJGsoW5SwaL7fSiaeTdhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZR8I0h8U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E+uN0PlP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZR8I0h8U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E+uN0PlP"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H30ZOO3938717
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 04:58:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4QGgUiRp4/QTjgw/Gp2Jje44cAC5pv0wzFZ
	imB5MEgM=; b=ZR8I0h8UXItqES/+xp3SqSHE8JOCVoBc+/KiKW64Qpmxlg7hs1Q
	5TIs08Kep0jXfwwKuveMS6MGKvrmzNa/zpnBj+y90B9URJP7clKxyYDydAaHuRFH
	e2jiRgaDX6iubOsivBlCB9gBabpoQgmKBcfBo79w6d7ROUiDNdY9f6SCEMrxkyGa
	d4L9JJPV+FgRHoIRFN8amorVN5e5UTd5LxbYsO+uaNpTAWip1ZFCyYSlk5nGmMYU
	wInOSPjs9DP1rCrczAO1d7cKMH9nzX1k0BhS5Lp+cFIiBzj/ICaIp55/jR/MJawV
	f6rWXhfJB67HTX95f/U8dpxHpF1srHw4M7A==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbxcnrfrf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 04:58:30 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-147be78cd56so2143848c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 21:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792213109; x=1792817909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4QGgUiRp4/QTjgw/Gp2Jje44cAC5pv0wzFZimB5MEgM=;
        b=E+uN0PlPraydTifp+DNLzXH4XQGWoA5VIh7Y3ptwc3UjzLaYb+TkaJdn0xNB9VqOLR
         TxAGnUmGdgkcJKif2DCi21MDsszHepNckiU+DP09L6IvAgTGar/rSBO5o0uxAcduTK7a
         ZPRYd/O8WkFcZvaPqVYNTWP2N8v66c/oAHi7LFO4Q+X4b4AjDc9DX7Su2WCbVk0gGxVE
         bAU1KDCAlT7WgvNJs9UBo0SSaJGPnxjSECPYuTM2JIXzM5yGkW/MWPoo+La66W2t9MX7
         HHZ/C8d62LvXx42G3/i1jDIDgfichMZJkNtxEHGvVM3kqJ/FJ18N4PqcSJkFe2WKW6wu
         y9Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792213109; x=1792817909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4QGgUiRp4/QTjgw/Gp2Jje44cAC5pv0wzFZimB5MEgM=;
        b=UA7o35UXiJT8loSrVXpT5OCFUCldv13XSyhTuAGS0SkqyXzfISSnyeRwaXk66SZqXW
         dI51rv8D2jXZ4aBkVXg1/6urnBhFYqtpPWLTAkbMCmz7aAcH7uYuIL+3pg+30xEp8n9Q
         aeFnRvIrzvHF9waE7UcdT4HYe4Ml5EKec7DS8ez4UGAv+x8URNn3+0AOLmkyJ6OmhuqM
         B79PHC0uumrY9f0DZkNRkt0ti+8ANnNd/Uh826JJe7wrd3+Ybwc/t1FRp8lqiw1aW+Ex
         6Qr90RqOl1RBBp4hmQIkL7otkhS53uz6MQ9d62sGl6vJkTqkFVssjKUqGxxOWwQyNqed
         gUCA==
X-Forwarded-Encrypted: i=1; AKwUvBwuqd5WtlS2SuapzjIf86sjM2JsWNQ/xp9lK2djDOytAcOVPfQ9xqYbtbj/AEFSEnqfqhG4B5UH2UuZJhq/@vger.kernel.org
X-Gm-Message-State: AFq9FYIEF5N5/EwyA9Cy6G2Km+wJF6Mn6btcqAeSp5kB/qS8HTo3RrlK
	pPSBqVItARzqrSkRQGZNeg38aJyi7I6+cC89pE88TM37iYerLBjvpZ2mcr6BZGwNaYYtTGo9EN8
	eUeiHr4rNmAenoEPcegughh6+CniiVJB1lupWiGbZWsaw7vWPUsNcn3LRCmFPdz4XOKnI
X-Gm-Gg: AYBFou38b6ywrZ2v4IGaJCq2K09HhXuna9tv0uQQiuQXMarJF+wy6HawsJZH8PBaAVO
	5m65eCG5aPbMii/FAwbtXnOFURCvUDNlP5uOKo5lUBxlN+INVzVDgfrFtLZn82w3xkq5PnntWm0
	n1K4F6XYj8nxwNsYSOr4/j2d39no1nynGtI6zQNY9DuCWoLV4wY9vuHA1m7+zycQ5G3L7bFOVdY
	HeR7/rNj5GBBiO1BaULJaRAvhawnEKnyxdeC3QHT5/v5H8Rf4/QbMFOrQz9UW1JO4p8nZ+ACAR1
	+HDT8B3S2HYOCJKkPHvSuABDcwbHND2BsYH31Xk6MpZzyX8d2IucOdk9MNreShg/hpyRYm2DMR7
	AaEhwIkmDUkS9fT0/tfSgb67nS/c1duNvZIrC0wxvl+kMTwLWGju6A8zCa8U=
X-Received: by 2002:a05:7022:170d:b0:149:cfa4:9b3b with SMTP id a92af1059eb24-1850cda6f5cmr2762156c88.3.1792213109418;
        Fri, 16 Oct 2026 21:58:29 -0700 (PDT)
X-Received: by 2002:a05:7022:170d:b0:149:cfa4:9b3b with SMTP id a92af1059eb24-1850cda6f5cmr2762134c88.3.1792213108884;
        Fri, 16 Oct 2026 21:58:28 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm15203817c88.11.2026.10.16.21.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:58:28 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 0/4] qcom: videocc: Fix sleep clock on Glymur/SM8750/Nord
Date: Sat, 17 Oct 2026 12:58:13 +0800
Message-ID: <20261017045817.1506961-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BNUmP1QG c=1 sm=1 tr=0 ts=6ad30076 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=nVBIRhUlJonL_QqUTF8A:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: 21FO_ii0Lj2aaLDWBBg9bNykBrl7MXiQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxOSBTYWx0ZWRfX+wtJNjWVxo/o
 qIwzsm568FJaAhlwGfyj3V5goOYGP+lB1amtkbPloEij38sm9bA4dn3NTml7WkJHoz08w13DVWd
 i1YeIC5/9pewsV3v8XbLVYzug+5xYso=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxOSBTYWx0ZWRfXyJRKGHK1dWx+
 9NstUXoIJ+vN1y9jDjGxYKsATR5hQUEE2/oHuVi0SMRvw1ogM1GEu/of8Fnw2KZ34yljw8rJ/wC
 g6TvQJgwo+UzGAGbOOHjdhu/tOwnbaZOnjZ6y5kF/rrmRTwYRq2gt9hFP9o7ow9e919MciowdqI
 C8BDf56WR+WLFuQe0F4R1vWQvxGT0GzicPUyvyzsafMTjCmrSNvUN8XzjvqbJavM73s66IJdlcE
 16uuxIVtzwo3t/g28HLATjMHA9ZYKpVnCCBgixe6nlafaPdz49q8P6c4MXZCCgtMoAKAzrSQs9c
 m0NkVLl4L8ynH4dK26muj5ruHhzPASNZ5VlKmd6paXfaqgbeioIpZ2+OOk27gBxrryWANz41K2w
 lkNnuLsFrTScB+RAfsy8qiSXbS9r4WCrXWIwvoUvCp9XOwtKJMjiyrIfbyqzBaqZnup2E77LLhP
 aqrmbO5JRuC9CwtT8Fw==
X-Proofpoint-ORIG-GUID: 21FO_ii0Lj2aaLDWBBg9bNykBrl7MXiQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170019

The video clock controller on Glymur, SM8750 and Nord has three clock
inputs: the board XO, the active-only board XO that feeds its PLL
reference, and the 32 kHz chip sleep clock that sources its sleep clock
generator. It has no AHB clock input; the AHB clock the controller uses
for itself is generated inside the block from the XO input.

qcom,sm8450-videocc.yaml describes two inputs for every compatible it
covers, a board XO and a video AHB clock from GCC. For these three SoCs
that leaves the sleep clock input undescribable, and describes as the
second input a clock that is not routed into the controller.

Patch 1 describes the three inputs for the Glymur, Nord and SM8750
compatibles and keeps the two-input description for the rest. Patches
2-4 bring the Glymur, SM8750 and Nord videocc nodes in line with it.
None of the DTS changes is a functional change.

Tested on Nord: video_cc_sleep_clk_src no longer shows up in
clk_orphan_summary and is parented to the board sleep clock at 32 kHz,
and videocc keeps working with the GCC video AHB clock dropped.

Changes in v3:
- Reword "always-on board XO" to "active-only board XO" (Thanks Konrad!)
- Link to v2: https://lore.kernel.org/all/20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com/

Changes in v2:
- Rewrite the binding and DTS commit messages in terms of the hardware
  clock inputs rather than driver behaviour
- Drop the Fixes tags
- Rebase on next-20261006 and add patch 4 to fix the Nord videocc node
- Link to v1: https://lore.kernel.org/all/20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com/

Shawn Guo (4):
  dt-bindings: clock: qcom,sm8450-videocc: Fix clock inputs for Glymur
  arm64: dts: qcom: glymur: Add videocc sleep clock
  arm64: dts: qcom: sm8750: Fix videocc clock inputs
  arm64: dts: qcom: nord: Fix videocc clock inputs

 .../bindings/clock/qcom,sm8450-videocc.yaml   | 26 ++++++++++++++++---
 arch/arm64/boot/dts/qcom/glymur.dtsi          |  3 ++-
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   |  3 ++-
 arch/arm64/boot/dts/qcom/sm8750.dtsi          |  3 ++-
 4 files changed, 29 insertions(+), 6 deletions(-)

-- 
2.43.0

