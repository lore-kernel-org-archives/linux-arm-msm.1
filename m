Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793110064;
	b=HJv9XWPMAC6dOI8TLNlGhKUT62vn5HWSHIw3/LHkAcyaRnUdJq1lHbkiRUT9qL9kD5wK
	 afYN+AugeF5opB+apHeSuQ0bDk7RXT40XGghxj0VcQnIRCHToJAvkU/eb/zxW8YGtCbcw
	 CkIKPG7/om6HasMIqKdFem4ThpQdhHbJWz19k3k/uPDaOyEfSKMTR6XKZxxD+1DWCPDLF
	 FoeNIE2idEbyKMn6k7mPPXTTXPCIPnGnfzpxQPNpRa1o+Sl2x154FUpBAQmvo1g61Vt0d
	 Ka+jVrMf88RjQgxrZN0Z51j5Xc6rPwjuf3wQW3kpT3sG+s/RsOU+s+chR3UvqejQhLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793110064;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SEg1nya0PcPpSx0ic092fxlis9YBlwbf8B18X6+8KOM=;
	b=LkAe4ButmH+JFLaY7FvCWtAb0F+zxakxUfdlTY9eGXeEi5GsVfB2Gc1Ht/qZKm83C22m
	 WTXj7hEWMvHqIZVVcskzaOPaiRZXujNDlolndUsU/XXBKq7HlUCfOzksGOB45og2zI4pv
	 RRYsUc1IARGuL6/xIDqFgQI608y1ZXoTmPRl+913I6XWYduZi5C94NC74N7pOw1Jns5NF
	 8ax0Yq90NsskJyp3XlfWImEH5tJaZTXkQUeJEMCLMETaW5n1cxGHC/UTw/Ikso+8FYH+O
	 HqnsozhLQDWkdzwXhacNzFVMDLSY+n3mBfyYUJ6wrETe2QaY6JItrJnjJzrjo5HOeZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IVF9F3tT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g4ZetSjL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E15B606A31D
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 14:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E15B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IVF9F3tT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g4ZetSjL
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RDnwl23449400
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 14:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SEg1nya0PcPpSx0ic092fxlis9YBlwbf8B18X6+8KOM=; b=IVF9F3tT/2br9RF1
	ZDyeHCfQJQIAIImSKnbZjsKOzAo1fRhW/2s1P3jOVGnxtA78SSC6zOjDyaZddOMH
	uq3QJ8dGhxtnEc4Rv6aCpzowDm31YjC4/I188yC/M1CiEwqRnRZQ9vmd+CfuRT0k
	cWK+xQKXR8RBXF+mF9Y62C1etpqiOPLCUczIl295fkhI5ztW1cnv+B4hatHWZ1j7
	p+wE9R7zca5fHbp1iCsOpsTPbPZO6lHP5T/aiSr4GcKal6SmY9zULsUw/JjDizQF
	wb6G3NEno1rAnPykaFSv92N1PqSq0EOkPvfrzAhx/1O0rOX7G/T7JfxIttdaLAbI
	v010bA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjh91auj1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 14:07:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e49a1d3b1so671673485a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 07:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793110062; x=1793714862; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SEg1nya0PcPpSx0ic092fxlis9YBlwbf8B18X6+8KOM=;
        b=g4ZetSjL10e3k0psISk7JXT5DSnTiTgGdyNjw+Widq89urTCYXutlQDuTvaHz4Qj8K
         usTQysinUsn+Ah/JeZe9iaZvs7lattL7urH3iVGkLGCRUiaHvmueDWxv4e2tng0TJxV2
         ja7FflNeyxHDSSBxojstBHNkCUqy/A8m+hzDxcK39xHC7l6wRky2kCqG2tSn3kqUIMwN
         02cEie2j+IK9Z7PT5HBP6Ozryfd/NLu1NCc4k6+wXETAYXC1uJ4oABskE3+EPo63FeKh
         ZR0czinAXkoCZkCAn129gjnSTXVHBaQIdk8Fds3xp9cTIcLTkGjQfgiqLOlu8J2s8wzn
         CczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793110062; x=1793714862;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SEg1nya0PcPpSx0ic092fxlis9YBlwbf8B18X6+8KOM=;
        b=GnEjs88gxrqGtapTH5rmk8ZLuHzrt+kqZuymaYfvIcGwy5C8rIKRAYCTLEPTL207Jz
         aJQtaXtKGtcXe1hRDA62J/YbIMA0AFx3WJHAl+E3d88o5xXRMILL37gSeM8pPp88zx0s
         TuPlJxaKaj3srlhdF+oLL3QnpxfaG0JgxPY19aR5n3eMxln+QiyB4/0/NEX4vEYMEtrn
         rMYW1wcPJ7WWj6kJO7jIppQGOckLvPURclneb/cL9rKJtP4y2Ioonrj9rUW+k8Hps6Es
         bSp/oi1wCfjv2RYp8Sypk/JICfb4Cg0IhdYyLar7FmMsVZSFrd1FE346J8/BYrzb1bTT
         1Amg==
X-Forwarded-Encrypted: i=1; AKwUvByUbV6gSfRP4WZK7/q7LcON7dipD41URpREwa4yfiNhb6PDDOt7tFfz4mjM+gfXRk8vlL4EJc7RCeEVwrdo@vger.kernel.org
X-Gm-Message-State: AFq9FYIko0a0ASwa3REOFhQnyGuvupkbULZmcT5KBrh28nVCkAFAvBLT
	3GAo7qQeoYyjF0nJNyH1qSHsbj7jhBiDou1n+fz/HCI+lLH5PPPn3kY5Cld5s/Au34ZOIiVmauA
	wmSa2HPKCNJd10qZER03jgN2V6rxAF4jupbG8/q/Rw9TjqNdhmaH83wSSLAvc25QvOu+4
