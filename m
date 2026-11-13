Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558469;
	b=jmt0SLL5c1FfOSufi2EyQ2KD9JN4yzgqh1i/IFNDks1uXPFkU5iXjzFtTuOv8M3og1AQ
	 3e0nHTapDABY62cFczrju+6EPW1SBdocSK1gGo42N2oFhL8MGIMPxsGrZNWleLTBySMly
	 MbW/GWWQ8j92WckxsdRCi55LM29sBvSeaJesmvXhnD2Lls6zhaB08ntkDSdCFr8o/7vfV
	 YcuMgHL0eJ9ZsZC8BmvQwE5yBDhayL9lciJjGERNF70KuauwbooAvsXNXSDsBJBX8G2cU
	 JtuXxDZvBR21/k8rhiGPo4lTUZJX51bxMzR8R3LwhmdyT5ENrUN9zAv1y85hZChe2/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558469;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=i/x+QsfJx0kHstIMCxhFe9PP3nMnKKnbOhJVVcIS/uA=;
	b=K/3ie7VwGXFq8uezQRMnDr+czIyFg6rGqAGV+cgKNR/0YwR+9A8OVnKF3a5KDcYbvr24
	 Gnrb6sosmHTybgTL3fkgw76OsXFN8fmthNZH1mxctePcp12xwloHKhTSgMBtw7uOnBYyG
	 4JdzgKFxOz5YXeGMQty+5GJaGa/IfMaNcObRwmdY2POlV6Mp46XteVmJLVyC47ccEE12U
	 UH6NQHRBwSPgmsuicsBCdN7YTN72UduY5rTO7rF/60YKd7lTdQTQohp5nSn/sRHVe4ops
	 VQbuoyr/hUovwsTq4sWjenwlNRm3d4Ch6EzxYAwvkOrgI8ra09XkixDhJ6JQLV647HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GYUZ5QlU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TeWu8c+O;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8828C606A337
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:27:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8828C606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GYUZ5QlU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TeWu8c+O
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD6IBWn1164134
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:27:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i/x+QsfJx0kHstIMCxhFe9PP3nMnKKnbOhJVVcIS/uA=; b=GYUZ5QlU0viAswOQ
	q2V86PWnJsIMXUK2Mo1CCC5DW4UP0//tISa7iTNAj7paNNQCoC+Y180vYZq6vOmn
	8pv2wMtUmMpBjJp6VU+8KDCntwsiO87X4C0dGN9vHq73BekRQ4GF2RUQHIv0tkFJ
	pfeGYYauMcd+8KhCb3exfPzXxhb7lcc4WJkjRE5hUl7UFnBYWA7GXnoiPwO3kjGy
	zU4IInxGgX2ybh6235rEPnyvBPhElNiPdLTTwbqSO9Hl9/ULsl+2U6wMD1C+eJO8
	Mt9CVNx7qhRNMIddmflwtqJkwhX/UMV9WgTt0EJBkxG4ZAKOwSxCrBeyDynZLWGH
	lNyZFA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hww5r8dys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:27:47 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36d1353fdcdso3262075eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 00:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794558466; x=1795163266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i/x+QsfJx0kHstIMCxhFe9PP3nMnKKnbOhJVVcIS/uA=;
        b=TeWu8c+OvR25zF/JirkhyigZEKSYxT2tdp3bKonnoqryXgBZ3f1n0p4MM1C3ixei4o
         4l263zuA7yezVa4RdlhQkbAW7wyB8v9IzjynFfkXtOjQg7Mgivx7WAJvL/Ed6C4KRWD3
         hVqu7MsQ3MC/BGo8qgNAnAPg6RVFmPgXY8Y5tVmMhm1nRqMM0EjDSLMGMCUzFHjYtZAV
         mALg6ok+6xtkjkEye/hVvReFqCEp0KBhh314leeuwH37gEMlc27uFKQ6udu20agFjwxp
         4vqu9H7oALJU88Jwf5OS6BGgqTuAyphin7cdkjMQgpRsnDDGhmogh1E9LmhOJxH1wV3x
         vFjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558466; x=1795163266;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i/x+QsfJx0kHstIMCxhFe9PP3nMnKKnbOhJVVcIS/uA=;
        b=HGt41c+ffPlSR5EHmrHQ0bsMgzia/euEoZIy1/Em3cuUBPOTTvVPSMW4iheE5rfifx
         wDIPRUixxXbbdpL/iCCCk7w31VJhlpamZ0gjAgBaozMm1ISywLecOULOYV+7pT9+mVC+
         iMi7qlofrjZUwqI9Yu1L37hec6blunk/O9cdQk3unE8UI/KKBmtLSKi5PZS3dzUEiY8c
         Tj++BJX7vnw1+SxJwz2N+K5/Hd9bHeNgLe6O1k9n8n08P87IYLZWhm3i3kpyhYT8wFTb
         BUqHQ7qD+x+vrlq805jMh19tg8yTkWfXqCICKNNGpTFpERY8dRHymsP60qam1DhELlJu
         gNZQ==
