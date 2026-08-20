Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2241842AFA9
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 11:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787225378; cv=none; b=hMYzo/uuP5EhZJl3QaZGekC07AGzeGMJ66GwcAqSKDNQ3DGT1dQ25b/qtX1hVV4BgqQ2A/OgLaHpY38ZCFpsUfTXJAmQrvhDcsDz+j/RHjHzGWc3gEjBUk4/FF6Ko95ASU7Js6xaerEbZbTdKdiItA1vv3IhdBKVS/f5WsdW6g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787225378; c=relaxed/simple;
	bh=Cxd6pgPVZoXg5MbuWqBI98heC5T71zU/bEdaKDUim+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U+VuwEtHgViqgZF8Bq/YjlNW5fGxO5V3KECz1Fe2oFNn13g4cyFwS0BEsmWH54ve4UIawdCn7rig6o5TELpTytJ+DdqSJYb079r+0F3yO7JBvqnW0kJ+JHrAeOJjCsPzebqDNZL3jypQWGv147QNuIfgu4Q9YYHVgTLvqg0ioMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IyvpxZQV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WnmDUxmc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IyvpxZQV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WnmDUxmc"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K7LF8B2753074
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 11:29:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z5RJHCDBjCYjzVbsGhsN2fKihT+Xn3HtNK94516A/Zg=; b=IyvpxZQVIU1sgyW/
	Hy+WKcvLnt9abqoJ1OeYePenNtbxyPvNCRhAfrssl5COYUYWtdnZpm80cOo4Zqpf
	tKasWkvx7bVttpc0NIxPnxEEXbeZzkYAr4a5gxqqqNVOL8K9+HTEHtSefJK+xZd4
	YuvcjNtTNxjmovsfOZZ+YHQ2L+E1MKl1PoLEngpu4s1WWghgH2OpDnWTCE8BCwTg
	vXPNQ7N8tQsLJUctMcyG+w/fA4azM9ikAr13uzvlzChMlEbx6Q823lcQUwzscrkl
	ivdvwGd2IdJBLNmECAIJGq71OjR1n0oB5VEvPWKTC4boxiuoejZqLaBw/sBoA5sH
	nHoGIA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5w498xmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 11:29:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51ca37ce4c3so412141cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 04:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787225375; x=1787830175; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z5RJHCDBjCYjzVbsGhsN2fKihT+Xn3HtNK94516A/Zg=;
        b=WnmDUxmc6jCAZfFtFz4ga0Vqk5gK74C4dReXZ4nisqlAq1egCSDCBRdvq/8VycLdxR
         mJ0r/TBuC065L3EQGajtEPaqLxJOK7F8lEGL+NBQrOFfXH2oQiodiSxMUEsgMzjKF600
         /4i7HEomIHgdCBhCrUzil5f4mlRZW9yF+kfQk0pa2HlTqGZQ+R+yi3viGk3bWV0lFyE7
         3zxTdfex+jUg/VsY+nS3ZvyOSfqRjp8pdIaVDtqN+b6s+pdNcR7c715e2V1zl28i6En5
         jMg4Y5nNIsdcdaPrND9fFpiidhqIyJbKps5pUAgVUdMVvFyu0vVi/lSJDmxXmrpU6Ffh
         rvNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787225375; x=1787830175;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5RJHCDBjCYjzVbsGhsN2fKihT+Xn3HtNK94516A/Zg=;
        b=L99ken2ICo+EtxcDTBTUt+ck2ZUNk3TBQjxJ+LymiEvfiNXAOLOtFpnI3Ci80IwV7y
         NA7qHhLvmSMR4USK3HnYL5f8wlhLIS4OTq/nDLyBaV9klqgAmmgCpSIrm/FhiczWM0Eh
         WvT8hce0Q3aInio3P1JvIqEDQVoaJs3iAVKLVveNK1n1C22NfoMpXBtez9IynGFg+/MT
         a7fStkFf6wdEfd5H5HMQkDjEs+Kytiv+F1A7GyDkhF8GR7d+DuVYv6qo8x423SeYQL1F
         PP1zR/zOpBVpEZzlpiDLkFC0topQHmiBadJzbespm+qKUAHNq8C9aGuUA3lTCUxoogqI
         1W7w==
X-Forwarded-Encrypted: i=1; AHgh+RrzaToOLSP7OeUiTeZkj/6RNr9yWQPAy1OLdJXsUv8pyaGOPfOt7w6SAj9Be7b1HaLAdWrjrYQI5WiYxndX@vger.kernel.org
X-Gm-Message-State: AOJu0YxjmBC7VmryWMCplCzlw2YBFEOmo3luMfzG6G6+7Rjf5yXug7Pc
	t2SPGV6PzMM1LeT5o/j7z7rCnZaa48FT6B+lLLQcvtpyT5dl6ac+j/2A5jvbDz5WQFDVuB551Sg
	zddzJ5yGcSZJKjXNoh63BbRhNrnMlsaKkBG8ZDoHd1B7KECs2jC3MoSKuL7l2s3k6p8M3
