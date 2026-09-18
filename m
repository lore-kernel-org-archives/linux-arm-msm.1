Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E1A463B77
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789725731; cv=none; b=hsN/ZS8Cox4N/YTTraNJ13p8i6wk3ZgxVHuFJTqpP9z+4wcc3DjbCZTPmKHnR05aZ2vgS8v1u2UEn4+yQbbyfEgabkh6S7LTgn+1lN4+63II1kRrkcHaj9ZO0IfT6XuYUQbtHNkYNlL3jMxd7ZCqvsI/4gFczPdjQDis/J5Cybg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789725731; c=relaxed/simple;
	bh=aWdUbLPfvC6wNjFP+17bs1Vn8BgG4/eM1GE3CrUak1Y=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ah6piBNfh74Os3FzCXs73NC0AHt3vN16gYtrQN0jfGZ9/0RvBAOztT5Ljh7fJj6NOCdUGYsuRbeDb/OyHyETMxXVOMNL7AKk8UuIfZhpYQXnh/as6HonZ4A+yZLBbpg5FxfkeeZEu8Y6+gYLHBn0r1E4FvGUrczPaK7ookPynj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AqKkK2Z+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KEjbBX9g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AqKkK2Z+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KEjbBX9g"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9ddg63801892
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qYA58SCxkPQpuxebyIQOtCSJePOccGQb1BNaM1QCZVY=; b=AqKkK2Z+nF+Z/dGt
	FWBPIBa9LfPCRuhIMDS79rzdtAonoYumPp1/erhcFZxnlhFx2qXcCfasS6QCaRzq
	PhJXaQ75jatiT5KGqZlOElNbKQgH7nwxVEuyHjgrEdJAwC8oJ9fGmXSwkOUx95Mv
	wL3HE7/XAeLp33/7aUlJ3RPC/daRq2zVZrKDWfeJvzou1Cun6Gsimf6vDEQxTfRv
	g62tVzKbpRzjhexa76EFC0MrEzbjEwUKX3WhiKKFSt87TGbCmTnqAMqa/o7sLVqA
	KK55FrH3OweXu3HkaexGQ6aJ9mMoYwLaVNuxbgDAhx3nwHn+sLQzHPBmcxsuL0YO
	CiAppw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grq2ku06v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:02:06 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78580a6b2fbso136681137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 03:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789725726; x=1790330526; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qYA58SCxkPQpuxebyIQOtCSJePOccGQb1BNaM1QCZVY=;
        b=KEjbBX9gok5cMjbvWJFQMcG6vdEH2CvB9VTgvhDaNPHsnmMK0SfUvVmXfZ4bOilNhU
         7shADD/BrKJk67nm/mJPWZlNLbneodCLvF+9sfDma9Urn/oJWZ2UJUjB4q4U/DqIWvRK
         Cx2+9tVPTaRp8z9apg5jJGOYDXpHFE2nFQJfia56NjDiBZAD+vzF8rLIaARA5iWCUenh
         1s6yyGPfRRNaDiNnq59tXcNoYEHIBjHFjdWTOMiecDf3fhTxrv/VVSAC+GqB3mI6Ido+
         RSWidYGA9kk3e6cmGQPpBeiYUBTbRY8Fi2wQ92bCALhxTd3xxSpYwRnELB3yMPU2nLoR
         Jp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725726; x=1790330526;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qYA58SCxkPQpuxebyIQOtCSJePOccGQb1BNaM1QCZVY=;
        b=WsNuIYLqT1InlRFq0eVH0KAVd6aXhDYwHwIghBi+R3ub4S8YGFBsIOCJyBylWN1L46
         ucNBbTku2h0JbObVydsGbqyDUsI8+6TNiXRh8VVINFklXMsNJOhJJAVW94/6Eqa+PQe8
         Nh3CvyKFjhB7A7Hc/wzqkKwIdm466RYk7bg1J+Tl2JXVCIvortxDRjr91GPiknz6Vswr
         oLHnGu7zCbohysLHmFUVMlshvBhcTcAmu7MtDvJ2rhSw2VvLOTsymt3czsm5Amt/aSIW
         D4dqXLQkhTMhapsN2vyQe2o9WHorZsCbq01ZvHn1XCxnBGx91GydKaJQDFlemnDugFrC
         gu3w==