X-Gm-Message-State: APuU4Z/0Zs3QBM19dgQnCbMUQSqGMpc8PUQzkyGdokSR2/EjDAIW6tue
	W/rEC/pgMFvFakTpa7jHLE6uzi6AuIa/QZAeOheSLE9u4Tuq86BsErtabYX60kSc4Rxzlf7/m4A
	5YWNu0sN0v4ItoX9GZBgxKxqtBDvwClb697ha1R4mz1E9j92wLgKn+LWgFUpts1ZVn09LHXoBLf
	M1
X-Gm-Gg: AYBFou0l9RTi4pQXnqqdXKvoaPhcFY3Fe9hFSUr8loWXr+MIUUM1r+eEdy3IRxyAcFZ
	nGGxstMh7MvjRRS05QZdlbOeSuLFhzsETJbQEPXB9nNEi5SQQMldiAgYZYEZuIhiAMDrEaqj5S7
	Md2FN1GNvis2rrqc5LfnnaEg4Ca7xbvza92EbgdHsy+JA+an7cfo7HmG0PriQJnWXmjxPD4UL9D
	oVRaRuyAMhNp2c5luIj+QOyHbKM+/Ox/Afu+brHLsU/wh9TJImckR8vu/TVixXxYZoQ/Sf+fduG
	2yWzpNDa8lAJ2kMglr7Ia3sYJ3LeYDj6HUTmYoo0j3bsOjoe6Q+ZnyqZzqJtzFyYsfpYEQ51cuf
	FWPtS03fUQsYX69OCLJkZQZtYNejFBjdRChOoD4VQkSjnYVc05DLW3D5KIZAIsJ/5xmUkhE3Wnd
	aSCb8=
X-Received: by 2002:a05:7301:fc87:b0:358:eccb:af7c with SMTP id 5a478bee46e88-37967ae220amr1347627eec.33.1794558465852;
        Fri, 13 Nov 2026 00:27:45 -0800 (PST)
X-Received: by 2002:a05:7301:fc87:b0:358:eccb:af7c with SMTP id 5a478bee46e88-37967ae220amr1347607eec.33.1794558465108;
        Fri, 13 Nov 2026 00:27:45 -0800 (PST)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm9324397eec.20.2026.11.13.00.27.43
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 00:27:44 -0800 (PST)
Message-ID: <1de7bb2a-32ea-4dbd-9e1a-7381cc1de469@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 13:57:42 +0530
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
To: linux-arm-msm@vger.kernel.org
References: <20261027-b4-shikra_lpm_addition-v3-0-424abcdcf824@oss.qualcomm.com>
 <20261027-b4-shikra_lpm_addition-v3-1-424abcdcf824@oss.qualcomm.com>
