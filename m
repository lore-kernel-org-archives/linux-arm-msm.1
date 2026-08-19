Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6C543551D
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 09:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787132934; cv=none; b=Zi+qKyUs3vT5ozLdTmfnbYnPKQdVUz+WBOO7Gk+IwgxuzPMmZVvNAstKqVqSbMJAdwuQAOYYc8Ts9y9BF9onEzn4af5q4fBUj5UPDDTIVY4vYhzyTKATx7nv/cXVwhbl3b9b5oFsgvDLDLW00tBEvQLmJUdNqoEIqbxCYd/Gkh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787132934; c=relaxed/simple;
	bh=uQioOmaJVlJ2kqIbJb4zaXYWx9XtY7h0lBUVlxk8Fn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DFJ5O3sB6DAqiw0OWfJuHEMlDM2IWcGb9JbMrhJNfZAM7t8+jVnaewqioqyaxS+sho+9lUohtOFqMQbQlhzvdic6athT4FcYyzmApHh0GdVO3qUSKTUNREPSJfxzk+lZPn1+yYgBoK+VPhC24NgLS8yNIf0i5MI3MGie61vPwcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ojg8774Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QNBTBj1A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ojg8774Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QNBTBj1A"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J6Z0xw3266662
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 09:48:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M4PDAKpq3CcCOlxu5k9j1hSRxD72WCqmgxRmVTcYDN4=; b=ojg8774YigChGZiN
	eoLVmQ4Bk4BvlGc8bAEsWZb5IJkbajvEI0r/xgHj1VecouaT6Urdht2+M/pYdx8Q
	afkQApDyt8S1NFkQElfPy92Etj3aNXx69611EGYJ9IFwiyfFZZSeAxsNp15yEejZ
	7TvqrBK0FYO94KjKT1qjwaHKI/NQ1nJ8uc4dzg5xAp1amGUuXlD+LxBPZpd79kKx
	WHAa1tYNg3bmlJp2GYukPIVlfEt32ZQEC5CUXFvZmqXSEYaHMKSGUfVsuxytdy8O
	CljVxFa/84B84kZ63+kydj1nKC+umU3rRRDjPXeaukqaAdf120gRWcViz5x/zLd2
	2Vcnlg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yffjeq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 09:48:52 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so1857808a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 02:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787132931; x=1787737731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4PDAKpq3CcCOlxu5k9j1hSRxD72WCqmgxRmVTcYDN4=;
        b=QNBTBj1AwFghmBxTf4uqSqGM5Kx0E/AeaTwMyM9XE5mM01+udk6cIV6tHCPrrqiFxk
         0H6iJIvfapwVyfHZ+fYeTRnAG36oMmuF492zhNIBqYqGJ9wiFUmg2i1yQpXRWbEyIosx
         M0J5mB/vmWj11F5ko07U/oomCRY4J3ILJw6gjIEjVZIqzzEz3k1qDVgfc7LtpRLyLtZC
         bo1+ptjKp3Vbp58hlZMufRQCDgQ6GpFV4yezGgAxw35bNknmkH4ZeRh5Q9wPKOy5oAhN
         LMS1U8dW9A4nSsysefxkF2WJK0KvZIHMZuFP84NGfxoORTOOUQrqpeR/Yv8psk7cN+rM
         8HCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787132931; x=1787737731;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M4PDAKpq3CcCOlxu5k9j1hSRxD72WCqmgxRmVTcYDN4=;
        b=EEHLAoIIUEW5F+eMtzSiI2yHnLhu2AkNemiyTJUNGXZj7EpJ1RCu2Gmfz3B2AmMpqS
         yMj7hXjgBG1+zjltQLe8HTayOjh+HhsI+e8jgN/3udKEpIRlw2Tg3O0c1+mzjCL6vjlz
         D0aI+3vvlNyDro1nF80r8U9m7RzPVfj1HSCZ08UZGiisOEmeOdFQkl1xqPk4PZWIj1SE
         AUDYPP1d81RLB/UOcaF8kX9riuxmb/k3I0YoQy/UsHUBnAw+CLDg9gEQ/XMrdnOfaV85
         1PRxCxADXpOxEK2j80BKHcp26w0+m+n6tFTD3I+/1uEaGvMu5AOAln6IoWEYrWK52djz
         FfQg==
X-Forwarded-Encrypted: i=1; AHgh+RpVg8S0J4Coev77L0rIf5Eqg6zzhKjMq3eMtC3MslW54JGsE8mxpWOIi3S8J5BfW4ZYbWoNftILEjUDEEbt@vger.kernel.org
X-Gm-Message-State: AFuF++lnuo8RXvpT/IyhWkCpTXoDMk5SQyUVlxYIrTyUgOI6SV2Jj8rs
	1RkmWKGywmeNMljquIs/C+2gLgU38Z2T8bKi65etLSPFc4FYNUhzwaicvDthtnPhd7Ggw2xE9y2
	L29xYTehDpC4HJMPY4sHAcgpygb9jKAEqlk/yp6fAfONPqoFTcuzYeHQAFqd0M1QF62DQ
