Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117DF496D43
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 11:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162777; cv=none; b=d8uKkjGgWDa9vCH5HOgP/k8hyV/R5k1O6P7QSDzaNaQ4MWPKPjgqTnJxNtPkRbVISoGPXi8A0gD5pPs4kQM25WrLizdWKqUTh5gyFDNmcDMck8TewkXez4yBSg32M6JM4RwSxqIJmlXrBvrx32hK9TQa8S8L7b167UJW3ZlEDfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162777; c=relaxed/simple;
	bh=wAz63z4vM59cDGM6LsTxL5BGIjXCM3agwqWGM65/FGg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=dHCQgDKLNXVJWmZ2KEkhiaEchDeyD5yc1nRFck2m9bSw1mpvlom8OuGOORThZWN9MTf6wMwLft24d521+9ONoRp6xxPv0OMX9nBpeGauCaWx1T0ej5AaLpyU13X8fwpVpeQ/4mjlyYrZH4Sp97JL/XKc6Rx/yb7eKeZi3oyrMok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LDCAF+6P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SRA9iwn7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LDCAF+6P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SRA9iwn7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2iHt3208451
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 11:26:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A8kpEDihnr+M8TdP16ky008+U5/0wXpkYZQ8ZAiWRp4=; b=LDCAF+6PYMGDa1hX
	CZho+8P+RdrJLHQuAcRrSndkxfxHFu1MLaYZ4ZtNGpefNEW2/EHpm7u/aiG1C5SW
	g9HQyleQkbgaCGn7QyLaBjkT4R8G5IvcDCrR2Iuu5Cpy4UudLkXDRqBME2QJBUFe
	6rEIMlxmoSPQROr7w/vbCMH6MBybl5F6VUD+S+9KexpQvBwk4QTVqsNgyLJe+qko
	qFLuIMUD7PGiQiPFMN2pkJx6gabdI8y/+Fo9Xi7ERomhni4pYEGVu+K9GIMHRiE+
	v2ubZn/1ta1ZY/f4UKEEBBIkJOKZ8RhOs7gwfnqrzTGn7jz8h74446AOOG1CnFAk
	EEigjg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv78n1qfv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 11:26:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939f248907fso80952485a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 04:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790162763; x=1790767563; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A8kpEDihnr+M8TdP16ky008+U5/0wXpkYZQ8ZAiWRp4=;
        b=SRA9iwn7BR1fmm5DN2/47VVTqE2edvbQ5ubCeseZ1myHjCFeq/McdqekyeCXz2P/Og
         8GSmZWRcXwMVLrLQRBF2q4ZixjIPwJsE6zoWEluaOXH8VD/Qm3U612X5ldIRdsKb368D
         hEQirXT+IQ8K8cLGA7LePPkSYvHnl7PWBA+BEEDwcsVXDkPS1vGBxMI9Cw65k7f8W6l1
         EdgvVUvqg1aF4ZyaiMWmnCYAjYSKTGvxOxEsSvXDdwOtWI1y9gobwBVjlOraIEn35pD0
         GZbmHXfY3WfZZiVAK2ZGNhe4qGOr9IrgFu8cWVwollehZlME4eH1jKsYqUqLIff/0Mir
         JAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790162763; x=1790767563;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A8kpEDihnr+M8TdP16ky008+U5/0wXpkYZQ8ZAiWRp4=;
        b=mQZoeT0d354A8wX5USa5qqhPT1vsd1bWgauOOUyJsHAGPYEYGxtItQvUIXxz/ZYatf
         Mui9vvpTtK8juxxAWbdsK44TBanK1Cea7vAzTBAXp/co1T4fKNl/S9spWoFqmxNEMpYK
         yidHonkah0mmd+1qnrxu2D/xhxuhWkzvAdKR/EilhhQtCHiWPymEnrPskFnHs4Y3f6eF
         8uSd+fTTomqAJ10GnsclThv1uXEXCzf0WFB9VrDxmCuEtns2XeBwhRBEfViBbOpiYVdU
         K76GUQb6M6+WfvSYuiDJ/9JywwsZWTi/mi02uPl9gVD70K/7vlR8C7xCvYxwMkpQ1i1F
         Oc1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxks4OfsB6YOKVD1O75+uClZk1qg6amEBSr2JSpMpR+TU/8YC2Dbbf3NIeO4pHD20JmiPaPb8lP85IEE+bd@vger.kernel.org
