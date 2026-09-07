Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF6733F589
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 05:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788758076; cv=none; b=eSkpM7wUV2TJE81Fb2R+iQQsZceWcnYD8RAkOGnXwjS6jk9BEZDuAwQnRDFxOFWivRWtG18/kf0+MZPBUUUGGD+x5CjiCeP7c5Cten0HQhhYFz/W4GM7B2pAf/1p/ir75XcO+Wr1JVtSN/5AHZGYICeYf48Pa6XgpEF9FSEz4ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788758076; c=relaxed/simple;
	bh=3G/cmt5IDXWAN+ERb/IvB03Z9XYoO1EQh16xc/CmS1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zpp48SLEBRyFomckGOPaUg44P4pczM+nCPqp/7BEvyGpyCqlZWfH9xWpKcJCY82tSaENSgZ78lEwmHBQp/x9vz4O9fD36EyW8w8ufr1mFaRMkdwSJXAzoGSg7vy7SHW8L6dsAC0wLJ5daCF+uu7n/f2fIuSOCmdIID7rZjsai9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mwy+yUl2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PasHq5j/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mwy+yUl2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PasHq5j/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873kuIS2276306
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 05:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LLnYiOITNXR4UwC72EqlUUdHBM2uIZGN4ddMUc2bFDY=; b=Mwy+yUl2EODRvCLr
	KbS8kHmLlasN+XK0R84coOfT5ytnlnppsv0Pe6hqUh97VzyfZWvytsqKwwsnGrVn
	DATEOfVeAMV7/4+zMiyKyCdr+HkLVFOSOuoEleRLBADAUtK+cAOV1KCmgVKmBJis
	NGK1z63mvUT+egzy3cBCYG42MUAc15WODybrOk2AzavdM15PlUgNc+mmDNr5NfeC
	+4KQlmRMTigI+Y/D+mLHaYprroVEyclajmY5t9H75cudRCai/9igQXvy6wysM9gR
	j1kFURbrC4dTyhCvdwBJcRoeR/dzrg0tHHP2cVgo3/pAGBfFBOf/xSps2jSFi39P
	RcEUzA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfxkrveq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 05:14:33 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8627258ef12so5077751b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Sep 2026 22:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788758072; x=1789362872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LLnYiOITNXR4UwC72EqlUUdHBM2uIZGN4ddMUc2bFDY=;
        b=PasHq5j/P0eTBI+zx/ddEFkicx8VQAR/wKt42RCo3CFJRo06LCVApwMuRrNvEDaLlS
         MYbBAt2XZ+eKtMF+oNTwURhXTlvltW+fC2BP58PnuRd02WptFHurujlejkXdHoitwyqY
         Vs2D+lvmTkjwxFA7hBg5zHhIGCvEdAZWGP9sPpA2e1DC7Q/WSDuyzybjpFQ/8ryMgKS7
         oQOx7N0sFqSjMqu3/a3el/6w1haekmVispUYwutjUUHRQYY4o2LWKuDnETw4FZSXWmw6
         beDGG846mV0FHLnHjMU9e2Xcxocwe1vRc9avZHmTKgMT6o5YpgKq6r+tL7s26xqYSX79
         lAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788758072; x=1789362872;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LLnYiOITNXR4UwC72EqlUUdHBM2uIZGN4ddMUc2bFDY=;
        b=HcIVv1ASzJNyA7jX1KE6wH7R5ZNGoMr2LcToOUTgPHmF8EGyq/ucAWC9v0QWFT7zoL
         mIvc7PuTpgUVAuvaSvx/b7tb/ev+MZrDyd/JPhME14wxLx7nwIEbLpNUJl+S7yC1trxG
         N6irJk9gK1VJUNKO3wXFh5vnL9usFYwZr8efFShvMnqQwipZnsKAGm5Lok0ORnoQhcpq
         4BURX3NFjhYFej2GNTyEwG9Uodg6MJmyoDogkU0Pt1faUN9k5eeFB9P+sFn1c0IjakpL
         IP6ZP0YfI/h3rR+TYy3C4bbfdX911JFIO8wjwLq9zA+l887urMOcY7Vk7Ag54deNgIVs
         X+EQ==
X-Gm-Message-State: AFuF++mKT+5BJL/qpzP+Xo8tPwSJa+XB3n557zoqEr/y8WUD/RXg5OVw
	q9GLUytawAA1OU/2KhY1IBz6gPxWl7H4IRHdtpwLUWdDOuacBrHDkrRuFlyiWm2bj0r0o+u0xm3
	lE+irAdZQmIFqsuByt9WXwZZi2EXw8y/Jyg574+tmsMDfM5kR8qioLpuiQuN60Lmw3MsMCX8rAp
	gl
X-Gm-Gg: AYBFou3DXZU2t4yLxcNgJ38lwm3TGXuNhA+IfB3DxK6aLpGYLunNHG3eAFmvoI2HRAe
	adoS7X5M+7dYmeDOnCe9P7jL0HowxMwPeXoUktLMmpqOTXwwc6exxN7hbctl7sWV3AaFwpPD0xm
	DbLy3IkzK5TiorOOQSO7MfmJ5V+FhN/ub0pt4DXKt4Txi4Q8YFNq14LVBBsrwfI6KlimRezIo1I
	fJDTTMHEO2fno4Ty1Vq+RlgccU0Lw1PcL2tBRitK/cw/ASx4HLyHvAbtOjCMK2WDaJbqKZKKkJe
	Wrir94bDSkjDtWL2VZaYTaGkkFHBi+hS28I4Tj4QN89KBi78JRYEdKA2wAqgdIfVqkyBGdQkqEA
	6FgnNhI6DBethl8Lb4LFYd5vMOnFQ8BR7Vg==
