Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EB03F8237
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 09:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787131940; cv=none; b=d7EqimcD2Z/RbFnXqHnS4NG9uQ1+7uOXkr9XJ6QfxvT3knKKbMa+9V4GaRarpVo10yY/NEgugK+zHMGYalnJ7Awd0eCE14mOaQVbuPXtiDqNW3hyBeFJpV7ecJbHUf9dHDY1hI5598n1l13vPfahx6ZamoaJI+JhcuuaBX1BACA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787131940; c=relaxed/simple;
	bh=Dny+RyY3KCk6QKMt3V0eqBv+pyXgn2zC1F6QFIIgFCs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SlV/LNymGvUziuTecsMaKvTFb7FyeAG/aK8ptyGv4KyhxC7J1XySSx5Y3R1/2lyY11qztDPKaJdkvwrF0u66I5nw34aKPbLkO6Ju/WF6iwJqCyK8VKcyax37t5znnSvV6+6NGUfBuorZLvSlRS2nqPN5W25CjOUCqHG9Z9B1Dug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O/YMjsTy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KvOlxFwa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O/YMjsTy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KvOlxFwa"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J6ZCOl4012533
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 09:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QEG01RTtqXCwd0jf8aNVkVVQzTpHS4N2f1Y
	pFitP50g=; b=O/YMjsTymSto4WIklKqrPyoxllrtwSFJpY7EiG8Wkvv2WAwfC8p
	3AoGE8faUDRF1kcKcxbF7AKI/nxJinPC5sIAUhDERsxA0urFLWF/Yi0S6mp+a8WO
	jZGWzyJj61A0pAeDkwhuTbRBwzo0RjD3nK9NxKHQvLC5nTZ2AVo+uBF471hcFQ4S
	9joyt8s3evsCX0l+GQx0OKYwXQMcsmVMm3kr5/NelurBQj9JUk1QYyxGhLtTN+Xa
	lrO0yZK4GIrMwF47GV7PKOlP8q/ZRGh+mHIMwxYEBepbI7difInlxJrDjt2qNsRx
	ux/pdR+xxkS2SHPA/uS9wFyb3nDUfzwoIjg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfmaecr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 09:32:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a23afcbso11550501cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 02:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787131936; x=1787736736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QEG01RTtqXCwd0jf8aNVkVVQzTpHS4N2f1YpFitP50g=;
        b=KvOlxFwa4Vh0WZdL48PW5QHzwsb6+5AjnbtKH7AOvB6Ockdwsvk3ZpBSK48IxqDJGZ
         wTigjW6JWvX1/8iYs6zST6Vil0G5Ba2K+1g/AVV/pwm2Jpa2M+mJcKc/A8ie/Y++31AL
         5NNM1j5EQFXbF7dxbTeqq359r2nMrxnv+yIFn1Xy7+s8NbxJe0MjIrQTykIJF5ZCudMY
         SlzjZ5a2u7ik0/0UJMdQpDKv99q+KE6aiukp0wGJPO3MXWlOdSbhx8yUk7N5ri+jLwD/
         6XtBpVyyPVod+1ogd/Qv7vujyn1AxNI76uy10v+aLe/kWm8UWl23JuNeg6UHyl3OGUPj
         S7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787131936; x=1787736736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QEG01RTtqXCwd0jf8aNVkVVQzTpHS4N2f1YpFitP50g=;
        b=CaRg1OIW2vmsYm0oxiQ3Vyk94OdgGPbAIdH3eE5/lcwkp0COi6wWs+EP2DzRicvK/w
         m7XMn6Ii1y23/sOMYf/3JWEPwnLB6rGsuPOErwhW50GFoGwpkbO7sJ821HUztXu5cit2
         hIP/itKBky6GZM7lwvmH1PJXl8QWH7F3nTTGUDEx7mY/7ZGvqi6G9ciPWWA/l0Vdszbp
         fRdfmHRFppVzVcRbsquf7LqBaQKSILqW+IY+QWw4py7Y28rTA+LfSEG0QNnTxRDTMWk1
         8kDWHTUN6wkCCdisCGLcWteXAw9eDOVIIOXP5rsqjedU5J+rOtiMfjorexc+sXqOHAHh
         KAaQ==
X-Forwarded-Encrypted: i=1; AHgh+RoEX+IiOnRJaH3fGm+YIL6YlSbTpRii5LDm+lvVlnZPzCy+QcQNBvlSoJwUXAiRNT2UeCGDpqDAkNce3WD2@vger.kernel.org
X-Gm-Message-State: AOJu0YyumK82zbeeudeefIcxFNYrZn7NBSzwWy9RFInppTkI8NKRx4f0
	Bs5VuthakLDTY32SCtti1uxlmvwtIUadZ4ExXls2paxCfhh5eHR48x7eBw0BoXeVA7Lli6ywjS1
	4gXdGN06pfWbaEJFEpNnzN14lOvY5sm4piLwrjmf982gZyA/2yHwUkuT9mr8Ux3Bxjv1o
