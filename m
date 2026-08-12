Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD71D35203E
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 20:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786564894; cv=none; b=Md4go5EYyLIxjx9/IErV7Ar1ehlgCaVAqGBZk4UbiZjqutu12puvLfP8+CCT0Ocb1r5ic+oV3yT7bV3QhBrRkGT87zzqZQ5K/wTD9rwRjDYwrxBqh8LGkQj9yeX+1bUy3icRBwM6PWFKgzkO97MVWQR4kFwj972k/1TkL3mXBf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786564894; c=relaxed/simple;
	bh=r6opA0kNEQrfiaF67bom8srKxpwwHd5XT4pgmfEnYNw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Dw0SYavLs+GEI48MklnEb6MvHsOL4DkjO9jaAfVEKuiABr/AzHozPFe9WF5tbSr0vxIaFHvsAdbxuKi/gNHd+oMWXZFIyX1uITZ8RlujQAh5wyPd5QsLidD1MbrziIJr4kN/OMH/5pc7MUFExjFq2ovzDdLPBjwY86o+cFfy+lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gl0vzHNm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hgC45faB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gl0vzHNm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hgC45faB"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CI8hew3792254
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 20:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pkY9uRaTzpSbkhel8Yhdfr
	qDz8pSWXGRHDaTs4X3HMw=; b=Gl0vzHNmkmH2fBqNnJz1ki+0ENSyEVnz4YalB4
	EvcTgKhQfh7/Z8NJG4R1qZtTwK667d8G0vYgk3NjuQv4QBJvvzrMFMse6k7qkNxi
	2efZAVKbVKuUDDa4kkeDSct2retHUC8Hhk7Ff9MQUYkSSq0d0IcVIt6pzdeQcGky
	aPCPTCrAWeM8yWKRYPW364XZsb8cN+cBvG31W/amcEIwm2lHRCGRlYE1idyLUKpq
	1hXfCcCRNB3azux7Gt6mHPbl+q/f9cpINYjVp+rW7+YvSN9Wfg8Y2aX1Wq2ssReC
	0kgptGNcxQczlPAWEnU2W1dyh6oddHdekKQY7I9f+KH4wGUg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0mndb6g0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 20:01:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52cd0374265so26053231cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 13:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786564891; x=1787169691; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pkY9uRaTzpSbkhel8YhdfrqDz8pSWXGRHDaTs4X3HMw=;
        b=hgC45faBkZI1onvOB+TEeqgxPu/ONFiNH6RwU9YwUQQPgQUAD+Cnn6n3QSgFNTCJkW
         f0ZCP6dkhJabSbvW8xZPcun80cUbe47Q3MGLiWU01sCmtTaLe01FpKoq/pQiskBJskBH
         WYnD/R4jpP+RQvKwTw1AZZLalXrgyOUy1T20kAUeiiqIxGN0SNI367qmbLoXeGT8Mg5x
         8c6Y/F065ei/uz9Rpp6ZMA81gPC8ha+zFqJiiQTxLAXjRNTkfqg8ZR7M/FS+J3UQw7P7
         pc6qeU3NSvXgKs5qtkdFyssagik1haqaNdv2n/32EnazR5TQSjVtjl9W9FEoKmgAnCsA
         6HAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786564891; x=1787169691;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pkY9uRaTzpSbkhel8YhdfrqDz8pSWXGRHDaTs4X3HMw=;
        b=ESmQVDQxaNVNLCW5n5SYPhwnntUB9CqDLpThru/o/1o496ucoDmHMB7BOQSeLGJlhi
         edL4lRP6Gz1PhW/YtoT4YQ9Hc/3YqyTYsYafEO2zroACt+n8fYYteoQEp3UX3PGxw4Of
         QTpSKzAB3wSQJaGz588FNcYc2ZykwULc9VewnDbKqZji8s0NOqoipxlbLVUcEZgh5zWE
         j2p+xFoonHvQVK0gBBXXxdgX6nJ/7fNweULPlMoMcs5KA+WAirBcTmb92RQv7ciWfW+m
         YRVM4eWwkRUnkrKImND8uOzgA7/OIAjrQtOROwTICP9C+9XAP6m1/taPEfrsoEf+864T
         PkUw==
