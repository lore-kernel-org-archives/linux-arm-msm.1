Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981969;
	b=Y/MeEKvbrKeE7mSrlF3n+RXNm2Jg3llPt0BxSDMLxqfdE43ssIzytZDt+6OcZQk3/8/A
	 5j97i6Vk5fawfDTYuoDGeKmmW5yGaGQleXb1QYUlPrEHEM2i50aFLcpc6OeZtH/t6rrDA
	 hCG7XW+1PyxIZLdSdXew4U02VWY341h0JK1bkbe+3EeN0kQkoeGIAIjVTjQcRjy6G0obP
	 h7U97zZj8JgFfZPpVfwKUa1Nrx8ho/xxTGrStCYL4XnhuJgCh9OJH0HADpLON0qDtzXon
	 1bPiWmyU5ZK311m5sLGSrlxNme0NZalnmrzpDx+tPBOTTUrqx8XUlaCEFUktfRf1hSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981969;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kkmY3gkQI0jhGDVsVTfiNIiiPaDDvyP2GKIjDhjruTc=;
	b=MP6ab8ZW3eb92ZJUQsYty+g/Ybw72uMLVk7fEPofBmUBlfT8GROIUfNXM9hidccYUYg0
	 u55BH7o0BY/UXVIo6Gmo8vizlPfPRVV/KuwnAHrTbzVO/29A8fwVzi1zYR6YtcIXZUTzT
	 peWe5C7AdwT7TgFZcPhkti+lvzuFXT9OfuCISbrKyQQYtjtXaoysZwjUJK3tVgv1Nfxe1
	 Hhyw+hxdluRNGxrAdW3CNP1bEdTIzZlOJw8eYb2l5D6DdrU1/VizhGqid4lsL3I5nsHQd
	 kLGeAdpmJTU/bp8Ro5g9+hwyuoLO5PvIu32dlBJNnOODKBbEB8gWGa3tT9+rH0mG2jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=md2NryjG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gu+VLylX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA93606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EA93606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=md2NryjG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gu+VLylX
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V3ZV764123
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:06:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kkmY3gkQI0jhGDVsVTfiNIiiPaDDvyP2GKIjDhjruTc=; b=md2NryjGg7gNb9Lp
	zvzULXm0RLF4+L0A1joA4cxae04n/lI5YaKI0pTjLbdlXDpecLBBhgWBj9GVxlMd
	1nAlMTiWY31JJ4KzvT8EI7tT0F+ayUc3En5zdG1W68HBOJ6JuyTaaVgEHW28J8hA
	Olvpcf26Vsem+XasAi/4vJs2fmkMNMDZAHa/wZ92Vb/uvbQ681Hwd1FuGZfVNvp+
	CTs6lBKNkc9M3POJR9NAmWv2zKaXFJIDtnEDUIi+IL9kilcDE2muK60tvtjOINEa
	sO63q3bhoTSa8NLBS8Vi/2CX0lm9prdT/Fs5Wl1FCtzmZDpkq+HiT6sKWl/Iw8BE
	F/Kwzg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvb9f96-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:06:08 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a3451ea93so722114eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 22:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981968; x=1795586768; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kkmY3gkQI0jhGDVsVTfiNIiiPaDDvyP2GKIjDhjruTc=;
        b=Gu+VLylX2k7OrLVsVKi3wGOVmoyCM92hRrkdFmYaIyLtcOwHpjzqnra15dUis3dx7z
         1VaerfLqEgrm4LZXQ1cJ4NwsBLd9ojAVFf+5c09XuutS6cH+6DwObYCFbE52SWea2yaD
         3B/7T4fk/sGHmstEERMONVmNLiLbqyAfDm550Bor+ey9U71eUgku1D0CodMS9RcoeIJN
         DP23D8u9VWDh6uVxuNqEXPWF9wakCsubotzVHAJ37UIoiKeMpeUff+hY5ujcw99PZ0tG
         1n/qPn2bu86AVL1ruCHOu4sqKEqxWOC/aARIJMBFHoo2N5ohEch3T3uJJ/h5OJv08WFe
         d43g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981968; x=1795586768;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kkmY3gkQI0jhGDVsVTfiNIiiPaDDvyP2GKIjDhjruTc=;
        b=G1sLXq35E+I0IJuBHEZa86JUHccXD2Rpyvrmb6fb+oLVhDZn/FrdQFlY4hz7onUoK/
         Kuj1EFP9vLgAE1Bc1zeT/fMd66Kao11c1MELHxVBTk8WatiJUhydMBx+CZwe/lPL3EiM
         phMaMiZ6WS8EJ6iRnJRKKsyoaUlR290kPPx8uOfKjNk5a9ZgdeWEIgWQ9KRdmtq3Sh6c
         L2h4G9E8qe6M046lm6RqAYI9fQmqfJAEqUdiBFAYrS6QKGFIfEM1hy8ROIEV2l+1G5EP
         2LHLx3kkCINV7JYMjTQ7x0R51eYeLC1Xd4kLTGTc1FT5mYin3LhQVy21xVyPZX+qlCTT
         9pfg==
