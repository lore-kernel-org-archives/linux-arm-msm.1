Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C2120125F
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 05:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787031273; cv=none; b=uDjmXa3yq0RjEadCEq7aOKrs/rligX0yvibXxVDg+zGQckWzFpEbGE3qPE3xvhPBj7NoTjHkCuXAu2O3Z4X+8Pjy9T1D/NBQ6xjv4q1XsBskYN1b8RrBYdNS/hZd9+0k0rHDBNWB7Nv/ZlCMk8RtRTBbmz5FsjYnKb4ATx/BBrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787031273; c=relaxed/simple;
	bh=2aRiQrUhFLwyGGgPL8ePcZkMZjfLqqJftplqR6lPah4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JwKFIg4FcpRCW9+7cyRrB1WbCU3Bhx55RqqLdIgon9Sh6wwmUl9ljoCgwXlDzR7Mp0O8Pvp/gDrk/82hBXSPKjRKv5HWa79Hy7wHOsoutgSJkOz0QHE3ihFcu9w1vQZZXesfWVTKh2yKt5nu9P2UOes80kxG9xv2W30tnExms0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bzDrdtrV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ajqmmXRH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bzDrdtrV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ajqmmXRH"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I4tvPg3464546
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 05:34:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xq3KPTH4aqrszL7/3VnZVluAmKnQ+DthM4vSIKWYKmo=; b=bzDrdtrVRNKATaPa
	MkfvgHEnhWkkTFbHRCt2//AcPztM+38fNTgZ0A9SLydoZ+CMesSBds9U6lLeLAKE
	UE+mDDBxtngbExpO3TmmmbzDmkpxbY1p4eHtZfUP8H7cK3xSoAb1L9vxUMR6B1nQ
	DEOoXp/8M8ClKR6LaP6Iwc6PDD3zwFIL7hMfFC4trvaTkN0f0j5MgTPp9euYCFnn
	oD1WX2W8as39J8H0/9OVdlEziNyMJFmeTku5fFUXCNr5aWO8oVxuiAb1bijeRE90
	jauz16Da4VjgZ+2ki8k/xemFWBKZUDvGGWIDbSO2Xsqtt+dNJKJFhtFQLrEU9RH9
	Gz9BXg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4611avgr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 05:34:30 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc12e8e22b7so5162838a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 22:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787031270; x=1787636070; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xq3KPTH4aqrszL7/3VnZVluAmKnQ+DthM4vSIKWYKmo=;
        b=ajqmmXRHMJywIZDkzTZg/2G0lPAK1WQ7rkE+XCcGzSpuc6Cz5pV2aoy+BTjrw/xQHf
         HhSK40qjm0mgQ0Btml5gXvOnEtf6cYVRQL9bkFQ95bG3qc5LWJGD6VN4LTOEvbA4USEP
         naM45Bqc26ZEkKS8GFZjB7svDFYAFhc37hPWG6L6EP++/Hmc9p7tjqc+jhjJNvgIBsVy
         gblm2ULIdqWqnUR5menc3KR+gfVxV+DkC9ImEyBSvHMTHrrZauRk3N1Q/CABXiv8wd2c
         I5m078l5VWjB69FOnyQBiHOMy9AZlk4QN+f3qdKh7qcLIZqwTtyaFsQFIw3IEP//lyUk
         fQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787031270; x=1787636070;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xq3KPTH4aqrszL7/3VnZVluAmKnQ+DthM4vSIKWYKmo=;
        b=URjOoLLmBub+VyKSszyAV8NseNrgkesNC3qW/6eo5kj6BJrX8VbD0sMelN1aKeO9W3
         DBWqhwUHERjc6h9ucRvvx3s25sctNiXNk7aQhzhuMTUwzH66B/jw/KrGRirE9GB+h2VM
         FsqQSMripVhbAaTdL9kXY7ORAHNESHZLY8qK7kesWTtPM8bO3L1d2MmERvnTuWwX67Tn
         YL8aDlhM4iUemVh+y3+PSPp7NyRnm8VUZott7tySlWNpc87Ljif11d7JUm5323Q5SLn4
         uZbn+AEzujjF0coupdpylcHy5QHQI7l+LsMlEdsJTcq5PYRcVn7pPLwpiYwwiB+Yskn1
         FPeg==
