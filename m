Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008821;
	b=316mRSpUWs/1VHGxPgRsmWOuf5xbEOJkXB/Fa3s+/VSnvepZ89kYZtyh1LD/Cupa64jo
	 ev/xUgxwbpFnEb+NncdNW70Rc0WZw/DFebgIBqFx9vbuZKI+zOcsSoPEAOcdpEQ/Wb4Eu
	 yXEwj9DMqiPkRnj7jOyJW6IHBVg0yhWDa36Js+MHJcebiK8r8zng7pKosKy7pviDcvKZf
	 V015JvRkPth8okjC40tdm81Ak3BhBVp1klGKy2ySXlbM73++bpfY8BfcT1x/qmOBcEioX
	 9Gzu6qUwqmQaqqThEUfTdMVoN3FDgJOn946XS5QP3zhJJX7oI9BLiG5Rdt9a7km91aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008821;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qwsz26b0tZjqhoYLPK/FZwU2WFoITBl0s4nEjxKpcLo=;
	b=qL4NFKITdBm9nzvCteSaJglvO1OAv+qxYNSiUewRpPot8hd1tajQkt6YSUcQKV5O8Y4C
	 AqCwKzq8KUwNNipLWshZ4wpZMJN0F0t5ReGtgoRf8u0EaYAi5aozURbRwahNacrm9T6iC
	 Rl3b/e23PeLVt+TwzBvJEYnZKTDngwLqadTFIpOHRCUbbs6Vng6+vDt4beWG4yHz8zGXE
	 8VQ7GcjLYqrWVvdNwgjHzK0jlb7Llt7mL6iKWqzTGyGo9iCQqRTjdUiezE7p7pt1FbsCd
	 xJFeHAMIuedyhGFEO6Gc0HsCaUiMeaPuvL2jpG5U162lGvRHc1TVJEttWOvAzea1IAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jP14w2rA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="itopHW/t";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6C2606B47D
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:00:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB6C2606B47D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jP14w2rA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=itopHW/t
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q8xD2N1911410
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qwsz26b0tZjqhoYLPK/FZwU2WFoITBl0s4nEjxKpcLo=; b=jP14w2rApGTMbMf6
	l+QzyozzoWyE1HyH1ji7tFA5QK90VUOBhExRB2YXAGIexXP9mlbaebp7txRuz1TZ
	ZywYN9s51uiwKDXUAAiZCukYdSI5Xk6JzHwJSKNuuHaoRGHitl64iqHCfmwcJLhg
	APLqVHkxmFHUhMN3PaiQxmN7ucGmwOYwDxqUIZt2LDyWxYWQtmRxuYVmxwWsVZxA
	gbJKpXXYUimEQVk/e2+8RDn1D2qS38xfDwAKAp0Dsl2LI3Wxz/RF1evukLr4P3tl
	2sfoN5c3bcc9szj1Do3b7BdklkFZG1env3abowSbnJ8BWeoMHeHygEWoL4DWnUGo
	hbRVzQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj3u60781-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:00:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5356c6d98cbso10608351cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 03:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793008819; x=1793613619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qwsz26b0tZjqhoYLPK/FZwU2WFoITBl0s4nEjxKpcLo=;
        b=itopHW/tIgtLD54QjqF+F1fhH71t03r1aenaEdt2s8NJKNp8wTwUbVgp2yws3ifuIr
         l9Z9h5DHBJOtf75ZxmRf2SQqjVlQGpC2hMtLbmY0MoVePWJs9AZOMX0+NRc7Ord6Fcjp
         ksTrNgj0jv/palJGOfpbr6i18dQkuzaEr903JoeF1O3oS209/GQrOlCXSgl2yX917GMy
         jflGWcEDF3oLKoWP2e+0N53qUh7/otdy+1yG53TGKccVkG3yNdmSI9VJqYKD9PnDllZi
         0vlHFSkXCMyMKPkFqMVW9uPPutJBgiVqtkf9Zji21GVBeA7OnXRj/FKy/zEqa/NWjQmX
         noxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008819; x=1793613619;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qwsz26b0tZjqhoYLPK/FZwU2WFoITBl0s4nEjxKpcLo=;
        b=SBGigKNxzmTv0hgywIV5Aqseifpef2f7nKmf1K5gh0gRqFfdwtPhGUgbmLGeZViel+
         rlIEMPSWUmtrvWUni+ZAJDtHv6uqmqikbL3Cz3yYp8WBion/ZarmS4uI18sncRRKNiaA
         kBJ6sGfX/BagHgWPED5i1uBO/B52eNNoafNyXVsuTRN+/J7OebfPKLPHguuQLtieyL9T
         3cMyvznHa9Y0szn4+eijxPgKQQVe3/jkCyABmEX43lYf6QGjP8fLDhDHgx4iaj29zrgu
         WWGAL4QvnrGMNf9e1ToRBHok8V8tMtYx15Z0hIedeU3dQgqeWgzH4CRIfd2SR05Vc3D6
         NjfQ==
X-Gm-Message-State: AFq9FYIIDndBCcCBTA/AYGaeMNimUL+7ZpkHkpX4JS1+ki12Q+sA3Gkd
	le6oXYxtKtM6MsfUoaXLj/RbmbQg1S03ew0B+aUcyRvx/YUa0dyZYdhIVPS+p6Cddx/uf/r32Y9
	e8SHq71AlYJ3k2RO+s/5jmuHEpgQ1QHP8l90fEdKvsZmTJ4UJdCntcESCIJwAp6J/zOak
