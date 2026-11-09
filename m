Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794190122;
	b=vmJVOaCWhS6PhenuEKk15SXwetLv5a3BUQSZlU2oDDGevjn/IMv9ykK+YqrtkxYTpwD5
	 ZyE0tWZpdKR20EF2X7xDvLr7h27ib2ENZMtb7Ysqy1iSodLoRlwv4btdzJtdJUiV0iCtN
	 4MNGuIkqLK7Hx+1RN6DMNrBZYidreGIeMQmqi8JRHWDrf/h66pORc6siM8oU2oXP6M7bx
	 z4FmCu5vU/V/nsD1I6XEShRq/3v4bFzEvEWUcrMaMo8m3X4/iCx8thIipXquroWVECiuy
	 gW0spSj5CdVIUhIo83NdC23M535fpgclnbmeWNJdYHHDtKTL2Q0ChLyXz2hD/EUkLbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794190122;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gIsILu38RSpIB/VQtAXT+jlGCK+QgBbfByzV7rqh7Do=;
	b=noZwtfINaS1ZWSja0L16jDvuQC7drFh2EljgsBi/gDTLuaViUulL92d58Un2UEgEmqKc
	 TIHEW5Ej4pkEUjOmMDCtcVpAnK+fj9ydcUSOOm4zdKBi4brOQAgBFU2xAC0Ri+7DSDViG
	 fMx8MtHGJYzfiFuu0N6deyRRy0f4EDd6tHuDMgXNesIm/idrC98y6Ts93R57DznL0TxmA
	 4lYKg53YpPE9EkJK1h/0pe07h5Dt3CmO9S1D51sSOh94seObw50Ml7gLMjDcsc3zaceEz
	 sv3BGgGdQ0YZFvBPmnBJMA1hg1nwdfOaYvjcifiLEXO3udLepNvjA8u0fgzMEiAOGCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PV4VxcvZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kVKYN+Wy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37F7606A322
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 02:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F37F7606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PV4VxcvZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kVKYN+Wy
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A90Ifns1926642
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 02:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gIsILu38RSpIB/VQtAXT+jlGCK+QgBbfByzV7rqh7Do=; b=PV4VxcvZEc/NHdbF
	Oe6LhKn5icnqW5+Pd29eXIRMoHDKJgo7vqPhqzCjBKoamE1IyHesxWtw8WJUy4A7
	nZj0prCqfgPFPYjAqVJ6n+xedd9+mcLSUMNV4r3kBHJB6X4d62lKmLufjT/yU5X4
	E9ITpZu7Cbrle+Cb4OQ79RGZWppKr3/1mEu1YTjiXNhAaqSyReX+uvnbyrhXyNxZ
	XO965UFxP+TVR1AuYo/LaWFzh70zJxUDmEXSYJhD1uX4xfEcSPgGnPcNOMSa66To
	M1R1ED9Eo5NJjhQ1hu8aZHYF3/5+Ghw4ERO4WDr4nTxUHFLdQt3352KUDeT2+Njc
	/KuFVw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw99m2uv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 02:08:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0afbf532eso359255a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 18:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794190121; x=1794794921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gIsILu38RSpIB/VQtAXT+jlGCK+QgBbfByzV7rqh7Do=;
        b=kVKYN+WyJLt1G/VwfC3wzIjvEY0+jPA65TKXFbj3X0C8Em9Te/8jt7vH3AtCzgX8Hn
         S6n3+VvY4ky0aQSKx1qeLAtf11HgTsVxhS7LJXgqO+pY7H47YpAMM2JEgbWXWW3JJMHP
         zAcu0u/42NE9BtQkxiAEV7++wtHbiwRqnYzCb2MJRsDdNuM7D8McYyYt17V0eXHOF/tu
         JcVYhYhAUVoETZzUJ7PrImU+GIn3BtFTiaIWzbTyMB//oKbPv4cuyBIh2jAEpAK3xYSq
         9a0+hWGzyDZY4fBHkXSxbU62hffUqlwfG7TSGLZEl7y4PN2xKGC8GsruI5KP9aQYkiUT
         FPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794190121; x=1794794921;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gIsILu38RSpIB/VQtAXT+jlGCK+QgBbfByzV7rqh7Do=;
        b=FphScleAML7/ABwY8Iqvv9mzsEoIL/cmAi/9niXnDbwyVoFSeBvKMsDklfKIbP4qpZ
         oHqEvBa4aoYOmx5rIrxColBQ0rIZEZi+ORAypOHKVWKt0rPQBZ478uvLmm0DO/mCchUM
         tCXoqSuiqZXhhVsuY0TxdpnCI63Xyi2yWgTaSO/Pw6yA0YaAOjIxbfbU/Qx+yCVcfU6X
         iBRK6zyzfQKqv3jRJUlD1JHexJBb4gobsD1EY0Zsjc30+HusAld4u1t+55J8lqwaSc1T
         0NnQqjybNXZX8hb6XA06r5q0TznB1cA3MeWPSdals1scgiQneLCG4xuBpjM2OFXK6sw8
         Me3A==
