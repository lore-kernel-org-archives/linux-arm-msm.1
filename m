Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D12E3B440E
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785484858; cv=none; b=OvikCLvSbjKHbY8UzuzQJI6ZKu7PJrpSjrUhlLQwt97WH7xtqhol4dFOud1rxKmtYDAD1z9FkFMr13uw9OkrZwfnLYEYOFd8b8j2LBXnqHk6nbkf9IEKJQkZSfBarCC8KvUfJreUhcMGQKWp19PBvpc4c60pIdnEbhRtRsoOnBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785484858; c=relaxed/simple;
	bh=znReia3O0oaZNnf+GgAEpZreXNGn5YBXAwYckgihcXE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=okar9m2pNiPwKI9UtfREHHV7pUKix0qapOCQ9g4kgteflbQwlBflchTmNzc0FFQvQmyWIT43N7b6F1bQYKHKL4HONdql7Bai38JlCg8SgOgXv+QQuV/F/UsdtQfrtkZ79puaojAm0fNM+RaqEHzRGB/dBGcYSQCi4pkLxOsFoXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hA3lTPDj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=anvkJivk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hA3lTPDj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="anvkJivk"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V80Yg83559493
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4QKRQfg8B3bYaP9xBDZ41d
	5QSua1LNTg4v8NR85sylE=; b=hA3lTPDj9XCewXDcaWYP7YUppIgszsGoiWZEDo
	yWRF+QJiOcDAIW0/xLUSZyOy66wpERixq4Xc2eHSyTVOnk0avwuI+DJd4j3JSkPn
	LE/ip5ELUJolh5ffi68HClpwBNUlcnUGLuh+weUI0egrVmLFWMfXohxzkoQc05Mx
	jGI6znBXnhqyLsWFbEEfmT+BV8vPpylIO4PD/LQGm3G9zXwCEZjTxABfaRCYSWxe
	2+ycPnk+go4dPM6KAmw+8u2l3tlcGnK7+TDOD219oflVXNI8/41Yl+KC5VdAMbFa
	GeJASAMCWRtxS9F/JgBBm8OICVk+vqWghYuYmgE0Boekd7eA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frqtqg01f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:00:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bec738909so5016921cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 01:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785484854; x=1786089654; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4QKRQfg8B3bYaP9xBDZ41d5QSua1LNTg4v8NR85sylE=;
        b=anvkJivk0T3w8UmID0yLc89zrTdTOyo3EkrZlPG5eLt5M4CkQZtLjykz7FKUUTAiVc
         Zl1bkwj+Kg8vHKtSRUsbg2h/Haka5QyJBqBsyoH49V4nJ0zxMVZ9hyw1sVX5qAoEaZP3
         gO08ItI0LqzMqLg2Up0MJYXplvolevENW4oWSuCRhTuHlLmt5WA1uUjC8cvVIpoBT7iZ
         3ub1/0jNXrndMIldxv/wRkYdLWcm0O5zLURM1sVisV/ofXfpEXjZwYt8sVuu0tB99S4S
         2NRggpTSxwo8PUSEGcWRahDugUTOc1R+4AOBIew6K9QkGO5UeCCwd/9JS74L7GhDANYE
         1f6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785484854; x=1786089654;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4QKRQfg8B3bYaP9xBDZ41d5QSua1LNTg4v8NR85sylE=;
        b=eKoyyPcZFh9HULcNCR8GRBhb6aA11r3IC7J5e2J4wRoyUQmQ6G4h8Jx8uX4m/1zZ5Z
         yKAp1rzC/4eKWIcCE50GCvOLIOpL/prWy5906ukoTjOirbY4C/Lea0N032/+QYy+OX88
         QEUrt2OUydeyUg/jcgU7HeqnekAY0l/d/OMgMcmacz+stTLBxWsoHIEVUgb0azVPohQK
         ycBd9P2ehu4HWtHsHYcNEMA/9cJlBbZ7YAQTNmwoIBItP5DI1AvgFVivdxXLCLeI5+Dl
         Mt9hKxaWEtOWk3g2+2L8FUfAXmHXgDmDS6BE/xPssVVsfSDST4Ocrm+4YIOf4CBkENBm
         csaw==
X-Gm-Message-State: AOJu0YxXkCE9mJvLoT/wpUVjv/CHRYDyRQGaWJPDErhihzxI9tzd7E8f
	0ZDY+gbUKK2GI/clbmWl7JYCt97OEokBnNwfIsIetI6eSFvz0DPpD+VXvdYLW6yMKGzBjDt5tIU
	G1ShbKtRIruB9kjjztOp8KZt2V6EE/t7fB4mqtjCV7GtHPtZkwJOXY9MhB+sXKwpiC2R/
X-Gm-Gg: AR+sD10cv1Dvlftjj/avcu2epz6gvXXl0bpAZoV4qB4YruMrHIYO+V4LYn2FNKJ7vWi
	anpNRUmofE5V8nnd3wPnGCYCC7PkoV22nnQ6/xQa7pOdrdV4nv7WD9fZf6UEv2uF+89OvhIZxSV
	v2803MZA34FNo+GILDIddOtlizbaVT36DR6cFVsuC7NvfTE9k/otNADnmf7xHZ7ImemULljGABQ
	hiY1P9RYGB4+RRRFl246ftvfu8LRK/uecOJeybrAS0Mh5o0JskwAlyOcdLPuYe6UyxYE+4eQcUq
	Rvg7A5O9s9SOxskYUx4vA4vK26iJ5+mv9L1IxLGOJIhKuCBBpVAoBwnEtpwJ6cZnoZ9Zsfh7vVp
	2UAHOJkB69AzxisXw1DGOPvpLr969Dg==