X-Gm-Gg: AYBFou1Ds3Z4WUxIc45DkjsCxK8r5M6iKVKfElHT37U/B2TBYaSfdj9+YQ8V6U4ZrmK
	hhvZAeGK+oL0xfW9Nna8xFPVB15OHGUuHai+IkIC8nqeA6RsZSG8slh6s+X5rpMHi3V2Fo+sjjL
	hvhTvdvvkl0MrTUvDDGq6tK+REGdM8HlxulBWZFojxOWb2UA5BrGlCTZZnFNXUbYIpOJz8SwWCh
	R226gs9FpVQEvcO2G85/kAIBZSw082pVlF0zE0oQsgmlf5EuCWmT8RD63K1+7zIul1Sa4m52GV5
	sMWywzat+ZiAQDNXy/gko7DGbAklcUC7l1ED1OHgLB12y5VGRAHmJ+OHHeQ8RIIihl3iIs8tQwo
	8WWbQbN1BXRrKSKWHzbMgy++AnETgPKM1XH/XJ5sXRUyeug7Y3SveSqwIst7W/EYC1BIlsnjQ3S
	c=
X-Received: by 2002:a05:620a:6ccd:b0:93f:43a4:a47e with SMTP id af79cd13be357-940ef8db9ffmr1657775685a.43.1793110061494;
        Tue, 27 Oct 2026 07:07:41 -0700 (PDT)
X-Received: by 2002:a05:620a:6ccd:b0:93f:43a4:a47e with SMTP id af79cd13be357-940ef8db9ffmr1657767985a.43.1793110060943;
        Tue, 27 Oct 2026 07:07:40 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6b49642026esm96803a12.22.2026.10.27.07.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 07:07:40 -0700 (PDT)
Message-ID: <b7fc002c-4c01-43c4-b404-a9599a938fb4@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 14:07:39 +0000
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
Subject: Re: [PATCH] ASoC: qcom: storm: Fix of_node_put leak on error path
To: Tang Bin <tangbin@cmss.chinamobile.com>, srini@kernel.org,
        lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261025081610.2675-1-tangbin@cmss.chinamobile.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20261025081610.2675-1-tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Bfc5-kV9seT065nrxLP25hbf-5Qf2gtP
X-Proofpoint-GUID: Bfc5-kV9seT065nrxLP25hbf-5Qf2gtP
X-Authority-Analysis: v=2.4 cv=TuxzFzXh c=1 sm=1 tr=0 ts=6ae0b02e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=R5C9hjxsAAAA:8 a=EUspDBNiAAAA:8 a=qifAAX_Yg6spbNOiTWIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1NiBTYWx0ZWRfX6bzyufSQJv5s
 FrfdYUE1w18x7BMCOCV7y1QRYnWVyYYetri00BtNTTyGpOrXwqJhZm5vSMLyChQdIsCEAHboirr
 SJwrnhpCfA7SSkxGFpF9UADkK0wtdrhWYTwXEsORqctxgM4TK8gSYNNMh/Oi6Qs+9wvGRfCcYeS
 0MBdy2C9rJpfMnu2Tg9XvKibopEnzm5cFhZ0r2DEBt6ztjzAtrEE4LdNjqSL1i1HMXIPzq58my2
 IeFVQ+1AjMWNtzIbcLHZevJoMjFFurINGTsZvxj7qb8qOJ9i2TRzldtlYVfh5hDO5C7dAkKrywo
 F0pffRdYWLM4fv+dy72roPpKv68gPAYw3vUZ3LAfVSj0X9PP1OtT1UmzdkgyrxeXvhHphCvSs9g
 ZndpV2e7MTg/TWVW9udcbVutXQ/NPuWGQQ+al4OcJhWqVua4rCBxdHy6k6LCjYs5XGmygE4hKib
 r6Q5i5jIbcsde+OVh6g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1NiBTYWx0ZWRfXzgKQf8V3JNi3
 cmOME7FsyHyNTuwnlPf6VaQV15G699RDiywMuvS3ChTXSJu8bcGXBhAljYvkkCs23fQxHT94a/1
 aqZiHQ+JHtNPHLUhH0UhyLIXjDoS6p0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270056

On 10/25/26 8:16 AM, Tang Bin wrote:
> In storm_parse_of(), if the codec phandle is not found, the function
> returns -EINVAL without releasing the CPU phandle that was obtained
> earlier via of_parse_phandle(). Since storm_dai_link is a static struct,
> the leaked reference persists. On a probe retry, the CPU of_node would
> be overwritten by a new of_parse_phandle() call, losing the reference
> to the previous one.
> 
> Fix this by calling of_node_put(dai_link->cpus->of_node) before
> returning -EINVAL when the codec phandle is not found.
> 
> Fixes: 79119c798649 ("ASoC: qcom: Add Storm machine driver")
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> ---


Reviewed-by: Srinivas Kandagatla<srinivas.kandagatla@oss.qualcomm.com>

--Srini


>  sound/soc/qcom/storm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/qcom/storm.c b/sound/soc/qcom/storm.c
> index 6b42fbfd2..6a42876ce 100644
> --- a/sound/soc/qcom/storm.c
> +++ b/sound/soc/qcom/storm.c
> @@ -79,6 +79,7 @@ static int storm_parse_of(struct device *dev)
>  	dai_link->codecs->of_node = of_parse_phandle(np, "codec", 0);
>  	if (!dai_link->codecs->of_node) {
>  		dev_err(dev, "error getting codec phandle\n");
> +		of_node_put(dai_link->cpus->of_node);
>  		return -EINVAL;
>  	}
>  

