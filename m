Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0590837206E
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 14:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786111938; cv=none; b=ChT1EFAdxTRImg910ToSCSA/eoEKfwJQlDQ58swN+malQRfhdJVLDXoBLU7RQ2lEIEjCEhUsX56gOcf27Kpo8Kj0MpQDOuY9fOhNZO2vIqdTzhirnvn7Fe0AkCHXGLJdKltNdh38MPMHauZk536zIOPNq7Vfq5F8TxTabsdyAMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786111938; c=relaxed/simple;
	bh=iLv1tIWivF/5I8UWLwGD3GmhFGyyrMYA0OYvkAJZvPQ=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Ih4Tcbv7k/IcEsXVE22SlqpUaE9WJuDOQVtOAFUKNkVY9NLlK/8GLioxjAcaQ/PvuZ7aFa0iwKJEyWIifu4xe3L5NkSLYojt0id/adWdiJO9QomUTGXsNr+BWIkyikencMJ1BusRBXX66ZdyOCWl7LlMOeHAMLLBymdhrxaBQkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hXDDSzFg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cSHGrGw4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hXDDSzFg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cSHGrGw4"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677CgHeV989351
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 14:12:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1lQfzcT+hJ0DElVppqFC5o4kaK+gwF6cwSUj8RWciT0=; b=hXDDSzFgehrFqywV
	KHi0sC5tBXTP3V9HuH/wkAHvcpyItE6xp72u74HgMRELZjKSBD/MT828rctQePpR
	znX7M/PvORhA6r2V4MAfUrXqIjzgAHOlD+DtDyOJ+JhAGalJqNva9dI+QYy5jK9B
	Ew7gufOXg6nlI9NLUlo37g/BwnxEe6YvdU5v8+I+v2GYaAqb5o57VZLASvHTY/qG
	Sw216VBvx8+oTu+F6wxrFaL0CxZeUjNeLr1Gi+AqafVcBuc+VaMBTW2FFTwN1ZGk
	vhk1l21I3p8nj7S0ojidsf6O9CDwtvytDoF2GQMJFxByZ1INm1nOZ6MGR7XAoNwK
	FMWjPA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwctp91c7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 14:12:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e5a616d07so3462362a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 07:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786111930; x=1786716730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:content-type:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1lQfzcT+hJ0DElVppqFC5o4kaK+gwF6cwSUj8RWciT0=;
        b=cSHGrGw4SzwCZPhxfwzTQOrG2OZUmW/ZrPK7zAfYTnGu0d5qoJoo9qMuWpNv3bZJEN
         tm6A1+5gQWGGHK5pPzqiImL37QXu8rB0gFYC0RDBXutvXeJilk8pNiwNaNJJ91g0aXZp
         WGcpoIsh0l+oN6af0oEXshQ5YQUjIQQPGWLmJnTII5EUnJDFHoYMEDGvGBQKihy3P0Z/
         eC62LDPgxwiRkXEnEFAgzrXqoVjJUEvg3QzLp1MusTKkmRs9C7PzOvuLiwPcD4t+tdUK
         bOHbPm9mPsepkqu7GlD4zXK9KwWOIJgDhac42bCy71s18we+9+AiLIFJym3SuNaDg+0D
         BUEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786111930; x=1786716730;
        h=content-transfer-encoding:content-language:content-type:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1lQfzcT+hJ0DElVppqFC5o4kaK+gwF6cwSUj8RWciT0=;
        b=FxRqAGL2U7d/6yrrs8RWuudwtg7hEmrvmZv31hqm8FadcCJEIXj3IJh3XS12UIDgds
         m3WdhY6jhbYu/Z3mGPYhnS4O4yitWmdfbSOvYLkhEx9fpeMg6tzUIXzwH1b0fcfzDTzg
         aoxUEXGBzVkMHDfrFtt4Z/J+N3Jbv53pisYibtCbmjJx5q1evQ/3OUqi+5eYp7ziG2bM
         UuIIJel4g19pDsUKAt9BMYwQGwP7x6tGsYYz3jJIWo3xVaOmwSn7+NjiWl26HuZC7Ugv
         0laMSob8nu5cV3xogFjsmkOke9/f1i5bXCXDNj5JeOKkbxfh9ca8hK7hjmyBk7u2L5RS
         caTA==
X-Forwarded-Encrypted: i=1; AHgh+RrJuzvaH7eMidwIfNkY/M1V6Wo8iNprRTZ2Bs3ilaGSQ/Zk/vxJ8J+v6WYzIBE/1f34PUJIfxzXdSaRDdlu@vger.kernel.org
X-Gm-Message-State: AOJu0YxSqwPGS+XEVD11AZRCVUsHXibner6TMvG/vQR1QsN06QneSFrW
	A1njIhTU1gUp6htwB5HheLlIuGHtRlxwan/xvdCEri9MxncoJKen539/i0ZJEuiuRFhyOJaw84c
	X9uMkKyE/JrWZ5ZAEcBa8+TZPD9ApXHsYu3LJRvBWp2+7AGVhY9DgDo2WWTsE6EsdOe7D/pqKYT
	tX
X-Gm-Gg: AR+sD105g/lfIFdwt4H8Pl2RjdkjgQnZ/RUkcycNSFyJfAKBrK0Y0QrLwQdLscoQh+o
	HNiMoA8z3hXW9FiqDBGJaCAWkb56LFAMyhqnW962iA9ardbd+qHzl+3zPI8sG00y02fmY8P+AcM
	jnaKazqj9v+5lG9lT4LnjMkfhOa8ppyBahU9KuErdGlFlp8L8D9bOQ0ybMbw12sOVftXu8ypA+T
	aJaA66yF8M+H15SHjrSRfNmsEu4rWJJ9HrQjp9pxH0rY3r59XFnGr9xBxd1g5z/sc4dk6lyfyWK
	wGmTgNOjW1WYlWaVSRkkOf5xxZC1GKQwBFs4YuQolNDtiVqXh9BciN5DyH+6pINmhwutInDqv/A
	FLMmEOhB0MYlVF1qDPTGNuZLsQ2nXpA==
