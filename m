Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E65133939A
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787552926; cv=none; b=gJXp71CXPyXbkBFUZIz2AXfMrDbMiQLAjhyz/uOOpoPYgY5Iz60tUMiSwDy45Ir6xG+O3SU3XBcr3+x7m8JQ40sZ46yvlNFGzhu/viZdD+D5oh14FWhLn/e5L7xtxI5+rSD/pEyI44SrjWy0XLcHQBKjeU/bFcUPhAmExK2Gvbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787552926; c=relaxed/simple;
	bh=8GFf03q967qSeVY9Ye3J1CKCJe5w1/9EsT6PvH1QMSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b5P3zQJxgD8488f4vWKlSggG07YAXVFXFioDT6PBI4P5ElOBFydbfO6GlHeN1ITLRcFDQz5eoeY7PJ32OcSmuLduXEhFDg/RKO6hkisbLl6p2j5p2a0aoJo81YUab0tUVY/xXbdDFjyTUQ4NeHK0STEil0tSnlTq0TLXXSG1TzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NcPSZ0W5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DrZRJgAj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NcPSZ0W5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DrZRJgAj"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5R5CX1477748
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:28:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oSNCJOEbT50z9DncV9kJciWruMg5kFIYyhF37TsAucg=; b=NcPSZ0W5lccUQbA1
	4FXUESBtfrobOJgOgJCkbVg8ck5hjnIQh41YBId0NgMK0z80mVAXXamr25Xjlwhs
	MFpPayg5UO2ABhR8LggqOOYwceokp4d62omOGIzybVHYwU8e5By4rjOoyRtTd1En
	RSwT1k9j/dtVYMdk+DnzPTC2a9AMSjr0VUPQgoXrZ6x3gdqk6M4CkXo6huA1fLpt
	uAQOhJw8tOU5QniKJWRkogo2Y6aGnwnlaxrM7v4xUXk84xI8zQwNqCV06KN2Zt3Y
	xL1PhXyk+HCreNFEC9HzRnp5hcvBNKXqjdsivgmholc/psUPxyVKBKDllWFjGbEu
	sYilGA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g7528ney2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:28:44 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-73966c839bfso70534137.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 23:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787552923; x=1788157723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oSNCJOEbT50z9DncV9kJciWruMg5kFIYyhF37TsAucg=;
        b=DrZRJgAjhx0CBCGpo7fCSdBZ01hs68QpukPyCY0gsVW0fW5I1m1Ch6NcHa9RAg2jEi
         5LP2OpsMKMSfklUF1tNFePAqd25UMCoYxVwuplfsH82JPiLhxZ3S59mqeBbed9+bMjx3
         NOhKw5ruwk5UvYEW0ZlfS8fM20VDo1G0KsCIbLCcvK2mDN4b9sGJhre4GkLJyuUrOAx5
         hSuMm65dplv0V+5w4slV6XfcKEHvxdVtzlbnb8jKExyWpgV6MCnh5wPju4qVAFMhdeJt
         ZUvo24WbRLBTRC3FaNgYrK/HT6GCPL4SN/eyYZXiL3h1uyCFbxZvnAPy+Ikm114gJGjc
         2dYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787552923; x=1788157723;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oSNCJOEbT50z9DncV9kJciWruMg5kFIYyhF37TsAucg=;
        b=ft7Syt9lfD+B5Rh7NS6460a5oo7sKjBEhmusAqXGfArKeo+iUB/iD0HSfciw7/fRci
         Ouzy8GXwCFUe+cXgE8gAQpqSaBHgiwHz+71IIgQSyaqQ8ipi/dw1WazBOHi4mxYmuu77
         Vdd9J0ORSUccMY42pmpwRlBX0JjcUI09SehjK09YbuIlarEMXrWVgIKqT86/wklFodxC
         TISkjqdyXU3Dsgmh7Uj0dEx9fua73LiVUcsuG3dnsF5AFI0cFi4sRZl/Iq/rzJnFj33o
         q2eSOTYihhn/PSDDcfqMTFcchaiuS1kwMYRe/JjA6nMHbMKzx63ip358/vwWcUj7Izsw
         OWZw==
X-Gm-Message-State: AFuF++ky5DPpvny5sQC2m0QvVk8qVPLBpi9Z8zyL3opjHDmqRMKelVKc
	AVMGle6npnzr9mvNSRGTaaRvtSju7WAI+0jl6kuLl5QOnRFz0ZCG1U4i6XLs6RpXQtql2Em2Jbx
	wI1eyypT2Su/WZcIoouTZ8adNABbmz7cDBaTlgZ4gR3swBKHa54lZj16g82S8yJtBn4PC