X-Forwarded-Encrypted: i=1; AL+hErHNT+/v3icWlHlUx4ISX4L603K+sXopqFVYP41k7GkmUr1kO6nUs7l3uuadSmAKGpOPvI5dz6o3hcdamC5Q@vger.kernel.org
X-Gm-Message-State: APuU4Z8K6aa2Y5W0DhiJ/Z7MwLgo9ulekg4xRgTvRBi8p9u8Y0cvFkX1
	uZM1CkeEo03y1omy9tinnxXve5RlRkykxiobMzuy1B3pNokNhY6EGyAsWLICh/+iz9SgAYBpK/l
	byoBRbykxZny0Ysu51xXUyhu0bK2wKTkqI/l3X1/SbM4YGMrHfP8/LW4DAk6paNY68IfD
X-Gm-Gg: AYBFou3mBp0X/ajeRuHNTdEFrQ2S/Y6ZoED09Rd+42CLCZyC60CGjheX3CGYzXxXloN
	zV5fE3uEf9mICLF2OccHwDvmuzn95vGME/OmOhTv4u3+tFhE1GVEWCcbFnbba7FsDFeNLUBsFmH
	k5FqaLdVBD0uUMEQBNA2YEQCMg6bT+w4lRxoJT9nHhFuNxDXx7a7EMplguG0TkkmMoQPQWHACXD
	AhZRzCa2gDuz/jfneKjb9jd9WjPuJUga83KDxAz9b3upX2k4/PxUUUaQHPNx/akcanJ+hwEnHII
	9I/dpOz6klNHOcrNC8jODStPep3EFlnTon5kKfJz0qDcwHPcHMewHD2CL5Ovijs6txM4FsCk94v
	Ou2aETmmGn2tfWgnJicB9Iic/w52tOeC9fdFBXupbXugvme9RveFWOnm8hmKjZf+IioGHpQ/NHv
	CnYSvG9S1/jzlAcHQt4oluq5NjjDRW7khPC34Ug3LPi68N
X-Received: by 2002:a17:90b:4c84:b0:3ac:9599:a689 with SMTP id 98e67ed59e1d1-3b12d373624mr2158712a91.34.1794190120319;
        Sun, 08 Nov 2026 18:08:40 -0800 (PST)
X-Received: by 2002:a17:90b:4c84:b0:3ac:9599:a689 with SMTP id 98e67ed59e1d1-3b12d373624mr2158678a91.34.1794190119715;
        Sun, 08 Nov 2026 18:08:39 -0800 (PST)
Received: from [10.133.33.170] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1278918f4sm4779025a91.6.2026.11.08.18.08.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 18:08:38 -0800 (PST)
Message-ID: <5df6771c-a440-45cb-bdb9-ca25b42287fa@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 10:08:35 +0800
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
Subject: Re: [PATCH v1] driver core: Demote "Fixed dependency cycle(s)"
 message to debug level
To: Johan Hovold <johan@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
        driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        songchai@qti.qualcomm.com, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, Saravana Kannan <saravanak@kernel.org>
