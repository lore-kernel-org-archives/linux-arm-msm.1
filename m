Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794235835;
	b=omiCZv3tf79K0W80dInxvR6VpxQlq+crCYFLBGcrNQ9hn/whsVJ3yE9QUECdCWuG4iZ/
	 7ZkAH1vsYzuOtDSL1o/bWDuw05M29TwMCftUOqG2LNTuoZh5eJs41MI/kfEqIkOaH2yEZ
	 AZ1DqBXFpA1u0XC5eYVzna5bbbzCUgEeoRPcwVClF/JN1mdM1Pl/IfPYWWpkJne7yUovB
	 Xsn2vb0+Y4mccLdf4Ekgj2AchJl7SuU6xBv50l3fOdAmmNYmq7IYkONHgPxK+W9navGV1
	 q6PMBl6OS2gp/RrJ0Ov91D0kKpIuX01O9NJl4XOfiVQ55B+Lva4ut3Ms6uzFlPRqAmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794235835;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ktl4hmn75wiR8RtpfaYKiKGeVMUUbsH4QzLqiQ0sffU=;
	b=ZtRsTJgOYvlgQDvDMoROmPA2BHvOcA5Z62aVqQxuR0/3o6ttKw9Ych6uUrXReaz4Mlnh
	 /6nEd7RVfXI+zowtVdwuPqhegiWyiu+dUZTdYUjNDaS0qMbFdxmqQlGbOFIfNHKYDGl/G
	 hcvMQbxH63Xgsa1YeZGnfuy/vk/xlQw2LOVtDKJH27mqdCOHpZurwDMH2bV5E/aUDxtfh
	 k48u8rV4RquFr3zt6zGpTuP7rAz7/2nVHGpb5UsMT671M4fkG9sDNBXF6871Sf9gYXPwK
	 xP/ctxH3hIHRW9+z31GaNGJWqt8K9dVzRtZEBdpylZj0xc2125is2ol2nX77xS6qPNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iPsisOVo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UR1b3dTT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610E0606A33A
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 14:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 610E0606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iPsisOVo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UR1b3dTT
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DErjX336350
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 14:50:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ktl4hmn75wiR8RtpfaYKiKGeVMUUbsH4QzLqiQ0sffU=; b=iPsisOVoDXgMpI7z
	fJBnRvUvcsE5O0IpbOPV4sEaIfQZH/D30YSfvXWo8C+gDklfi0wfWWX2klkRA7RB
	ZmB+YkwxHb5VgLYumzcJSk6ynGlnRzet962Ci2Tw7WjO47//xJEXkwbPrBW4XQXO
	wY2RstYXTo57yHkfvLWsRUlGsjlN+EEvQwSkh6t8ZUpt8NvbkjiA3RcDu1LeWnyQ
	jRB23WniW+XnaQHGr0zcI2HDIjRhfgI/b2H6/67hiwVL3OnOPtJkYR3W4nimOlAz
	HErlb+dC1GZig/qVPm2A/lzgED9md9TzwebPVCxAp6jBYL3AwSBKgD4cBtHzln38
	tFGbdQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5rs9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 14:50:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f6f4fe531so167637385a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 06:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794235830; x=1794840630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ktl4hmn75wiR8RtpfaYKiKGeVMUUbsH4QzLqiQ0sffU=;
        b=UR1b3dTTXi9nQLvXy0y0l1Ge3iFLVG9mSKKj/C/sOm+ESLU7X2NA0Y18+M9gLR2OUo
         9sDX/82JI0uMTvxdgi0r7omIoY7T5jU1f5OaOnp1qvJ9f+NcWlVDeNT2M22gbC836FDM
         qE7Cs1o6bMOBsUkHzIaFbiTkuoxH53ZDtgJ3N6cZ4iezriE+cRPLiqdoDwLnQS+n9Ctz
         acGIVdEqkSxYuu/8hf/TAQ93PRIch3Kc3ABvBwB7yNxtixd6MqDTR6e2gg3i09y8hy9t
         +GqL4JAaFSLI09QvsdmjQulMoR2Dh2S+44UfJownd8RAHkFWaeIbg4yGUWpOJu0XG56Y
         bCBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794235830; x=1794840630;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ktl4hmn75wiR8RtpfaYKiKGeVMUUbsH4QzLqiQ0sffU=;
        b=MlkNxSsCDK8TvP9UBUuFDUEjPeax8rF3cGX7hp0HLVrER5weUqo6UFfLOYUluOEGc2
         URdfeHZdJ8kCMNkGqIu30WR3lio/Ew8PsbtP2EoZIgx/ywuyxDGvKnviZoz2PeAD1qCT
         ItqCmLO5l4KJbovXqdlrsGAwiNOYgM3xOyEwBAUA6oyVddmkYnJI4KkMyrnmdLOBTo93
         CdJ4wSihKlIawO9GYgjpsAZLrOiF+zFqGxWcx0CRrpcO5AMRermkJZhpMWec1JV+8BI/
         q4+OdtD9btVL4XmbcziC2nu3Ufo2z3NzDDY1Kp78RcuJz5S0/e7QTnJdEeWwogVxZGlF
         dUsQ==
