Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3205D3BBFA9
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 08:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785401205; cv=none; b=MhAUt+49arnAwtNmKmdlEW63P/XCi9Hk456cOOg0i8sJMnXmuI/6cbIORBoqfPuJwvck0UT/F2EmFID11qRzfp6h63Kg3GjWrjNZ2IyziAC/lY49lzkTs3N9jgB83qJZnSaNt7lfErUAPWQ+s1H3LhIRPau3jYK4mYf/xg9MjeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785401205; c=relaxed/simple;
	bh=OkLp6SvJE+z7IpClUlHJ+mntYYrDRW3sIGNZi8tgH/A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pMLaIjwu/9hfLnoz3gHn9k6USJJd60LO+OdKt8JszzlvLYpDAdBVZqKF19N5kwSujidC5+KnXtddIOZJnLbdqESZQHcFiEkW+sLGCCo6QhyDUxy4oykmHCxrO6o7nK93BGaV7pJBDXbv/LRKg5hkzkPj0FBZeuBDVbo3R+Nmhoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=euvKcfBt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FiCAucU8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="euvKcfBt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FiCAucU8"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U8hMJH313711
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 08:46:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=09+2pJlK2NdmgWawU54A0N
	VTmgxsF+fY2YroDxcD35w=; b=euvKcfBtUKUM5wWF8fZ+v+B2shVDleNCinhzim
	rYLKyEsWWGVT+vmHmBdTyKNlpMPpPnnGWfyGu01agJB4DoouwagujEQf0Op5n3XI
	YOZL5wAcvsZ4+SDJ+d2hwX2e/GmJp4R1pROOkpkq8gByZkyBBL3nu2xvL332TMy6
	qzwiV4lIf+rhbvPM/rXbthUR4FPJTYdbTFbju3cXCpIpDLvAw3Tdg2uu5Vd4c957
	3xNcFVP2wFPI9PeiQDjkWiwaavDJ0MOnXiXRRh9gtrPB2XRKigQjGAEp5XW838+r
	0iHjYP3Ixs8uH1DPbmihUaiwfqPOZlzI6YMCK7uO+uviJuIQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3bf80g1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 08:46:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so3335338a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 01:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785401202; x=1786006002; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=09+2pJlK2NdmgWawU54A0NVTmgxsF+fY2YroDxcD35w=;
        b=FiCAucU8ge7PjsIcBullziSr+D6HIybroBYGFmh5WB9ct1wmSkxoUFM3vEszH+5Lvz
         nx4Z4jvtDtsHbyOyyB8y9qLhlvWy1gCOWLaz2jfdw0MrDkgtXS1LX5vw6LNfL+OtgduF
         DDTp9prfa483T1IAIFGsD9c05pdGzZFtoMktsOI2leEpWo7nqe6/5BLkxTj/QgmqIXGk
         FDBIY9lNQ+XE8Sa3OZ+0yzzuXBcI59IYyBDHGrudLytWMorcm+pyEwCQN1814UDi2zjS
         g/BYAyJPp5YVXshY21JTO+aUkvk1d5+U5tbuuWe11G+nPTwd0ei5Xu7Abbj1l2XJxKBE
         xkSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785401202; x=1786006002;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=09+2pJlK2NdmgWawU54A0NVTmgxsF+fY2YroDxcD35w=;
        b=YPp1Wz6F5ya3WANmxCO/UtvGGj2noYNeLSZptPay5Pkt+0KgLw3PXWTyqT+d5oNGD/
         048MuU9KoMU/K9Q0EQWSwcZkovy9u1AXhEuqFrasDAg6JRe9aco+b/Ue1LOu9qQ3hOGi
         KwVqY9xMawGBPCo+91LOVRwYy62fiNtNuoOxXzNnHxG8Z8wqkzhK7MedDjrz+v6TvDVk
         9mBxPTTgOxrMv6MrKZLyLUdIlIFHG0PSI0n8fE2zc7sGIG0SQ61IsTR8fts9WtCuwsXz
         SiTe/nCttiKOCxYPNfsOw8Dn1TcQyP1/w38iRKB+6PrRTHyJ5EEIc8rkmDemjkrkrxVS
         GkNA==
X-Gm-Message-State: AOJu0YzdjXydVaqETBBWpybxJUD4WejprhsbgqCZ1K9IV5DP6vdBDbN6
	bIDPUFU+9HhT3wJxx7Vmh0RfJF/xRQWZLmKdGAt/USnqD6ZM5IlkyquZZfaknUWDe85/Taf53dz
	HhI8/hwNSkD2UqOZiDdUIMGk4bqOGJZ0FMt+fF5KTD78VPg3kySC1QhWTdEyiKR0iPLjazbEZFf
	YF
X-Gm-Gg: AR+sD10iDcDLYZ/5rIo398YkBax2rvpvVxL4CblQqL+VYIqXATfxA80ZqnoPQj4p4kt
	Nhgc/8RqT5kfL/v1e5ucmxWSajQPCmoM9KlYNtuGviK99Q7zWr0O7IfzCgXX0qie2aWchTOgkt6
	4Wgl0h7SGPzYdSse9GrbK1j0eqUkDTAS8Uf4lkOvhVJ4gdoNwWx4klObkpHlx1kfXpJFNZEdt9o
	5Tn/YVw4+0xxpGCVmGKu9oMPkjALmoibrk6/rpijMtWdOJuH8vBjSC+STHl97H6vbLpf/nR7ibM
	tDAQNT4b+mf0h7XPlLlwIMS+tKmbqT1dm40wjP/PtwoM1T6B0vijAypVlif9OcD1Lxv7Agb1LxG
	ksKrTdvhuk7U/+QBjhf+hUttrUG/c