X-Forwarded-Encrypted: i=1; AL+hErEITfI0zQcJV0/yeg5QPBwupNNMQCekUHkT73aHH4WYOg1/QNEmi6IwqP77BsabEHcD1Nt88eiCoU/Urkw2@vger.kernel.org
X-Gm-Message-State: APuU4Z+pte6yUWKnTUeEEyZCFZdD6WGPPY/Vhs086wRNciw2GtRh6pTs
	UWr01aeo9ZQ6n6O0s1LedVXAajNHviO4RcbM6dD/9pAbR0f+4JNWBbNmjsdM5Qkm5MJbAPJDn0b
	J5Ur2zVkk3/AE8EgoJPezhF9b0cctZD4+Jn/kQsP7e/B4SQ5B3mjm/4YxV3d/a8urxASQWNnQqs
	aP
X-Gm-Gg: AZFdTZfgqgc4OGVCxjxvb1CGUWqA3doS7taP2WJICzGNDLKEZEWvI7KeNpiT+Deels0
	vMxr70Cdh/4eNVLuYGJ20Ov73KBSsjYj8e9rTr3CntAiNUUGk/CT3Wuxxx9Q9DGAVovIBs2IjDd
	EKYnNjZgq1S5r81jz0pbtjb/YksvVORoDwpdoibbc69KHsRVUOZwPpVBJ4vjGGr4UJ66RnEmKDB
	wvFcEPJAkFmk+l3kNVWXPNC6yV0PKvMayxgGrY49Wg54vW9b996cEArd7IgJibTfdT4eOddwPLc
	7dvJdwcaZLxe88OA2al9k9jNlVWIDAR0N3Raj6ZkvC+wwEpcCDeCclPQS/95m8VUwN31sYJCnJp
	r7Q1qYZ3DdBrd9coe2/at2yFeRP5hMJbuzc28aHou5C7WGG+yHBmlJRvB0YjWpfig//7lICQlUg
	UvAxtklDrZ
X-Received: by 2002:a05:7301:4707:b0:376:5b99:a7e3 with SMTP id 5a478bee46e88-3827d52c20amr1749353eec.3.1794981967557;
        Tue, 17 Nov 2026 22:06:07 -0800 (PST)
X-Received: by 2002:a05:7301:4707:b0:376:5b99:a7e3 with SMTP id 5a478bee46e88-3827d52c20amr1749333eec.3.1794981966969;
        Tue, 17 Nov 2026 22:06:06 -0800 (PST)
Received: from [192.168.31.154] ([49.43.222.231])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a76d70fasm4112371eec.22.2026.11.17.22.06.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 22:06:06 -0800 (PST)
Message-ID: <f0d79055-1c5f-4a43-8ba0-1fb321b64d41@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:36:02 +0530
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
Subject: Re: [PATCH v3 1/2] irqchip: irq-qcom-mpm: Register MPM with cpu_pm
 for RPM notification
To: Maulik Shah <maulik.shah@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org
References: <20261027-b4-shikra_lpm_addition-v3-0-424abcdcf824@oss.qualcomm.com>
 <20261027-b4-shikra_lpm_addition-v3-1-424abcdcf824@oss.qualcomm.com>
 <1de7bb2a-32ea-4dbd-9e1a-7381cc1de469@oss.qualcomm.com>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <1de7bb2a-32ea-4dbd-9e1a-7381cc1de469@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: UybaL3yHu_VR7Y9EplV_7J0THJwaXK-C
