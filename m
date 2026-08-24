Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78686356777
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 14:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787583529; cv=none; b=Qx3pdfrQYX4t2f/ynvD5BI0+aPhkrL6dw+9XiOjzrvMPjXO5pQa6cYn06lTVViT+W3aBIm5T8W0Iu5cF3rhuYWmQj4q8tAiK6P9NWFUeaZQuTv9eEnlkBq6d5DilGYHWSbfOEJyb2qjmWpaRc7E6Z/tBI/tk9hcFv5ytjUVLTbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787583529; c=relaxed/simple;
	bh=NCPpP0PSy+yn7AsopOYr6zL63Fogw6eZBkjtUu0ajkQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Wqd3t6gAFAaRHwmX7IH1QJXERWErJpIjJCXTc08RFjdCtGa6wkzFkwupyb5jj7RdTMa2n4c4WYs7GRHf8iECxi+l7NwaWloCwMYbEJ+FDyvDNwFLx7CEwyWNPoGubon7nT4x5mfVAwVmZYOPmG5fg9gudcvNuuI5p9wPymsdj9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eHIsnj/y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MdFSK9rC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eHIsnj/y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MdFSK9rC"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCv9E72584221
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 14:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JFxHaff8GjmyQ0vJusoYBKz8T8A+c6M4ZjObeJKGagM=; b=eHIsnj/yq5JMQ2R+
	dNhTfIz13oV7n3oaDZKdBTdgJbgt7jSIMcsWGDWO/D2aoncgB6DrtEz43kHfdB8E
	IFL9ar0NnPKdT9aSnhppfTJK+ajptnbjmouPYeDgNbJrysQQISoeM95kkTHZCJZo
	8BNwjOxT3RtaJUbVe74MevZ3LHysqf1H/vnGjVqCMpBOZ74allL+uBGsjFJluz29
	MSm0ps+P9Un3rtN4/BiZiqDg78n/LQS7UbwJWR/RgLYU57lpgJqcOdMzHXeX8U1x
	qKU/Cqo8sux73oofpWTscX8fY6CVv20KyevS7oYmtbZwYUIta853r3iCFVa+eROZ
	jxEt8Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hbtj159-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 14:58:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5283df62d68so47394621cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787583526; x=1788188326; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JFxHaff8GjmyQ0vJusoYBKz8T8A+c6M4ZjObeJKGagM=;
        b=MdFSK9rCDwYFPx+YtGIoYhgmehpv8JItkQ64hecTHY9iIZczI/sTtzshYAceuSWDVS
         vDGAMb5/gDICKpXj6euRuZe4gMK3ueW+5e8Sdk22pwNIZoGCJtBemiipRKYt3KlB6c6l
         KPA6bYnuf4W575YgnZxqcBqYsmCiUXHQPZ1sHLVR7YTKt2qqCR1r5fjwcxMQkRlnOwIe
         Yx6S/wA6SUWDHNb3L2j6eM6CAkCRBW4tum1jH3KpGyoqkwyqokEVD2kl7NKLRZapiD4c
         s2y0Q/cOa8NPaRdYh6vd3llqTct3ywty4DB/uirhi0CjhbXxu9zlaa8k6lytIULmZXlw
         FWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787583526; x=1788188326;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JFxHaff8GjmyQ0vJusoYBKz8T8A+c6M4ZjObeJKGagM=;
        b=W/RQPBP7OZFzq4qC1D+dwfchMf/I1AQHCTlhe2m840KDwcMr4mPJgY8lc0fv95vN7J
         PU5NsOn9PuwUq+7Goiz5gL4Gvgmlkv/EEDlVl67C7W/e69C5WnaekiSkkdqzSAo4ZLnY
         4xbfvyrimpoPIc9o6SkK+HP45wtYSsuQCNC2ewNmZwZeDmjMHWnZqFsv6EPg/8sWkTOY
         ZGjJ3+wlzXToJNwVRv3GiVqX+4y7qQp2jiGn8fEveTUEJCZ5Cgp1wY6pzR3++gBh1IC1
         3twXhDL9U83Yc5d/wwqFcZZ6dGvUA3642yP7R1R23NbBUModpSHhIlfMjilrB9A8rCAP
         p7pw==
