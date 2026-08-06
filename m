Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DBF3E0C5C
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 07:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785999855; cv=none; b=YfByWn1d3foBj/Rlwb1ZzNTaRFOZ7qcKOwybLx+QGqBJVN3OclRkzXoI9ALa6oS7x0SNuURtQdbuFhSNCSwTa87gjbvXPcV5vVfDeTxiWJXtT7qH/IrDrvaty9q0EKCmhVR5w7vbXrX0raTOeFMDam2hgqQbKTE3jfjlMd8az4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785999855; c=relaxed/simple;
	bh=H6QKx2Emjk/rlp1rta25v0hWa3YxPKK8h+kDsYQPWSs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jBnD8zEnk0WcGvwgnV7UqPcQZbBDz3pwbSuXmMq6Us5V6tGeASR8UIfZEBomnWTj7sv9P3ItoWVlDlb8oFE5h5HDr5+5PaKKXlpOIHpWR4AHR7rAjPh5uZsCRK6POPvhCqCZQQvIbQVX5Bl2tRsP2/mVpYwJQv+MvbB6qc0GrAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gVVNh00z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J6rDo1zq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gVVNh00z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J6rDo1zq"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6763wjeH1070736
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 07:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xgLJn04TYXjSMKET2PzbgD
	RiW0Fch7C6B20lyKlrkio=; b=gVVNh00z/ccc7HCqehYqEhXiNoEbM12oGZABb0
	KPaaySgpr/Md10PS334N8655lSR9SDLxASiMjZqoU9ZzfiXVdYoNRGWq2QspIBK8
	dY6jpuAw8Ep/Vn3mpH8JehcGzuCkGR3FOG+G4C+nK7hr1xISH5bDD4vSNlsF7/2L
	ma86mKkouRXDSrmnzCw8FOdQdx5G/2cKmo01b7Id9xE2urJILsvuCHTj6TplhaG5
	+uFWBHMLT8+wmgoekbJH4G23WYIJHDeAlojdH/qfsZvC5DY/PU+aWRqN8SI1z1bS
	1F/wqodiercWtxNFWJXDuipV+1l32O8OxKpMabiTrnhXYGsg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjucgp63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 07:04:13 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca124bf0189so565731a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 00:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785999852; x=1786604652; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xgLJn04TYXjSMKET2PzbgDRiW0Fch7C6B20lyKlrkio=;
        b=J6rDo1zqR8mqiDtEVVReWYch0iN1kfi4UXPGHSUOI4lK1OvADaPEvkOnH2HtRcHEa6
         qV/vwblN8khT6vauAIw9551LnV2kTvxyWmR0yCMZT03TdBS9hIxJQeLIi6tJxD4rxJF9
         XGrXJ8r9UN02K45nnS3iLbcl3SXvFt74l6nmBdVqFeYKQfO7Usgi7PFndlr8fjSa0wh/
         HBNY0LqfYXUQmGeGgdlOI3T6rhdERyQVknapgdhndX5HMb4dn22HfNJyBVD80Z9RVDU3
         AIP+Z1m4gc/izY4HCWPPaPC0rkFVbsxKbVoq2lye5hRFeIO+FDHt1R7kPeG2Tgu41iUs
         s4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785999852; x=1786604652;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xgLJn04TYXjSMKET2PzbgDRiW0Fch7C6B20lyKlrkio=;
        b=WeURWtqxsm4KIesYjIChy91M9BD/XvNeF7RCPhEy1OAnPEKv8I2z1gJn/KQFsoi/Hr
         HiUOgRKZc8mIVF5A3uQ9eIxL8FR7ImKBCxPJ3t6T8psSpt6Mfx87jYKCY0q94EFkc0bp
         GqI3jXZfEyOxl2NBBET0snD5ObPK6qWNUIQ2QFnrGFMPlaNQRBNCiJ61Hp6wT+VYh7HP
         rV9+XTR9/+4pAATFlFftgyoT2uptx8/qzoIJI4zR5nF9kLQmcXiCeLO7ZBIa/PPowQfV
         68xTqcAct7IwctTtS5IWKfYTMywo5Zi7Tbxf7e1XxY3qdlLS/1v9kV+3LINS7AgZuV6N
         84ZA==
X-Gm-Message-State: AOJu0YzaHoSWXhs38LgChDGxNDtDT5FFe4X38VKl34ZH/d6jxk1Y6uPv
	dPul0L4PQwDeRTIE4jreGnCRMSl6cVIE3y5IHANGHoaQXGaFFOxlUC0ECY4bJzwD1Az5SD1frFn
	H0DYIUoOPagyaRdyZ8jl0+tGnf2KKxf7uFCXPBYXcCT5GcTFDSUVuoiJdIWN7tFVLToRf
X-Gm-Gg: AR+sD1344/gVPOqZJdTj7yvaoHL1qILIKPtLK31/vhPnbXM5ERhYcVlNe3BCci5l9h4
	3aJ+f0VK9ipXELBAM13Eoq8LlNyZ5ip/kalBsRs6oXHcH8/D4iEqWyvvzo2I5vfTIdSmp/kw6ZB
	DKSi297OWGByfvBDCkraayNIUx0bdyNLhN82FPku7rKm32XKuR3u6KGIwTAOFnrTodEN6cn+GjT
	Kzb8pYVoNx4hqcTGkPWJlRs1mmhyKP1k5tjmSO/KMlajp7fTyIazBTSEIdDVQXZD2uGi8ABfa/+
	v4l9WzulaDMzajWB6h5VPggBXpLVsG54/R7J1I5iKOOdRXD0AbU6wrrzmxHZ2FbNDkCjhso9SV9
	0J8eYhEhzS+S/N4kTLmpkmQ==
