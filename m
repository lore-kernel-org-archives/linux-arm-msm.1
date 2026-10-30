Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793357341;
	b=tVCLtbFlbQ+/iIsvFMGp3Z3gFuQjnNAeFi8BZTmbWCMUhtqqutJdpbw5kWo6JNq850m7
	 vvzTooIuXmeVOH/QVKmQyqorxPCBO0loEl+nRWlfpv+YeVuWFtozRDkK+0pdsp2wFGrtV
	 8P+3axMx16Wm1TjW9aDObIa/nLVS6qcVdaSh5khxzt9So6/Sr8+J73B2iTFKok3JmX6QV
	 IKQhlwhH71V9IoFtxDth07zK2R+9D4/Erz0NJJ4ZflsvbhxJiJHu5LhMRDPhJ2hKaWxnD
	 B1kLkb7qGrkH7wl+i6LU/zqYNbX2AMCAMczYcEbIfe0Hygie5dLf7bNuLE4Swpja+Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357341;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:From:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1JbE8IqyvSCxx7mA/NYNAikqwGpNh/7qxainvvYoN/M=;
	b=gawDB22FvdYoGfse/mJyxdqbjyz8Uzui6qIbIZqYSVnvgG/hI4WtQsRx3M69nGACLE5c
	 FdM+sMJLrJpD8JwtO8/UOx8cCUgARpBZ83H3dCWnho6eXrFzYHPI7rAoGkCTdYhsRdemD
	 OeAgIbE6Kxbs7zCqNeXaqG8M+MevY7aOtilfrKwGXnQfui/UxkrQBmmbMVZU4y6gvBcKU
	 dj2YJd1BM+w3fqWbhCw9nAMak7+4OEgOTgolBsXFIfh7LhcRqxnkul3HbwhIeCVEz5oD/
	 4te97zP6X1WXhb4Pw8Mmyuh+zjPf+CEEGk4PYZYF3fX9kxPvLNL78SznLhJ1zSx27Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mwuk0mC1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Okm0GxvP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713B860A263D
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 10:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 713B860A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mwuk0mC1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Okm0GxvP
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F4h52722219
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 10:48:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1JbE8IqyvSCxx7mA/NYNAikqwGpNh/7qxainvvYoN/M=; b=mwuk0mC1E4xSYA2w
	XB9AdDf89gDZEqSrzDDCy6FZSeTeZnknYyOg8BgCrIryBgPDDyWqIlnxwIp9vBV8
	OTwPAQDZNsU3qKCivnlC9fSuOuKzjcl5gVqqOwC5v2H9GtpZZCiI8tv7tuByN94j
	YiZRzLAkVEarR6IizCccFRi/QwTKE+jzi88N91Piwk+C9HaaauaF5qIKcd/NJTSx
	RJ1V7LFFjbdcD/Tf2ijMDoqK2o5cZOo9+x7/TTPzFeuNXUqgc3K0lY1esDOPV/Hv
	sujG4wL/PBdzM4eN35x8YXqNh0qTCqgegzmBB98tn/0sl5eNNCtLAN6Jb+OmdBpk
	4DE/bw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qjhf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 10:48:54 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3662e7a9299so2438043eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 03:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793357333; x=1793962133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1JbE8IqyvSCxx7mA/NYNAikqwGpNh/7qxainvvYoN/M=;
        b=Okm0GxvPytPvqafGLHZlpGAxn4k+H/YVRV9d1yKfovkPRX5Uo3gK+GDY/O38GVKkdN
         wah2jLsnqWLe5Nn3OLGJzs2c04SBHlXyXZmyU1vfylY9ZOuO3Whl8o5E/JWKb/B/MjUb
         G9zGvwbdv2RH6qGRVtVPd06kL6REAihoXNqZVvaHhBSxgr9qGrWlo6F7bVWUfNa8E+FB
         QSFjY7QCLbxRW458ofAjOxAqXqT0UqBnMd/dRTy1BaYCpj4mbNKA5mZsgUarQbUiGqiv
         ya9w3rLEPCUZJoQqLMrQF28IVCDq8jnAd8XcJrsHOOj0OfsHRWdlROr8I6/32WCy3LFM
         UQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357333; x=1793962133;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1JbE8IqyvSCxx7mA/NYNAikqwGpNh/7qxainvvYoN/M=;
        b=uoazfov03YQGhh1eR+y4FBoCr0VKlFUI4sukuVeXaJ3IQ0L5jNfHCgDpx1OnIB6mgM
         lGZNQkwZVbdz5TfYEQ5xhoaYDTU1QMG0u4dadKd2Bh7xXX880W2uO6ZGDvUiPGDcxZFv
         lucuVQkcA74KIMMqscpMvp2rOd6Y+ldsi8qvdeQMJVI3ASgHELwJPySCiAtk7SgqlBKX
         zmTPKueqgoE9c5yQmO3/SM227pav35gyyHM+X5+OhLnedhweJe7b/KQatU2aGFVGgyji
         MER2z4wJYY+OOvga3oc4qH2V+Y7N3nnQgcuOMPxr7EYfXJkHnGUGepXKujzBoVRmIxmh
         FViA==
