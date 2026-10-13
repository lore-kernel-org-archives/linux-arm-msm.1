Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701294DA553
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 11:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889399; cv=none; b=o15Wz0S0IkfzB8salTYRojKjp/RkIlFoQBqknH3xda8eoV85/AOH6326baQB/7PxACDI8+NZk0RvC9ZyPkcfMGm5V/8xfzvf5nHTl32ilJJ4Q+b05un2saULZd31G38EYLcyvm82t4+31fK09c5sji0InBTWq76QkO4Vg8m24IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889399; c=relaxed/simple;
	bh=6H+aGiCzjsBk27LHmns2O/FIfdjtGutwnkI8cppe2iY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EyBZruf4StJRMK9WgNS5SdASMpIlm/gkQ5Ct+WOdjLU/67UfBnvk1T/5ZxRz+pfv9HHNc6FIwhRrug7zXcHsokO/J5y6ipielT+HSve6KI/9KW2A+ZGjuUgtKJaB0vPubZEGtLgabxFklVJI5NUcDPuYBLAXb4t4ea8j/YmJsgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JTt9QWb1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iZx/gM/m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JTt9QWb1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iZx/gM/m"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D9439a483019
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 11:03:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Uvn+YeykKtCQvYU2gbPylW
	MWTN+hqEcgHyy2To2P0bw=; b=JTt9QWb1zHiqYacKGePayq9Htd4fwYdnRmUEHW
	KZeBIKGUQfNjJyrF4JbCIhtuGA6ZMkHuAXDCTdGhuIs05Fwfo7PG9wOd0MYCDgyt
	JlyZLTz3Al788vVJHuZhyy/MhoTL+QZXRfG4lJ7fMh2xIQtFFcySicQA2QldauTZ
	OqjJSNtca4EvkU/UKF93qpBle1lXyk/uMCJ9bw3wJ+mGMZB5iz2yoGNNn/ufJDzp
	OkyXw5ZgqndofMcWQ0rP7ElqMqpIy4gXzwn2O3OoJ+0cZP6PbyuZ9JZBg3dReenD
	2ZuQpkazKCVpRmjUb984ipnaQVgeupwYjaQyra4T8xEf44Bw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hpg8gsd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 11:03:15 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc73895c7d5so3364047a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 04:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791889395; x=1792494195; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Uvn+YeykKtCQvYU2gbPylWMWTN+hqEcgHyy2To2P0bw=;
        b=iZx/gM/mdeFbgX0VN5gDd7RzX826mUSrGr5Wug5yskFL7lYkq2s4eJKq22D8X+t9aV
         r7J3IbmFGbIhE7X0FkLqHaZGziQ+BlZomBgxOgA7d3tlExqvbvCekAXSAHRT+MdyhNZX
         qti3cwZKBkmQo578Df3oZj5IG3rBBTHmR++9uPnJQOcZ5rjBxleLc9jcQsqzX2E5uJh1
         oDlidQcmTpyAB48b1L6ePIMB+yy4lIAqvn4oPJVhus8m/AtrRyTINddzcw+MkaKeRqwQ
         VrrhfcMotlbGWcwlnID/bMTLxwO+enVgIy+frdGmSDb9vKAmhgkoH/uVrOftvo4cQakn
         6cbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791889395; x=1792494195;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Uvn+YeykKtCQvYU2gbPylWMWTN+hqEcgHyy2To2P0bw=;
        b=yjm4v+PhaNTFFVOVJFcN7lnACXpcjiurW4IXK/4tPKJZGXYvkM8364tSUMSOqLEI5K
         /aLF3Q4i6155/BakyWKHQ3/Zuu0FPtoi3z3xjqdJsY/8Cis15hkt/Nw7l7f/Ygx/IGYY
         xcnqXH52pO+JTyGlhi5d8qInckMT5vvRfMjd/mZGP5teVsdfmLhW+dRCjwYz9WyzRxR8
         IrfMghpSPFabPm3ZTClg0cB2j1CycuoUMeRg5Z4757WAbyjYYHNl2/dwmAcs8rvLenRS
         KTjyhObl/0zhMRg1OFY0zdW7kfEPPE819xZtVjlPVcUP1yjDlbKkYutWDNL3tiTtUvIm
         oXyw==
