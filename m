Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC523E4C94
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 04:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789705744; cv=none; b=sHOrEJsiKlJhrziIzkCpSOIibuNV+1203Rf98oYmB4VDAK8zJS6tA7Bya6MBODvCfBxk7uUknRsZPFh8GgSLbLow5krqd0jv6lQzO/xBL9zJNA2GaINkrWueSWYcx4zxS6LDUUunEs1r+Jck/qdt9sFV49TRtUYozBLBWY2O+MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789705744; c=relaxed/simple;
	bh=fkshNoOWORxcvxgu+mHBvzKLk1LKeo0M93slrqpG66Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TbpD927x+dVd1qrH/xh4NpAgFYS7cpPrHZkz6VJ3kh4zAfH/3XCepGpMY0z71T+PIz34V1O36F4FY0yhZgKqwxTfmsO1r/HAD6S8haVHVZ2MPvDbHsCSA+4iKSl2DLVAdTAmrgBGplKd0+/7umzYStIAjXXGJDW0zLEGjDW14RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i2B7M7XQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fyhUATJU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i2B7M7XQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fyhUATJU"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I2UjdQ3761696
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 04:29:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YQYMUwldQNeOArNPJiMgPQ
	AymRC/XtF2MwaCIThFuCM=; b=i2B7M7XQQCYESnmSdWoJdsNEwlz4cj3YndyRxa
	kCgNFmUx/m8eVUSkGYQcSk7giLievmqA1RXX3fIp3oUy6Rc4tb6fLnOHEFr+QXJf
	cEWr5ZrjgSfoOy6yZzIGuH9aV+J4fVosBOSkZWPdz2/1ch23U+mBjukSaOsAHsE/
	cdnAAVbH2AFf8kbSGxg3E1vHhp9TyBGrltEuzx3lQ6KQpqiFA0BfHThoKOPIVejY
	w1ksgBb7EDsYIPXTwuUsO5aUTntw/DWHdB+/fRKjD6kp94KPID2GnzvCG9cKILwa
	ECIIJ1sHmvMs6b+vEKWsm7Oour26p+DEAWNXbEjLBVVtRm+w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grnqea2hp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 04:29:01 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc435388657so406160a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 21:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789705741; x=1790310541; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YQYMUwldQNeOArNPJiMgPQAymRC/XtF2MwaCIThFuCM=;
        b=fyhUATJUZH+F2/im/IogqbnuVlNKptjuYKxvZ9iMUq7UD2NFOvTA2uRGI9ishXCmxt
         E+lsQBKhPZ1/1IPgs4PcasuF6Eztp7PEWzGydeMoDyYLnWFRNfl9tNSxG18Xu+9PiTDf
         dWs4Rg7kiIAoLTDpGf/vWP6ni03G7YsqdRA0y/4xeLQgtwc41zMpgrTKIHfT1Udwnjzo
         9PqFEg9+ZnlPAEIxzvkR6QaNdvTnkHTVm5g3MsMi/imhrp0wBrcjrSS4bR20hIW8icvT
         ka73g82ZEzBlq/F+1qmBJQ05a3Yk632PMqgDRRGZQgEcAIA7UQnF9sZAA/zdDxuRRkfB
         N9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789705741; x=1790310541;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YQYMUwldQNeOArNPJiMgPQAymRC/XtF2MwaCIThFuCM=;
        b=ku41Mb5xb3/DTAf43BMi0Yfse/hFVMMr/ZBKySElSE9YLtOGPn4L1omiVzAxiwpeM4
         iYj+Vwa3GAvK3H/Eti0Rqq/lDQIrjJ8u/sKtIXZdegTGmVbLM+x4j3rE7TqJa1iATNcX
         6/GCJYDvoEDdNlni5l/Jf2/+rUKOIaVZJPdHwgGrAD2RTAUNvcl6kKIhSsuaZAuSahTU
         uk309UV88Fb5URyQz2wxNUDhPvjkIGcf4XDhyrb6QlPKyozfg38ypWX13S9qHLmK3Rc0
         A1I04YD6BW99PRaSbWrEcJpa1UZM0YfRtteA0QSGkqXyS+h/Z324yPT0JoflLeddtm4z
         Gdgw==
