Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62AF4349BB
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 16:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790008859; cv=none; b=IaHI0DkAlO0DvI2/dOSKMmiI3GjRmyPC359UxPBEtsmT6gE2tSkxUsxaI6pWeI/zeYh6bevkrcgwhfwAKznja3tuOWZ6ANLicQU1yNEU18IZIiq65DLrStZZlYpSTZaQE5PFVrRMMFAJab67S2lBtnx9gf5LckJqPN9nwjahl4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790008859; c=relaxed/simple;
	bh=aPRFTfaDdQ/cIK6dxLg1FkjHq781avSvKFMf9yuKRGw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=A/+DfClEZMsiLo6Y/oy1o4qhwWQ5HYO6THWyB+qkVdJEVPq2aiFwzaXtZrd+KyyRgXsYtSYCW81A75Jf2PBaJuI0VdJO/k7w9R53tBcnChvYRifW0Lg2WMRi5MbA/K/Zwmuao258meYq6PRY0K/koN8OLVBB+haqzicwk4I2jFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jxtQFGb9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RvpWEHEw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jxtQFGb9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RvpWEHEw"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFANCL1817159
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 16:40:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/pyCwnstMS7VkKSak/8GHk
	37JiiJroPOTNDhKBTMBlU=; b=jxtQFGb9bSXVOWE55VwC492u5Q484rpC0JeQLW
	cSRyyfZVfcFW7k2YBBmE3mO9tFR2FBPt3msp4TrGOsAC1W6kA6imopNUBgigQk94
	pGfJodZaMw2T0qnwSHTTHwMozg6YVswfyFwppWwleMQXEsvqa5pLRH3YwoR47iWj
	qroxxQIxZllRrswa5iIeJxmtDh26VN5aZxzFA/LOOrG7ql/Kwcn1pV8Z+qhnRGaf
	E47tN3ZkxBFaHEJlLTGg0bjCUzJZYp9A7/uYr0jqm1y+PvMQNtc+99Kx45Z8gW3A
	eGaqEJHbQOoeV8WC6cfa8E61QsyLG7y+0Deo8jyG5BY41DrA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu011ab9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 16:40:56 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8699b293a80so3347221b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 09:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790008855; x=1790613655; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/pyCwnstMS7VkKSak/8GHk37JiiJroPOTNDhKBTMBlU=;
        b=RvpWEHEwRP9LTlmNeh3m2VAqjtfKvbivWWQ7wQ8QMUudLHWqj5Z+H61A2MCL5bDUhx
         zYdYmSWKPdTcc+NB9CdSngKQbwYWNglAgowLXlRIqZ73KCMoUX8/18oAnbiVHh3mTCJt
         V0ZYR1ekLWELgpAiKQIAvtnsmDEN32HJW9whq3S8riogiBf32NRFEz53ZR7NgziaoXv/
         mJWZG0o9SouhKYERziQNeK9cW0LUq4/hXOQdAUKVr+gJvgDKWQopUSmTPu0sp+cugX6I
         9/RZsaxq5qWPJlonH6Rj9FiDwRa7QqlTwFpwHDB8oTF9va1fdFMR5rDaYKf9G45OxUf6
         i+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790008855; x=1790613655;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/pyCwnstMS7VkKSak/8GHk37JiiJroPOTNDhKBTMBlU=;
        b=YQgVHSDVkjfi4Q3nDhKouncz1omNfkjG+6kGGXDLU/Zvvb1iTd8Uc3siKUK1xccqfh
         62sQ/KT+Wv28FRnXlvnUHSR8d+DKz/67dsYVxDNEXtJz0GI0qmbj0ePXlPd/FG/bDsii
         Jhxi/3MIY57hecIiWxmYbKduTt1u8Ky/jfCyVG56Fsp9sX/JKU9RJf9lM2i/tFU0nDJE
         pZgI0lc+Btf0SbdIsYNmW3uqM91NzUiEILlmwhLWfZCuFPJ+brf44+jRUDP7E3iUwxXm
         DfBq01wR9GnhYGHflP4R1/NRivxhh3q+vQmqoMgZtLPRVp1t/MdJkR/LfYmcqQzmfKnZ
         6FfA==
X-Gm-Message-State: AFuF++l7vYmSp0cXYiejRjfVIrj8uoVtVdBuyzojV0pKj9PGgibxNqtr
	vrawhlbdEnvPKSPhDfjvOoEm5d8JC3tew5iljvTXWO7k0YOrKK9xwsy270wfdj6onwiM6namRwp
	5MiqrH+Kff4nBV7MEZYtSo0k/vV7ZeAUDZbVtDRATY/bVvZ4WbrXGrnW4/bdDi+sk6rdX