X-Forwarded-Encrypted: i=1; AKwUvBxhmK2NkoknspzDXVfSxvGw+6OVa6v+00ClenlsheWI9M8byEngsFmqfEKi+ey6PmhZJswVZTMnWYSULkfF@vger.kernel.org
X-Gm-Message-State: AFq9FYKAomAMekpR1q4cPTIwvLYL6hY5s1Uzu76864dLtz4QDyOSjGTJ
	JMOx2zqeVunHlqh8NrHq0iBm8KY1hbafPn61bCXjmM0CySef4zJxeALfe39zOaD/D/vc+j+c+fa
	Kp9eGFr2uIiVE7Mml/xIZT1FasUzYjFiCKbvtlTiznvzCX1E81xA67jCwfu8M5CJhrQEy
X-Gm-Gg: AYBFou1sVpxOhunEyaTK9x8lMUKxi1gO/YcocAr/k/9IWHcFPL4oX894kNV5KmBE018
	qj/pcvDAdCeO/sHOtwAruvhHuLFsBR2v82oxWXQVJGjGJ73xQ9t2EP9TtnYXnQ1pIXQdUhNF88z
	urHQaPgkArfJrVF+ZvT0apM06nDoNYJEYD0tGM5l05S5WI0q648HdWEbE6HGWv0ipkjw64enEYc
	ySrMzMJW8ZUQJvDesAiTtE3ugZsOvyYvwdwHX9ztEsbMP3klFuA8GyTqlh7RVDtUVHfNoa6EsI5
	cg8gu3Et+Lg4P35TyGMqOT5pbbRiOBheRGOPLap4FGr+SWx+pBgACLaYqVvDB9UE2XiYvHmjBjA
	MonzfuEaye2QOoEsh4vFYp88eytBhrik=
X-Received: by 2002:a17:90b:53d0:b0:3a0:ca1d:b40d with SMTP id 98e67ed59e1d1-3ab3ae2c5c6mr10825285a91.55.1791889394380;
        Tue, 13 Oct 2026 04:03:14 -0700 (PDT)
X-Received: by 2002:a17:90b:53d0:b0:3a0:ca1d:b40d with SMTP id 98e67ed59e1d1-3ab3ae2c5c6mr10825240a91.55.1791889393918;
        Tue, 13 Oct 2026 04:03:13 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36f46dfesm20808403a91.8.2026.10.13.04.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:03:13 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v2 0/8] Add CAMSS support for Qualcomm Hawi and Maili
Date: Tue, 13 Oct 2026 16:32:42 +0530
Message-Id: <20261013-hawi-maili-camss-v2-0-fc93222da89c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANIPzmoC/31SQW4bMQz8iuFzNyAlSqRy6j+KHEiKqheI48brp
 C2C/L1ycnIOvQgYScPhkPO23+K8xra/373tz/G6buvpaYL0bbf3gz79jGXtE+8TpAot5eWgv9f
 lqOvjurget22x0p2yAkRP+0n7dY6x/vko+eNh4sO6XU7nvx8Kr3i9/U+xV1xgcTOjFCVTjO+nb
 bt7ftFHPx2Pd/PYP7x/ipzj+WW2e/lU2ptusVw/rZf7HYWlItU6QbfEndm9GCdybVlqdHDGXvJ
 Hv3rxw3R5v6sIMkKFbbQSqSEOaGbB0crQkqtnj9z4lmWZWHsFJy4jQy4GFM6VCQMGWplFShG4Z
 akWDCxeapOeKZVo3FwQxijUqiCL5kr2pcMp0xu0ADMRK6iDEWmA1KZAXBO2SWu3rOv7KJoIfMq
 KEjcyL86eg4qiEM4zvkyj1BgDIBVsQlEtd605J45wjOHdBNtcEN6yXBLymG2YwMicq2ZxspGsT
 lOdy8SZTG9ZOCwD50Y11UpdUERgmhvUfbD3MrOAGeWWxUNZmzfAUTW0k/dxLSEheQbIp1VQ9S8
 ztIqWcK5Ys1UucxjDUNCDYQbOglKjFtFm0N7/AZzZtGsfAwAA
