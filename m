Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793768915;
	b=BXEKyk11FSkEFm9cAoqZal4FF7Lcirvn8h/G5/9neF0ZugVcm9Iwh9l2IJsQdu8ZExlH
	 DAbU17eNFzTxjbzgFPvbPoKQ5+L1L7lX9PkLTfH0zlpQa4NE5JT0e+zjHKJ/xjuQZHwsi
	 UFI+4pJtUdCJi/Jv76WBlX3SQvI0UlprVb7W7Li9goPmnyRO3Tlt//yDM/kfEQP1dJTXo
	 zQWcFZglNk5omyKi8SmuoJYN+hYSAA2t+36pgvl3qR0GM/Ph+Xtq44v0xLekekhqHM9eN
	 1mrt8GkHNUFihqfbr18oAbX7FBGLGlf/kjNF11RrIkRHvWslVwqd1rZGYDkAokTZYvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793768915;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nwK1MVA9UCwz5756RDh+kT/5Gn+aYpD6Nw0j4KwOfYE=;
	b=2koMaBW5B7cLEbyY+xtv2/S67io5MRHuOfmWUMgpF1Yp0trD9PS7Wjq7ump52feO2aTr
	 fulLuzpO8MEB0Vd3VrVUzl3fPC/eKIjQrmA4qHGEUEHP/GpfKrGeGaGp13nbQ2MZBjTG9
	 Pl7bIlwNVbtLZ262ojiYEdaxN9BzY2g+fRmtDWgp5JMi5KItWvWIG567CE02mGQQeY7Ye
	 b2n7IMg0HJ2paM7UYI7A4JgBFs94YNdZbNPBQEYXjGDA/70eipG+cQfNP7NEHMXMyVQgf
	 Zs6iiW2UYnPfwzP9m/E38sX7DY+2fkFXVI1ohmevSbDzo+V5teJFxioyLncCEVPA5Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l49cRqF+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aqI6ATul;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59248606A31B
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 05:08:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59248606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l49cRqF+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aqI6ATul
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RFjD838281
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 05:08:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nwK1MVA9UCwz5756RDh+kT
	/5Gn+aYpD6Nw0j4KwOfYE=; b=l49cRqF+4xbbkWwZgLE2bW3VTcobyp7uvlEDi1
	yDEMEwT9d00k1aGQR2ak38exx1wGV7uqTIZKOIZdSR61sooEQ7uSlJkt5EWJWzsq
	SuQ/v9lP30wDavM4Qdl9VsHWmmKdtnL9iaL/aBqvAjAPETgRXgXKVtFVoKTMuvXO
	CBCozjlpoin9xUtHNd4/uXI/3pAmiQDOvMNYLeGVK10UKyKiKNnAxTkwY0aNlqrJ
	BVyhZarudSm71vtGMJzQNVvlDtJofU1VYujqUZRsmim1HgGqNH4DXkNjPKmmFO0s
	qtzlWC+A2OfU1cYsaWY1SqBUSrnm+dyQlcMnG5oGMZjng60A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8mt31f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 05:08:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3aed1b64104so592189a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 21:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793768912; x=1794373712; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nwK1MVA9UCwz5756RDh+kT/5Gn+aYpD6Nw0j4KwOfYE=;
        b=aqI6ATul4fNkxNNTs75ytyRgjjHOEK30aOk243zPIdKIwnMpHSuGTD93l60w9Qi+X2
         VufXsZZy7ZyKvYEJ2KikaNW3WutGi8BMe1OBhInpYN9AjgOLPXzUDcwQN/Zr9pOWSmYJ
         6C4+NAmsWr7539UkDLnRh0SydcWQFVtylyM23q+aufOF250wAuBdpySEIZXbTXKC5msM
         YNU3i6R7SxXkZIUPPmP+WU+WrinkfzsBjZ6tk95zkqadj/78mqVE3czXAlatwvI9jNYf
         D+icL1M3l01nkIyzcwauF7QAlXKzUiWbwXADt4GlznkZiOxvoTxTB9YV9ejtwlobKgzQ
         RQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793768912; x=1794373712;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nwK1MVA9UCwz5756RDh+kT/5Gn+aYpD6Nw0j4KwOfYE=;
        b=LEUJtIKKWy3cx7MP5rtElBB60JjAOSkT7YKSSvM0Hhl4zbrgxComLTI32fJbpyHp+z
         cbBjcw+kmL6kM2AlT4isMaDhRoWMhwcYuPjkUQ4Ub8v6h8LMtvuw/T7D2QUp9NMgWbix
         yEzkJoMxJNrHJQPaFt+FPc+km4eQ+0ZHfGnMMg3s1x+6QJjL2jRW4ZxO3kX9TeZDGcRz
         fxE41++6dLxLugj+E6Y++CekFc43iB0JBWr12YVPxwSZNPpIJyRkKgfpsBAu4Y087LbO
         giKRk5QiMANXBuuSa9Y/Kjyp+KNQWqiZ+czUYMO0JIwWG+YYMAmFMSluWlaMKcDkpTxy
         8iLQ==
