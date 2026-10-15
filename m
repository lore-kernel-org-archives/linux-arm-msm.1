Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E0851E432
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 13:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071332; cv=none; b=bWPoCCYnMUenxLWBUGCMXvrCanV4ACfeWY3tUDvdU7jNRDDUncZYG9PtmECpLom6PVduTehw1Ap3rgiCPDeIm6poQJzaY3dh5D0TaiRK1ehths3Oz8nElVfhKKma2SyrlqO8ZbXpXdoKZWJN7e1pVbBZJ4ilh9usumigrRN71ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071332; c=relaxed/simple;
	bh=p7BPGS1LXtvuUc8w2G9p04MnVlzpfe4Yci0/HvoooT0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c8X7GtZl9AiIZhbAeqYlW35xbikFDRGZZDdw0fKG1YkPMU6DVCpWHKnQIKvkqYtwMb3+j/Zs0Z4blfII4wKgd/O0Fp82D9oxH2rgbhI/b7OgR1ZEWk3eyKDqmAYGtmaoO1IoqKhayou63+H2oDYjLqqQa4MR90Voljozywygbzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BUQEN9I/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UmSHyMR1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BUQEN9I/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UmSHyMR1"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jn6V3408836
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 13:35:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AkNLjViojIdmORaj0ULI3j
	aSXfiWIQ2kdr4Wgh24Tkk=; b=BUQEN9I/OYuMHAn4lw8BpOZnumnaEbzNkS+Unk
	YZ26B4kJdPlDzxy+mew88p/SSQ0Qvk1PywOEHlnf/ioa9ravUM3znnWStSOMTa1a
	Eqrm2FnFq9vuAk7KbtIvHbbLw+DAGbf1GDnq0IcboswlZ0/ouoixb3yvLwnacxmY
	ByOWjZ4YyEGi4qaYoW5WomXxqH/Mgho+XDDyt0XvOO1K9s04XIL6gMWs+9gStz+l
	o/ElFok7aaU6Fldq8OoQyku0wmEpNpQxXSUfcDysI+DS3LpfRr9dtSAnuVDq4RLg
	X+S8ZDxRU7kWEvzlWyv7s8UsseY3VcDpy+pBe3CjhfGtkyjw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn2yyb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 13:35:30 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-88bbc27f85cso7139033b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 06:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792071329; x=1792676129; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AkNLjViojIdmORaj0ULI3jaSXfiWIQ2kdr4Wgh24Tkk=;
        b=UmSHyMR1EqULHjRF8Byq9L26Gbv2UHCBpARQqzKSodCM+pihd9ANMbP9p/Nbrfdac9
         6H/0sD+WoezqEwLsPuxqFrDQzsPtMjNvQDPILp5WT/kyjD+t08VmfMqIHEBqfmIuckNH
         ysNum1Crot5+Ga329dPAlZDgMRKkxW4Kobzplp40N1wxSCLYKHigNnVJ80F0lcBtNalS
         mnG0lqvT8vXwvvLbSVBdTdK6TyzIkvuVq/YFobtva38oNuc18gGNGjBzvqPCQUIQNPeX
         eBUCxk6VlFbha51WHAAtnYRY9RCpqvs/MLsuOULtfwWwDJTF2+y2IJuaAeihIkjxjz8q
         9aEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792071329; x=1792676129;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AkNLjViojIdmORaj0ULI3jaSXfiWIQ2kdr4Wgh24Tkk=;
        b=1ON8/zDCUeQyvR8n2K6Fw4ELfP1u6MSesbViy3hWvoOYC7iezBk1GZeJJI3DJWW80X
         ZcZy6pumoV6bHKqBrhxk/oxXHcjKWQV1PLe0YIgq747F05WP3+6+qDaj2rIaZ9zfw5SV
         7AtFm6SuomwT9Y+rdxkSUBJnKzcOzuuW1gboj4I1Z4w0FEE/hCnhGNLLQp8uutLCZSSx
         wRw6SWjWKmdgReyi53XQhSPr0oXJv/TO5CRp8MjGoAn/jZZo7cqITmU1NrrqRGb1zLfX
         qQBm03kHgJUfD+9DJm+XiUKTGq1wHvFE0c0C3EArPjGnAeIc0d6089n0rTKB+ZoKU3jY
         8plA==