X-Received: by 2002:a17:90b:1d02:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-38f9bd51ca4mr1656599a91.4.1785401201664;
        Thu, 30 Jul 2026 01:46:41 -0700 (PDT)
X-Received: by 2002:a17:90b:1d02:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-38f9bd51ca4mr1656580a91.4.1785401201247;
        Thu, 30 Jul 2026 01:46:41 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f8150f674sm964480a91.3.2026.07.30.01.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 01:46:40 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: [PATCH 0/2] soc: qcom: qcom_stats: Clean up macro definitions
Date: Thu, 30 Jul 2026 14:16:22 +0530
Message-Id: <20260730-b4b4-removed-unused-macros-v1-0-2883fecb9e6e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF4Pa2oC/yXMQQrCMBBA0auUWTuQxNCiVxEXmXSqIzSRjClC6
 d2N7erzNn8F5SKscO1WKLyISk4N9tRBfIb0YJSxGZxxvRnOBsmTx8JzXnjEmqq2zCGWrBgMud4
 ONPmLhTZ4F57ku89v98Na6cXx8z/Ctv0AIGbZTn4AAAA=
X-Change-ID: 20260730-b4b4-removed-unused-macros-a0b2617bf491
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785401198; l=1051;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=OkLp6SvJE+z7IpClUlHJ+mntYYrDRW3sIGNZi8tgH/A=;
 b=bvzFD0SHflIAJN+KJajFGFne6HluxxsbgVWjvt3awUcB0ffc/hCK4cwHXfR8xgSA0knCKyC+r
 auvt9+qqpHCCrS1f8O04hgoXKfDDQa4CB9nJTT9WMqqNxKDzoXlR8wG
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-ORIG-GUID: m6cPLcQ0hlEjNd3vDvvIkKvUOfJIQRIQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA2MiBTYWx0ZWRfXxPFCkhOCjx3m
 gqGjMRLRr+7ekFjs2KZ5N9IFjJ3oTFkRwxP2qXFuWD+CYtqcuTMy4zH/DQBsBtLy7SeQfs+MbVj
 i9Q5nezW5nD9X1vRU2jQDBIVdq+0qhU=
X-Proofpoint-GUID: m6cPLcQ0hlEjNd3vDvvIkKvUOfJIQRIQ
X-Authority-Analysis: v=2.4 cv=Pr2jqQM3 c=1 sm=1 tr=0 ts=6a6b0f72 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=0l28_E6bGm4qeQIln70A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA2MiBTYWx0ZWRfX9m7LBAKhcwOP
 OLYrcTAmUsynw+RjE78kJF+cibuNi48gm8MFFpnV4Ib72SgZ4DqqdYwqBrVgmy5gW7kLujZetjc
 vTuUAKRwnS459qev2X7YD6fNDtxp0OFGeCF+BIFm2eTBzgkzWq8iD+20AclhnN3244dG1cVG6WK
 tBEGe6aHOxsjclQ1dLw2iaXvP9Ef3bI4HKc5VTwhJow9GP63ExcuXcDm5yQY7PAWNh8Fgy9r+et
 RtfQ/w+niO5wvYQyIpuz5klAfmucoD6Gy3wfn4Nccxatjn1amsrToOXgNHhM/p9Lqx2TnWk/213
 bhhRcAfghU4HQmDBPiwDuLJ4B9aUeBlDWtme+YbKMJbYg3lLsOFahhaYBanNmkfoyNCsawQWb6r
 I/g+rPDX52FWuDWjuXDW9QGRQUwnktaLoDc4gmJ0ofXjvksRdxDQ0tR6ZOLeT478ZUS+YWCuLCH
 pNuJvKpsTHIvJe7g1+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300062

This series cleans up macro definitions in qcom_stats.c.

Patch 1 removes five macros (STAT_TYPE_OFFSET, COUNT_OFFSET,
LAST_ENTERED_AT_OFFSET, LAST_EXITED_AT_OFFSET, ACCUMULATED_OFFSET)
that are defined but never referenced, as identified by -Wunused-macros.

Patch 2 removes CLIENT_VOTES_OFFSET (0x20) and replaces its single
use with sizeof(struct sleep_stats), making the MSG_RAM memory layout
relationship self-documenting: appended_stats immediately follows
sleep_stats in the shared memory structure.

No functional impact.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
Maulik Shah (2):
      soc: qcom: qcom_stats: Remove unused macro definitions
      soc: qcom: qcom_stats: Replace CLIENT_VOTES_OFFSET macro with sizeof()

 drivers/soc/qcom/qcom_stats.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)
---
base-commit: 78bc8af4affb9a732504eb22eeac7d1e50883853
change-id: 20260730-b4b4-removed-unused-macros-a0b2617bf491

Best regards,
--  
Maulik Shah <maulik.shah@oss.qualcomm.com>