X-Forwarded-Encrypted: i=1; AHgh+RomHtDHDQnse1pxAttllMkG6iu6fIJ8lYcW+/gzfIsYG/qCE7tzJCZ2H44wykFS53JwCv8GeuG0Q3UKf8u6@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe9Uf2VHgAJfW+xjqw4yUllDz502qk3p8eK2xcCxqRKbpzuvnf
	WLeG7CwsXfy7y1/vnv/16fBiyGGTRZdVzh+V3y0RqbhfWvwrbLPNzVB5949EW42HU2s4zvjcVkI
	ni9tzuPBQr8aXivCZPPrsf7cZDQV3RyVgmVizU2L0XjKyh8TaIJ50ynWjlXBazNQLJbZM
X-Gm-Gg: AR+sD10EWhhT485j5n9x6Vf8EnfAHEUoR8NzYTNdM9TUdu9R1LAK4/U5c3eVuYF3NSw
	7OTCYE1rRrnPbh+s2/YSlERXWcUu7XwC+EyV+vNamd+fNxduhuZhz+JnbtWf6h63ClK0UV+rJs6
	VOivgHXIt5is16vGwvEkv/mh5ofLnA4qZiJ7kK7N83KhX+FHs0sRqbIjpVUnkPpzYltEDyavWJi
	IfaUU6GQFmxCPmvDCqLQ9dwsshMG0lAMNTYcET1kzMFzoZzwDVtLQAgwXAyVerqaQiTbBFvzXx7
	M4u4QGJbXw65KSRqu5yaanwiwgykNI8hAi72ou0ZFPGsB2eFlQB/2vHcY8arFG9yS9OzxQu03as
	SJHlyBIcAvxjSHigv1eWzm0HvfwyNeLUtzL4=
X-Received: by 2002:a05:6a21:3511:b0:3c3:b57b:6285 with SMTP id adf61e73a8af0-3cc71a2c74emr41459635637.13.1787031269837;
        Mon, 17 Aug 2026 22:34:29 -0700 (PDT)
X-Received: by 2002:a05:6a21:3511:b0:3c3:b57b:6285 with SMTP id adf61e73a8af0-3cc71a2c74emr41459562637.13.1787031269417;
        Mon, 17 Aug 2026 22:34:29 -0700 (PDT)
Received: from [192.168.29.31] ([49.36.209.30])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc149f235f0sm106692a12.27.2026.08.17.22.34.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 22:34:28 -0700 (PDT)
Message-ID: <476d36d9-68b5-4dc6-9bdb-102808c52f18@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:04:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 04/12] mfd: psci-mfd: Add PSCI MFD driver for
 cpuidle-psci-domain cell
To: Lee Jones <lee@kernel.org>
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
        Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
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
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-4-889281373870@oss.qualcomm.com>
 <20260813123841.GC1820248@google.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260813123841.GC1820248@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: x8o5D0-fR2-61x3CnSBCI701R_u3fKO2
X-Proofpoint-ORIG-GUID: x8o5D0-fR2-61x3CnSBCI701R_u3fKO2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAzOSBTYWx0ZWRfXz31u3rWqP/M3
 lXvKGxYWe+ie9py/1zVE7zx+wvW4TAj182aQITnwuo0VhRPaP85RO2hTRHPXczgQvOZr8YROBsj
 VugC5wvyD/AVPev7IRpJ0aboTMwb/ng=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAzOSBTYWx0ZWRfXwYPf08zkCZrY
 IWnONpGLQsPiT/HcGF8GHbuNZTXGi7D04/JirDaOIUPq3qo+kl2aQcZWAGEC3gO+YPm5jIfWdaA
 wBLovec9m8+UH3ZRsb3Bl4m8sbrVkNkqTAumvmSaTJn3iHMNpke7StcH6/SGS+FZnraF68gpIX6
 DEOGxfvatmGKfjlb6A5rrS1kyRDjHtDwCCYumI6+//VMjk8Kk7CfiaRw2vjNFDuZNBcD5uzPKCq
 aAyHsHgHpmcQ46+iIcRndojmVOmVuPHltunkkit9E2mf9f7yBknnBgpBjYP56nJPfE+RGkEGeJ+
 /paRLI1bLIqBLIgcaa8UvG2/IWMYkdph08SObG9IdQtWoZYvbC+Q9KYbxTqzZCtrANKZ8oVnIaq
 7jL5yB4h49lnxPoleUx09PX+d7fTDrjwsVPHDk5YOaLCKIA6GhKjEESqbbamyhlJi3OYUQtRc9W
 HzjFUWlRXSj1WzyKN1g==
