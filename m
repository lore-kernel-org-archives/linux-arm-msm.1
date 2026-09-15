Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F293B05AF
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 22:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789511441; cv=none; b=XTNsNtr2WiFJOQSWakHpmylbs2b0DvXWOHmX80Zfhuh8Tc9j85GDYKSlCM7zrEVKxFfiB+5f4aIxjSmEMQK9DAb96g4yBGEVjy4ScdTSsYBGu0fb/Gt5trjWPVaCurnBGNvW+QOODN2x+YCar6sWJAbpHqkHWFO5rQ8tRHgc8co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789511441; c=relaxed/simple;
	bh=vVmTWSLMVujJSG3CQY6fFBRFGflHp4JcNvvw1BRS2so=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fPnr0I0RA+20KyC2Y6HwcDScLcUKAP71gP2DR6QzuJhNKPMiJ/qqUhi9og1SUvHL+mZR0ZYTA1cIED0I9H+PiuXVfLLE/DrxJbkVbIcbFMGFmPzdXRCZjVugjv0DDnG2qt8KuT68zjRaRa9KQTrnTuge1qLQ+eLam+HReKhMY2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZVDAdXDo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gR7t7Y7c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZVDAdXDo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gR7t7Y7c"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLYexx050606
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 22:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OoaUvNij8YmbcFsxH3lXmPdyT4LUwKvkwpbwWWFHxPE=; b=ZVDAdXDo0ulVpyXb
	g8NopG2tbvKSgTtcqDpDuO4nio/SQwZ0JzyDXFJ0rGtBNkZo/LmUNoa3jT7hlceo
	6w7Mhbw6AfmN2EdU3pRwH6JZ9HqJlcU2PLDuqBZfaykiIb6ShRxb8EfEYcFwkDZ5
	PTIdh17Y96kV5BeHTk50zBiw3iogDbOVtK/yfZI17mAHitg7rRfbAF1pLDmEKcDh
	WNSX/EDeIRPcXhVy0VN6MPcC7ly6233oHvBDjJH9KN56YDulhUgZeqDfBV9woUfy
	2hc2LKssaAgonXCEHqjV+37z/2SQKBIyXBgmz/uCg3bMHzabGv73qApnxcTBCIdj
	brA15w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq9n61hsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 22:30:39 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90cdc69a7b5so108435716d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 15:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789511438; x=1790116238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OoaUvNij8YmbcFsxH3lXmPdyT4LUwKvkwpbwWWFHxPE=;
        b=gR7t7Y7cyhJpDp2CnGQzkQB2fpHzSWv+qO/P7VaDyKbSGmyDIa4D3pq+v2ITaWYWrz
         AsdybGRP5rr45idNI5z7xjnBCjeQDH8WALE7MZbfTkSQMejGg7d3r6lMYP01VU52xBaR
         x+pd84S3u8qHC+ahal39qCMu01RLVN+PlpE2YSAAJGU4sqdK4fXVi3ArpyM7jOyh/qk0
         Uudpu5rjlYWVg3pgACvcUYr7KR/l0JHbCcLHGwAhp7tWT5NWKwDEU8cnQHcwXMmsGeSJ
         vQ8jI+eOrja3E7X5fsDbcqziaE3lPN4gE6/ZOceoOpdK435nP4ld+bgbLtvjzrt+8F2a
         PztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789511438; x=1790116238;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OoaUvNij8YmbcFsxH3lXmPdyT4LUwKvkwpbwWWFHxPE=;
        b=HnJX5SJVX9CVgcpyOramRi2orh0fnkgZ4oOAT5RY/wMwYtvN2OJdl2jd8DZAwTHOS0
         KEhY4GMKZkVTy7QUpv8ZbC+6o3gaGKkGdmdyWd8GU6L7gO1vfDDGBEhVXedm7C8I43VK
         itlh250CpyK5VG7noyP79Dh+hFJU5htHDNozad/msqw2hPHMzDeHNoLMSezCrFJpsYHG
         wdeGvzU7x+vFVGaaT4UWi+5ZFnKLThoCWac44lAt8601Ym5UtSpHAmIvEce0TZUqivE7
         p/+UEs10yx+F5a9bsOztuX4O26JKRAggG2pABO/e3np5GT/wPD0EUxz1Qw5YDQe5lz1j
         eLtg==
X-Forwarded-Encrypted: i=1; AKwUvBxONUP4po0/P0dPxxadyfFdv2ApNX5myaYb0NGu3xfwH0AiOuM4aXRbywG9YQuLAI5rx32tQ9g8xjANI5mr@vger.kernel.org
X-Gm-Message-State: AFuF++mob4PJnI2HlpfB+z6f0c5Ib0PPTQnQrZ9ynI5UAwg6JIlilCa1
	0PppxYo+r2b0jYj4Hr0D3SsPtCmuBfxtSFe+zN1lUz7uAmXs2bDjLajqnxeBG/v7Ki0AuXCVv4E
	5uf+k/NZR3j3a6VdRGEV8Lju/jIFPj+zWjil+9HE9JVI54LozXkd6GNhaKsuQXnKlUjlB
