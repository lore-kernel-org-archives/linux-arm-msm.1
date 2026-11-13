Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794545527;
	b=JGcokGDEx7ksy/7mimxxzInqBhDtH0lOrvYFg/ktkShUobSLOlFPYcMHYm6ijliSrjsd
	 1SSpvK0M0+LWPNpxZPrnVnvN472WJA9gVjsdfvHAL/De5sgAHxVAS+h7JSeutTHxcW9Tr
	 cZ57/H636qFYoAHKJXgFymb0NJ/AkErCOBShRF1QfQtkz+EGZVNwmqZrCYkQPREnA7+wQ
	 a0en2fq6ILFFr9JRZco10VkubugfUvhnkPmFyswt+B6AqW/Bdy7wiZJEXZ95xdXkJ/klI
	 B5z1DFq1kb2vQ/rLTNvG7PaUs+nqFD0YDpEhzCA7IfLaanblKMMT7CUbFc2HSmQTZFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794545527;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UMrXrqjcsDJ3ihciM+V6CPHNii9aPk5xl4qMC0+9WnY=;
	b=FVMZnTLF82jcsF7S9YaB6hIqZWZNNcFmHXbQe/4L9oMbQK6/MRYTrqPM/Gpu7mFKYN2B
	 VgqRIonFI6BhPelkEYs6sqMoMBYT2izE1A6bSqyx8+ZCsOGtGMLoAWE/2j2mjVt+hV7E/
	 ttEVhTr74kDv87BFC47QjDpOto+x9ablqsywDv6Xn6hREvZbyqLIbgmNu2wQ5OgN7MIog
	 YDqMnh4t+AM4P+3Lmeg6RDDkW9TlYvZUWhTJvMhQiAhEova1la9qqJ/cuelBgl4fS1WaD
	 Z45fzO5fjThx1J5/H++dhM0N8nhESy8Bxvr7LYeJgt4brqF7NzX00Fs8bj6LJPKctng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m1uMajdG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vek6tlS1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2C3606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 04:52:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A2C3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m1uMajdG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vek6tlS1
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2K5I42843296
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 04:52:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UMrXrqjcsDJ3ihciM+V6CPHNii9aPk5xl4qMC0+9WnY=; b=m1uMajdGfB8yNmqF
	Bv6eb/e7HDfPOxU/G29prAYNpGd6MNvArlxR+mYcCDGDpIFi7s0oJPb1y437KXj+
	twmqPirPxPyhnYKvCzV+yuAab4993STXKfVw6grkwIjPPDYR0U5Q6w8B6NWdiFU6
	8mNbH/JWVuFeDnngEkNj1eSjJkE/Kdo6db4kUuADp8WL7VECjHhEON/OwiTz7z86
	WCd1XFUNkvv0vYrWo8aL9TBvMCj1cbJhXrThDa5sQQo8hXTFXbiAYQGiV9kgz2kK
	TXeosIb/4zNRoBLNdR05/ByEqWorjLDydZoAawNlCOU4AR7pfMCijbQ7mcQMEt7P
	Vy/Rnw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwan4up87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 04:52:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b175a69ab8so832962a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 20:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794545525; x=1795150325; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UMrXrqjcsDJ3ihciM+V6CPHNii9aPk5xl4qMC0+9WnY=;
        b=Vek6tlS1ODhMbTc4sWOHoxzoJy43Kapsn26KoJ0rHOEx+7KwWVqSKqYGYkyPSw6UTC
         Dj86Kna2qw3SooC0ISeaY9xEOKsDattxDfNcmiAGJ2W/qPI5q2mqvTbVDXKe5gv9KKFz
         vTVe/LsZO4BJ1pUONmZpmfRqUNqcDLzEUVv5RbjqCGHmKfBHH3xMQ3hMoRlF42INbl0j
         G+IZm8mV6unvJ4QgFHg4/SDP02lY/a5q5Rnpu7JVKuoECeF3pqZPx/GpBs8s5oiCAT5U
         O6Iqtygv1smaam7WwDVhnCEYMUynPiyzRsQnwhxGjL0KOMA26vrE21eAtElK+MTExk/x
         qIZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794545525; x=1795150325;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UMrXrqjcsDJ3ihciM+V6CPHNii9aPk5xl4qMC0+9WnY=;
        b=e+lZdfJ1/fTvhvzcOOGK/lcPcnpAZmx99tK4iDVSca9ZUau1OynSOxCBlZ6wu8FJev
         0K42HXzlsJUMxkhKUeZOtzj0DmZgMgTNDudMtwl4/aYTVvUUOgcFYuVTlS8XShFp5mcQ
         TfrJLd/Rp/bV+EsFlbkR4iDbP+cUEIHzPmJvKSSRdX05HXOdgAkskh5hkOhL3+js8un2
         pPn5CR6zjy5XA01B/vowGeNGWV8KW3/EXfJ/oNdzOKk4VZHMCLCiYJahbItvXGU9vvGx
         kDB6AE4aMGp9eu0u1BLkS79V9eMDCuAIYc2Ok9m3RLgt0FCQh3nLRKeIq8cBiqRjpP7I
         qvIA==