X-Gm-Message-State: AFuF++ksiWSXrB2FkyJA0m2PmBfup8BcTQUIxQbecCD/++60V0d7nY7g
	b5suhGfkiuo8JwvS0lyJO7vECQXY6jWo9x/F1XGZH3aUpuPTKB9bswtw3cmMeETxqePt8H5PIht
	hQQ6FV2Q6wXNZtrjAUKbnDj9Ap6VeIz1mgmOdJmmvjFKqTXn+iQT6pdPnakjHCKhLTq5e
X-Gm-Gg: AYBFou1MNY1jLEZ1vL7cnFRZFHc5pKjigH8o1pgkXKbGY8sni7jG8jn2OCSfpjQaKXY
	y/RPvudERL/e6mnVX3wcNepsODC93pglvYj3uZg3CKpfkbVwqneilv5TKR8NcGdmpHAGkNZPAO2
	TZS22+555c2ud1fhmCZCdTkpcEUbbNAqt5g1sOl67+FvEGml3pyIPLqvMo9rfaLJt6g4E++YWaZ
	KDQhjBseQKDSzL/+R46p1AAOp+wWWy81PsnkvupxPNeiMzv4JZ/ylUoe59BmnDE2cL5fz8t64tP
	APYPiL9/nRG4iRckuee0t5mf69YsX9TVc0BWjxJoa94Hh7lmyheU1r9A8x/WR4020TooMvjdz0k
	kkApaynZ4tNC2CEQXQLqJBqC49XuVKUY9RCf6j65Nf0RdyrxPTPVd8wGSfGYlLVF7f7iSbpwyZJ
	BmBrQU5M3f63WUU1hPvliQrxEDXv0tS7aURrJlOZSVIGxpEmhYwBW/WkKSYp3j+yKWPL4=
X-Received: by 2002:a05:620a:260e:b0:93b:d7ed:ff54 with SMTP id af79cd13be357-93c2521baa1mr353037985a.65.1790162763285;
        Wed, 23 Sep 2026 04:26:03 -0700 (PDT)
X-Received: by 2002:a05:620a:260e:b0:93b:d7ed:ff54 with SMTP id af79cd13be357-93c2521baa1mr353033085a.65.1790162762755;
        Wed, 23 Sep 2026 04:26:02 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c5c7asm100347966b.22.2026.09.23.04.26.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:26:01 -0700 (PDT)
Message-ID: <a5e56180-b96f-4fac-980e-e837e84cd5a5@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 13:26:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
To: Sudeep Holla <sudeep.holla@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <arFKVhlgJge5EZyj@monoceros>
 <20260923-sceptical-mauve-firefly-f5456d@sudeepholla>
 <6b5a8300-ebf9-4717-bd39-952e89fc5e78@oss.qualcomm.com>
 <20260923-snake-of-magic-satiation-c3b857@sudeepholla>
Content-Language: en-US, nl
In-Reply-To: <20260923-snake-of-magic-satiation-c3b857@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NSBTYWx0ZWRfX/eb+swVxWUsK
 RPA2MmuN4LUHYY2fJ/K8b2JOXyuLZPatQ9xDU3CrRQy9IVLFG2S21MlqukEbcHDMMD2CVMkxYBO
 f4soC/2Hl8vFBuU1ga9DoRZPa9qSX4o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NSBTYWx0ZWRfX3wQyIqp+D52B
 b8us5oPhxHIFg9oQugbyygbbffbg5ixhB6UaCWiFUPQJ2SrFtj/Cf1Iyf1sQBnCLxezQX4eq2JK
 jqic0tzRtyWk5OTjEsX0fW5MUz6GMqFv0C5G5YLZQ2dMXb6V+iWtGJKHTl5Fr9y1q3JtFhdghkK
 PVWYZabctsJ2FIV76nKeemsrZGEabODiV5j1dOt72RF5ADcfbW/5vKygoTVQuqO9PZEkAIGGRFi
 KKTPuSnSDPEW5ciWPjPXPQyW9YazuoA6mKG/vMQGBz6I4A6ltWc7AKYsjdh5PEYKU+Q1nfPeH8D
 d3lL94Mk7G0nP2jLANAJIdMVZMq7ERNOOdcuev14Wvayt+coworiOjqZwktwtc0XwZ8iG5c+nWJ
 TsNLPY39T5DXmUBNBP5SyuyI0X7AZxijBRctC0ZIBVdb+Qg74DpBW2G1Kx02u7aIIOcE3lqhQaD
 4GdKYVw39JIeARLw7jw==
X-Proofpoint-ORIG-GUID: _gG3YjB2o2eDJ0p2IS1PU6IppctWcdLA
X-Authority-Analysis: v=2.4 cv=aNFlOr9m c=1 sm=1 tr=0 ts=6ab3b74b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=-cZiopXip2GWjs8Ks5QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: _gG3YjB2o2eDJ0p2IS1PU6IppctWcdLA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230045