X-Forwarded-Encrypted: i=1; AKwUvByQUF+o8euKBX8C3ErhsmVOZehfemjYMXF53r/AA7Ja/A3zkYsq90U6KS9PMD5ZpCSGqxDycvWcL73UvOfS@vger.kernel.org
X-Gm-Message-State: AFuF++kR2zeFoATfNa+wiztnOsOFO1ZUp7EnkuIfFtTKwxpw2/Tl2gxr
	k6FJ8zRPtS1n26pIQ4QWGTaOVURL5VYzZuP4PhcGoRNMWixakEfOsgCF0X+2hWQDIkiBXBaHAaV
	Iy7BqGVx1KJ6V1+VXAHEv3AQWLmBKkpwBAenMSgiAt1b3OQbxc2tcQGkB79HTuw0SJ7U6
X-Gm-Gg: AYBFou1kNN7vsN6loHo/vgvHVGPH0qyhBZqtJu5gFqfpzOz9VKGtyt+13lH2RGXLpyG
	UB8TIWrjxqVHoqwunen82QwvPnRImTEb0HVmUEALE9xrT5wWmmA/mrH9LA1mVD56Yf2vxOt1hVd
	yR4Sl4h9ZOxuYHDWMTTb2GxKmA6G2+WjcuL4KaHD4AYgibCS8oI6Hkqi/GXxy9ePuHwofxazAtM
	aoxNais6UZ0AmL3jFgRkKDSrHBANNeCTeURGy9pisdQowm1EXvbV+WgCgNVKyFmWdhvb7vCL7TP
	EFa3CVNcyQTbyS5vRFEZatvykwZN3ehgK/YzXtQKodqW2hmVcgspwoGJVOJ+3ItdyukShLrx+w4
	Zbl/5zifJAz26gR0Nk6+qEt65+6AZgaXgS8CGEPi3HsGczC+z6TvG2p8pIkuStJDtZOPZqQ3gsE
	2ZZLggTesiVaRc2/w5VW4d4BeeHBdBAL5kbX/yRcOVxZu+P2x/aJWHQoRwM4QMoa7KTw==
X-Received: by 2002:a05:6102:358d:b0:79f:e8ce:27f2 with SMTP id ada2fe7eead31-7a55af2df71mr615834137.4.1789725725472;
        Fri, 18 Sep 2026 03:02:05 -0700 (PDT)
X-Received: by 2002:a05:6102:358d:b0:79f:e8ce:27f2 with SMTP id ada2fe7eead31-7a55af2df71mr615773137.4.1789725724990;
        Fri, 18 Sep 2026 03:02:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bbc6a88sm37992566b.54.2026.09.18.03.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:02:04 -0700 (PDT)
Message-ID: <82a72918-7bc7-4e2c-892c-0dcdd6dd5548@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:02:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Frank.Li@kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <2104f437-e960-4e55-b0e1-2b37126e8c2f@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <2104f437-e960-4e55-b0e1-2b37126e8c2f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEzOSBTYWx0ZWRfX+pQzdC9j916N
 zWEnkOsZSkgozKog5D2v/PVsv8dGAIhBPs08IPyrw2+1MGR89ZQev5l3OVfCIu4BoBk9XGISmHb
 rg1lPPt5EbuxDaKVAwo2JC6gsA4UaKdi7woO+/lLEArHOEJb/9+LlFIll88AyqXBeH0EYg0NNqI
 eusHjRXo0Oon5AxjGWKar5t4iuAFM230uPzwFTvIBdii+VJqJUORX4r7yEb55LPtiqPwni+dAmu
 1VIyMNge1n4mg7zVUNm1qgJqB22VFgls6SDQpI7+z/kG6mfmVOj+a9jxIot9KTWLcf6Le6rzXOk
 ByKTXHUx+Fs8Wph79WlSsNUDPElfIMYLPuy7hP/AWTZsBB6/IzjXpZ81hSazZvZMOvijtOSk/0O
 5U+ByOVSm+hJ889XtaqLjLMqojbEMELH7fguXpvHXOSrN64a036w1Oh1zH3EipoT9m0Sk9qGdp5
 yaGtqYg0bLXx3u4W9dQ==
