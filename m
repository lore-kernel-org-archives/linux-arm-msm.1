Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101815;
	b=qwxahpOnY1MnMlPL5eBfVAbM8+00y3yokkzzUnEmTFDDc90Wb8QN4rgCPYLaw+STakMn
	 2gOMXa9WuPwPKR9v39kjj6o1VyaWtS/71rsFF6CCDoMKJhZVz8H9DWO1z9WZroNfXmbr2
	 IeRAWryjE5S5l1v/qb5SYTWVB5nYdG9UvXdsoKTKKzlB2pgcs647xF6Gx22+40cevnTkW
	 xz4ka2T2w+P4mREsf1vr4HJp5Y0qnQlXHd1eth6hb45O1ba2J9AVljmtvfBDg5w38s9QH
	 +L7v+sP/sI5tzqnJI4pt3fAIrpbY5KJbyibynAggHj6eBTmU3A1MJZlK6kMfTpj9OeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101815;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1b94Txq/lwmxaDtayj0mrEaKFPzEZIPVcW3H/HTvxDE=;
	b=r/Dggf1hvdUiXbXFPvZMdP8Kw3nGaabBOHhYAqRiZyp/dpiwqkVE2EnSJ3Gs2zpTrST6
	 arLiZsEq2OustS17PzNgsNgwhkp0FuOp+gO5X40sdw9B3+ThsUeNqXx7YFKTmISPJt9y4
	 VvGvTzPOF8MgS0MIS78tI9vAxsqWRfNo828I5iJGIzKHuaZAexAfksYhMcic8fB3lVOJV
	 z+5I8SwYL90KZrI3WTxAerGcR9lmhecOXFZziz3cUnW7qG0xsHfFTwHrnGkHnqLsYmmtL
	 5nhoAwiYI6rjPd7iuCN+fw9vbjTAnlddvOANvrRFt+UM0ZvzsvYINGHr21uWzwUI9qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d1glalQs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y0NsVbba;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE38606A320
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EE38606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d1glalQs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y0NsVbba
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe4hw894403
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:50:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1b94Txq/lwm
	xaDtayj0mrEaKFPzEZIPVcW3H/HTvxDE=; b=d1glalQsrrJyN9SaGwigFvB6h+R
	am3hngFEAw9IxUAdMMXx0D7PuF29llpXk0RBu03fgpRs+BziSayIJghWxwTSUBE6
	pNyUzQlK6GyolbMm7X6h0qirolJ1iVPdgzSb6codHF2f8Pv20aYiHEN20/Ced6op
	C7N1H5d3gDXDGY6xYNcmQbFB/iRxbDDupURzsYU0XQ8MMuBjSiL7PDkhFnQFVbGm
	uJo8WWcXNmAO3CJrti8jyIZvRFDToZtny5kviUco40dihptjo+wt8HK0o6cjMt/l
	2PyzvCUv2NFLG30/lpvodLu0lKNPKLcSHxXwHWGBO3hKyqL//RMxkQkqmIg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj8smva44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:50:13 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-351788121cfso2065005eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 04:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793101813; x=1793706613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1b94Txq/lwmxaDtayj0mrEaKFPzEZIPVcW3H/HTvxDE=;
        b=Y0NsVbbaMUtQeuhsxbvkLqWzGOei0E88PN6lkKwBvkJ3NTbNwNXe5hQqdZ9TNKMDv5
         vUm1jgKCLsEHY0UgY6eRgIZmT/MmQ4LSBuo7PeZbtJa14imbfUouDpj7gfdt7ackEY60
         zJFs7sLSqeQ9lwgRmVBNMAsAkcmqTAS8KdqF2dpXqoTD6SJPgKFMnwhVIqv7JEWTtRNS
         sWCfHo6wwQeJyHbA/bwNktOS68u/mFxJ0jQ6ytZp5ajB/XnusqYixCVcr6vIiyMAMS8c
         t0jW89b/xZA/5YmgHgOsa+0cc4ZxSzhvIAdPlJb92Vten3hIXBH2DkehSdFXb3VdJ46Q
         3qfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101813; x=1793706613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1b94Txq/lwmxaDtayj0mrEaKFPzEZIPVcW3H/HTvxDE=;
        b=2i5chatkaLbpVbbvZoqeHZTeQgxGqG4y6PjBZ3P+xo56It/VDfKZnDEww+81rid+ko
         SJDsS5MfM/j4GJkJRbkrQA4c0dN+0jrmJYkvqw/KRZ67kHt0/Yt2N2rhuIBO9vVlApm6
         Jqda5gIlPtke3qCoKcG6Ig6QzGI/2UUpUB9xGUxZ3DQ/+8ilhxU77IB+ZSKNLXykv48V
         m8u7ZVbR1l15wbwMnImogu4xtJeKJr7SP1LOTD/BIUFaT4XRkE7qtbxqnbBzHr7DttD3
         Dnh89otaBLXieASmJH/OnrWNsoLA0KtAbziP75jyO2BLsTzS/x+guLDJ9uIvkVEK3cF8
         35tA==