X-Forwarded-Encrypted: i=1; AL+hErHzS3P0A08jQSlKbDqrNtvxtH6NuHaJxxy30zwJO7nAIkiVnpLp/U1KSmni7AyDMuFBHCa52vVe6WIjCOnk@vger.kernel.org
X-Gm-Message-State: APuU4Z+JqSjZtIL8aJVCD6WVWZenIiL+PRDKzsx9g0N9tGeyUjH3XN6O
	3RuzNNs7qZ40p7dpzp6TtPfOAbEC8Q8nc/4lLxUCxdRC56GM1bSKU/OK0m4StfHBSfbGqw8y8mF
	PraLmkCNeTGX45Lvw7cilywdYNvO82jNbhUJaXgS7pYT1648kBUh2tO1HxEcsZ23MLDq5
X-Gm-Gg: AYBFou1MfN1YglCFxC415QgzO+lEKmnEE2okPDH8U0eXyb/cWDwQAX4jA+3/TMtJ8Ki
	mbgdExMNWPHNbykWWoYRom6W3IFJnzvlc9rOpUnr/9rOlBIdYAlRPvUYLcKVh9IiKrYe/1I2jqH
	0Qqbx4TSG93/kbRHmBznW3RWWMlCxhQ+lowFRXnFtn3w2zCsFUvSehPGxB6OYyWgm3BUYMbWDwY
	EBpwJ0GN041IHFBE6Hvg6QnlwvzNZizKnzQzBZrDVPecUdg8904mtQDLuFb3IqKNu4/UiE5DNyB
	+E9OFpVNfcP5qJ6h3N6RlifjDrBxNkoOYfXZmTCdyUhwxl9xK2X9hG4Lny04QS/ssMUmaLnT+x4
	i0+ax9Hr3uFukqPK8CUIWSBvo3A//pydhm9DpE5bf3nEkggtW0CvCBlip1wKlLg==
X-Received: by 2002:a17:90b:574b:b0:3ac:b145:8f4 with SMTP id 98e67ed59e1d1-3b1b0cc9790mr1123862a91.41.1794545525010;
        Thu, 12 Nov 2026 20:52:05 -0800 (PST)
X-Received: by 2002:a17:90b:574b:b0:3ac:b145:8f4 with SMTP id 98e67ed59e1d1-3b1b0cc9790mr1123826a91.41.1794545524150;
        Thu, 12 Nov 2026 20:52:04 -0800 (PST)
Received: from [10.204.79.100] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec63b9bsm2524494a91.12.2026.11.12.20.51.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 20:52:03 -0800 (PST)
Message-ID: <8d30551c-38b0-4f4d-a532-f574ebb5373a@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 10:21:56 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] phy: qcom: qmp-combo: delay Type-C mux switch
 while DP PHY is initializing
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, mani@kernel.org,
        robin.clark@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, jesszhan0024@gmail.com, sean@poorly.run,
        marijn.suijten@somainline.org, irlied@gmail.com, simona@ffwll.ch,
        Saurabh Anand <saurabh.anand@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        quic_riteshk@quicinc.com, quic_vproddut@quicinc.com,
        quic_mkuntuma@quicinc.com, mahadevan.p@oss.qualcomm.com