X-Received: by 2002:a17:90b:562f:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-3928237024cmr32328a91.10.1786111929656;
        Fri, 07 Aug 2026 07:12:09 -0700 (PDT)
X-Received: by 2002:a17:90b:562f:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-3928237024cmr32235a91.10.1786111929116;
        Fri, 07 Aug 2026 07:12:09 -0700 (PDT)
Received: from [192.168.29.77] ([49.43.219.187])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925fd95c40sm2937567a91.8.2026.08.07.07.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 07:12:08 -0700 (PDT)
Subject: Re: [PATCH v6 1/2] mmc: Allow host driver to control the
 re-programming of crypto keys
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: ebiggers@kernel.org, ulf.hansson@linaro.org, adrian.hunter@intel.com,
        quic_dmukhopa@quicinc.com, quic_rampraka@quicinc.com,
        quic_nitirawa@quicinc.com, quic_sachgupt@quicinc.com,
        quic_bhaskarv@quicinc.com, quic_gaurkash@quicinc.com,
        quic_sartgarg@quicinc.com, ram.gupta@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260803163123.1802005-1-neeraj.soni@oss.qualcomm.com>
 <20260803163123.1802005-2-neeraj.soni@oss.qualcomm.com>
 <wz2zgw7kp7vsc3r43wa2kssi4niy5itsmee5rbnki6lfvmid4z@qdt6ib3sj4wl>
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Message-ID: <cafca0a9-2c6e-2aff-b7f0-fc83a1dcc441@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 19:42:01 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <wz2zgw7kp7vsc3r43wa2kssi4niy5itsmee5rbnki6lfvmid4z@qdt6ib3sj4wl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Fp01OWrq c=1 sm=1 tr=0 ts=6a75e7ba cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=1azyIadIo70wB74QPeCPrg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=JFn_MUE5eIINXpBiEhIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: xAPfUWKH94FlL9-pUonBuaVeGhykmnpG
X-Proofpoint-ORIG-GUID: xAPfUWKH94FlL9-pUonBuaVeGhykmnpG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDExMSBTYWx0ZWRfXwtn4QIJ4GnZ/
 2WCMoCPOOdbfQdQQp/DuJP+aZVSR2ZGXoGzoFo4GqJXqgwGiFQviKoKu8CaNTQmrkgnC/acA++X
 +wQiqKsLPCg1i8AUPVcmacCykEGPVcs1GOUJ1eg9g13XxmVoGusILUozRmAiGcH4fz20Lsg0zkN
 PBWiVCgk6V5V7ItI8mzGgwuzwA2+Ez8Fhd7wfeYRgD0iiQ+sg13uR/MJYNdUYm7hf8dBgW/obtj
 WBQ7DZcCny/nh+pfHlKKT9rZ4ZIgb1ChHxpaJopJHi4qavjQbUTMID3byz2zMG2XJzDpyK5dZA3
 1ncQwqLd4QNOX4SB51F513cGo6iegjJxtwvRUPimydb9YznLXB1gnV8SgH7XCxjLlh1qujMmnIf
 bAf99ybAp+AgFnI4AviT9pbq8gAl4/qLAR9CvYg2Do3jEwpHoFcu53kSl0ahfLtc7ucgYd2CcSM
 JAXMq0MSIuFFW/h4F/Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDExMSBTYWx0ZWRfX30NFn8Pxdbii
 UVwzQN/vT1uQYKsgMymHV/LqfUUYJ15k6EKifKUlJ/RySDPC+A8hS9FMdk6vHE2yUS5H4HLmNPl
 OeT5jpXCIMr63XOHMjYMg8nerIxWHTE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_02,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070111



On 8/3/2026 11:42 PM, Dmitry Baryshkov wrote:
> On Mon, Aug 03, 2026 at 10:01:22PM +0530, Neeraj Soni wrote:
>> The register context for the crypto profile belongs to the
>> sdhci/cqhci host and not the mmc card, hence re-programming should be
>> managed by the host driver itself.
> 
> Don't you have a reference to the host in the function?
>Yes there is no direct reference avaialble to the host in
this function.
 
>>
>> Add the flag MMC_CAP2_CRYPTO_NO_REPROG as part of host->caps2 to control
>> reprogramming keys to crypto engine for SoCs which do not require this
>> feature.
>>
>> Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
>> Co-developed-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>> Co-developed-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>> Signed-off-by: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>
>> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
>> ---
>>  drivers/mmc/core/crypto.c | 2 +-
>>  include/linux/mmc/host.h  | 1 +
>>  2 files changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mmc/core/crypto.c b/drivers/mmc/core/crypto.c
>> index fec4fbf16a5b..a5a90bfc634e 100644
>> --- a/drivers/mmc/core/crypto.c
>> +++ b/drivers/mmc/core/crypto.c
>> @@ -15,7 +15,7 @@
>>  void mmc_crypto_set_initial_state(struct mmc_host *host)
>>  {
>>  	/* Reset might clear all keys, so reprogram all the keys. */
>> -	if (host->caps2 & MMC_CAP2_CRYPTO)
>> +	if ((host->caps2 & MMC_CAP2_CRYPTO) && !(host->caps2 & MMC_CAP2_CRYPTO_NO_REPROG))
>>  		blk_crypto_reprogram_all_keys(&host->crypto_profile);
>>  }
> 
Regards
Neeraj
