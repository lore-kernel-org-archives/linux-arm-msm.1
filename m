Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E709441F366
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785233512; cv=none; b=R8q4Pyy4m2xacDp6iEL4dMxbP89FXvFO7arDXa5V/R8X87MdQkyr5ejami+qZavZPyENdw6O4sThYH7Pt+xvqZ0BlfPX5KF0BL3rDPTLKZSwouJVQbUB41L6CBWINnRrokz/rcoQMFOICAcwiJDBtqPDB6mL90H82B7T4Pt2g0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785233512; c=relaxed/simple;
	bh=xqFbCnSsGLSw2njuPTo7qEVUmaOsc/JdKbdBRlz/pe8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lds+tr9V/64XPvB5SrkVGoA5s9ZNxXnWEEcq44y5nmAp/Q7bSzRBoxoqKOqzZ71X9XGc2ISKZaMRExG1AbBmqGh0TxQ1mwr6rtBQmBYmGaEaQ2sWDua13eGxNBknvdu/KZzZXgcTgfgqX/bVSE4CMHpCjM7yS7g/EMezGxwVgYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K1FfmrA6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EQtKbQRo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K1FfmrA6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EQtKbQRo"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82qsV2309848
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:11:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FNwlA0hdBAVgy7IiebJ4IPZsJDkniERK7NeOika4n38=; b=K1FfmrA6UnD7PVAC
	TaAWyluvmCKkUOy0s+MRya47jmT3G8GtcqtjcsF5jb19Jiiophxi5aDXD1kcBmKK
	/P3CFB/9hoMTpj0Y6gYGa4TGNctiI2sqazy8hDJfteYJHnEBKOaoWvDrDYpRN4Zh
	jNQ5lrMfmiUoQ5S43krOlK9edJwGWock3maxNawil1EXVkH9M2xtEWcoZm/UGZBt
	eecYY3jpD68QEhYhhlyX5BMQrjAt8a9umJ3lHPkHxDhBFLRbR2DlceIMoRyaG0wc
	MwdSFMfPxfF+q3O4mUSue069jfwq0Hpq2mAD/adZZarfR+BkKaUaYFrzdD+gm4tq
	93JvIQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fphh7j792-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:11:48 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ee7cd05e18so1744666d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 03:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785233508; x=1785838308; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNwlA0hdBAVgy7IiebJ4IPZsJDkniERK7NeOika4n38=;
        b=EQtKbQRoF10bAVkuNKGI71Rnjk8hb4nKJGmcuib+FFVSopRF36TBEJeI8Zz643ymtv
         70NS9HkNeTSrs+gmgcuTskHr1VrOHRZRsiOASJ41n4q+euozSS0t+iVTN5XFaaxrDvyv
         Iity3R3E3BZoAAHf7ppgDSs3IC6j+6quIhCOchiXcH2F1o8JXsdXHje9mAlzJBA7znE/
         AWU2gMAOq/4jNSH9ooLSWNIWcnY3Z7cTIBFDIDVtiFOu1az5xJQ9nNUsKrSyNXznsdOE
         oQiONhe2faq/p8hJbaC5ZbIYm6of91Fsi7BrdGtVCf7PvSurIr8x6JjfMf5efcH11OQw
         59Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785233508; x=1785838308;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FNwlA0hdBAVgy7IiebJ4IPZsJDkniERK7NeOika4n38=;
        b=PiFzN5L8hTOoNyg4DAFOIvPzIgzY1Beefav34XiacOKcvsrbZZOD9iH+iUZSGsYZ5+
         zVY/ejHPflQ54BnGzVmoT0yZ8VTVtC1YbeDh3ihoNcrviWck436NDcDHkBx1b6U0IHsO
         qnmXSPpHfLY0QSAkVsJfyKpIS1oxyXgYIt2G+iZAl4v2sqpe7T0b6qIHhcVoW3dqKz93
         k1eWsJj8kc44xtBwbyZS+O0G7j/THRB6U7ijuW8lzhwV7rOVyu0W+bj8gz38A4qjT8kY
         7ThcJlsUEXW8sz0+GyIUk9CkhDfVnFeaY78/jfaJZOH9JpE7O6COLh24S3R5+S/L7IUB
         5nzw==
X-Forwarded-Encrypted: i=1; AHgh+RqllNq9hVlQZ8J3wkKUBxzfWRe0ECv39prl48cEXLZVg7T4tEkQKrE9cwS5yEPJYEPqUlev0kihgwzU/Y67@vger.kernel.org
X-Gm-Message-State: AOJu0YyG2ipo0HrQGvk4IGMR4vmUO1nrr6+alYXqxtftKFsbjeYqn+T6
	l49SsQ8RbBt78PEheNkqMKIOIadT6AP0a3zrlhGusCw95FKQIK3tu5DvT1rztUafsQ0+UPChwVL
	XbwOtr+X/XCYSItTG262gc5oO3W9V3jj9h050PliMNCZnbefWchVER95eLDWbjnPYuNc3
