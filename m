Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102496;
	b=fO7yX+qABo9mndAFaZL6aiH9PvBAIoO1zqJlEQimkrrmDceJ5jOi9OeXeT5KY03dYxnx
	 H+GEhp/0FB37g3XXpbwRTvYcmupDZzQ+aljvtMdMRGJuI2amHCjmSTmA8fT9Y1xmwTB0p
	 CR6kkxLii5NReHNc6FeK9pgFf/4Hr7PRQalngla3L8d17WkpOCwZfrxk3W0RE98dkACLb
	 APbVX6okxRkvvP1714vZ0iPpy96qq/ODEZ9o6p1O3damPrhiDaXMK1kA7BRopqzac0582
	 oFRuTZj4cOxeGNq3+iYeDmY8aeHbTELF+JxHsfRkoNhulnGoOM7ecWb28sd7CNq5wtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102496;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YeZehaX+Eyc0ulj8eoa2CQrTr2waSodogHrOBiCksTk=;
	b=YdJdrvr1lk/gFWHI5Y+1XDTZtBcpxjAVh6dX9ov6nQs96X9qGrsY0Cw+PU49/a06CN0i
	 8xr/gH9k1+j83BK/SAAUd3lrRvCqdeWeLPMmwAd7vbZRNUbb6ik+inpwVhwQSDI2Yksy8
	 sn+CH6oI2FJ++qVrwIEPukDNrv1BmzAM8NDiier14ad0h4X9FqxpJmMaIka80LwuDLiCF
	 YE5Pq/+eWtHeN6svGB5pjuB/jdl/7TeC5ihobmzCroaSojRddCOn8TE52rTpbTluZffyS
	 fhAtV45cfSxNiAKwyH6YSwrD+VkKTmxX9FH3flEDQDHGFX3w7lF+XFTXaTmLZ8LkGVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="AM8/7diD";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fLYEeSds;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AA760A263F
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:01:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48AA760A263F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AM8/7diD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fLYEeSds
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe0pI1973390
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:01:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YeZehaX+Eyc0ulj8eoa2CQrTr2waSodogHrOBiCksTk=; b=AM8/7diDpv+9jiJO
	xW+hkOOA3iRMMNC/fCSF/EM4k3qg05txs+BOHZ8DIrXJhOonH+sbV9wzl3p/Pbw7
	jZw0ES6VYhzDmxUPub7vwEIId7FOaL3chc64mEilXT21PaSdZFSICFH4TxFXOhjX
	x2/K3AvasU/NAr75ns4qHvGmg49cHKNYxXBkYjtAWjlJcVmG3KF1A7fK5EdOxaYy
	8GAgBhJTvb+g3eNUNz0Sb++jonQ0mvcPIJcdUYBB4cefdHXIlkUslrignMPzmg76
	LRE/vUi0/+meZzaUE56PJiBSkLgues48LkDO3Gx+9DqRkGl9kCKbvaJdAiBnYwqg
	A0zg9w==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjst1ge21-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:01:35 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cba2460f8fso195192137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 05:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793102494; x=1793707294; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YeZehaX+Eyc0ulj8eoa2CQrTr2waSodogHrOBiCksTk=;
        b=fLYEeSds4cr3GTWSPkRrRa7sIz+2UH/W0BSWn/kKnjkfJEweETIA/P7MjnY+zt7Ror
         PcFK5ps0IGENvLu5lWZSKiqxwkSBs+aj1jsyDKQcd1ds5CxhHPEyyRDx/mqTzxjM4o+V
         ibwY42dt23UMzKdLXPezWRe9TjNOGIGEQzpCDSnX9c4SxrGkfnDk0cnrB847nuDnARuR
         7NiiCw2sK9V0JfAxjnQYcAOAHYBxRuhxlVzvQpI7T2sn4arTgfhSSDvzCNjhVG0FBiHJ
         6N73pRgOqDu51IJtMjk7xTy0epWe03Es90UyJPv1BfRqY2uwSh/XjiIdLGfJN6GsiCgZ
         mjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102494; x=1793707294;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YeZehaX+Eyc0ulj8eoa2CQrTr2waSodogHrOBiCksTk=;
        b=WNNgnyQeqOejaBIYSaoqNBTsT0SC7XjAgYppDE9BT5H/syz2MlNnkh5LI+DplUfw+Q
         I00PtGyYEbYyWHqL7h3N6JpHEuqlaBJGIlUZhW414o8zBqw5Y3aHprDsV7tE0k7Tnew2
         D8spLhZTfcypmAIVnqBLyIi+zFaroGy1f1K1z3N+VEK5nzybP4M56e+KAu+5matdeOxg
         Ta5Z8DpBjWJB8V+4UoKnX/6TP3UdbuFF8M2kX1VG7+2/w0ZGm92TG2n3QMtLClTcYtSb
         MURhOWQKCYpP1jdyhDl0BePf0Fi3VxWhABq0DXMffnj5+93GVgOGta/E5i8MfJe1a9tZ
         Di5g==
