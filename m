Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43872EED8
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 12:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788437283; cv=none; b=VN+S9TYCfdPPxXz0ceHGvc5VLwOpJTsw12GxPI0j0XsZ2uvVnyrRfjIKNIULpH2hJg9hwmwbmuL012OvV3fAVgI/+tX78WbHhNxalpxZgPM7kChC9Un1REKzLlZF64hWYvFc1ByOSr7+Xh4Uupjs1E20FwsC+pk0ZdvQolWf1YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788437283; c=relaxed/simple;
	bh=OP+XbkrKvhdzEtS2Nzr+E2RydGs0iGqKrwIXsdbjJzk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WrA0HfYbmeKpKzLGjg3OYWXGwNQNct9NaN3wXFklR27ZL+khr9Mb1hmv0KNjhxYrjPJvTr82mMgtYpRjCfp1jEGiDdwOcXaQtowCNrIsdSLwGLf1FjjhEOBSk8kW5Ne/jodOmNe9tKV5i/zktqj38tKJZGoxbnWfUWBkY66tlLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ObMIa5Vb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UuPNYGhC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ObMIa5Vb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UuPNYGhC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHMph327263
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 12:07:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bN6tSN+aPtqpUf90JfnT2a
	W8gJW9pIcKQbCnFR+yoLg=; b=ObMIa5VbSw7n+2UfAiBKGMCOAfIOiZvPQDTTE9
	jAgdkgpifz6Gq1L8ETy8tBSwkPcMRAEObls9AVAACgPDKV7yU0zkJbp1SQfNdj4P
	Lg8uL3Yd/WouLvksG7ROB3GLco2scb4a9RmJ0sXhfS1EdxD21K8mwTv0d/2vGE+g
	P+KANzQuDy6quTF4SRG9Uvrb04RXpVfYeX5IRgSnNzCPDnqhldMc8xL1EPXqE+00
	oWuijGFm9UlSJKQV9wGfTsUl0svkqKJovmoSwO1Kc5fM4bxZmS5JHoLR0gCjYC1M
	loxt7V248I7W+d198F4Q7Tb7OroWjCIFOw3b0k9IQGHmU1oA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekh4jb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 12:07:55 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-74748e3a5b6so1026955137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 05:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788437275; x=1789042075; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bN6tSN+aPtqpUf90JfnT2aW8gJW9pIcKQbCnFR+yoLg=;
        b=UuPNYGhCeoNxyouJgiM79dvwc5SwmsWXHkuBn3rZOaXTNK/RXnBnGxGl/DgIabzM+V
         h4w9OiepcA7UZebccmU/ob52eSmZlXD0PQ8pxm1WGRBsWrCufDKsBtE0d1+I2KZ6KJju
         3K3uNl2Axs1qP/TOs4c8S3pQvqv4JPi4WrYAC9w8SQdxz+dMh4ksUaVulocq90uTGMIn
         XdlNuPmZKTqZS0pfkOWDU1MQf4g+Fjh/b+/PYg0AHqE0B0b/iN3V4ACokox8yIlbHaGd
         x9gfZrA2C/LLvZQxQGCIOtJnwpcJl+kI0RNHUqM4PYMxzfMtMD37gIriPvgd6d51H6E0
         Mizg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788437275; x=1789042075;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bN6tSN+aPtqpUf90JfnT2aW8gJW9pIcKQbCnFR+yoLg=;
        b=pvq5yDkEtTNX8TjDuqv++rAr8k56Gq1obLWuDOtI3i/pJMzrQ112Gm9ZBQWU+rsR9c
         pr3O2DopwfHnXdJnMJvW9RmyhHuz3PmbwlUniY2N+WK2HgzTvFms4DuOQy1dqbRgbG/o
         U2dXm2y5ra+q38MwubgtERXcQojfhxC8WBvTxvFYfjTtB6/AM21rZoVZGgs3u5ZDzzkj
         2+iqTJP5P+6P+qZrlutHKdkrRrsFL3jKEfB4ry7TJsyaqU0H5jpS45GtbwrslQTn5urA
         eLtqcq6m6MQtY5lWYc1XshHL6aZn1txj/g2nMUjyGF691Z+xluJtKQjLEn2RzwWTtgfi
         ZK4g==
