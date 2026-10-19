Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96321472F87
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 11:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410997; cv=none; b=rgg3MpeTp7ooHLyRErwhUGIGtZYCGoH/wUdL7/oxK4FnHiKdt+3MbYL/2e4W3klw2k9LzQfng/K1oBCp8otpJy1zHUrZwADqT7jqKm+Diy8Ae7hlMYYU0/T57dONCxWBGbl1pGzPpXsV3zAi0xrSlRNFvth9cVqHBF7gAPoZK0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410997; c=relaxed/simple;
	bh=HLjsyxiyP0RrLsmru8bFLMsnV9JU+jXFj64vDL8QUno=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ndtij7rq/W691ikzt63M5YawyKvl4rAn08IS3UlBkFsx4EAY8EsrpUoD7Caz9BQy8/1Q634CyxcGoATQq4ujB27AgaTU5QE3tgx5X7cpRQMBiqNWoNg3aBgQT2NKKgBUbrl3u84Qiu+abER2qsK8vFkRiPo0tdzixtzejCk6w2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I64/bdIT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IAeOJG9Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I64/bdIT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IAeOJG9Z"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OuLu723272
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 11:56:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gHWSTOXAK11dHbhFaZJD674H5cswRRHK4YqORV+tgJk=; b=I64/bdITvizEuBN7
	CN6iaKcaYuqx6Oc1kMybp5O8icKXh1vS84CEeRJb5p9lmR0WkKNDxPbhepyYdyR8
	BKsakfc0d0HawUpzZ7SaxejVnakOxBVMLKfD73oW0Yb+j17ITn7pMDXiKL+MB0EN
	osmkEbgC9lsuHyt/LCZrGfewtsSbh1wIbgvKOW8XvlePaGJEtRsOuIme52By48Sf
	4yTcaS3TBUy5Tpz1PXKeKZVHTLtHfU3XHPvN4lKiqphniohqJ0ZxTvplDl1Z6qJp
	qhs4Sbg9FK6Y3h3PfIAPmIxn/n+nwVFzVC3Pj+ly+HxvAAdEFbBvTDgI2debwBAr
	NmeUqw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf65gwq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 11:56:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53657d237ddso2007871cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 04:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792410995; x=1793015795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gHWSTOXAK11dHbhFaZJD674H5cswRRHK4YqORV+tgJk=;
        b=IAeOJG9Z/68kHpYUlGD3z/+9FRBRmnJF4x5FGdNMUFPzOiyImb3L+yoBow+vdX2srw
         83nUTixf/gIsxgOyy9/ee9gy0jj1lLB7knVKsmG2y/xEOGQOise8lYoU7U0KnZl+jJau
         FkmmiRaOX6Ab3goodJlbDHQf+poLX7iu9w5VC71OuXHDD7JYiJ60pygAVcz/kMLVC/Kp
         NUJyMfdTXWu+vjxih0Y/aT8DaFsN2otp7sxG+rl37+wD04DSRkYRBPU889bDxjFtaeil
         1rIFEZaKkxKUVIgsmrjfy7fz/YLv76ETyfFWoiRq+K8ijUe2tQC9HbB6bdsRwN+cW3oZ
         9BHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792410995; x=1793015795;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gHWSTOXAK11dHbhFaZJD674H5cswRRHK4YqORV+tgJk=;
        b=DIkR2fh5A4M4iv03ksJ/qDywyINvEg4S/P8gkOuYmOSLo17a1Bd6ROxogOlKO1ukYX
         O6QRtUvpaYvpDevnisIXnKuoV1x3p9R4yt8yKA3ZkbJ8m0GyP1gtLfTtEZBK4bWfNyN/
         cDMUm837TGMAkLZM0HUxFjDjzAVlvUM2QpIhf7d90HPuG0zPmlTV5iXeJjLG4ggvBben
         LDPGdXT4WWHdxagXDNEAyVNqKcWD1J7n1ziJWDnuszFdLN45NXyFTC3RYaW5xU5+oZbo
         jnpCK/5lcYvHC02hyhcGs9mOhBxN79Wst/7J3GETho6nZNgoawvfCYd5dsrEoxAZTYh1
         MDlA==
X-Gm-Message-State: AFq9FYKoLLxLesd6dREB5rMzDmLhDXopskwo5a2gfh31whtwpWmYLMaR
	qYZU3M4hXaVtPM5P2tDDbvKTyvbFb6FlOfucVnlmwHbaMVYkqq6pLeNBrcxTRf+4ViY84r8Go3I
	9inH1Cx+wuNgTfl9LlchQuTMhuTOn9zwKdW/++EcOlJIELtIkV5bsrh2o1IJko6c6pGIA