X-Gm-Gg: AR+sD10emNH7Uy2S6xJodOf7X3nJ9gkYCh5ln9p1ZDOK3qmyFmc57aVjWbDWZgxKFci
	axHzhVpQ6HRzk8HqmMHYwkL0mQ22eh6Ff7eAzwpEGTvT3vwQvdBLWQl8lfQqETB4e6GEDOXAdvT
	YRPp+jk4KBTnzAGW9MHWM7x03FSa+0a8aOW5gJ/9satfaiO35/yPiBIp1YcKUffT94eHTbo3WzT
	f55dpeyQQ2KNI9vvLINoIMXe81uuuoOxRbvs/jaWTXRwk7j4YQa3yjGL+N814OPDSUqQfwqLe/K
	LoByzUefA/ObL7ZxdMjxdNrHSmLLp/Ew2UMRq4ZwKJIiXH2INwA0lZAK0OQfz4XcWqLhyL0GMPh
	51CsrwwOigQktpCiKCo9IwpoT
X-Received: by 2002:a05:6214:528f:b0:8f1:507a:ed6c with SMTP id 6a1803df08f44-908175552e6mr24110986d6.5.1785233508177;
        Tue, 28 Jul 2026 03:11:48 -0700 (PDT)
X-Received: by 2002:a05:6214:528f:b0:8f1:507a:ed6c with SMTP id 6a1803df08f44-908175552e6mr24110556d6.5.1785233507761;
        Tue, 28 Jul 2026 03:11:47 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ebb385sm740924066b.52.2026.07.28.03.11.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 03:11:47 -0700 (PDT)
Message-ID: <8c79424d-8b79-46e4-bcc9-37edce5664c6@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 12:11:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] phy: qualcomm: qmp-combo: Add preliminary USB4
 support
To: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>
References: <20260728-topic-usb4phy-v2-0-5d9dd5149ec7@oss.qualcomm.com>
 <20260728-topic-usb4phy-v2-3-5d9dd5149ec7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260728-topic-usb4phy-v2-3-5d9dd5149ec7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA4OSBTYWx0ZWRfX3WneoLy6kniE
 n7e46rXGp20O8X6s0f583WUJLLvY+UsL4BqXj2jLo+Zv3/oNdVhW3Y2ZdhsOML6CLa4nbvyrycq
 WMfk2gO5lylpOzGK13OOF3J4A54VHOUcpSOz2JK4ivL3FU/h9Fwyli4mIYa4ItPEHYMpM03+EiG
 WwlKYcUl/nGQpAGvZk6MZdlJpC8qUKAfzfhC7/QtM8L1prMky+lYu6iiNiWnFuCSR2KgRaMd7bs
 qP2A/bLu3PKQbIbnz0CGx1SNgh7VPyk9Tz/MLilJiUd8sHdhE5EIEPMwphyqITputW2q61KEJhg
 QIMkdk0y9TplswZoArLhf9LXxOvJuZsqobE6elsrxnBMVfVS12ZfRhZgexV/D/IwZEeeHEQZVjR
 DXZcNM+wqSVKo/n24up+F6OWKN7SGQvUEcCf9qoOsOq4jzPACBFSPCjY3eUdlVxrtyBNF0ksd8O
 bdrMEMnPK20ctHIVRFA==
X-Proofpoint-ORIG-GUID: vR1FZDLJgObdrC_zscSeVCvR5iPC4JmZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA4OSBTYWx0ZWRfX/HPeTUEIBwtr
 cTt19dmoUpXXC0AncQZuWktzqkJfgAWJ+uCA7wCUTqHxKn54k1MlIUkAiFXyKj4FxHpxoYE32xE
 Re3RcgLmIqjXtLVp5SVNIxr9Amqfgf0=
X-Proofpoint-GUID: vR1FZDLJgObdrC_zscSeVCvR5iPC4JmZ
X-Authority-Analysis: v=2.4 cv=b+6CJNGx c=1 sm=1 tr=0 ts=6a688064 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rXb9wQVw3mmQ7qUHhtYA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280089

On 7/28/26 12:10 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Some Combo PHYs (so far only on SC8280XP, X1E80100 and Glymur), come in
> a flavor called USB43DP, which as the name implies, features USB4, USB3
> and DP signal processing capabilities. In that architecture, USB3 and
> USB4 PHYs share the same USB_PLL while featuring separate logic spaces.
> The DP part is roughly the same as on the instances without USB4.

[...]

As I pressed send, I noticed b4 didn't pick up:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

from:
https://lore.kernel.org/linux-arm-msm/37a4vzkiicm7aw3bg2r3s5e53kigh3wsc5yuqqjp4h6oxhpk7g@oybpt7kdnnxb/

because the patch applied on an ever so slightly different base

Konrad
