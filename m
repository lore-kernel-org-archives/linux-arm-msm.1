Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477394137BD
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375415; cv=none; b=JF1IeXxNMVqhqfJjxHUA7WfTFkbKXdkf25ONgTwYZeyPiEviPFRrUggxC9vahBy3iIugNcVxlU3uDt5TNj8bJQhkikSjXZ6ySjArEMn3qg7EH06nO3egmZ9n/psp0StLAXFyQS20QmbLg21zU0Snu3CPjUYjgVamsl1HS7psVvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375415; c=relaxed/simple;
	bh=nr+Ex8WrN5Wz7qxFW5WrMSh2JP60oS1cFwUmSfg+KVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UvuzHhElUfmlLrUrQYZ5+gdDoTQWrNFaJYl+Rb9WMq4lnHSuwPylbHASSWSzt4ixxQttugrcpZwS8EQ8OfeO+vBgh+l7KRc+YbLMS2HJ+wX/6Wj7PkwjuudHse/Yv2HCIWu/1KPIy9HeOYzVLlnsi9tOW2dWa2VncUNgNcNhXsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FuwUcd7B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NIBGekcu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FuwUcd7B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NIBGekcu"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jPjK3842778
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=OwxBcHpn3cvKvhr1gRO42X2uan+SBqo736M
	PnhZ2lSQ=; b=FuwUcd7Bm7ncNaKvvBUxpXOUtTbRGeim2+yATkF93Ngn/NA1Q9I
	R9W7CZbui9nzybwiRomKdi0fX3wm3B2bYWR+QCsu5r83raydU0rD0/V7qG1vNt/o
	g5xG6oMCi9CbvzPdZhH8zsFCp2C9aMDBdTSsJNae7sQH/uaYkwd+1seGbfUjzB73
	67FKjmDvITQtM27tJCQkFGQtJdP9trEh71WLGg/HhC1fBvEuAji8W7qIXkZahWq8
	VpDZBs6cs+MKjbqu3iCCrIMyLBAE5DN0VEkEVglYFFySg7fGB0PwSTqevTEs5JUB
	wAm47JU5YZ6bdTgaL3r8+KTC2MvfS2UamcA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c5sn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:43:23 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca8aee88725so4624898a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 01:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789375403; x=1789980203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OwxBcHpn3cvKvhr1gRO42X2uan+SBqo736MPnhZ2lSQ=;
        b=NIBGekcuxwrvUcbGI3+5KtCOC2J8udkVi5B+lop3a9v6gGWGUGriK8rMkJqvLDRFcW
         GQ7uXVBfjwl6JoU3lMadkAVJ95NLd/6DxAP75jlxBCRv39YHShS8DvXcro6UQhH5p7pB
         NBRe3ISjeXev6lAjjlz7XGiMX7BIqGEDO6iYe8jvZXyUo/+a2kKC/wf640rtwZDni28V
         4d45KHwZ0PPD4lbmIQqcways7jate1VngntKYLV1PimiWxsHOoUk8yyv2fQl+wrBTvbc
         F3wO4rl/fmmPAlugDrEuOMMi/lH95PH0NjxP0Q4RY9G3PN2C5Wg4cz2/tNuT5lOhmNot
         HDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789375403; x=1789980203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OwxBcHpn3cvKvhr1gRO42X2uan+SBqo736MPnhZ2lSQ=;
        b=T8VGvbbUKfuHV+a83PTK4IXhjCYgSLUOtxpxh0kwVAEVQZn6wpBeewS6lo8p/BXjpR
         T1Du6/OmFbQKHJd5LuLlV64FMs7PHPyrJO0e55hU2TyTisqG+gkLjo2YJCcBIFXT+IIZ
         OJvTJ5Myut3MhkOQoM2tZikyf+EWswUuxZAXYvclOnLRumF3CZZKIWkbEd0VazX5krjn
         /V+yaz4FFofVFbHlMNAfYax74QWs3rTzJoc39UtWCqD1fhvVOKZ5wjPw90qRfF9gPJSv
         uFBgbVIw+H0rlqhhid1uPArMFSB+4Db9dtYDq2YBHsEe30nLodiec6utSb9Xb+lOjpbP
         Yyow==
X-Gm-Message-State: AFuF++mWJJgao+69MOtkJDf4bIa5fBVdRtVNPY15jJLetN/6RhQy0gKX
	G7QfGm9ff1B9mDdJSmPJzNSFQwQc8oydT7XdPR33gQcBoc2/wV7Lq9bbkre7uwkenrk4qg1mHEY
	TAmu0MUexDOdJnAZh6bEFRyWPg0Y5jCbuC61AlJ+sbEV1qITLF1fNuWPDeVfQxwWGCV59
X-Gm-Gg: AYBFou3ITiqPwyCAhtI9Ntuh5ptCoF+ZBah32u5+zcAqFgTOT6T0hkZwbYm3MBcAVgu
	3qAmTpivOyrK2VdsfXfgYGfPgq92oiGVA3NqbX64+aAOdHNSlJnYs5l1G/YzrBHPC90iEg+EQfG
	HLUuG5la/9ibGBpjCrZelDV+OkMi2GtF2u9ZnqvJwLVisJdoQ4iyahT33wSFZosaKk5mO3bHgvy
	WjNcnN4Vb0KDnydKz0tCMwZhNC+QjVLBRv6wtNabECF88mtKYPFhrXh3IzlBhZImu0D1LfMiXRc
	pq9tJNN3OU2HoT/HIH1ngU3apRSLxo307PqDLxY14PEf1Aj+cvPi9tfGYCbUH8PfT9FpV30Agg0
	KyWzr9zf04QE7OY4AIlWUroPMRdo=
