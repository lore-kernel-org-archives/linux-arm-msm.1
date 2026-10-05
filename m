Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AD2416853
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 08:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791189989; cv=none; b=Ql9Nhwthuxjwqf5FR3osb0JyEG8XSfJ3BF52m7FkKe94TPVpvhxRCpnzpQOdfT6HkI5h+H9Kvtofx7lfDAP65pRsjxIJLfkGhcaQsihOtP46yUahQUHAPp0EaaQyuOzAQsD+AHf/vGAh/Tw6Ayc2H/WtNkVe5Xgdp1fFrVc4L+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791189989; c=relaxed/simple;
	bh=lWQMxFYy3CH9ui7usyd4qhc+qXFkgE0C6cwY5p0NkKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pjpHgMGHot0Cg3U/h41TRVQB0hBaYLzcYFJF3MGykDFksAwouWNeNOYltU+LwhHribQ1Xqd+EiBDTnvkkNkQYM5iGx/frnRiBqOA0XAO0ljbdngLDJnF3DJlyfr21dqxkVmxYRDTTQ4mD0Q/aHjI5+kTVzBZUmfxSueEhz4/VWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=foB672t2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qyvvs0Dt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="foB672t2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qyvvs0Dt"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6958b22D1054563
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 08:46:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xkHxS049vFe5YMJRUbWGcu5qpatYUixPO7U8ss5Me7g=; b=foB672t284xNvpKN
	2YDYf2QUbz016Ieb2/bf+O9TjUBVhbVB4gPUzCz0+6BrSQupxpE83fYT572xptLx
	O14P7fsq19dK9Kb3t4VhVsPz7H0EMJL49xeRa9wMzDP2029vGiAj4BPH4uZNdFmc
	gejyIivLjjk6Si+qAAENa2ldj2/dHtbvJKOrO5jVncehOj1kL2k/uCEM7IiZh+zu
	4GGpI5MFRM+LlJDjlb8T2fltW61tC4lkBMtAz48+GfdxgxKvs9PGVKjBvIHdi4yD
	lnUcG3VndSjG5BQVFx71e4rhsqb/ICmDRd2oHURWKcoJHuSKYJYCmjCOygwa+iUK
	L/Wwhg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssu53p7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 08:46:25 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33baaba6371so3956526eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 01:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791189984; x=1791794784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xkHxS049vFe5YMJRUbWGcu5qpatYUixPO7U8ss5Me7g=;
        b=Qyvvs0Dt0tSJPNwsrmJdM4QroN9WX0mXTqG3zsIOkEIhrbsRhDZyz8xNHcchp5nRSl
         iB/PkTixh6QV7sGAsHP6WNHexW23EhJZCfpLyrPCivka0Elk/OhlWPfQU5tsOQanaj+5
         9701EzvmNfonCRcs4y7ko4hWh8FQj0I8kGrSw0J37xeBwaVFgkFKVJm7SpJ1th/xifBW
         gAEgj0d/Drg920Hrw3z3mU2neUt1uV7j8AauljMaTvp3ANJr2soYTH0Qnm/8vWhymxax
         9NobX/1vQ7TvXrwhsLZahK8nQMdXHv+ljK9Dr25DlvS1H6LyXkzRH/wASqueXHkU+M68
         xfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791189984; x=1791794784;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xkHxS049vFe5YMJRUbWGcu5qpatYUixPO7U8ss5Me7g=;
        b=2OVJYa9SQXcYhpUZ6j4mGfmdEpwejdYl/jj6azuf3gytyLH4VPis8wpRH++j5F87mi
         r4ziiSC0evSvQl81S9oFp3G9t5GtHLrZtdzbmU1lgjc7ho9m2P1h9s+LMXKMbVvjd1r6
         kyhesBqbu7Z9SQP5nVSzelHeWWKaPXbvYVnloU2wV6JVSOMyqw2P23x+6q9ees6ay/Zv
         p0lcITDETKfU7FdEU6cJI3XDXl7pgKtX0dg/V/94VD/+LHqi5op9+19cu7DgxrvfAgcg
         U31cmW1NsK63zfkx1i0WHS/bPCJkZGz8nIVWRTk6PRLglh5mDYO6+HhAGmHSEwrc4NH2
         V7Hw==
X-Gm-Message-State: AFuF++lCDdoef3b97JkUtAZyB0z7t1lYDcl4gBs8ab7dPC2Z8sm5ZZLt
	zQUR94sN7QGPalAMkWvDT5t5j3ayiK9d8hrKgoaChxdEp0BZLiFsyoH/Wl7r3c3MM+N55in4R6Z
	k9HkbGLMr5j5SPUVgW2TU0DTRwt3aKZanfxcehDNlQ+aLsRwHbvvhZoPFAT9nXtsu1uIc
X-Gm-Gg: AYBFou2Z/9hZJWJds6PRysltn6MkxI7CXiwPfXhcWXaq/FfV5ZWx4++eByuPYTVFWUZ
	XK7RqSKPPhjKgnqaLzJ1lMu+haEisSGmkz/O2vkGgiwJ2Uv319890RpGP748/RXK3F0WRLX1RoH
	BMeaVVtyoT4k9Ms8hRL4iO/XwF0KX5esKNbs6Ht5+6uhKEU+MakdMy6FS2iiMgM6GVAp1W7aQOS
	4tQgpwcdX4n2n7UqHDOTqbkMDd36tWYo0OeQQkzCeCNsUzAKivTvsTRJvIgoR0MlchYmoHtKdg2
	j5AX83kFD+8vq3W/RCLRYyvOxtTIA6M4fC5lm225CAZithn94FPExc1ZJQ02mSQWKfQOTwInGn3
	nX6HRJOyYfPcFZvy6v2Z45VFKCJBc
