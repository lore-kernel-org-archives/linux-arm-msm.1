Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDC048033B
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 15:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277906; cv=none; b=QvW2nIOsZon/3Wb/gZChdlVj2L6TjH9ZSptL7HQSPDVvT/Y3DCmX1b8rO2OutfgdrfhPzzvSgHoTyinuSo0vkbSj94SQZXosmn3VQiurz6+ivbz4T2jnO2Ane0vWvyaXm/cKb4iFyaLSBgn9uCraG8uS6zaj5t5Qembc+JTF7/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277906; c=relaxed/simple;
	bh=09he5egQgLt2FlGKJ+y9h7K5tiRzxN1RtLaZYsMsDzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VtfckPbutxTTkL39xlSI6MY2NQwm8z9WezktDfzuGWiJl6365dOBPqDn7vSkbEYEQwo+ZzCUvHtw7PX/ONQFLdEflhhmXqfohWMmAEiSbWdY4bXl9QAoYb2j/H/iZJCCsYtpI4LTPlkpRxgP8wOBS3oRZeE5mBePJmtOMIA+XRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IBsCKrdy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=THIAqL4e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IBsCKrdy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="THIAqL4e"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8YE32145845
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 15:51:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FLXuthiikXhHO9knkRoRDESDV7G87cacEj+L5hg3O0A=; b=IBsCKrdyIOT2jJh5
	uttyGrbXTRm0UCmq8i9eD1TKAU1WOeAsHrZscqk5dOqB3fXxquXSeTdKTwKnpo+c
	ICEEqQ5yzwMm4ab3upzVwNDLVLFBcZKO3TnCcDx4KmXpHaJpfBhOU7B14Okwktcr
	JvhD/g17TzXNO+2yj1hMttje604egG4iDsQPC5wnUTOL86oZdnTdpV9RGMxEPou5
	8PTTN2czqg8JbbyW5MnlryTm/FEsCFTARNjvzfEzlTbnBoWz2hHcWd8+J1N7IP8T
	OAgNMbDX/QMvYo6UCWe+6gg6QnpKL6Q8YQMXJh0WEZbL06dhQZ8lcr9j50PmL7dU
	jhzj1Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdnk8ujap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 15:51:39 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73a1cf1638fso3776137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 08:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788277899; x=1788882699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FLXuthiikXhHO9knkRoRDESDV7G87cacEj+L5hg3O0A=;
        b=THIAqL4eFv+ZgSIXoppF/WEkA9RdTJtMeYkxnBIiV48whQ6qVXnOhaInOG2pZC0kZ9
         l9EurRaq1qAvBUViAnz3IiKM4jD/fmuFDXhuN3AAaoLdRTTOs4F6Nsv4DYQ9uQ22N+Tx
         pnPIf2flv/AYzEEFAwDSmjpwKOMpatS+7/8b2fkuFKAPwjSWKC9s7pMUISsvkomcIzQw
         AVPD/c9N6HRdpGcFYiQJjSmeMCAKqMWtSCBGEQp8/ZxJowZGsbUPgLcqWIUdpZqX2Q6C
         ZjDPo9w6Vi5GfiCZzKnbkhmXo5yemnv1nMnuEpN7FPBeTxsDyfknXrHF5e9F2gNMtSFR
         5WIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277899; x=1788882699;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FLXuthiikXhHO9knkRoRDESDV7G87cacEj+L5hg3O0A=;
        b=HRZlld3OZpAhC5OL9X9INDozYQ/xmpaPXwPtzNtk7O3bSo4sYiIUF6WA8ItrdV5iB9
         nqhpXkNvgxYxGwIhngyXl/PhECguMNAkIO5HHXfXEBO31cqd7HgP3B6Vnu6Pn1IWJ1ys
         y8Rtjb0zOVM3ZaLlRrrQxwS0naE3bOzolJM8Jf2mdsKuOrC3P6asuz2caKhD/3yaJ1g5
         8mZHo7xhQcMt3AwX3rsYKQ+W0QK6WhrTJjEwYknP1FHnHXoJXOy9Dd5AiiO6AxUY1CQ1
         pXrB4VoH2r0dX4bDiBdcnQ96EXSIuWa7bhWq9N3urcXFpE5xS1MMR2fmOfEXcQK6Nxns
         S3jw==