X-Proofpoint-GUID: CWQ-TCOcPlsGM1DPVQFdDs7ILC_7ejWn
X-Authority-Analysis: v=2.4 cv=bcD+w+PB c=1 sm=1 tr=0 ts=6aad0c1e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=9vOhfBaG-gSLgbD7qJAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEzOSBTYWx0ZWRfX/dV+SNJqwNb9
 7fmlGQ8Hda30gtuOBCckNeSWDnSK9ENJpAmXYlxo5KZwwKupfPVKmGig8e/y/cQFOHewlWiyIzh
 IyYhAgwatLzu1beVGkwqtL+3z+6WCA4=
X-Proofpoint-ORIG-GUID: CWQ-TCOcPlsGM1DPVQFdDs7ILC_7ejWn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180139

Hi Daniel,

On 18-Sep-26 11:53, Daniel Lezcano wrote:
> 
> Hi Hans,
> 
> thanks for taking care of that
> 
> 
> On 9/18/26 11:29, Hans de Goede wrote:
>> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>
>> SCMI client drivers already describe their bus match data with
>> MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to consume
>> SCMI device tables. As a result, SCMI modules do not get generated module
>> aliases from their id tables.
>>
>> Move struct scmi_device_id to mod_devicetable.h so it has a fixed layout
>> visible to modpost, add the corresponding generated offsets and teach
>> file2alias to emit scmi:<protocol>:<name> aliases.
>>
>> Use the same stable alias format for SCMI device uevents and sysfs
>> modaliases. The previous string included the instance-specific device
>> name, which is not useful for matching modules.
>>
>> Assisted-by: Codex:GPT-5.5
>> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>> Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>> ---
> 
> [ ... ]
> 
>>   -#define SCMI_UEVENT_MODALIAS_FMT    "%s:%02x:%s"
>> +#define SCMI_UEVENT_MODALIAS_FMT    SCMI_MODULE_PREFIX "%02x:%s"
>>     BLOCKING_NOTIFIER_HEAD(scmi_requested_devices_nh);
>>   EXPORT_SYMBOL_GPL(scmi_requested_devices_nh);
>> @@ -185,7 +186,7 @@ static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
>>       const struct scmi_device_id *entry;
>>       int ret;
>>   -    for (entry = id_table; entry->name; entry++) {
>> +    for (entry = id_table; entry->name[0]; entry++) {
> 
> Is it possible to rely on a NULL sentinel?
> 
> Here if the id_table is NULL, entry->name | entry->name[0] dereference the NULL pointer

The NULL deref on id_table is NULL already happened with
the old code, which would deref entry to check the name pointer,

This just adjusts the check to check for name being an empty
string since it now is a fixed-size string / char array.

>     for (entry = id_table; entry != NULL; entry++)
> 
>>           ret = scmi_protocol_device_request(entry);
> 
> [ ... ]
> 
>>   #include <linux/bitfield.h>
>> +#include <linux/device-id/scmi.h>
>>   #include <linux/device.h>
>>   #include <linux/notifier.h>
>>   #include <linux/types.h>
>> @@ -951,11 +952,6 @@ struct scmi_device {
>>     #define to_scmi_dev(d) container_of_const(d, struct scmi_device, dev)
>>   -struct scmi_device_id {
>> -    u8 protocol_id;
>> -    const char *name;
>> -};
>> -
> 
> What is the reason of converting the char * to a fixed array? That limits the name and may result in truncation and potentially name collision, no ?

Because of how modpost works to generate modaliases inside the .ko
any string buffers in device_id structs need to have a fixed length.

So the truncation / name collision issue pretty much applies to all
foo_device_id structs in the kernel. People should now to make sure
that any strings used will fit inside the fixed string. And I would
expect the compiler to warn for overly long strings.

Regards,

Hans


