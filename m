Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33228396B70
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 02:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784600443; cv=none; b=iJ7Be3Yf0bQLOX1wpmcKZdFWJW0EeHnqqeHK7m+F82yA5Mvh8k5JeA+DycRuWPswGQ5O/NKoEW2jIAoymgihL/HRK4M9NOGQQwAlDimW9yq/00yb5nNaq2zaVMtC4VPBDq0/Jzn3p1ThuhYLTnWCGUcZrBJWgPA/YRtjzHUh6Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784600443; c=relaxed/simple;
	bh=iwFvchubbplrBbnNj0mAwm4NbMU3t1jTzwIydZu1Ex0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Dmvn8OgCgD7ysShwtd8yCdb6Vz+8e8s/xfvWpuyqisdxBCnszQKrkd0UcQl+kSyykAWJBeZ9xsomkObHLE+yTa5SpagLGfVqNLTmhihi8R/CtyH1PepLbcNjr9knzQQlT7nW3fBUEEWuU1KI7J/Ej2EnA/vLQqGGirh1Q1jUsMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D5d0J6xs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kqqtX7Ck; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D5d0J6xs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kqqtX7Ck"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNCUOs045396
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 02:20:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=p61/RZLjYzmP5+a9xwm2ds
	/dbK2qk1DvFh5tJPtswsw=; b=D5d0J6xsxieogeIT2Pj0tYBrsV+3bKvfU/el0t
	kDt7b+Fde8dplE/fDKWwRot1Vjy3tl+nHaLwjvDqrEjGBst9uOc5j9VOj+t1Bdmg
	0u9eDdUZQX/E2iBKwRdXUKJPpVc51TyYn0w/7XsHH9aUd/wNJDVnahE4S38SCana
	rHiutErqO+UQAY3JacFBk0+ZV05f8OZOXdgKeXNeW94tfS2F3FIcXwy1j6slUzEF
	/odgN4NpN86i5P3acD4C3D6zS3s4wfJBdfyRH0Js7o8TG7OdYGIYK8AMpMyVnrbE
	z/QU8O2L7//+BHctU0Duk7Pbaj/kx3yqxZ5LY3USZ3dbY0ng==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv5st8v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 02:20:41 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9667280edeso12395422a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 19:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784600441; x=1785205241; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=p61/RZLjYzmP5+a9xwm2ds/dbK2qk1DvFh5tJPtswsw=;
        b=kqqtX7CknqFMcBF+1j/4Oi1XxCENepsik8Qd5QB5D7+Po5dk134oEveZzNP0hHTfc7
         QLwyuyjLQtsGB38XMsFEYc9heAiifjY6zFVcjeYI7oMBGj8U/sSg4LUOmXuhwq/DZNHI
         7D4FJYqnKuUb7lbkkQ+XcbZ8YTRL61XUUR3oWjEzvSQieinvwUc24NtsPUhHq4I74b/c
         wp8elHBE3+vhwRzMBcUMplgSa8yGdr7PTp7N6t1oQfFyabKzbTsj/Qd1E3huAe6MJL4H
         3rOtXNt6PkBNAATQqawC8EDKJp+mcxMKCOQAQK2AVL17r3mDY1NiZYK1AVzqM4qCw8mC
         oHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784600441; x=1785205241;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p61/RZLjYzmP5+a9xwm2ds/dbK2qk1DvFh5tJPtswsw=;
        b=XhUCtnRQ/Ney9toX3Z1ZVnDrOVBqpU5I1/R68ew0kwni38GKBuxGZs6rbzFU0qhoI7
         /AF0rA6xNBVtVCocv79/RD5bYLRBqtWwxaGhwZ7+irLV7uGK2qukpaS8opwd3F+ag2EK
         2juZMj7s2LcEoVleWj/JzQTEhNV+BRJPhNOu3ojx/tkYT02LfTRJKuXrTpyaDTtEKmon
         BqqAoVWKZWC9Z6sz88bPuR6zt54uJ3M4J+HLNmyETynVqoLbCjMvNn+FRhs6oyjXB9YO
         EOXDvrQWMPrq4d5/aLgoBfZeYtftBNtXNYX2hjQ4Rwazyue0qeip1tQ4jq5UI9BXB6na
         f0Rw==