X-Received: by 2002:a17:90b:3e4f:b0:398:9be8:ea64 with SMTP id 98e67ed59e1d1-39dec0bf7a4mr4171807a91.17.1789375402762;
        Mon, 14 Sep 2026 01:43:22 -0700 (PDT)
X-Received: by 2002:a17:90b:3e4f:b0:398:9be8:ea64 with SMTP id 98e67ed59e1d1-39dec0bf7a4mr4171730a91.17.1789375402241;
        Mon, 14 Sep 2026 01:43:22 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b97994sm44692673c88.12.2026.09.14.01.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:43:21 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v5 0/2] remoteproc: Hawi CDSP support with per-PD proxy performance states
Date: Mon, 14 Sep 2026 14:13:10 +0530
Message-ID: <20260914084312.3812408-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BBrztW-k1JE1je1w8m1t3bPikF76JC88
X-Proofpoint-GUID: BBrztW-k1JE1je1w8m1t3bPikF76JC88
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa7b3ab cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=rQWQmZZn-rtmdnU4JWkA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyMSBTYWx0ZWRfX7FRIUSo5OwWc
 mGQy3FrFhBTLHca+qRNzXsvbLmCSgvZrmC+ql8oSm6R/y6wX6xt+FyZOcQJiq3hvJObTcvSeSG/
 8najzxkWh5RuEyZUFRWLaRzz3MdID03MbJd+EWp0qaQNI8Mx0RsPz5mGLvT41HzuI9bLaAYMC+z
 4a2fPF3HN3lgJtQ28UIf6iNQVJPr5X8s21x7XrCDbPS3cl26BXBypqBjKLc9inXpvsweK2+SxgH
 hkc3e01R9I8j/vAQtd5Qty/cDcoiM26vw05nw4bDQ/3eeEccED6b28Qbo0Z6+Nz2+PzTX+/TVM8
 58mGYmhNC2o+vejjNbtrERLzE1reLwnhf2fLbMfpN+g20W6rAuoitEAbciYzbx9mckMZuCG92RY
 RVVD4BD/NLk36xtNdYyaKJ9DdxzaphmVHndo08kADhFsp4sxkqg6fnUot0tFP4+UWDy4RUHNTlk
 wnvixU4US2Psm9/QbIQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyMSBTYWx0ZWRfX8TbH1OFK+KWY
 kQtSbKIM/Dlp0uq1JQ5/ZRZ/wpa1YUO1lh7Fwx6aTRwaaoAjUhTsNNQ60iW2ULfzlcIre4Ud0Yb
 hwIYnvk2DnH6BtDBo6na1O0T+ZASqro=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140121

qcom,hawi-cdsp-pas was initially grouped as a fallback to
qcom,sm8550-cdsp-pas on the assumption of hardware-level compatibility.
Bringup revealed that the NSP proxy power domain on Hawi requires a
specific RPMH performance level that the sm8550 driver data does not
provide, breaking the compatibility contract the fallback string implies.
Maili CDSP shares the same NSP power domain topology as Hawi and must
fall back to qcom,hawi-cdsp-pas rather than qcom,sm8550-cdsp-pas to
inherit the correct cx/mxc/nsp power-domain constraint.

Remove qcom,hawi-cdsp-pas from the sm8550-cdsp-pas fallback items block,
add it to the standalone compatible enum, and extend the existing
cx/mxc/nsp power-domain constraint to cover it explicitly. Move
qcom,maili-cdsp-pas from the sm8550-cdsp-pas fallback to a new
hawi-cdsp-pas fallback items block; it is covered by the hawi
cx/mxc/nsp constraint implicitly via the contains check.

This series should be applied on top of 
https://lore.kernel.org/lkml/20260805132129.2713174-1-mukesh.ojha@oss.qualcomm.com/
to avoid merge conflict.

---
Changes in v5:
 - Replaced WARN with dev_err as per review comment.
 - Link to v4: https://lore.kernel.org/lkml/20260910150638.3270162-1-mukesh.ojha@oss.qualcomm.com/

Changes in v4:
 - Dropped 1/3 patches from the series as that seems unnecessary.
 - Added maili cdsp pas as fallback to hawi cdsp pas.
 - Added Tested-by tag.
 - Link to v3: https://lore.kernel.org/lkml/20260909105049.1317985-1-mukesh.ojha@oss.qualcomm.com/

Changes in v3:
 - Converted warn into failure in 1/3 as per review.
 - Added R-b tag.
 - Link to v2:
   https://lore.kernel.org/lkml/20260902204334.2061226-1-mukesh.ojha@oss.qualcomm.com/

Changes in v2:
  - Propagating the err dev_pm_genpd_set_performance_state() as a
    separate commit.
  - Added a binding correction for hawi as it  should be
    standalone one instead of falling back to sm8550.
  - Add num_proxy_pd_performance_states count field with a
    WARN_ON in
    probe to catch mismatch between the array size and the actual
proxy
    PD count at boot time, returning -EINVAL if they diverge.
  - [v1]
    https://lore.kernel.org/lkml/20260828181311.4038346-3-mukesh.ojha@oss.qualcomm.com/

Mukesh Ojha (2):
  dt-bindings: remoteproc: qcom,sm8550-pas: make qcom,hawi-cdsp-pas
    standalone
  remoteproc: qcom_q6v5_pas: add per-PD proxy performance states for
    Hawi CDSP

 .../bindings/remoteproc/qcom,sm8550-pas.yaml  |  8 ++-
 drivers/remoteproc/qcom_q6v5_pas.c            | 49 ++++++++++++++++++-
 2 files changed, 54 insertions(+), 3 deletions(-)

-- 
2.55.0

