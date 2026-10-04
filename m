Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0983F0A92
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 Oct 2026 07:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791098983; cv=none; b=WNcvBMhVN1gbS/9Sb2zcTxClf4LwXKgHsTqnpAxOHpw64S34Pn8pjkKdb/ldzZiR/OoOEA8jte2cOt+qxGu3yOPOR2hCN6vBqVaOlMDUz6a9V4Stpt9JZqytEcxR616dYF3e3BgaWMhnJ0AwS7EmSMAO7i8lQsCcMWmLRCTI5YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791098983; c=relaxed/simple;
	bh=GDgnDBYuex57tNwK2PhV2zkX2AgKHFJq+4zTbUnDvD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=luPoB8Oyq86rdbjitFTkHk7F8uqgjoXOI/kAn6GA73JM6VYR7mkzbMs0xrshYLBBK47P9+M4OUisoA8puE6CndDYDWsOaUjeSZtUlHRt6ZiLMEc3jWVr4aMxkTjlvXbH15a9E2HbWqf+r8z+l+giAXK904EWIGDgy0sbXyt4IsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DiJxafqy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z2CY93DF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DiJxafqy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z2CY93DF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6944KBSv3157439
	for <linux-arm-msm@vger.kernel.org>; Sun, 4 Oct 2026 07:29:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+KFQGxLew24idt7h92w6GenazteN4CrjyYIuOgBPUYM=; b=DiJxafqy06xLrXDX
	A/GX9W/HMYUXIeq0IeqQZhIg20gDXKf8F6v+srhIOmT7z3ND8sAw/fnNtn7U8n/F
	ZzhRkeAjSCcSAm/RxqeD7zXRDjWzpohQDH7qSojyzyybdr3XjGn5qJEGXt/kSnw8
	UnH2e/Cg0fO6vYy7mXcCx0lIGJDRrpvX2wPIoIJj78LnC6rzigPyyAUHNmQNnNxc
	WNHxfGW4DxlxTOXKBfdTDkMOqSZVjKnAX1EHl6zqd5RYRzK6Nv1SLUNhtKSe4OIU
	IWKsEQarDvQ9C+K1K1F0duqeP7lFJ65qlr3i/ed6kkMdBHABm8Qe39OHHw8V0BkC
	UKeyrw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sssjjv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 04 Oct 2026 07:29:39 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso993365eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Oct 2026 00:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791098979; x=1791703779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+KFQGxLew24idt7h92w6GenazteN4CrjyYIuOgBPUYM=;
        b=Z2CY93DFX/yaVrITF2KSTqTQLfEyIyKrXJNAs/p6N2OHhLvS494tjlKbaBWVEu6d5H
         L1DEOQ8emuk1a8nuNWxgs4ihtfGrzfxEhLD3Q+eaaDNKRQAHvIDkxDpoNRKOWyBhN+oR
         omxVjWyVCc+m0TtpQkqqaoe4jKxtQdMyBSvHSl5xQh4v6LuS1hi+wf4ZZkeCmmPLJdXt
         haB2op7VVkXkOpU5XVGqoLmjvv33yxOVHjN6C2gDE1lCG/qSy+Kq6K0owbj6/7SLJ+xb
         4DaahZSkk+fXSipuwCH7dIiEXP4TLoWalWwhAZ5kSiQWG7ljA1vgCrkcVHEyaLmNdiDS
         3xdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791098979; x=1791703779;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+KFQGxLew24idt7h92w6GenazteN4CrjyYIuOgBPUYM=;
        b=EpSNm/MKiL236qJNGR3eSsBOsKZZlzyj1wIZ0vqYkwXWipyERz7YA6WOHQuAeNLmkR
         WP/bqiZyc86UheFl3o2wjCP7WTYDGyx6KdW/CpcF0oVu0fCz/wbHy3RtPTpUKkn1wv4e
         /DPHNi3rXcEsPlJXzwkHjqiy/T1ZXpOi8Q5tkodRS1UsLZlpoTnyWPQhIeds/yzpi3oG
         SeS6f+3m3xOMpl0pF4iS7IQl4Gl6YC6fiMVd5BlwRVq3cIoc8KMf69P0Ves6oCJfQCqc
         up/x/PC+BH3V1vqJIa9GXHItl3jkGTsJowQGzVFLB8Q9CyNMFJ5MPMZj/9TC9kjrr3bE
         6hfA==
X-Forwarded-Encrypted: i=1; AKwUvBwY78C8nqPQDuSuycLm9fv28zwStScZCpS6f8lFbJPLNMdgmpl9QGpG2rAybvvpEmxtep8omvzKR3tv9c28@vger.kernel.org
X-Gm-Message-State: AFuF++lKEN9fEgyEa87tIBc9YM6eIzXTmRYgoWVg7kYhwVTqGeLp3/L1
	Cowj6jgropC/9fuc217EbyC1OeJiD+fNFWMe41fJqdI7SlqTpIR9EsJgi3RGfI4GY7PBebRZ/l0
	KPW8P+vwYXi+nIJ/aVMK5uKCrVN563JMKsfTqvid6dIueNRt6NOzkwI8jYa9SoislehlR