X-Forwarded-Encrypted: i=1; AKwUvBzXd/8ZusnJ2eB741kfVd3DSvCeGPmqqsd5/kRf6H1UuIt1dLl9SQwc3lZxhRDm7jPYzlk6mlZRjxixIJNA@vger.kernel.org
X-Gm-Message-State: AFq9FYK6TNp59jYvye4I6tYlVa+SRo8oXbZIzXAMCXg/KKqTTEsd6Fjr
	xXIBgIhbFEE7nei0n0fCfLOV2I8zQmZZw1KpoBrHvbzLlA3i0cVFel7l4jzvVwVLRsGC5kF+haq
	MAOVhD9ZkNO7vLc9Y1mVh0yRez6aZndCravPt7MGEsyfE4RGM8q4yxQrjegbCTXuj85r9OCIrRL
	LC
X-Gm-Gg: AYBFou0FN7KF9Qg80C4L5xR6fstMlH5i4rGU1dlyx3uv6CtNZ/E83LMG9dAGMBi99j8
	aVpG695QhPsUKUhDnK920II8XmyOWARs6WDjslYfgdsqGi6vYR+8f3+U8ixqIUjU+rTiVt8NCaH
	8PdkQUI0l8KS2z3RAMFWUpOvkEdfkWTk2whZeUWyAh/NFxcxyxdPNxoq3GBgODM96TK2LUxJg4M
	iDwZZ6Ag4wDzO9M+QibxCsQNgzlz5e9cyPU6i3/Hh1QB+SRYca77PMzRmpkO7UBpRscg92zeAYy
	T9JiyX720EstTiuqOkN1QuQOfFxhOjN0YvyPYpEQ66pkzSr34fAloDlzh02Avmo6OpKCmeCJHJo
	ueHeF8yOcBBpPWIRcfqEwAGIGvd0/Fg==
X-Received: by 2002:a05:6a00:9503:b0:89d:7d72:3433 with SMTP id d2e1a72fcca58-89d7d724361mr5473465b3a.21.1792071329376;
        Thu, 15 Oct 2026 06:35:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:9503:b0:89d:7d72:3433 with SMTP id d2e1a72fcca58-89d7d724361mr5473440b3a.21.1792071328933;
        Thu, 15 Oct 2026 06:35:28 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89ec1705f5dsm476617b3a.53.2026.10.15.06.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 06:35:28 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH 0/4] clk: qcom: Add support for Glymur AV1E clock
 controller
Date: Thu, 15 Oct 2026 19:05:00 +0530
Message-Id: <20261015-glymur-av1ecc-v1-0-448a476d54af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAITW0GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0Nj3fScytzSIt3EMsPU5GRdc1Mjo5RU81STVDNTJaCegqLUtMwKsHn
 RsbW1ALRlwV1fAAAA
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
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NCBTYWx0ZWRfXzKNuiS9QUTqW
 yXKCOePsD+jXY2QzFYOw0c69IYwUjf1QybdZQiAKmCVlOvQOA4zpEkQMobcHgBchLzLbb1AFUiU
 kztGuiCMp/lv9RjbmIn8WO6sYg9gYrY4Q9MjVONowa1mW2gnq4h+yqic0bpF5MS/E9uiha3vyZK
 5t+EwWfcx/fkB0f1X5CbnfhvzdJJYzc697nKwVa9C0KPDMgvAAil7qJ8XgyW+VNApXAYG/JvUl4
 f5qvyTr5Mcl/iu7Vycs1I0IAkflIGR/x6eID+czwzbyedbBAwbuReccKqZ93B4NMDesDGtYGk7t
 sVn4TGHjItM9C3XyUoedwigfKccVmWKyIinIiEM72exLhY+WgcOoSXpPXUPlmGJKCDzdlkuTMA8
 J61yTAQOjYx+jKnf40tudsgTxItYDq4aO4SemczpavVIZTrx9ysEneymFDc4emDXxw3a9IIz4bz
 qfaAa/Ytt6q4KG1ioBA==
X-Proofpoint-GUID: O4JG2pYlqP9eN0rw0AuYfrmX-IsXGsxr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NCBTYWx0ZWRfX/ac4K0bewiVg
 kaASMz+FctTHNRD8k+3ddmHa+tGMCMwpgcpjC+s5wCYclJ812EG5VXR+15Pd2+ROpmzXOFKD5KS
 MFkCF4zeBqaTOhvKKpBomdUDmviIm9I=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad0d6a2 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=JZxBUJHeOsY6iHg-7A4A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: O4JG2pYlqP9eN0rw0AuYfrmX-IsXGsxr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150054

Add support for Video AV1 encoder clock controller (AV1ECC)
on Qualcomm Glymur platform.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
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
base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
change-id: 20261013-glymur-av1ecc-7522de7e4e65

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

