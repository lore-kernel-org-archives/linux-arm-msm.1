Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793659393;
	b=CzxUkFhCgOAliVfWABqX+uKhWX50Hg94U0fdrebljZDPx0mSLEFA7jhQG2zI8kvgVnJK
	 Y5NvN5aKhBewvDABqMhLQOsqaQxwPtMZJguq6G2V1s/YlV+K5HBSOiPKXYMS5XheYXx/R
	 q474ff2+2DwbQxW8mHPZc7dVoKYF57VObT4zdyQqL9coS5cKQjC+4fJBz5jvP1wWWsab4
	 DRfIF56d+g3L5t+KgW3rsAVSqWgtNt5QNGCUvuFUCpoyJ3yvLxiJRoxlIlj7IkrjRy+Cr
	 ZO/mbSiMNNgr9PR5VxXwKW/kmPG96/f5dnNx8qeEtWgmKr6uKDqLoEn6HQ7plKR9yoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793659393;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2sxsRWlKfg/leqhheaFNE/NKgDRvemJZ2eId3SX/IcU=;
	b=MO2Uz+vIbcBAzbM4KGjJfC+7h9yIPkIDJC/DCd/VDeVab1cGTNwdOw+6BB7TsVcL9bPy
	 DY8SCxGlp85LuDHiwLpBQvBsl3Uc/8pmZEWXsnMJ/gsoLxnUnQ9SCc206PY/aT3WiNDe2
	 CIHgQ+RqR2RuIQxLB9I/xgj8PfP5rQQppWoH0gwsAzgBgP+sX6Jss86rUbXySiBcnlauc
	 773QCAb4etv2RaU8quEN5GRW0MIaAIIT5yKhC5ejuxlkuLB90kyJh4bsgOYXFqDxOIW9/
	 a//89FWl/tRNF7RmquCdNbIER2BhxBPhrsdUAQeQYqeZ2bKNReheHzHQtkk1+J+jGCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cFEtGTVF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FOTAyYVU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B91606A326
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 22:43:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9B91606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cFEtGTVF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FOTAyYVU
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K6Cen720412
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 22:43:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2sxsRWlKfg/leqhheaFNE/
	NKgDRvemJZ2eId3SX/IcU=; b=cFEtGTVFLjWo5+wGENJ5L7U9pK2ayuS/WFm1yN
	ofFzmL4YZthsZShQqlpCLHrQdnjfF+oPSU0y6gtWM6AcXlMyUZiOX5NgpH4pU35Z
	NqxVzrixxjnQy+7+A6a3XYgcPK5YLCrbKIFX341rGpxQYbDhXOJIetzUY/3w7gKM
	/D2GnuynspZPT0m0IXoXYraiDM811z7iyZhRmQTP0TF9wizas2h52FRqho3ROrd6
	I0eyjemlg759tZN38jRI0ahceS04X6qnkApIoHTD4BzsaeGHysL6WnZ/qCLJESlY
	pnN4Pt4Mc7e+F9g1MiQuUX+BTA3hQEEiuN8kRnP/YiIzjjBQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq0870t30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 22:43:11 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so8072926eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 14:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793659387; x=1794264187; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2sxsRWlKfg/leqhheaFNE/NKgDRvemJZ2eId3SX/IcU=;
        b=FOTAyYVUoqU6xgMxeQnkvontGFVteobdtUfDn4ff3dulDIRJhKS36jCTnm2kiYWfRQ
         4+Y0SWt5aNAGUwP947XA7WIzbdLYC0qH/AP1JM46Ri7LiW/0C/AVoj1wPn6iz+QPdhgT
         LOOjpjF1iNmc9YMAZt3bs3x6Vu+5DVJPKBn5R97jGXNk+DmYgfysSghvdyzvmEaxINSy
         Rrwqn8ul//QRULzcq3dJl0nRI0/9g/ku2nPuLJSSM5d3GwC7YuKubpvZX41uiTy6DcrH
         LOV7mSW5lMo0uUmOzIsUZLKvCBS3MugqU/y1/VgFqzwCiOgPgNif86HoMpYD2Vu7i9J4
         m8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793659387; x=1794264187;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2sxsRWlKfg/leqhheaFNE/NKgDRvemJZ2eId3SX/IcU=;
        b=G+OPTC7ysy9Bx2fHdwBphqACW0z3/7JtHV/ExA9XS1+AYlmdeHdg/ni+zcL+tHWvPF
         KZTIRZR7Z6pyf79/vI3r8W7xQ7r5BVX3dGm4rfATWeAOv0sQpIPXq7TwdHL+awLJnWxF
         The6oAdqfCBwThg0H3hh5wcjUI90Vsw6ekHtBNtdOvotKz0xR7s09jiQKX0g+ppen5rz
         3rbZIB4LkzNV1OrIlLCFatP9m4sscCV9Uh8NwVGaMZ/goJl/PQ5F33uKvIon8mCphDEJ
         nVxeUpE50P9Ge4Ak1dAsFlCH+0GGlYI6PI5FO3PI4AjJ2e7lCWH/9J5mxiP59kUHcPR4
         Bmwg==
