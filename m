Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96959429023
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 11:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162771; cv=none; b=VPGmOeglpcV/MEJUHdYjV204qxkcBKFHUblP72P3cE/vnvDBwlj2oSBR5/SKvFz4ozvF1zGvQZJHnuMHaGDyMx1sEKQn887SqIkShWBSkZqBlMMpcF3prmwr+vvLnScpKITVlBqBGCW3zJ+ehzBaD+MtXnlIG8NfXrDY63dI3eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162771; c=relaxed/simple;
	bh=1MCzPuhkOUx0yiCuhAWhyHvppbKmv7dz62NnFmmX68o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F1KSldEL0KGUcR+0J28kVm5dWS6B/ezm5Ta/3lgPPjtnD0qYA+zGaRr6zWwh+rM6u3K1x5PcnNPmiv8h+g3END0L4n9QTjl+lM9e9UCLh3VqdV5Uw1ntTKrm+kw/nfwotZisBziKDmmMHk/Qs/2qPUT9Qix/f9y4DqBJOgdkAZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HptVv/Mm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O/jbzqCR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HptVv/Mm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O/jbzqCR"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2ef52429393
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 11:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JqrKcvddEjNxdraXN5+nL8C9yc6R7w3YPVbh4Z3k6lY=; b=HptVv/MmzLlyy6aW
	SWMDsOq9FeecDMFcKgSUvkiXmdZx3LxUnhHOgkV9PLObA5OD5u7aoJc8DrK3qCGp
	1PZd2HLhj9W9950/cYWWaeekldN5+7tV/xRqyNHSVxa07Vcrxs5tCeXwty1fI8MM
	qBb+olSYXpK6Rm6Dh3qfs5mPrDJbNSZbKWSP4MTcDZ27d62mNpOHfUOhf3zEBFSy
	suqaTrw712vgO8ruwiI7BKyRR3PCCpdx4Xt1GwT0tquW9SGBxZH8ikKg8Py8yhD/
	2AGNTLQ2HwcMCnicaq7njhTS9g8R26O5h5z7Y9hoDUEQ7+/9tNtDiJU7bYt9ExS/
	HFBYaA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv9bqh9hu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 11:26:01 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30f1b904861so1046388eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 04:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790162761; x=1790767561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JqrKcvddEjNxdraXN5+nL8C9yc6R7w3YPVbh4Z3k6lY=;
        b=O/jbzqCReHpnfiHgSP3671AQDPQRfbW9pji8r4BdWszkKpH3dWbyjH/eXZkthtuTaw
         FS+XVJqhs2b3CIx13+FAmdBEqSlYBQYwJcFXjCWrxJg40S+/tfbJkukyj5TQUBLLDSHO
         Qufd9FWN9IL1q4qufW92IOxq82l+JaNM/JPJwQn06mvaV8GjczQ7EOmu3R56cNj163NO
         RevRBZ2wsQ6zgRCIaJ4yWymB6mNnaw5Vgk4c/uKJXWZ4vrRpANFUALTM9C9mD+tCGlpp
         eO0Rxy9fsGrPlGWa3k/svHdFqbL8xaVsPqNP1Tqo21XI8XHJdCBJ0cEbD1gQUom12gX/
         AFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790162761; x=1790767561;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JqrKcvddEjNxdraXN5+nL8C9yc6R7w3YPVbh4Z3k6lY=;
        b=GF2ZYlaP0MnLP3TmlpSrI1k0O5Jx9n6A0xMYB4KoK+WDiRz8RMKNo9Fywgiqk8r8UQ
         B4OSeXHah/gARhqiGpK7NuBu0SKsCdQrItt68X1tOB648nagXkyPXLDYzn8BRvkjP5yl
         G0vTUsdD7U2BhFowljWFp7zXkzQWpU4z7U/Dj9PUX0qMpNg1ydY4TEPmJavGvvtX83GN
         VFecRs4x2D20tkGrX6pg+Vo0HEl9YysBhPUzKt/gykdepll2UBdCmSkFcodr70ltjba3
         sSligQyYr/tzpIfoB37qv9na0Y18v7IlTGTL471eXvnXmidMhBnMzgmh7aYyL0NJYBlw
         9y4A==
X-Forwarded-Encrypted: i=1; AKwUvBz1XyzRDW5YnLJAqzp0kzZjD+zGnxa9TOBB047/KpxVuCT+/Bm+19WEdcpN7hPh8A0vr+FUkHE9jgAxgtbl@vger.kernel.org
X-Gm-Message-State: AFuF++mBXHYNGha/qz8GP/f6CY1fJ0wzCBYrmPE1HJnxZUznlZGFAUbw
	HxeSEPlFrGXhREaf2tXPUV5S9XVF+The5UiUH8Fv2TCvk9rvngjJYWK9WAPk4hvteNckhy3YTa9
	va21Qs6OQ+ckyA1XK9yFY64vLLOkEFRV3kc3v+z72oLMnxG/hh+L/pV6GD4MClXaqxQEM
