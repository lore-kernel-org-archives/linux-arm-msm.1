Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793247592;
	b=kffQAIaymLiOYJsrflSKCFSgqAnFYXALW0PPw+RQhHjvBCxqLIeRWQFtRytCbY60vw3e
	 cYtmfe5zkBefvhoabd+C83da/bRKD5ipXIglFbfrM8qdkJSmI5OyLcRFReR/+wdQBCCzw
	 p/QAj4V1lOgjoe00gErDhPR7J1NQSJX1mi1oCe427yS0iMxZCvebFzMSkECboBMndKrGm
	 Nfw+6KIzSWTBXVqJkmq6sdt61zb7//mYCJxxQVXh6xgJxcS7MjT/bUGNd6e40Ol7Jr94s
	 yw29WhohYuK3fqdAR4SvyD1LzbxJTj6LLMMwEab0r+7yE0/WyxCraj7yDzhl3VCxtVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793247592;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rEbY41YsVheZzdYrsvwCvwskR/iVkvycxy1h1Iiep0Y=;
	b=fOHzdJL1+o87ltpW3oOUUVQ3Bse/1+CPd3bn9FqhK7awgxqUeassfRRQGv12mAF+gEfy
	 Equl2Xe34SdblvEQANTziDL6HqwUGZxeuN+ZWteihhdKocCeNlfGE+u89QdECiPSB0KFe
	 9rF9PdW46DUipQBccrfocBq3F4mXm6nD2ffzicl1puQMkxe0Um/foQOUpDdXhx5EL40Pc
	 sl4riygqBh4plJ7lqLnnlAw0HIDN3MRAbFJ9xu1O1KOCfjSLHce9yUMDff2msA7YDcVWN
	 eDHqWyG1PNBTZI/EH8CHCGX/X7kLpmnHI7Ajq6PyTc86I4M0IDmjKbzyq69B6qVDpkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GXXQF3GC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DbcxI7pD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F07606A32C
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 04:19:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46F07606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GXXQF3GC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DbcxI7pD
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T1jfNl3948015
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 04:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rEbY41YsVheZzdYrsvwCvwskR/iVkvycxy1h1Iiep0Y=; b=GXXQF3GC71loMgO9
	snmuMQ7oBYW67RHkDBMsWTm2LbPNoJqAuktcgn9lQRo8aw0FZvHn4mcrQZ2yCM7q
	ATYtJQmcKzHqMhUcDxTcEsCkYI1072xTV5kg7AVtyvQ7s4OGquz6dmN0Z3Bvk8hr
	0Iltac6eRsx9naS+8nU3BqC2HszZsZ/eemOwXne3jdhY4rniIHHAEQGpBWjQDCxZ
	71InPbeKyMPV3Ryb+OpAjoW+8zYQ1q4Ut0E/x3otARSAi7zpP/cewQKC+5aAnM7A
	VBzCfAzFXwYLrzvjU56X/fW/Wu64rpC4yq6cCL91M+mCfzHaAio7jnTIg1AuD1nj
	yJdlQA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkneut5pc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 04:19:51 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so3413391eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 21:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793247591; x=1793852391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rEbY41YsVheZzdYrsvwCvwskR/iVkvycxy1h1Iiep0Y=;
        b=DbcxI7pDRZZPKiqyamaYPyjurvzpHLY41PuCtng4Bp0He9cO6PERCWOvyJ4esrp64Z
         97fl8OZW5K4K7ksfayuVfyLbffU16VbpQJCWqWHgXa2mTOA8JbQPeFK+t10P7eY/XQKe
         milhy9RS4c7B32B9Be+JsKoyP7OIT5iznjVPyXZgKjQfm+SkgBa0xH0SH7Ejp9rYG8IH
         T1oqGGVpv8odKAFmYBucXsNvsZeNr9X1eKt2Rhtp6Mqiz7tOPt5+kj2YdC/XgN0LxmQD
         HyUDYTUkexuukhGv+uC2pXoIV96ZAebCCXKVL5Aeen9/1aJFP/CRY48fYikjqQ2mvZNK
         X4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793247591; x=1793852391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rEbY41YsVheZzdYrsvwCvwskR/iVkvycxy1h1Iiep0Y=;
        b=GpY5JYmQnkczaeaGCkOJR318GCQXt8fDRezSdoIeaepbd53Jstl1/6mkzeK1PdabSK
         0DjDvpZ3/areGPTK+Ic8SOLNf2yjU5vOycYmOiHE+bMPNcAKH5OJwlt+IaiPCyhyKg6o
         Yycy67ugA3+52tInYZKZ2/Oy3liuzS5kywj8KKH9ynOT9CQ01CPct0axpmsy5IFElvFF
         x3nHfFMIz6Co1XIyg7IkdVeMJ2h8gPII1I0k3EzipVPJQGxJ0qdGeedY91GhhS3iid00
         5HnonDSfUyhbuDzHOKTscVINJGrHy5EUapiRd4PWrJ7PnMsKBovFT5H10Y6uR4BZ3rWL
         3vIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAOm0aZWp/X9tm6SrBre/ry1miHmRVqTFQTPtP3KqOe984D1Wmybm9LYDK5YuXjHf2aiPJwgsinDXqZCp/@vger.kernel.org