X-Gm-Message-State: AFq9FYLo451vsuBVAyZYBngrS7sshAEYMTeJOLEotkbnI0P7NKq/lO38
	TfPNS7y3DSNWLZkbqJtgA4Ia5zeaw6ZhW5BSyI3uPSptBQFF5t7JBRSVYpmGG7qWEz1q8mEQJ1z
	scPL0i/z7MqEHGwzB0vxMdOJSHYL6vOHH/8FrmvUb/Xhe49nAoG0DIUdnZjNT7KR1OPIV
X-Gm-Gg: AYBFou3uPOaNTJP+9qUsqO3yqAKI5XEGwrVGhYWxkGFG821MRSo/bmsjaH57VfzRvla
	8wGYVObCFxA1xsKH5jD5IPHSFP6d39HWPmgfgPDx8m6i4MMAx/BilBKmC/0bvVCG8+Y+LavTUE2
	fhMNjkblGpe4BHEeJXvbdQhvLiVHsEpK5J5w8SR+tMR9hBtnLypUdKFz7A7eXzziUHXbj4lzse8
	PTSMpEJwBANWf+eyPeOSiQL95eTV+aXzQtWgLsf/8YnWyrhlL7TQ465c1etifu1420pfHLBoGF/
	WzIsmdPCvHRqrx4Ww1wSi1zUq/Gy6IItZh2IQGrhG4S3QBDaAU6cPklwDZ1M7/liCYfcu57Za95
	/1uRdPY5OYQNmAMIofwxcSpm43BZzue+d+/v6MqVtEutv0xB1+8jBX+JqA3SPuxCDeLubpWUP9Q
	==
X-Received: by 2002:a05:7300:a8f:b0:368:4c93:544e with SMTP id 5a478bee46e88-36a422084d2mr3133291eec.1.1793357333136;
        Fri, 30 Oct 2026 03:48:53 -0700 (PDT)
X-Received: by 2002:a05:7300:a8f:b0:368:4c93:544e with SMTP id 5a478bee46e88-36a422084d2mr3133255eec.1.1793357332452;
        Fri, 30 Oct 2026 03:48:52 -0700 (PDT)
Received: from [10.218.27.35] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a504c6sm6808900eec.21.2026.10.30.03.48.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 03:48:52 -0700 (PDT)
Message-ID: <dae22788-8534-4b82-ac49-c75fe3b180ce@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 16:18:48 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qcom: qmp-combo: update offsets table for x1e80100
From: Tapas Rana <tapas.rana@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>,
        Tapas Rana <taparana@qti.qualcomm.com>
References: <20261030104404.1945160-1-tapas.rana@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261030104404.1945160-1-tapas.rana@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qhkSY8FigNUFFU_uNLjkR88o4LumFxSV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MiBTYWx0ZWRfX8tGA+cmLR+N4
 +RHCW//FB1+ZO0ZybOifSPsmJBmINC1PoPZLjlu5kE/v0fCXqJufyN+O7lDPbS/VT1xB7fRgaaf
 KLx+Pu4b5xywbkfJTidLfCXOW6Hp4Vw=