X-Gm-Gg: AR+sD13GoT+kd50PmJHKLUFvYUa5YIlhteSOUpTK8ZwT+CvQli02IGvo/BhlGyKYj1Z
	ltlYcgjSWaz9cYIg4cnbW5gKYefXp+MlHWwNs29McLeFUzVqDaVR5lyb89LSyTIsosKUp2/EJHv
	gymbHRybr8SYBXIwUQcL+SnhD3lHjds25EasyA9I37L3hg3FIffpSs3erclj5zlcTNkKKSVSUUm
	zDQcSPC9yzCJNYSDep7ZwKDD6TI21OAZpGnzAtsz6IxCsRtjSWzOsZBS7jVNyM+CYeUvUHZAIlX
	XR1wqFP32Txe1F7nF8WCiGSlu177Bl17t+A0Y4RATohaQWfAjljIm/eyCAxrgcAe/txEsrheGYt
	FTxDqCompfUbNV5AWOdbbNOBW
X-Received: by 2002:a05:622a:309:b0:52d:6afd:7d9c with SMTP id d75a77b69052e-52dd5c7ffa0mr28372111cf.29.1787131936174;
        Wed, 19 Aug 2026 02:32:16 -0700 (PDT)
X-Received: by 2002:a05:622a:309:b0:52d:6afd:7d9c with SMTP id d75a77b69052e-52dd5c7ffa0mr28371651cf.29.1787131935691;
        Wed, 19 Aug 2026 02:32:15 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14b8050sm4402835f8f.19.2026.08.19.02.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 02:32:15 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Add Qualcomm CAMNOC ICC provider
Date: Wed, 19 Aug 2026 12:32:08 +0300
Message-Id: <20260819093211.1436275-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: UYKsuSbQ64CJ53to5x_fnHVIreK82-Fm
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA3MiBTYWx0ZWRfX5l9P1mAT0iZ9
 FsyeVxBXU4GoqYBE/e7tvcf7tFswfsNjgvUhgjBNSYqv3lUQk6R3Ve+RS1dVtF1oA7WMQrodIIe
 nUDDDQ9IFUgFJqCH4GeRxPJhIH5DY6Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA3MiBTYWx0ZWRfX79WqspDy5UtG
 TJ/t3PrVT1PmskzmnRUGDo9BOAn+WWbHgYyV7nwX8T64r50ZyJEGbSwdgvFIYgq1cRS7AGzLND8
 y2CV+xZ63DXB5w+w7X0lk2O/N+DiRtpLgW9YMBISgYYYoNyQhgjjP3ZGi+Uf8/8APqIfK4eaqnM
 lx6z6l1/V1hbgefj29PA84n8Ls80b++49mIjYetEdALiOA33UVioyFhn79qur4qeEnbb817AIX4
 k/JE1D8PcwKXqOGwXkpbbBlE9UkhGeSqMlmQC9OG8Gsyv/tBBVpiJUIY/SXzffOJpY+LSjVTai4
 S+LIczYt0CegAi9bGWkreOMFPkmOipJs53Cm9R9oLQnRXZwdVqsf3HAyjgEktHUu/l61/jRE3cH
 hJSsf+VkBhzrWkL46+OP0W8zx2VN9FDZa2GCF5DhqBNQbSKbeN/baqfLVFr5a4gyBw2oQfe+W+R
 +VZOP1vmLLI4KDY5hYQ==
X-Authority-Analysis: v=2.4 cv=aNrAb79m c=1 sm=1 tr=0 ts=6a857821 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=hRO0oj0PTDvf3us77KIA:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: UYKsuSbQ64CJ53to5x_fnHVIreK82-Fm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190072

This series adds a device tree binding and driver for the Qualcomm
Camera Network-on-Chip (CAMNOC) interconnect provider for SM8250.

CAMNOC is the internal AXI interconnect within the camera subsystem.
Multiple camera sub-devices (IFE, JPEG, BPS, IPE, etc.) share
CAM_CC_CAMNOC_AXI_CLK. Direct clk_set_rate() calls from each consumer
cause a last-writer-wins race. This series introduces a lightweight ICC
provider that aggregates bandwidth votes from all consumers and applies
a single clk_set_rate() call.

Changes since v1:
- dt-bindings: add all SM8250 CAMNOC master port IDs to qcom,camnoc.h
  (IFE 0/1, IFE Lite 0-4, BPS, IPE 0/1, JPEG, JPEG DMA, CDM, FD, SBI,
  ICP) with a short comment per group (Dmitry Baryshkov)
- dt-bindings: add IFE simple consumer example alongside the JPEG
  OPP-based example; clarify opp-hz and opp-peak-kBps semantics in
  comments; fix maintainer email; align provider node name with DTS
- driver: register all SM8250 CAMNOC master nodes

Atanas Filipov (3):
  dt-bindings: interconnect: Add Qualcomm CAMNOC ICC binding
  interconnect: qcom: Add CAMNOC interconnect provider driver
  arm64: dts: qcom: sm8250: Add CAMNOC ICC provider node

 .../bindings/interconnect/qcom,camnoc.yaml    | 124 ++++++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |   8 +
 drivers/interconnect/qcom/Kconfig             |  10 +
 drivers/interconnect/qcom/Makefile            |   2 +
 drivers/interconnect/qcom/qcom-camnoc.c       | 279 ++++++++++++++++++
 .../dt-bindings/interconnect/qcom,camnoc.h    |  52 ++++
 6 files changed, 475 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,camnoc.yaml
 create mode 100644 drivers/interconnect/qcom/qcom-camnoc.c
 create mode 100644 include/dt-bindings/interconnect/qcom,camnoc.h


base-commit: 9e970952a9503d6ab471a2fea4c10b6a2785406f
-- 
2.34.1