X-Gm-Gg: AYBFou3+HfwakgPZCrwvjK3+RNPNVTUAO1yxH1i5B9UJnFDZNZ5KTCR6EYy0I4s4S5Q
	wmeC+mOeHjejxZzS1HaNH7KLxcA26TMwAY6plI647LXj7SBJPJR0/MCIzo0PpR1T4mpji7Qhi3e
	EPrHM/S5l4XUjDr5QbzgIXq+B1igJ3VV+9VrV2CFZTI90phDMlGXYEYlgFz3W3HlPb37hBUsaVT
	e1Bht02F2XIYEyr/h/AzGeugAV4r49Z9cun1Z0MiaeEj/SnIBW4J44KE+UWNqM6lMVbzHZfFjpB
	TXanY88GGgq+/fB6V6X+z1k0qHFKJ1NObPc0TA+IlvGndGtD53tGPuV6wxTSfjv+a6AH+PKBmAG
	qYp4ACFujToIZEGkrib0vVrl8ouzjI6Eczg==
X-Received: by 2002:a05:701b:21c3:b0:14b:cf58:ce5e with SMTP id a92af1059eb24-14f5615f9d8mr10621688c88.0.1791098978754;
        Sun, 04 Oct 2026 00:29:38 -0700 (PDT)
X-Received: by 2002:a05:701b:21c3:b0:14b:cf58:ce5e with SMTP id a92af1059eb24-14f5615f9d8mr10621645c88.0.1791098978114;
        Sun, 04 Oct 2026 00:29:38 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.234.47])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fc39a6cbsm11463837c88.5.2026.10.04.00.29.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 00:29:37 -0700 (PDT)
Message-ID: <04f1dcf3-cbf3-476f-bf94-ade87ce267ca@oss.qualcomm.com>
Date: Sun, 4 Oct 2026 12:59:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 06/10] power: reset: Add psci-reboot-mode driver
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
        Abel Vesa <abelvesa@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>
References: <20260928-arm-psci-system_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com>
 <20260928-arm-psci-system_reset2-vendor-reboots-v26-6-b24e2348e8e1@oss.qualcomm.com>
 <CAMRc=MdSfBvZF4UJm=eBBD-GAJD7oFw3e+6UJeoXgidoPGzm-w@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=MdSfBvZF4UJm=eBBD-GAJD7oFw3e+6UJeoXgidoPGzm-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA0MDAyOSBTYWx0ZWRfXzqNCAn+FwaCT
 S12uvFcEBYVMTbrLBaiWYAMO7Lt3tQLDuC/RdSkafu4ZO6hm5eR9GuwUT3aVd3dK0dAuyJrZWia
 qPErwf1nauTAzN0AMBJNkGVyI9atIHw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA0MDAyOSBTYWx0ZWRfX8N3Xmo6AGMhy
 bfuytzycVFPk0CoKMu98DpNDlrNWNSLZiie5hUvtWesQ5ftfTukEV/3ZtEayYHnVD8fnwauCp1b
 UURkFYpGR3diK2NkKQKQuqdFDe8/2fhTGbgyD6Ka1EFRkYXHmdx7WlHKWSv1saeNWrCCFjHTuhr
 tNRhXLlv8jNT3HBF/Cv3sf+BhHpI7DgsWlcwk4cAXFIjWu1+pynBjdcw7km5ZAm1kygcyIYXU4Q
 d7q+OogTwP5w3shAzbcVvvY0wmshQZURLUen0KSbWj3AuEeZzQ4XUXQJX4sJLL/cVO6aauDzexM
 ouFkrcMJco/xYrS0c9ANXLsgHsgLzcdEwAbSPKjMSleSskQY9rv+P1MQMKbWaOyGICbc0+UIUHe
 LsIeVgN6OO+XL5Ayw9TXs+yVRZZUVtGlWfLoWwdkuS37ri4pJCTYm8uPMzFy4J5jhPZ8Q/ryw45
 nR1TRFg0za/T1q/8nIw==
X-Proofpoint-GUID: tD1QtYrOuN5jH8AhsF3-ErLmnMpz27Oe
X-Authority-Analysis: v=2.4 cv=HqjjiETS c=1 sm=1 tr=0 ts=6ac20063 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Q9iloZ37mN+2Fnqau1qSyQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=3VLVDtZA9RXrKpJcTyoA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: tD1QtYrOuN5jH8AhsF3-ErLmnMpz27Oe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-04_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610040029