References: <20261111104434.2222182-1-naidu.nama@oss.qualcomm.com>
 <20261111104434.2222182-2-naidu.nama@oss.qualcomm.com>
 <xby27hg6ajesijmdclu7f2sa2swv4ednmokka2pbn7uaufm3za@czdij7j2qcml>
Content-Language: en-US
From: Naidu Nama <naidu.nama@oss.qualcomm.com>
In-Reply-To: <xby27hg6ajesijmdclu7f2sa2swv4ednmokka2pbn7uaufm3za@czdij7j2qcml>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rIMkiHi9imZdN9wRTucbuzmiXPLS5dwX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxOSBTYWx0ZWRfX5MaDkm7WlOin
 WMaUq2buM4xwk4sQZZv6LwZZiiQwYB6ea0TLfsmzjIngT2UfP0bApCF1FOdQfQ08qE4dc2k0TJT
 uULV0wBPS5BI9ApR7Fxh6bxUM77HblE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxOSBTYWx0ZWRfX/uINbDhyN8k1
 XGMxYgbtOI2Trmh3UcuQHSpcJSw/KNgL7nvxeJOxRanee2AF0d2xTyZ8nawhAn2EaVWMU9vYLfC
 FOQxkkLFP8P8XssAxzjfSv4o/JQR9cMM5FhOeurVsBmodW0KXCUpw3rCWyQVkXY+KAbXMp1w9mD
 OeGSyDeFjJmf4EiFw+OCNlX/YFV4ZgC6rGLN+oKGCbQL6a0IrKFnkfZzTFAIZcjkq5ELRNuKz61
 GOw77LVHgF3+U51HD1f3jCz5a6ldWa7z5hHwBidm3wgnUQdFsYfJ0Tot4A0E9VNRTS1sahDmUTk
 iQQcR0RpW+LFejy7GjUqfmhWTz5uxU7C+1/Sk12QwSKqelz45ra7rhqropA6e6WEchA+2sCfIQR
 3RKMosGrQJhdfwnJ229+6UwsU1Hlc8Xf/bNekdsKfoeZUA7sH1enkz1YfeDNgTdXBQv/aXrSOf2
 dwpNFTJS4WQpHhKhr2g==
X-Proofpoint-ORIG-GUID: rIMkiHi9imZdN9wRTucbuzmiXPLS5dwX
X-Authority-Analysis: v=2.4 cv=Gd+CDgXL c=1 sm=1 tr=0 ts=6af69776 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=GP3zSRAhaBPBpq4jRjIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130019


On 11-11-2026 19:36, Dmitry Baryshkov wrote:
> On Wed, Nov 11, 2026 at 04:13:53PM +0530, naidu nama wrote:
>> From: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
>>
>> The Type-C mux switch guard only checked dp_powered_on, which is set in
>> qmp_combo_dp_power_on(). However there is a race window between
>> qmp_combo_dp_init() and qmp_combo_dp_power_on() during which dp_init_count
>> is non-zero but dp_powered_on is still false. A Type-C orientation change
>> arriving in this window would proceed with the mux switch while the DP PHY
>> is mid-initialization, corrupting the PHY state.
> How is going to be handled then?


With dp_init_count check, mux_set will be skipped.
>
>> Extend the guard to also block the mux switch when dp_init_count is
>> non-zero, covering the full period from dp_init through dp_power_on.
>>
>> Signed-off-by: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
> Naidu, you are resending the other people patches, but the SoB is
> missing.


Sure, I will update in v3.
>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>> index 61d8b7a5ce8f..3f93043f94e5 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>> @@ -5163,7 +5163,8 @@ static int qmp_combo_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_s
>>   		return 0;
>>   	}
>>   
>> -	if (qmp->qmpphy_mode != QMPPHY_MODE_USB3_ONLY && qmp->dp_powered_on) {
>> +	if (qmp->qmpphy_mode != QMPPHY_MODE_USB3_ONLY &&
>> +	    (qmp->dp_powered_on || qmp->dp_init_count)) {
> Can dp_powered_on be dropped then?


Yes, this can be dropped.
>
>>   		dev_dbg(qmp->dev, "typec_mux_set: DP PHY is still in use, delaying switch\n");
>>   		return 0;
>>   	}
>> -- 
>> 2.43.0
>>