X-Change-ID: 20260923-hawi-maili-camss-b5dc43a00ed2
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791889386; l=5178;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=6H+aGiCzjsBk27LHmns2O/FIfdjtGutwnkI8cppe2iY=;
 b=KzdVaVmiBW4HGgh7sekITbprntJxsxB2wkFM3FwHc3iD7lN10Ted5B0omNXuJ2QqHG/Y5qYR5
 68vMF88tf1FB8dJZwu01srjlDeLrmICe3kjJP+1cX+o0wz5rgCN5Z4V
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: l5wtF1kEYvXV8-yhI9ef7XHvw5UjLwjI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfX/a5P1W4Sp55o
 tEG/fjLq0A/BfaWek91cIqgth5hfvalZoEDzBWwGAZCIAbkwATPYPnJKEbberhp8FoXeXPoVoso
 3XBEjpo57EpdbNkWC6eAv4n99E+S5kE=
X-Proofpoint-ORIG-GUID: l5wtF1kEYvXV8-yhI9ef7XHvw5UjLwjI
X-Authority-Analysis: v=2.4 cv=Z4Z5j3RA c=1 sm=1 tr=0 ts=6ace0ff3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=E40xv7DK0V-5u9Ck0vwA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfX1uT7wOlyvMgH
 O4CoicFcIsyojCjY4PMRoAR26Ij7sDCTQYlIGp1GzBstzjA1X1MwqqqGdFpDNbvbtrT7qDEDMBQ
 ON02+putgKUAGQg4XVIWc45bn11i4aY9/xzzbAO78a/emFQg0ZhX7OPAewjT1kb2jKXWNNCDSHq
 tnZvM5d2FMOCMBC+yR+xlQ7UNPoV1KwswbcwRZyMa2P0dMgpBR1ejdoE1uOgLXIX5wKOBnUw3Pz
 EZo+vLdmGY7/aMt54btHKJuSorCa4A9glWkPdVmVvPCVU1cVE98OkxhShtST3ntmLPv/ljCu84n
 tRppKk3a10jzVRrzegU6bHpp05EGZRDQ6NyIzMLil4hQJqwJTHuCRVh3uG4u5kYaY2ppeis92Ec
 Z3ww1VkUbp/7bX8EUEuP51foVvg6RYb0zPYj4U9aQVlqUX9zNZVZ8C1hYrlQyG6p4zJdBzA5RWY
 mezjKPoekLI+7MfBshA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130043

Hawi and Maili are recently announced Qualcomm Snapdragon SoCs [1].
This series adds Camera Subsystem (CAMSS) support for the Qualcomm
Hawi and Maili SoC's.

[1] https://www.qualcomm.com/smartphones/products/8-series/snapdragon-8-elite-gen-6-mobile-platform

Hawi's camera hardware topology:
- 6x CSIPHY (CSI Physical Layer)
- 3x TPG (Test Pattern Generator)
- 3x CSID (CSI Decoder)
- 2x CSID Lite
- 3x VFE (Video Front End), 5 RDI per VFE
- 2x VFE Lite, 4 RDI per VFE Lite

Maili shares the same IP as Hawi. The only difference is Hawi has 6 CSIPHY
while Maili has 5.

Used following tools for the sanity check of these changes.
- make -j32 W=1
- checkpatch.pl
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=i2c/qcom,i2c-cci.yaml dt_binding_check
- make DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=media/qcom,hawi-camss.yaml dt_binding_check W=1
- make CHECK_DTBS=y W=1 dtbs

Dependencies
------------
[1] https://lore.kernel.org/all/20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com/ -- Kaanapali CAMSS driver and bindings

