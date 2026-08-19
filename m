Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4662D29C8
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787143996; cv=none; b=oR5xr3gBhNt4V8rih5yjX8GBRtrUMomuMVgwCNOrVkFpXvZJSnaARl0P/sqATEKdrM9rU9GL0EIr6sY2EktIO9GrS2rMR5RVrzdpC/QcGBPRqv7ghc4qY/rIz5WT+dk7AkRQZXey4xgY/IJExVEFDe58oT3LaJ5XrawgqJ7Om1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787143996; c=relaxed/simple;
	bh=aocfws8Kf4eH/Sw8YBlJiavOC8ubRD9ZJHDiRz8wOdQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GJfLWBW9OZfci0bK1lHEePcuRI97YIDJPGs9I4EFtjn8DhClYjWQEuSKZoM66/6a1OAb9TAfrBTteeYZz6LZKieC/gngkcyNnf0npVvK7oX6FaZaREg59bsmbbwhwi2raiuXhuJXoaYGwpmwrkTMnuP2OTLXss/er8B22Zm3EJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mtr60RZz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gEn4/P9z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mtr60RZz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gEn4/P9z"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JCll1t144402
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:53:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=W4Xj50xooKVvZ41LfzpQRG
	7HYPYstHlBe1B3U8mLEO0=; b=Mtr60RZzKx7Vi4+bEoyhNS7qjhyaYU3eEfVlkr
	F1nFZyzU5c64qBW631XDKV3er+PjEgu5mwiU4puMCDklqwhwCn1/4boHHGmMWoWf
	eWSZqRvga+lF+PxtW3VrQkUDRhdkF/AZ9yC2RAP5/Xxppa6B30v3SLG9HBEb2Wfz
	TTKt1yn4+Wv0QAsTmYrr9kj5RfZiOFMSx1TkXwB3+LImsJ2Bd6noe1hwaEN+ezgx
	asYaBbsF7GIHC7qMdhnVHrEBm9yfvTMnIlJhNErUXLBSkREBzUlyWf5XZaAcyt5+
	IdAnfn0Az5KsMGHkHSaSk8M3txs3jqeuE6NlmBbuLHJ64K/g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfjkbra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:53:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936d067836eso122410885a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 05:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787143993; x=1787748793; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W4Xj50xooKVvZ41LfzpQRG7HYPYstHlBe1B3U8mLEO0=;
        b=gEn4/P9zpkJ8fMiArJmsvD4MoklPtP3TPi5/LK154jB+BfRPPiinH82CEzRIZNVV42
         ltl8u6DbcaPdDnB8QsulxWeBOl67D4YbUBiAcqAeCRRC9LYzO3ZdD3PO8wVwdebWrJzd
         xlIuPgPO1Id1db0i9EuUQfm5mGlksy6IO4buhQOLSZfYIjXLGZEkWkzL/97BtTTK0YvI
         CkEJxDMRPjB/WgLUlCMWhmVSNnMyGOV78wgOcu/prqvJdpZ/MPnek4gwHMWDDJ03hPR9
         PoUiKSHvvYinp3vnzfW6O0KqTpQS+XOrRoQo1nfwxqXlmMecH0pQQWHJNkOg1NjZUox2
         gBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787143993; x=1787748793;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W4Xj50xooKVvZ41LfzpQRG7HYPYstHlBe1B3U8mLEO0=;
        b=r1alBnqA6euaMCj6+WXTwW4HmMzFsIKJp4nNgm+fCv5rCF2nDEq4Nldhj+ALbTsqYx
         W2fPw9YGNXgTTEzBQok5wSKgZFUHfGi+6Wh1tDOKOXJ1vFEjC+nZ1MxyJJFeVm9k6i6m
         omtBlDeVeGJvdvKgX0dpfqwDzlKOLjIOA9ZoqSBV4uyzieffeahiwEakGHpnn5lSNW7q
         9bYdBcf+O2M0cEHPUCTYN4q5kms3JOCqIBZBHDrlMs9nPNspN+8FTvwMBwEL7DneS+MW
         Tsq0U441T0EtjeP8k5s4tML5I/J+bEIuJ01K+m0GanXAf7hEDJCRD0mwrqO94m6ypnBm
         tbPQ==