X-Proofpoint-ORIG-GUID: UybaL3yHu_VR7Y9EplV_7J0THJwaXK-C
X-Authority-Analysis: v=2.4 cv=YfgodARf c=1 sm=1 tr=0 ts=6afd4050 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=gYheP+wAqRwOCTG5qVz/BA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=7wDeNAiZl8v3LiBnlQAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfXxoY4aFl34Nw/
 UzQfuXeDKfwpRmkavKyO27fIAg4jJTQfgee1FZrqKeMoDCYE4DHxgf0IXv401djEc3lpAmJchlv
 KfcojBVcHUtKeAqmnLWw97Bvng0Irs4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfXyzYR6aXD1XRj
 dOvnrtEm14st2qhDaQOsPU9L+6OX1Mh11GK7yolttpI+opIlYGKnxaImXr9uO8p6LRkFuQicyqB
 SzZBf3tvgIdHONbDHfuwPAJWzKwiLXOFokIwLbVBm1Bjx42S4e874pHbef+FbNjb/GgGsmqDv4E
 GYfwI0Vllhikd/Z8AniyW8Nus6NIOwxHN6ADpo/6dNd56Ifpmct4hK7rVZtSpbOcgClbULCOHPA
 2W7f5uG5g72vBQgoG+ezjeXu2sAFbjKBy3AVfLGgYLDVGoCGofPUT0T+qriiWVct+xgeBS1t4k4
 rdztm8qZFUCmCv7G0fNS2TyOtLUfPaGA/ItVsPKk0tfuI5CYW7LxEbLAJ7JFa4bbUKNgpabpLUe
 Q2YnrlIW/w7ayRVHSWVQK4ivUxfL8ZgRj1Z0B295CRDjfYavu7W9wafDLzsYuQq5inkL1Wf2cp2
 JCfdvM0h2SGSPi10tmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024



