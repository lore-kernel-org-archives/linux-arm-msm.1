Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250103FFAB0
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 06:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791355857; cv=none; b=ulyBP+UfnXNiODgO9fG1iENOAWLoQtHG4YtuwZhmHlJtIpKSw7hVlOE2t4e7/xH1X9jszniC14T45FK1WuJtLPnQmHBYm7C47rgVEMWcmsuWYnAW+lOUoWI0bb5L4YDpXsds5o9CYxulQgq1HLq2ipW+TqehhFx2fYBDao65ynM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791355857; c=relaxed/simple;
	bh=Ni1lTQeRbFImYjymCCxoP08AlDfxpAcx3Qkva4hCzAs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oHhqcBlGFZ75P4VGFaPlHwA2lDzuDjzH8Ug4ZO1fkLDIFhc0qjgD5T0ay7GJFXtsu10kYHZfjxFY8TP/jReEilwcOqqCV4TUVyzntlKGvKQtP0+T/Do9mjf2fJhCscXvN2K/uyOUNtGXeGUVGmTmE/LXMljhTaZs5MKl4Z/0Dh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VtFDngL9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bH80RO2y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VtFDngL9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bH80RO2y"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6974U9Qh2295211
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 06:50:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=a11M7BngOPJoTkOyICJz2w
	OVpKy80IFCeWDMdq/5uas=; b=VtFDngL9Xd28E4NoJrmFjjGzr8Pqu+AS18g+VG
	pc/DFFYbIeE5u/mrUv+HZbP54JaRm/ov0XbVnhBk+LN5KFugFz009bRIZVH/b+NV
	vOeR9HzpHfeFxPxkYvSokviYum59woQIRHfF7iLVyi63SYW7dYR0Zu89eJmiww+o
	K2SwUQrkO6E62J+Nze89Srv+G13AVSBl49gX6uKaOv+ehrZO1wmrJb3krvmb1Zcv
	P5dW0iPbbX+0zPgf1XzioqKLAWS0LJfuuZgxOA3X7sop/uIpS3AofjTuKwxHTS+G
	DjL1ekgHlog64q6wJ6LQ9HdalpxhnqXL2QlgdGj+ZVFK4EjQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c1s0yqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 06:50:55 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-147be78cd56so13749908c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 23:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791355855; x=1791960655; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a11M7BngOPJoTkOyICJz2wOVpKy80IFCeWDMdq/5uas=;
        b=bH80RO2yA/QTeEGgMNg/pnv5S0j8VtESFgLkEi/eseUBBsWo4gm0f1SjYdVVRuj/kQ
         GHLn1KNjhggvoetcIv+8Nzys9dzrCQp8gcERKu4HeFNhR4zRLlM2EN/K+R3YF02x/Nia
         z/ZZt35mkDT6+MxJxhLlJ1Ish1/GoSllYDjoBhWyc5hLmRU0TcP+pM/813DdCx6jo1lR
         4flRjj+M0Dywi0TYL6FEKgzbr1QuhoOYdMtXXTZiSrHOljiImwrlJHmyly8cLT9GAWl1
         h+4a5b/xlT+eXAqhhTWxvR1CxXg4WXZQG9JhIkZdQyfpKzDWWwYuM19Ncve4j8ZNFG60
         KZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791355855; x=1791960655;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a11M7BngOPJoTkOyICJz2wOVpKy80IFCeWDMdq/5uas=;
        b=CLAD43RUJ3nlEmc+los/yhggmOyRr4hfdBCLuo+klPA2cFzUHobIGHMhTlB1W+dNo+
         TfD8bBMSP/x73nHU2LRCYsuNUa/VQ9KBpG0c/+i8X/r+tLSEFac63HGyJNi5NwjxRUlV
         J3IenAhlM6La4S0/LgiuhPf/O4aW2IsMv/nKhpcnCUGWyPQhpGTixVHupAMQpdv/8luU
         SRUslEQu3R+vPw2Los+kWAcyzpZQROHhSCzXA771VbkSweL62nDqKLRQHzV2FbwC/BoS
         izIuy6xZT+AYdfuQZy9VuSXPcafiSmy8i+lFvZXJplS8JfYcyLQNLnyIzV16jrL1lCEi
         P3GA==
X-Forwarded-Encrypted: i=1; AKwUvBxoKpxMrt2OeZa7oqY+LYw3Z/6ZD1sOjk5GjhG8lyizz5CVwBjN5rOYw0b0Qi8AyhN4dSdMU1ai/UrCL6fL@vger.kernel.org
X-Gm-Message-State: AFuF++nnPFL6yo2MjD9xS1r0P/ukYR7utNcwjKIfoZFOuH63zgZLPCH9
	TkRzkQK/qJNjANLqAlkqFTZ00uFNwfkBIKEPJcd5YSogX0H+uKKmP4Gxp8Hpp7Det4B8wpFcOps
	oOYyEfPuyiCh+QpuRpyFwIqnSpvAs5byGiLgWjNDfsC1zV+SOd4Tgq1vLjJqY7/RWPvaF
