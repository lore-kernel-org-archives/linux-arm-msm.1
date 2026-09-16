Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590E73B14AA
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 05:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789537535; cv=none; b=WfBpsoUS3d1IahvyoyXBFNpsnRJkWrApQDogQArvQqm3jn8AJ2cwVAr6abHeDb7bQ0CP56rulWZv9/Ih/MhkFqf5dRg4fTWlwuMpzNkuZOERVutJCCgMuQSeBlGqItmKP9ElBGkZqG41rUWNgBWPNJGPYX8WvYQOIW2dMfZFD8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789537535; c=relaxed/simple;
	bh=cf19/syRiwXf0xu5ad6U1c8whvaFvayCmc9PWf9OIgg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QV5y1/O+MAzc53WSbDm0GZLGSFO9S1UAGpGbtNMUeXGG2BkLTk+j4012E3v32HHpBW5pLvE6R0Pt5Rq+clHzLp9NkL730M8v+U7dyeCKhshM+UU8JwD/raapHxn7t4q7cD2Mfc460byAlbYqPzSK1d/zV1/I99ESvn7UAuaQQfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QfFj1OUf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bmhHdhQL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QfFj1OUf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bmhHdhQL"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLYxr33680924
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 05:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WIebQaPsQ0KFySfPxuAtw7
	iAsMbJ/qLcd/CUHpRueRk=; b=QfFj1OUfxw9KJueakiwW7makp+hTfoVyidSKvw
	gZ1+Vk9V1xE6fAV0Zb5MWBuJElLtNDx98d95YfLxcs+Oc40K4uQsDRt2EMdnutYs
	Rxyn/LUDOCOwSJKWdSShxJG+B3tp/Fd7VRYoKn4LioSb36MjTXLrWHI2vUIFauj+
	JFb4vtyh+LBStkAtPlnBlEHr6+3Y8J+hE1YD6kUeKF8fb8QeLOsS0SeC3iam6sj7
	SGqnSzdLgkqSQouyqPf3NUkWDbDnkxPLs9+WGmeguEe0GfAOXqvLEB7f4a2iehpw
	BUipin0E7Rrytzwb5KNbE9od8Uc5GnP/LuLrMK540IoR/xAA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqe1r9htm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 05:45:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-385d2703b64so1880910a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 22:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789537533; x=1790142333; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WIebQaPsQ0KFySfPxuAtw7iAsMbJ/qLcd/CUHpRueRk=;
        b=bmhHdhQLaE6dK7oBqQo3y6IgKfXRecyUbwTrhrBsthtWTmDIKWPL7q8H0PilmUkLkn
         X5hcw85I319QaLKJleDNMRkPtxB22xKGd69Tzy2hBMvTit3rxeKjRsT5a0JwzvcnP5F9
         9gZnfjfy4mBs0YilcOV+9DNUIQFOKDQPX/g1vQG+TlwGwwueeDRF5I5BZcPS3y9yzKYb
         UsHPGaz7dnT9gUJcfKGRlnjW9dRFWBnPgxTR5CMKEEdnsJ56Ws+dtLwWu/R1RM0GKrU5
         rfrhzn34wldp2dN7B1sfD9WYvahQYVMr6hA0EweMTqgs6G3+VPWsjIGt5ye3GJiuft9c
         AlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789537533; x=1790142333;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WIebQaPsQ0KFySfPxuAtw7iAsMbJ/qLcd/CUHpRueRk=;
        b=tPcC8UrptQriI4I/98VBzqG4y531422hBGNxMcqg6KmJHh9TSsadXlbrwHW6ohkvSn
         E7YLRZYTFjq8+TfhoNMCxvJL/FEw2ETbwyblIlRmOhQbQZ69fFQ/j/ejUB22H7h7Af2n
         alC1cYDfQFNKMLrtpvcNJpZ8q6H/8lNb2nT0KoBsVrU+4jcfgke3ISTIeUa3zeBSSzai
         4lCxaSfNHmHx3Nk9vgG7moPbPi1lftfeCKDTKzA+pW0o6sqd/Htd8InDALIZ3VHpChqC
         0mqk/Y4W8wNodvlH7j/7EgYjiJsByb/5ZOfE03gImT1jeT0zS1wV7r2vOuXVK5l9FRbv
         Oukw==
X-Gm-Message-State: AFuF++mDAxNGoXfMlcUUhXUTWILhN/yISy9/Ju2i5cCdqzv6wCIs0TZP
	zn7ReNcNEU+PecBnIrRjIokRz5wJxX7rfLB0g9fbJtIAAAnwi9Bip8piuOdbR/hFyLokxcajh4w
	s0dtfIeIJDVHxGBiwPqIEmap9NTwzWqZspyTw78T78+ECfKZprtlCZt+N0zVAV31LYIpW
X-Gm-Gg: AYBFou0TwoB6eIT5LQM7hJjzTdbe44z7AZw2BuT9P1mYhAcZarizNW5vrItP8a/VKpx
	RAwaP6O9R87bOYh7quI7FtIk5gb1vGPvtHgTRYsjP7ZXbA/L+ybBpsrgng1bmXSf1fMtv73UHsu
	aNJWjEvgFFa1tcMUOph5J8jwNnuto3/MzfTXEnQeiFW9zvPFxVblc9WZ+6/7UoSjk9fHIrvPSRj
	UwEhMMY0KMnNMdQhWrb+2bh/c94uJO2Whiv/W7kfssuAOroj/KGgOdq8abrK3xF9plW4brNnuFS
	4Xbcc5n4ym3+aWnrjyPn+sLl2SCuXlu9rrnca9pk25hDAZhIlPffJNZ5hmTFb9XpO1/EFIW/3MA
	SdV+aSAlNBftPIxNuo77zG0dIQvPlpzg=