Content-Language: en-US
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
In-Reply-To: <20261027-b4-shikra_lpm_addition-v3-1-424abcdcf824@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMyBTYWx0ZWRfX1tv/F548yiFi
 55mSRUd1WpsdFGMGEMdPEJ4tRez2ptZnJ8y7hTTdTzBq2y+0UgmIi0Vc3923KfZsdyhhE5YHg4h
 +0qixlg/J3PlNz6XEjc3+i8UZsL3zPUmNO90Vh3TO1il7T8xrOb2iuUv1FcQHGwPTzvdney7Lx+
 ujJyzgSMOnW26he01x0GPbBXoIPmg96BFyirU0YEvt6O0gZcmy9/uTqTGHEXWVf+xw5p2yZeGdn
 NPRQ67dP9MJvRnCIf30580jn0VPoLBXavV3itH0VmOxrEMnskczuisykT9OE5Zs2VNBRZkGB4Wc
 cxATQ7ZH4+Cdi3xKu3IFumaaq0ly9TDF4A91+C7ERqO5qR9lwbuPp9yQr8NM2LSVjkFuucOQoCX
 +sR+mVYTWcYvlX19vZ2h7EppQBJPZwQBRkbJT931SD7kSNOQu5c/5UrQBF6Rpb+WGdXZXCruBOC
 pkBKxO7sTdv2T7e3PPQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMyBTYWx0ZWRfX+mX7iY0mG1aC
 GGSDWUS/RcSSAYUsjzIqN/yPglZ2m92zFlPfkS46zo6QZ2vwuVxOHp726tqUsPDDWUNw6r4BQoL
 hXEh5XLtGha5MGnlE3wm4DHqGtmyAd8=
X-Proofpoint-ORIG-GUID: P4DKhFXeemtAfNrQnANY2uTrJlzNDRE0
X-Authority-Analysis: v=2.4 cv=Vqq2kO2n c=1 sm=1 tr=0 ts=6af6ca03 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Usn_76ATGC6A3XIaq4YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: P4DKhFXeemtAfNrQnANY2uTrJlzNDRE0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130033