X-Forwarded-Encrypted: i=1; AKwUvBypNDc1s1cQwPFjUxXAW5xbyrXoPDdaAhds2/hIlXtFBfMWJRoXNQp0atBvG86QxVVlbNBtkGzW5taxvpGm@vger.kernel.org
X-Gm-Message-State: APuU4Z/uqsMkyEMM1HGjxSKCKZAMqQoofNZ8E6JQaZoV1GRh0wZqhyGt
	bPJDueZDk0CiXHrydG4cA9KY5nh8QL2uzuVntEjq/Rvl7A2OxtGGH54c+e2KO81LEpYAFw3sZK5
	uy+WeRKT91csCvn6g4L0YCnl/Pkvd83vTKH8FHrgc4GALQrAbJ6wheKbS7Rhab+WkK303aJYggR
	Ir
X-Gm-Gg: AYBFou1O8VxpAsUH/klIbsPYmuXESVWo4IXdZ87jSiY2a2MEQhmWZznF62jwcKf9OLf
	aYiCD2ctADT90+I7QNNnjx3HuKK7aGIxXpWOVe88wBcv3bv6YRYwxlLGtfDjx6DY9VXISIBUcBC
	WyEnQhdCMyclZWUdqiX+GKPW9ZLn7WDjiq0dgs0wZbgde2I0gl2fQufxragGVpl4FuB0w1cONAy
	bGibDipzlDiLYLMQdEiBohnPDtLU58aD44H0n4ceWoUkX3K4NDpIaUaIoMnFC6Qn4Sce5tKldVx
	DKm1HlHm2O65jWOKhe/ZV4QgtBqKdGi3fAqAjlLj9fm3tVMaAdq2NDXky+c+BnfDqunpUCf4SsO
	nzYHsh3TGZ2S0KhRk/QRraH6mFHgBSbCr38fhb90vxcT5KUrN5JrqZofjvMJi/GPznAFsSLyHto
	Ygj8w=
X-Received: by 2002:a17:90b:534d:b0:3ac:ffb8:183b with SMTP id 98e67ed59e1d1-3ae898392e6mr12971728a91.51.1793768912000;
        Tue, 03 Nov 2026 21:08:32 -0800 (PST)
X-Received: by 2002:a17:90b:534d:b0:3ac:ffb8:183b with SMTP id 98e67ed59e1d1-3ae898392e6mr12971712a91.51.1793768911555;
        Tue, 03 Nov 2026 21:08:31 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b095314e85sm1830242a91.15.2026.11.03.21.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:08:31 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH v2 0/4] clk: qcom: Add support for Glymur AV1E clock
 controller
