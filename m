Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8751C4B5CD4
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 10:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788951037; cv=none; b=CdY5qggkdHwOFC91tPmBN3bL12YdjBziy87/0Vo5HhVbZ/OGLa8E2pLx8rUe2hD8sq9ML4a6yw/FKm7iI1KqkHW+V1T5WpadbyE5hYHyftXfcaxNFkjW/EMzINk63X3OjTgKT4yB0DKB4uetngbUh+Z4yOomQcxvmrIvlz5IBEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788951037; c=relaxed/simple;
	bh=sUsFmxcsJOH4J75gptcCGWMET9SeFLvoaoCguFzSpjg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lZSERUBWy0b1sc05w1cathWNS0Ya2tuIvV2HXxeTxSiIoCwXhvVA1Y2cfPw1NraU5LtOJCzU/Ou6YajjR3G0pwH6xLQm/a3eLPHmw7hT+NtUdKK6jUcqjJp1MxFz260kz59u9awQ7pf037opVcFNtnq3gUsT5hBWPpMDM2nIdMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AbzRY52f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UpG3Dd42; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AbzRY52f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UpG3Dd42"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689ASKlr1008819
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 10:50:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1VO9wh0dUp0/+9XImT57Fep8YYUvqKJedWEKtcwpe4Y=; b=AbzRY52fVklas5il
	4ErKj5aJ3GiB46XbRSlg5rE5aCSVbEMbXYCkjP30EcWoHayz9qri/4eiNbcI74wE
	yXqt/Cqu+3uGfL4rVHhCXEqDVLjiC17asDoy28qQghcPspYZ+UFvY0TqIG824SZh
	J8uytHnTrZEe3fc8Roh/LSBB8EDJAuDiFeVhjRWMLafJPJsWVN9PvAuiojFxNQNA
	HkGHhmLG/cc0WveFKELy7+tErcDPHjU4o8R+W1zk17/G7pTMHF7OEXXCVDIewMkc
	ZIUrlltxajj3ZhQc4BCVwnwRaQIlkVV3pKKb4nssfDZbixTGntPAYQTgjkJMq6qi
	IiB9Hw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjppp3ubu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 10:50:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9375d92d0caso63994085a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 03:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788951033; x=1789555833; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1VO9wh0dUp0/+9XImT57Fep8YYUvqKJedWEKtcwpe4Y=;
        b=UpG3Dd42WYpVclr4w8EfZkjg9eovaK09T+F7wPgbnMwLOHAytXAOIVkt7AErU00KVE
         3ke4ARlYohoLx+aRwFBVOr+mLk3ptEczOlnnJHLLr90CNjEFHNSzAeOQ+590OcDFjKf2
         BodtC5AG2wb4aNNBAhMg6FrEpYJY8eRipg18rmRZTrC6h8j4GEq7KpwgA2yYB8MXEMTx
         f5d0RyZT8Pv6uPRKjqZB2lTgeHqIjn88hmMBUxVQsj5OWJ1hP900CJTxiqwLyo5nYD85
         uK8wzqELHZM74Ibp6qK5Y26jdEd2ckDR4ahsaDL1aJv9vMpSlDsbJ5ffbSbv1tNISh+g
         gwCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788951033; x=1789555833;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1VO9wh0dUp0/+9XImT57Fep8YYUvqKJedWEKtcwpe4Y=;
        b=L1yp52xMxEAZ6DLlosiHkwqI5AIO2yJYsA2mYKf3VRQ1+52Zj2CsvLDmWJMbCxEKoM
         8keUfPZCMPfRW9mQn7S9GIhsDz6hfxqM+w+h8dXp+cY0wQj23sFqrKSBqZT7ia+KK7pc
         LymXd7xQMXKB7jULM11zTKzsuGsn3s8F5I8ReYAiljtmBdPA2TEme0vlmFbFnM6WINCr
         opaI2AhRyXmDvXMO/aGggpCcJBG0oqTGWTuFC1dzguEPllWgZyZoKNqhWwqbAxyvL8B6
         mMzgmOJFtb3WW/KlQjJO6+UN3NgAEqtK1f78yAYaoemvG87+6jlXNneLUsy5LsWEjEn8
         PRGg==