X-Gm-Message-State: AFuF++ndKO/8q41qwk9/iX7qgUVOfDCzLRcv7fzMcYuRh0KeVAiWgCfc
	istIG7LJqpwzadQ0Kn2ek2NKn33R7vP6cJW4ivqzr7tb9f8QZZDsgzrz5edB6y42T6wGBW9x0d1
	e/hoAH4vmtbcQ/5gMDhcsUZwn90/56OzhPzP/it58BVlahOla+obBvyNA9AcfGvyl+wNm8XZijZ
	OW
X-Gm-Gg: AYBFou2VB8TeytfNYf+TGRe5Zd8tdTfaCF46y4XHi6kLTK21rDgOAF2qa6Li8H7yr7B
	DJl6L0V7ueKKfTHSRkfv860Ns7xC3V89orsuKsvdEygC5SLdIyvP5NfrseyS884eBpm0AmFwmKX
	F2mNu5unjxSU0S+jT0QJPHGntCaInBQz4rwD2tfJKgse1iZ3T2g0xpaD7CwFIvSGSvVGuK/4dnb
	82QFoJbwzRxcNjIDGGIIPfiOm7NGfAndZjYMsEoFQS++TgVk+rA0JgXSVCEoZ1CsiP6NyTU30Ks
	3VNcFkADWePNGaV5cB9+giB0uInrx0x5IA34lQBOeHnVQ7TbWjb3kRQepDV9TvyGjEqaL4umL3Q
	WwwLNcSSy71f0H2cZxoTHPQZ+xY4g
X-Received: by 2002:a05:6102:1676:b0:785:6719:abb1 with SMTP id ada2fe7eead31-78a2ef7b044mr1146934137.11.1788437275138;
        Thu, 03 Sep 2026 05:07:55 -0700 (PDT)
X-Received: by 2002:a05:6102:1676:b0:785:6719:abb1 with SMTP id ada2fe7eead31-78a2ef7b044mr1146917137.11.1788437274689;
        Thu, 03 Sep 2026 05:07:54 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:1c7d:412b:f9d3:3bfc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d587csm72143115e9.4.2026.09.03.05.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:07:53 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 0/4] firmware: qcom: scm: simplify code by using classes
Date: Thu, 03 Sep 2026 14:07:41 +0200
Message-Id: <20260903-qcom-scm-code-shrink-v3-0-8237f3a654e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA1jmWoC/4XNQQ7CIBAF0Ks0rJ0GaGnFlfcwLpCCJVqwjBJN0
 7tLu3KhcTPJn/x5MxE00Rkku2Ii0SSHLvgcqk1BdK/82YDrciac8oa2lMGowwCoB9ChM4B9dP4
 CWiprt7UQVduRfHqLxrrnyh6OOfcO7yG+1i+JLds/YGJAgXIrtKFcS6H2AbEcH+qa20OZB1ncx
 D+s6pfFs1WfVNtQ2Ugm7Bdrnuc3Qq0UBgsBAAA=
X-Change-ID: 20260701-qcom-scm-code-shrink-c9aff845537d
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1549;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=OP+XbkrKvhdzEtS2Nzr+E2RydGs0iGqKrwIXsdbjJzk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqmWMPRG0itmkcLTwf+h+TTUMv71qzPNpIN0LLK
 JyrPsZ/auCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCapljDwAKCRAFnS7L/zaE
 w61nD/4qVj5VSw9PVn5KqCT/C3QTd9WYlYLW3wQAYjpqSZ0ODPsl0RSdNNVHd03ynaapW1+IhtI
 EBjRGLEA9RCFGtvLhryvkn5knMQLcOfK7wOQrJZMOrZeYlyQ86DHvrhGEpOkn4tzTUuMUMJMQKH
 96aU5Tj3mkecIJwHoOEixlAKz/ug2u2naNHYrIA3Ry3peoVmyyoPb+8K0hSEnu0XQjdJMU7or8T
 uPcy9nxj5xT7muAGmYhn/sxzezh3jjePrbSE0yYGaOM6iN3PFMYUy/OeUdnrhEyRJez7evAos4v
 paEJaGQ0WePT6g0wiH/64Yq38JCcjl+yXexxia0v1gmQcuzNfZyfvKubbRES53U2rEY2+cx7qPW
 JPHlT41nAmg3oh/NKukB8qumahixuRKC6U1VebZBXH1tymLJe2ml2dZf5gzFIv/lUCvGxdlKJTn
 8k9xFG5PZfMc3grNsbFstu7GfrkUyT4hDJnrekNt227YORVDJr7BgWZ9dXbfZk+FSlnfWWFVsPP
 9v0hNaqpxFQuG6Wuq+waI/nFhpwqxcHRKUvmconTbb7s2+kBimUFkBXD8VoL3X538nHvqqdPE+S
 Ict5Jd9bN4uuyR92KZ/18YvmhldPQUDrRkfo5aS9Tcj9XYx8ocELS5oPnRh3crBcK+ZXV6s5rVH
 yUtEPiK2+dQE/AQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: tV1CEAS6ZnixcBX548_kYI90LT-XpeBP
