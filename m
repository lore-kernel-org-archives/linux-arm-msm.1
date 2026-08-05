Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20E03F12D3
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Aug 2026 09:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785920670; cv=none; b=UlL4+VQLcc2uEIb8v4JtjYp/av24OAOkjkdZYuaP+Hd36Hj+08dO7bJEZNJSnw84jxXsDHaRSjI6VgH9efSDf+Xq3mY0rrEcivWMRDxTwOe5cI5SMQKI2z3i1y0GrVQGuKUvmkX5JeQ88tEyTDTBviKXK0UJV6DFfwmZXGY5CUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785920670; c=relaxed/simple;
	bh=Togxkij7C2kme5QIwEaqPDTm6F4zgS9K2hAzMNbKeUs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WPmgjyG7/NgunnvVn5wbgreQRna/cBMdfETcOVZGMV+aDG3To3aZuaHegjgQg6DCrJVx9iMJiwJxW0cm9Jtm+1yIb2CXIFoLR8uj2VTDHIOi6MmxmWR2SFihD1RHlU0SZMgPu+Uqu3zdJ4oFlPkb+WrWKG/Kjx7LxVe9gmJPJVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ByhTEkYu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bbE2pNhC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ByhTEkYu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bbE2pNhC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6758dHXC2468138
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Aug 2026 09:04:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=S07xUqBE2zxyvFUizW8oNK
	HkrfqbQ4/cDGPc+H/8vxg=; b=ByhTEkYuo851WEd4/El6XQnGUnpOwN+0rU6Q76
	1RnmUzzRxWldkGsw7FmNsX/bVq7yYJfvNtoYixqZZ3pa5ch3/sJxuIKhuPSke9yU
	ruwDLem/W9wv1BYmuzTYuRMamIl0q4zPBeQ39MbUctCBb4t74k+INCjfP9LxFq9W
	yxLJgONlspDNhgwwjQJzA9SsZoxTWQay+yD2SnVjcLAE3ivfHO1awi9fXzMtdJaz
	eptVFYypUVE8ZaR7/mkmgVhMk8MYntL7oK7F51w3fEAq3tEno+g45kLwdNlVjd2O
	Lr28X/NOeGX43w3eJBuy9rI6dtwZNo3cTRYM64H1DeiOaeqQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum56kraw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 09:04:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d04908139bso14850575ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 02:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785920658; x=1786525458; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=S07xUqBE2zxyvFUizW8oNKHkrfqbQ4/cDGPc+H/8vxg=;
        b=bbE2pNhCBfxcu8wAEJkUynzUYK28kRBhblTREFyKrAb5B4ciFTn0e13N9+6W5jNRXv
         bj3tqOxI6Swsp+Olw9y2xJtzgeq0h2o9eeB8fTzWmu14x8yR/F56ySyAV/gOiNRvx7GX
         TtRd2HuVAvWXGQSAr3n9W9Sv3ZZkzudvcxU2OrGrYuDJk6FOR7zPy45Mnj7mrzJFQIdY
         ZhkISKnpIFEhgeKMWvQ/E4QJ1VSNntKt9ayUkGDxK/12EHbzXuxvnvy3f8rbJSmO7FRh
         vFg2/aOxAe7/Oj284uGWfzZFPaVyA1It2U5UkK21QoWeeR2nuN2FOWgu0ag/iaNs64pU
         1bfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785920658; x=1786525458;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=S07xUqBE2zxyvFUizW8oNKHkrfqbQ4/cDGPc+H/8vxg=;
        b=WnS4gLp+81CrBm/GAD9vPPiY0QmKZ1NV3mBWp+xi75BYn+LulGJPeUTKE5KtU09oEb
         6vsoXoqekRqQ7k0yKUs+TQlfsNMdxwT5L6T+na7jJ50CA7M4xZGdliM5XVekCL0pet3K
         WW6vVYqJpAjuwjtn+DTyMy12Moy1ai5oiRmXmudydup905Zfi46C5R9jMOwuuSSwAOjd
         ioOwBH8WqIJxNCWOFO32dEuSm6XfNb9k8NFiFKTEFM1oImXjjYrjf55Qg+TluGl1hP6q
         txSNoqHZXNLoU1EUkMRTC4l+a3eevZRg2cv/pwjFaFUDIDxAL4oCule/Wuz3q7RoMonK
         VqaQ==