X-Gm-Gg: AR+sD11Jz2odozL9Z8KqI0j3qVqFfttlaE9nKfhw4I6UbmcBXQjTyIodULOQt754Ry0
	zRd4f20zDenIDu+bzsExi/DWza+xz3FYPw76cM2H6cV2zkxUxKKa6/b4n6bCq6Dpncsp/Nmybkg
	Q/Zn6L4pAp7y8Hq+trsxY8Ox/5XEgk6yzwbWA2/N+V5HaKABzJcE/Ndc9I0EfvMXIMk3PZK/dib
	kZNZW82yZoJxNZBkcgNqOOOpNVtN8nV/zVAEqOdVHpoUnate9gTxxngMtKXcUN9ljFaef/9V4Yf
	tAXdRDZfgJr16vnWTdY3rMQqg4RLvQeqABb+pmdekM+nN3v1u1qJrKv3Y+nUK4OAfiq80of/O7l
	WXUqAfU5zlWZhYA0xjFv8n4yetBkj9w==
X-Received: by 2002:a17:90b:5250:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-3958125375amr6886841a91.14.1787132931105;
        Wed, 19 Aug 2026 02:48:51 -0700 (PDT)
X-Received: by 2002:a17:90b:5250:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-3958125375amr6886753a91.14.1787132930634;
        Wed, 19 Aug 2026 02:48:50 -0700 (PDT)
Received: from [10.217.216.255] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957faf6849sm2001049a91.10.2026.08.19.02.48.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 02:48:50 -0700 (PDT)
Message-ID: <4a81f4ce-7b74-45b9-b3bf-942bbe625e4c@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:18:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] bus: mhi: ep: clients: Add loopback driver for
 data path testing
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
References: <20260817-loopback_mhi-v5-0-50efc7360b7f@oss.qualcomm.com>
 <20260817-loopback_mhi-v5-3-50efc7360b7f@oss.qualcomm.com>
 <aoQc2aVZ5MR5OKje@monoceros>
Content-Language: en-US
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
In-Reply-To: <aoQc2aVZ5MR5OKje@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA3NCBTYWx0ZWRfX08xoqlPy39bH
 kIzKfYyCgtqQp5TaK8Uzh6PlmcYYi2uCVJBNei3S0s9bMjN9POuk28WEDeiu3GYVI99nPb/i2J7
 istJ293RtKjWvyPzEWBzJU7FlotrSSA=
X-Authority-Analysis: v=2.4 cv=H5PrBeYi c=1 sm=1 tr=0 ts=6a857c04 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=66wo3ehNeEoRUVuG-WUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: WFFNKI57l_DE9yZCwsedKad63VgqVeYi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA3NCBTYWx0ZWRfX2fjHX6O1rnp3
 HCZo3zyxbu8xxfLyJ7iZQdD3mkdm0nMg1lNwy7UZ0JYRPe0wx+tatMn4TFdxqU6sWLZtIPJVf8X
 ZguO02JNO4fN7JyZ5B0kd9mY5aM3H+6MQc0Rm8oqTLB5FyVMrhz+QnyTgJbP2pUw/1SwVlZMdpq
 dhbhV2buWMthVsXCzRPYu9LD7vilxqHVMAKOFcyVHs4lFSq/gaH9SvsO9sK3HnBNlbg2qp+Ot+D
 SFDx6rOtYIxeIft3lxdkp2tI/vhLpT90XxznY7eGmzGXJIsxfxUG9A55fHs2rDD6Dw6adikctI+
 3U9M6MtbO10jmIt4ZmuHtG6frRQE8Y1Nqo7XYRvZOeY1dtGgTnGQgZpNRbZxUhFiZ8Ma5GqBqPd
 XuVJId/pbG8wZTnJasvOBRiA6c6nxjNeB2Hae52I0+0y/jA/ljsjPFiVnrPlvO8g9Aa1uS89Wd5
 fJ+P9SV9RWBfrru4YKw==
X-Proofpoint-GUID: WFFNKI57l_DE9yZCwsedKad63VgqVeYi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190074



On 8/18/2026 2:23 PM, Uwe Kleine-König wrote:
> Hello,
>
> On Mon, Aug 17, 2026 at 03:44:36PM +0530, Sumit Kumar wrote:
>> diff --git a/drivers/bus/mhi/ep/clients/loopback.c b/drivers/bus/mhi/ep/clients/loopback.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..18a92d6a40e0f7de277d155cdb5495d14a60c19d
>> --- /dev/null
>> +++ b/drivers/bus/mhi/ep/clients/loopback.c
>> @@ -0,0 +1,130 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/mhi_ep.h>
>> +#include <linux/mod_devicetable.h>
> Similar as with my feedback for patch #1, please don't use
> <linux/mod_devicetable.h>. Either rely on <linux/mhi_ep.h> ->
> <linux/mhi.h> -> <linux/device-id/mhi.h>, or explicitly include one of
> the these headers but not <linux/mod_devicetable.h>.
Will fix it after rebase in v6.
>
>> +#include <linux/module.h>
>> +#include <linux/string.h>
>> +
>> [...]
>> +static const struct mhi_device_id mhi_ep_loopback_id_table[] = {
>> +	{ .chan = "LOOPBACK"},
>> +	{}
> Again, please add spaces before the closing }.
sure.
>
>> +};
>> +MODULE_DEVICE_TABLE(mhi, mhi_ep_loopback_id_table);
> Best regards
> Uwe