X-Received: by 2002:a17:90b:4d0a:b0:38e:c232:9d2c with SMTP id 98e67ed59e1d1-3908972cd26mr1033411a91.2.1785999852384;
        Thu, 06 Aug 2026 00:04:12 -0700 (PDT)
X-Received: by 2002:a17:90b:4d0a:b0:38e:c232:9d2c with SMTP id 98e67ed59e1d1-3908972cd26mr1033374a91.2.1785999851826;
        Thu, 06 Aug 2026 00:04:11 -0700 (PDT)
Received: from cse-cd02-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085e4a2a5sm933308a91.14.2026.08.06.00.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 00:04:11 -0700 (PDT)
From: Jia Yang <jia.yang@oss.qualcomm.com>
Subject: [PATCH 0/2] mailbox: qcom-cpucp: fix two PREEMPT_RT bugs in IRQ
 handler
Date: Thu, 06 Aug 2026 15:03:55 +0800
Message-Id: <20260806-mailbox-qcom-cpucp-preempt-rt-fix-v1-0-d302a63dfb5e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANwxdGoC/x2NQQqDMBBFryKzdiDGEMWrFBcxTtuBxqSJFkFy9
 w4u33/w3wWFMlOBqbkg048Lx02gaxvwb7e9CHkVBq20VaOyGBx/lnji18eAPh0+YcpEIe2Yd3z
 yib01g16Mdf0wgvyIlvluPOZa/8NQ3HtzAAAA
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Clark Williams <clrkwllms@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, jie.gan@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rt-devel@lists.linux.dev, Jia Yang <jia.yang@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA1MiBTYWx0ZWRfX3YNIS9RhOlSO
 psxxTWERMQoMiIFJE9IUwgmoOxR6X0wnqt8SxjdnjpfDsmVrzWuhNn7oPxVwzhBb4FvkxycW2gp
 xKf+TrHpdY0wmAw7K6UXUwzk6P00xPg=
X-Proofpoint-GUID: zHT_nER484MUyYOWJF7rsu2duHOU3wIN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA1MiBTYWx0ZWRfXzAAGUtJyKvC1
 YfVjSzy58ro1UGwGXxfWgij+lqTfQiwjMhQNdmZnUnP9coXecTrt4gKknHhZAZz2+ayKmHSgOmK
 +wn/k4z0L/elkcl8FGtZNDfVkIxjqRUKWK9pLH2AsbYpwmWFo61dSu1nkFOU/AQRPkvoTL7RFX0
 IgCIowCSV11z/8j9XI46JCI8k4+5EZlNDUya91pj/qW/NFFzPNNW9Ma6pDJ49JyVBTlo4/G+U1c
 qclhSkQ3JoLTh8JYbbyBz1G/fQZOa3bI1ZPnFBc3RNv+JC1ONIX3y/Oxmqs1yWPAs/pjpC0WwPM
 LKUPs5o+07cbXOnWO/vvOvxpAkXHPL02Ra7U/oXwV89CvhujUctWapbMh0yVjSX5uX3GVL8ANYF
 tuUybNBo+Czl4Bz0NRiRuSVzVnu+mgL4P6z32mPkgSvI7Jw7/IJnrYpufpr1bLf3nM9ZoDZr1u8
 jbECVJiho6K8Cf6uTrg==
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a7431ed cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=bedaI3WIm0SzTz6enF0A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: zHT_nER484MUyYOWJF7rsu2duHOU3wIN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1011 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060052

This series fixes two bugs in the qcom-cpucp mailbox driver that cause
kernel instability under PREEMPT_RT.

The first patch fixes a self-deadlock: the IRQ handler calls
mbox_chan_received_data() while holding chan->lock. Under PREEMPT_RT,
spin_lock_irqsave() is converted to an rt_spinlock (rtmutex-based). The
callback chain triggered by mbox_chan_received_data() re-acquires the
same lock, causing a permanent deadlock. The fix moves the callback
invocation to after the lock is released.

The second patch fixes a NULL pointer dereference that was masked by
the first bug: mailbox_clear_channel() calls mbox_send_message() with
NULL data, and qcom_cpucp_mbox_send_data() dereferences it without a
NULL check.

Both bugs were reproduced on Kaanapali (SM8850) with CONFIG_PREEMPT_RT=y.

Signed-off-by: Jia Yang <jia.yang@oss.qualcomm.com>
---
Jia Yang (2):
      mailbox: qcom-cpucp: fix PREEMPT_RT self-deadlock in IRQ handler
      mailbox: qcom-cpucp: handle NULL data in send_data callback

 drivers/mailbox/qcom-cpucp-mbox.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)
---
base-commit: 3df25501ceec0d590d3ad416b571563beb364fb7
change-id: 20260806-mailbox-qcom-cpucp-preempt-rt-fix-36472b46a378

Best regards,
-- 
Jia Yang <jia.yang@oss.qualcomm.com>