X-Received: by 2002:a05:6a21:114c:b0:3d1:e510:9052 with SMTP id adf61e73a8af0-3da39ee2689mr32370823637.7.1788758072089;
        Sun, 06 Sep 2026 22:14:32 -0700 (PDT)
X-Received: by 2002:a05:6a21:114c:b0:3d1:e510:9052 with SMTP id adf61e73a8af0-3da39ee2689mr32370785637.7.1788758071745;
        Sun, 06 Sep 2026 22:14:31 -0700 (PDT)
Received: from [10.217.219.15] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ca07sm27645812eec.1.2026.09.06.22.14.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 22:14:31 -0700 (PDT)
Message-ID: <fa7e7439-6f17-4dad-9c9b-6793ac7cfdf3@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 10:44:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dmaengine: qcom: gpi: Add I2C bus recovery opcode
 support
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20260826-i2c_bus_recovery-v1-0-203f0ec76f84@oss.qualcomm.com>
 <20260826-i2c_bus_recovery-v1-1-203f0ec76f84@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260826-i2c_bus_recovery-v1-1-203f0ec76f84@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA1MyBTYWx0ZWRfX+fH+6PWlIMwf
 Cw1qBeYeyMMn2HkjrkISetd9ATrZ/tRapF5IIU+pgOj2Fxq3CvvYhSNci/hECBmgmkv3dpnTwvO
 +V7qYb5vSvqvII6r0mLxAPQkzD4NxYtMuM0c+rw+GZhou/MVkmCGKZLNjJImN7yYe2bhOImo6Ac
 1tATtmdQ6bnaHF1k1EF5E6DwP6r57m+7DF/mEZXklFTI1dzrV/X28E3KfPkcqkgOgTCb+otg2Gm
 pCoBdt46IdOVsT1d4wnu6U9kkQTKF0Kraa4XAvqrPZn8qutiqHXYg32RUwWsSrDHen4LBohX9D1
 51e5qTZ85dRmoM0dKPl9T5fsWhlZtnW5jfu841TVN4yx59xSzBShcf+AXepFNkczj43FMMJxKQ0
 TCmTIyIt/CK4aX1Giq0SpC+tGXo0wuiLiszggCZ2I+SlhFgnLkJN/Ikw+lXl5DRtI+5ZG34Upvv
 OQV32TWIbhAxNyINEIQ==
X-Proofpoint-GUID: cu7q2NOEI-5zfCMyGZvBGJ6VrmiVznNY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA1MyBTYWx0ZWRfX765k9h1WArMy
 98dVhoDs08PMnfaZnmAF/U0S3wtHgioX7mbhJUbRjItDHqU/ThqveVKmUKYskjz2rUaZ0xWg1/7
 fuw1tabJWpIgJiBbY2OYAe0JkCDYLb4=
X-Authority-Analysis: v=2.4 cv=daOwG3Xe c=1 sm=1 tr=0 ts=6a9e4839 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=fhPPmUa07wtAw6AntU8A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: cu7q2NOEI-5zfCMyGZvBGJ6VrmiVznNY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070053



On 8/26/2026 3:21 PM, Aniket Randive wrote:
> The I2C_BUS_CLEAR and I2C_STOP_ON_BUS GENI sequencer opcodes release a
> stuck I2C bus, but the GPI DMA driver has no way to emit these
> zero-payload control commands, so an I2C controller using GPI DMA
> cannot recover the bus.
> 
> Add I2C_BUS_CLEAR and I2C_STOP_ON_BUS to enum i2c_op so I2C drivers can
> request them through gpi_i2c_config.op. Handle them in
> gpi_create_i2c_tre() by emitting a CONFIG TRE (when set_config is set)
> followed by a GO TRE with IEOT set and no DMA TRE, and reserve the
> matching number of ring entries in gpi_prep_slave_sg().
> 

start with problem statement which is being fixed by the respective patch.

Rest of the message can be simplified as below - more you can add.

Allow GPI DMA clients to issue the GENI I2C_BUS_CLEAR and
I2C_STOP_ON_BUS commands used for I2C bus recovery.

Add the new opcodes to the GPI I2C interface and generate the
corresponding CONFIG/GO TRE sequence without data DMA transfers.
Adjust TRE reservation logic to account for these commands.

> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
> ---
>   drivers/dma/qcom/gpi.c           | 30 ++++++++++++++++++++++++++++++
>   include/linux/dma/qcom-gpi-dma.h |  2 ++
>   2 files changed, 32 insertions(+)
> 
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c

[...]

> @@ -1825,6 +1843,18 @@ gpi_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
>   		nr_tre = 2;
>   	if (direction == DMA_DEV_TO_MEM) /* rx */
>   		nr_tre = 1;
> +	/*
> +	 * Recovery opcodes do not require DMA data TREs, only CONFIG
> +	 * (for set_config) and GO TREs. Since gpi_prep_slave_sg() is
> +	 * shared with SPI, verify the channel is I2C before accessing
Not only SPI, its for all GENI protocols. Can say common function for 
all protocols.

May be once such conditions are rising, we need to think of better way 
in design to handle such cases.
> +	 * the configuration data.
> +	 */
> +	if (gchan->protocol == QCOM_GPI_I2C) {
> +		struct gpi_i2c_config *i2c = gchan->config;
> +
> +		if (i2c->op == I2C_BUS_CLEAR || i2c->op == I2C_STOP_ON_BUS)
> +			nr_tre = set_config ? 2 : 1;
> +	}
>   

[...]