X-Forwarded-Encrypted: i=1; AKwUvBwGNvNL9MVPrGf4LyApjZT4N+XErx/683c9KJ0FIfTJMuhHz0ENRCzr4qRKiuUPA4QgEaRtWKXo2bvPYIfb@vger.kernel.org
X-Gm-Message-State: APuU4Z9wZm+FZoxtiqfGx+BLbW+93NPUg5Dda9ClGWJmbJPh/V0xcd8N
	6r7f5AWvXBio1dvrq1gEzyy+ktA+QpGvSNDb5+Y+pGMP0nMo/VAOgGo6fYHc1DINyXVxoco3LIj
	bU+051OPKIEgR3hjeeffGwD/Tpy5TzkDnL211ZKAR6ZlQJUobU5yVQQH7rUOk79pJO+vN
X-Gm-Gg: AYBFou3ZNR88piI2TPXInWekbhOQRY1KMsKm84PD7oWCY7tmDGA8iuyge5L6+xylS0U
	mNpnbCenO0DCmWF11QBqsjMzBGwgSLXAy3eAY24gGbkGHAMvNlNFI5gwxQhcTqiouPZnhpr80z8
	Ovv+iQZ0ZmppY6yqfqEALnY+EROTPMnYTb/31FLC87WkOvi2ynwOXjHr8qNy0oqh2AGcIRjIIVm
	t41f8sve4Xw4qjFBFVzrklRt/Vq6OpBKm/nkjHRZEWg381FwxHls8UW81ocCtFkmEF+BjXDjQl6
	VhaqrqlFQ+geFZqdhe9/gZKkB3s7ofQDA+EKIkkEMVf1ZZbWBXb6VORCiRMM4fhMIVkimSHVz4c
	5y48lOAtb795IqtVQ3/JfvPS/nyTmsbgrkp8voxTUPXCkWIQH3VgCj+sSREyAmpztc5+kAbEVNc
	bqMQ==
X-Received: by 2002:a05:7301:7e14:b0:367:363f:6fe4 with SMTP id 5a478bee46e88-36a423f6947mr15661257eec.32.1793659387264;
        Mon, 02 Nov 2026 14:43:07 -0800 (PST)
X-Received: by 2002:a05:7301:7e14:b0:367:363f:6fe4 with SMTP id 5a478bee46e88-36a423f6947mr15661231eec.32.1793659386617;
        Mon, 02 Nov 2026 14:43:06 -0800 (PST)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm38673319eec.19.2026.11.02.14.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:43:06 -0800 (PST)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: [PATCH v2 0/2] rtc: Fix broken RTC alarm support on Qualcomm
 Glymur and Hamoa/X1E80100 boards
Date: Tue, 03 Nov 2026 04:12:16 +0530
Message-Id: <20261103-rtc-glink-cleanup-v2-0-895eb6e8d890@qti.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAMgR6WoC/22NQQ6CMBREr0L+2pIWsKAr72FY1PKBKrTYD0RDu
 LsF487NJC+ZebMAoTdIcI4W8DgbMs4GSA4R6FbZBpmpAkPCE8kLLpkfNWs6Yx9Md6jsNDCeFkK
 mPDuquoKwGzzW5rU7r+WXabrdUY+baGu0hkbn3/vpLLbez5//8c+CcZYXXGBWyZPO6osjip+T6
 rTr+zgElOu6fgC2x/FGywAAAA==
X-Change-ID: 20260806-rtc-glink-cleanup-038163045afd
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, Raj Aryan <raryan@qti.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793659383; l=3682;
 i=kamalw@qti.qualcomm.com; s=20260406; h=from:subject:message-id;
 bh=1PdOOUp2CYNC2i5yaYElF8vnXcP3Dq4i4K1LytEr1YY=;
 b=6Tdj666FpYLsldYchKz9aU5buXHYvBfgYNwEQlv8wuYYyc6e3pNXRZ5JqJUO8zA+vAhiPgQ2U
 e9KJhOVA7WqBz+fuJh1Xhk7nHTR7iWfqRPSQAQbNudc7f9M/PNLj5OY
X-Developer-Key: i=kamalw@qti.qualcomm.com; a=ed25519;
 pk=ylH1NxUZkBpYsmww89g6zVxpS0q8qthtzcORkYxn/Ag=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4OSBTYWx0ZWRfX+vjc9K6aNG5p
 VpU/ZmpHdXbOw06ziz84f1XHk1tg3kmJwnMSSZfatFUT0qgIYAJucKi3fB/MQ9b2RkHIdvsAQLQ
 cRgsttl4BdkaNfmUQLjTGWL4Stk0y8A=