X-Gm-Gg: AR+sD10y7K8SP9waUruV9HAoJjqi+vs/rFM7SLQIt2C6w42uaqT/YA9GZKCPURpprDe
	XS7c+ZvqQO2/AY4FUAf7SlRWTLrXKV52vGz9DwLqBqyeYJEbqW9UzlaE6vYTOjmIUDtGP4nH4Oz
	Sq9J2paIuljUqs7X78hjCdDdtRGcUDAR/z1rkeJ0vmrtyVBfXdNjheUkZgWWKUQ6LqRnslKmY/O
	GVPy4R8pn+OTIQ2i4yzV7xbR0Ncd4JIXTgwzfVvsB1X0uaL2DdjDqp4drRxcCSsCC1kV9u2A3U0
	6J7m5yiRR9z8Izdtix/PKM8Ma6YFJkf5JeMUYpq+sK8vq/2nB0HglBqu+EP2iaD51mb0LvMvFq5
	xp6z+xE6oedUFftYBbuGqktsf
X-Received: by 2002:ac8:5d08:0:b0:51b:f40b:2faf with SMTP id d75a77b69052e-52dd5cf7f84mr81389631cf.4.1787225375368;
        Thu, 20 Aug 2026 04:29:35 -0700 (PDT)
X-Received: by 2002:ac8:5d08:0:b0:51b:f40b:2faf with SMTP id d75a77b69052e-52dd5cf7f84mr81389421cf.4.1787225374978;
        Thu, 20 Aug 2026 04:29:34 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3feec9e2esm1942826a12.5.2026.08.20.04.29.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 04:29:33 -0700 (PDT)
Message-ID: <e09c979b-0ac1-41c4-a48b-14549c780de2@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 13:29:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] PCI: qcom: Block accesses to downstream devices on
 link down
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260819-ecam_blocker-v2-1-e7a8fdc1c5cb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819-ecam_blocker-v2-1-e7a8fdc1c5cb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA4NSBTYWx0ZWRfX5e4URrqisPUN
 px0LbcPfdwpYyRT31QBnFoyZQQAaZGfpy8iLHq33s2gF3iTKyXMz86NZzwHPPaQTTfc61W22P1j
 c0ek7AqRRBdNPIuDxuhBOB16VTxsaOI=
X-Authority-Analysis: v=2.4 cv=YP+vDxGx c=1 sm=1 tr=0 ts=6a86e520 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=J8a1EZ1zYi-ZQbc0NmkA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 8ZLpuIjXecb8PRzJklCfy8UqZU3iXEE8
X-Proofpoint-GUID: 8ZLpuIjXecb8PRzJklCfy8UqZU3iXEE8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA4NSBTYWx0ZWRfXw9SJsY4xqA0C
 y4SIpr2TOAmxfYEClQLyMt4gtUZ1KB86/8caQBtab6fIKVpaNwsZfZ51WD1Vod6C4wYrpMGwq2I
 SlOmEhFTtF4o8i02RdRQWikWFDWdeI3e/IIV4H5H5boy9SYhSnmU1alDYa1MjJW1WHJgOYgaG+d
 5KFVgE+LQN5us09ZaNZLVxGMecnJePFGzv0WwvsFNt+bSVA7tIg92jPXq41kxQt1Qwz5oly22NM
 FFXPqs7RiX6zaQp5wDQvNt0e1E/djheSEsK7Z2Lm7yoQUijaCwyiKLUFt1t1vytT3BJSCIMbVgs
 lGqgS5/wW4XgiFq92fQkiyxVbhSUtkCFnbpBL60P0IyOrfaQu/38HmHIHe0UVh8bnB8oo7WHrtM
 tNxm7LMRBetVHYecurKIMwKYgPJ+Vt0KgllUj7HoOuouilgO5Nsz2YFdsJupy+pUgWs3e20JBzU
 F2MOneMNPZIgS3iKBEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200085

On 8/20/26 8:36 AM, Qiang Yu wrote:
> After a PCIe link goes down, software may still access the BAR (MMIO)
> space or configuration space of devices behind that link before recovery
> has run. As the link is down, these accesses never complete, resulting in
> a storm of Completion Timeout AERs.

[...]

>  static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> @@ -1775,13 +1832,15 @@ static int qcom_pcie_reset_root_port(struct pci_host_bridge *bridge,
>  	u32 val;
>  	int ret;
>  
> +	mutex_lock(&pcie->hw_lock);

guard(mutex)(&pcie->hw_lock)

This decreases the number of AERs I see while de-authorizing the
PCIe link on a TBT3 connection to an ASUS PA27AC monitor from
"a whole lot" to just 1 on X1E80100 CRD

Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # X1E80100 CRD + ASUS PA27AC

Konrad