Patch grouping
------------
I2C CCI bindings part for maintainer Loic/Robert/Andi (1):
[1] dt-bindings: i2c: qcom,i2c-cci: Add Hawi compatible

PHY driver part for maintainer Vinod Koul (2):
[2] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Hawi and Maili compatibles
[5] phy: qcom-mipi-csi2: Add Hawi support

CAMSS driver and DTS part for maintainer Bryan O'Donoghue (5):
[3] dt-bindings: media: Add CAMSS device for Hawi
[4] dt-bindings: media: Add CAMSS device for Maili
[6] media: qcom: camss: Add Hawi compatible camss driver
[7] media: qcom: camss: csid: Add support for CSID 1190
[8] media: qcom: camss: vfe: Add support for VFE 1190

---
Changes in v2:
- Not an RFC anymore
- Rebase on next-20261012 and drop the external CSI2 PHY series dependency. 
- Drop DTS patches; they will be posted separately with Maili DTS dependency.
- Collect Reviewed-by from Konrad, Abel, Bryan
- Split CSID and VFE 1190 into individual files rather than in separate
  combined Gen4 files - bod
- Remove reduandant is_lite condition in CAMSS CSID and VFE resources - bod
- Replace bias-pull-up and bias-pull-down with bias-disable for the
  SCL/SDA pins of CCI nodes in TLMM, as internal weak pull is inproper
  with existing board level pull up resistors - Loic
- Drop the unused reg_update_after_csid_config flag
- Add lane count fallback path for CSID RX configuration
- Add Hawi DPHY support by tuning register table, which prevents
  potential stream stalls and SMMU faults.
- Add a standalone Hawi CSI2 PHY compatible and make Maili fall back to it.
- Resolve conflicts introduced by Glymur in CSI2 PHY binding.
- Link to v1: https://lore.kernel.org/r/20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

---
Hangxiang Ma (6):
      dt-bindings: i2c: qcom,i2c-cci: Add Hawi compatible
      dt-bindings: media: Add CAMSS device for Hawi
      phy: qcom-mipi-csi2: Add Hawi support
      media: qcom: camss: Add Hawi compatible camss driver
      media: qcom: camss: csid: Add support for CSID 1190
      media: qcom: camss: vfe: Add support for VFE 1190

Nihal Kumar Gupta (2):
      dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Hawi and Maili compatibles
      dt-bindings: media: Add CAMSS device for Maili

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
 .../devicetree/bindings/media/qcom,hawi-camss.yaml | 310 ++++++++++++++++
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       |   5 +
 drivers/media/platform/qcom/camss/Makefile         |   2 +
 .../media/platform/qcom/camss/camss-csid-1190.c    | 395 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.h     |   1 +
 drivers/media/platform/qcom/camss/camss-vfe-1190.c | 200 +++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss-vfe.h      |   1 +
 drivers/media/platform/qcom/camss/camss.c          | 248 +++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 136 +++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |   1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |   1 +
 14 files changed, 1305 insertions(+)
---
base-commit: 4eb2586bd40db27d77cc5b724ca9386ed0c71d53
change-id: 20260923-hawi-maili-camss-b5dc43a00ed2
prerequisite-patch-id: 6108fea87bf95e2911f09bbe7e95fa536c3ce397
prerequisite-patch-id: b347ad60c475f3035b04ec76741e0f1b5f095580
prerequisite-patch-id: aa51e15c5698d3425e979c810ff54968178a364b
prerequisite-patch-id: 660cd909e0bb88b51af7114f0869a0476219a369
prerequisite-patch-id: 4f08f5a240caa58a4794bc5c7c3e45a18415a1e3
prerequisite-patch-id: 56eff00251984e6b3da63327eec1efcdb8194ef1
prerequisite-patch-id: c8217f219b80f3736a38c4bf2b6681d75a3834ba
prerequisite-patch-id: 1fb30739462664d8188801aff4dcf7cd55341318
prerequisite-patch-id: 7fa7a9c901f6aead4cdf94628e83b42c58a0aacb
prerequisite-patch-id: b61b21bf9a3b675479fb181ce7034ebe42949ee9

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