X-Gm-Gg: AR+sD12HJtxS0mxTugTikvoOrV934GRcnI5CSb1Oc161FRSW2ZMJYeLZogiv5fw22Vd
	cbzmB1s/35O5w88dmMtZjDlh8tBUSrdpCRoRZSDlkvTgmbW95sIGEHE1ZDjDNTAA0in4BsUEkve
	V1UUe2VQ3VhCYCLqdiwJ1Hcybrm2jJrBNiry9hTMfFklNgFXItrLmz8Gor4B6XG2CpX/TV9S1NG
	V19w9tqEez4SV+YZl6pRVkpswzqRAmWNI7gK9rjjc/C2yrwTyCWDF53ALuUp3CCwSFXBmUA8jr5
	KY2DZuc0J3k1vXpjJAcecmD31vB6j2IsFPfNCp7G91IPVLbvdlRPgWoCo8e82vUVuBO0MTLqN8c
	lUylrg1dcLV4MMPEgyyWyFoBe
X-Received: by 2002:a05:6102:2d0e:b0:779:9a7d:d826 with SMTP id ada2fe7eead31-77a642323ffmr3466746137.2.1787552923522;
        Sun, 23 Aug 2026 23:28:43 -0700 (PDT)
X-Received: by 2002:a05:6102:2d0e:b0:779:9a7d:d826 with SMTP id ada2fe7eead31-77a642323ffmr3466737137.2.1787552923148;
        Sun, 23 Aug 2026 23:28:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e001305sm7265461a12.4.2026.08.23.23.28.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 23:28:42 -0700 (PDT)
Message-ID: <b7e9d655-2196-4419-bbbe-d1dde7177784@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 08:28:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: msm8917-xiaomi-riva: Add GPIO
 haptic vibrator
To: Reza Kurniawan <imkyufie@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260820110347.98068-1-imkyufie@gmail.com>
 <20260820110347.98068-3-imkyufie@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260820110347.98068-3-imkyufie@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DsJmPm/+ c=1 sm=1 tr=0 ts=6a8be49c cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=UzYu9Azp5mvgxvfo-noA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: _x0IbY6--gEL1c277ESLOy9XVxh4-tNw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1NSBTYWx0ZWRfX3er6JHDrfbvf
 3bd82QqJjVGwnNRJB+spNLY2j0PyrQgxbgi63whHdpQ0+YxP6pZgMsLaBwgVOaVIF94Hc7ts+Yv
 pf+9/bzB8LJ0hUiWurWIkMeWj3+ED4CEQ+riRa+wyKAbNro7XbeUlwLMQRJ9lVNia/K0XXYZuOf
 /lKo94nNLmU4nHjOzR1VqwhHzDMM12x7crSsKyzCMcpEQ+k/UpQ+Ivnc5rpRIYayhLgOFEfZqJC
 sFf0p0ykpBA+BQ7HxsVqjUCEMDahYilTdp2FrqSmlDEueycFbzrGZsuiS3VkfboXHdM/eJU4XqA
 0CMDIMc1DeQrBXNc6F1Dn3ZTaSDE7V/E7AZzmgiPvnhxJZ4uU0GyJjw/0QHWUCyUexoDMty7+At
 wIuUXRPcQtrimp8wJQysxTvdgi5lwrksc6YrWMiucES8p5sNfcqSkP1BLWVSLjQbgDWnp5vP0LK
 p6WoAqcsOYvXu9rS7mw==
X-Proofpoint-ORIG-GUID: _x0IbY6--gEL1c277ESLOy9XVxh4-tNw
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1NSBTYWx0ZWRfX2XerXiHUFyaL
 AIqOfwnDVU3ixG5nTgRkKx0dSzhep1alciyO0xlurat+icKzOQ/hiWD4ZTpx3E1upg/VbSU1EMD
 iXurPk9QQvVttcQWsFmtOM0xFTBvz9s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240055

On 8/20/26 1:03 PM, Reza Kurniawan wrote:
> The haptic vibrator in Xiaomi Redmi 5A is controlled through TLMM GPIO
> 97 and is directly powered vph_pwr.
> 
> Define the vibrator node using the "gpio-vibrator" driver.
> 
> Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