X-Authority-Analysis: v=2.4 cv=UslT8ewB c=1 sm=1 tr=0 ts=6a83eee6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=LF1w/1kWa9VLj9Mif7fHrg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=JfrnYn6hAAAA:8 a=E1NoYtCZTwQndFzJm3AA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180039



On 8/13/2026 6:08 PM, Lee Jones wrote:
> On Mon, 03 Aug 2026, Shivendra Pratap wrote:
> 
>> PSCI has multiple kernel consumers, such as cpuidle-psci-domain.
>> Currently, both the PSCI core driver and cpuidle-psci-domain bind
>> directly to the same PSCI node "arm,psci-1.0". Additional consumers, if
>> introduced, would also need to bind in the same way, leading to several
>> drivers attached to a single device node.
>>
>> Introduce a PSCI MFD driver that binds to "arm,psci-1.0" and registers
>> PSCI child cells. As the first user, register cpuidle-psci-domain as a
>> child cell.
>>
>> Update cpuidle-psci-domain to probe as an MFD child and use the parent
>> PSCI node for power-domain traversal.
>>
>> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   MAINTAINERS                           |  1 +
>>   drivers/cpuidle/Kconfig.arm           |  1 +
>>   drivers/cpuidle/cpuidle-psci-domain.c |  9 +-------
>>   drivers/mfd/Kconfig                   | 12 ++++++++++
>>   drivers/mfd/Makefile                  |  2 ++
>>   drivers/mfd/psci-mfd.c                | 43 +++++++++++++++++++++++++++++++++++
> 
> We don't usually allow the use of the term MFD in devices.
> 
> What does this do?  Is it a mux?  psci-mux?
> 
> If not, think about what it is and call it that instead.

will rename it.