X-Gm-Message-State: APuU4Z+7iQ9In0lj4M1suVl1CcOlb6yN2+K1v9j/Il/7Axg9x5dRpGxO
	7KPjZ8la6JJAhnJN+/yo7io4tzaU6bwxBHPX6G5VW82LoZrV9LPTARKy2++OzCpho5Xeng2sB39
	gOXjjXCB8SCUX7P/4bLUULykz3DAlvWko1VEYZMrpNj9pwQBLOhaFt7SNJS8b3I5tzUS+VRrKkm
	kl
X-Gm-Gg: AYBFou1QaESSUSPdjfdujvgOzNF6ifOyOVnyRadRM+1OjGuwsfi7OWFStRBlWtd/h3S
	HyFUeZF0SIdnbFgggGtLOhtHoNY39ipCKpdRnlM2pRPX9LdRUrpYN/SmdkEOdRvkcoRNlmhEqtZ
	MvKZQbiH2tUnQpoXJs0HqBUJ6Th+0HJAQ9Eh5k8vbUPvXRWilASUt7UD8K8ZZvxjU1xvYy+l29+
	vymotDYjORaGPNJWXeyzBVamZinkHkA1xJeisuuzkpQHUJLr7Om0K8HD0sxN/+BIjYOeceKwCJS
	Q/E/qk5Dv2YoqJetIogsMSqvJCMTzXtHAGkVXIZ/ocs0k1qh8sv3czMoGXSd7P8CuvPyzjJ6mW2
	DNxP4T/msn+szQpRrwUIUKSvcpGx0CpZmhRWfiT3RWixDH8c90qQJLRZEkRNCMdt2KU0Q7INH0g
	x5FazcEgWcEDqM7XIrj1Tmugo=
X-Received: by 2002:a05:620a:4088:b0:939:7fc4:fb1a with SMTP id af79cd13be357-94784212518mr641834285a.27.1794235829495;
        Mon, 09 Nov 2026 06:50:29 -0800 (PST)
X-Received: by 2002:a05:620a:4088:b0:939:7fc4:fb1a with SMTP id af79cd13be357-94784212518mr641829285a.27.1794235828909;
        Mon, 09 Nov 2026 06:50:28 -0800 (PST)
Received: from [172.20.2.50] (51-148-87-169.dsl.zen.co.uk. [51.148.87.169])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c4d68d53b6csm185881566b.9.2026.11.09.06.50.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:50:27 -0800 (PST)
Message-ID: <b77240a7-fa95-4164-859a-775a1278cc93@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 14:50:25 +0000
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
Subject: Re: [PATCH] soundwire: qcom: enable CPU interrupts only for MMIO
 controllers