Hi,

On 23-Sep-26 12:49, Sudeep Holla wrote:
> On Wed, Sep 23, 2026 at 12:23:50PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 23-Sep-26 11:07, Sudeep Holla wrote:
>>> On Mon, Sep 21, 2026 at 05:19:45PM +0200, Uwe Kleine-König wrote:
>>>> On Fri, Sep 18, 2026 at 11:29:50AM +0200, Hans de Goede wrote:
>>>>> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>>>>
>>>>> SCMI client drivers already describe their bus match data with
>>>>> MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to consume
>>>>> SCMI device tables. As a result, SCMI modules do not get generated module
>>>>> aliases from their id tables.
>>>>>
>>>>> Move struct scmi_device_id to mod_devicetable.h so it has a fixed layout
>>>>> visible to modpost, add the corresponding generated offsets and teach
>>>>> file2alias to emit scmi:<protocol>:<name> aliases.
>>>>>
>>>>> Use the same stable alias format for SCMI device uevents and sysfs
>>>>> modaliases. The previous string included the instance-specific device
>>>>> name, which is not useful for matching modules.
>>>>>
>>>>> Assisted-by: Codex:GPT-5.5
>>>>> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>>>> Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>>>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>>
>>> [...]
>>>
>>>>> diff --git a/include/linux/device-id/scmi.h b/include/linux/device-id/scmi.h
>>>>> new file mode 100644
>>>>> index 000000000000..1b4ccfa9dcc5
>>>>> --- /dev/null
>>>>> +++ b/include/linux/device-id/scmi.h
>>>>> @@ -0,0 +1,17 @@
>>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>>> +#ifndef LINUX_DEVICE_ID_SCMI_H
>>>>> +#define LINUX_DEVICE_ID_SCMI_H
>>>>> +
>>>>> +#ifdef __KERNEL__
>>>>> +#include <linux/types.h>
>>>>> +#endif
>>>>> +
>>>>> +#define SCMI_NAME_SIZE		32
>>>>> +#define SCMI_MODULE_PREFIX	"scmi:"
>>>>> +
>>>>> +struct scmi_device_id {
>>>>> +	__u8 protocol_id;
>>>>> +	char name[SCMI_NAME_SIZE];
>>>>
>>>> I wonder if you tried to keep this a char *. ISTR someone did something
>>>> similar recently and they claimed it worked. That would get rid of the
>>>> artificial name size limit and simplify this patch.
>>>>
>>>
>>> I agree with this. 
>>
>> Ok, so I checked and no other include/linux/device-id/*.h file
>> defines a foo_device_id field with a type of "char *" and
>> then uses that field in scripts/mod/devicetable-offsets.c /
>> scripts/mod/file2alias.c .
>>
> 
> I looked at hda_device_id and its uses. It looks like it does use
> char * and there were loads of drivers initialising the string. I must
> be missing something then ?

If you look for hda_device_id in:

scripts/mod/devicetable-offsets.c
scripts/mod/file2alias.c

Neither references the name member of struct hda_device_id.

So the actual modalias(es) added to the .ko by modpost
do not include the name, they are of the following format:

        ADD(alias, "v", vendor_id != 0, vendor_id);
        ADD(alias, "r", rev_id != 0, rev_id);
        ADD(alias, "a", api_version != 0, api_version);

        module_alias_printf(mod, true, "hdaudio:%s", alias);

>> 2 device-id/foo.h headers (dmi, pcmcia) do define a "char *"
>> field, but then do NOT use that to generate a modalias.
>>
>> So scmi_device_id would be the first to do this.
>>
> 
> Your response made me dig further and I found snd_hdac_codec_modalias()
> which seems to do the magic there.

Note that function:

int snd_hdac_codec_modalias(const struct hdac_device *codec, char *buf, size_t size)
{
        return scnprintf(buf, size, "hdaudio:v%08Xr%08Xa%02X\n",
                        codec->vendor_id, codec->revision_id, codec->type);
}

Also does not include any name field into the modalias. Note this
side is the modalias which shows up under


/sys/bus/xxx/devices/yyy/modalias

not the one which gets included into the .ko (and can be shown
by "modinfo") that one comes from scripts/mod/file2alias, but
the 2 must match of course otherwise udev will not load the .ko.

So it seems the name field in struct hda_device_id is only
there for the kernel to include it in some log messages,
just like e.g. the dmi_device_id "ident" string.

But this is not used by the modpost code which adds
the modalias to the .ko, that tool is the one which has
problems with non const size strings.

Regards,

Hans