> 
>>   6 files changed, 60 insertions(+), 8 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index fe67f7bfa44c..0b6e4f89f319 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -21671,6 +21671,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>>   S:	Maintained
>>   F:	Documentation/devicetree/bindings/arm/psci.yaml
>>   F:	drivers/firmware/psci/
>> +F:	drivers/mfd/psci-mfd.c
>>   F:	include/linux/psci.h
>>   F:	include/uapi/linux/psci.h
>>   
>> diff --git a/drivers/cpuidle/Kconfig.arm b/drivers/cpuidle/Kconfig.arm
>> index b88b01aa5829..c5ecca0d7397 100644
>> --- a/drivers/cpuidle/Kconfig.arm
>> +++ b/drivers/cpuidle/Kconfig.arm
>> @@ -36,6 +36,7 @@ config ARM_PSCI_CPUIDLE_DOMAIN
>>   	bool "PSCI CPU idle Domain"
>>   	depends on ARM_PSCI_CPUIDLE
>>   	depends on PM_GENERIC_DOMAINS_OF
>> +	depends on MFD_PSCI
>>   	select DT_IDLE_GENPD
>>   	default y
>>   	help
>> diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
>> index b9e4ad7d43a3..a2d01810f295 100644
>> --- a/drivers/cpuidle/cpuidle-psci-domain.c
>> +++ b/drivers/cpuidle/cpuidle-psci-domain.c
>> @@ -17,7 +17,6 @@
>>   #include <linux/pm_runtime.h>
>>   #include <linux/psci.h>
>>   #include <linux/slab.h>
>> -#include <linux/string.h>
>>   
>>   #include "cpuidle-psci.h"
>>   #include "dt_idle_genpd.h"
>> @@ -122,14 +121,9 @@ static void psci_pd_remove(void)
>>   	}
>>   }
>>   
>> -static const struct of_device_id psci_of_match[] = {
>> -	{ .compatible = "arm,psci-1.0" },
>> -	{}
>> -};
>> -
>>   static int psci_cpuidle_domain_probe(struct platform_device *pdev)
>>   {
>> -	struct device_node *np = pdev->dev.of_node;
>> +	struct device_node *np = pdev->dev.parent->of_node;
> 
> dev_of_node(pdev->dev.parent);

Ack.

> 
>>   	bool use_osi = psci_has_osi_support();
>>   	int ret = 0, pd_count = 0;
>>   
>> @@ -181,7 +175,6 @@ static struct platform_driver psci_cpuidle_domain_driver = {
>>   	.probe  = psci_cpuidle_domain_probe,
>>   	.driver = {
>>   		.name = "psci-cpuidle-domain",
>> -		.of_match_table = psci_of_match,
>>   	},
>>   };
>>   
>> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
>> index e4fd4572472f..d18655d76172 100644
>> --- a/drivers/mfd/Kconfig
>> +++ b/drivers/mfd/Kconfig
>> @@ -2374,6 +2374,18 @@ config MFD_KHADAS_MCU
>>   	  additional drivers must be enabled in order to use the functionality
>>   	  of the device.
>>   
>> +config MFD_PSCI
>> +	bool "PSCI MFD for psci child cells"
> 
> "PSCI mux for registering PSCI component devices" ?
> 
>> +	depends on ARM_PSCI_FW
>> +	depends on OF
>> +	select MFD_CORE
>> +	default y
>> +	help
>> +	  PSCI MFD registers PSCI child cells and exposes them as
>> +	  platform devices.
> 
> This is what all DT related MFD devices do.
> 
>> +       Child drivers are probed only if enabled in the
>> +	  kernel configuration.
> 
> Nothing new here either.  This is the norm.
> 
> "PSCI Mux is a Linux specific device splitter designed to register
>   multiple PSCI related components via a single Device Tree compatible.
>   Without it, devices would each bind to a single node ... <which causes
>   problems with x, y and z>"

Ack. Will make it more relevant.

> 
>> +       Select this option whenever a supported PSCI
>> +	  child driver is selected.
>> +
>>   config MFD_ACER_A500_EC
>>   	tristate "Support for Acer Iconia Tab A500 Embedded Controller"
>>   	depends on I2C
>> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
>> index 72d3944b0ad8..f3edfad702ff 100644
>> --- a/drivers/mfd/Makefile
>> +++ b/drivers/mfd/Makefile
>> @@ -24,6 +24,8 @@ obj-$(CONFIG_MFD_EXYNOS_LPASS)	+= exynos-lpass.o
>>   obj-$(CONFIG_MFD_GATEWORKS_GSC)	+= gateworks-gsc.o
>>   obj-$(CONFIG_MFD_MACSMC)	+= macsmc.o
>>   
>> +obj-$(CONFIG_MFD_PSCI)		+= psci-mfd.o
>> +
>>   obj-$(CONFIG_MFD_TI_LP873X)	+= lp873x.o
>>   obj-$(CONFIG_MFD_TI_LP87565)	+= lp87565.o
>>   obj-$(CONFIG_MFD_TI_AM335X_TSCADC)	+= ti_am335x_tscadc.o
>> diff --git a/drivers/mfd/psci-mfd.c b/drivers/mfd/psci-mfd.c
>> new file mode 100644
>> index 000000000000..7affd6bb09dd
>> --- /dev/null
>> +++ b/drivers/mfd/psci-mfd.c
>> @@ -0,0 +1,43 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/mfd/core.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +
>> +static const struct mfd_cell psci_cells[] = {
>> +	{
>> +		.name = "psci-cpuidle-domain",
>> +	},
>> +};
> 
> MFD_CELL_NAME() ?
> 
> MFD drivers have to support more than one device from the get-go.
> Please add your other device here in this patch.

Ack.

> 
>> +static int psci_mfd_probe(struct platform_device *pdev)
> 
> No to _mfd_.

Ack.


>> +{
>> +	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
>> +				   ARRAY_SIZE(psci_cells), NULL, 0, NULL);
>> +}
>> +
>> +static const struct of_device_id psci_mfd_of_match[] = {
>> +	{ .compatible = "arm,psci-1.0" },
>> +	{ }
>> +};
>> +
>> +static struct platform_driver psci_mfd_driver = {
>> +	.probe = psci_mfd_probe,
>> +	.driver = {
>> +		.name = "psci-mfd",
>> +		.of_match_table = psci_mfd_of_match,
>> +	},
>> +};
>> +
>> +static int __init psci_mfd_init(void)
>> +{
>> +	return platform_driver_register(&psci_mfd_driver);
>> +}
>> +
> 
> Remove this line.

Ack.

> 
>> +core_initcall(psci_mfd_init);
> 
> This is usually a hack.  Why can't you use -EPROBE_DEFER?

Ack.

thanks,
Shivendra