X-Received: by 2002:a17:90b:2f46:b0:39d:e445:1d44 with SMTP id 98e67ed59e1d1-39dfe2139c2mr10785058a91.31.1789537532649;
        Tue, 15 Sep 2026 22:45:32 -0700 (PDT)
X-Received: by 2002:a17:90b:2f46:b0:39d:e445:1d44 with SMTP id 98e67ed59e1d1-39dfe2139c2mr10785016a91.31.1789537532106;
        Tue, 15 Sep 2026 22:45:32 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b030aesm4357492eec.26.2026.09.15.22.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:45:31 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH v2 0/2] clk: qcom: Add camera clock controllers support for
 Qualcomm Maili SoC
Date: Wed, 16 Sep 2026 11:15:22 +0530
Message-Id: <20260916-maili_camcc-v2-0-f30b394bfd50@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPIsqmoC/22Py2rDMBBFf8VoXQVZT9ur/kcJQY9RPRDHjeS4K
 cH/XsledNPNwB2453BfJENCyGRoXiTBihnnWwn8rSF+tLdPoBhKJpxxzQw3dLJ4xYu3k/cUZAz
 G99Kp3pPS+EoQ8bnTPs5HTnB/FOhyPP+YRVGJinX0YI32G6l00HUGhAOnhlVUprMZqJ+nCZehA
 Q1C9aY3xgQtdQThqz94a0IQPDquglRRkmofMS9z+tmnre2u/3fF2lJGWRtcKBDHjX6fcz7dH/Z
 atadyyHnbtl/wsvYBKwEAAA==
X-Change-ID: 20260727-maili_camcc-e4fd7c94b59c
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA3MiBTYWx0ZWRfXwbwfybw/exag
 O9OWOUqZQF077E22C1xZ1KDY1tzfHQHqxkUfd/Dd72kWeoeagnQMqDUEVJlZOG4CGxcnsswE8pu
 b1LBMfXE5CjtLXyznEkVrJiuUDbQDCI=
X-Proofpoint-GUID: IXxVdMtys4MYMtZhHHvPNT_4ELkjh4DM
X-Proofpoint-ORIG-GUID: IXxVdMtys4MYMtZhHHvPNT_4ELkjh4DM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA3MiBTYWx0ZWRfXzZlU1sJAQe6a
 IJXS1+Saj8D7ihewraTQODuNTuJ2W9sU+tgpNQOHE65tW8TwGqfIstMbjqzQG72kCB2giFiIivn
 xpuR4+CUacEUXra//0REoz/jEz75oib+v+dEkhnll5pZ0dKXngtHbsbY4wAJisynx6n6iImhc1U
 MGHjcyFxrD4xo++VvT18mu00XwQOI2mPZcxz2gW/DyV8CVjExbbwChWXb0kG2va90TyyN+j+Wo/
 3YNHtnLIkgwgESI5OxTguSy5vbe7HD79ldt7STd734mQ79my1jujva/m5zbBf60cSYZYyKah42c
 U6aeygK2tmGLuHfu5uqNpJjUT4GowommV+kft4ToHMkRFYNZbhRqsM/M3LutCfBj6OC+dc4Tq+O
 U4DMzF0vWjWLhHt69SAWHMmD3/ZQKI4SaqyLw43axyJGpoIDynlri+ZCLJiFCxmOAbrfCOxTeOk
 9inxya+fGr2KlNkP+fQ==
X-Authority-Analysis: v=2.4 cv=ZIhCCn7b c=1 sm=1 tr=0 ts=6aaa2cfd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0CEgtgGPtVrRcqxqxNIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160072

This series adds support for the camera clock controllers on the upcoming
Qualcomm Maili SoC.

This series is dependent on Hawi camcc[1] clock series
[1]: https://lore.kernel.org/all/20260915-camcc-hawi-v3-0-5b57f45477f1@oss.qualcomm.com/#t

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Changes in v2:
- Rebased on top of latest Hawi camcc v3 series.
- Added interconnects as required property for Maili camcc
  bindings patch inline to Hawi.
- Link to v1: https://lore.kernel.org/r/20260727-maili_camcc-v1-0-01dbd7ddb276@oss.qualcomm.com

---
Jagadeesh Kona (2):
      dt-bindings: clock: qcom: Add Maili camera clock controllers
      clk: qcom: Add support for camera clock controller on Maili

 .../bindings/clock/qcom,sm8450-camcc.yaml          |   6 +-
 drivers/clk/qcom/camcc-hawi.c                      | 158 +++++++++++++++++++++
 2 files changed, 163 insertions(+), 1 deletion(-)
---
base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
change-id: 20260727-maili_camcc-e4fd7c94b59c
prerequisite-change-id: 20260508-camcc-hawi-4be887e3beb5:v3
prerequisite-patch-id: 8c5a0dda9a4fb4eba4995d9b858a14bc6f823df5
prerequisite-patch-id: 4a39635ae96cc5ef0c8e385ea600cf75ef71ebdd

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