X-Forwarded-Encrypted: i=1; AKwUvByB+9S0QEeY22jBj5zSLCKc1X1Q+DDcT3YToyr2zoL8B+XqfJDOUxFLW9YJEUU3VJ0Buyl+f8ITUBYdovqk@vger.kernel.org
X-Gm-Message-State: AFuF++lR/pZm/MFVFeQzBVR5j+tIAbvCfS8UkPWaRX4FPDSyf4X8XZBO
	9bRbO/azaDmBey4RkF1K0BzWXH9ORCyLV8B7+XWoz6nErz66/bzck/QWiVoGD4MkEGmOUET3JHb
	GSJLlPEzuRgRoHNgR5TWLQGe6JgJT0Tn8vIEX/HdEZnWNxck8lhjkL3fOPNMirnR+wjZvm83zFw
	II
X-Gm-Gg: AYBFou0iwMQR4cMHBzITSzN46jvBZqCTG5DiMZbFmbg7BECk5qEYd878YXwiZIGM7fK
	4UwDgGyokHQ+UHXzxcyEJYdtSbBcQ0CpD58TTE/WEx+nOJQwJckgg4oHNHbzrvJPt7e8k7TLe/y
	uFyhD8zVwFA1I+1QokD+EZJSb0pgMFyFbP34gmbmreDD9RvshRbB9QPpPp3/fRHbFsh/ZadrY7n
	Dcbv7HjJu2Le9IJlWIdy9It0jN6dIKulHLeBjlB0aJtilyR/TCxgQzlcfpX5cUVhDCtNnusaC0O
	MTxl1G6MWUh3c4Eqk+Hd00JLbCeW1v6MDjwpTDsqpWodwR+agiBXBP4O6XsGFu7VKGDhhOmPlek
	G1RHnKdtDcN57Gbr3XqyCqg==
X-Received: by 2002:a05:620a:2913:b0:939:5924:e319 with SMTP id af79cd13be357-939914ccf18mr2247440185a.0.1788951033541;
        Wed, 09 Sep 2026 03:50:33 -0700 (PDT)
X-Received: by 2002:a05:620a:2913:b0:939:5924:e319 with SMTP id af79cd13be357-939914ccf18mr2247437485a.0.1788951032996;
        Wed, 09 Sep 2026 03:50:32 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a839344fe8sm2022203a12.5.2026.09.09.03.50.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 03:50:31 -0700 (PDT)
Message-ID: <f33c39a3-890b-44d3-9944-d694a707afff@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 12:50:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] PCI: host-common: Fix early bus-walk exit in
 d3cold_possible()
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260905-shutdown-v5-0-f0c6bafa1d4f@oss.qualcomm.com>
 <20260905-shutdown-v5-1-f0c6bafa1d4f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260905-shutdown-v5-1-f0c6bafa1d4f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lwMFvhu6YjHa6B_z-ActuZhgtCDqA7oa
