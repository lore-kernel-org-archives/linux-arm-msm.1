Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103714;
	b=GQjJj9CF+RzDpPfrtETH1OCutxkh1oly48t1Rr2lrnGHu8Q3m86+IS31Xd4FkaE9PVhN
	 ZirAVRjIqf+jVo8aC3afesS9fWehHbsCzV1a48gVVKboeRuHBpnZh1hMXUswUlfLDhHcv
	 wRPjOxcjvM+jZe9icNwm01/iNgt0+5fwY8E62i+rXnCab8pcleAmYE6lqI9V6rkz3L6Yq
	 ttO3kJ73Uw8LXJxXZXfaAiE3E4lOvHopqrC7qlXEeP6sPDLZGKC2OCRFhAe1z0ojt45PV
	 /bjINSbY3xZOpzpMVbjFsu1yBnaXcPPCrmCMBN6dWEGAJd7sXJqPdrzqxEI3yjhihdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103714;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7TtjdxphCRqlCdR6E2spA/NhRe0oAq26D3swKgGExww=;
	b=IqsE1ca/fxVFAjuZ8+g4XCgtM6bHGGRwukw2ztCteJCjGn6QHuk7Asz1kEuhdFrIGT0H
	 kjGZ+JIjUR2NJfZ3XNgbcBqA8k06eZA2bRegenrxBxCRGPaGS1grWhYAwb7HqGRbuQ6Hi
	 J8JyTTdEG6pdaIOU9I4TfHNU3V7qeXF+EUqg/KtMWZucuM5MvQgGThr9hhpJ7bB8VPomo
	 fFs99GQO5gNz4r0nFy5UAZFBtNlCRU/JVaGBC7R5olMvHfvNphLsHHVLS8khAKLNSzVDj
	 Fe+xERN5A/8ak6KcsRXP9uJQW6haLYiNwaIqMzSDAJEq2Pm81HUJ/eB1hnQDLp59Mng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c9PutExw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DLg7poqP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878D2606A31F
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:21:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 878D2606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c9PutExw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DLg7poqP
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdxV22523926
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:21:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7TtjdxphCRqlCdR6E2spA/NhRe0oAq26D3swKgGExww=; b=c9PutExwq5FooRjV
	GyCqcBrVhxyKBfajKleQkBGVunTQigizDhQAHpznoGKRJk5CyXBSJ1jMMGomxytq
	JqPoNwH00b2JtOQccD8pUjFWwKEtAaer09ippaoT09UmAc5AKd1bpG24gI5pOuqM
	Ij/vKGERXj9msKYG4lwpsPr0q+DMslB6SY5tUBdnS+GxV8SDcOpTsCPDxAawikQ5
	1Z3qRUWiCp4GkbWfCSTzx79vknqz5nflM+QPs65m4N1EZpBO9+Fe96xoG7Hl4jzn
	GNMx2OqFIDyWNLcIWKwvcSY+ac/b3JSsHI9AKixfGtrmKvrX8CweufJh5DFj7Jvy
	tGbYrQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqw21170-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:21:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3adcb81f487so6535584a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 05:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793103711; x=1793708511; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7TtjdxphCRqlCdR6E2spA/NhRe0oAq26D3swKgGExww=;
        b=DLg7poqPAZwwh8XXuGpE8B26jOo+OHc1iXIbpisrK/dGV2orXw5QehUojbpr7CpF/E
         nJFRp6rJWEHRoke4I0i/az7DjXENs3BBaxNCxsKHoaiTUVT6T8SAhMiIXEPtLraOcAj4
         BEV82qBCaIdN+q4NsTOnBB6s88QrVXem7MEX2hN8ZVZwDLz0F5GkgWunVic/TQuZn9ri
         Hca248kuLqBdBd9cpbeWcWggCGchnICPFYPKjNkRMHiJLgMp3RonnbBdtGlC+eUPg6On
         KgJoRSNKMuTSkHxnFiEppD+HGTkdaMPku7Rf0ZOfiftDmIychprvreq3wlTkh7uoYZn8
         RB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793103711; x=1793708511;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7TtjdxphCRqlCdR6E2spA/NhRe0oAq26D3swKgGExww=;
        b=zjCGYtoCsPuIIohzJXoavky+zJPIQ/GyXnlA79HkBxDX3z/cwwO7wVLLJDoYoIRgDS
         vaJalg9IsA/95TZs3QBZQf1xX3QqmKMDUlwChX3+NRY2AyRx9wwMPYYtHds18BIZJVoU
         ZT1bE0twaQEgd085e/q6ACgu7Al7+1NhtW6Jtmv0J+gnDRYkUau6cyQYswvYD1jWaHau
         3US4JTyQL+TiLIY+KJNUzgwHJ0SUjSN9wyndN0T7FIzd7m0ouKCrOW1vV1VvrXst43vZ
         dhHPkV5xWI7eIqX2rxwyudZwFm30dNgMuuBztlZadtJVF6eFzHETTmZRJ/g0GEI92DVh
         fc/A==