Date: Wed, 04 Nov 2026 10:37:32 +0530
Message-Id: <20261104-glymur-av1ecc-v2-0-7c25a73fe811@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAJS96moC/13MTQrDIBCG4auEWdeg1p/SVe9RshCdJEISW22kI
 Xj32kA33Qy8A9+zQ8LoMcG12SFi9smHpQY/NWBHswxIvKsNnHLFKDuTYdrmNRKTGVpLtOTcoUa
 BSkLdPCL2/n1496726NMrxO3gM/t+f5L8kzIjlAhxMUIrJ4XpbyGl9rmayYZ5buuBrpTyAUyOg
 g+xAAAA
X-Change-ID: 20261013-glymur-av1ecc-7522de7e4e65
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 3MLblkk1Y380IvTZYCIPcf5zbCLZ7wZW
X-Proofpoint-ORIG-GUID: 3MLblkk1Y380IvTZYCIPcf5zbCLZ7wZW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyMCBTYWx0ZWRfXyDepqJs4t3hn
 JdKBnhdd/dPvbISncE3NRcd5WtQFB4JWsNeQAXQnK8kj+sK3a1yAMbWJFoqoh0v/zLEurntV4Lq
 k7M/iAhWgVB4Kh4bDileBTRMvhrJFRYWm571oPAT6ZXk/dGKwvf4tnAzfKy6LFdT30FAx3PqmyK
 qLSX4rVtU41fb638Q2UXwudTpyDSwWVgfhVcwFFr4BlLZPvV9PtPPZ7AJYQIagLVCsFZA9bliaX
 amPO3ZtqVbSnTcEj20jqNHNt1yBk/NHVwHudvRaSlbCWNsFm0z06PrSWMKP3EZZ6q7p6SZyWMfx
 z4CZljNx9L6ilDfkdw/iZk5DReAkre6SOKR8bjgLr3PvL9Gxb6VFEcj/K4N1RmZM+V+OUTufVU9
 Sc1ebyqwvhDGQao55YjXeCwQ9PtRRPzxNZvI5ext9HLllSeo/ckbvPAWDzdeR6OINUV11Tj5DyM
 9MbQ9zH1PrKqfXGRLCg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyMCBTYWx0ZWRfX544tKanNi6+M
 InQbKrlSuo+4U8ENhHpQPPJ3maTpk4AHIBFIqft+12ilkOLbtcAMvzBgk3mgdmU12oSSZOYE8uO
 ggXOuh2RDlQ2tnmEBFee5nGtjQbyGLg=
X-Authority-Analysis: v=2.4 cv=HbWB3SE8 c=1 sm=1 tr=0 ts=6aeabdd1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JZxBUJHeOsY6iHg-7A4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040020

Add support for Video AV1 encoder clock controller (AV1ECC)
on Qualcomm Glymur platform.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Changes in v2:
- Rebased on latest linux-next & used clk_rcg2_ops for
  av1e_cc_av1e_xo_clk_src rcg. 
- Link to v1: https://lore.kernel.org/r/20261015-glymur-av1ecc-v1-0-448a476d54af@oss.qualcomm.com

---
Jagadeesh Kona (4):
      clk: qcom: gcc-glymur: Mark GCC AV1E AHB and XO clocks as critical
      dt-bindings: clock: qcom: Add AV1E clock controller on Glymur SoC
      clk: qcom: av1ecc-glymur: Add AV1E clock controller driver
      arm64: dts: qcom: glymur: Add support for AV1E clock controller

 .../bindings/clock/qcom,sm8450-videocc.yaml        |   2 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               |  16 +
 drivers/clk/qcom/Kconfig                           |  11 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/av1ecc-glymur.c                   | 393 +++++++++++++++++++++
 drivers/clk/qcom/gcc-glymur.c                      |  32 +-
 include/dt-bindings/clock/qcom,glymur-av1ecc.h     |  35 ++
 7 files changed, 460 insertions(+), 30 deletions(-)
---
base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
change-id: 20261013-glymur-av1ecc-7522de7e4e65

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