X-Gm-Gg: AYBFou2OZx364MogIpzxx2Hf24HJi8qBkYIH6VQVw8vzAPSr7ItcYGcDSR0agHyOxE2
	0HQXWdU9UCMzOQ1+E9Q8LOntu4TQYmBfOGmgzFqzWJLDtPnkM4H8jDMSktVK27RYUBKlVK0lYjH
	iXi2uKXRXyqLiM3OmeJHG2ccd7hWZWoZ3shOTz8Sob/VcAKKrx21roFgqZFilvID+oOENHY1jQ8
	1PZnK89CgS5iIJ5BvX8/xcA4akMKV4b2MGc+7z1lItQJF6XbyTL+Y6UdXjrLapJTO5sieeZGCLT
	cks+TvKF1X9HmdkQ+PXkp3IhDAYnZbOHlzi/yhD2xAUmlqXH7t4P49TCxbU9knmMB5wEsQCjoXF
	WeSpIeZvrhJ8ZLJ6Is9ceIQ==
X-Received: by 2002:ac8:5a8b:0:b0:536:61d4:cc80 with SMTP id d75a77b69052e-53661d51a96mr77425501cf.5.1792410994779;
        Mon, 19 Oct 2026 04:56:34 -0700 (PDT)
X-Received: by 2002:ac8:5a8b:0:b0:536:61d4:cc80 with SMTP id d75a77b69052e-53661d51a96mr77425281cf.5.1792410994368;
        Mon, 19 Oct 2026 04:56:34 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ca52esm366595366b.38.2026.10.19.04.56.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 04:56:33 -0700 (PDT)
Message-ID: <b833f6f9-5729-4936-8c5b-cd42d32c5198@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 13:56:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] irqchip/irq-qcom-mpm: Program wakeup timer when
 CPU cluster goes to LPM
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-5-ac7f1a0d5638@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-5-ac7f1a0d5638@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NyBTYWx0ZWRfX6UeTvbStUB7j
 //GDpjxUZw/FnauitU1/tmwTEgUZ+5uEMJp9oVol4z2owtOWaZbkiZLPLmnJBGiqOg4jzHxvIMO
 6I/zpxIzlz9HE7sWLX3+gJstzE9vcyY=
X-Proofpoint-ORIG-GUID: O4zF7gsWbSDlVy6La0IM8IMXOufJbepd
X-Authority-Analysis: v=2.4 cv=Y5ptIReN c=1 sm=1 tr=0 ts=6ad60573 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=rqCDwAl6iYQHjBXnP38A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NyBTYWx0ZWRfX1b/KnA+vZGZF
 KzyOlIV2bKE/t16GpW4A82GriSYLUBOHLqS91zd6ArhKS0BkbvY/kOYp6PJd1AP1VxqP14RSo6P
 ZWU5we9BR2UxsWAQXFrUSlojTtD0txMG6stRFcQrd64lfwTaEFW7+lyaAGbyqq+ivFNDKZqN7xQ
 eiEGT+eJtmVmJOC+WQ4u5A+0m96Tm6jW5mG7gZdva7Au9pHAyu7l5aFbfeTvGfE8rPpxgma//5J
 dKNB4ox/r3syUNjOjKCmyOC97qSwOOdERUkGwIdVc7Gaq4/9Qmbh//dVpTA6uxOEr0B+brNoZcd
 rH7RyytQthniDlajYU/RMpknc1+q2kuolKfB0XZtwKWe+vSAPhk4dUiSdCyyLhULe78chs19jdu
 9BGhw16PHayInRVfdW0aaJlzADnpMr1XbKcOlyMOShaCn2DMLjGqkR+tmW28l6/9Hcsq2mQ7vXe
 oWuDLvO8hbIgZ0LVXfw==
X-Proofpoint-GUID: O4zF7gsWbSDlVy6La0IM8IMXOufJbepd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190047

On 10/15/26 11:55 AM, Sneh Mankad wrote:
> The next wakeup timer value needs to be set in MPM timer as the arch timer
> interrupt can not wakeup the SoC if after the deepest CPUidle states the
> SoC also enters deepest low power state.
> 
> To wakeup the SoC in such scenarios the earliest wakeup time is set in MPM
> timer and the Resource Power Manager (RPM processor) takes care of setting
> the timer in HW.
> 
> Add MPM timer programming when CPU cluster enters power collapse.
> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---

[...]

> +static void mpm_write_next_wakeup(struct qcom_mpm_priv *priv)
> +{
> +	ktime_t now, wakeup = KTIME_MAX;
> +	u64 wakeup_us, wakeup_cycles = ~0;
> +	u32 lo, hi;
> +
> +	/* Set highest time when system (timekeeping) is suspended */
> +	if (system_state == SYSTEM_SUSPEND)
> +		goto exit;
> +
> +	/* Find the relative wakeup in kernel time scale */
> +	wakeup = dev_pm_genpd_get_next_hrtimer(priv->dev);

This returns KTIME_MAX after the DT patches in this series are merged
(because there's no power_domain that the MPM hangs off of anymore)

Konrad
