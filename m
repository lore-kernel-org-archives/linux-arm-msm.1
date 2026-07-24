Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC84447806
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 18:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784917751; cv=none; b=UbYvrNvnu7JXiZvusiAeI6NpfK8g2ZSFZBs7eBZhU/5OJfmvoEdXcp+jUSSNdaEvf/XQ5fHmrt8Hix8rBRT5EItN1e64YhAeLtujD+9ELuJAVnuJMCxSKTLySS8SW0KWV9bSAeAVYAW/6ROCqvmIuQ+MmQ4MwGLs7qHcTP2uBbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784917751; c=relaxed/simple;
	bh=WPgCvH2gb2oeEDvDDFVu1OrHqQ+OtMynV0OcFiMm/m0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=K1qriHFx4diL3TYpd/7KNco9w11fIXVnbRAEJKVVNYO40UyvACRWvR8ZrAiCjIKW1xBSnkHS3A0swzte0SCBxsXPst/xqVrHIMLD5zKUPx/DskSt58wrixa3QEdnDQqyq7wrI5oryjlxCa/qQqEA01U4FSKeJp8FaX1pHACR0HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QASREFS5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OXJlFHIs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QASREFS5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OXJlFHIs"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OGqgO33936772
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 18:29:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tyuLKAsbbSnD/aUHou1wop
	Zpn/sYBaQhfJipC2SaYHE=; b=QASREFS5/g41b629az1uNOONwN1obxJDdWlOzr
	tuwaP9vAxTkViw3L4vTUbbIZ7j8jJSquTfJWtv4KV95o23OBWAmH8iRdTQTOSKrr
	HHeSN2FIj8Ie1YLJ8182fuF1nLIJ/yaFwrA7G+5fbX0VZJ+MkHLjsRH7UFdLx/cR
	H2s/rnJVAkmxcaUdLWpfbZM4dM3cjNS9OcwmoOYOTmpLgqSK41A0q78pvYop/r74
	n2qy6rz7wgqAWpnFBbiXqOhslbIBDiv8zCeGQxwHV9Jh/2t+Ph1svv1KTgFtkgPk
	7yauNH56QzFuG+ZfQ/t+dWEZ/z7UNR8f1MvZE02i9y2ywYAg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmb6p8h3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 18:29:09 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb733fc5024so993503a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784917748; x=1785522548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tyuLKAsbbSnD/aUHou1wopZpn/sYBaQhfJipC2SaYHE=;
        b=OXJlFHIsm9Vbhsp3TK/Ks/quZZhWc89e+WrMS1M4rAy/3Wk8h9ytVL6tOMQnAX7R5g
         N2LIjr6qOBQugTEAnCdenuLoQ35F57O3Upw+emyF1dZyWUkCgT/L+n4jdBwyymdcONjK
         TLnJd/oFLud+2bnseBBR8hSCPz54wGVmgoPYjOJOIKD57H0iyL1U0IRzzEEL9MjxDsW6
         1EqXzJjmws1YFalYEiE7ZUoK2s03216mF+I2bCIqMX1PWZ2MqYzbv7zPY6WEUchQnH6Z
         7SqVM1weTuoIUpLKf/EU8IzU+f2wQbb3+clBuroJcRfp4geVIXJfudOncQd0Oa3c3TU7
         DtnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784917748; x=1785522548;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tyuLKAsbbSnD/aUHou1wopZpn/sYBaQhfJipC2SaYHE=;
        b=Wm3ksktulxcSMapho/SXkDtGdEl9Fbs7//Cizy7Ni3Qs/B3C83wdk6q2ijfD3XbVgy
         jUAzzIwGhazmdnxnuTxN7slsBIyVMKUqd6W6FSg/rPuVcmAKjXHLG/yXiF2UAL4mCWBL
         mQIVG/24UqkbAB12e+TocbAJBlM4o2gcFGi2vJbkCP6CZL52saACUOB3X8pR73mbNxgi
         /IHVsOu1tXt6qrANub/TVJcBcSS2hjcQXaJyjM/R76iY/U4eykWgbNHhPTH3t+tRHo8t
         PQiflyVdfrweX6HQThvKufmGSa638qIPIgVklZlzw1HXmL4y1BlWFkvyxTa2u9HHwsWs
         L/CA==
X-Gm-Message-State: AOJu0YwXDlIzzKsEX7Va6X6lYHIrtEEqlykN1ii9LjXGJY8tN04S4OAo
	uv2XdAU1BhXoPCl315N4pvMknN0ep/k8ZRBPZALQUlUIOqfdIlY4+4ixPB0Sa59BPio6FO58pOf
	f2kpWqm0XdWWjoo/BqeocU+Dn9ZpvAooLaySf+iuA/LnMfzc/+NdHRKBMAGnYNUchSxLl
X-Gm-Gg: AR+sD11JTdiwgkjw2ywtPwJy/xVqQXcY2oTKikW+a0+dFIiFT/qHrVxCbFfE8A6G/m1
	H1qQsP6TmjoAchhYnwSnUZec0CDBsznV+7NfK+Ajyz0hjNZ2W2e17gw3qGskxxEsRtTlZtNjPmw
	vNoOjcY/xVxTwV1zkUHa09r+n1TfiQkh30WOWa66qkACva3F/NYM90udfKemksMLd0X/PdOIyLd
	2q6zJvdhWc4jPBplTcW2bCbZ0a2g4i14Fhk1aRR2L/+jnOAanUOPoBumV03Tv2unEuYYia5JPtA
	WwhEFFfxpoJ5g1i3sFRIPoS3LDUB/4lBI1jCaeAGiHTJ9n6ya+GeLXLvCybUi/8Qxw+E8kpejwd
	ab56+3mpXatj9h+5oeQVc96EbsL0=