X-Gm-Gg: AYBFou1AhCA+IXBQ3/n1Bx5ZsMl2fEKBXCNIwgy0NIW8v8U0Yk5UPf5uKxo9Dyjf16p
	czM0RNEFEo2xq0X/ovr9CGVGxu6YzOlViqBPh5mIwTXqHCgnWhBoVLUEcJ5ud3gDj6bPXYFVmjm
	6vheD7P9DtuQZo9D+JKp1xPBwucRgmyZ5L3y/HRX1ytMFjWyxs6Kb956ozPalHy6u1OJC2pLLMa
	uNFct4S++kAGuQObbxIDv05dpaa9qJlawYkOdnekUDcW03zmB/Ux9c3R+GNfk+dUiwIc85ob2jk
	oC/1Y3/LFdv5OqGv/GfgEYeByr1iap6ABbjgz0f4+cuuHyraVVgrQ7EDviUgY8YFTmlwXckfv2W
	q2vxnQKzQyD0YdW7CYTgbP7AvpjN7XBI=
X-Received: by 2002:a05:6a00:300b:b0:87a:861c:fed9 with SMTP id d2e1a72fcca58-87a861d03e8mr3404931b3a.36.1790008855349;
        Mon, 21 Sep 2026 09:40:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:300b:b0:87a:861c:fed9 with SMTP id d2e1a72fcca58-87a861d03e8mr3404897b3a.36.1790008854819;
        Mon, 21 Sep 2026 09:40:54 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a8dfe732sm3666086b3a.16.2026.09.21.09.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 09:40:54 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH v3 0/2] clk: qcom: Add camera clock controllers support for
 Qualcomm Maili SoC
Date: Mon, 21 Sep 2026 22:10:32 +0530
Message-Id: <20260921-maili_camcc-v3-0-2f8d739ac2d4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAABesWoC/23OywqDMBAF0F8pWTcS4yPYVf+jlJJnHTCmJhpax
 H9vtAspuBm4F+bMzChoDzqgy2lGXkcI4PoUivMJyZb3T41BpYwooTVhlGHLoYOH5FZKrEujmGx
 KUTUSpY2X1wbem3a7/7LXw5TQcS9bCKPzn+1izNf2GI85JpjkSiimlKCsvroQsmHinXTWZmmgl
 Yt0J5q8/idoIkxBRJF+NKoiB8SyLF8cKzfcBQEAAA==
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
X-Proofpoint-GUID: qWKzxFmPx6qSb3l6raR6tpEaDj2nKaY2
X-Authority-Analysis: v=2.4 cv=dPczC+Zb c=1 sm=1 tr=0 ts=6ab15e18 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6kXFD9Q68pQua8COPXAA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI0MyBTYWx0ZWRfX9azHeyNXfM/U
 Y8ed5VmQs4xq2t+1g2IY3n2BcLH0dC96OKiNlHePXeC9BuqCrbm7pXK8NbaEBAybAbanl9OnptY
 npUI0rp3mK/qXqZZni1jeCqbOS1IdMIg2A0kriPFde8KXCB3q99oyp79NYDp26EBqutIEL60qy7
 wlc5GznZX1ERhk5VZQte4zdCJjapNVJJd0t21sePfPfvky6I+LYNDBHBWJuj2zpyMHtT1AQ2EQ8
 GzVxgKpDWjqyKaqxzzdspmUdvyAFUtq0nxQBPWZSgqJtBOO+AoDHyfR2YwsURvO+E4e1X2L1p9s
 rV/xSxalMO2jYBlTIaoggTrh6YZXGZtAoBz4qM7kgjFPznkBln+9wlJxHEmAzJNs78WLjR02KeC
 K6CcTmGQcJpno0m3w1wobcIFgqCPXHzjY0jxSztvENY+G73flrZlQnh3bLAvwMh/IkGUCHiTpyX
 Vp6sc9DLvWNQEcQX6sQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI0MyBTYWx0ZWRfX0C9+ooYEVOxN
 4xs5Hmpt9JjcVhzOigEPy9NssRi24XuIn4mav5vxhhxib4GnWdLC+w/xVG+L1SxOtVWozSDmyIN
 vrECvVBknetxansNMn86D7CH7isPUFo=
X-Proofpoint-ORIG-GUID: qWKzxFmPx6qSb3l6raR6tpEaDj2nKaY2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210243

This series adds support for the camera clock controllers on the upcoming
Qualcomm Maili SoC.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Changes in v3:
- Dropped dependency on Hawi camcc changes as they are merged into
  linux-next now.
- Rebased on top of linux-next tip.
- Link to v2: https://lore.kernel.org/r/20260916-maili_camcc-v2-0-f30b394bfd50@oss.qualcomm.com

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
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260727-maili_camcc-e4fd7c94b59c

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

