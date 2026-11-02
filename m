Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617336;
	b=tHJ/rt8nTMWYZSZW+SjzQrJdCUjgLbmBpJK5fBAtbp+mezqBPS0vqIhTiEVLccYS2xBv
	 35GTS8FHXkf47+NrrSxWND6gwJd0/TkqGYfYksMpiKc7Pulj304UrDztfqkuF2cjOtuK4
	 b8mQTos3bObFXqGxhWA8tkYz7xX+/uIAbWz7rlbogFsUvjT9mnHZE31Moa+bLen+mghf4
	 xV+WwZpEYxYpbdIx41kE29GjyaR8Rg93XPAoNOs0BPwfg0ORBTAqlv9HXBt3tUGl2Cc99
	 8sJlfrY9YID03ld/zZU1YnEzU69UUl4nx9N2DKOc2i354hsi4aKlg1j//kpldkSoZWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617336;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tnBMgDIv1g4x+Wpl6HFNjTfqDD0V4317jb6jMDZ6D6Q=;
	b=aXxLopxUd938DEPff46Z1nLIkYrhVCBwHzcY04BMgOWafgyrhlIcTGsRb1sIpx7PuY5f
	 0nSAB4GN/MDBCXu02FkxqlNATMaU7eGpZHKUBAnxh+4SmhKOqgQoiAwhBWeAv50LPsAER
	 3IeweEzsNmlaAo3NcixBajNFsVyEAytbRHhbDtZWG0XMA3n/yiow9HkUP8Ml97jdF60Yq
	 tAw+yESjEBnxvnfQoBEizvLkx7xMvLauyECWKGl7AQ24d/JqCR0THqcML5gh3G6z+VScn
	 8H4ELKTkQpP4pV6B2dIYK4+DG0d+CLm3Fbpzh68tt8+rSNas2Rvd4ZlcDu3lTG/NXjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SncOjSY1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="g/uklcTK";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C72606A333
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 11:02:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8C72606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SncOjSY1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g/uklcTK
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29Am1l2362083
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 11:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tnBMgDIv1g4x+Wpl6HFNjTfqDD0V4317jb6jMDZ6D6Q=; b=SncOjSY1ddiRF4py
	K2uzL76deqOxOHfj7Ie26KEzOJ09mcK77hDIx6kEYu+xCB+BLhpzvvDwwivks7gj
	4NEXLvzudhRYxya2uJDMX/v/f8xHgLxsshtYpVouEzFC1Z6Z4HjbTrpz7xVuUK4a
	KOM1ethTaXiU5g9zpqZW74Xzie39vtUuh58tFlDSr6HqaMnbCn1XG/8gTeG/kp0i
	kxO67hQkYAvM5LPlaY0A5ivDt285qWbDGcsGVxzJHzOQ5j+Bdc5i0+JSnaZYH7Wt
	4ls7skwIuPzywjlyklaX/bYJw7WekxwoNI4SqdriTK81M5Afcst+AoUOqjf15RxH
	cRG9bA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8q7xgm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 11:02:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ae73921fd1so2448945a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 03:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793617334; x=1794222134; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tnBMgDIv1g4x+Wpl6HFNjTfqDD0V4317jb6jMDZ6D6Q=;
        b=g/uklcTKD/RrqBDs1Hf/STBoFitREMXGChqf4Q8qix76YlqWyBQOWcibObd0tZGrg8
         tRcNh64jIf3ZVax7LkHxdqC0EKRAr0VBY/bHlvkMSETBbf0Q2IdUxfvj7yKvPQoij0x+
         cvDb86EwjdjcVke4XmwPmZNjKkwDeEuqsY3j3BIjO+FJjMWp3Rc21NHcW+WIMznsOY3V
         lqLQWE5LRdgPbYg8oDOuLBIF0dnCN/FHQaXCGY9HD/KQXLNMAk6gcAZe9+s/RxHTTmy1
         nE5rW/SKinvyvXERNTbnAFFz5M88liAsjFbvw0S7fcXEOEGrCo9TY+i+634YzymwQL/Q
         MF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793617334; x=1794222134;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tnBMgDIv1g4x+Wpl6HFNjTfqDD0V4317jb6jMDZ6D6Q=;
        b=gAVo/QHS8zcE8KEcvtQBkYnk32PkZKMjaGKJhHpA29KXgWepSOUV1T8fFu03u/ep5P
         cUVuSM/QoOJLhrwaRw923GH/xj0hT2J8pntxHeFkh07UZRv2GGi9mMGkgK9u0CQRzsm/
         NCRpiCmi7TKE/01bn6O5PC82qF+X6XTjl2KPYs7w6/Y22cMNO3ZZ5AgzEyxHbNIKPCX6
         jgG6fk77EvMOaxkGxaZX0qBjdVJSytPswHBxLB231QqCijKRHcex3RDVuz35jK8QDJJp
         86yhFhCTPvM2ex0Z4xSIiRUJxnZkfQH6VlMs+5FylKGTWaqk9vWSh+QpO9E76wgTVeEx
         pxfw==
