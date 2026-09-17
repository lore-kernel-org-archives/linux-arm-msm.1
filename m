Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9499A4A2A79
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 09:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789635831; cv=none; b=Y7DBwP39fJZ0p0aZr2pLhlyCc1DNOeZiE1aVKLLbnmptmhcz4grw+0l/CHGDVYhaB6qwzRslQrafj7vsH2MAEUhYMrHWzNtathXn/AbK9PXO4qNYhLXlFd3D7U85pdt8E3O94wIDr5hwfpFnzSGGE4gnUsePhXrA7rPKKN5x5Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789635831; c=relaxed/simple;
	bh=ZJHsuUW3/RLl7KCyTNTHIcBjaqv1ELIkmKGkZ5u84U4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MwTjL2UnUKiKLpVRWunRGynG4RQkgS609rdfmEDg4jWgIte3pwMuGscaIG9wdC+qSWq3dgWl4mZZM2FXSFbQiGRMidEZaX/pR1iTfKCx1Oy+rIJvWr/VlZ5GFCR21qtfpkflOBRbvaybDHjunWS1zPeZ8nDM2hjSXQntL+hacyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e68aDCDi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MnoQgc+1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e68aDCDi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MnoQgc+1"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H7xVoU396802
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 09:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MHGQgTBSg6fmF5tBdwK8NTwj8iZke4OL5z3m8HAnfyc=; b=e68aDCDiVZd4++MR
	LMdHyxS+q3S5ozkzGJMrARfJmuIzd9O/tBPl74u9XVC/kSpcper2IRUifP74lrtG
	Rof4h9fGXMUmzyQKyxMHyu7Rlqo4LhfMmZ1G4NSBEK/QzI6SlQzJMunARd3voDgM
	mAkBXc1SnDEi1UcYSjCOauBckGGcWt7c14Vft82G5JEDP8NcliUjvaK6ul1V6yI6
	wYYhFeqhj3p0TMtJfb1pohw0ucP3Q2ehvCqLYPE9xC6U/rKoOYtAeH7aL3Ox29xE
	X+oF2un/YRv57UYHgOgkgSuc27bBwMozDNXiqKLBB8nK076Qzr5oDgDOlYx3s8sX
	nP/xVw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grca0r85k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 09:03:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93821883e26so24008185a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 02:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789635828; x=1790240628; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MHGQgTBSg6fmF5tBdwK8NTwj8iZke4OL5z3m8HAnfyc=;
        b=MnoQgc+1JpmUqYQ9rs0toURNp/oCsfrW6j39xed7ZX7t4l5Sio1b+ysZZNgZzH8SjT
         DRo+m8rmMHsLnnhYrwxcgIy8cNeSV8Tis2bt/NMDMcfzYrNPWGCTedWj4Oh/SrZex1Of
         6cxs6Y2XyWJyGgJrN8pJK4/q1Xv0JqIVSupEgyPQd0c+AAuIYLwdk5/UyJOcIpU68ZbH
         7Zj8gzG2VehgimRWu5gnMVGPdwlP/Zc5vLAVptQgMGnyb83akG7rB8bDTWUZwYus8E0F
         zKlKY8knz77Zbox8ihmm0WyBSKum+zOywkD7dFyLMZQv2r5xJ7rw6N7LD6lSafXTRlIG
         qvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789635828; x=1790240628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MHGQgTBSg6fmF5tBdwK8NTwj8iZke4OL5z3m8HAnfyc=;
        b=uVw8V6zEL71Rs5qkGsSTlTV2i2+k0riMUbvHVPbWMwy6qhvw+DsQq2x8VnD5mphxF3
         L4sRf0pb9J71rX9Et5PGSPR+vUmq+Hm3Z1b97iIpwyrKmSdcGspSS/Q7sIqpSTcXtVuV
         dIQwx+BOz8Uzz2nt/mD5bSkNox1X7c2ZJad9Ls/Uqzgpfal3vuFn205Um4rW8s8dBgX7
         77YJsiQlc79BphZd3OghE1MDXYHRMcUj5RxJAEEV/wH0O8Q911KbkNbsIiso6fVJ66tY
         7KPqQH4BQVudgIPKlCh669QzNtaUCmv6u+eFsKKWd10ooa4YMNPmFo2vZx29yTjj7+ME
         /zJQ==
X-Gm-Message-State: AFuF++m/tbOmIkoN9ewAQ0StSxq3iIsNsRuiqhxq168WnjZ3Y1bvXdZI
	q7UF8lXRBZ78T/ZBqaGPaEiUr4h//Z/kUOAq7t9CO30gjdz9ZrwbLCCNeoxYdpnSRHD1UwkRsAg
	ENQQCM1tQ6wtXWErWl8qjGCGW3bb3Cw1fiYnDeRlkvnes6HK3fSWDk9/rP+vtw68Z9JOa
