Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9003803DE
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 19:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787944054; cv=none; b=hOapcz95VL6vySAHSRNXovTrVT4nF2qIwhoaUxwzvBALae9sjoBerEN4A6UiMXBAiFP9FTn3FgbBa62jrmWCk/v1uZmigRKF9cvzDxUB6T+obZu/9DxFXjWu97FxXHojAw9ljNgnjGKQeU6JpUTFSygHSzKdHS0xg0M7DF8ryY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787944054; c=relaxed/simple;
	bh=g8Uk7dadfnDolxcTGbSvab1I//fUChPncO4C07pseF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GkJs3ZobIQVrFfE+1opmggJ5EMn/ghGpMsPcFkTl4kUF/Ybqo5TEa5oPnlAzmUbn//ZOYJPEJfy+2DNXOrGmIbb/MN8+WSVHADPM5xy204jO2BijVu0k9nasV/G9buRZo87JLiKibF5eNttWNXxGJYz9gKBoEdnBMkGb6BTJI/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dv6zr27+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=caZmOxjM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dv6zr27+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="caZmOxjM"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SJ7WlR3675477
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 19:07:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1s2kjAf1yML7/2kxSNB22gighqjpflXP5UiWdef4W/Q=; b=Dv6zr27+cCL2KOoO
	I5pdhB7ZvHhjoocoyoQgdQ8V/e9OZsHPK9nWu+YCPmJS77rC9q44TICj3JaPMOWJ
	1Oea3OVJtGR/3+1eJK3+ly4TG62IWoKJflCBYP4iW9MZempqyN4f4vu/TWn/nj0q
	rYf3+Qme3nM7FHqdx71s12kjEkb3AiOICskesM89tpLNTsLTmj1KJdjLd9GMatx/
	PnRVdYn8C5puO5fSnngZDgAHmbPWzv5N/4q5txZzpZ75VpwR/F2sKznje7ffQIl1
	eqF0OW5uG2hghhGdPFQrcZKFOzy4kUwyknAVj6m0qAl44y/wTS42BxV44VFLGy/k
	SRpzPQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb3hs3a6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 19:07:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c9d953b71so2509461cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787944051; x=1788548851; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1s2kjAf1yML7/2kxSNB22gighqjpflXP5UiWdef4W/Q=;
        b=caZmOxjMY0213kzOaiB/w0UkD14iZJhQzQ9qZsI5IGAQGTBBNiccSHmdNg6uHEVGAb
         gRVKqGZrbT2YT5xCjuNotR6aB8ZZD0Z+0sz4umbEw6/queubumg12RINX1UzxOvyjcId
         4XZPr7O19a/ZRq3CEfATvrquABxrLTU1b3rNxH6nTtde8MLwLYOORdpc+51Lh6GD0ma6
         gnhNYnKl1htDyEliDIHJrRz46t/sNwUKpGxY7+jzONVovedo4CoIvm7JbZSx0Ed4iU9s
         35RfOhvaCQg4JHQnRO8+c9KTMC7e/BEq8SJXFF1pg536GZZ5AEmFEJs/gsInHBMrx1JA
         ekrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787944051; x=1788548851;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1s2kjAf1yML7/2kxSNB22gighqjpflXP5UiWdef4W/Q=;
        b=tL2Drk+HKmEQ2MqLk9pSp8stKd9YMaK5RpYaKNvAytPXUpk3Yooi5IAmgO13CZXPbM
         pJUFmFCi9/STHlc4PPeR2C3YiOI3YaXtzawESZwCpymlIcOEbRjcuLZYs8YdhjbRXUDn
         K02H9u17oGNt+UXwQxE19I0VbvGY+LCyeXP9MzTha6sqFHRGtllZgZ0ifFayq/gMfPcg
         3OAHu+hEiiK5xcmm+ARNGc0iN3K0kIIGKbU55DctUUiwnyvWOK1yGZ0pGW6dYzIx7inN
         Zs7keKpqO5ZRQZwr3Po3pml24utHBhv0BmfqtNXVzru+ugAJCKvQv6YlJy8JQj9BIAIL
         +r8g==
X-Forwarded-Encrypted: i=1; AHgh+RqeXpWpupu8GSmUE/Cdn4AZvT/KeA/+D9zukLdtwbyGQGA14TsUpldXHOr0GeF6jh/Ot3qLIBuXtpASOsjz@vger.kernel.org
X-Gm-Message-State: AFuF++kq0h4Fx/EveBE4DawP7wxuTmpfRxuOA9BfRpv3iyE5tVBrM3v9
	xoRe/S6GkY6P1E16HjjCdUS7LbFuGqlMdYPSQEmCvnX8m2pPnXTikqd9QjwSpErAfB/k6LTfoCY
	z5zE9FkTaiyaHdkXpCw6RJpc+AUFE/Mv92Q29xon1xKN3qwhmK2EnnwlbDcpUjfG16rQG