On 10/2/2026 7:00 PM, Bartosz Golaszewski wrote:
> On Mon, 28 Sep 2026 08:09:18 +0200, Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> said:
>> PSCI supports different types of resets like SYSTEM_RESET, SYSTEM_RESET2
>> ARCH WARM reset and SYSTEM_RESET2 vendor-specific resets. Currently
>> there is no common driver that handles all supported psci resets at one
>> place. Additionally, there is no common mechanism to issue the supported
>> psci resets from userspace.
>>
>> Add psci-reboot-mode as an auxiliary device created by the psci-devices
>> driver. Define two types of PSCI resets, predefined-resets and
>> vendor-specific resets. Predefined-resets are defined by psci driver
>> and vendor-specific resets are defined by SoC vendors, under the
>> psci:reboot-mode node of SoC device tree.
>>
>> Register the driver with the reboot-mode framework to interface these
>> resets to userspace. When userspace initiates a supported command, pass
>> the reset arguments to the PSCI driver to enable command-based reset.
>>
>> This change allows userspace to issue supported PSCI reset commands
>> using the standard reboot system calls while enabling SoC vendors to
>> define their specific resets for PSCI.
>>
>> Suggested-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
>> Suggested-by: Lee Jones <lee@kernel.org>
>> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   MAINTAINERS                            |   1 +
>>   drivers/firmware/psci/psci-devices.c   |   4 ++
>>   drivers/power/reset/Kconfig            |  11 ++++
>>   drivers/power/reset/Makefile           |   1 +
>>   drivers/power/reset/psci-reboot-mode.c | 104 +++++++++++++++++++++++++++++++++
>>   5 files changed, 121 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 70a11f2ff61d..1007d5cd2e13 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -22058,6 +22058,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>>   S:	Maintained
>>   F:	Documentation/devicetree/bindings/arm/psci.yaml
>>   F:	drivers/firmware/psci/
>> +F:	drivers/power/reset/psci-reboot-mode.c
>>   F:	include/linux/psci.h
>>   F:	include/uapi/linux/psci.h
>>
>> diff --git a/drivers/firmware/psci/psci-devices.c b/drivers/firmware/psci/psci-devices.c
>> index d23befc490ed..04f24b8d9943 100644
>> --- a/drivers/firmware/psci/psci-devices.c
>> +++ b/drivers/firmware/psci/psci-devices.c
>> @@ -20,6 +20,10 @@ static const struct arm_psci_device_info arm_psci_devices[] = {
>>   	{
>>   		.name = "psci-cpuidle-domain",
>>   	},
>> +	{
>> +		.name = "psci-reboot-mode",
>> +		.of_node_name = "reboot-mode",
>> +	},
>>   };
>>
>>   static void arm_psci_auxiliary_device_release(struct device *dev)
>> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
>> index bce996bbef28..f165a41d40ed 100644
>> --- a/drivers/power/reset/Kconfig
>> +++ b/drivers/power/reset/Kconfig
>> @@ -360,6 +360,17 @@ config NVMEM_REBOOT_MODE
>>   	  then the bootloader can read it and take different
>>   	  action according to the mode.
>>
>> +config PSCI_REBOOT_MODE
>> +	bool "PSCI reboot mode driver"
>> +	depends on ARM_PSCI_DEVICES
>> +	select AUXILIARY_BUS
>> +	select REBOOT_MODE
>> +	help
>> +	  Say y here to enable the PSCI reboot mode driver. The driver
>> +	  registers with the reboot-mode framework to configure PSCI
>> +	  reset commands, which are executed by the PSCI driver during
>> +	  psci_sys_reset().
>> +
>>   config POWER_MLXBF
>>   	tristate "Mellanox BlueField power handling driver"
>>   	depends on (GPIO_MLXBF2 || GPIO_MLXBF3) && ACPI
>> diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
>> index e31cab4ba78e..45d8aaaffaa1 100644
>> --- a/drivers/power/reset/Makefile
>> +++ b/drivers/power/reset/Makefile
>> @@ -41,5 +41,6 @@ obj-$(CONFIG_REBOOT_MODE) += reboot-mode.o
>>   obj-$(CONFIG_SYSCON_REBOOT_MODE) += syscon-reboot-mode.o
>>   obj-$(CONFIG_POWER_RESET_SC27XX) += sc27xx-poweroff.o
>>   obj-$(CONFIG_NVMEM_REBOOT_MODE) += nvmem-reboot-mode.o
>> +obj-$(CONFIG_PSCI_REBOOT_MODE) += psci-reboot-mode.o
>>   obj-$(CONFIG_POWER_MLXBF) += pwr-mlxbf.o
>>   obj-$(CONFIG_POWER_RESET_QEMU_VIRT_CTRL) += qemu-virt-ctrl.o
>> diff --git a/drivers/power/reset/psci-reboot-mode.c b/drivers/power/reset/psci-reboot-mode.c
>> new file mode 100644
>> index 000000000000..bf2dd6626feb
>> --- /dev/null
>> +++ b/drivers/power/reset/psci-reboot-mode.c
>> @@ -0,0 +1,104 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/array_size.h>
>> +#include <linux/auxiliary_bus.h>
>> +#include <linux/device.h>
>> +#include <linux/errno.h>
>> +#include <linux/init.h>
>> +#include <linux/kconfig.h>
> 
> Huh?

Thanks for review! Will remove these.

thanks,
Shivendra