X-Authority-Analysis: v=2.4 cv=DfSCOftW c=1 sm=1 tr=0 ts=6ae47616 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=DHid641ov1PBkfMhs8sA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: qhkSY8FigNUFFU_uNLjkR88o4LumFxSV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MiBTYWx0ZWRfXx3KqG8X+r2Y2
 MRMEZsEP7Ljk1UQ64F2MV2WGH/YGjSbcoLt02JgHEqXJCoQuLf16wCCaHLCKr0MSn1ZpY+9ANN8
 LyccALpsQ1jGF1XSKYZ086wbuvY/P6zsHtgpqwurFm7Uzb0yUr6/jAiMXDjMF3ztd0dB/vD4aSi
 pJizKW9d7IhJgvo87MynteO/QSaTDgpjx6A4oj9V4uQPpPtN20SghMOd7rAzRaJcnMxjLN9yrRc
 5/z9cMNnwpqovDmcg6m01h6mGFDUR2Zv1fLgGlAo5nCaW0Xs4HKeffUAgR6BcgYAHRYIrLBmgIX
 2bbJXknbu71+aTKJKyCk9okTk/3DE2ftD7Ge4r5NfUhSP6hwK7Eu7ecPe6lwRK6yNgKeEV28FxO
 8wdiRUdI3M+LowhXs9PKbJcnrEfA5XLfCJXvRIns2eYy+oggzZUMCvvo/AxAvvYuJ9tVIqG2RaA
 vp7Aedo2ejIw5oUcSYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300042



On 30-10-2026 16:13, Tapas Rana wrote:
> x1e80100_usb3dpphy_cfg uses qmp_v6_n4_usb3phy_regs_layout, which
> places QPHY_PCS_CLAMP_ENABLE in the PCS_AON register space. However,
> it uses qmp_combo_offsets_v5 currently, which does not define the
> usb3_pcs_aon region. As a result, qmp->pcs_aon is not mapped and
> autonomous mode falls back to pcs_misc for clamp control.
> 
> Add a dedicated USB3+DP V6 offsets table with usb3_pcs_aon included
> and use it for x1e80100_usb3dpphy_cfg so clamp control is performed
> through the correct PCS_AON register space.
> 
> Signed-off-by: Tapas Rana <taparana@qti.qualcomm.com>

Sorry for the spam, I used wrong email on my SOB tag, will resend the patch.
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index 187f0cd11f6c..aa9dc9716574 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -2762,6 +2762,21 @@ static const struct qmp_combo_offsets qmp_combo_offsets_v10 = {
>   	.dp_dp_phy	= 0x3c00,
>   };
>   
> +static const struct qmp_combo_offsets qmp_combo_usb43dp_offsets_v6 = {
> +	.com		= 0x0000,
> +	.txa		= 0x0400,
> +	.rxa		= 0x0600,
> +	.txb		= 0x0a00,
> +	.rxb		= 0x0c00,
> +	.usb3_serdes	= 0x1000,
> +	.usb3_pcs_misc	= 0x1200,
> +	.usb3_pcs	= 0x1400,
> +	.usb3_pcs_aon	= 0x0100,
> +	.usb3_pcs_usb	= 0x1700,
> +	.dp_serdes	= 0x2000,
> +	.dp_dp_phy	= 0x2200,
> +};
> +
>   static const struct qmp_combo_offsets qmp_combo_usb43dp_offsets_v8 = {
>   	.com		= 0x0000,
>   	.usb3_pcs_aon	= 0x0100,
> @@ -3003,7 +3018,7 @@ static const struct qmp_phy_cfg sc8280xp_usb43dpphy_cfg = {
>   };
>   
>   static const struct qmp_phy_cfg x1e80100_usb3dpphy_cfg = {
> -	.offsets		= &qmp_combo_offsets_v5,
> +	.offsets		= &qmp_combo_usb43dp_offsets_v6,
>   
>   	.serdes_tbl		= x1e80100_usb43dp_serdes_tbl,
>   	.serdes_tbl_num		= ARRAY_SIZE(x1e80100_usb43dp_serdes_tbl),