X-Gm-Message-State: AOJu0YyN4mALzF7nOSjYOv6Bz3OgxvQylbE9JGM2qtYgMNh8kR7dl84J
	5SPAcAiOicg572oBcECKXrSc6v4n4rIyHOIflotVUJrDxXGz/8nDWc6sxycYs5qjMIL6DWgFgXd
	2iQ6OuBSN1Xg7Ea/5e22GlI0z0wp5NMxMhvBbNJ8fnaxLC+YZg4Im7r0kuj0HdyeOhgqa
X-Gm-Gg: AR+sD101bDVmw3ltMNBdMOwUQLpEmLdn0kiDMK+DYZOLmgEmJ1QKRDIbowucsFe6l0X
	dHiPiZmaeLti9KO4/1K3yjfCX+YGWk8Je7NO2rPgER/Fs8sgvScUKFA7ntTBqNDBs5M2Zn8zcn9
	uXz5a+pcI+B3KrU744AKdhoXBXjq7MwCQWcZhoYnStSMO3z0aL7x9PbPkHK+Ohd7OJzroYlEpDd
	XkPc6+CZhX/okkBTfT7vtRUCJMXJYD3pkBQ/nLs4mmYIr0d+z/fVDnolDWZ1JgIBiGJo1csP6Vm
	l7D93LOhHNwwJq2PhCyYYaIloCj13YZtggW6UMOYxbewCs3tRiWuUuT6d1Txe43E83zPktPDrqP
	QmVVz5Jjz
X-Received: by 2002:a05:620a:3712:b0:936:e3c3:8cb8 with SMTP id af79cd13be357-9371e6b89d4mr353292985a.45.1787143992167;
        Wed, 19 Aug 2026 05:53:12 -0700 (PDT)
X-Received: by 2002:a05:620a:3712:b0:936:e3c3:8cb8 with SMTP id af79cd13be357-9371e6b89d4mr353286085a.45.1787143991242;
        Wed, 19 Aug 2026 05:53:11 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm77954795e9.11.2026.08.19.05.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 05:53:10 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 00/16] clk: qcom: Tie CX power domains to GCCs
Date: Wed, 19 Aug 2026 15:51:45 +0300
Message-Id: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOGmhWoC/yXMTQqDQAxA4atI1g34g7HjVYoLjdGmoKMzowji3
 Tuty2/x3glenIqHOjnBya5e7RyRPRLgdzuPgtpHQ57mlD4zgyvbCYMK8oHB4siMVAmRqagwXQk
 xXJwMevynr+a237qPcPid4Lq+X4pV9XYAAAA=
X-Change-ID: 20260819-qcom-tie-cx-to-gcc-67e6697639b5
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2501;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=aocfws8Kf4eH/Sw8YBlJiavOC8ubRD9ZJHDiRz8wOdQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhabmcGAQo+AgyO+pdhoONhZ96Vq0a3hnMoZKN
 g7CUF4C/LuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoWm5gAKCRAbX0TJAJUV
 VhhOEACw96knL/mvjuEArdHD8XF9el94DR2ie/OGimOQCGjS4UnVDeHFms65M9aJiugfzzu7UIi
 6f9VHM7oe5NwcnMbLIlTkj6aJ5eOWZy9pcZX6iH9V+STHEoiIHYnvdsneoJk8maac1P+j45J4ms
 cbaAtFakeFa6CYlsLfa1vdPVZc5haeh2ZsMVi5TetvkRulyzik1P63SxOWt4wV1NMjTjxoQw7Cd
 9ykT7hPuYQCbl7CPpXLqQI7sYajeiB2T/Jtjc7VgMknYlByHXT4+zHVBPtDuBP7feuqlLXLQp5Z
 mWTvx4x3Q/3DCLZoh3ucBvysGko7n/DFPFzh6YTXCT4RGwloFB7MMoJMxXOX7wJvKcTvIu7iTYs
 TMx4dTjr+iP0GLrGZgQvocLPv0JtXzBfp5lkpjvyxz1UEE/R66aJdFIgl8CmImoRz2TyhZob1qc
 F6ov9pSq4tNKyLRNaqU2ZmMvau/LZSqKZJgFIxU6veI4FzIaRqK5Qhv7GnTbbZNaS7uyV8hRoat
 87sgdhazgKwf6UdbK4Rt7vCVm7KAb5xkfafHRgTzeNC40RF5n5dgchmfmQqoT5/7st/dCQ71/vD
 y+ny/gacIeziz4PYm9TqspKqbFiMxjI+PuZOXZvoaWY0l7PuLlRavzFMzjJ2f+2/R5U1yBzsktj
 r+rO2buiRCodKcg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX//32r58kX6NG
 4eDGVUhne7VXvwTk2ecG1+X1zI1G1nc4pNwFs7Eb+s0CWQHLJQoMLD/RfmDO0LC3z575yWZxOwT
 302L603Gd6K5B+UJKb13kAmOEmuWokeJPOih3ML+/YdRqOKuqBsoO8ZZLr4/HeEzYy6etIUh1n1
 +eBN3MdnTR19RueCIp0rnybdrWoXF3gVkNaz1ww9RvkymHlOYoVEmgPfO+FyGY+m6LcaT1g45v+
 ot98ene4hG67L7k3anx1vxezLc9s06UzotFIWFAp9Ezzf7eMrUZb9Ow3LRtep9BmZEncxVcRbo9
 L2UAbdYIz+tiz7Q1UcD6JU5tiKmBqgcbVMCRgqIw6vDub1qTbKrMlULSc5nogl5gWdhiez4NJQv
 6DnJH8PemNqKwUfAoXfU0Nax41aYx/syS5TytcBGKO61bRIwQzgUMqDB13xfmc4CCObumvFZvfE
 Wntndj7Zx15q7pNyrmQ==