X-Authority-Analysis: v=2.4 cv=K9m3jCWI c=1 sm=1 tr=0 ts=6ae911ff cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=yMhMjlubAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=P-IC7800AAAA:8 a=Opl38xjawUwNXisF-KoA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=FO4_E8m0qiDe52t0p3_H:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4OSBTYWx0ZWRfX9Kn3fuHJsRnN
 uYAEUmrodObczy5DDZD4VAlVfIL78O/nLFOuaZTwRFdD82zGr2CG4YwMvVAVOL/onnlIvldKBlF
 QnaCZHxtVaxfnCALxNVtucTtVEGhfpcJjGvs6uTV3UxR01KqMhfsMrYvT1IHENkqqDZSptFJxoP
 o8dX+9aL6FgqJ7eJ2zwnagrsPge0zNwf1iKgv+VkLTg/LugpZGHkmkoPsbZZHSap11bbmIxdvYC
 yD0Y7+b3TBJT0BTYgKg4ptH0uRuMw+bVLcqoBLmBEtVu4kgsFQoL0XfV9JOYJ7p8jDvAtALPKl1
 a1GDPpanKeBnnZtEcV+bkA2aMauu5vLia8skdklfUSadxgQNcQsacuom+sKkfHp4gFot+BMrO5r
 EA8iUAffPkCk6vJuTGz1Qi2I33ZIjmaVNvXMS2jvgx2NgiFI6FTjWIwk0Vs70nfj7p/LPeSZodk
 wRlNmRL5wYCjJFru3rw==
X-Proofpoint-ORIG-GUID: z1KgXQzTiefdzUPFWToZ3wlSnPxM6_Ef
X-Proofpoint-GUID: z1KgXQzTiefdzUPFWToZ3wlSnPxM6_Ef
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020089

On some Qualcomm targets like Glymur & Hamoa, the SPMI based rtc-pm8xxx.c
driver is unable to receive alarm IRQs. This happens because the SPMI IRQ
permission for receiving the RTC alarms is routed to remote firmware that
implements the TAD feature [1].

TAD feature is a standard feature on Microsoft Windows OS based devices.
Since Glymur and Hamoa were originally launched on Windows OS, unlike the other
Qualcomm targets launched with Android/Linux OS, rtc-pm8xxx.c can not work on
these targets to provide alarm support.

So in order to make the RTC alarm IRQ available on the Linux kernel, the PMIC
RTC Alarm IRQ must be relayed to APPS from the remote firmware via Glink
interface and on the APPS side a new driver is needed to register an RTC device, and
provide time and alarm functionality.

To support this, add a new auxiliary driver rtc-qcom-glink.c under the
existing pmic_glink base driver, which will register an RTC device and will
handle the communication with the remote firmware for RTC related operations via
the pmic_glink interface driver.

[1] See "Control method time and alarm device" in the specification:
Link: https://learn.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-defined-devices

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
Changes in v2:
- Extended this series to include Hamoa RTC support (along with Glymur)
- Split the single driver patch into two: the pmic_glink client plumbing is now
  its own patch, separate from the RTC driver.
- Fixed a UAF on driver unbind/probe failure by registering the
  GLINK client only after the RTC device is allocated, and by
  explicitly unregistering the client before cancel_work_sync() in
  remove().
- Fixed a timeout in qcom_rtc_glink_request() that could leave the
  request/response state out of sync, letting a late firmware response get
mistaken for a subsequent request's.
- Fixed 32-bit wraparound and sign-extension bugs in the time/alarm
  math, and removed the ticks-based time fallback entirely along
  with the offset tracking it relied on.
- Renamed the GET_PROPERTY/SET_PROPERTY opcodes (and the structs and
  helpers built around them) to GET_TIMER_VALUE/SET_TIMER_VALUE to
  match the firmware's own wire protocol naming.
- Dropped the "allow-set-time" DT property: the firmware does not
  gate RTC writes on it, so it was host-side policy with no
  hardware/firmware fact to document, not something devicetree
  should express. RTC writes are now always allowed.
- Link to v1:
  https://patch.msgid.link/20260807-rtc-glink-cleanup-v1-0-7801e4d69c4f@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-rtc@vger.kernel.org

---
Kamal Wadhwa (2):
      soc: qcom: pmic_glink: Add RTC client support
      rtc: qcom: rtc-glink: Add new driver to support alarms on Glymur & Hamoa boards

 MAINTAINERS                         |   7 +
 drivers/rtc/Kconfig                 |  10 +
 drivers/rtc/Makefile                |   1 +
 drivers/rtc/rtc-qcom-glink.c        | 590 ++++++++++++++++++++++++++++++++++++
 drivers/soc/qcom/pmic_glink.c       |  43 ++-
 include/linux/soc/qcom/pmic_glink.h |   1 +
 6 files changed, 651 insertions(+), 1 deletion(-)
---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
change-id: 20260806-rtc-glink-cleanup-038163045afd

Best regards,
--  
Kamal Wadhwa <kamalw@qti.qualcomm.com>