X-Gm-Message-State: AFuF++mAeG7EaUFcMSwcjcioQ+8vSe44c/B5cwbgNv2IQ+h3AedN2ZaI
	VYKMiUf4Z5aMB2TZne5uQwx8pUYNnOLlt1VQkCcPxhcvEFgqJ/6WeaiA6w4FdrbDiFBbN+0hvbF
	WbKBe4e/Gkdy6BnPzxdkYp5v89fJX1KWPqbDHU6pNwFwHA9u9mVmyKotRouuv6lbHzEkn
X-Gm-Gg: AYBFou122WjExiHeH9HvHj1l/VqkKYIX4Wgj9VkUgsJJIMscimhNHmKN6JKF+HQoLxn
	Auwg6832ss9fzjqZ2+5z12GeWnMjPuzAkjpPZ03wBaQDElodtu5bMe/VUFmgbANDlawPGHxn+Rs
	mQsoh0LZ2zSgKWTf/EMzMeELZd7f4/WdoIUePoBnpLB5zou0KucAgWO6YB0cIiwjKkt2D3/ZBcO
	gK4biGsXDvT1fq2jCgNwO0sUM9tHVFju+WRGux871TO6DrDNhOuMLVB4tbgHilvQCsiPSQetYLT
	PdzzXMjKg7dnQyb1SshcdqbO9thy8Yl19WxpA59pOfhpFTq/+HqkdO1StsE/CR/lzaXQo5NqlYh
	AvsDaiFtFyHEhPTUHKxpqepbA3obdSGY=
X-Received: by 2002:a05:6a21:b8b:b0:3d0:6c90:5a33 with SMTP id adf61e73a8af0-3dd8c3fdeeamr3090693637.4.1789705740832;
        Thu, 17 Sep 2026 21:29:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:b8b:b0:3d0:6c90:5a33 with SMTP id adf61e73a8af0-3dd8c3fdeeamr3090653637.4.1789705740435;
        Thu, 17 Sep 2026 21:29:00 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5c4dba322sm214595a12.10.2026.09.17.21.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 21:28:59 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH 0/6] media: iris: add support for hawi platform
Date: Fri, 18 Sep 2026 12:28:39 +0800
Message-Id: <20260918-add_iris_for_hawi-v1-0-ac60fd15c98b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPi9rGoC/y2O0YrCMBBFf6XkeSNJOiZtn/yPRcqkmeiAbTWxX
 UH8d1Pdlwtn4J65T5EpMWXRVU+RaOXM81RA/1RiOON0IsmhsDDKWNXqRmIIPSfOfZxTf8Y/lr5
 uKICjaCKI0rsmivz4OH+PX050W4r6/j0Kj5nkMI8j37uK7N4hWECPjavjnjDWAzZGe0ugtLUOo
 DXBbuqRcsbPpq76XwRyvS49F9mWK5ZNU7jwdJIrSCVb3yoH6OoB9GHOeXdb8LK93pUQx9frDYw
 vXDACAQAA
X-Change-ID: 20260918-add_iris_for_hawi-b38ed47ef2f4
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789705735; l=3209;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=fkshNoOWORxcvxgu+mHBvzKLk1LKeo0M93slrqpG66Y=;
 b=dSxM/5fhj3haOh/4yq1Xy27O407JZTsrp/i6769SprQXpCrNFNL/0dsKM5ovTxG1LzMk/ukJa
 r35Ks89FEpcCbTAKyX3vSZDz3ImHAnSk71ho51og2rspnzNXwiv8sbL
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: M0HAd6acbPecKcbKBMh5cYgYlduFTv1r
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6aacbe0d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RPeHkEnTs8eby-NZ5DgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: M0HAd6acbPecKcbKBMh5cYgYlduFTv1r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDA1NiBTYWx0ZWRfX1dOJH88UgE3S
 mJPHI3qGxKMobSiWnehxl/5dcvhTvP9QLf7KdoZ5atkhqR1Fv/9lWJWw5JkhQVZEznKD2nSc6gd
 Nr+qys+m52JLTfoUC8JOImUJiSXNZoE2NMLWMRM8dDPIMzJq3Rp58xMiOoJPFaJyyCsWu00Goye
 kUU+OkRw07MwQhT0lQ1mSAiGPWTWCQAAzHz4czl7Sq+8lRb5z2p0vOkGU9jh6IRNmHLj0TOO1xY
 Ltrr3gS/LRLYTaBvolVE05MEGeSswCwirUQPK3zRVyxY003IxWlj2ZMJFvJVD7ydQHS+dG2SL57
 BquilMRnpRmV9kXwGjfTabVDjnuPNBmDMCJjb2V1ixhn2xScJgqHNZjgcSl2Eo35zlj+aFvnMXI
 E8pogez5gDCXk/C+dnchYjCb0SiWaGFarmUVGGQGJu1h92RKwW0HdlzkytM7/fijxFpBsT0Ac3H
 iGcOH/MRVT+IdBTe5QQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDA1NiBTYWx0ZWRfX3BBoL1DE9EYQ
 Kz8x6NPCnBQBMt21PAhPZFNKglClxONUwP+OJ0PpMO9gj4FT8JweXrddWSJHEvwVVkrw83UZA8D
 84KED+7sbbFzYxFR+aLdN0okevhZybM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180056