X-Forwarded-Encrypted: i=1; AHgh+Rrb/VlLNxi25/TJ9uSsRy2H9yrSf7dTSEKESDYtpzUKOqdEuw6tW7ivUmbc5ycSu1OarEZZgVhMS0mms5rZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxN7ZekOm083FNhRK5jvcVIFEfBlS9EqF1w/2TCYSIrM8KMKgqC
	td1C2Kq8BtSs4Gq2x9SyLzZjEyXmAZrw8iF36uH+aAU7MhHQQAhk118okiRqTjEYJHtklOAw5zj
	xjT+EUwX/ExC14JOagC0b/c75AickG115KQw6VvuW0jUbFiCBC1OAsB77kQ7ovdjgw+ss
X-Gm-Gg: AR+sD12GQ69p1zL7eeRHSGWUTTNWgHhM1SiVQt5wOetQit9BTaqIyNQXZU8ZIIUgldz
	plNwONUqOMyeUt0YoIuoDJS2Nphk3magH/vMiybekyC1BvWxrl/8vYQAFiDN54wws+SaBkmC2Ms
	4F8fvja4wB4eIde1oxn+z55Uzadwe6UKfnRIwhXLMBhKfIzpogCznbAVeLLH+R/5yTGPTStNkoh
	GTq+RqJSXlqUsIdOrOJpnCwIr8catr1LH21SNBG5TTT8npFnbG/XmQZTLGqbfJQ8G3Ui57IT7PY
	g5lCm8jh2Xdw+NHJXj2ClHm0tnWX9FO1kbIqKVUmzvE7F2TWw1ebpVdM1fs6WQiJbqSuWQ+VaFs
	Ah/pBKE1DD5/5QEPQAoc8C+8W6d1F5vthzsMAwMc6as1pUtgPdmGmrizxthqRvevtm0Fh+UX1u7
	VNQV5HmIJYhidO
X-Received: by 2002:a05:622a:8c9:b0:528:3b83:3483 with SMTP id d75a77b69052e-52d73d5d865mr7476531cf.23.1786564890496;
        Wed, 12 Aug 2026 13:01:30 -0700 (PDT)
X-Received: by 2002:a05:622a:8c9:b0:528:3b83:3483 with SMTP id d75a77b69052e-52d73d5d865mr7475561cf.23.1786564890051;
        Wed, 12 Aug 2026 13:01:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a11b2acb0fsm354561fa.12.2026.08.12.13.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 13:01:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/3] media: venus: fix several caps parsing bugs
Date: Wed, 12 Aug 2026 23:01:22 +0300
Message-Id: <20260812-venus-8996-v1-0-6615f82a63b8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABLRfGoC/yXMQQ5AMBBA0avIrDXRhkZdRSxKB2NR0kEkjbsrl
 m/xfwTGQMjQZBECnsS0+gSZZzDM1k8oyCWDKpQuaqnEif5gURujhcTeqNJoW1YOUrAFHOn6Zm3
 3m49+wWF/D3DfD6pjgi9uAAAA