X-Gm-Gg: AYBFou0+4bh9mcQ1nDpz9yQpxY00WApYRDlnZui2PoKqZJvl25gjYmos5tOs46WfYk6
	YfqqPOH2TYTeFvelVpcqhrLICCT1cxO0qqbsmUhkDKvYNouZXWc7mGXiORN+FHh/G8nJpfmjR09
	5q63CaFPf0fWz8kh+WI0+IvjYbJa8AzCwLmFiQJdSeWr4/zsbyv8R2qJRi/k19bETJwKklJmWw4
	RniSKLrsnLSvcAh2ExB/VqgjrsXLLijy9Z2Ww1Fn2t+5qyZ0V7gW/2MCSdER5XfrrrhfG5UFFo3
	6YJsd1KSZw1ZNEGGaGCkYunpoxlY4WoiXNbRbdr0An0X8NsZ/exK6YoLHKCbrPwW+un/QhTBRli
	y1LWW6juLgVGwXOlTa8BtO0sArkxerF1V
X-Received: by 2002:a05:620a:6289:b0:93a:2bc8:61ba with SMTP id af79cd13be357-93bd3b59823mr26343285a.1.1789635827861;
        Thu, 17 Sep 2026 02:03:47 -0700 (PDT)
X-Received: by 2002:a05:620a:6289:b0:93a:2bc8:61ba with SMTP id af79cd13be357-93bd3b59823mr26338085a.1.1789635827372;
        Thu, 17 Sep 2026 02:03:47 -0700 (PDT)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:891:4ceb:5214:a4e4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d240669sm2983343a12.13.2026.09.17.02.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:03:45 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 11:03:27 +0200
Subject: [PATCH 3/3] pinctrl: qcom: qcs8300: Fix intr_target_width
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-topic-tlmm_intr_width_fixes-v1-3-3bc1d056aa6b@oss.qualcomm.com>
References: <20260917-topic-tlmm_intr_width_fixes-v1-0-3bc1d056aa6b@oss.qualcomm.com>
In-Reply-To: <20260917-topic-tlmm_intr_width_fixes-v1-0-3bc1d056aa6b@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Jingyi Wang <quic_jingyw@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789635815; l=883;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=ZJHsuUW3/RLl7KCyTNTHIcBjaqv1ELIkmKGkZ5u84U4=;
 b=tX0oMk+h3NHX+2fn2yj48FDUBSOwHFzryJes9qv7ZSO0/rz4NSTtz1nNtsNr0aSvGRgZvxpMq
 VgIJlZeV+ULCYzYJPxhdz0tppkMIXnp61Y3PMnys7GNkhs8Zd7a4iy7
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-ORIG-GUID: TkTWR_3FO2WfxGW6GS_Cb7uyqoXMlnCo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEyMiBTYWx0ZWRfX8fswF2O2421a
 T6ks3P4mac3LiPOA+s9Rw6+X4MRIY/2a+/CPvkCRujUZ5Btpvq744YvmedPBcanmJGLqzpMbrva
 qJdYiNuBIxlSi9L1ffB+zeYqaGGleVc=
X-Proofpoint-GUID: TkTWR_3FO2WfxGW6GS_Cb7uyqoXMlnCo
X-Authority-Analysis: v=2.4 cv=dOQzC+Zb c=1 sm=1 tr=0 ts=6aabacf4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=Q82aM-Fga97ApYgJ2eYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEyMiBTYWx0ZWRfXzlz//DGLCxOo
 Tgd9nATqwpiLyKx74Akko6nJivzqI3TJl0PLHzbn4BoPRhO7JDxfE5ijcPeBDD90RfP6iloa8Zt
 i+OTX6WW5gHud037NQ2OXHF5DqPSp+zMD/33TP5ofeEvzOe6Muag/FfyvNzjLyzws80bhCb0its
 ZGJVFa+jFeLj/ABX/W6cGbGexjKY8n8jHAxX8dm6j+pDyYkdfrLSUGL/zbTis/vj7Kf1mYactmY
 duZlb/LNfcKk1mdaTwbERbQDps7cCK7Jljh+9AdJT/lcLZrPH4yKgfRv+VvXS7CWDSW0tmd2qD1
 IguI0XLASYBIo8ZuDusoepXk5gt6KDx2DjV5KTcYmptBBU9omdNNhMfTyVYH13nkqBB8QoQ0Rke
 +/+peJDJA9Mo7NefYSwBzq+hiPlQIohGMUMnZ8j21/fiQOGVP54JNZlhoqs+XD2s0EK9WsSWHYT
 2kdOMF2V5n1Jc3UcfVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170122

The default width of the interrupt target field doesn't match the actual
register layout. Fix it.

Fixes: 0c4cd2cc87c8 ("pinctrl: qcom: add the tlmm driver for QCS8300 platforms")
Assisted-by: LLM
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-qcs8300.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-qcs8300.c b/drivers/pinctrl/qcom/pinctrl-qcs8300.c
index 9a904d809e11daa71b41fcb42b7c145017998673..fec86818c51188a0949e268382fb0c5de3f66f1a 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcs8300.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcs8300.c
@@ -45,6 +45,7 @@
 		.intr_enable_bit = 0,		\
 		.intr_status_bit = 0,		\
 		.intr_target_bit = 5,		\
+		.intr_target_width = 4,		\
 		.intr_target_kpss_val = 3,	\
 		.intr_raw_status_bit = 4,	\
 		.intr_polarity_bit = 1,		\

-- 
2.55.0

