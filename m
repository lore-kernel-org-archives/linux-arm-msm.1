Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309963;
	b=aJlMEshIyje3bQ7+vxhEA9LT/1sqbmLcyKxqvrMYtRVYBzg28QtrZyBlUOdI7h0IqvLO
	 0XNsm8yptB9F6pPsMC2MvYlu9rvLQ0yIDlELgI/CWMblos1uBtkmsCItl8iTQOGjCJHPf
	 I0jep2OZieBQNXQugvwmwUqatzGMWBacZ1ps70f7LpJ9QS60+Kq04+iLtUIWYIcrr69eK
	 ZYDEodypA1TBK4y/sZZ+wVtTgQaGQiMIJJzqrBH9Uxoq3xrxDX6jPStpdCVvO9abbhrJX
	 tJPRG576oAtbcLt1QxyIwTIIgtO0mklZKNYoFjPgKJGCkO12hqJPAzIZqYxnWQ5HJ8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309963;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DFIbWd7oUG0ljPJ7AJNbkhIESmFZoRW/9paFOujjb3Q=;
	b=KF223kYVUhIBIwImVpHzCS0Au7camDqpu6uQC2XTN7JUHN5yAnyG4vpbXr2QkvdGHGpo
	 xub9YoTJgriFCYZH1JytpUluCmJEDX5FTE2poIrglFrbSYipyh+GqZFs3t9BGbzKenyg4
	 p5tr6d65UBoZL27Zsot4a6Dl89anK9QwW/s6uxZB+3ofmIQu+Nma3OxrDDdMdSmbXUBBS
	 v4tSsaAzNTsF0Q1JiHTyk4osDllHKM9+Gr8CLBgXlLvZqS5uDBws/zM0ulaw12nKjsNNx
	 Vm0TgVQa7UqOOmOClQgwKNqwDYlOW2mRcA39AB4+QxGMK0/L5ln1l9VFKu6LETniFFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J92lIBLz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hMMXIjSC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA83360A260A
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 11:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA83360A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J92lIBLz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hMMXIjSC
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABA5CC3196122
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 11:26:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DFIbWd7oUG0ljPJ7AJNbkhIESmFZoRW/9paFOujjb3Q=; b=J92lIBLz7pYKGw8I
	gZYjbGVL16cWaE8Sz+HU0uAiPYgVwztHHmPRL2TKDdY1nIehM3EJ4hYL7xLtUqqV
	/5NscAeXvx4qccy0nmqKQTI4bqhuU25c8v+jW4OxoDjmTBeDbDaEn00DRYOZa4mO
	dZpftPY/ClSCL+wHZ53Dj1NDQxfnc8UiDGar6i2ng+XCorBR9HTh3N9ZofF7T3M1
	tPEAh/nGNmiL0cxsvxJtByDCPF2FpbFpBUGfoXYjCnxdSljFMaYsSrcJDGUdaVcs
	qIxQ50h4OJul+438na8X5PJsMOHEPpQCbix5jxvvSKh2ULmO2biLNVUiGESYw+s3
	g4ZxQw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv03crhug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 11:26:01 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so4655585eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 03:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794309961; x=1794914761; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DFIbWd7oUG0ljPJ7AJNbkhIESmFZoRW/9paFOujjb3Q=;
        b=hMMXIjSCvArpbAVB2pG3tviVjfF/VMqStvKA+u31AUt8Dhlejv+bfF0LRzAJ3gx93U
         HyOS/mgKmNSQAbGkqlEMPthzkBxg8wFuIVTP+2jyMRKZViv6IW9gmzOTavVXwRmpxorc
         5YYbR6ORP5kkB8MI5E8iWC/cn2qJk+8C8l8cVYEy0DUIbjc8Xr9HykuEpkARKlzRR9qy
         rlNBrB+CgqGQUeRXWUsB2sK/bZRUBW2iSXOpZKF0MAiKf9raLDeDNKCYFYLFFjr2noiy
         dIyBlt2sbDB5VW9vVoGN4ck6kJGmcTlLbJdYSIubW2TsbEvo+tDyD4d8Egg2K0XpFUdE
         OYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794309961; x=1794914761;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DFIbWd7oUG0ljPJ7AJNbkhIESmFZoRW/9paFOujjb3Q=;
        b=unJjCMVEh5cum99BHkYqz16gB41ddpnTQ4VYb/sZTDS5vomqSh4QZQ87d3vu36rbFq
         YHtQ6BoYFDeNKHzksyLX/it75C+VyT5iJozUIaudqkkbjMngb/TRdI3YIPPjUQmFQcx4
         VFDpUZ+wrafIAmREKT0BrrQUCYOiQ+1TGpAsvGDAN5n/Gcsq6X47QhU6h2SUefTo72zu
         +Cm7prAA+0jQmtXBXnEWb9J/rmranJtN3VoLVtk92ukNYPVUEfrJbM1xG4BP9W75ayIv
         HLc/VJMf8dTS04kSXfhBPxfzuGSHUfx2d8LcZvDErWYXa/AgCWw9WVmEZNqYLB6FXcTY
         ifwg==
X-Forwarded-Encrypted: i=1; AL+hErEIGCzxw7M6/xqK0E9+NyalakRSwEMTr0v4Kw4xeGyRy3uAa3dhq+xC11pVHNywD1cAqL3b7JMfCnJxWwh3@vger.kernel.org
X-Gm-Message-State: APuU4Z9uem8853U6ejoUfTOc/EBkjPuUEGVpijSqx5iRdaNZQfrtnTa4
	dCuT+B+S4Y0iVGyl21UeeRmSIc+bFgHHHqWt/8S+a097g/qAtK7XoBveLFYhchh2fsPGItIsfbx
	D5HzyiR+kxSt6umgngczSfT5hzxeLypCtWcDzJFAnL7quEP6yaO07YiTDDugjoFdO9BHM