X-Change-ID: 20260812-venus-8996-1eb92496a45d
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, Tomasz Figa <tfiga@chromium.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1143;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=r6opA0kNEQrfiaF67bom8srKxpwwHd5XT4pgmfEnYNw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqfNEWRZShgm1Ac2l6Evgha/3DMJRgBZ2S+a+DS
 D2T3ooeJmCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanzRFgAKCRCLPIo+Aiko
 1XYgB/9NW40oqkYFA6WL7rRDjaoKop1bpP2rvz13hZiNy5hCGKrvU2qpujM5zDr9NNyUAFmCDAu
 7Y3mh6FQ+QpG4+JSDjTM7Lota2x9nAlFhyOOKs1E33/cqou1WBSbtDM3+rLq9KV5V1LAFlSBtDw
 2RnWzKeCfbZ3xUEmYbbe6/YQZNhrYz3ZKQwMQsOwvyi9UhPZ6LU3nzYxVbnpySQmupNntnoNvqW
 Nc0IL0PiHZhNsT0MDaq3YmS/DUOkIDAzcDc7RQZ2TqRWPL6PGqXwA6iZZOC1kvRLvgD23VRFdS5
 WmxHWzZYykRu9qa0+8xoKlPR/QbTbGtfNJXjU0lLHvgDiL03
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE2MCBTYWx0ZWRfX5Bhke0mXKRea
 5FbT+/w0K7YmsWhRmu1HLoiolrD7blSZItz2P8TmJLqCaR5DAgJzX2/JroXEIE7A/YV2SUHbChQ
 +E06PIvkRn7PXQ4SIg+7FTvQ7qgblEU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE2MCBTYWx0ZWRfX2OBD57UpEU7k
 mbkpOQY+V2SxM/o9ZpHVvtft6LDNTACLUGwwWY/Mmxx2eweRfUyc6TWyVVxIWfxLt+dvashQDur
 fAVkuhDSMgCqrVoa5Bmyna3BQyde1FMhZsb5JVEpRBDkPhm073Yns3iF8xINgo6xApVjIVK79I0
 /b3b0kHgleNwtrHUZK4DaFIaqvOATC//oISRSCPtgXfs2NZcJqW5HsFvYHey5kGkvmxREbWyafn
 DETkibM3RsySOm/dyYvKtVLOhDR1cbeIfDzIj8TY14RGNQwxXKbeyINGUrQamXuANUQpOM3gqqn
 vido/HZeM5juJ9C8am81Da3Jpe+Gf4t48z7fGmbpq0aKi7SacXnyMwGyeUmeXmUOpkr3++fn9oL
 tvMg1yPtGFl49UGoSJleJ67m/XAH2iA8NDOJg3mPanOCgr09LR/eA1XEYtVRlUDAC62tFF4GKGy
 DR0dMrWjY7crD/Wovsw==
X-Proofpoint-GUID: kAcvtMgB-wBp9Gvu9snsfchOuIdIjVeW
X-Authority-Analysis: v=2.4 cv=C87ZDwP+ c=1 sm=1 tr=0 ts=6a7cd11b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=z1JbGT0kfS7yTgG4yncA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: kAcvtMgB-wBp9Gvu9snsfchOuIdIjVeW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120160

Testing Venus on MSM8996 revealed several issues with caps parsing,
which didn't manifest on other generations of Venus hardware / firmware.
Fix them to make Venus decode streams properly on MSM8996-era of the
hardware.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (3):
      media: venus: hfi_parser: account for all capabilities when skipping a property
      media: venus: hfi_parser: size a raw format property by its own entries
      media: venus: report the frame size of the codec being enumerated

 drivers/media/platform/qcom/venus/helpers.c    | 75 +++++++++++++++++---------
 drivers/media/platform/qcom/venus/helpers.h    |  2 +
 drivers/media/platform/qcom/venus/hfi_parser.c |  9 ++--
 drivers/media/platform/qcom/venus/hfi_parser.h | 12 +++--
 drivers/media/platform/qcom/venus/vdec.c       |  7 +--
 drivers/media/platform/qcom/venus/venc.c       |  7 +--
 6 files changed, 66 insertions(+), 46 deletions(-)
---
base-commit: 78bc8af4affb9a732504eb22eeac7d1e50883853
change-id: 20260812-venus-8996-1eb92496a45d

Best regards,
--  
With best wishes
Dmitry