X-Forwarded-Encrypted: i=1; AHgh+RqHE7gPs5yEtkbbuS+zPYWKQKpUouE9/aT6BCMyUEO8ViL7j/9XWIotarqlAS82bQQcR5VUS4iRHGWeToEU@vger.kernel.org
X-Gm-Message-State: AFuF++lEuSnlAEYVc0dIbcMP5ygiRmMN940VE6Ap3CCtWfnFxq2yYfa1
	d7O/kCbVUhp8nJbbhD2Ho02BiwU5944CzTVWlsDDdb+OpqebxjRxh9yDhP5fwnzfjI/XajMbnmJ
	Hx0wDFkbJanyoWXpbbo79k/ZjE3XaAcKmy7Lz1WApKpRVzjKHKxl8tqlmJYAZ1iuEpmsm
X-Gm-Gg: AR+sD12QDnMFap4ta/z3enl6jIYKSGbECQLIvDZUcScb9I7tiF4VGyWeiFjn2/HslA2
	GxogAf9XyzC6EpMUx467tUxKwqTODfnd651WT5gj+gHyFd9I4bDSlTQoTxuIaQ67PSM51B2dyZ3
	pNHUt2X78IJNcxWRO54buH+iU0JHfUWhXVCMQURuj/QFGE2ap+4I+ffQzhG/wUJl5Buu4r4NDXa
	V2+Xwg1XPnQJdk1b92kAnuLmnBJckHREM1xSO/VEruC9Cpng41N1aYBsnRZMYhRvEGibcN4A2+R
	J6+hWjw+71t5ghThBchvw8ZmWFDrIAWXvSsTVk3HOfvZByEcD1Mbl9uXOLBqSgtSUVdEcKmZRNw
	S778qB5k+B4myxIoqbhhPfg2dMGl/y4hVo+fUYAxsyIcbjrnas2sGNblfFWIYQF9AmV37Fl1L4s
	Rv2X/UlPqTHpzAmbxtGIBuQyLgN5FxsTSetwEGIiV9Qn3fYlObQoqYmVilaJpC9VJ8A+M=
X-Received: by 2002:a05:622a:c85:b0:527:f4d0:4bb8 with SMTP id d75a77b69052e-52df5a3285cmr289911581cf.22.1787583526043;
        Mon, 24 Aug 2026 07:58:46 -0700 (PDT)
X-Received: by 2002:a05:622a:c85:b0:527:f4d0:4bb8 with SMTP id d75a77b69052e-52df5a3285cmr289910721cf.22.1787583525431;
        Mon, 24 Aug 2026 07:58:45 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496295627sm1253359466b.15.2026.08.24.07.58.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 07:58:44 -0700 (PDT)
Message-ID: <1bf5984a-d1d2-4763-bb4c-b17ae8360192@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 16:58:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/3] module: add SCMI device table alias support
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
References: <20260820194850.459739-1-johannes.goede@oss.qualcomm.com>
 <20260820194850.459739-2-johannes.goede@oss.qualcomm.com>
 <aow2GFAfy84k-N2B@monoceros>
Content-Language: en-US, nl
In-Reply-To: <aow2GFAfy84k-N2B@monoceros>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEyNiBTYWx0ZWRfXz9Ll7aCcwYE8
 3ZigyBtqmW0MJKLgCf8vIZY+hs/9OSVkUVP2NQlnqrT2ldn8BrNGE+Rd26bZ1S7Qd1qVy4lFDqJ
 1G7MY+etqRkSU3o0t8wlgNU7YPip9Im+8j+EpQc/hk39ozgr/m7RaOM2Xx3/O8Y6klkf6TrAuzS
 YfT+FThKHHZ0ypzSqs0iFsZtGCSXopAjoXgFNkw2dZ5Lq6xPUWO5jm5VrstJVBKEGSIypNAsqu6
 qA2aefF0l23lA5wphZe0yA/LWKbz3IPqbLH8l6rBW0iVSAUZJpBY0Wtz9y33Js8N9Ceg4AMNKEL
 442HhoOPcS2U5GG4jjC/PDdjXpFXWruudpc3kP8rzdXx45x23ZxJRskToETIxGI7miExkGe4Nuj
 97QzYOfdAiisys3tSAroIkWU+vzpfAsUPTHkQGgW7JOrf3foou1Jt/3nf1fIZ09ib60RTOSaQjK
 lJheCC/M1u8oPuWv0kg==
