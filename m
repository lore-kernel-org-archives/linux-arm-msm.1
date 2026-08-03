Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA9A35DA6A
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 09:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785750007; cv=none; b=vCFnsCXxrv6r5Hh9d1BXOByxeyZJnDUdpM6lhpHsQksYj3wsRuMiV+Bey8Y3eCE/Wssyk7kiIq72OsSLlzmDAKeriW7upyGyAVfAU5VL9467UibTLaOBYD1ddUVhV1Gw8cGYQQbnTZQu375W1TcMuuXS1803Ihdk28Pm8k23K1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785750007; c=relaxed/simple;
	bh=RRWgcT0TYgbIRmpDLa+Wa3goPdp4+rE0NIOk5n647+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AZqaMeNpav/9uTa6rWJL+LWzlp5jNO2/7QFh1tfBDYRsuSDcLYPd/dlHp7MQLOgZdnJC/ZPES+crqXbq4sUbwTAOXIiUBn7lbyDZP2OVM3uv3mKvEvmU4G2IZe9v7eNQ+KfE641G9n6YYsSb0/31s61GpVD6NuyRTy8b6ffCFvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UGEHqhUr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fVHrKMbF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UGEHqhUr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fVHrKMbF"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736sdnl3790875
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 09:40:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d6AUI7o9/3m9Nx0dk1Vjh5FS62SZ3AH1cQ8tSlJIEdA=; b=UGEHqhUrhwPrxWCi
	b3gaLTfW0SuadX3nB0yqEQWpNNGeyc0YK0ErpiJ+1xfrWaAWDcogoF2WbyH/KHkX
	dNo6EiZVXWx8WQUydq7nDGWOfTsf/xdjiA9vEco84M9R3Q6leoDIvTc3vycHWINN
	4g2DYJ5YdKstonGGFu/lb2GYb9lsiYJ0YjlJ07ciP1wsVHknmUMtXWrkE16B5DQu
	wLAcLn18t8ronIxAEr6PNV9UxeGmsMPTGeTYOLnO0nfH0gnnKB487FLRVv96mjDu
	ntv11yqvp7DzjD5u7N5xB3u/itDwdGtMqls3SG7ON7R4p6n/WxQMISjWyPMMdgE4
	JUEtqQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftp4r0rse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 09:40:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc640dfde3so36228895ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 02:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785750004; x=1786354804; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d6AUI7o9/3m9Nx0dk1Vjh5FS62SZ3AH1cQ8tSlJIEdA=;
        b=fVHrKMbF3/PEZFrpoGNYw4FtlKNR2cxQj0ZfRA4Q3mQzZBeJng+7dtPp5M91obgDff
         utaGBMBuanD5UaHF8gurRDPbM71cJ+Yirv385rw7KzKgvjo8v628OPMGR3DwxWBzLkYq
         bvW5AppwvxqRY00h/ChK/CBWiDPB9qt81UXsZmobcom+OsV3cEFN2gmiAIvy+bQsZbeb
         cE2gVdNpFexnYjkJfJ4n3RJYsuNstf05RxTOAbbRdMGoB6iBpH4uizA0NSXul+1K9om+
         ixgve+1RwkeGhsciQVgF4LG25TiJI4YqEisyeUW/OhsdxBxH755Sahm+c1gyXnY8iyRE
         c99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785750004; x=1786354804;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d6AUI7o9/3m9Nx0dk1Vjh5FS62SZ3AH1cQ8tSlJIEdA=;
        b=USyGWJVj9D71VVRhf6mo1GxSlRgmIxgn7jCZp9x39FOP86EU5QsfwRAA03j2atrsuz
         N+Vyq/g52llLehG5ohF4leYfwdbgUt3iuN9PkVcbG7Qy7so/ny49yGn2S0Jq1L677Swd
         gBgvMRQ0Ys3WQ+YZgl959qdcvKqvRNcg1kuz/bakvql4m8lGoZEhzJxvajprYnY4c+g3
         3BjDtXEEWyGgMK6zoI8GKKxqU/EkSIA+HDvzOd5fxwCbH67lwwkNCg17r13kiZPj1+Xr
         y8cTaAly1o7Kh1K6CZuH9CiX52Qt0gEFFd/FthcLGgbQcsStqslbG6y/oFOo2lcmfX1r
         GIvA==
X-Forwarded-Encrypted: i=1; AHgh+RrQ3rpnkcrfeUDnAazYE1gzka9QBsc/5Fr59AYfK4niD5PfCQBFpMHMo4Wtuveed/T6/bSowJ0fFU7x2KJA@vger.kernel.org
X-Gm-Message-State: AOJu0YzRGMVUcodjdcKyBtmDf43vwOrtyNN/STC+h6wTGk8Y2LWXwmV3
	P2Yejw0xYSjI7Nad1F549RFMMAXU6RAiOU4GqO/Gm2Kvy9LCt3qN1+Kl/UK+T4voP/aL9OrK0hY
	CLCLRxyiiogv1tkuNCJqRjAiy5/q2WPgvuDUnvKsgKg+Z973PvBqAgAYmpclXIwGhosM5