On 13-11-2026 13:57, Maulik Shah wrote:
> 
> 
> On 27-10-2026 18:41, Sneh Mankad wrote:
>> MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
>> the latest wake up capable interrupts when the CPU cluster is entering the
>> deepest idle state. This is done by sending IPC interrupt to RPM and is
>> implemented as .power_off() callback by registering MPM as parent power
>> domain to CPU cluster.
> [...]
>>  
>> -static int mpm_pd_power_off(struct generic_pm_domain *genpd)
>> +static int handle_rpm_notification(struct qcom_mpm_priv *priv)
>>  {
>> -	struct qcom_mpm_priv *priv = container_of(genpd, struct qcom_mpm_priv,
>> -						  genpd);
>>  	int i, ret;
>>  
>>  	for (i = 0; i < priv->reg_stride; i++)
>> @@ -307,10 +308,52 @@ static int mpm_pd_power_off(struct generic_pm_domain *genpd)
>>  		return ret;
>>  
>>  	mbox_client_txdone(priv->mbox_chan, 0);
>> -
> unnecessary blank line deletion.
>>  	return 0;
>>  }
>>  
>> +static int mpm_pd_power_off(struct generic_pm_domain *genpd)
>> +{
>> +	struct qcom_mpm_priv *priv = container_of(genpd, struct qcom_mpm_priv,
>> +						  genpd);
> fit in same line.
>> +
>> +	return handle_rpm_notification(priv);
>> +}
>> +
>> +static int mpm_cpu_pm_callback(struct notifier_block *nfb, unsigned long action, void *v)
>> +{
>> +	struct qcom_mpm_priv *priv = container_of(nfb, struct qcom_mpm_priv, mpm_pm);
>> +	int cpus_in_pm;
>> +
>> +	switch (action) {
>> +	case CPU_PM_ENTER:
>> +		cpus_in_pm = atomic_inc_return(&priv->cpus_in_pm);
>> +		/*
>> +		 * NOTE: comments for num_online_cpus() point out that it's
>> +		 * only a snapshot so we need to be careful. It should be OK
>> +		 * for us to use, though.  It's important for us not to miss
>> +		 * if we're the last CPU going down so it would only be a
>> +		 * problem if a CPU went offline right after we did the check
>> +		 * AND that CPU was not idle AND that CPU was the last non-idle
>> +		 * CPU. That can't happen. CPUs would have to come out of idle
>> +		 * before the CPU could go offline.
>> +		 */
>> +		if (cpus_in_pm < num_online_cpus())
>> +			return NOTIFY_OK;
>> +		break;
>> +	case CPU_PM_ENTER_FAILED:
>> +	case CPU_PM_EXIT:
>> +		atomic_dec(&priv->cpus_in_pm);
>> +		return NOTIFY_OK;
>> +	default:
>> +		return NOTIFY_DONE;
>> +	}
>> +
>> +	if (handle_rpm_notification(priv))
>> +		return NOTIFY_BAD;
> 
> Before returning NOTIFY_BAD, atomic_dec(&priv->cpus_in_pm );,
> The notifier returning error won't be again called with  CPU_PM_ENTER_FAILED case.
> 
>> +
>> +	return NOTIFY_OK;
>> +}
>> +
>>  static bool gic_hwirq_is_mapped(struct mpm_gic_map *maps, int cnt, u32 hwirq)
>>  {
>>  	int i;
>> @@ -415,26 +458,6 @@ static int qcom_mpm_probe(struct platform_device *pdev, struct device_node *pare
>>  	if (irq < 0)
>>  		return irq;
>>  
>> -	genpd = &priv->genpd;
>> -	genpd->flags = GENPD_FLAG_IRQ_SAFE;
>> -	genpd->power_off = mpm_pd_power_off;
>> -
>> -	genpd->name = devm_kasprintf(dev, GFP_KERNEL, "%s", dev_name(dev));
>> -	if (!genpd->name)
>> -		return -ENOMEM;
>> -
>> -	ret = pm_genpd_init(genpd, NULL, false);
>> -	if (ret) {
>> -		dev_err(dev, "failed to init genpd: %d\n", ret);
>> -		return ret;
>> -	}
>> -
>> -	ret = of_genpd_add_provider_simple(np, genpd);
>> -	if (ret) {
>> -		dev_err(dev, "failed to add genpd provider: %d\n", ret);
>> -		goto remove_genpd;
>> -	}
>> -
>>  	priv->mbox_client.dev = dev;
>>  	priv->mbox_client.knows_txdone = true;
>>  	priv->mbox_chan = mbox_request_channel(&priv->mbox_client, 0);
>> @@ -444,6 +467,35 @@ static int qcom_mpm_probe(struct platform_device *pdev, struct device_node *pare
>>  		return ret;
>>  	}
>>  
>> +	if (of_find_property(np, "#power-domain-cells", NULL)) {
>> +		genpd = &priv->genpd;
>> +		genpd->flags = GENPD_FLAG_IRQ_SAFE;
>> +		genpd->power_off = mpm_pd_power_off;
>> +
>> +		genpd->name = devm_kasprintf(dev, GFP_KERNEL, "%s", dev_name(dev));
>> +		if (!genpd->name)
>> +			return -ENOMEM;
> goto free_mbox since mbox_request_channel() now needs mbox_free_channel() to be invoked.
>> +
>> +		ret = pm_genpd_init(genpd, NULL, false);
>> +		if (ret) {
>> +			dev_err(dev, "failed to init genpd: %d\n", ret);
>> +			return ret;
> same as above.
>> +		}
>> +
>> +		ret = of_genpd_add_provider_simple(np, genpd);
>> +		if (ret) {
>> +			dev_err(dev, "failed to add genpd provider: %d\n", ret);
>> +			goto remove_genpd;
>> +		}
>> +	} else {
>> +		priv->mpm_pm.notifier_call = mpm_cpu_pm_callback;
>> +		ret = cpu_pm_register_notifier(&priv->mpm_pm);
>> +		if (ret) {
>> +			dev_err(dev, "failed to register for CPU_PM notifications: %d\n", ret);
>> +			return ret;
>> +		}
>> +	}
>> +
>>  	parent_domain = irq_find_host(parent);
>>  	if (!parent_domain) {
>>  		dev_err(dev, "failed to find MPM parent domain\n");
>> @@ -473,10 +525,10 @@ static int qcom_mpm_probe(struct platform_device *pdev, struct device_node *pare
>>  
>>  remove_domain:
>>  	irq_domain_remove(priv->domain);
>> -free_mbox:
>> -	mbox_free_channel(priv->mbox_chan);
>>  remove_genpd:
>>  	pm_genpd_remove(genpd);
> before removing genpd, check if it was added/initialized first since its conditional init now.
> 
>> +free_mbox:
>> +	mbox_free_channel(priv->mbox_chan);
>>  	return ret;
> 
> Missing cpu_pm_unregister_notifier() if it was registered above.

Thanks for pointing these out, will address them and post the revision.

Thanks,
Sneh