X-Proofpoint-GUID: sg4BZ818jk_o083js7d4xqFqRyQ1emSk
X-Proofpoint-ORIG-GUID: sg4BZ818jk_o083js7d4xqFqRyQ1emSk
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX41i96H+NfX9I
 PTLRvYdCil5JjFhiojdv9JsSfWEN7UKizH0Zfbz6IZBrmrWQ9Bmpoz8BV8XHADTKNaq1EXDKSNz
 Wf5mhqhLT8Y7t/eaf+6NivVmGXwci8o=
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a85a739 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=iXTosI6WrnVeENpZgjcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190100

Tie the CX power domain to GCC clock controller for SM8250, SM8350,
SM8450, SM8550, SM8650, SM8750, Kaanapali, and QCS615.

Also enable the runtime PM in each of the GCC provider drivers.

The existing common GCC schema accepts the standard power-domains property,
so the bindings require no update.

Only Kaanapali requires a Fixes tag, as runtime PM support was not
available when the other platforms were upstreamed.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (16):
      clk: qcom: gcc-sm8250: Tie the CX power domain to controller
      clk: qcom: gcc-sm8350: Tie the CX power domain to controller
      clk: qcom: gcc-sm8450: Tie the CX power domain to controller
      clk: qcom: gcc-sm8550: Tie the CX power domain to controller
      clk: qcom: gcc-sm8650: Tie the CX power domain to controller
      clk: qcom: gcc-sm8750: Tie the CX power domain to controller
      clk: qcom: gcc-kaanapali: Tie the CX power domain to controller
      clk: qcom: gcc-qcs615: Tie the CX power domain to controller
      arm64: dts: qcom: sm8250: Add GCC CX power domain
      arm64: dts: qcom: sm8350: Add GCC CX power domain
      arm64: dts: qcom: sm8450: Add GCC CX power domain
      arm64: dts: qcom: sm8550: Add GCC CX power domain
      arm64: dts: qcom: sm8650: Add GCC CX power domain
      arm64: dts: qcom: sm8750: Add GCC CX power domain
      arm64: dts: qcom: kaanapali: Add GCC CX power domain
      arm64: dts: qcom: talos: Add GCC CX power domain

 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 ++
 arch/arm64/boot/dts/qcom/sm8250.dtsi    | 1 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi    | 1 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 1 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi    | 1 +
 arch/arm64/boot/dts/qcom/sm8650.dtsi    | 2 ++
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 2 ++
 arch/arm64/boot/dts/qcom/talos.dtsi     | 2 ++
 drivers/clk/qcom/gcc-kaanapali.c        | 1 +
 drivers/clk/qcom/gcc-qcs615.c           | 1 +
 drivers/clk/qcom/gcc-sm8250.c           | 1 +
 drivers/clk/qcom/gcc-sm8350.c           | 1 +
 drivers/clk/qcom/gcc-sm8450.c           | 1 +
 drivers/clk/qcom/gcc-sm8550.c           | 1 +
 drivers/clk/qcom/gcc-sm8650.c           | 1 +
 drivers/clk/qcom/gcc-sm8750.c           | 1 +
 16 files changed, 20 insertions(+)
---
base-commit: 5453bc3279e9f8578ac3e534d476240e40c879e1
change-id: 20260819-qcom-tie-cx-to-gcc-67e6697639b5

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

