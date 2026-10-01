Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9625A330B0E
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 08:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790843910; cv=none; b=H/V2TUrXpRh3Wrd86c7yS0sNMiOO+KGJmJY7qQ8btqTa5AA08WifnuqPXUyDllo36VHbsGv+kMmvWzXwElEgElW3RMemBA0O8btgM1YVycOMq7BYk6NrJMle+IUZpnP26bQ/XFbi2TNFLqjFitLvjXz2HZOpX6Rh7kdxaye842Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790843910; c=relaxed/simple;
	bh=WUyUAJBFfHzzdVEpTJgHPcbRAXJp+ZSWpmKqyoZNWE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ct6K8LVj3TnLThKQLaHYLv2XuMIHH40CAW6PvkMGmUCEcW9COGMQuM3to5OmtovXAPmmPFuq6YHbRjKVLoGbsiGFG6JpnHc2O019gc3WTOmVi+ZEs+E1DwiRuSKL/WvXgR1T+UcCjCoUPOJqXQ475KF5uRcClcAJQQviU0oWVNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oHfIsqxM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O2kG7ykl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oHfIsqxM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O2kG7ykl"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xbn02176967
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 08:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T3cJXMjP/XsqzQusIsx52/0qeSWTh7VDvbG6/9h1C08=; b=oHfIsqxMFDv1XqOa
	+r//Ln64jYBlWuQI7dku7Zka5NDjISxvle2r+LM3L83yU7Cr/NUZOYDRSiJM93Uq
	vuiGJrLVhd5b8EsSyeTY5LJgeJ7USvcNYrpkL+Wjcii4h1gnxscZr3nqrt0yr/Wz
	G/JsRw8vMUo8CNAZ0qbrieFxMxmlgojpZTzSqSQXsvOr5DVODl2FM6tN9cieTXZe
	GA99wV2Otc96r7YxKvRIJYPV8vx9PT1/R6DezWRsS1epTUwK/nyElfEVRoHJjgT0
	LiaBlagLJk3bLmaxP2AUpdOM8F9EwuhBJc9ncdHTFYNkz77+XX2g+Vg9AbMO9Bs8
	eR9MJw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1h7nrr7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 08:38:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5338bd59032so1279121cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 01:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790843907; x=1791448707; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T3cJXMjP/XsqzQusIsx52/0qeSWTh7VDvbG6/9h1C08=;
        b=O2kG7ykl5pGAfCI7KJLeGUsNkDBdQe8dcutFflrixYP9z+rB45mVFm+rkWfsql6K70
         6bEcvlNX1puKuomC91f/aTvYe93mBkeKygy+7t88q/auUrWKXsTnAeqJNV79qh8eHnSc
         5TCTCNu9UfJ1dWXDpV0iYUTpd1zBk48E67P7IBUUH7ZLwNrFAvuWlhhyQESypdSnRSFv
         dNooYnOU9np6KTf+0vj7Gg1IEneclxC2ptjYF4aq6SVoZJe0evnkPKsKdSjQ7UrOM2+5
         TRoZODrLR6Cvlh3KOBIro241T3OUHkfslCNxkrDEeDyEFPqrupEM32/IuIoJmbDyJqT9
         JxdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790843907; x=1791448707;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T3cJXMjP/XsqzQusIsx52/0qeSWTh7VDvbG6/9h1C08=;
        b=QI3xyBax4kEyzsQL0dmGJC5u3e/up9vZ+Hqh+qFG9bZolIOjRZxjK3Su43UNx6jYdw
         pGc1/p1w43wOUZfPJXb5lIkgWDNe5xEzbpmkMeEj/fFOujladhYaz/7HkYbP/rNvFniX
         Xtx0aT3jS7bFcqxK3KAYyNyPmG4JLEzmirE1hHGjCaYYnLaHHqxvUXda9igs2oGY6e2Y
         WiAISvl7wklRZjZgaiqMngR3QMYzwX8GZut7wtySfcYmrx2vaqNAC54JxpaAaWDF8AcP
         BiS33h66baWHdYPbgxrE2PhwbPb1AG7YaU4MSvQ1xffypXwin7PGErrPL/gCfRWKbXAK
         6YLA==
X-Forwarded-Encrypted: i=1; AKwUvBwTrTgp8KALAAbaBNstG0NcaKPkiV5q6kudvTHV6lN0vjsIl3kxX47VyJyKDY8UGjziIaDCI6dTY45sxbzs@vger.kernel.org
X-Gm-Message-State: AFuF++mzwzR1wTRfcjWKqtkLEk4xYa5jj7vK20UqrzgJerDM81kYZQmH
	CFlxyEMojH6bnPNku7bKtN5KLQm8O/1n5iXjt85OLwJy4T4GEBSBYxqP+LURLpyC2fwIweog1iO
	06SfC8KND7X87OFlgAEqHdhcSaQ6FY5Vp+KcvdNcdY3EuYvg66kDDGhQJCoWkfn+4QHY6
