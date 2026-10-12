Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674AE49B463
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818540; cv=none; b=AuBtoPRUSsCvdhbh/zvgsBRjhNjAFjcWGUy666ZwK+JJoW53qgc5NByPv477oHiarxfwCLF7V3Z2kSZ7fUuXkxbdPIAa57+DgbbTsoTDXrXdLk8HpfdEmHBDY/Lp36wb9VsPDQxCxBTmOcL/BryPQb3JGiVTPhXxpgah7d1ejBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818540; c=relaxed/simple;
	bh=qUHymudqOxW+3gFMXOSDY6oK6hbQI+WbL7Nv0bj65WE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fFAfRWqpYqGZt16K1JcFycsnVcFXMjnogWXK3etxA1eEqkQFVDaCTMkuSU6NlTDZbBnJgqsfnNQAJY1ayE65grBKvNBOKcJiB5R+OT9YaDJZ7pIFLPgNBm+iF/bxEhzXilrgH5haLs93iZouanU4gCZwEwpcInDS60GmWiQTluU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SccBIs6D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gypGrwCD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SccBIs6D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gypGrwCD"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0Au83292357
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:22:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ea55xuV3lMRyuzouV+ZXNafd1uMXXbKmpclQk9Yn2PA=; b=SccBIs6DECs4Kq2W
	oHzyREKn3F48Fg8gkF8EnueIHU9Qzvlw82xshElEdbw1kcuL+o9iSM4QyJe+6Ee0
	WGzfWSYEhTjb6Ai2kvRFtJvP1ONxcSTqURzoufPMtSl5DOuu0vjKXFNtYRXskOXQ
	V4iJKX6Iy9cfEe34Zlu5CsJ5v2gxYXofFuVu4UVM+awbPvmI48c60qtj7w0lzApJ
	xeH3S/iB80DGTfw3VkbJ7nbtv05pru1Ku/4Q0pGLm7aRyCy3Flm6PWmOk3O20zKo
	FVlzbcGUJiulq3Cn9HZEbJW4Rm2Y1AJS7KwEGtjx81QJb/U/ZJqv9bgcdnwnCLdr
	UaqvLg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3j1aj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:22:18 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5de7ad7cdbfso44092e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818537; x=1792423337; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ea55xuV3lMRyuzouV+ZXNafd1uMXXbKmpclQk9Yn2PA=;
        b=gypGrwCDOoAGVUoGJB1t6rnbTsv16T0QCaANK7eTEl8BPPfhIjA6jxyQ6OAf5/e6if
         TUzX7jrCvjByYDtHWUuPL9XWrVK+YnuNmGkqXbBHT4hiuWQO/Pf+VsvaFqaHW2hMLarh
         L0GQBU7UbIGUEB2iLiq6vBVkC3aYXyYB9ZLf5iB4RLPTSkz8/PMQ4D1Fu30fOZwW/uW0
         3S0fCX86cnj58Joa+ezIX4iwBQCcvJVqKBpWpvDxNNaH7zgyQCneHf0fghe0IaCYsApl
         rJVT0HUgqV7Y2LeLRSwsQgTPt6P98aYWfkXZBw4s1aV3vfrP4i8wbVopCkRheYTSZH9L
         in4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818537; x=1792423337;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ea55xuV3lMRyuzouV+ZXNafd1uMXXbKmpclQk9Yn2PA=;
        b=1u/237caf8YnUeA0Ej+xKqobO5B3L7WJJkdd9lo6F3d03EhbL643H7/skKQF6GULBJ
         5aYtzNYGKcbJqHrinsPQu51ZKac3T4TdpFlbdsU5MnQi5YWsE8mghmQNGt7O/Fr/0Y3M
         KnvsovGNKDV/heBSLwgAkONN619/4p56bzcnvW3JaPaeqUV2zmEsNkC3ZSw+/7ehM1X8
         qzrYcu3UAc5XrMooakTOUZ7suZ5V42wpbKHtSl/EjgHffGMplRZjjJ78VaSvJslgM2mR
         +xJp1zJRO7+03w5ntiCkKMA4T6pQvEMzODekaTHvrdgEhEM6d8qJiq4ReCyd48X4k3nu
         hE7g==