X-Gm-Gg: AYBFou3Hu7mvY6lqg0bJ5aouMtWJT8ClAFuLC1F3nxVvK+eC6JgLzsZqxZRILKHE+0L
	diYPH6x+n0TVolwEC74CkhmrQznyi9bi10mGZsD/MXGThpHHylLU1nMIuW68W7SZYzK6fbzkxma
	131UFxGES25Uiqds6P4Whus74vbdqFkcE+3BF27+KhTXXhiXh5CdM+tWC64qLzCdDeYZ/G9qPgQ
	2vmyDyDpwjzKOP2c3bjVoGXJtih9eexq7LuUI6o0qCUA0DC2Pm6fxjto2lgWdixVIEfIUFimld9
	YtH4yM7Xuyg8P4D04LaORsLKf/sSMgh5+Qa99Jh65xjUmW6DfgInb/Ohh92tAnvHIlqCElFmN3U
	qj81Qs+hHPYTYkhBsNpebMizhiII=
X-Received: by 2002:a05:620a:1a03:b0:939:7c8:78b1 with SMTP id af79cd13be357-93bb789cc86mr30104385a.24.1789511438287;
        Tue, 15 Sep 2026 15:30:38 -0700 (PDT)
X-Received: by 2002:a05:620a:1a03:b0:939:7c8:78b1 with SMTP id af79cd13be357-93bb789cc86mr30097185a.24.1789511437739;
        Tue, 15 Sep 2026 15:30:37 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm24618435e9.14.2026.09.15.15.30.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 15:30:36 -0700 (PDT)
Message-ID: <6266fd8c-d941-4eb4-bcf2-fbd54d093186@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 23:30:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] ASoC: codecs: add Qualcomm Tambora (WCD9378) SDCA
 codec
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260915165652.914893-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260915165652.914893-9-srinivas.kandagatla@oss.qualcomm.com>
 <aql-HLWq4NOh3cgk@monoceros>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <aql-HLWq4NOh3cgk@monoceros>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BdVNQbt2 c=1 sm=1 tr=0 ts=6aa9c70f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=ohbBbs68x0cw2nEFerEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDMyOSBTYWx0ZWRfXxw1VvtB1zBsw
 MZZNRIbGMPOuG7EsDbyuulUwY4ls4PtWvuGTYkBrfYY5ad2ZsjlguWF9kmyyRcRMZO4GZlXs0sV
 LNILkyKODQ407urgK4NVHE4YMj6/R6sINFTJIgu+BRWqU8mlWFaVk8b+HJYI9xQ63qcKt4XJd1e
 yekHp9JOh1K50hs99sl6tAV/nnxX5U+eaqvPbTPcxQjjycu6IvTGtAirFfvEJiTPA7HevYx5kbo
 mruZU5NpSNiBqdbuA/Au/n5GWyzYgtoTbkcXUGXXlC9PIy64U7JY7Ie8aWCWLmNG8TpIZtv7ifC
 AxYOTI6990WnFIuJpYX+dZyNypQQGdIhFvNEKP6LPOJqOC/UBVVN288oNZyRZOgk3udrmk/2Nm+
 vAy3mvX9nbDV1ev3rT3F131ENQ4yw2JudaJ4SVBxS9Yht742n44eNi1DtFWL4CmOqwI7iwrUMKc
 yVnuLiElL//89FW2JJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDMyOSBTYWx0ZWRfXw87oCq/eRlZA
 F0/s46s6zRzkpPmS9UUv9toyRuHXTjREPL4DGgCI8iUB0sYZ7+T00kbM21YBCWxc5XEBmDsZUKT
 J5p4uDf+dl0Qy+TQOWt3o+/lwSlki3Y=
X-Proofpoint-GUID: c11p9p0NcnuabgOPClTKEtcUNlsVNKHV
X-Proofpoint-ORIG-GUID: c11p9p0NcnuabgOPClTKEtcUNlsVNKHV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150329

On 9/15/26 6:22 PM, Uwe Kleine-König wrote:
> Hello,
> 
> On Tue, Sep 15, 2026 at 05:56:50PM +0100, Srinivas Kandagatla wrote:
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/pm.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/soundwire/sdw.h>
>> +#include <linux/soundwire/sdw_type.h>
> 
> You can and should rely on sdw_device_id being provided by
> <linux/soundwire/sdw.h>. So please drop <linux/mod_devicetable.h> which
> makes a bunch of useless build dependencies go away with it.
> 

thanks for the comments both fixed in new version.

--srini
>> +#include "wcd9378-sdca.h"
>> +
>> +static const struct dev_pm_ops wcd9378_sdw_pm_ops = {
>> +	SYSTEM_SLEEP_PM_OPS(wcd9378_sdca_system_suspend,
>> +			    wcd9378_sdca_system_resume)
>> +	RUNTIME_PM_OPS(wcd9378_sdca_runtime_suspend,
>> +		       wcd9378_sdca_runtime_resume, NULL)
>> +};
>> +
>> +static const struct sdw_slave_ops wcd9378_sdw_ops = {
>> +	.read_prop = wcd9378_sdca_read_prop,
>> +};
>> +
>> +static const struct sdw_device_id wcd9378_sdw_id[] = {
>> +	SDW_SLAVE_ENTRY(0x0217, 0x0110, 0),
>> +	{}
>> +};
> 
> s/{}/{ }/ please
> 
> Best regards
> Uwe