X-Forwarded-Encrypted: i=1; AKwUvBw6Szr5KHrIVlDoUazOIL5mcdncsPFp+7ODobxRGvux5a9vn3AdjHXXF78n2X8XKux6O1lZNE5dA19KCLoq@vger.kernel.org
X-Gm-Message-State: APuU4Z81G+XUGVCr7AfYqpzt4usj9Cv4aciq/6kZPIr+lj5yduVbdjUr
	dibQNw7AzsUysOfTCaNjej23lsvz1xy25BZv1uzinP18+F4bDMhe5KjnsjeVhc99Ge+Nh0MO9E5
	1GBN4OjiKvmsa5r+zxovcp2WdLioF5KwCdR7lTvrENsaA8lo2E4iAzThQcLO547gy1drV
X-Gm-Gg: AYBFou3NB1IzRqtu/wkFaJhHAWqcQthJdCpjeQBKE/5fSKdas1HqphA1RMJfouj94vV
	yXRWOWANUD2/KEuQH/3aNU/s617Ik/bDV8oi3e9eF+2/QAi1rIDwYfn7bL1YV6USBw/taOzgVAH
	dP17WmRdJwxcGn3jYws7+3waMnIyk1pt4ExfUGYBvYnFYETmsG2QezmNQ3sLpcmdSaGJRb7YW0s
	iWWrF+wnQ/SK6z63AtnoIfBJwYALQTflTBV9npUPmruMPf9gi50nCSbNzYWveP6NHnVP5X2UCxy
	UqmQVzN6jL/ziIrDDRTNFGktXie5aE7x+3Qm/VfzQvKIQo6KtnlQwiJAbY+a4NgKCc+DSAOkQLt
	6zG4SRVbJh9VjPoT2oKoViiHCqkAC+l1nbk9+bVXQaIEv4b0AhJBHSr6FmeDVUdu9geYxwNJdw3
	xABzQP
X-Received: by 2002:a17:90b:164f:b0:3ac:9ed8:f310 with SMTP id 98e67ed59e1d1-3ae8984da7fmr8539596a91.49.1793617333200;
        Mon, 02 Nov 2026 03:02:13 -0800 (PST)
X-Received: by 2002:a17:90b:164f:b0:3ac:9ed8:f310 with SMTP id 98e67ed59e1d1-3ae8984da7fmr8539557a91.49.1793617332690;
        Mon, 02 Nov 2026 03:02:12 -0800 (PST)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8441a5ecsm14215562a91.2.2026.11.02.03.02.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:02:12 -0800 (PST)
Message-ID: <e0e30cce-8772-4aed-b7c1-14c5e5090c24@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:32:06 +0530
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
Subject: Re: [PATCH v3] ASoC: qcom: sc8280xp: Derive TDM channels from DT mask
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261031082318.1146398-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20261031082318.1146398-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZLQQoHMimoqE-rPVvIa7vez19pNDJU4G
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MyBTYWx0ZWRfX7i2aO99PvM1l
 jTE4VnrvmVFYPVLzAkIPqCjakTJElWTK9fs/domtuYiP/j8MOJ+MiSwA77eb58Mj3FphKB2mrBO
 7Nk9B/A8hc2GCdwnVJZ+/OIHAcoATSo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MyBTYWx0ZWRfX0bwHIzkG+vhH
 IeDAC7KciEy8EX98W5yqVoFlesPl3ZE24yVY0Bjn1V2wMeW4kFxwRDq2NsWxnbn7k4tfLPN0mnn
 UZSvKAgwO9FFyYpuyafY/OV9g6q5nBeY4Wm7Y9VMcpRHDL+wYvIIT+wTVOlicBud1veNbVYsdwP
 hM9N2Y3Fyl3xQ35dQ/6PUVrcNWlEDMEcaac9ucJaBomiHG7KRRraRDyS0sR2ZjonWi3Je8qbRBY
 xIbFiKw13llv9ciJTc60quMTGNkM5dxiywJa/d5xkYOxpjyynDu/WhmqBsbRYiqQSvlbbG0XzkF
 WejB/A2OUdNqmwwm7BkwAWg1ZWsNZKvuDrr6+zOAiQhEHBu8tx83rkB9duXEn9vdnuFsMT/0X0o
 Vf1YSVyyEIki72okgo54JnyNkIsXyPv7qxvTHniZSjTJs6LfdvPXDi7dNfdBTmnv3b4PAVkg7Lg
 Z/TsfLHM15nQL5cc7bQ==
X-Proofpoint-GUID: ZLQQoHMimoqE-rPVvIa7vez19pNDJU4G
X-Authority-Analysis: v=2.4 cv=PucG/AM3 c=1 sm=1 tr=0 ts=6ae86db6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=q7gVV3EAPCriVcb_4XEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020043


On 10/31/2026 1:53 PM, Shawn Guo wrote:
> Derive the backend channel count of TDM DAIs from the cpu DAI TDM
> slot mask in the DT, using the same DAI ID ranges and tx/rx mask
> selection as q6tdm_set_tdm_slot(), so the channel count always matches
> the number of slots programmed into the DSP. Each board then gets the
> channel count its dai-link describes, e.g. 4/4 on Nord RRD, 6/4 on
> RIDE. Keep the default of two when the link has no TDM slot
> description, and fail the fixup on an invalid one.
>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
> Changes for v3:
> - Propagate qcom_snd_get_dai_tdm_slots() errors other than -ENOENT
>    instead of silently falling back to two channels (Prasad)
> - Link to v2: https://lore.kernel.org/all/20261029022340.591372-1-shengchao.guo@oss.qualcomm.com/
>
LGTM,

Reviewed-by: Prasad Kumpatla<prasad.kumpatla@oss.qualcomm.com>

Thanks,
Prasad