References: <20261106084034.1579494-1-songwei.chai@oss.qualcomm.com>
 <au2UzljzfMaiL7F6@hovoldconsulting.com>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <au2UzljzfMaiL7F6@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bUlEVqwlBZAhf9TBogTtD2OuPVS3utr6
X-Proofpoint-GUID: bUlEVqwlBZAhf9TBogTtD2OuPVS3utr6
X-Authority-Analysis: v=2.4 cv=CMq/zhrD c=1 sm=1 tr=0 ts=6af12b29 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8 a=wpr1R3xn-rj-rwNLJSoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=xwnAI6pc5liRhupp6brZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAwOCBTYWx0ZWRfXxqFUhMuP1jaw
 WOCjB9BVGblUkgbGul0mV4BCd+Q+y5qzPo83TkSwxPtERFmbekvmF3tniBPyZPggwwoUM2EfKZv
 35wme8V6ORr9+jhRrF35JeLYOcz4Oj+NKWJMTGa/E/Vx5UPHZnmuL3r1srVFSTVwt9wXV7N5lwr
 KWx6JXmossXrm+PFhUQyh6FvAqkoyHziwPmVsbfnnD4YFr0ToQHsxliV4aRsvj0RXQsulkILAbm
 tWvKpRpTle5S2sb441gPQC8tJX4J48eDFdaX0FhSBqX/7IIGTHAOfaDkoAPJhqV5xy/0Mj2V48o
 KzGWU5m0Aazwd96qi43ixJT0J9Ao2P1mvU/38XyOwrkIxkKFQw6zPdjFc+BKT46RiuiyAYpn9uP
 fA3EWOLFpND+khG85Q4EVYqmtTgBetr8WIpfLfHDKfCMLZdpNCJEMGl0mUjHNq3b19fuJFZWjrE
 bzVpJNM+SXqJw2xerQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAwOCBTYWx0ZWRfX6OY9CCkVzS/U
 sD0eM7avSQap47luWUxzXvX5ttQ5FZo63idNNZdm7Yc6mW//omAOOmTmbzdUnpybNVYfiUlpUcw
 TeCNXX6sMdxPr8f+HnZcs0RgjPAghD4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090008


On 11/6/2026 4:50 PM, Johan Hovold wrote:
> [ +CC: Saravana ]
>
> On Fri, Nov 06, 2026 at 04:40:34PM +0800, Songwei Chai wrote:
>> fw_devlink detects and relaxes dependency cycles automatically, so this
>> is not an error condition requiring user action. On complex DT
>> topologies (e.g. CoreSight), this message can fire for many node
>> pairs and adds noise to the boot log, even though it's primarily
>> useful for debugging. Switch pr_info() to pr_debug() so it stays
>> available via dynamic debug when actually needed, without cluttering
>> default boot logs.
>>
>> For example, on sm8750 this produces 125 such lines in the boot log in
>> total, 80 of which are CoreSight-related, e.g.:
>>
>> [    0.057190] /soc@0/funnel@10041000: Fixed dependency cycle(s) with /soc@0/stm@10002000
>> [    0.057211] /soc@0/stm@10002000: Fixed dependency cycle(s) with /soc@0/funnel@10041000
>> [    0.057229] /soc@0/funnel@10041000: Fixed dependency cycle(s) with /soc@0/tpda@10004000
>> [    0.057249] /soc@0/tpda@10004000: Fixed dependency cycle(s) with /soc@0/funnel@10041000
>> [    0.057254] /soc@0/tpdm@1000f000: Fixed dependency cycle(s) with /soc@0/tpda@10004000
>> [    0.057260] /soc@0/tpda@10004000: Fixed dependency cycle(s) with /soc@0/tpdm@1000f000
> I reported this elsewhere a while back:
>
> 	https://lore.kernel.org/all/Z6t45aOGDkotqM4Z@hovoldconsulting.com/
>
> Are you sure it's not the coresight bindings that should be fixed?

No, Johan, I don't think this is a Coresight bindings issue.

This is the mechanical result of the standard bidirectional graph 
binding + fw_devlink's direction-agnostic phandle scan — it will appear 
on any SoC/CoreSight topology using the standard binding, and there's no 
alternative binding syntax that avoids it.

>
> Johan