X-Forwarded-Encrypted: i=1; AKwUvBzMPVLa/7sWdmLawy5TamIqZMBy8lvGqvyvRF83/W6Kr2/QktpD9vEKYLDkRxLdgskggykxRt6egm22F/2f@vger.kernel.org
X-Gm-Message-State: AFq9FYKz0tO84GzO2kTxYatHIm/hjoPPrvNbfY1TDP0+7MzXDgDs4zw0
	sBYefUjbf5tevdA0E8qhLxNKXaQGE+m5xszghHYz4tqXJt1LB2zlqPYuzWs6Is0QWqajPqFLLMG
	TNGI1LYDE6lpcMqqOFP2qz9oThCmStnvi7Q32M9A68XbTWt6GZnC3aj+MfmKKD8Zm7nIB
X-Gm-Gg: AYBFou3N9+ZzEmgAOiJPxRIPM9fN4xlMyk4Jk3QcYKtbQrRyhEnAsUI8j+1vEN3NfUY
	zdUhxaMtrhC5NWslIg804K4vrJlYGz/oT2hABOU0mvXHJq/Gu0oYPDGf7bT2LreTsDkbENy2zNC
	5UIY9EwXhXv860m/MK0Lyp6K+XMNOXUsQYuLKU24AyKfnC85LvryCfcLxa9Ysn3JJUtUPuPp+XE
	QWReWqHLJre3vpTMcBI1CB9vb8XA52J0PIMBD2ZYO+C/FEgSjwxSuDc5wksZ40BgLOzMrQNGQkK
	G7pGVfCtY63AkST3JfcUanGZFodK9k470Gy4TB7p7UUb5CIgHhcgzTvfLzK4wP+5LfrvJmC9zJ0
	Ps3SanT0JfORB5K3bwaZGsHMlDcC2s2Xi/qoKBhoHDQGt7/YA3vOW81tvEkD8e8wLIUE=
X-Received: by 2002:a17:90b:685:b0:3a7:9413:cfae with SMTP id 98e67ed59e1d1-3ae36a81273mr2151579a91.42.1793103711008;
        Tue, 27 Oct 2026 05:21:51 -0700 (PDT)
X-Received: by 2002:a17:90b:685:b0:3a7:9413:cfae with SMTP id 98e67ed59e1d1-3ae36a81273mr2151551a91.42.1793103710334;
        Tue, 27 Oct 2026 05:21:50 -0700 (PDT)
Received: from [192.168.1.6] ([122.177.241.224])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae4041fafcsm4755328a91.0.2026.10.27.05.21.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:21:49 -0700 (PDT)
Message-ID: <76f04cfa-33da-4d4a-9fc0-84427977f9df@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 17:51:43 +0530
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
Subject: Re: [PATCH v2 1/1] phy: qualcomm: m31-eusb2: Add register
 XCFGI_159_152 for SE0 recovery