X-Gm-Gg: AYBFou2tM3Vnf/rY62rtjKwFL3pmzoSnX2RqwikRk5q5dXyL6EvGKS/HOt4+BBBNtdh
	yY1MpViuW1wVpyeuljDD5t+WbHvNhy5b95eB5cIi9j7N5AqmK2YlZMQbSUM4AuzwMoyke+vRTE6
	mIlYv/jQ0fRJqHLy8UW1O/jMwNd4bfgrmM3pIyb2tSWJJ5JDeuLE6gB3X7hjRJNxJRKR/0PBaG3
	p+cCgM02BHikt+OGhzo4ABY6/OVXqWLey+J3KqZHUJofOj+mg3KkZiJG6WjQv7h134HmbZfcGSZ
	4D0/4CHv83TVP5QLf0xdCw1/LtfNXugr+z5WPKLRXtZuH1WnUAnnjelBnbSXqOuu597Lzi9bF/A
	fuib6NltEnxVHB5rgE5hC9g==
X-Received: by 2002:a05:620a:2301:10b0:939:9205:4d78 with SMTP id af79cd13be357-940ef8d1323mr907963085a.3.1793008818851;
        Mon, 26 Oct 2026 03:00:18 -0700 (PDT)
X-Received: by 2002:a05:620a:2301:10b0:939:9205:4d78 with SMTP id af79cd13be357-940ef8d1323mr907957185a.3.1793008818264;
        Mon, 26 Oct 2026 03:00:18 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7abf6asm295380766b.81.2026.10.26.03.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 03:00:17 -0700 (PDT)
Message-ID: <0a36d49a-a1c8-4434-a9c9-36cb1ccfc097@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:00:14 +0100
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
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-medion-sprchrgd-14-s1: Add
 PWM backlight
To: ferreira@se-rg.io, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Ettore Chimenti <ek5.chimenti@gmail.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20261025-medion-sprchrgd-14-backlight-v2-1-bf2979485ec2@se-rg.io>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261025-medion-sprchrgd-14-backlight-v2-1-bf2979485ec2@se-rg.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: NinEhBwhk6oqx8APouaJi2b91-B6f7pI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfX9Oqa91HHLVyE
 HO/JUSCcP/9x8Du8hW1Gy18fU2baTPSQ0JbovLVnTR3eC6m7y+YgO6X3i6n4iLJyneYYUbVIuDz
 9Vk05UprxyPBLGdIAh6UNjfsJPr0xWC51kXVt7FYg3vwIgQLVeQsf9kGTwOFkXw0uJEmAkeHwPj
 pCoTfIT8tHZno418ytEUV2mM6QVZAazYtLHYzFMCy6B5ka1jCrjO6XFFu0aFvbVNwU66st9s8ry
 90iw2b6WrFVeQTxqwCAmosSS+AQLLwP+ISfYfzezvDHOAEkxloShUvR7ajHDB5aWBxyXj0bFQNQ
 LF9exsE16FS6IVNOFvu/TazQ5o9y/NgYfMUCiY4SJChuqCvQLtFiJZ/5LMCkJDtvOYfJzb8dRsD
 acEtL3MQjitiIpiIaCFtTVe5RHsRN7g+L6HD7jQFaWqUv11MpIbvFFe2UCW7A6uXswY0TahWrH5
 jWctjTlxk54t6v+bsew==
X-Proofpoint-ORIG-GUID: NinEhBwhk6oqx8APouaJi2b91-B6f7pI
X-Authority-Analysis: v=2.4 cv=K823jCWI c=1 sm=1 tr=0 ts=6adf24b4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=85Z2xdU_f4vHkJConSkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfX6e9WIGAhCUk+
 nWIkaPYfmwh8J1p9DkRe9HIfNzFwzWaQhSbNdanNxj8z1dXuAxf+F+oEA3cTwx4bcspp2Z45WVR
 uqdtQp3Tzl30Ny7gCz4pUn5c4hJUNUY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260039

On 10/25/26 8:51 AM, Sérgio Ferreira via B4 Relay wrote:
> From: Sérgio Ferreira <ferreira@se-rg.io>
> 
> The eDP panel (CSOT MNE007ZA3-2, IPS LCD) cannot have its brightness
> set over eDP AUX. With no backlight phandle on the panel, panel-edp
> falls back to the DP AUX backlight, which registers dp_aux_backlight
> with a maximum brightness of 0, so brightness control has no effect.
> 
> Brightness is driven by PWM instead. UEFI leaves PM8550 LPG channel 3
> running and the PWM output configured on PM8550 GPIO 8, and drives
> PMC8380_3 GPIO 4 high as the backlight enable:
> 
>   pm8550 gpio8 : out low func1 vin-0 no pull push-pull medium
>   pmc8380_3 gpio4 : out  high normal  vin-1 pull-down push-pull medium
> 
> The panel configuration in the Windows ACPI tables confirmed this.
> (PMIC-controlled PWM, PMIC 1, bank 3, 9-bit, 2 kHz).
> 
> Describe this with a pwm-backlight node: enable pm8550_pwm, add pinctrl
> states for the enable GPIO and for gpio8 func1, and attach the
> backlight to the panel.
> 
> Tested on a Medion SPRCHRGD 14 S1 (X1E78100): brightness control over
> the full range, brightness keys, suspend/resume and restore after
> reboot.
> 
> Assisted-by: LLM
> Signed-off-by: Sérgio Ferreira <ferreira@se-rg.io>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
