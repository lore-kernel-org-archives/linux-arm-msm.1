Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0523AB5DA
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 09:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789725228; cv=none; b=k4eh88ZJnR/UHPB67910sIKRzVifAzwV0HkuJE9leiZfjWO10oYNCisDpv6bP5LjLH0votKf2lC/xDSEbMYuJvjayQE1AY2rNV3euj2YMgAONEjTp8Lqca1CWRlskK92czuwXtObjO05z2fKusw4qlmQhAjo7o5Ba2yakS1YGcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789725228; c=relaxed/simple;
	bh=JOc4F8hkT++Suh2u1rGaZrB9TIGD6H1rr+XUW/Do3FE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wwfp1of7IC7N17TbRlmAYqHqWPYWNF1M9jUBDrRyRdKEGTTDm9PQ/DzOJwd3mo2pzHtl9hQp6eV8fptu8TvbpFOGu7DI+kY/biuy91oHcRorlOlajxat5TQXQfb6fmkQh+wCaw8qPd/x9GgP7bXi4UZD6bBtqp2Myr9PuF4I/Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kKCGluDo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gGe3ex0T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kKCGluDo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gGe3ex0T"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9eaCb523519
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 09:53:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9H0b15hwR+X1R3+E8CNb2EtpvuqC0WA2TxRhDhiiOrY=; b=kKCGluDo1Uauwfwu
	G0gRnEKi8K2C0N6JHL8isiwVgVXPRkjqevT70AoxlTBWmS5mm4fZ10D4ORYZTAF+
	5r0maBrfZ3dngbKGO/jF8d60s/RryTl1SIN6Q+Qze7kRV26cmRd1yjBBLh3CZdPC
	epe1ogOHmCjRbt+Bn510qLLTelH2dhVzBexleiQ0T+lW+x/zZ6CrkUEOnTSbd5k3
	IRH3CC87Ch7XLdEo44BzUR4G3x9U1KDXVCO4V9gQ+/RKsGf7uTT2zjPjrrpztx5G
	/rL1Du/Y8aIwotzOaHzhAemEoaFxVzadEkElwZk8gKhEq7LdCB9qKFrw6je9P3Yd
	+an1RQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grnqebaw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 09:53:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936708f129aso88286585a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 02:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789725224; x=1790330024; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9H0b15hwR+X1R3+E8CNb2EtpvuqC0WA2TxRhDhiiOrY=;
        b=gGe3ex0T1H71YXrlXlgsxvneEdkn2TDVO9jJIctnNg9Py337JaBhu/xE8KpRCrddiR
         5jCxCucDndz5kfF2/baUpQiqcdPGWlWmYtj5XGGUZUEd2DkOvBAOmhYx5MBcAR1QyFp0
         a/FmRCNHVvWwY71K3FiBzL8IzkbI4YkBtrZJ73jjYPh2fKutLZaUja5i33GKg5J7m/ln
         U8LfKVIakEd/btYdtu8rjDf5yf0rwXDEbcG4/lYY2Xz73bik+93WjUxYuKhrIh1oN+hN
         s+Ad72Bkl9XcutKClLr6j1tyAppBDyjuZd8NXeYfbvTEVV21Afpf5zn5bnoHSthQC+Fp
         CQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725224; x=1790330024;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9H0b15hwR+X1R3+E8CNb2EtpvuqC0WA2TxRhDhiiOrY=;
        b=sO8qgLZ8UkoylG+kC346sabdFeyCI1wRs4V665Ax+NzJdtftlhjh5wphM1risk6RMF
         kZFL4+U3RP4DYcxCeUSQj6UMx72ZP5KvsDZAgKIQXL15Ds6ILqsAsrgiXmsKYN4Om0Yn
         vGOrpM82cAQVvT0Z1vDyp/eSwatXnAdPVwUgwZqjo4QaCT0x2xeVOg9lMFcuqTP7irU0
         EB5BXSS1kwfURp1TGFIcHlM1IYUX3nPwMR4nclhBD9unXKMrRaeLeW1t41RiUaLHC4s3
         pLLfu74FVMJTTkJBG8PYnuMt5I2WLFDG4/wIZwW+kMvbEvPbw160N+GmIq8wBLhYTv+R
         1LNg==
X-Forwarded-Encrypted: i=1; AKwUvBwWgd9vL6MH0Ywx4TKQsws0NQyyhhdMompo1+AyYFbPw8ohAUcJYizM5fb36u72ox7uw8fccbPD3SNoCtjv@vger.kernel.org
X-Gm-Message-State: AFuF++ntyXgZQRtthLp9+16eBXk+kW8/K/hmvrXNRrISrzqap1yQM9G0
	DP6snmVbxKZnHbtOVzrb8ZS4dbFLMtV3mEacNJhR63u0dYZBAngGzIO6Fxn3wulWLGzbloW5mXL
	J9M3a6z9lsa7LUyqqP7eAkDaj3jGPReUNwgl3ZDo1Ijns5xrTMcPQCpPeFCnTTxw2TlQx