To: ivanverbovoy@gmail.com, Srinivas Kandagatla <srini@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261109-swrm-mmio-irq-v1-1-570fc05f22d7@gmail.com>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261109-swrm-mmio-irq-v1-1-570fc05f22d7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1OSBTYWx0ZWRfX9odNrk7gGMCO
 hHX3cYNo+6XLcELb0dLVZ2QgaPgPE3gp/fDLO196U5bbi1JyD00o8b+fG6d8L/EDj12yLmjr0ku
 wqgxWgvMsriBkgvxc51WFGtqYbUttkE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1OSBTYWx0ZWRfX7JEIT4nOOF63
 tTCrdjpZAr5eMsB5GN/GpplhD0MXoT+PPaFXzXBFz1jBenSiqq/BqNMgCOynxi7kqh8WpKOwlBx
 /LFvPQ1LFtVAQalipQN7YRKVANmbkpO8KdQa2e8hk8P1KleS1OAW9n6E+i3uBZoM1f5waffAJsa
 W6otKrIxm3wd5YdaZ5P3p2lwrZnqdQ1wBkxeW6MrhhV7BSGLEXiy0wv3uH781BPqb+x18R2vrmu
 2d3WrAyPRmlgTW+XlZE9UXjB1/ZfHZ4ShsUXFF0wwaB6MnyluisqivubW2KU+HGZLdu2eKKGYDX
 y0NgZeiTLKPSUFRNOkgnzeFRC3ADpovWPm3PsrzwXUVRXKFLk0IqTK6KABROjq0yF5vNR39YB9d
 7BtE1QQEWA6JeoN19WRyWvtf2CTAWgaNXQr/knYhb8WmnvEolaDrLHzBUX5jQwZRqRl6a2cy27+
 waSomgfiWMOV/Sk8sjQ==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af1ddb9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZN5Ng2YwNTFb1nzmVy1PXg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Pipf9DByAUi2Cdr85H4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: rQ9l3bFiB8yqRhO0J-Qx846zBjbrkFfQ
X-Proofpoint-GUID: rQ9l3bFiB8yqRhO0J-Qx846zBjbrkFfQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090059

On 11/9/26 4:21 AM, Ivan Verbovoy via B4 Relay wrote:
> From: Ivan Verbovoy <ivanverbovoy@gmail.com>
> 
> Commit b27be5a85ed3 ("soundwire: qcom: add EE-aware register layout for
> Shikra") dropped the ctrl->mmio check around the CPU interrupt enable in
> qcom_swrm_init(), which its message does not mention. The enable has
> been written for MMIO controllers only since they were added in
> commit 82f5c70c2651 ("soundwire: qcom: add support for mmio soundwire
> master devices"); a controller inside a codec, reached over SLIMbus, was
> left alone.
> 
> On a Surface Duo (SM8150, a WCD9340 with one WSA8815 on its SoundWire)
> the amplifier no longer enumerates since: "SWR bus clsh detected" at
> boot, "link failed to connect" at each resume, and every stream fails
> with -110. With the check back it enumerates and plays again. Shikra's
> controller is MMIO and keeps the enable.
> 
> Fixes: b27be5a85ed3 ("soundwire: qcom: add EE-aware register layout for Shikra")
> Signed-off-by: Ivan Verbovoy <ivanverbovoy@gmail.com>
> ---

lgtm,
Reviewed-by: Srinivas Kandagatla<srinivas.kandagatla@oss.qualcomm.com>

--Srini

>  drivers/soundwire/qcom.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 147e55b7a600..99c1b6398894 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -995,8 +995,9 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>  			0xFFFFFFFF);
>  
>  	/* enable CPU IRQs for the selected EE window */
> -	ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
> -			SWRM_INTERRUPT_STATUS_RMSK);
> +	if (ctrl->mmio)
> +		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
> +				SWRM_INTERRUPT_STATUS_RMSK);
>  
>  	/* Set IRQ to PULSE */
>  	ctrl->reg_write(ctrl, SWRM_COMP_CFG_ADDR,
> 
> ---
> base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
> change-id: 20261109-swrm-mmio-irq-d896783a54da
> 
> Best regards,
> --  
> Ivan Verbovoy <ivanverbovoy@gmail.com>
> 
> 
> 