X-Gm-Gg: AYBFou1CO+qsnLHFgplsUqph0bYVOB3bCnhiHaxRSbZLuBQE9R2lOlOZviWqhFuqL3o
	jfiLijHGIgAe+Ajzbw+ijzEyNcBTFiVnVeakqslRuBvcRPXyLiYvg5elbqMuTZgSvG+Gb5fOIIQ
	pTjkhkLhrjylygfJMgiRKLc+VVJQUcsrswBPGkD8jxFrvP2Yh+Y8+ci+OPIgsDuSVn4r/Qb5nyJ
	mMEl5HKlvVHkAXsD/b/Qg/CnBCxYTz4xBCZE0Q4k3zmSxOT376AS4K7rNvyD2aompc536n6X9Nq
	0RmCM4x36flCu7hkRJXCas0V9tz4/aIeDSTC1XIBgi+59pDy1BbUzTJYhvDwjONInj8u4I7PsGg
	8tdWs7OUIeeUo6Q2Xinplg8Y56/1hapaCZNQrqUyekJPWjCSe1Mxq301vrbFTsUv6WVIvGOJKNk
	aP
X-Received: by 2002:a05:7301:6194:20b0:36e:d060:8bad with SMTP id 5a478bee46e88-3751c53edd5mr3132146eec.5.1794309960549;
        Tue, 10 Nov 2026 03:26:00 -0800 (PST)
X-Received: by 2002:a05:7301:6194:20b0:36e:d060:8bad with SMTP id 5a478bee46e88-3751c53edd5mr3132114eec.5.1794309959917;
        Tue, 10 Nov 2026 03:25:59 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306e3sm6930570eec.7.2026.11.10.03.25.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 03:25:59 -0800 (PST)
Message-ID: <65133a8c-7b10-4429-b870-62799cb50d4d@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 16:55:51 +0530
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
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/6] dt-bindings: media: Add CAMSS device for Hawi and
 Maili
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
References: <20261106-hawi-maili-camss-v4-0-d528c7a797b4@oss.qualcomm.com>
 <20261106-hawi-maili-camss-v4-3-d528c7a797b4@oss.qualcomm.com>
 <20261110-mindful-snail-of-business-fa211e@quoll>
Content-Language: en-US
In-Reply-To: <20261110-mindful-snail-of-business-fa211e@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sv0Afs2WMJzTcQxHWtzgJwaA6F2Urpp_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0NSBTYWx0ZWRfX7pvGBYX6bnwe
 DWfmonS+hG+OKvzfwwQ1v9dkrtOoaFggSpClTjJRwKoPvFrxYUg/nwGhARDYcMoSrsplnxNoUvB
 wEIsLpgIBkM3qWFS0fIoxuTEOD8V0LU=
X-Authority-Analysis: v=2.4 cv=FuiQbGrq c=1 sm=1 tr=0 ts=6af2ff49 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=tb7J9fPpy6OZh8FWujQA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: sv0Afs2WMJzTcQxHWtzgJwaA6F2Urpp_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0NSBTYWx0ZWRfX2l0Bo6Dz1wvo
 QXuzvyfYXUCpBLmb1mPgYgEYOrAbAeeMqetaY1zbgBPjeQban356uww0qiyaLej7F3Fto6cX+sG
 KJA8/r3Kl8oXhRqaM9U0IxdDd7g6BkUcd/coE/FSZgYdryUKSKrWC1Foj3NnohOGhr70ZOqPXZ+
 rXsX8h4Qnl6MujWedM0A9hidaMqOaGVmfogB9LmmfjcebYwRKi9a+2jDpthAfAKvnONF1JbUEP/
 KAoWi9x16O7ZmAsyc7PM8ocK6b1BOKGROhG+KhLjzdeEHK/p+gx/EoddAwh+wc1fvX+qseDhlr+
 l/hb5v9LV4UoFzhAFoTs8lBva7e25e9ZJLaiCKjDXBYFT/3upAUT6Q5QgjSBDF6qIpSzGw5d9jz
 U3X0r56vumglUElK/q1rOrI46otUpVZaHX9812RR8DPu35eqvWs8Bv7FzdlfxQ6gPRXor0xZzfM
 lpDyJgTHSB+mnonXu8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100045



On 10-11-2026 14:58, Krzysztof Kozlowski wrote:
>> The Hawi platform provides:
>> - 6 x CSIPHY (CSI Physical Layer)
>> - 3 x TPG (Test Pattern Generator)
>> - 3 x CSID (CSI Decoder)
>> - 2 x CSID Lite
>> - 3 x VFE (Video Front End), 5 RDI per VFE
>> - 2 x VFE Lite, 4 RDI per VFE Lite
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> Co-developed-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
>> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
>> ---
> Amount of dependencies here makes it not possible to apply and b4 diff.
> I don't even understand why PHY patches are dependencies for media ones,
> but if that's the case, then this must wait.

As mentioned in the cover letter, patches 2 and 4 are for the PHY maintainer,
while patches 3, 5 and 6 are for the media maintainer once reviewed.

The PHY and media parts are otherwise independent and can go through
their respective trees separately.

If this layout makes b4 review harder, I can split the next revision into
separate PHY and media series. Please let me know if you prefer that or 
existing layout.

-- 
Regards,
Nihal Kumar Gupta