X-Forwarded-Encrypted: i=1; AHgh+RpnfFB3HSrQHslykqdGVfXXfaFy+B6CsQyoe+70A7cV3TyGxNIzRLumPLnVZjTi/AlnYmwynvCm7pXvfpBh@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj/vhpC/H94LMsvEFnBInJTEoQvzfyhEDS7+b/ivSfx/SdBY9M
	QTVjOk+1JQ+fCOT4G7tN1puUTWJT2mg7LHEwyRvUnw3ljSq1gSD9wBBDWgEk85sgClr/n0Tphx6
	qreflKmtFglUS3G8fbIRvnAZm5jCMYwaJOz5nqgK7AexOFRqiyTXKpmkUrLeThTMAJ4XnHa1HZ/
	AuErmGDQ==
X-Gm-Gg: AR+sD126/f8vsU3EBVytFJqsiav9gQo2Y4heqMRzltf+PDhU42EQgk75AqpCgbHqZRw
	zBLafni0Wd+CyPkT8D498TV/KgePLfMbLB9FIarkC1ouk9tqudiixSDujKXh/461tCayDgc1N/r
	ge56xSeUR3dbRLDWh6yaSdpSQhag/SjjLPWoAB7KXaYYYRo6Hs/zFDYB9/ScLlcU6GjHYWlc7Qq
	C45XaMWM6MR7aVaBf3U30oBFS9hQMGpxF/zSjAk1uMyHAMPqSmz7c1R2JU6QXWQ3WIWHBoYd8yL
	Y0yvUDzA/qw6Dotuil36+83Xg9FRGUfwXdmkTf+l7TKlZ/9xahv/5bXGpWB7mbA2t969AXse0oe
	iU7OHAdyP6usBToEPAFWu92FdWtkegWAMUWpTww==
X-Received: by 2002:a17:903:943:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2d0ca770d5bmr57141285ad.13.1785920657693;
        Wed, 05 Aug 2026 02:04:17 -0700 (PDT)
X-Received: by 2002:a17:903:943:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2d0ca770d5bmr57140245ad.13.1785920657108;
        Wed, 05 Aug 2026 02:04:17 -0700 (PDT)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa4ba225sm14874795ad.61.2026.08.05.02.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 02:04:16 -0700 (PDT)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Date: Wed, 05 Aug 2026 14:34:07 +0530
Subject: [PATCH] mailbox: qcom-ipcc: fix duplicate channel allocation
 across holes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-b4-ipcc_mailbox_upstream-v1-1-dfd5ea18829a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIb8cmoC/yXMQQ6CMBBG4auQWdtkJFKIVzGGtOVHxwg0HTAkh
 LtbdPkt3ttIkQRK12KjhI+oTGPG+VRQeLrxASNdNpVcWm64Mv5iJIbQDk7eflrbJeqc4AbDjYW
 1XPd1Bcp5TOhl/a1v97918S+E+fjRvn8BIyekGnwAAAA=
X-Change-ID: 20260805-b4-ipcc_mailbox_upstream-086e6607f75e
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Jassi Brar <jaswinder.singh@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785920653; l=2158;
 i=anup.vishwakarma@oss.qualcomm.com; s=20260805; h=from:subject:message-id;
 bh=Togxkij7C2kme5QIwEaqPDTm6F4zgS9K2hAzMNbKeUs=;
 b=Eyrajja336QS0z/fiGaRB6C6NBSzrGckjtzm7X3IUmSiuDFvHEibuBtUY46G1Xmta6iR2GYRI
 fwsqMyq5c+aBYySOJSTfffF/gaQmYsxoQw3T6//7ySA9U67HDtWB/0f
X-Developer-Key: i=anup.vishwakarma@oss.qualcomm.com; a=ed25519;
 pk=Y9ilCu91UQrzHOM14SG2IjnmQ1QSroH5uVeBSWEmEDM=