X-Gm-Gg: AR+sD13uDXtZ+E2i6BrPeLYRP4Qi8lKbnPkFNPw6KZCc1nf29L+Ml0IkdSqdp1JeUTp
	lHn+WNAw6/Y5JlkNXXPYiK4TaKxj67cLZFBBhibcHz2/8qMhb6wxPI7jRWRsJlBj+DBRlwtsgJK
	Rfvrs+KbPgmZfeg1bHUYiVBLG9xRHWMO3XldhD6Ktotak8Jlb1ALwt05kulu7MQhxHdlSwyzUc7
	9pVcLpa4g0u9Apws/g++yq4k/1hGO7KEPjmLxm99y+mzguyTlpWlVks2hYL2nZt414R1XfEZdur
	GInyNSC098BYfhAGo4SOSN2snOiTrTfiB2FYCZ2pEOJgWJ6SRmg9gdP2J/Ns055xshT99/Wyvv4
	YK2i7O0rSsyepmrcHoWDQmh4=
X-Received: by 2002:ac8:5d14:0:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-52fb96aece6mr73034781cf.5.1787944051212;
        Fri, 28 Aug 2026 12:07:31 -0700 (PDT)
X-Received: by 2002:ac8:5d14:0:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-52fb96aece6mr73034181cf.5.1787944050739;
        Fri, 28 Aug 2026 12:07:30 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611c38cbbsm760796a12.16.2026.08.28.12.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 12:07:28 -0700 (PDT)
Message-ID: <b7658f61-17d2-4788-b635-ff2021d2033b@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 21:07:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] arm64: dts: qcom: kodiak: enable inline crypto
 engine for SDHC
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
References: <20260629-ice_emmc_support-v8-0-1a26e1717b85@oss.qualcomm.com>
 <20260629-ice_emmc_support-v8-2-1a26e1717b85@oss.qualcomm.com>
 <ba96f5e3-6b6e-40b6-b6c1-300e862e8ee4@oss.qualcomm.com>
 <d3be45ab-0390-4d0e-8d5b-330a48c529a1@oss.qualcomm.com>
 <1a0b91c6-5e17-4330-a8ab-ac14d3339024@oss.qualcomm.com>
 <ffca92db-a3ac-4345-8477-1f53ec61ef16@oss.qualcomm.com>
 <56ab63c3-4288-45f7-bfea-d40046437a9f@oss.qualcomm.com>
 <mwf5hq3gnkesmccede2sa5ni5lyxg3zfnxvwchts2nxh25zndw@uyn4dqehfdpv>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <mwf5hq3gnkesmccede2sa5ni5lyxg3zfnxvwchts2nxh25zndw@uyn4dqehfdpv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XKYAjwhE c=1 sm=1 tr=0 ts=6a91dc73 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=YurnkI7Am4XMX7TwPFgA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE2NiBTYWx0ZWRfXy95DZzEP5LKl
 9L4hF1MXKeIXfnD+qhpGBuIvvb9t/pD/CQuFEGMSat+64Lr7ENuACRXNsYcT2Un+fuGbdW4kcRg
 vcxT3hFc7l+feDRLk28QM58IM8czE7Qrb4rvuTt57EzwgtCi2DBFi6ntaTpskTQDlb8TgB9Cd0L
 AdFAc8/ZsSIprZu/iYxp7ukncGtX7kJXoNhD3BHinYHc+SX2Ly+N6gXPeraATmIpDh10JeJPF7O
 kjaRr3clonIKCwEs7HEFPuX3fUN3HgqYitmmvl+FlgmJmnXYoVu65RkKb4eeDry1kR2pGK+v9XQ
 UBSLJimfTq6OcCEzDcfNdS8PnWIBldLq1Tnt6ReqiPrapcrfB8dByi5R9fq69qhBjDzXSeGqB/f
 4zwFoXBCCtR3jIcROlRXJV35IVfx6OJ0PNEOBh5ZgQ2e2IkaTuaXR7Rho/6x1R6my1lBCZKxKoH
 bm9F0sMOvx6biFgd0Mg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE2NiBTYWx0ZWRfX9Iei2t/U1K3P
 Lo0aNxFtndVQUdat/hAGZXqUaJ+aTNla+Z+Ta9F90isS92nZe0hHiRekMaEyY5C6OQJHylNpug0
 yRGlcJ+27Iq1H2YKCe/4IqmdR9bLM/c=
X-Proofpoint-GUID: HcxLD0E8Yi4R5F-PQcVCX0fozthAGevt
X-Proofpoint-ORIG-GUID: HcxLD0E8Yi4R5F-PQcVCX0fozthAGevt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280166

On 8/28/26 2:57 PM, Abel Vesa wrote:
> On 26-06-30 13:25:13, Konrad Dybcio wrote:
>> On 6/30/26 12:23 PM, Kuldeep Singh wrote:
>>>> qcom_ice_probe()
>>>>   -> qcom_ice_create()
>>>>     -> devm_clk_get_optional_enabled()

[...]

>> On the developer/customer experience side, would you expect having to
>> manually enable what's essentially a sub-feature of the storage media
>> on every single board?
> 
> Wait, don't we do that for display nodes anyway ?
> 
> Also there might be a case where you just don't want the ICE enabled.

I can think of literally none..

> So I suggest we disable the ICE by default and enable it only on boards
> where there is a consumer.
> 
> We don't normally leave stuff enabled just because runtime PM will
> disabled it for us.

We should because the hardware is in a state that's otherwise unknown
to Linux, I've been trying to push that forward, but many things
currently can't be enabled without side effects.

With the right drivers in place, the hw can be safely powered off or
at least parked, instead of letting it spin in whatever state the
bootloader has left it in.

Konrad