X-Gm-Message-State: AFuF++kW8YAi7nupVOuMv9B+sa52/R59vCTFuXWLv1zB3fr0Apk3zcNJ
	3vieW95C4N3BuAA8J98lejAv5LExfS+JcfmzdPZBX8ATiMmnI5YTjWzGWsLth/xy0CNKa3sTAEc
	xB53V8+srzGRLXIidhHjM4aLx/ChKvnyzh6KS+CsnFKi6owXLWHsQeAj2aytaPPRCzufB
X-Gm-Gg: AR+sD13kvRX0eB7JGFe7mAT/oFmDQIpXE7xnfomiSGwRlnqT/xcuExdzF0HFFltWX+B
	ZblFEcIwdM8PDeUoVwFGWo+8MH9rxwJAuOZEqWS8a7JcGUlsbwUAvadaucm9KPujuySn90f8zdt
	WWeCpR+30LO+sEDSSzpP6K+rT2Sfz3sSOGKZT+z50yXu3Zd+yxHWyR5ObnwZ4KS5w+L9cOBZi9q
	2xR48tlj9kChG2+PvkInuRAOw19bfI7eMI0oUkxeRtd8F7lRbwDuU8GmY+SSWBL/0RGd9z0K1xV
	Kw6cIUBmPtDpsp7Yy5PVYOnw2pggQRNLAx7vB5xwgd8sNczzV6ztojfyg1Td01aVnKD0AkGVrCi
	B1xd76K5LCGBqHFKPt5OD8A==
X-Received: by 2002:a05:6102:f84:b0:779:7d3b:1398 with SMTP id ada2fe7eead31-78593425615mr4728008137.0.1788277898950;
        Tue, 01 Sep 2026 08:51:38 -0700 (PDT)
X-Received: by 2002:a05:6102:f84:b0:779:7d3b:1398 with SMTP id ada2fe7eead31-78593425615mr4727991137.0.1788277898479;
        Tue, 01 Sep 2026 08:51:38 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1b1fdasm630555566b.37.2026.09.01.08.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 08:51:37 -0700 (PDT)
Message-ID: <e7fd5417-19f9-4bbd-ad65-48230fb81c05@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 17:51:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/15] pinctrl: qcom: Add Kuno pinctrl driver
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
 <20260827-kuno-soc-support-v5-9-6d47636a8f09@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-9-6d47636a8f09@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=f6p4wuyM c=1 sm=1 tr=0 ts=6a96f48b cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=4tAzDn1lkwtfZF03VZIA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE0MCBTYWx0ZWRfX3jScWE3ssbB3
 lCNG4pcQa5oazpB1pRqhenpUu3G8JRONfewoF1J01GhSxP9XmOP4zxc+f6MhZXK26Roq6u/xVrf
 jN5f21/gREWvlbWDVPlpgEd/b3SxEKWTg7gG/wLcSSNaiz6Oxfog/mD3k9oMH2HUHt/UGmmv/Bc
 d5TMeIn7wUIq/T9wUybu8G1ABDw+Cz4do4IuTOd4oDitS604etXSRRhoE8OoFvOt2d7mtBS775k
 535Wi1LApQ65D+iX/u23qQqT1fJKuiYYbNoUZ120NNbmpD8aq6qiiyl3wy9TkOfRC9VU3WLD3Hc
 mJ5MPVGCOwBA+7ArUDqjrtjC3ub1YdnVSSFuA+2P9J46/F9zV/BLFfTFOwPw8nQHp8ay53phCTN
 YbrDJNhCaWbqC/JA275/O5h+WUmUPjFs2CJUBJQG84u/r9WS9hj3jVlCt7mhjZtGk0dhz0wF/kF
 eEcDN9i0a0ogyEAD5Ww==
X-Proofpoint-ORIG-GUID: kj4E-f4-CEoj6D3606GKVvuEsNj98Ftl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE0MCBTYWx0ZWRfXxn76L4EXNWWa
 1bCI2WvIuyJ3SOVZi9R3Q5qHzYIG2Pp24TOm1KMJWHlEjhPQ/Mml09LP9NyAnRjxgwznIQI6MSK
 9uzDaRXyr+WGzQm0WnMm642ibAogdrs=
X-Proofpoint-GUID: kj4E-f4-CEoj6D3606GKVvuEsNj98Ftl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010140

On 8/27/26 7:51 PM, Hardeep Sharma wrote:
> Add the TLMM pinctrl driver for the Qualcomm Kuno platform, supporting
> 110 GPIOs and their pin multiplexing, pin configuration and gpiolib
> interface through the common pinctrl-msm driver.
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