X-Gm-Gg: AYBFou0gF8YRvlE42ZXVNYhxD3tVInY8wjiYnPCrWCGY1zlLxGFCHP5DQeF2mwAd2Ux
	Oii8Prpw3JlToaWroFYO0Ehft+g0dAzinPLfOI1uAI09OX20cXlTmtUvkN8657Ya7gvx5xFFsC3
	gJvC5wm/Hy7B3hXyd4df3vThLrlEaS3+CsGmIFeVKj7pk7efva7fjSD1jZRwdK+G1zrR93a88Wo
	Snb7iU8czMuNhcqlAkC3PW7wR79U+eGiNPNh68aVKFaqEGgl5KppQ7cowzpmH+bsk1VbAnpGzhC
	uThIlCC4v3v2TLYcAUGuGFElFYrpH0LOxi/aYijxoXq6xUK2D9hWb212nphsmgYwFkgcZ/BGDZF
	lvXYCuO1PA9PScsVmiUxa9g==
X-Received: by 2002:a05:620a:3948:b0:939:8148:1e3d with SMTP id af79cd13be357-93ca95726dcmr698829885a.2.1790843906812;
        Thu, 01 Oct 2026 01:38:26 -0700 (PDT)
X-Received: by 2002:a05:620a:3948:b0:939:8148:1e3d with SMTP id af79cd13be357-93ca95726dcmr698826185a.2.1790843906036;
        Thu, 01 Oct 2026 01:38:26 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31d7a4e3sm110149566b.53.2026.10.01.01.38.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 01:38:25 -0700 (PDT)
Message-ID: <9d5d45aa-2678-4453-b18f-16efd4316732@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 10:38:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] arm64: dts: qcom: sdm670: add adsp
To: Richard Acayan <mailingradian@gmail.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260922015801.32373-1-mailingradian@gmail.com>
 <20260922015801.32373-7-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922015801.32373-7-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OI6yTiaB c=1 sm=1 tr=0 ts=6abe1c03 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=Auy6gPqRZWqvY-t5LT4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfX+df8tFSfl/XX
 XhcXp6jEtrBemafSPKke5vXHJicA/U7YIaPRHLwhf88dUn636x36uua3YA37Eo6sCH5UtsArJos
 cN3rPR5IhtmkTIte5hUI3iX8RR38hSo=
X-Proofpoint-ORIG-GUID: 0r5QWuE5ETQFgJMCX4YstRsUDV8Ex86d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfX1DVvB/A49mcz
 D+lSrwAoiGPeeYgzsKNa1ZLJbPbQhR33f9kBtybMA/lDTa1eexQh19/gaQPysxT9MbKRRO4fAgP
 v7Cdza8YmbOP+wSQXyasL5ApjRHb2/tDJvF1xnm8li3CsBqOkR5x0pWU1PJOtla32m1GsaWwTt2
 nkwm6+eYx7lkOoKyuckMDTmKgVcnjFWUi9IThyLeylU93IErYMOy07+xR+4glZY8qBL3TZgFSKF
 x+aBDIuKf/lOXnov3D/iS/mFEhDjz4hOq5HM5E2VReuYAzotAXpIYNkhpMQlQ1QHNGlVY6/vu7Y
 KoFaUcxse+7IusV6Fl2kcq4FJVUvdCF+/qMnzcnj8rIjTvRu8csbXeQFn8+mJFiSyIpDj/QKp2D
 Ys+g5AI8cS0xiZaGf2pNEAexuT5T0tVMeI6mneDKyMO8tI8uG2wlw24w1KmQ+FMLK9XYqMJ6qxW
 RUpT2rEfJjV1VOcHWAg==
X-Proofpoint-GUID: 0r5QWuE5ETQFgJMCX4YstRsUDV8Ex86d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010034

On 9/22/26 3:57 AM, Richard Acayan wrote:
> The Audio DSP (Digital Signal Processor) is responsible for audio and
> sensors on SDM670. Add this, along with the SMP2P nodes used to
> communicate with it.
> 
> The sleep state is included to prevent the following crash:
> 
>     qcom_q6v5_pas remoteproc-adsp: fatal error received: err_qdi.c:450:EF:sensor_process:1:sar.cc:27:chre_utils fatal
> 
> Otherwise, it is unused.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

[...]

> +		/*
> +		 * The ADSP crashes if this is not present. Simply probing this
> +		 * magically prevents the crash. It does not need any driver to
> +		 * interact with it. It is labelled in case proper support is
> +		 * added for it.
> +		 */
> +		adsp_smp2p_sleepstate: sleepstate {
> +			qcom,entry-name = "sleepstate";
> +			#qcom,smem-state-cells = <1>;
> +		};

It's not magic, the driver registers it in the SMEM item, and the
ADSP likely looks it up and complains if it's missing. You can
drop this comment, since you already explained it in the commit
message.

[...]

> +		adsp_pas: remoteproc@62400000 {
> +			compatible = "qcom,sdm670-adsp-pas";
> +			reg = <0 0x62400000 0 0x100>;

len=0x4040

[...]					compute-cb@6 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <6>;
> +						iommus = <&apps_smmu 0x1806 0x0>;
> +						qcom,nsessions = <2>;

This property is going away, please remove it

Konrad