X-Gm-Message-State: AFq9FYL4/xMEGTE4MYm6nlpsZU48i+jdtM6NYckOs9OcbdS4KWNRRLyz
	0gv6y1c/h9IwJmuO5oqQmYfqmby5Jtdhz08H0Bbekvlz/ptPeA9EloWO9X0frGA/dx5YLUem1wu
	rHEBITWwhSmiGnoKd0HAOUz5dkkgEl3WpzZzsnhSTMXloXqs6vzyCB5WRolCEL/pjMPmXTVUO41
	oo
X-Gm-Gg: AYBFou0WG4VEQ13w+nmtuALZgIgYm+pZpHdk3/kCJN8LgC3x2DuJAh5UwoFGy5oUUZO
	N5GGL1barfvfIvUoT/KOX6KNc3Z6WkurpV/4BcTuwetx+i6KHo503nrWbS45kSxkaX58TjasGAl
	amK6U/w6t2e+gHzh9x1Q4ziwyUVNA6CDoEcTzkV+x17oMbWt24jUxus7x3taqaH9cXBtiN1jGrq
	VF3wvaMrV99xj5zIV/Tl9rquPtAY3sappgnJca2n357XDX5oqgg8RrpTbck/Qww4ipypsKSugOB
	y/2U6TJKnjRhiouQgeOUU12RWmXOh0Vdk6z4gy85Dcfe9+ydFYoqtHFu5yeP5km4UIWshkNM7di
	S/IAAJYiu2rf7g7T9QZkYYtx6s0lBSTzD9X6swUwBF1/lCToy4JESQQ4vTrtENPxErbPnDaRFJ4
	NvuVDCJX9PDhPJVoDzmUqcug==
X-Received: by 2002:a05:693c:4018:b0:369:f05d:6c5c with SMTP id 5a478bee46e88-369f05d6f61mr12713567eec.28.1793101812964;
        Tue, 27 Oct 2026 04:50:12 -0700 (PDT)
X-Received: by 2002:a05:693c:4018:b0:369:f05d:6c5c with SMTP id 5a478bee46e88-369f05d6f61mr12713524eec.28.1793101812229;
        Tue, 27 Oct 2026 04:50:12 -0700 (PDT)
Received: from hu-sivagupt-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm61918825eec.23.2026.10.27.04.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:50:11 -0700 (PDT)
From: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Subject: [PATCH 2/4] firmware: qcom: scm: Allow QSEECOM on the Mahua QCB
Date: Tue, 27 Oct 2026 17:19:53 +0530
Message-ID: <20261027114955.1266499-3-sivansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
References: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dUYL7mRp7yEuIMrSc7bmGwO14VZQjO-a
X-Authority-Analysis: v=2.4 cv=Sfti5fRu c=1 sm=1 tr=0 ts=6ae08ff5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=QKtFLHZR5-43mdkG35oA:9 a=zZCYzV9kfG8A:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: dUYL7mRp7yEuIMrSc7bmGwO14VZQjO-a
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX1i+zii42Qyjf
 sNsaddpw8PybpW/aoKmkBvF4MLOd4fvnWU3Et/n0CGEgAWS91Tre4xO2/EuFgDAH+53dd5mjHW6
 EWPfjHVqoF3b+aONoflQZW9Lvn2w6Dg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX5UpOzgdzh/Ek
 NpdYq+m2S2Bk4Pz0Vhw20bxrsJTfJT5oVlBkmECuBfOoWaBrNUhUv5xe7i+lKdmdwyc8C7pGUy0
 u6voHCeSGL1wEuBW4/DNAMJqq2pMzqmtpPZw8cUVOJamdpS9sBF2dstE/Ps7XwV37dPqJusxfm1
 Mi9k5PUvb3lvuo8F1fSFALsDJi/DisPqMETe5oIOdml9CXAu/4djWdJT+tO2zUq2EgHh4ehZRa1
 whjBIA6cWGOFfFTa59FRVkguojUFzZ8QQWRqxdKorRz9YgWRDZ4QNW+Wb+GN3swJggkMbUlwsTH
 f7nM7d4rBV483Sf/wDo/MrnF52KIO7rXovVATJIFS+G/uKA/T84Tl/f8ejZIxmt2nfPA2E/7hgZ
 L4GO4Zd+yionRMOtoLePUEOO3X1fPsHV4x0ubeRBzfFHIV6VbY6oLKAsjSu5VEoa1nWpJZdSfnk
 mYPIna/9DqyRo9Hsm7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270047

From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

Add the Mahua QCB to the QSEECOM allowlist for enabling access to
efivars and the UEFI bootloader.


Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 43e250faea75..eb262928d4c4 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2260,6 +2260,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "qcom,hamoa-iot-evk" },
 	{ .compatible = "qcom,kalambo-crd" },
 	{ .compatible = "qcom,mahua-crd" },
+	{ .compatible = "qcom,mahua-qcb" },
 	{ .compatible = "qcom,purwa-iot-evk" },
 	{ .compatible = "qcom,sc8180x-primus" },
 	{ .compatible = "qcom,x1e001de-devkit" },
-- 
2.43.0