X-Gm-Message-State: AFq9FYLLfJzO1dza5r13DILsgcpiGo3yv0BUSQ8NfRaEG5XSf9VtzUc0
	OxSYeXPVzZw1w1DVQW4vHLNxVDn6HH0EsIuLWKVyrTlMGknASVy9Qi8JAUSPUZayUMfovSqogeb
	p4y4ibJHNnvIg+oXUoQSVFGdRFhLUoTp3d8civmSnr72YNkEHS/pjEfasl2VTsIowoLdp
X-Gm-Gg: AYBFou3krF6yEdlwpYSHWX/L2VOJqrKmN/WrjnS6LUNkAo2ElBzeYpALfFJVy/ZGhaq
	dY8FbbHq2ZIORE2tP3GVeJpY+mUS0/tssEU6w5zkiLXWfgpxH+LAsqsO8AIfBetWDLee5dB+/mX
	Jc9j6jazh3GK2Y5gBu5k9kaH0PWXu0yfUwdmxoOFEttRwPO/R9DK+qLaFqRskV6ZXrxPY3RUKfB
	Cfmt8P4nSIkZM0oLdWyjJvayQALFMdRHU7vj5367B7JdAB5zSUCR+FEqHWSNsnm2jAnWC5tm7xi
	wABJOQwJFLks3QuByjZRMsfDCPhJlHN1I3P0gLlCNRCxgZ/MSGnHrErN21Z45gNFIBL0nSUGbJs
	/eH4+IHolGwx4cVmnGaNh92Vgurg7GhoWVL0byfjL+1M1KQ1S06u13iS6X6HQDHE5LDu+vD5Rlp
	oJ4zkO7Uo=
X-Received: by 2002:a05:7300:f894:b0:369:a162:af96 with SMTP id 5a478bee46e88-36a2039ca38mr6257721eec.17.1793247590650;
        Wed, 28 Oct 2026 21:19:50 -0700 (PDT)
X-Received: by 2002:a05:7300:f894:b0:369:a162:af96 with SMTP id 5a478bee46e88-36a2039ca38mr6257688eec.17.1793247590027;
        Wed, 28 Oct 2026 21:19:50 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a237be80csm27504539eec.2.2026.10.28.21.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 21:19:49 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 09:49:28 +0530
