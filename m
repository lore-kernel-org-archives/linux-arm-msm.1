Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A10218592
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Aug 2026 13:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785677345; cv=none; b=ADIOxdYHzfZ1CSAAlzx7K9IJonnRVE6Nc1M0oLqOEWmAFZnC90WbfNI2y9hmWZOe6/CPYAww+Jz/vSSOuxKUt5CiUUUwWjeRUTDvaPqOV4hjUfyHs89LH1098SWk5FHGVO1LWBUV69VNN+QrbAEj/SINDEymmEWihuVxkt4UyNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785677345; c=relaxed/simple;
	bh=kbhSn9rH5+lMmQ/TbTseqCh0KPhB4eN5yoO6i5y8SJE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EiXdJaC/6zNTyHMWty0P9gAYaymM3ZbVFv1/6epXMojJslc1CdvQcO6glOndcQ8kU5FIkVo4txe7tvoz+8CSgN6WvW7YWN/Fl0eccHHOiVpf0XYBfH/GMieA4n4dqYw/g+FLP88xjqrmOVO8UHQI7tOOUh/AMF3xlMih1Wx4H+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VTNw/l/k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OymBXNE7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VTNw/l/k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OymBXNE7"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672B6enQ1506336
	for <linux-arm-msm@vger.kernel.org>; Sun, 2 Aug 2026 13:29:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dLeRs+t2ZRiTtPdFDHaqKh
	Ch30zvtwYNYjJ6oVNHgWA=; b=VTNw/l/k11zsuhobVfKGeXAzHuXlVXGXKpds79
	AZHRzkj8ATVNIlDNWKzegazD6KZ/960mDI0LXuoPS0HrcxUyecNQOcwBmcUwNOTL
	wRqkAxWjpvyOxqkTnGtG0HgtHYXgUO6kf6ICSwL+y33FL8pFhVNznQhRFFZqgIse
	YrK05N/fDN8XaY7NYgX5+qMMboLnImTW9c/q+9TnpSidOC/ktYAD7Np4SZE2BFH/
	RFMaNplY7uqlmw9/YxAAzA6flVKNX7He2tWqiW/UKU2ON8MPewIbtgi39J9Vnf0b
	eoA8gP4hrVJ2KAU14HbbIhPcDN0I1SJWZ3EzO4yh9Q/agDMQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8u9avyp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 02 Aug 2026 13:29:02 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c856470fe9fso1847759a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Aug 2026 06:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785677342; x=1786282142; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dLeRs+t2ZRiTtPdFDHaqKhCh30zvtwYNYjJ6oVNHgWA=;
        b=OymBXNE7YMcNs/YOYagOG5CeI9pHED/gnoaAw44JCoyLM7OQpdVAUUcBB1icE4Nr6V
         BNKnzHUS5vtkndQINCDFfOjtfrImMhfgvHjGdRDA11SFL7eUCJYklDxruW8eubGYNLkc
         C/vYlV6ncq6TUXKuDEwD38BATTpOoNWYEVV+Tqftpw/VuqtHXuZlyH/OQ9dSgPZxoVvs
         6LRack2MvSZA6MSSeqY3wZ4B62dDojJgGe16z7GiXGD5BCZFyrOnTLrYnoyUkKtiGyWB
         ZUYFlt+JKVCECwJ8bgnf9OcQDoRRVzBtr3+vSPgyzjr4hrLQOL+HFC55Zt3nmPjTwvW1
         mwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785677342; x=1786282142;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dLeRs+t2ZRiTtPdFDHaqKhCh30zvtwYNYjJ6oVNHgWA=;
        b=TUupmEavMGogWQrr9JlkLCVJQK92QqcfzJJlkIPCLmhz2w3UQmCMBxHXUkeyWW/5NO
         bhu1ZQNlFGdPyFFfrl8hHQTx1tqnI+qIaW6G+14qfDq6wratLpM158yNv7wDnOS877x5
         GgC18Pqep4NYVNwCoOIETCVRHJ9yywWJTzuK+1nUekDT8pDKOi448i83IJHUFVUeO4sj
         sHXg3FkI6N/9lyDFvfuBJgDIHKV/dSfwf27nUf1mqpeL9aieqpYHT84nAvuFDZeoNiKn
         uZiAL0QUdqCzjSrSimXpuxW55JxTli41GVlYqGdJqjZzX84hiJEuHsrjyjuCIWmKlZTG
         ZECw==
X-Gm-Message-State: AOJu0Yxy3/TDUg0EQt1V5jh/gJG0100sVveAVNLmQ0l5h05a1UP1VN7G
	ImyHF2CkC39tC1bcERWOdenu8GSvlj68XVHa6h3CKweOF8qugonWCX2hgPzgnqwZ0Dczuiun5kY
	iDdDLfj0yVhGKWo/yxVObALpdPSEJ0ctxjiEyceJm6jiL8a0awUoVocr+a7LnGAnReKay
X-Gm-Gg: AR+sD11kOISQSpc794eaVC9BHMze2v1zf/Fm9h+mU03lWhi0Mw6RKnuvm1KxWDkWJdo
	cvMCXda93tcT+cxvSYR/y4dM8TPt8OVc1Vv8maun2WVuvY0F75WhlGR/P4iy/AiL2rxAVcP+CXM
	in+WTgunkZgKYMd148RJaLx9lMu7z3COQnfhBlX1ob5+NScELn1IhrrFv4372QSyBWjV6C/QNYo
	Im5ng/F+wyXJmRLj4WQIWimzY20dSLhNt9zZSL2BK00+6uAEmcqwPdqOmSDjPp7eyYEPwz7n3+Y
	Qm/8Z2ac0vj2I5TeeFUCOV1q4zBx4j2xq3NG6Sir8yoi9LR93CYgFgaPXURm9oPQDZBK8KDjpMb
	y27xrULqahd3ryzdCtehGllzRcKDi