X-Proofpoint-GUID: tV1CEAS6ZnixcBX548_kYI90LT-XpeBP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEwNSBTYWx0ZWRfXyRaH1EzIoow2
 o58rTizD/5pNPQyQ25LJHDaTnbGLZBQJcs2+m+QdWRQ4oMa2+6wdy2/oGl6mjJXHXLOMj/0Wrf4
 +e2ZI3bVgPadlluBN4FefsGs4UFIgEk2MrawSrBSbMUNdgMu8COkbLyVz4Iaw4xRnGVFCmSPuOz
 +kTl+7QPN60OGJkIVRtQ8Wkg/7us4FtHnf/ZG4EdEw+pZkuMyaOlrhw+slFnuedMvLvKSawjjxp
 x+hCBmd3hZpmVN76VDHzrDpnFoOWnzQuBRJqHOtxilcEno/Uey6UL76+tbM2iDEtXat3qaFSvvk
 d8I4fHY0Cw2ju8YYBr8uRlIirvhVkiMhx3qxfefkSJ4ghqaz8sPJQ/XX9iLPFOlxZBU50PPL0cQ
 79JdJW1o999FRDG0XcrRuSuBkYBP3qPQycDAgs017kZpLIISF/tkxt78xy6PCq6BwNM11HbB9KZ
 u2/QjSKG1M+Nn6Gt8Gg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEwNSBTYWx0ZWRfX28k45f/Z4GCZ
 3ajH7bKuh8f0QUQwTq1yWpEXYfjiFm3OtelRIO02MxE6eXmaMCo+qtl6VuGia1e+WpNXgwUpJNs
 PMDAiItIk2yJPpqYjjHUl/sqidzXlKM=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a99631b cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=5l7mOxLdhVSCUz1tciwA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030105

There's a pattern of enabling the clocks and/or setting the bandwith
limits before performing an SCM call and reverting the above after it's
node. In all places it's done unconditionally and can be simplified by
providing appropriate classes. There are also a few places where we can
use __free() for tzmem pointers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v3:
- Change the naming for clk and bw guards to be more descriptive of
  their function
- Link to v2: https://patch.msgid.link/20260731-qcom-scm-code-shrink-v2-0-4ba76096915f@oss.qualcomm.com

Changes in v2:
- Rabase on top of recent SCM driver changes which introduced conflicts
- Collect tags
- Link to v1: https://patch.msgid.link/20260701-qcom-scm-code-shrink-v1-0-02f5ce02c95a@oss.qualcomm.com

---
Bartosz Golaszewski (4):
      firmware: qcom: tzmem: guard against IS_ERR() in the cleanup handler
      firmware: qcom: scm: use __free(qcom_tzmem) to simplify cleanup
      firmware: qcom: scm: introduce qcom_scm_clk class for clock management
      firmware: qcom: scm: introduce qcom_scm_bw class for bandwidth management

 drivers/firmware/qcom/qcom_scm.c         | 185 ++++++++++++-------------------
 include/linux/firmware/qcom/qcom_tzmem.h |   2 +-
 2 files changed, 73 insertions(+), 114 deletions(-)
---
base-commit: 32b6ef9a5d0eca44f9cd91f52f4faa89f145a0de
change-id: 20260701-qcom-scm-code-shrink-c9aff845537d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