X-Received: by 2002:a05:7300:8345:b0:34e:6cb9:14a4 with SMTP id 5a478bee46e88-34f219c10femr13177680eec.36.1791189983827;
        Mon, 05 Oct 2026 01:46:23 -0700 (PDT)
X-Received: by 2002:a05:7300:8345:b0:34e:6cb9:14a4 with SMTP id 5a478bee46e88-34f219c10femr13177643eec.36.1791189983195;
        Mon, 05 Oct 2026 01:46:23 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35127136c44sm12194324eec.9.2026.10.05.01.46.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 01:46:22 -0700 (PDT)
Message-ID: <fc526d99-d04b-45b8-931d-1fa337a8ba41@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 14:16:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] soc: qcom: rpmh-rsc: Output debug information from
 RSC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Raju P.L.S.S.S.N" <quic_rplsssn@quicinc.com>
References: <20260913-rpmh-timeout-debug-v1-v4-0-e94d3e416ea1@oss.qualcomm.com>
 <20260913-rpmh-timeout-debug-v1-v4-3-e94d3e416ea1@oss.qualcomm.com>
 <c24937ff-e88c-4e64-8eda-0b13a8e52f79@oss.qualcomm.com>
Content-Language: en-US
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
In-Reply-To: <c24937ff-e88c-4e64-8eda-0b13a8e52f79@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAzNCBTYWx0ZWRfX5hV+1IHlNS6H
 gKtOI7s7wEi8/yQM/7dpeIs8w7kX5oFvGeOwNec3V4AZ9wIi5cU19AaakInyWM4/cJi2AJGq6dG
 oqia9/6Uq9WthyH95YO0pyvBr1ptlPE6QQZ4/hFDcwUZwzQeJuNTEng4xWhnNocmbvlehqO+OmR
 aGVPDsMZlMyQ7aEAir1h+ExbH48DjcmA1NgrYCBiMKl7UFr8cjSbG/Bjkfc1jhYFYY+6guThNzV
 Eg15PJycBaLjpt/qWXCAbf/lfk1WHNe1OWCTkAkUQNiirM1KW7YpYbHgwGjRSbkblSLJZ7xLnFp
 Z6h9PrydxypxwiOkmtPoM4zbuHgwcf8VDvXh+0ppr3t2DvsHT8I0h3Ecdw9MNn7/X5bbQKzfyMY
 6kKUVv1BSRUxiCQsEDVIzdmVDa5D2PGW3EPxJtXp+W82UelYfIZKH34eSvcSVoLSTQbkMnfzO2s
 j9Gl2450fsNhw+dFqpA==
X-Proofpoint-ORIG-GUID: -BkPf3xFc14VFCEoT3gK66w-QtwoDfU2
X-Proofpoint-GUID: -BkPf3xFc14VFCEoT3gK66w-QtwoDfU2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAzNCBTYWx0ZWRfX0QygJgM020Ma
 FNHg5RdOki+AsX/3S9013NSTHHSOzijq8sE6JULN2GzzGmyIJkPPcxzVPUJOUWq2zfl0p5x4qlV
 enpAuLZZnp18um1Bp0X4ZaH12winhq4=
X-Authority-Analysis: v=2.4 cv=XPSl2ghE c=1 sm=1 tr=0 ts=6ac363e1 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=ZYORgB9VOuKEr7RHt8MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050034



On 21-09-2026 15:27, Konrad Dybcio wrote:
> On 9/13/26 2:54 PM, Maulik Shah wrote:
[...]
>
>> +print_tcs_data:
>> +	/* All TCSes on a given RSC have the same number of commands per TCS. */
>> +	for_each_set_bit(i, &cmds_enabled, drv->tcs[0].ncpt) {
>> +		addr = read_tcs_cmd(drv, drv->regs[RSC_DRV_CMD_ADDR], tcs_id, i);
>> +		data = read_tcs_cmd(drv, drv->regs[RSC_DRV_CMD_DATA], tcs_id, i);
>> +		msgid = read_tcs_cmd(drv, drv->regs[RSC_DRV_CMD_MSGID], tcs_id, i);
>> +		sts = read_tcs_cmd(drv, drv->regs[RSC_DRV_CMD_STATUS], tcs_id, i);
>> +		cmd_db_read_name(addr, rname, sizeof(rname));
> This call may fail and must be checked
Added check in v5.

>
> [...]
>
>> +void rpmh_rsc_debug(struct rsc_drv *drv, struct completion *compl)
>> +{
>> +	struct irq_data *rsc_irq_data = irq_get_irq_data(drv->irq);
>> +	bool gic_irq_sts, aoss_irq_sts = false;
>> +	int i, busy = 0;
>> +
>> +	dev_err(drv->dev, "Timeout on RSC %s\n", drv->name);
>> +
>> +	for (i = 0; i < drv->num_tcs; i++) {
>> +		if (!test_bit(i, drv->tcs_in_use))
>> +			continue;
>> +		busy++;
>> +		print_tcs_info(drv, i, &aoss_irq_sts);
> 2. P2 — Patch 3 retains only the last TCS’s AOSS completion state  
>    rpmh_rsc_debug() iterates all in-use TCSes, but print_tcs_info() assigns
>    rather than accumulates:
> *aoss_irq_sts = !!(irq_sts & BIT(tcs_id));

Addressed in v5.

>
>> +	}
>> +
>> +	if (!rsc_irq_data) {
>> +		dev_err(drv->dev, "No IRQ data for RSC:%s\n", drv->name);
>> +		return;
>> +	}
>> +
>> +	irq_get_irqchip_state(drv->irq, IRQCHIP_STATE_PENDING, &gic_irq_sts);
> This call can reportedly also fail 
Added check in v5.

Thanks,
Maulik