Subject: [PATCH v7 2/3] PCI: dwc: Force L2 link entry on shutdown/reboot
 without D3cold check
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
Message-Id: <20261029-shutdown-v7-2-3fd7a76a6991@oss.qualcomm.com>
References: <20261029-shutdown-v7-0-3fd7a76a6991@oss.qualcomm.com>
In-Reply-To: <20261029-shutdown-v7-0-3fd7a76a6991@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: konrad.dybcio@oss.qualcomm.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793247578; l=8264;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=wbV9rrwWR2G+Za98K3S+aHq+nCTGmFr3PDk/SAK1uBE=;
 b=fbIIseNWjxQ+FttSGUJukWR7PZ3KrbXpuZI26A9Q2C2tLrvBvOyovPQaYoojGUdkhwRRVHSVa
 omm5c1V/xK4AmiXmeB16bYYnmggaujEr+teNRdn4/75sYS8RlDyXWJX
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAxNiBTYWx0ZWRfX/E2lGHXCUWIA
 iG+fILq/QBhZaYAG6/j3IBETReQk75lMn0zuvGtJu3P2TTfy/5OwaCYMyaOmk9WPQPp+Zn5O7xp
 wTIowDtCo0aIgN6RGtL166Nap0gs923VuFGjyIQllmVODQ3CSwaXfWaNykOW3CrTy1tKUms/j9y
 3MSyq4d/nlUSukogPWOViX7mCED8cFDAaJGuoM3xkefN9KHn9ZwGO5t6Qc178pBl1kV+5lqzCkI
 2vYgrmFb7sqxsLhnP7KuaTBeEOJ9naZJNuZ+64T5476x2NqbK6YbfLc0LD7XQrBAt0zdn0bmdd3
 yGdOxqGXSHspvrtXgroR/P8FGeYFkBujerdp6gbXDM4dWRX8QSRpVt4y7TgBlRgPBB5xMl3j4UC
 SB/SPQaXWElDYAkljJYqBZHT/PCmvggHlPSvbwCazR9Y83/L+ChuQ5WxaVvIi3Ydt0p/iJGKGSz
 bd2Dpjw6rWIB2kyBxIw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAxNiBTYWx0ZWRfXzqf3SFHb2aQa
 b4Lvf02iHNzjWLAVGGt2HPn4VjKYJYPRJ0g8fQ5c35t2FKFpSfRC22e5NsBvp3bYLJA0kjVAq8x
 cPlcWkCdYo4d1gw0TpzXHxggR980Rfk=
X-Authority-Analysis: v=2.4 cv=LoAHWXdc c=1 sm=1 tr=0 ts=6ae2c967 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=-MHXjDPJGaOMKVajueQA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: YMMXWT9V2tB6xZBzuUpmvow0lRByMCfi
X-Proofpoint-ORIG-GUID: YMMXWT9V2tB6xZBzuUpmvow0lRByMCfi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290016

dw_pcie_suspend_noirq() normally calls pci_host_common_d3cold_possible()
to check whether every downstream endpoint can be put into D3cold before
bothering to move the link to L2. If no endpoint supports it, the
function returns early and leaves the link up.

Querying D3cold support during shutdown is actively harmful, not just
slow: pci_host_common_d3cold_possible() requires every active endpoint
to already be in PCI_D3hot, and returns false otherwise. If any endpoint
is still in D0 -- which is common, since endpoint drivers aren't
guaranteed to have suspended by the time the host's shutdown path runs
the check fails and dw_pcie_suspend_noirq() returns early without ever
moving the link to L2, leaving it up right up to the point where the
system cuts power/clocks to the controller.