X-Received: by 2002:a05:6a21:44c8:b0:3c1:fbf:1e2e with SMTP id adf61e73a8af0-3c44afa2d9cmr8978801637.10.1784917748433;
        Fri, 24 Jul 2026 11:29:08 -0700 (PDT)
X-Received: by 2002:a05:6a21:44c8:b0:3c1:fbf:1e2e with SMTP id adf61e73a8af0-3c44afa2d9cmr8978776637.10.1784917747796;
        Fri, 24 Jul 2026 11:29:07 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5c53f3sm1341510eec.30.2026.07.24.11.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 11:29:07 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v5 0/6] remoteproc: qcom: pas: Misc fixes
Date: Fri, 24 Jul 2026 23:58:52 +0530
Message-ID: <20260724182858.1868271-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AureGu9P c=1 sm=1 tr=0 ts=6a63aef5 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=H_pUXcL6yfwzq-Dby1gA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE2NiBTYWx0ZWRfX8w/3UyKlrLDw
 E9QEAusk2Ry1DdSX+YRO3p0luKIlfj+aIvq+GEWolx4fEw5uO1wVPt6uXpYd7vw9fh0pf0cAZ3A
 OGNgC/shPAWpEclGs5sq5y6aogtCgnU=
X-Proofpoint-GUID: DEP3dJz_SezBRZCApHS84BHfkoEdmnNU
X-Proofpoint-ORIG-GUID: DEP3dJz_SezBRZCApHS84BHfkoEdmnNU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE2NiBTYWx0ZWRfXw8BxRYdeJjMT
 e8cc/hWWEs4yHUeqNwlr8DSZ7whhygdMg3EDX/Ip7iMwXmtu4ys9VwHBEblB4FrrAh2BNVBt8lQ
 uqG/no1jEu2io1KIMMLFngqi9ctVylxeBzRMLb52UMo5WR69XVdOtYShcftT1FcR3kTSuj9OHyV
 FUhEZ1DLmriWXM8jWXq4MNhj2D584IausR7/BWUbwYeZnqKwSRfSGOrbt7m2QlKzA0cLQmBGvnF
 BT1+ahOcSlX1zUEgi99mud1hoQ9ffJTxQGkangH8HdM34nOChn91PV/JhMvohy3qQSakAmx9A8a
 pFv6e9W0aUglxNXnEKk5MKv4Z1J/rLsvuV/fsnkfJ/GWD8DFEW+DL7El9QBB9NtYbWFpveNIhHd
 Bz1QQ7upj7M+KO2C4Aah0gtVqn1IJ4rEoiN8ezNk2mjchxaj1Gkn882plRoHZHn0GzwYX/W4dNI
 q2+ZV9FpDb0Sno2Yr/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240166

This series is a collection of misc fixes for the Qualcomm PAS remoteproc
driver and its supporting SCM/MDT loader infrastructure.

- Fix sparse __iomem warnings in qcom_adsp, qcom_pas and qcom_wcnss by
  annotating mem_region fields with __iomem and using __force at call sites.
- Guard the DTB metadata release in qcom_pas_load() with a dtb_pas_id check,
  consistent with all other release sites in the driver.
- Move PAS context allocation from probe into qcom_pas_alloc_memory_region()
  so the DTB context is only created for subsystems that actually use it.
- Map/unmap the subsystem memory region on demand around firmware load and
  coredump, avoiding potential XPU violations on EL2 platforms where the
  region may be handed off to the remote side.
- Drop the now-unused dtb_mem_region field from struct qcom_pas.
- Add a keep_mdt_buf flag to struct qcom_scm_pas_context to make metadata
  buffer retention explicit rather than implicit.

Depends on:
https://lore.kernel.org/lkml/20260702115835.167602-1-sumit.garg@kernel.org/
https://lore.kernel.org/lkml/20260724094939.613844-1-mukesh.ojha@oss.qualcomm.com/

Changes in v5:
   link to v4(https://lore.kernel.org/lkml/20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com/)
 - Rebased it latest changes on Generic PAS changes.
 - Changed a bit related to map API so that it can be used by both
   by mdt_loader and pas.( 4/6 )

Changes in v4:
 https://lore.kernel.org/lkml/20260331183957.2015440-1-mukesh.ojha@oss.qualcomm.com/
 https://lore.kernel.org/lkml/20260331191210.2019758-2-mukesh.ojha@oss.qualcomm.com/

 - Last series mistakenly divided two series cause laptop shutdown.
 - Some minor refactor common code rest is same a rebased on latest
   kernel.
 - Added new 6/6 to the series.

Mukesh Ojha (6):
  remoteproc: qcom: annotate mem_region fields with __iomem
  remoteproc: qcom: pas: Guard dtb metadata release with dtb_pas_id
    check
  remoteproc: qcom: pas: Fix the PAS context creation placement
  remoteproc: qcom: pas: Map/unmap subsystem region before
    auth_and_reset
  remoteproc: qcom: pas: Drop unused dtb_mem_region field
  firmware: qcom: scm: introduce keep_mdt_buf flag in PAS context

 drivers/firmware/qcom/qcom_scm.c       | 18 +++++-
 drivers/remoteproc/qcom_q6v5_adsp.c    |  6 +-
 drivers/remoteproc/qcom_q6v5_pas.c     | 87 ++++++++++++++------------
 drivers/remoteproc/qcom_wcnss.c        |  6 +-
 drivers/soc/qcom/mdt_loader.c          | 15 +++--
 include/linux/firmware/qcom/qcom_pas.h | 13 ++++
 include/linux/soc/qcom/mdt_loader.h    |  4 +-
 7 files changed, 94 insertions(+), 55 deletions(-)

-- 
2.53.0