X-Authority-Analysis: v=2.4 cv=JL0LdcKb c=1 sm=1 tr=0 ts=6a8c5c27 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=IpJZQVW2AAAA:8 a=OCaCXozdqvtwCLTCMOQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEyNiBTYWx0ZWRfX+uRb37S/Gz/Y
 D2XTNKP788p3vD+XN0/ni27jrQyzeDWKBZGt+wUOy1ZN0C/h2S0oqHscD1IL76nQkWtLQ85f5XW
 Re0409ieMObblJyJg7YG6Ku5zof9d5w=
X-Proofpoint-GUID: l-zqHtcqpmdHhKuGPfD-BEwaSR39D8sm
X-Proofpoint-ORIG-GUID: l-zqHtcqpmdHhKuGPfD-BEwaSR39D8sm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240126

Hi Uwe,

On 24-Aug-26 14:22, Uwe Kleine-König wrote:
> Hello,
> 
> I just replied to v2 and only then found out there is a v3 already.
> There is something wrong with my mail filtering, sorry.

Not sure if it is your filtering, v2 is somewhat old
and I only just revived this series.

I'll add you to the Cc list for v4.

> I'm forwarding my review comments to here (the part that still applies).
> 
> On Thu, Aug 20, 2026 at 09:48:48PM +0200, Hans de Goede wrote:
>> diff --git a/include/linux/device-id/scmi.h b/include/linux/device-id/scmi.h
>> new file mode 100644
>> index 000000000000..4150481524d4
>> --- /dev/null
>> +++ b/include/linux/device-id/scmi.h
>> @@ -0,0 +1,19 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#ifndef LINUX_DEVICE_ID_SCMI_H
>> +#define LINUX_DEVICE_ID_SCMI_H
>> +
>> +#ifdef __KERNEL__
>> +#include <linux/types.h>
>> +typedef unsigned long kernel_ulong_t;
>> +#endif
>> +
>> +#define SCMI_NAME_SIZE		32
>> +#define SCMI_MODULE_PREFIX	"scmi:"
>> +
>> +struct scmi_device_id {
>> +	__u8 protocol_id;
>> +	char name[SCMI_NAME_SIZE];
>> +	kernel_ulong_t driver_data;
> 
> Please use
> 
> 	union {
> 		kernel_ulong_t driver_data;
> 		const void *driver_data_ptr;
> 	};
> 
> here instead of the plain driver_data member (or don't add driver_data
> at all if not needed). This yields better type-safety, see e.g.
> https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com
> for an extended explanation.

Ack, I'll check if driver_data is used at all.

> 
>> +};
>> +
>> +#endif /* ifndef LINUX_DEVICE_ID_SCMI_H */
>> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
>> index a397213bedac..d241421c36aa 100644
>> --- a/include/linux/mod_devicetable.h
>> +++ b/include/linux/mod_devicetable.h
>> @@ -49,6 +49,7 @@
>>  #include "device-id/pnp.h"
>>  #include "device-id/rio.h"
>>  #include "device-id/rpmsg.h"
>> +#include "device-id/scmi.h"
> 
> Please don't add new includes to mod_devicetable.h. That header is ugly
> and each include makes it worse. Just add <linux/device-id/scmi.h> to
> the modpost source.

Hmm, I did that at first, but that is quite ugly also because
file2alias.c, does:

#include "../../include/linux/mod_devicetable.h"

So I ended up needing to change that to:

#include "../../include/linux/device-id/scmi.h"
#include "../../include/linux/mod_devicetable.h"

my thinking was that the purpose would be to move other
consumers of mod_devicetable.h to directly include
linux/device-id/*.h"

And keep mod_devicetable.h as a file which includes all
of them for use in devicetable-offsets.c + file2alias.c

But I can see how actually getting there will be a long time
in the making and in the mean time this will cause longer
compile times.

So if you're saying the somewhat ugly thing of adding
linux/device-id/scmi.h directly to devicetable-offsets.c +
file2alias.c is the right thing to do, then I'm happy to
do that for v4.

If I'm reading your comment correctly, that is what you
want me to do, right ?

Regards,

Hans