X-Gm-Gg: AYBFou0bpTRf40Rbo6YhlQ/pl6j6G1qk/PFkoY5g8mFLTZzcAjQv7pmrFgmFiiZHQQ+
	dBE2Bj69HJ8mQCBPN7rWITN6K21EYOZ9X0PEJK4/AIt9fays4qpR100aTIy8OJ0IOYdYTFJWS9a
	EGoTOd2LAIOJDehmy5rpQtfH7aj1yyHYkgtwFaRtX6KdAAz9koK2RVym9x7Q9erf6q/WJyiN225
	2RLrAUuGSsiPLwQUP/Br/lLmIY3CV7BTIKFnkN7eXWa6IWxXtSv3WIGmEPCA0AK6Eu+WfBVkjeJ
	HwwYFLVxIpLAcRbehhubWjzFBafSpaIVJj6qPe5chjQNoNJdMGNUCSEP9MNNcS/ADdEY2akNENc
	HGkwjuwTtmj1VruvAAnQo2t3Po+N1+Pk=
X-Received: by 2002:a05:7022:282:20b0:144:eab0:9cbc with SMTP id a92af1059eb24-144f9170182mr2757136c88.37.1790162761202;
        Wed, 23 Sep 2026 04:26:01 -0700 (PDT)
X-Received: by 2002:a05:7022:282:20b0:144:eab0:9cbc with SMTP id a92af1059eb24-144f9170182mr2757074c88.37.1790162760586;
        Wed, 23 Sep 2026 04:26:00 -0700 (PDT)
Received: from [10.218.9.75] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f9877462sm5682402c88.10.2026.09.23.04.25.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:26:00 -0700 (PDT)
Message-ID: <c132d8a6-f845-44bd-b0c9-33b5a99f9759@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:55:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v25 04/10] firmware: psci: Add support for PSCI auxiliary
 devices
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti
 <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla
 <sudeep.holla@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
 <20260914-arm-psci-system_reset2-vendor-reboots-v25-4-4aaf5c09b5c2@oss.qualcomm.com>
 <CAPx+jO_tDttD8+XpRjG6E+XyQa=-_v-Gr=2Unc+6OSBJ2P7Oqw@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAPx+jO_tDttD8+XpRjG6E+XyQa=-_v-Gr=2Unc+6OSBJ2P7Oqw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: adE5zeCKEXTvrK96q7mPojSHxE0MRyoO
X-Proofpoint-ORIG-GUID: adE5zeCKEXTvrK96q7mPojSHxE0MRyoO
X-Authority-Analysis: v=2.4 cv=WZuZ+EhX c=1 sm=1 tr=0 ts=6ab3b749 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=2jq_lC5E59YAp211iCsA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NSBTYWx0ZWRfX6TWQhacsGpC2
 bDzgkAX7d9KUoCimr35RoQLGoVgoHR4Jv28lYaV9BozWKHghIbjvViqjxvfx7mA7JDdBluRK9un
 hcK8x4G7ui9kXvhw6GH7/OZQO0w+ihc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NSBTYWx0ZWRfXxwU81Xdg27DL
 gUoCTxPOV4ny9LnJE9EQ7z0JX/gORbA3857loeUE6BkSftfaVj3bGNDoOS690Yr8w/ZA4AIHUPC
 Dxa+d6YHycc7OG8/SgIPAIJQU/1MXglbTb/uTJIL+/2JF6Eme+TNudswBwqXcTHl4ZMeh8ISA4g
 gLMMwvDzLfjkzGLS6Mv+ZMTZeYlY65TN3MdhOTs2o1kCZChFYhEI6zZ2c93f/KThpZmHkG/qCzc
 r/NzTsRiVTXFSsCYdBElyR0KvgBrO4o7U4/tWlvEax9uYe6harWSYlWZLCjNOFyR7/YSE6IwJn8
 JfNXkEVwPEGVIOyAKt9qk2vLKC4m8uOh2X34vgKKVR0lNpC5YkNQuX2LCs3EUY8RAUQhkBbbNmf
 cqvd8fbIj1Dk6Xr3MEv8JXLsOAEyy27PmCvsT5YZfrfxWR3SNcJjtbWf81O6OAbkhcJyibEnA7y
 lH/N+bh4vROh9PCVecQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230045



On 9/21/2026 8:36 PM, Ulf Hansson wrote:
>> +++ b/drivers/firmware/psci/psci-devices.c
>> @@ -0,0 +1,41 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/auxiliary_bus.h>
>> +#include <linux/init.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +
>> +static int arm_psci_probe(struct platform_device *pdev)
>> +{
>> +       struct auxiliary_device *auxdev;
>> +
>> +       auxdev = __devm_auxiliary_device_create(&pdev->dev, "arm-psci",
>> +                                               "psci-cpuidle-domain", NULL, 0);
>> +       if (!auxdev)
>> +               return -ENOMEM;
>> +
>> +       return 0;
>> +}
>> +
>> +static const struct of_device_id arm_psci_of_match[] = {
>> +       { .compatible = "arm,psci-1.0" },
>> +       { }
>> +};
>> +
>> +static struct platform_driver arm_psci_driver = {
>> +       .probe = arm_psci_probe,
>> +       .driver = {
>> +               .name = "arm-psci",
>> +               .of_match_table = arm_psci_of_match,
>> +               .suppress_bind_attrs = true,
>> +       },
>> +};
>> +
>> +static int __init arm_psci_init(void)
>> +{
>> +       return platform_driver_register(&arm_psci_driver);
>> +}
>> +core_initcall(arm_psci_init);
> I think we should move this to arch_initcall().
> 
> To allow the platform driver to probe, the corresponding device node
> in DT needs to get populated, which happens at arch_initcall_sync().
> 
> That said, to be consistent, we should move the cpuidle-psci-domain.c
> from core_initcall to arch_initcall too.

Ack. Will update it to arch_initcall at both, cpuidle-psci-domain.c and 
here.

thanks,
Shivendra