X-Received: by 2002:a05:6a21:e545:b0:3c6:55f5:26f3 with SMTP id adf61e73a8af0-3c92a951e85mr6511342637.67.1785677341602;
        Sun, 02 Aug 2026 06:29:01 -0700 (PDT)
X-Received: by 2002:a05:6a21:e545:b0:3c6:55f5:26f3 with SMTP id adf61e73a8af0-3c92a951e85mr6511329637.67.1785677341130;
        Sun, 02 Aug 2026 06:29:01 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153db2f911sm30582951eec.0.2026.08.02.06.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 06:29:00 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: [PATCH 0/3] soc: qcom: rpmh: fix kernel-doc issues
Date: Sun, 02 Aug 2026 18:58:52 +0530
Message-Id: <20260802-b4b4-rpmh-kdoc-v1-0-0f5026293d9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABRGb2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCwMj3SSTJBPdooLcDN3slPxkXQMjQ7NEoJiRqaW5ElBTQVFqWmYF2MD
 oWAi/uDQpKzW5BGSKUm0tAFFJ19hyAAAA
X-Change-ID: 20260802-b4b4-rpmh-kdoc-0216ab4b2597
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785677338; l=1503;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=kbhSn9rH5+lMmQ/TbTseqCh0KPhB4eN5yoO6i5y8SJE=;
 b=ZMdySVRhzO2Zn9gRAJHuzvfrYf8iSLKLgCgRziDAXmOAO1r5lBulALrFoU18zkKK8/7zsMXD/
 hxwPoW7ogSyC8W8S+p6uVJiPGG8F9BDppC3VuNyj+Jm4XuqcfNivmEV
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: VBPtcU3mgbF1e_jJZq35-MbrU0VZXEGf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDExOCBTYWx0ZWRfXzA612nm8Wnlq
 wOS+3fFMsusH+W8AsPumNIK/OPM3QhpI2QOAzA1l1HXooDcNzhzYq2VvHA/Twcyd45jQy39p11I
 nyO1HvIk5S1r7GeydICNKefrYPkROZsRoCBIGEXNCcBw/0EFTi/AvYcA73eWW0t9JxBFqI9Anki
 ytzilt7pMZPAgWC6qEPbtndnrHTzfqmHZkf1k8yXx3qlXFyrEcOr6e76sA8dH4SiQdSDUTXiu+O
 Ok/Ne335AvjmKSwz80aqzvtiJHEJ2ZQ7qQgFaP8rcQOcvMZ7eCWLIase5rCscKHCbNydKelz197
 a6QUBNFz1yRzN5EWTPYZOAXuWBfUtEiITYqs+cLmQmXjAJOUaZftfKNlwGnF5LM/F9vSalO8VAT
 uYfzQL+pqUshJDyny8W+GQc8GaETI7VgpaBrJQXxZ72uuRNaxXM1dFjx7H1+6Pbdke9+QkSCCXo
 SkK9RzIlmb5ftd8MvmQ==
X-Authority-Analysis: v=2.4 cv=LsCiDHdc c=1 sm=1 tr=0 ts=6a6f461e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=AcurGBIkIQkJY1Ow_foA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDExOCBTYWx0ZWRfX9No22iJx6CxD
 bpo5qgraivsOOroZ2tlUfBP9+G9iOYFEVvvismHXEAwkL+qeTD0Dqf4bOFI/zqPmUSPjlC3YvJJ
 kaISJM3tuQFg+ad/ZelxnIcUb04Mbu0=
X-Proofpoint-ORIG-GUID: VBPtcU3mgbF1e_jJZq35-MbrU0VZXEGf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608020118

Fix several kernel-doc issues across the rpmh driver files:

- rpmh-internal.h: add missing @ver and @regs members to struct rsc_drv,
  add a missing kernel-doc block for struct rsc_ver, and update four
  struct comments to use the 'struct name -' format.

- rpmh.c: fix a typo in struct batch_cache_req title, fix function
  comment format for five functions, add a missing kernel-doc block for
  rpmh_tx_done(), add missing Return: tags to four functions, fix the
  struct cache_req format, and fix the inaccurate rpmh_write_batch()
  description which incorrectly stated that SLEEP/WAKE_ONLY requests
  are sent without caching.

- rpmh-rsc.c: fix copy-paste titles in rpmh_rsc_pd_callback() and
  rpmh_rsc_cpu_pm_callback() which both incorrectly read 'Check if any
  of the AMCs are busy'.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
Maulik Shah (3):
      soc: qcom: rpmh-internal: fix kernel-doc issues in rpmh-internal.h
      soc: qcom: rpmh: fix kernel-doc issues in rpmh.c
      soc: qcom: rpmh-rsc: fix kernel-doc issues in rpmh-rsc.c

 drivers/soc/qcom/rpmh-internal.h | 16 ++++++++++++----
 drivers/soc/qcom/rpmh-rsc.c      |  4 ++--
 drivers/soc/qcom/rpmh.c          | 40 ++++++++++++++++++++++++++++------------
 3 files changed, 42 insertions(+), 18 deletions(-)
---
base-commit: 415606a7be939835db9b0d6b711887586646346d
change-id: 20260802-b4b4-rpmh-kdoc-0216ab4b2597

Best regards,
--  
Maulik Shah <maulik.shah@oss.qualcomm.com>

