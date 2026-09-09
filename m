Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951DE560ADF
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 13:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959918; cv=none; b=kOgRlWNQfH+7a+bQobEKomH3PFjAIG9//mA3hSekgOtHY6YT9IVbUZnJMeqULD+rWB0YjcnpVroT8bL/MuYzd60+jKTocJUv+/F7+vtL2b2NkSzGrrF071o8HIPkrhShx3SIAJ2TEAdek7iWFIeHD8XyrRoJqJxkYmS4FROlW/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959918; c=relaxed/simple;
	bh=a7rYioRF/z+DKZTT8dvvwnzMI+g2CsDK6uuUTRGX8s8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F1GsGmUJCvMnn/kgrEXU7EU0VrGeH92Qvyfvm3lYVhma6cFL3kfZzfuQT8xvyGj8grGemuQJsALRFMRIWW7OSNueiH4SmDnjrzhg08lXfpmLrenF3/+O8wn8hPbK3q/Qy3PgjjPeHLt6NOeCZ4v+6/FQw6lmdLhkJyKK29ATEi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OFgR1DHH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KZ1oH0nZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OFgR1DHH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KZ1oH0nZ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU2oC1810053
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 13:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gfi8ef++Hb6e2GhMwRQBMP+9hfBlDprgUvHsZPb3K8s=; b=OFgR1DHH/Tnfjci3
	OIRKNXVIzctoIb1I/v0sSKb0lYepC46e+s1SUueeOkB1Q84u3Jtu7ghp4ZS2peK4
	uxUzcf2QfFNPdYqaQjumuDTgBSKAl3n7sMxeC6KzFJAc+swFzKojoZ6Ajxkpsen6
	iWYoErshS6Hy5aUI3OtBuTEpe+5PHwzJSh0auXRhGTuTM8HZ89F4wCvfgBGguUpg
	hgNQwHf+ZGV20Up1mFyGkFeB8Y9KRAji1GxIA6BPYecaV1xtGxpI8HunI6blHwGE
	W9Hegdx5SlEpg03WFFsM5SGAXSLe7L61xzkidFyzquR3cTfojVCOSrjsTLgPrWk1
	qfxZQA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk4xj0tf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 13:18:29 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-789eb1bdd79so167735137.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 06:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788959909; x=1789564709; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gfi8ef++Hb6e2GhMwRQBMP+9hfBlDprgUvHsZPb3K8s=;
        b=KZ1oH0nZMpB0idptN8/+N45CUJhgmGEfOl20Zg4ifOyl0PmT7iuBLKptRwBY3BMh6m
         4igFiGrjQuh50Ta4v2MCh7jd5m3FIuqyo7YUb/3R14FJ0qxiP9nvYceI3Qk7T6UOYhh6
         DYJb/Qzk7LDND/0J+/BhNSc7d2HF74MevdkMNfAo73IM7MqzvoKBFHv2R/6XtMGom3tz
         EVv8f1cr5d2+GwKzTza4tbfx59klMkBhI258uub5NzkSDYNQxe72tdStqj+pG+8ttVef
         M5TZ9mT9cp/326wbzkEE4Z+pL9GSBDRlUFFDu3ScdX0o77Pi0WkKbg6Jj2jSWY8VlbSz
         zs0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788959909; x=1789564709;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gfi8ef++Hb6e2GhMwRQBMP+9hfBlDprgUvHsZPb3K8s=;
        b=sMyLBxK4Uc5D1NHzHl3Y3ZgZrrn29yf+P/AOryqDrn3ScrVEyyXZHkIVzWM9dfJkPI
         32nUIqvduoyA1Er2ejhNOmGZuzLUz4BPkHpz1qP60jiOVtdFaloQddauWiVfOalRjV+I
         tmZKVyn1fduBk61dGxhBF+p3yXS/bGly+8NU6aaJyQqiyNL8pGlzuhr1YO3kCOnGoKyD
         il560ek2slj8w9zLkdmydwntu7ZMCsVJYAhwO3T4O9FRRFrjpcaqJpYq0gM2v/jzgixS
         P1Jz/yOUb8wB0RGmioNXSTdYyFF35MeuXombw2wHzJ+Gu1GFIbJWaFiiXVE4GcuGh/sj
         LA/w==
X-Forwarded-Encrypted: i=1; AKwUvBx+ZF7gsOCc8bYZF03P+plRT+z3VaR80XzCWBCcde4SI+e0rKex/cWmGXSj+axxVbCrfHBzXyoYCfVS4XsP@vger.kernel.org
X-Gm-Message-State: AFuF++kKwfehNRoeA/EF1QJ3y6I6gFqent2NMp4IRg7W2p2+UZ5df4hm
	AeWuTTojqFQXmD9stqy89kB1cSe/703zoZ7s/XVJ096PEPWzUDyLVmIb4sEP/5/fx0QSEpiTWbx
	CUlxGaQs5bxaihaFBIB/YuK1ijdlaIU7e0LPB9L17g1YAJHrRnhXhbo4Wjrg8OR5aB3C5
X-Gm-Gg: AYBFou1JEC5kkWY08VRlqliksHOlxuXoq1o5dyo8bcLci5WA6ih+id0Rf/lhB1MPI4i
	2Q9DgXYPqAqveW13yZxs55s1O2lJo+vrsjpv6slNCIDQKnRutDCzKRFyTyOzcxFRLM4x3aXTpWb
	ByvrLog73aIDxsFQud0D1yVj49rH/5LhJd39Z8OFVYa2d95GZMLVA1DdFwmsmUdfLpCHkJsVy3+
	n/JPd08AxzzaXakmA4Y7i7P9f+IXMBPGGxmUjXH74ArWzekzShEWKLVThip01RhPcH4ly6+VjEq
	XaL8KK1W+kJ1FnWbtGbIHQeZ8my32NqIFZvVeo9IpC/zoqPpL7rxC6lS1/Q1te7rmnkBNKSUySr
	/7z7n5v3GwyzZHMhKn3tmsg==