X-Forwarded-Encrypted: i=1; AKwUvBxuwY6hqo/noVTu9E4mdKOPhfcQUAXjqdFSR8jZwgOYsQnfe6r1pkpT4xn9ngGrV8WIezl4LYhri2PfSZFj@vger.kernel.org
X-Gm-Message-State: AFq9FYJJnky0bSD1oVla153ji/6DmjIABe8Asehd7/v8D6Rjjwsj6B8z
	miU1B8MJ7eLOEd39dqGnNTQxylyiypmBSZ7zsPEv7h4dt1ADZVZnRTGNURIlcW1DHB5lNJL2IzS
	oIMsdMtV7Fy+AVxxptVZBjlYDN/Q9YLNb2B5DZi4S+kPT04juFem71Gn4I65ee68wXhHU
X-Gm-Gg: AYBFou0g2RWg5gqWnI9hoYrVBnil0nWBSCF9mBPrdnmRINs11sjGfYreccFluQhZWlT
	+ip2F81FLE8m1BRUU+SV1HKHyO7FntsQOuHco2hKuveBwUQzFTAtiVWPCNsOeN7BnuAqbch/OS3
	i9LniL2v278wy10jyBNG0wyYB/XWOPve0YZPeD7MZBcDcjqEe59yEmcmnV0G/J4kbcL++pZKlGe
	jVn9p214iWU/ugWkrcgLl7XgSQUE4zH0UWM3lTPeZ8gCEsvIi8VLg5sS1q1pD90Nt1A6A+lIraW
	Wyk1uQxxBgOSoCyCr3SPTjaE5y80ev6XmUgR4EzQh2AwKGyKTDWKK1L+I3Zt+QDCp1Vbpe5qfif
	nEZVEYTZkBx8o00DsDVZJeA==
X-Received: by 2002:a05:6122:8111:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5e91efb84camr1972685e0c.0.1791818537591;
        Mon, 12 Oct 2026 08:22:17 -0700 (PDT)
X-Received: by 2002:a05:6122:8111:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5e91efb84camr1972643e0c.0.1791818536862;
        Mon, 12 Oct 2026 08:22:16 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a74bcbsm478161866b.38.2026.10.12.08.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:22:14 -0700 (PDT)
Message-ID: <23e3afd1-2aa4-4b49-bb47-3627792a0a7b@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:22:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/38] arm: dts: qcom: pm8921: Remove superfluous empty
 lines
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <3ad783a0b4f1f51e801b7c108df23f5b28893f29.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3ad783a0b4f1f51e801b7c108df23f5b28893f29.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX+kj1+bKGA2Kk
 HBtvbEaB3w+Plb5TdN5CEj1lmlkduxT1WUiO9YewKlEZf2/EdHgg7ZutRGNmq4m0SLk+xLErwxg
 351e3n8aJy03egQflt+653NWuSNaNkVE4nMGi8t7CIW77QAH6m+H+T2JQVdfGfmp2lXrRAar717
 wryD0Qxd+eXXsP6eWgQiXGwmZCAEr9a6YfQxL34F4G0S1MfwqA7g831Aa6jmKFT1CN/xPnE/iku
 kO+u9ezTAP/eoZytEOopHG7R+JcOHmSxi9OW8DSv1vLV6/2zxoNA+felB6L99t5jndqjbNEPMEQ
 12Qvy208oR07KxHYcWx/82GKgvZMzaJnnVUxo3VhJrJDpXwj6p1gxOHCWCteTY1JDMPIhUuQX+7
 5IUr/n1vPJGJBFQeUhSANHZXYchNSCtOVQbayAfqd2hcvuu2ymEPgmKvgSijnFqz8xoBQoDgsZR
 gUFVuHc6M08oLVW6Tsg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX6jVX43c3cVzc
 zoaAByWVJ6G/aEBnvXev76iDk1gNfgPAid0bKDISyYg93WKks2sdvKfbmyM8+X9t3BuqCs2x62/
 +3S5rngE3k3KlwqTsE+Ki86XL0Am4qI=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6accfb2a cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=YXrApte7LvgGaje0e3AA:9 a=QEXdDO2ut3YA:10
 a=hTkh0tvSPVsA:10 a=vmgOmaN-Xu0dpDh8OwbV:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: 0ZY42VbMuupd0Tes-YLY3g0FaWpqeMwy
X-Proofpoint-GUID: 0ZY42VbMuupd0Tes-YLY3g0FaWpqeMwy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There shouldn't be a newline at the start or end of node definition.
> Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