X-Proofpoint-ORIG-GUID: lwMFvhu6YjHa6B_z-ActuZhgtCDqA7oa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEyMCBTYWx0ZWRfX/Czbl2G5oCIm
 NKCEeEANXTzh5aD8cvQs1q/IJRN3lyxP3daSdkLX8OVMMLHj6d0La4TRsov0O50wP6tsDLHlKXX
 3yceIqA5mVUVZtrG9auOeD08oEKL4A3WpxsF7pu84YTKfdOxpbSaApvl6+2azYGf27O87Rk5tvx
 GlVRTFjIF1xz/nz0hcjifv5l+CRaD6wtUAEMvOvc4vJe5mcgi9pP0tNjqrJ6uC5x/mhHCpI5Zry
 oskWFdjlLJU8LQGE9670EyLXqUyNYTPFm1ry4GKOMkiXgp7MuXza00S9L2/s2dEbrZ7qE3sGv5y
 f2fmFPuT3YfeJS1X3eHeWn3GyznrRRRs7HFHzko7hWll+EkJup0FzScwfGPT5VaElyXT+otY0f+
 +q70/w8frSX2FZpqRh8+KttwhFYvQNE7MO8PspQIN7W4hxN04p8GzgYGtSFADKGxmXPqsf1ZY73
 F/NgV6pbkB8ZQyCcHwg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEyMCBTYWx0ZWRfX2Qj3J+15G1Se
 dso/0Sv+zWK7ljl7L8JLlz0LHxe2R8BiKjPPmtGyQ4DdPzF4sh34bc9NKKQPua+KkSKgBA0as/j
 eGMiFAChSRwcxLVLOaWfc/iqsdUFPNE=
X-Authority-Analysis: v=2.4 cv=DcInbPtW c=1 sm=1 tr=0 ts=6aa139fa cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=BuD4T0Y0vivPUdseitkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090120

On 9/5/26 2:48 AM, Krishna Chaitanya Chundru wrote:
> __pci_host_common_d3cold_possible() returns -EOPNOTSUPP for the first
> downstream device it finds outside PCI_D3hot, and pci_walk_bus() aborts
> the walk as soon as its callback returns nonzero. Any device enumerated
> after the disqualifying one -- including a wakeup-enabled, PME-from-D3cold
> capable endpoint -- is then never visited, so pme_capable can come back
> false even though such a device exists on the bus.
> 
> Since pci_host_common_d3cold_possible() already returns false whenever
> any device disqualifies D3cold, aborting the walk buys nothing for the
> plain suspend path: the overall bool result is unaffected. But it
> silently drops pme_capable detection for any device ordered after the
> disqualifying one.
> 
> This matters for the upcoming shutdown path in particular: unlike plain
> suspend, shutdown forces the link into L2/D3cold regardless of whether
> pci_host_common_d3cold_possible() itself allows it (see the following
> "force_d3cold" changes), so at shutdown time it's common for an
> endpoint to still be in D0 and disqualify D3cold while a later,
> PME-capable device is never visited. dw_pcie_suspend_noirq() still
> uses "pme_capable" to set pci->pp.skip_pwrctrl_off, so an inaccurate
> result here can cause Vaux/wakeup support to be dropped for a device
> that actually supports PME from D3cold.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/controller/pci-host-common.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
> index a23907a875e5..78bc4c8c9656 100644
> --- a/drivers/pci/controller/pci-host-common.c
> +++ b/drivers/pci/controller/pci-host-common.c
> @@ -274,22 +274,19 @@ static int __pci_host_common_d3cold_possible(struct pci_dev *pdev,
>  	if (!pdev->dev.driver && !pci_is_enabled(pdev))
>  		return 0;
>  
> -	if (pdev->current_state != PCI_D3hot)
> -		goto exit;
> +	if (pdev->current_state != PCI_D3hot) {
> +		*flags &= ~PCI_HOST_D3COLD_ALLOWED;
> +		return 0;
> +	}

The way I read the commit message, this return shouldn't be here

Konrad

>  
>  	if (device_may_wakeup(&pdev->dev)) {
> -		if (!pci_pme_capable(pdev, PCI_D3cold))
> -			goto exit;
> -		else
> +		if (pci_pme_capable(pdev, PCI_D3cold))
>  			*flags |= PCI_HOST_PME_D3COLD_CAPABLE;
> +		else
> +			*flags &= ~PCI_HOST_D3COLD_ALLOWED;
>  	}
>  
>  	return 0;
> -
> -exit:
> -	*flags &= ~PCI_HOST_D3COLD_ALLOWED;
> -
> -	return -EOPNOTSUPP;
>  }
>  
>  /**
> 