X-Forwarded-Encrypted: i=1; AHgh+RpuDwlKAS0yQk60adAYWhIe121VAWYJRl6kPpTEnVdc0+WM9Cm08NAvgB1j/IKkYoRQ+YhjSq7dIUtCAn1h@vger.kernel.org
X-Gm-Message-State: AOJu0YwxKOd4LPpr82swP61Ltba2yISwly5+NNlRgb52to8cNjdwyVD8
	Egb/x/sFBPNZTCnk8RRblLdbrHwkwrkceH/jezmGtdKSGVFdpnsKj1k4L4vAwVoFwlDZ6+fVGyt
	gMSoGJV/9KkozM8cjaDigPFfa/Sscw2YJ8UwLJ5zy6GKjps2lIAs7jpoRdJI/1QCddLTd
X-Gm-Gg: AfdE7cnd2I2u6UwRcRUlqN2rvirVlNoyP/09Ra5nvkUzpisfaC4P9U8FWBteSZjYy89
	zzsD2TO2ig5fEAaNPq3ZRlY2PsFV5rFvFeu6HDGw8qdZaJWtLacNVjTn66fE5SUQh6kfrooN9I1
	3iFvdA+Y5zyWs54Kfe/eKIhE13W+Qa8UAqeq/UYPRWMwi5HS0FB+EpfJCKzt1oulHOul06FWeoI
	lMMCpiFENOnAbLvFkN2vABiLNlpk35LDbTNIwLz+E2uwyXbxUOAmIteFlkefEIa6egmFivrGh94
	rMBBtJX8Zuw77+g0xkz6GOJf9SFlzhT3dxMrLwztjo9VE30ECbbKxL5gQt0dA/mx29kwPrI5EtH
	Yi04i00V0WXGJLKJBscEYI/HjMYhjbHjJIA==
X-Received: by 2002:a05:6a21:114c:b0:3a2:dc51:458 with SMTP id adf61e73a8af0-3c3ad8b30dcmr17441104637.41.1784600440619;
        Mon, 20 Jul 2026 19:20:40 -0700 (PDT)
X-Received: by 2002:a05:6a21:114c:b0:3a2:dc51:458 with SMTP id adf61e73a8af0-3c3ad8b30dcmr17441080637.41.1784600440177;
        Mon, 20 Jul 2026 19:20:40 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1de301sm41001457eec.24.2026.07.20.19.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 19:20:39 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: [PATCH v4 0/7] media: qcom: iris: miscellaneous code-quality fixes
Date: Tue, 21 Jul 2026 07:50:33 +0530
Message-Id: <20260721-iris-code-improvement-v4-0-4395bd8acfbb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHHXXmoC/yXMQQqEMAyF4atI1lNoqyh4lWEWto0awVYSFUG8u
 9VZfjzef4IgEwq0xQmMOwmlmFF9CvBjFwdUFLLBalvrxhpFTKJ8CnmYF047zhhX5Spjg9GlC6W
 H/F0Yezre7vf3t2xuQr8+MbiuG9j0onp5AAAA
