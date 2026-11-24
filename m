Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795507678;
	b=LwbyKlwCsPCEXbmAykn7yPULNmQfQKlcjC+gYl7mHOe+7e5FpK17dYe/WiU9ZkiuLnFD
	 ssYWzTBV60ley0jTSGi7KiRpOgNyspdPASQVbJoMyLB1kCGBb0Tym1PETD6BBNpjQUVl2
	 Wd2EXzsj8LSmxbXe+YPszQDQyOZvfkCRbpjQ/CAkC17D1f/QAQmdKIJvTIesCzQM9Z+DM
	 XLNQxmM5geqqvN2gnjS8/ylMhDH/0J7AWrUtSLK5QT0CVJsITbicbKxxmjMsZhDqMuYjt
	 43/Ta05j+C6k1xEAopJClyMGT9OZy1TQvNir+NddYKKlurSygyCV7maoe+D7R6igQ6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795507678;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=84yhX3202Hm26D3ZONtukb3c97ZAJn5NF6Z/NQzpluo=;
	b=X9pqvayx9qZbv1AnfJqgCI9wQHxgJHb2XQoFPCNfeb+BNqcSJhuBRcvA1p1xb1ke/bs/
	 ngD+PzCoR82DKqPPQIxfL3kbwHJzzyAYHk0frKdZ0mo7nUJR6xFI6agPHjvTNN2gSZM6g
	 qdi5F7VZWp5YC/8upmp0I/lz74CvFGgYjPO5ygb5wIZJwP0wvhsFWVL8RwZT8bD5+3HA6
	 wteBh0RXwP2b69MBVZgrSXk9cP8U3dxU6+2O67RNrc0a8D4rWqMe1DEyTVGqmC1GXk/Vl
	 as7YxPBDmbrBZKmeQ6FvBsplkGWgLLXqKrnYjar0O+6tiX/VU9YjQDXSODnrledV60g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HLMGCQ7q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TahY9ZXD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8523C606A321
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 08:07:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8523C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HLMGCQ7q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TahY9ZXD
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO5m2Pq2848319
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 08:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	84yhX3202Hm26D3ZONtukb3c97ZAJn5NF6Z/NQzpluo=; b=HLMGCQ7qLSGC+CT7
	y3fCqbZTy3Hy7+rV0pTyyNja6XcXe5eljYzos8gItlAtsNnoRS6OBIiOhV1L75DQ
	EQa8KCz+nH1w7JNCqB7VVo71xpgqMX7Ru7Kvab7xDVWGdqdikObqIM/WPgb6nXjk
	QHXunjwoEzz4FtrahC20fEFUGLX+b39e17WnAqTCm2/36DwCiUuDgWZn88rirlyh
	Ym8fCz24R/4E7PqsprfTDpY7VZ+Ar1MN3Zc1lbGJMCIa1pcVPr/vbN+t0bIxjuhK
	Feh/6NvPkhwPgD3pRm/FIzjcsqwYqMcsNFSYbTWh5w8L9YSu2wL/XJPKeAEhEuSN
	oxdSpQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rh8g0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 08:07:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b49dd1e77cso1543674a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 00:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795507677; x=1796112477; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=84yhX3202Hm26D3ZONtukb3c97ZAJn5NF6Z/NQzpluo=;
        b=TahY9ZXDLYi8ptClYdysF51135EDa+hz+KYLpXODZx1x6X7z75AWzy4Gfg5mMxLWrf
         M49QHQ5yvSE+Mx7IZZktzZTeCqBJd41izDPx3gtwJ4oG/SOqyk9git17UbqmsKM1DCG8
         xG0B8N7EKorhP3F9xD3psMCDq5A5DuI3QJzTLvf01QNY9+4rf+dj5j1GvI+d+xmVcfEx
         TTavpVslLvD/gEa7pb88MEc2farTDHt7Rm9K1KIA+k785r3qf4+8+YS6XnBJDclVTHl4
         1VoNd1vDTD497jM9Ox7zjyxuYBzlCN4eIlXcpr7C4IBn3khP5ndirxDSVcihsusrvJuv
         jcFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795507677; x=1796112477;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=84yhX3202Hm26D3ZONtukb3c97ZAJn5NF6Z/NQzpluo=;
        b=Kym2qKerENP/NJHzdGTNyww9jvjCMeVjzjIyEoTDC2V5LGJFfEgHx8jA0pv0Wd6xBn
         BOEUC60deUfI8NPQz8txKODB+B34wbMMDFji/62DuX3zcAAhRYxeL8wfNtVByw/aQrzI
         0mMX7P4o3WipOEtOEZltQVtnc3ea6UOTY/Q1SdKsYSUdiS17yUOqvPJgmXPbFqhGFSP6
         azVxenv10jX5ui6Be/LJ+B3EYlCmnqv6Sa4N3okWwB2WM7IHkfpLimOkMIhmu6tMoUjM
         Hw2VK4xxeb5DFdns68jQdSKNODRQ4LVOClAl4p8sb9Cj64fN0038IcVaXRTL/lVmNG0/
         fjww==