Add a force parameter to dw_pcie_suspend_noirq() that callers set
explicitly to force this behavior, still call
pci_host_common_d3cold_possible() unconditionally, since it's also how
pme_capable gets set, but ignore its return value and force L2 entry
regardless when force is set.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pci-imx6.c             | 2 +-
 drivers/pci/controller/dwc/pci-layerscape.c       | 2 +-
 drivers/pci/controller/dwc/pcie-designware-host.c | 9 ++++-----
 drivers/pci/controller/dwc/pcie-designware.h      | 4 ++--
 drivers/pci/controller/dwc/pcie-eswin.c           | 2 +-
 drivers/pci/controller/dwc/pcie-nxp-s32g.c        | 2 +-
 drivers/pci/controller/dwc/pcie-qcom.c            | 2 +-
 drivers/pci/controller/dwc/pcie-rcar-gen4.c       | 2 +-
 drivers/pci/controller/dwc/pcie-stm32.c           | 2 +-
 drivers/pci/controller/dwc/pcie-ultrarisc.c       | 2 +-
 10 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 83fbd998551d..1f2b942e8423 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1788,7 +1788,7 @@ static int imx_pcie_suspend_noirq(struct device *dev)
 		imx_pcie_assert_perst(imx_pcie, true);
 		imx_pcie->drvdata->enable_ref_clk(imx_pcie, false);
 	} else {
-		return dw_pcie_suspend_noirq(imx_pcie->pci);
+		return dw_pcie_suspend_noirq(imx_pcie->pci, false);
 	}
 
 	return 0;
diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index 7f37a0537159..bfed194834d4 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -382,7 +382,7 @@ static int ls_pcie_suspend_noirq(struct device *dev)
 	if (!pcie->drvdata->pm_support)
 		return 0;
 
-	return dw_pcie_suspend_noirq(pcie->pci);
+	return dw_pcie_suspend_noirq(pcie->pci, false);
 }
 
 static int ls_pcie_resume_noirq(struct device *dev)
diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 869a39107a81..e4d47999613c 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -1235,23 +1235,22 @@ static int dw_pcie_pme_turn_off(struct dw_pcie *pci)
 	return 0;
 }
 
-int dw_pcie_suspend_noirq(struct dw_pcie *pci)
+int dw_pcie_suspend_noirq(struct dw_pcie *pci, bool force)
 {
-	bool d3cold, pme_capable = false;
+	bool d3cold_possible, pme_capable = false;
 	int ret = 0;
 	u32 val;
 
 	if (!dw_pcie_link_up(pci))
 		goto stop_link;
 
-	d3cold = pci_host_common_d3cold_possible(pci->pp.bridge, &pme_capable);
-
 	/*
 	 * Enter L2 if D3cold is possible, or if the platform loses RC power
 	 * during suspend (in which case L2 entry is required to notify
 	 * endpoints before power loss, regardless of D3cold support).
 	 */
-	if (!d3cold && !pci->pp.suspend_poweroff)
+	d3cold_possible = pci_host_common_d3cold_possible(pci->pp.bridge, &pme_capable);
+	if (!d3cold_possible && !force && !pci->pp.suspend_poweroff)
 		return 0;
 
 	if (pci->pp.ops->pme_turn_off) {
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 6d788aa00011..4905932cfaf9 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -861,7 +861,7 @@ static inline enum dw_pcie_ltssm dw_pcie_get_ltssm(struct dw_pcie *pci)
 const char *dw_pcie_ltssm_status_string(enum dw_pcie_ltssm ltssm);
 
 #ifdef CONFIG_PCIE_DW_HOST
-int dw_pcie_suspend_noirq(struct dw_pcie *pci);
+int dw_pcie_suspend_noirq(struct dw_pcie *pci, bool force);
 int dw_pcie_resume_noirq(struct dw_pcie *pci);
 void dw_handle_msi_irq(struct dw_pcie_rp *pp);
 void dw_pcie_msi_init(struct dw_pcie_rp *pp);
@@ -874,7 +874,7 @@ int dw_pcie_allocate_msi_domains(struct dw_pcie_rp *pp);
 void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus, unsigned int devfn,
 				       int where);
 #else
-static inline int dw_pcie_suspend_noirq(struct dw_pcie *pci)
+static inline int dw_pcie_suspend_noirq(struct dw_pcie *pci, bool force)
 {
 	return 0;
 }
diff --git a/drivers/pci/controller/dwc/pcie-eswin.c b/drivers/pci/controller/dwc/pcie-eswin.c
index 1bb44696057e..21d077172724 100644
--- a/drivers/pci/controller/dwc/pcie-eswin.c
+++ b/drivers/pci/controller/dwc/pcie-eswin.c
@@ -367,7 +367,7 @@ static int eswin_pcie_suspend_noirq(struct device *dev)
 {
 	struct eswin_pcie *pcie = dev_get_drvdata(dev);
 
-	return dw_pcie_suspend_noirq(&pcie->pci);
+	return dw_pcie_suspend_noirq(&pcie->pci, false);
 }
 
 static int eswin_pcie_resume_noirq(struct device *dev)
diff --git a/drivers/pci/controller/dwc/pcie-nxp-s32g.c b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
index 386e44dd0477..cb9cc9327d85 100644
--- a/drivers/pci/controller/dwc/pcie-nxp-s32g.c
+++ b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
@@ -365,7 +365,7 @@ static int s32g_pcie_suspend_noirq(struct device *dev)
 	struct s32g_pcie *s32g_pp = dev_get_drvdata(dev);
 	struct dw_pcie *pci = &s32g_pp->pci;
 
-	return dw_pcie_suspend_noirq(pci);
+	return dw_pcie_suspend_noirq(pci, false);
 }
 
 static int s32g_pcie_resume_noirq(struct device *dev)
diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index d903f10211c2..a7835e8a51e0 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -2464,7 +2464,7 @@ static int qcom_pcie_suspend_noirq(struct device *dev)
 	if (!pcie)
 		return 0;
 
-	ret = dw_pcie_suspend_noirq(pcie->pci);
+	ret = dw_pcie_suspend_noirq(pcie->pci, false);
 	if (ret)
 		return ret;
 
diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index fceecbd16355..045d33ac61ea 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -1071,7 +1071,7 @@ static int rcar_gen4_pcie_suspend_noirq(struct device *dev)
 	if (rcar->drvdata->mode != DW_PCIE_RC_TYPE)
 		return 0;
 
-	return dw_pcie_suspend_noirq(&rcar->dw);
+	return dw_pcie_suspend_noirq(&rcar->dw, false);
 }
 
 static int rcar_gen4_pcie_resume_noirq(struct device *dev)
diff --git a/drivers/pci/controller/dwc/pcie-stm32.c b/drivers/pci/controller/dwc/pcie-stm32.c
index 349618ea5b9c..7b3a8c1b04a4 100644
--- a/drivers/pci/controller/dwc/pcie-stm32.c
+++ b/drivers/pci/controller/dwc/pcie-stm32.c
@@ -78,7 +78,7 @@ static int stm32_pcie_suspend_noirq(struct device *dev)
 	struct stm32_pcie *stm32_pcie = dev_get_drvdata(dev);
 	int ret;
 
-	ret = dw_pcie_suspend_noirq(&stm32_pcie->pci);
+	ret = dw_pcie_suspend_noirq(&stm32_pcie->pci, false);
 	if (ret)
 		return ret;
 
diff --git a/drivers/pci/controller/dwc/pcie-ultrarisc.c b/drivers/pci/controller/dwc/pcie-ultrarisc.c
index 523f454c6c52..59341682213c 100644
--- a/drivers/pci/controller/dwc/pcie-ultrarisc.c
+++ b/drivers/pci/controller/dwc/pcie-ultrarisc.c
@@ -193,7 +193,7 @@ static int ultrarisc_pcie_suspend_noirq(struct device *dev)
 	if (pci->suspended)
 		return 0;
 
-	ret = dw_pcie_suspend_noirq(pci);
+	ret = dw_pcie_suspend_noirq(pci, false);
 	if (ret)
 		return ret;
 

-- 
2.34.1