X-Gm-Gg: AYBFou0TsXWPinGJgGCWQIFW0sqnBLHCCjL9/Y2Mm8qo2MfbeAajTzNDWKSzSZaZCJx
	FpIMrBj2KJCPg74Vy0QvwSNv3QaExmJ61/toai3RUS173q62cwVU9g0Pmo2mEPzRlirjr0N864A
	84d33shu0i5VcZbKngPkMesADeIrF7ets11dcNitrXheD3CUwFFJXqOWtMD8I9DijrJHr8y6A9b
	qHo+BVmiS43f29G1oSIrSphoYqZvxjAPzQAfFhiN+UchPEnKaFhoGuXtC7G/iPSLEN9vukXxEx+
	GNZwn6yrZCZdKFO3M31wKcH76G+gJCUZyxgpKFcTtO1fbn/ibiEAkkI4cIgjjARf3aFD959gUY8
	/jq3l95kHFluxiBrXq+XE+2QorQUZLEcTczerrQxKnzHkM2uSIlkz/95oSM+1i8ZK++/AsJbXJi
	0CQWRHixZrKCd7vsJb8pIDqFta0guXjQki1Pg=
X-Received: by 2002:a05:7022:3a02:b0:143:26f9:33d4 with SMTP id a92af1059eb24-162079a5f27mr1774327c88.34.1791355854452;
        Tue, 06 Oct 2026 23:50:54 -0700 (PDT)
X-Received: by 2002:a05:7022:3a02:b0:143:26f9:33d4 with SMTP id a92af1059eb24-162079a5f27mr1774273c88.34.1791355853728;
        Tue, 06 Oct 2026 23:50:53 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615f1ac8c5sm7374730c88.2.2026.10.06.23.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 23:50:53 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/4] Add Qualcomm's IPQ9650 APSS Clock Driver Support
Date: Wed, 07 Oct 2026 12:20:43 +0530
Message-Id: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMPrxWoC/yXMQQqDMBBA0avIrBtIItHaq5QiGic6VWyaURHEu
 xt1+Rb/b8AYCBleyQYBF2L6jRHqkYDtqrFFQU00aKkzWWgjyP+LzMiy8sylHXrh3FMbTNO8UQp
 i5gM6Wq/l+3Ob5/qLdjo/sO8HEqeygnQAAAA=
X-Change-ID: 20260925-ipq9650_apss_clk-ff825e337d11
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: zEMjGUUD4TV5VngWaHp5TCmu7r5Dv3SY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAyNyBTYWx0ZWRfX265ZHfAPaSXg
 DhDzvAuQNKyFSshsjCNPhJN1dy4+L82EXCAlHFIR4QFGdfc6aEc+Eg9u146FTA4o7BlJtCeteMP
 oAz46fzAG6/q4XYq6c5aiwRmNCYT/3J8DZJbaipP8UNpo5F0HY48MFh+gK8x2GOvbWQgYxuvSyn
 LMju2e/GJldzU1rCrslvXQ6vdEbWNFs67DNVxWayGPHojzuQM/peJ4+MNPrbdGT0oJ6xRM2wHiG
 oonNvnzJhuBeCIOC/Wh0I9EuD/HeLS6Hh9ur8dR31xn9A+Ew3a0kDf5kG7dftZ5hB3LfXcnCj8B
 ZY7pK3FieJ48SY1+h6X3iMytanTkVWuNZcZhBkiJaufqo6b7WgnnU0CYVk13V4/rQ8BIjVKsADV
 2u+ztb55uTt8cE/7SajvJw3sErWAQ2Uyo8bhNrapEb6AIsSj7yx+VVy6rO4MCRxvqctYje5uQDK
 wjwuTP1ZwujD1OdoYqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAyNyBTYWx0ZWRfX3VmKWpRoj6of
 4kJFYKrIXKLpIA2vvLcP/vUb8bHUGeU/HPCuhn9CDRiOXE8Zjs3blWA3nz6093tFKYgAIN2ZnPG
 e+j6I4bqkjmyG8gsob3zfiH+EDzrNz0=
X-Proofpoint-GUID: zEMjGUUD4TV5VngWaHp5TCmu7r5Dv3SY
X-Authority-Analysis: v=2.4 cv=NatzRGD4 c=1 sm=1 tr=0 ts=6ac5ebcf cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=mshoYkgwlum6hxNOkgkA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070027

The APSS clock controller on IPQ9650 provides the CPU and L3 clocks. The
four Cortex-A55 cores (silver), the Cortex-A78 core (gold) and the L3
are each clocked by their own Zonda PLL, selected through a glitch-free mux
whose parents are XO, GPLL0 and the corresponding PLL. Since the L3 has
to scale along with the CPUs, the controller also registers an icc-clk
provider in which both CPU clusters vote on the L3 clock.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (4):
      interconnect: icc-clk: support N:1 master-to-slave topology
      clk: qcom: clk-alpha-pll: Skip Zonda PLL configuration if already enabled
      dt-bindings: clock: ipq9650-apss-clk: Add IPQ9650 apss clock controller
      clk: qcom: apss-ipq9650: Add IPQ9650 APSS clock controller driver

 .../bindings/clock/qcom,ipq9650-apss-clk.yaml      |  58 ++++
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/apss-ipq9650.c                    | 385 +++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c                   |   4 +
 drivers/interconnect/icc-clk.c                     |  45 ++-
 include/dt-bindings/clock/qcom,apss-ipq.h          |   5 +
 include/dt-bindings/interconnect/qcom,ipq9650.h    |   4 +
 8 files changed, 504 insertions(+), 7 deletions(-)
---
base-commit: eea3fef32a9cf36abcb5975a5a594e4135a6b026
change-id: 20260925-ipq9650_apss_clk-ff825e337d11

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