X-Forwarded-Encrypted: i=1; AKwUvBxOX3gQmLOXAqGQt6MaKwvJ2+2gmrqSLidDxr2L61L+tIjpgR9KPnoz21arSuFBgIzKINN0xKRiRvmkFQoV@vger.kernel.org
X-Gm-Message-State: AFq9FYL5hADy9gnXn1o4cMsEcze0kmKDp47yOQ0EIIE/hQDZA0/i4Up+
	4jwE0RWbx8yDN2zn1Bd2rpxo30UVmvfEyjCjrR3DM6LdDXBskV+lLS1F47bV9UVZcYyrWuiCr3b
	NNjX5L08f7tQfZzV2F/FQUq0546gcvLq/mxWsON36UXlsVyJGICUjSMuH51Fwx8dJZsez
X-Gm-Gg: AYBFou1DN3sddOQcSAOlun2u2MN7EkjJMlXBUmtj750mvDm3TqFmi4jy8205fSNH353
	Yxky/J0AUwwFQ4mD31VgvUSBYmoYrtI44Llb+zjScBnQPvB0gmDabDooXJAQJNZ0eNQGmqCCbEF
	aiZPViNVo0ZdU8tkD3on2KQJpsJa9xy1JB7ooS4vvBMSlFEF9Y3OB4jAwafROwaUVsNFkgvf32J
	EuiOAFWof2HLMNY29IlQ8b41ePilvTn57ZBH41/LJqWmNuOsy6Wn8kxyhmpF1rAUXafASYbVwzu
	slFicHSAdnHojYkyCIAGahGe/ixnGr3McAK7mVvJMUCRb859gkfcifUGg4swM2RsiTGDZsFWcIR
	dZzeLunTGD3OhJC9DgFOrEw==
X-Received: by 2002:a05:6102:8182:20b0:7ca:21e4:8e20 with SMTP id ada2fe7eead31-7ce5cc7fd58mr3306420137.2.1793102493904;
        Tue, 27 Oct 2026 05:01:33 -0700 (PDT)
X-Received: by 2002:a05:6102:8182:20b0:7ca:21e4:8e20 with SMTP id ada2fe7eead31-7ce5cc7fd58mr3306341137.2.1793102493232;
        Tue, 27 Oct 2026 05:01:33 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445990d9bsm4967957a12.30.2026.10.27.05.01.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:01:31 -0700 (PDT)
Message-ID: <803e3f62-d894-403e-95af-3f6765c6796a@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 13:01:28 +0100
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
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: nord-ride-embedded: Enable
 eDP0-3 display output
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260920091930.2215803-1-shengchao.guo@oss.qualcomm.com>
 <20260920091930.2215803-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260920091930.2215803-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HJ1WhYtv c=1 sm=1 tr=0 ts=6ae0929f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=N2KePwhmbMOsMYKRcNoA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: JR9obTa02KE2G4rYviWi-FAlRVbJ1sgy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX5TqNM0snb9lN
 phsvWgDbjAznBVW+tUwzg95Wu47dsAZwzxic/Uz3TelcpxVw61dl4h1MwWydDt8XSWZHkkA6br4
 vUD42ygXYIt3jbf0zzWynJHbwQ7ITso=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX8KkrQPKNxL7S
 Pb7wdJVsErYZrlZul9KQ6NO5quyaO/bK/1GRcKS5qfz8XZpKtt/un+Ijmt6yGP86oPXD56PxlBy
 h8I67MJd5z7xlnd9xGku91AdsYaydA/s+k1zeFiSD1GIXux5ttG1ytheGHkwwfFRMBm6iyRywJ2
 iCMHAZjr9AbfFhDKsJuzlUOeI6wFSDdmmUyZ8SGv7uV8TYYrB/YiMoxg6karu4qsNIUXTMJfpMt
 JZfeuMh8CZp7gp+3hLeHKnfNdXlqOBlaQKroWkAhVOEIAoDbbtXO+qY9Gl9ituxsUgmBu43HbdJ
 jnLkxlBZEvFVaHHg4osF9S7zWRk8hq5r2vAr7G17CgOcb6varm0FUErEHFTgq/Sr7+BbiGE7HQA
 hm8YESp1Mg7Z6ACw6rXzzKA4bN+HN9+VQj+Gpjw/uHjFZhvZvUxRfNcsLqqtPlDH3LSlyeD6Hn9
 nEcz41LMn1F/FNiN3YA==
X-Proofpoint-GUID: JR9obTa02KE2G4rYviWi-FAlRVbJ1sgy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270047

On 9/20/26 11:19 AM, Shawn Guo wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Enable both MDSS instances, the four DP controllers and the eDP0-3 PHYs
> on the Nord Ride Embedded board and describe the eDP0-3 connectors,
> their 4 data lanes and supported link frequencies.
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

[...]

> +/* eDP0 */
> +&mdss0_dp0_out {

I think these are self-evident by the graph connection below
and by the naming

anyway

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