X-Received: by 2002:ac8:7d83:0:b0:527:6dc7:5c5b with SMTP id d75a77b69052e-52b4b04fb6emr10320981cf.21.1785484853051;
        Fri, 31 Jul 2026 01:00:53 -0700 (PDT)
X-Received: by 2002:ac8:7d83:0:b0:527:6dc7:5c5b with SMTP id d75a77b69052e-52b4b04fb6emr10320171cf.21.1785484852457;
        Fri, 31 Jul 2026 01:00:52 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:40fa:e8e6:4785:ce70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd4534fc4sm51032966b.51.2026.07.31.01.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 01:00:51 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/4] firmware: qcom: scm: simplify code by using classes
Date: Fri, 31 Jul 2026 10:00:33 +0200
Message-Id: <20260731-qcom-scm-code-shrink-v2-0-4ba76096915f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACJWbGoC/4WNTQ6CMBCFr0Jm7ZBSragr72FYNMNUJgqVjhIN4
 e5WLuDmJd/L+5lBOQkrnIoZEk+iEocMdlMAdX64MkqbGayxe1ObCkeKPSr1SLFl1C7JcEM6+hA
 OO+e2dQu5+kgc5L3OXprMnegzps/6MlU/98/gVKFBY4MjNpaOzp+jajm+/D2n+zILNMuyfAG52
 OMHvwAAAA==
X-Change-ID: 20260701-qcom-scm-code-shrink-c9aff845537d
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1339;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=znReia3O0oaZNnf+GgAEpZreXNGn5YBXAwYckgihcXE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqbFYnIZ5+y+C+QbX5mwfMvTQg68i8RPS664EDT
 uN4pMd5ksGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCamxWJwAKCRAFnS7L/zaE
 w9e+D/sHUlWauCX+xljgoBkUCdILI4e95zvsNXKl91ZAC4kGlVLEcrD1CTRhX0SpvZ86fK3oVbR
 8YIu+wIHOsK6y/9AsuvNdf7UIMRg6Eh/48t3NXraHcj6BPqNWbxQX4U31xLp3BSkUEL/n2ozmWX
 EktHsTsbKBd/qOyHmrG6Jh1mZ6MQKT6LHcQ4cbpzGrHBFg5T/d1IZSQX2xQVF4ZI9s5yT0Kap9F
 ORCyQPOztLgzf0X04bRjxvZdFPUOXFbG/05w9TLZTp3Jf5Cj5DCMaLe7a0wU36hzhziFkzxJeBZ
 n1ToN5nf8vHxkyyZvLhan6yXBiLmESfL+YeJ7+o9A6OYep/ykeazEf59ze2BeFinjT3SV1NLGsc
 CQEJi/J733fhtKEuh7urR2XbPYYCjsslKFgZ+5pCkm5n0kimzhAFb8CSUFonpVdHiBuEEo/jl4Y
 3pKDjOVuD8tBj5UPsjW3ig/Of0sSjqMA5MwbOxr2ggDGfqjRrsnSz9Tz01pWTGQandU35BzDZVn
 zXSpuduxJb0rqmetVlE2ZR5Ovez/UZPOVkEUwZISUTidfAX23aUFsDoFUf5H/WnUVc34A+/DOTR
 Nw1FD/SGqCSlEWP7jUbMo+N+S5er9DjTfrbP8O4M/HwiBx6EKLUovEI8/E+oEfmbbeEi3fZA5gM
 +Zz64zlPQ9Py2TA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: zxW3Khy6OOW55Pr_sXafTChWKND-F-WX
X-Authority-Analysis: v=2.4 cv=eZwNubEH c=1 sm=1 tr=0 ts=6a6c5637 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=9qASb20qi_AIfpCrn08A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA1NiBTYWx0ZWRfXyR2+een+t0jg
 3MfKBZUtdkp+PdOHwKu+DQGWhl+3jBqnvN/MF43nyyMEUbPvpYz9WqbEdClmhktoHiSbFaOmqt6
 SKu8hxULOPHOyv99Pv9Nuq+M37sgGSE=
X-Proofpoint-GUID: zxW3Khy6OOW55Pr_sXafTChWKND-F-WX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA1NiBTYWx0ZWRfX6FYbF8rvM/qq
 z9wvwUe3t+nyQarB0xYPMOTpG+O6dLMNPElD++Pudrg/XQgHRyowiIg+x1GkYZHo1uumwvyPuFU
 /y8myDCp5VkGCmjU55TOQAaSttz5cVrOP0Y82MY+JEGDDbGxlzSN1U4dg0bHnUCskb+2kHbnsEy
 nnARDtIwcFUOGjK0HfdpUBuQBmeuOmpaSijMuK/pLfBbBlD6vTo6ieMHymB4JqyYquTa/eDWh+J
 8R8h9CgVp2ua395kaFJi7musVfO9CXxl2ynBR2zOSkIoZ+0pW5ZeUIGD5jhNbeLlyNXfvdJvy9X
 /KBdpLlu+EXwkzZ06izRtKFCt7DWkjl1Y+8y0uA5geyGzlWtBJF/nXUdQ5iVaciVhr7GGjUYZhD
 WrPRPupD833Mc2ziq3caU1JchGSd5oLHzRYXWXJzpaPbokXj/n1N/qddbfD8DSW1BLe+B/+pIEC
 o8U0CWQYfS8kWi5X40w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310056

There's a pattern of enabling the clocks and/or setting the bandwith
limits before performing an SCM call and reverting the above after it's
node. In all places it's done unconditionally and can be simplified by
providing appropriate classes. There are also a few places where we can
use __free() for tzmem pointers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
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
base-commit: 95d6a9ccef99117115e41e9adb271243bd5e985b
change-id: 20260701-qcom-scm-code-shrink-c9aff845537d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