X-Forwarded-Encrypted: i=1; AL+hErErxdlThItqVuknx87RMslwkAhWi44c2KzCtviW1qyYZYTyYzzdAjE1Ys2tdXtCUyYZk17cIUGgBKyxCAfF@vger.kernel.org
X-Gm-Message-State: APuU4Z9NaL+loXPaa1TSozsd6/+JQ/kR976QyCRPc9QobXmbzmkzBwUz
	r0KNw+Q5Qj9tC8/ewz8ZZqteJ/382Vv6OMj4Xl82iCOdXnAdtQIPri/gCRg2o3pT5DfhvmwMBfh
	ZNWM+hzHJkKEY2Ra/Ol6yKsTkE20x7tQ8GuAJ+YK2DoqQ4dehLKzWpJ/V2LhkIeW6zNT2
X-Gm-Gg: AZFdTZd1ZK4B+Hoe+QHJzYgYL/G4Msr82+qxRofomte6fLard/YkS1fgj0f0lNJ6qlA
	NBcaAxat7657K++l2REsqqEk5P5M0SmJob/zHS31YFNBjQyVVoV1db2m4HuoRKXN1ItVfd+Bo+8
	For/UE+Ikt3c4niuIHqiK3au+VS8mY2A1Ci0sE/x2OqZ/DILENqhKLIWqFfMfSXsTZoG8C6oiEj
	qzKNZ8KYfxy6Knm7cr4p9/uobH6VKWWHCMOKdEm4L2SL4OEtMBbGTy1TGacAppEQo8wXO69FzZ5
	6DvdI8h2IF7TTWDEyBfZKlREOKo8Bkyq+9OUYHsKJN2yzXmeDXvKwEnPY33WOQSg/qWmt1Annhy
	vgKz26IOHNw3PNoqNDWM5F/IcIOrMuuN4cBYLvuoMRqWuwK0ij5OB9nKZtQ+GGzpAARP6ubIjZf
	USNw==
X-Received: by 2002:a17:90b:390b:b0:3b4:1220:36fa with SMTP id 98e67ed59e1d1-3b41c7c27e9mr13197133a91.5.1795507677045;
        Tue, 24 Nov 2026 00:07:57 -0800 (PST)
X-Received: by 2002:a17:90b:390b:b0:3b4:1220:36fa with SMTP id 98e67ed59e1d1-3b41c7c27e9mr13197107a91.5.1795507676577;
        Tue, 24 Nov 2026 00:07:56 -0800 (PST)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d026d6fsm6563865a12.19.2026.11.24.00.07.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 00:07:55 -0800 (PST)