X-Received: by 2002:a05:6102:4b13:b0:78d:3ee3:c558 with SMTP id ada2fe7eead31-78d3ee3c590mr2663663137.1.1788959909105;
        Wed, 09 Sep 2026 06:18:29 -0700 (PDT)
X-Received: by 2002:a05:6102:4b13:b0:78d:3ee3:c558 with SMTP id ada2fe7eead31-78d3ee3c590mr2663623137.1.1788959908276;
        Wed, 09 Sep 2026 06:18:28 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a37054a18fsm40935661fa.6.2026.09.09.06.18.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 06:18:27 -0700 (PDT)
Message-ID: <80f626f9-8a0d-49cb-a592-14195900e997@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 15:18:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] PCI: qcom: Implement shutdown() callback
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260909-shutdown-v6-0-62b7bd123236@oss.qualcomm.com>
 <20260909-shutdown-v6-3-62b7bd123236@oss.qualcomm.com>
 <562fd574-a798-4b57-98fd-dc8e7c09f7f0@oss.qualcomm.com>
 <468f4ca4-e52e-48b3-bd60-20cadf7f311e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <468f4ca4-e52e-48b3-bd60-20cadf7f311e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0OSBTYWx0ZWRfX6/ylfbfjNkWl
 OjUYIIoT7I4IfiZuKlfaxfSu6ZWs2awoPcjj6LDi9C+nwFMKA3OgW4IY8wJaErQsJ8roWg60gUB
 TzbPtXAciKzlV9SaoBYRz1JOIxSoUaY=
X-Authority-Analysis: v=2.4 cv=J52aKgnS c=1 sm=1 tr=0 ts=6aa15ca5 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=6iFfqT-ZHnXBFAo-NbgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: xpNQXnXae4BawecJ_-x_7Ti6EeVcnzOK
X-Proofpoint-GUID: xpNQXnXae4BawecJ_-x_7Ti6EeVcnzOK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0OSBTYWx0ZWRfX30Yrs8TGfVsO
 /MEFvVapmEdwx3PYzyyNC+/UjMw933sQtzMXLDtUA7ahBMSrYQ+Djynpjp8NlDr0dRKb+/wudzm
 fpxxz4MPkTA9oSJIz/P3hqXwstnisV1Zv1j7AIQXM0KK0KvZQtRxD6Nzorr44wtrGN8pxGKjNDx
 Ze3XNBF1r2/8o1lBSHEJQ9eHY4sa92zWacFippJeM475Ol8cp/6kVKEFeTTk0zggMfWGhNS3c/9
 gHDQ7wtR/zRdGoXs+Y6x3dZvgDssqDB/tPy/rp03g1HWHRmBQiRoY4AfTscNftRc3KJi6ZW0/Qh
 wI4dt5IVMD7O9d9UNBykK/BqRnTln8RK79juNno10s5Jhdb4tuXE6VCgW0LIafNljNoCKE5Xq1m
 qWB6ZWDf4TgRE/NbL14KS2AGsazdQjCTLPtmM0FPGytvlQk6eh+HKf1XdlpSilVDw3kgIUx5NbO
 KoqyVyiSx7Pf0Nh8cBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090149

On 9/9/26 2:40 PM, Krishna Chaitanya Chundru wrote:
> 
> 
> On 9/9/2026 6:06 PM, Konrad Dybcio wrote:
>> On 9/9/26 2:24 PM, Krishna Chaitanya Chundru wrote:
>>> From: Manivannan Sadhasivam <mani@kernel.org>
>>>
>>> PCIe host controllers should bring the link down cleanly before system
>>> shutdown/reboot proceeds to remove power/clocks from the controller.
>>> Without this, the link may still be up and endpoints still have
>>> transactions in flight when power/clocks are cut, which can trip SMMU
>>> translation faults or NoC protocol errors.
>>>
>>> Reuse dw_pcie_suspend_noirq() in the shutdown path to force the link
>>> into L2, putting it into D3cold.
>>>
>>> device_shutdown() runs with interrupts enabled, unlike suspend_noirq().
>>> Mask the chained MSI IRQ(s) and the Global IRQ before tearing down the
>>> link and clocks/PHY, since a late/spurious interrupt could otherwise
>>> reach a handler that touches now-unclocked PARF/DBI registers.
>>>
>>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>> ---
>> [...]
>>
>>> +static void qcom_pcie_shutdown(struct platform_device *pdev)
>>> +{
>>> +	const struct qcom_pcie_cfg *pcie_cfg = of_device_get_match_data(&pdev->dev);
>>> +	struct qcom_pcie *pcie;
>>> +	struct dw_pcie *pci;
>>> +
>>> +	if (pcie_cfg && pcie_cfg->firmware_managed) {
>>> +		/*
>>> +		 * Firmware owns the link teardown and clock/PHY shutdown in
>>> +		 * this mode; Linux only owns the chained MSI IRQ(s), which
>>> +		 * still need to be masked off before shutdown proceeds.
>>> +		 */
>>> +		pci = platform_get_drvdata(pdev);
>>> +	} else {
>>> +		pcie = platform_get_drvdata(pdev);
>> This is no less than an intriguing choice.. please store the same
>> element in both cases so we don't have to do this
> for firmware_managed solutions struct qcom_pcie *pcie is not being
> used/allocated at all. it will waste of memory if we allocate memory for just
> this use case. - Krishna Chaitanya.

Should we move it to a separate file/driver then, perhaps?
We could share the ECAM ops in e.g. pcie-qcom-common.c

Konrad