This series enables the Iris video codec on hawi, allowing hawi to
use hardware‑accelerated video encoding and decoding.

Hawi brings in the new generation of video IP i.e iris5. When
compared to the previous generation, iris4, it has,
- additional power domains for internal NoC(cx & mm).
- additional clock for internal NoC(cx_iface).
- additional power domain and clock for apv codec.
- different reset lines.

fluster result:
H.264:
Ran 77/135 tests successfully

H.265:
Ran 139/147 tests successfully

VP9:
Ran 235/305 tests successfully

Dependency:
https://lore.kernel.org/linux-media/20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com/

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
Wangao Wang (6):
      dt-bindings: media: venus,common: relax clock/power-domain/iommu limits for Hawi
      dt-bindings: media: qcom,hawi-iris: Add Hawi video codec
      media: iris: move shared APV PM helpers to iris_vpu_common
      media: iris: add VPU5x hardware ops
      media: iris: add VPU5x internal buffer size calculations
      media: iris: add hawi platform data

 .../devicetree/bindings/media/qcom,hawi-iris.yaml  | 262 +++++++++
 .../bindings/media/qcom,venus-common.yaml          |  13 +-
 drivers/media/platform/qcom/iris/Makefile          |   2 +
 .../platform/qcom/iris/iris_platform_common.h      |  10 +
 .../media/platform/qcom/iris/iris_platform_hawi.h  |  48 ++
 .../media/platform/qcom/iris/iris_platform_vpu5.c  |  86 +++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 109 +---
 drivers/media/platform/qcom/iris/iris_vpu5x.c      | 588 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  93 ++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |   5 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  91 ++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   5 +
 .../platform/qcom/iris/iris_vpu_register_defines.h |  14 +
 14 files changed, 1218 insertions(+), 112 deletions(-)
---
base-commit: e657a464aba873f5eaf3ca821b6e4016674492d6
change-id: 20260918-add_iris_for_hawi-b38ed47ef2f4
prerequisite-message-id: 20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com
prerequisite-patch-id: e1330b5a848460d14cd6574877fcf607d269d9a1
prerequisite-patch-id: 20d099e89443a097b9ec5b297f0129d9874ca54b
prerequisite-patch-id: 2a36ab03d78d8e9c19c900e203b05739a9fd1123
prerequisite-patch-id: 9e326a273e052af2b63300dd20f2fd6cc78dd5ac
prerequisite-patch-id: bb9ca73889bfca249029efb854fb1634a4360b5c
prerequisite-patch-id: 9e71460e2d5f1e4e2993819f4d9fa27c076946f1
prerequisite-patch-id: a2b127d41c7133ea30721a72eca01333334844f7
prerequisite-patch-id: e34741f76b6919db19236ead27c966b789736e66
prerequisite-patch-id: 359d24229ad496633892e70b1cf88c2d88dfad24
prerequisite-patch-id: 6e2e9069cb620143aa305b7b29b8b1982dd0648b
prerequisite-patch-id: 3e5fe6ef2271be5263a4bf7ffbd77b0996037b27
prerequisite-patch-id: e051524017c9f39f8593fb9d2e982e6a4c39fb35
prerequisite-patch-id: 1b4863f7a7f3a8390c825d76805e8e99de97a2a7

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>