X-Proofpoint-ORIG-GUID: VAuQoFFEE-ANTvDhzfVJ--Gwcsls3nx_
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=6a72fc92 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=F3uIU7Ld-pRBMvQ0qbAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA3MSBTYWx0ZWRfX3kHRUByahngi
 TXq4i31Rmkxz5FQ42dcaJcLt3w+WcdW60XlaoJzmcHbLb0hHaONBtPHRC2FZw4GA0/bg9V4XD7x
 Xfn4aSM/V/JeBEx4PO2GW7aGibCt0BQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA3MSBTYWx0ZWRfX2s6fU7pXccto
 alIh6eGzt+IImDosAfjv8zlxk8kwr9vptKfsNQVGdXYLVn1zlUn0stc8HKnEb/42FFWk33OkVfK
 nDnF8N7JLiX67Z4oPZuXITI2LUPd5iv+t2sem6+VBO8JvwNh4S6rjIPR+v3irPJRR5vtsmvTt70
 TkLoXqFSbXiSHVRocY4y5jD1Ah5pwvhKnm6tiP4yfsjWy512iRc6S5K6rMoYRwZ0uONkJHzYVIC
 5fQQcch7WInDInFO+McEkWBVTXzT0TVvbhj2AGLo2A7k9cgLnJDs06523HVCgCPnErx6ZyK3tJe
 m9lpIeHypYCE7PmpncR49sMFi9MJ/HVgmeDPlVbY/wfOip/V8npWEshGAONlp/0Xqakxa7AFG1c
 iuGDHriI7dSdgGB65iMHzUQoQQufYAPSQWy8LEVsxV9Cad/AaS/cIuJiTPBrmVfwONE7HTVo5lB
 2fdeN4Acssve54C9aRw==
X-Proofpoint-GUID: VAuQoFFEE-ANTvDhzfVJ--Gwcsls3nx_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 clxscore=1011
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050071

The IPCC of_xlate() both scans for a free mailbox channel and checks
for duplicate references to the same underlying IPCC channel. When a
channel has been shutdown it might have left a hole in the channel
list, which would terminate the search without considering duplicates
later in the list.

Continue the traversal of the channel list to detect and reject
duplicates, while keeping track of the first free channel.

Fixes: d6fbfdbc1274 ("mailbox: qcom-ipcc: Fix IPCC mbox channel exhaustion")
Cc: stable@vger.kernel.org
Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
---
 drivers/mailbox/qcom-ipcc.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/mailbox/qcom-ipcc.c b/drivers/mailbox/qcom-ipcc.c
index d957d989c0ce..dead907aa7a2 100644
--- a/drivers/mailbox/qcom-ipcc.c
+++ b/drivers/mailbox/qcom-ipcc.c
@@ -167,7 +167,7 @@ static struct mbox_chan *qcom_ipcc_mbox_xlate(struct mbox_controller *mbox,
 {
 	struct qcom_ipcc *ipcc = to_qcom_ipcc(mbox);
 	struct qcom_ipcc_chan_info *mchan;
-	struct mbox_chan *chan;
+	struct mbox_chan *chan, *free_chan = NULL;
 	struct device *dev;
 	int chan_id;
 
@@ -180,16 +180,21 @@ static struct mbox_chan *qcom_ipcc_mbox_xlate(struct mbox_controller *mbox,
 		chan = &ipcc->chans[chan_id];
 		mchan = chan->con_priv;
 
-		if (!mchan)
-			break;
-		else if (mchan->client_id == ph->args[0] &&
-				mchan->signal_id == ph->args[1])
+		if (!mchan) {
+			/* Keep scanning past holes to reject duplicate channel requests. */
+			if (!free_chan)
+				free_chan = chan;
+		} else if (mchan->client_id == ph->args[0] &&
+				mchan->signal_id == ph->args[1]) {
 			return ERR_PTR(-EBUSY);
+		}
 	}
 
-	if (chan_id >= mbox->num_chans)
+	if (!free_chan)
 		return ERR_PTR(-EBUSY);
 
+	chan = free_chan;
+
 	mchan = devm_kzalloc(dev, sizeof(*mchan), GFP_KERNEL);
 	if (!mchan)
 		return ERR_PTR(-ENOMEM);

---
base-commit: 0f6da28aab51b16762ed82e8fdeaa5042da45b08
change-id: 20260805-b4-ipcc_mailbox_upstream-086e6607f75e

Best regards,
--  
Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>