X-Gm-Gg: AYBFou1Kxhh4kFrzlOfrkfVrjjgLY6Dn3hXCkqwnE7DqMiwPXk47npxs99LyLgccIJL
	zq6eFbKsErq9SDZEohCnjdGqzZcCPUG5y8V8DgY84NIiCdhl7Q/9wteJqziKNCr/dh0WUp4AZ6c
	mOKWd1ldnG60vueRRfIdiTDFe79r5MDZaZ5tPAyA0Gyjd+cCogUaDnqmRTygE31JhmGf2lckcBZ
	IizxIQ+Fce/Y7ZK6ZYYbNwDkHi6Wmw/WyaHR0io32f4+U0jUU/+bjFBV6oHZWLHyAZtVkqiCAco
	SZ90Tx5sVZxziEFNTUUk0VNEIat1ng4F8GhqNkuW+Ain6wP5E/Ltm44I3NXcFdinGTIS4OTBE3X
	/Cuaydo6nFthVziL39OFX197uuSR3DfVVyXtI64ePljINznIna3a/0/uApEEJ3Bg=
X-Received: by 2002:a05:620a:1a0d:b0:93a:c10c:6b5a with SMTP id af79cd13be357-93bdc7237d9mr245917185a.29.1789725224506;
        Fri, 18 Sep 2026 02:53:44 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0d:b0:93a:c10c:6b5a with SMTP id af79cd13be357-93bdc7237d9mr245916185a.29.1789725224114;
        Fri, 18 Sep 2026 02:53:44 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:82ae:cd75:d970:e66f? ([2a05:6e02:1041:c10:82ae:cd75:d970:e66f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871feb5d63sm3071523f8f.3.2026.09.18.02.53.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 02:53:43 -0700 (PDT)
Message-ID: <2104f437-e960-4e55-b0e1-2b37126e8c2f@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 11:53:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Frank.Li@kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KUqXeiUnndNXsqZWANpNmk4fDy0YAg6f
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6aad0a29 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Qub20nr9Pen87uBCr1QA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: KUqXeiUnndNXsqZWANpNmk4fDy0YAg6f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEzNiBTYWx0ZWRfXzuyR2pHVafsL
 YmBbS8XxkzOlH/gnNiC4ghJx2WEwaD6DgKf9vH9aJ40/mH2/JgZwP/jn43L9lKKfULQvBLqrI4O
 KMH1iCoPSrh3KjqSN/HFTnbMizTeKDA9Hexm6F14hchM76cDkzc0tdhtM5+qROhY53ir01iNsjy
 gR/TL4I+/AAQHJtGA9fzYUBN8+Uj84JibW5FuPmkuqCisC0nYulmcQOr3uagCgR/DVVwvFm/3vD
 ZxAoheUlactbx5QVnsZA9lvLrvKmjRjqPA3SM6ejCCzsQimUugNe4BC7krv5tMTH+PYLOR3vwLU
 pW4fw5pcDms5H/+KR0Mfa/8uPs58Butsz8RN6DnctFO3WbkdGLQ6XVs5XmSwZWy/SALhLroisVk
 YwHYzaST7bEicd3hmCCHejqrRQox0m+sZAdTeHQhAfBco0h5Lh0ulMyrXFQtKKdWiqDrCaUiVzC
 QeuNbefErbEBCEKllKA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEzNiBTYWx0ZWRfX13t/K29MCPF1
 D2CQh+9tiLVeaRAjT8WBVEHXZmbH2h41288w8/PRL64alhvx1ArByq+nVSlByRRKbsn1FL6eKie
 cQejelPNDjkHYZHD+INNEU55QN8CQpE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180136


Hi Hans,

thanks for taking care of that


On 9/18/26 11:29, Hans de Goede wrote:
> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> 
> SCMI client drivers already describe their bus match data with
> MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to consume
> SCMI device tables. As a result, SCMI modules do not get generated module
> aliases from their id tables.
> 
> Move struct scmi_device_id to mod_devicetable.h so it has a fixed layout
> visible to modpost, add the corresponding generated offsets and teach
> file2alias to emit scmi:<protocol>:<name> aliases.
> 
> Use the same stable alias format for SCMI device uevents and sysfs
> modaliases. The previous string included the instance-specific device
> name, which is not useful for matching modules.
> 
> Assisted-by: Codex:GPT-5.5
> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---

[ ... ]

>   
> -#define SCMI_UEVENT_MODALIAS_FMT	"%s:%02x:%s"
> +#define SCMI_UEVENT_MODALIAS_FMT	SCMI_MODULE_PREFIX "%02x:%s"
>   
>   BLOCKING_NOTIFIER_HEAD(scmi_requested_devices_nh);
>   EXPORT_SYMBOL_GPL(scmi_requested_devices_nh);
> @@ -185,7 +186,7 @@ static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
>   	const struct scmi_device_id *entry;
>   	int ret;
>   
> -	for (entry = id_table; entry->name; entry++) {
> +	for (entry = id_table; entry->name[0]; entry++) {

Is it possible to rely on a NULL sentinel?

Here if the id_table is NULL, entry->name | entry->name[0] dereference 
the NULL pointer

	for (entry = id_table; entry != NULL; entry++)

>   		ret = scmi_protocol_device_request(entry);

[ ... ]

>   #include <linux/bitfield.h>
> +#include <linux/device-id/scmi.h>
>   #include <linux/device.h>
>   #include <linux/notifier.h>
>   #include <linux/types.h>
> @@ -951,11 +952,6 @@ struct scmi_device {
>   
>   #define to_scmi_dev(d) container_of_const(d, struct scmi_device, dev)
>   
> -struct scmi_device_id {
> -	u8 protocol_id;
> -	const char *name;
> -};
> -

What is the reason of converting the char * to a fixed array? That 
limits the name and may result in truncation and potentially name 
collision, no ?

[ ... ]