X-Change-ID: 20260721-iris-code-improvement-b412d103bd3c
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784600434; l=2684;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=iwFvchubbplrBbnNj0mAwm4NbMU3t1jTzwIydZu1Ex0=;
 b=DqpxZ0H0jToXBGx62yHxjnl2EE0p3P55elS/7rSTXQlSA5XWy0Ppo2YM1h2UMvFPdEBwCcaaV
 xy6LUGPIO7GC4qHh3DxO7iWSByXarhyd2ASjnMxbAsXryOa3fuGBi8G
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDAyMCBTYWx0ZWRfX7cEtoogaBmcY
 /TiorCDQ8cnSQRAaKF8pzn73pAcECCh9WEa+aCHeAQUEFmHFmdPdY/EsVDVSg0YfvvwEs89AJ+u
 ZKaiVJ258hPIGNlU7xeMQUJ5kbVQdlV9iknazBb6LcYNNjjwtwU5+9lk+9+pfQUW7Ls792EjqMz
 4FZxq0uZmu5RILapyrVqbWr5kXFVfyY1eD+wUOO2NBwW1FAgR561YD9CN/B0re97VJ8OrOK6bIA
 VQHzeXfAIc5NopACLUPT7t8gJn/hyTTrJBYrv/jg0HqbPHqET/P/QMAftdRJyMyPHX6Xsj9vuMw
 H4lNNqgn3pKlWOaLask5jg1HLBMU4Qp3/blt+cPYTBo5kmwIqL80SL+71A0iQGmWg1gAkjaQ19o
 wH0axF/jGEprmdQQShcoTHYLFv7P4CG5l2F6+ecfovLdn63lmKKnQSaq33nDFKr3UYbgKQjbZjH
 I3a/IpcwITIn7SBGaNQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDAyMCBTYWx0ZWRfX4SlZSFvjd+DW
 mRkeQTUVP5sB5yW6WOzcR41OGy44zXi/rh8vOVTNXiczAMLvWUW2nw4qsvJ9u90PAR9VKLVBa4m
 rVqNJMMQwReIZlz7UjfLgxhBdWiOu8w=
X-Authority-Analysis: v=2.4 cv=WNpPmHsR c=1 sm=1 tr=0 ts=6a5ed779 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=tyF6uOqd4XZh2prJWCsA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: jXMFrT1MwyiX78WRa4q1Tqg-yLmLTARV
X-Proofpoint-ORIG-GUID: jXMFrT1MwyiX78WRa4q1Tqg-yLmLTARV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210020

This series addresses a set of independent code-quality issues found 
during review of the Qualcomm iris video driver.

No functional changes are intended.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Changes in v4:
- Updated commit description for "Remove duplicate HFI_PROP_OPB_ENABLE entry" patch (Sashiko AI)
- Link to v3: https://lore.kernel.org/all/20260531-iris-code-improvement-v3-0-4c699c3dd719@oss.qualcomm.com

Changes in v3:
- Rebased and resolved merge conflicts (Bryan)
- Link to v2: https://lore.kernel.org/r/20260423-iris-code-improvement-v2-0-9e9cbf00f9c9@oss.qualcomm.com 

Changes in v2:
- Updated variables names for iris_get_int_buf_tbl helper (Bryan)
- Removed un-necessary fixes tags (Bryan, Konrad)
- Addressed other comments (Bryan, Konrad)
- Link to v1: https://lore.kernel.org/r/20260422-iris-code-improvement-v1-0-8e150482212d@oss.qualcomm.com

To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Bryan O'Donoghue <bod@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Hans Verkuil <hverkuil@kernel.org>
To: Stefan Schmidt <stefan.schmidt@linaro.org>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
Dikshita Agarwal (7):
      media: qcom: iris: Centralize internal buffer table selection
      media: qcom: iris: fix state-change debug log printing stale value
      media: qcom: iris: Fix bitmask test in iris_allow_cmd()
      media: qcom: iris: Remove dead assignment in iris_hfi_gen2_set_tier()
      media: qcom: iris: Remove duplicate HFI_PROP_OPB_ENABLE entry
      media: qcom: iris: Add missing break in iris_hfi_gen2_session_set_codec()
      media: qcom: iris: Make iris_destroy_internal_buffer() return void

 drivers/media/platform/qcom/iris/iris_buffer.c     | 123 +++++----------------
 drivers/media/platform/qcom/iris/iris_buffer.h     |   2 +-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |   2 +-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |   7 +-
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |   4 +-
 drivers/media/platform/qcom/iris/iris_state.c      |   4 +-
 6 files changed, 40 insertions(+), 102 deletions(-)
---
base-commit: b72408a2fd20e8fb7ea462eeb4293f826585fe03
change-id: 20260721-iris-code-improvement-b412d103bd3c

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