Message-ID: <d4e405ee-0e3b-453d-93df-dc216bdf6852@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 13:37:49 +0530
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
Subject: Re: [PATCH v5 4/4] regulator: qcom-rpmh: Add debounce delay before
 disabling regulator
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Saikiran <bjsaikiran@gmail.com>
References: <20261027-regulator-off-on-delay-v5-0-f9c3b128c6d0@oss.qualcomm.com>
 <20261027-regulator-off-on-delay-v5-4-f9c3b128c6d0@oss.qualcomm.com>
 <179460940931.590303.9395310796576570677.b4-review@b4>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <179460940931.590303.9395310796576570677.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BKkmP1QG c=1 sm=1 tr=0 ts=6b0545dd cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=2fnjfD3pYKcczP1kFF8A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzMiBTYWx0ZWRfX0YxbfHs9q3hd
 zrZKsLAhdyL05n0ulSvukDn1Yi9G+IKuNNx98YqW829VRpf/ssHkGqO8POMDN7Z1wRbMIY8gbAD
 wcdcTbowklC2RgVTvDHXJ/DSD5THEq0=
X-Proofpoint-GUID: OaofZbtfNXhK4i9rfX7RBqlww7JxgCRf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzMiBTYWx0ZWRfXwvVq2AqQaLxx
 o1Acbm0oQgd1yXWRcI9wGfa+rW3sqDdh4iAXEE5Zyz7NE0363y8OnFFUenIl788W91A5CeOdAYP
 aZ6W77dCup7A4NaId6J0XXGQDi/ISiAE7tDC3nxrkGy4tJqSUfdL4Y6Jdr/bejdO756czPWrV92
 UGoaphVwlWaQVPreZE2FlSpL2vqYuNRwq6yQHAmAWv2AuhDmN9OmY/vhA15YjRftcz7y464Zvtt
 2JA+gsqcWyVI/MlDmFA91ph2ILZ9BPgi+hmd9Xgse8dmxeJ47Kdg+6xwncZA12i8N1YNuTrANxK
 2YQU6hO9vQ1Bo2j1VDdglYX28og5q3LyUMWRKEW5mivrVNDOcnwXPxA3ri5cajtOXVweoRQIZBh
 B1RbtRuJXUf4mHua2NXRFgZ8kshXA+Dk6IrzwxURHRFCydLkOP5P615S96mcfjKLvwA0jMr5Lad
 t3WAD5l+IjUfMAS0Vqg==
X-Proofpoint-ORIG-GUID: OaofZbtfNXhK4i9rfX7RBqlww7JxgCRf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240032

Hi Mark,

On 11/14/2026 4:06 AM, Mark Brown wrote:
>> Some consumers rapidly toggle a regulator off and back on, e.g. a
>> driver that disables its supply on -EPROBE_DEFER and re-enables it on
>> the next probe attempt. Sending the disable to RPMh immediately causes
>> needless power cycling of the rail.
> 
> Looking at the code here this doesn't really seem at all driver specific
> - we could implement this in the core around any disable and enable
> operation.  Is there anything that really ties this to the driver code,
> or could it be factored out and available to everything?
> 

I think you're right, looking at all the comments now, it makes more sense
to implement this in the core than in the driver alone and there is nothing
tying it to our RPMh regulator driver specifically. I'll make the
changes to implement this feature in the core in the next patch series.

Thanks,
Jishnu

> There's also a bunch of stuff from Sashiko a lot of which looks valid
> but I didn't check it carefully.
> 
>> + * @lock:			Serializes disable() against the teardown
>> + *				action, since both make a read-then-act decision
>> + *				on @debounce_delay that must be atomic to avoid
>> + *				queuing @delayed_off_work after teardown has
>> + *				swept it.  enable() needs no lock: its only
>> + *				shared-state access is cancel_delayed_work_sync(),
>> + *				which already serializes against
>> + *				@delayed_off_work.  @enabled and @rdev are also