On 27-10-2026 18:41, Sneh Mankad wrote:
> MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
> the latest wake up capable interrupts when the CPU cluster is entering the
> deepest idle state. This is done by sending IPC interrupt to RPM and is
> implemented as .power_off() callback by registering MPM as parent power
> domain to CPU cluster.
[...]
>  
> -static int mpm_pd_power_off(struct generic_pm_domain *genpd)
> +static int handle_rpm_notification(struct qcom_mpm_priv *priv)
>  {
> -	struct qcom_mpm_priv *priv = container_of(genpd, struct qcom_mpm_priv,
> -						  genpd);
>  	int i, ret;
>  
>  	for (i = 0; i < priv->reg_stride; i++)
> @@ -307,10 +308,52 @@ static int mpm_pd_power_off(struct generic_pm_domain *genpd)
>  		return ret;
>  
>  	mbox_client_txdone(priv->mbox_chan, 0);
> -
unnecessary blank line deletion.
>  	return 0;
>  }
>  
> +static int mpm_pd_power_off(struct generic_pm_domain *genpd)
> +{
> +	struct qcom_mpm_priv *priv = container_of(genpd, struct qcom_mpm_priv,
> +						  genpd);
fit in same line.
> +
> +	return handle_rpm_notification(priv);
> +}
> +
> +static int mpm_cpu_pm_callback(struct notifier_block *nfb, unsigned long action, void *v)
> +{
> +	struct qcom_mpm_priv *priv = container_of(nfb, struct qcom_mpm_priv, mpm_pm);
> +	int cpus_in_pm;
> +
> +	switch (action) {
> +	case CPU_PM_ENTER:
> +		cpus_in_pm = atomic_inc_return(&priv->cpus_in_pm);
> +		/*
> +		 * NOTE: comments for num_online_cpus() point out that it's
> +		 * only a snapshot so we need to be careful. It should be OK
> +		 * for us to use, though.  It's important for us not to miss
> +		 * if we're the last CPU going down so it would only be a
> +		 * problem if a CPU went offline right after we did the check
> +		 * AND that CPU was not idle AND that CPU was the last non-idle
> +		 * CPU. That can't happen. CPUs would have to come out of idle
> +		 * before the CPU could go offline.
> +		 */
> +		if (cpus_in_pm < num_online_cpus())
> +			return NOTIFY_OK;
> +		break;
> +	case CPU_PM_ENTER_FAILED:
> +	case CPU_PM_EXIT:
> +		atomic_dec(&priv->cpus_in_pm);
> +		return NOTIFY_OK;
> +	default:
> +		return NOTIFY_DONE;
> +	}
> +
> +	if (handle_rpm_notification(priv))
> +		return NOTIFY_BAD;

Before returning NOTIFY_BAD, atomic_dec(&priv->cpus_in_pm );,
The notifier returning error won't be again called with  CPU_PM_ENTER_FAILED case.

> +
> +	return NOTIFY_OK;
> +}
> +
>  static bool gic_hwirq_is_mapped(struct mpm_gic_map *maps, int cnt, u32 hwirq)
>  {
>  	int i;
> @@ -415,26 +458,6 @@ static int qcom_mpm_probe(struct platform_device *pdev, struct device_node *pare
>  	if (irq < 0)
>  		return irq;
>  
> -	genpd = &priv->genpd;
> -	genpd->flags = GENPD_FLAG_IRQ_SAFE;
> -	genpd->power_off = mpm_pd_power_off;
> -
> -	genpd->name = devm_kasprintf(dev, GFP_KERNEL, "%s", dev_name(dev));
> -	if (!genpd->name)
> -		return -ENOMEM;
> -
> -	ret = pm_genpd_init(genpd, NULL, false);
> -	if (ret) {
> -		dev_err(dev, "failed to init genpd: %d\n", ret);
> -		return ret;
> -	}
> -
> -	ret = of_genpd_add_provider_simple(np, genpd);
> -	if (ret) {
> -		dev_err(dev, "failed to add genpd provider: %d\n", ret);
> -		goto remove_genpd;
> -	}
> -
>  	priv->mbox_client.dev = dev;
>  	priv->mbox_client.knows_txdone = true;
>  	priv->mbox_chan = mbox_request_channel(&priv->mbox_client, 0);
> @@ -444,6 +467,35 @@ static int qcom_mpm_probe(struct platform_device *pdev, struct device_node *pare
>  		return ret;
>  	}
>  
> +	if (of_find_property(np, "#power-domain-cells", NULL)) {
> +		genpd = &priv->genpd;
> +		genpd->flags = GENPD_FLAG_IRQ_SAFE;
> +		genpd->power_off = mpm_pd_power_off;
> +
> +		genpd->name = devm_kasprintf(dev, GFP_KERNEL, "%s", dev_name(dev));
> +		if (!genpd->name)
> +			return -ENOMEM;
goto free_mbox since mbox_request_channel() now needs mbox_free_channel() to be invoked.
> +
> +		ret = pm_genpd_init(genpd, NULL, false);
> +		if (ret) {
> +			dev_err(dev, "failed to init genpd: %d\n", ret);
> +			return ret;
same as above.
> +		}
> +
> +		ret = of_genpd_add_provider_simple(np, genpd);
> +		if (ret) {
> +			dev_err(dev, "failed to add genpd provider: %d\n", ret);
> +			goto remove_genpd;
> +		}
> +	} else {
> +		priv->mpm_pm.notifier_call = mpm_cpu_pm_callback;
> +		ret = cpu_pm_register_notifier(&priv->mpm_pm);
> +		if (ret) {
> +			dev_err(dev, "failed to register for CPU_PM notifications: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
>  	parent_domain = irq_find_host(parent);
>  	if (!parent_domain) {
>  		dev_err(dev, "failed to find MPM parent domain\n");
> @@ -473,10 +525,10 @@ static int qcom_mpm_probe(struct platform_device *pdev, struct device_node *pare
>  
>  remove_domain:
>  	irq_domain_remove(priv->domain);
> -free_mbox:
> -	mbox_free_channel(priv->mbox_chan);
>  remove_genpd:
>  	pm_genpd_remove(genpd);
before removing genpd, check if it was added/initialized first since its conditional init now.

> +free_mbox:
> +	mbox_free_channel(priv->mbox_chan);
>  	return ret;

Missing cpu_pm_unregister_notifier() if it was registered above.

Thanks,
Maulik