To: Peter Chen <peter.chen@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261027015545.2758784-1-peter.chen@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20261027015545.2758784-1-peter.chen@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0OSBTYWx0ZWRfXzfEDhaBUPfpc
 y4i4QT18tdGLScCSOhQHzeeWivzrNbTB8kDiBfGYKlEQrYKVw95+J5qXzkvf4lMAI5rD4UXfdON
 Qcb1LnEcaJZti2HCeJQnCpqQuFn1dVyLzbXAyJB0jEOX0F7kyvRBBTFG+BdS1YATVyMIK2W1p74
 qjzqxIskU7vJksFnt261RvIIgo4XSTURc2ZXkGDEGzuCZ1x5uP8SKW0tRVfoxLgWIeh0Ufc2b3s
 q0n4aWENbWsahLeyL8lSY63aCB2KGsbaidyyksaraYYZHA2DTs/iL+0Lu+hObrkxMxg8DUEzqe9
 cqb/B5amMYjTrPOvCn9MUhh7eW3a7kQPaWgbeaxMzqQibw29JwZ+9b/Un+H6f3mo0w8aC4MLYW8
 YixgACpLz0l+DsTsf+HatjnqNZyqazGG8BDvSpHElKS76J+INBebWzaNg5VahnZcupMhknp6yKq
 HJ+B3Ri2+m9gu39EcGg==
X-Proofpoint-GUID: HYuRGyUJhbOBFs2xsa32KzNAnqtWQaj2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0OSBTYWx0ZWRfX6moTrYxF0Ec8
 ynXCkG5tXte/oYdGQBjPZCYt8MkOID7+zifc4w425H9ol8d2uT6bgYyVMU6UOabk1sT3AdUC59Z
 DqHy9lLK7sP5S5pyPUajSfJ8Gt8QVdc=
X-Authority-Analysis: v=2.4 cv=PsYG/AM3 c=1 sm=1 tr=0 ts=6ae09760 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=VANyJ50yWUE6IziFVoGcxg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bCQCG6ZwM2LpJ9RowfEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: HYuRGyUJhbOBFs2xsa32KzNAnqtWQaj2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270049



On 10/27/2026 7:25 AM, Peter Chen wrote:
> From: Elson Serrao <elson.serrao@oss.qualcomm.com>
> 
> This patch introduces support for the XCFGI_159_152 register to enable a
> hardware-based SE0 recovery mechanism in the M31 PHY when operating in
> host mode.
> 
> During PHY initialization, spurious pulses from external devices can
> interfere with speed negotiation, potentially leading to abnormal
> behavior. To mitigate this, the M31 PHY provides a fail-safe mechanism
> controlled by bit 159 of the XCFGI register.
> 
> When XCFG_SE0_TIMEOUT_EN (bit 159) is set, a hardware counter is
> activated to monitor the SE0 state. If SE0 persists for more than 2.5 ms
> before entering L0 mode, the PHY interprets this as bus inactivity and
> resets the state machine to its default state. After transitioning to
> L0, the PHY resumes normal operation in accordance with the eUSB
> specification.
> 
> Fixes: 9c8504861cc4 ("phy: qcom: Add M31 based eUSB2 PHY driver")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>

Reviewed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

> ---
> Changes for v2:
> - Add Fixes and Reviewed-by tags
> - Link to v1: https://lore.kernel.org/all/20261020061811.3127511-1-peter.chen@oss.qualcomm.com/
> 
>   drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> index 275df38256de..8d954e772585 100644
> --- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> @@ -56,6 +56,9 @@
>   #define USB_PHY_XCFGI_7_0		(0x15c)
>   #define PLL_LOCK_TIME			GENMASK(1, 0)
>   
> +#define USB_PHY_XCFGI_159_152		(0x1a8)
> +#define SE0_TIMEOUT_EN			BIT(7)
> +
>   #define M31_EUSB_PHY_INIT_CFG(o, b, v)	\
>   {				\
>   	.off = o,		\
> @@ -88,6 +91,13 @@ static const struct m31_phy_tbl_entry m31_eusb2_setup_tbl[] = {
>   };
>   
>   static const struct m31_phy_tbl_entry m31_eusb_phy_override_tbl[] = {
> +	/*
> +	 * Set XCFGI[159] to enable SE0 timeout mechanism in M31.
> +	 * This enables a counter which will assume bus inactive if
> +	 * SE0 is more than 2.5ms and reset the state machine to default
> +	 * state.
> +	 */
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_159_152, SE0_TIMEOUT_EN, 1),
>   	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_39_32, HSTX_PE, 0),
>   	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_71_64, HSTX_SWING, 7),
>   	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_31_24, HSTX_SLEW, 0),