X-Gm-Gg: AR+sD13XUXeOSo4AdvsLqX2EPv0xwoul4Om6RlQljzNpvUHfa8/FrW90o/6NjE9/xe6
	6d2/Q0FPMDeGUfl0YzKmc3JmMThFKt33WKlkLt1/dd8Iq/bQsw8dZrbOJPuPUnXxzrs5djnc3bC
	8/UYB6tF8hp0PeBp5kCDnOtvy+L6KfKyZbfBSOvqmK0JZLoqS1LYL+8QwAHm1O5UmAo75qsbt65
	A8WQTbfURD+Ux1Ia8G90Z88u7Q3ezr+gpmmQZjH5/Si1Zukqs7zBlCtXUj48vI5QTV3ue4yzSph
	FbMtSm3yOXvhzXsBzZpn33uD9vu1mtv/k0034YghvT9G14cB9BVpbtYTAfxYzQJoKcjVVNfXOxc
	3Dqjul8ZHjvc0JKk0RPId2CoJooN04MCm/Q==
X-Received: by 2002:a17:903:390c:b0:2ca:ce92:6e44 with SMTP id d9443c01a7336-2d05218984fmr89075935ad.8.1785750003665;
        Mon, 03 Aug 2026 02:40:03 -0700 (PDT)
X-Received: by 2002:a17:903:390c:b0:2ca:ce92:6e44 with SMTP id d9443c01a7336-2d05218984fmr89075775ad.8.1785750003264;
        Mon, 03 Aug 2026 02:40:03 -0700 (PDT)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b15d27asm34889545ad.78.2026.08.03.02.39.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 02:40:02 -0700 (PDT)
Message-ID: <21e896fb-43e6-4681-a00f-9a2b666030ca@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 15:09:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] ASoC: qcom: add AudioReach TDM backend support
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260712134110.3306763-1-prasad.kumpatla@oss.qualcomm.com>
 <275c15b9-8a46-4e55-aff4-9e0aeb01b730@sirena.org.uk>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <275c15b9-8a46-4e55-aff4-9e0aeb01b730@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X9Ri7mTe c=1 sm=1 tr=0 ts=6a7061f4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=XciJB2WwQe-gzLjzgcsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: NESk20aU1Bg2-ByMut_hXPfvnSuRgZu0
X-Proofpoint-GUID: NESk20aU1Bg2-ByMut_hXPfvnSuRgZu0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4NSBTYWx0ZWRfX7xVynpTfVmel
 9ZwLTq0d0hAkjSwe2IrerSj20tp8K8ds3aYxOyxpMxbkIj84uS9o6bHyq0gBfIggWxzxs65XruZ
 QYQpaO/r733izX4/S+jr9HmH3p7BQjk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4NSBTYWx0ZWRfX8aEGMB8R4DHI
 8KFkMlDdysEJcST4EpLgTZVr2bzTHDhf2CdEtHMpYT8UFIl2l7b/eksnZClKax+uv1phxfPADjH
 ROm/vKB8kRPzJJymUGCXm3V4qc3xMaMcIKNV0yZ9RfazvGNiXeewqibb+wkLFCMwQQTjHHia8Hn
 BM0rwSO8MQ84zr0UTtin1feyvFRbLb5PtIsWgPfgf93cfMMWCBYYNJqKbykSn2Ouma9c5sKav11
 3Wfb0l7iiNBKH2FybV0Ia/TDKUEZ93arO4jbnikXbqwFu25QrqesVivPDKBIpmmcowlYaIq5yBj
 uYpoqVledZ1Vbql9EFyD2BBNUJ69B+ddG8MUw1glPJwSQ/NzIjMtzr9nwkpavS7QJlmml2mUpN3
 GDXVlMZbYBfFYy/8oCZJ8dl3lPtdP8/XIRDWalLw7djyTi4/b+yekit98fcPCDSbrDNWkEngGw9
 VMxO/KZkkG/N37YjWgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030085


On 8/1/2026 5:35 AM, Mark Brown wrote:
> On Sun, Jul 12, 2026 at 07:11:03PM +0530, Prasad Kumpatla wrote:
>> Add AudioReach support for LPASS Audio IF based TDM backends and wire it
>> up for the sc8280xp machine driver.
>> This series depends on:
>> 	- https://lore.kernel.org/all/20260711125740.3083236-1-mohammad.rafi.shaik@oss.qualcomm.com/
> Please resend this once there are enough dependencies in to allow it to
> be applied.
>
> Please include human readable descriptions of things like commits and
> issues being discussed in e-mail in your mails, this makes them much
> easier for humans to read especially when they have no internet access.
> I do frequently catch up on my mail on flights or while otherwise
> travelling so this is even more pressing for me than just being about
> making things a bit easier to read.
Hi Mark,

Thank you for the feedback.

The dependencies have now been addressed, and I have already
sent the v5 series with the required prerequisite changes included.

Thanks,
Prasad
