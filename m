Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43ACF3D8128
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 13:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784293615; cv=none; b=eVrqBakjEFqtDaDzoNLqIzf56b+RQZVYGE3mLZVggrEYYHxh+BQA+0pHZRl569tFhjwbpLrIpH8PGRr6cy1k0L3TBKa1YJ4bSxhzeV4w7PREHeoWmwhZy9AfeDo1fw3x4n0dnNmkTioemXjtTfpyPcZC2X571mLwX26cSeeN1GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784293615; c=relaxed/simple;
	bh=TiCoW3KToVtrC+k4aWbZvJ5eLat+9PHhgrDKPZhqYn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VW+aor04atSPTh9uibgKkmo3B3RKbzhzUOrLIrZfcL0IryIInsq4k8//1fW5KZOyUSJvUSsrOoQxo3S4E1z0/mz3RVeipz+9qxEdVbcwbxd/UoPP7LJY7s+czuObWDYBtp5TwYEnRX58LDuw5AiZRkpj0bn3Y6wgPvhK+wb5RJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V46wbLoF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DnDJE0S5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V46wbLoF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DnDJE0S5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HCSqiI1884386
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 13:06:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5J0R5BciuWwuPQ2vpVIP5RiP4poixrhGzqsURsuT/dw=; b=V46wbLoFAY100POg
	nr81xMKjLwGqYng5u2+d074rGih90bA7yo3K8eMyXP3SFn9oj5KfeV4xN8+L2n+M
	NqxiDdtld33y0aVSqZLeKyN/dtBtxSR0bjX0AyEwg8KIZdS2weiyRkgesSIHkAGV
	xorw06kJKeFm5P/wapfON3sEJLa81Yb0BKGmPMbh4HWq+cfbWHx430QZKKL0R+8W
	QzzXklWPei3vZcyTYWF1DAVKFn96TR6Azg2djAgqnER/+TOiSedTisppJu1auKE6
	1KRQqHxFGwEQT31X1E2XW16Rn24MwkUUnRDA4mSigPAfP0ycpCPnwRTSjvQgPYCp
	hQemjQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffhpfgse1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 13:06:52 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-737c728b37fso168754137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 06:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784293612; x=1784898412; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5J0R5BciuWwuPQ2vpVIP5RiP4poixrhGzqsURsuT/dw=;
        b=DnDJE0S5IFcH3wz3/7jS4Z6XIAOCl7/EGComDw5Sh1k8yi/uzQpX3bltWKbUW0d1hK
         li+GVc+xzzAoz3FTHlJuiC0gj2EcB/ed9pHTbC0lDHpcKYDvYZhDoJdkE7vuYAqV2EAm
         80/POH+GWNQmOxy1j4+ObQ26aIjje7E4BksU9ATA8/7Eh3jlKikvBOYbJOzrzg408gCL
         k4ql8YarxmE9FXY7MqziJzcURHVetz/LcU2Mh+D3FMSDzpLc68dTytdeRDEOAGaauILp
         d0ekHbBqeMUSlIXdjXKdUVIMSa1AfkCka99e3OpyfhBROlxfELNv/VBCh9E63NtPsimN
         vR3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784293612; x=1784898412;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5J0R5BciuWwuPQ2vpVIP5RiP4poixrhGzqsURsuT/dw=;
        b=SG46wK3C64nCMszxkYKbNnyqv0AFUKzKYzupgNJR2hVgY8QM1Obf3/CwE982RwuCJf
         GOtyHnGBpkPTeRKd4csCMXVQwrFjoOEZBPhEzGIWX1RlIojoz/mEY9JF/hPcMuaxQ4lx
         VDJ8cfuKq0iMCnq9ZAyGOK7aqIwMp8wBTJZVB8J4jfCLPV8pkcCz/TvA5ptXU6b5vigb
         yrqp6Utk9liu4E6OaPMZt+6b2ClhYMzLWeyqdOqvTmnpu+q7mXKmrQenqzQXlBEJnD1a
         VOcWDQWT5XrwdfEFf9Gmcjkex7goBBc8X1wV1ncmrF309hAvwRi9+Nq5KWAFTyZRC7l8
         hMQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrsi7x9h1gEHbfqKqb0kiDtVUElxkFYAbavywHVlcgmpAvLMaYD48icLNCa7+M/B2XXrYutkM2RNbKdGlYm@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/AiND/a618oNHlVUB+UXAPrgO+wV8Emi1FzdB2j8bl4bRSdGU
	zUcibXoTbNMRulx53AnW7aQ0EzL1V0qL5iN7d5t1bqJjLeea5TXLU6o05chg71Eu5GySUuGUiu4
	Nsqy5+wT3Ngu/Mm6Mo92iJZZwlC+mvTsMaBljfCo+k1SzfNu5hrkrTzVsL4+raqb78Zb7
X-Gm-Gg: AfdE7cnB2Tj8vsYJnayOPkvHd8sPw3KlktP0OR26Ncyg41YsM6Um5+aFm4cmrCM3LKD
	lVvO2Lmj6kWVjc020OhJzYaXLqpcfS8+pqhkNe0s0J508Bdtj9PdhRtjqJhS3A9HQM6DsKNmZYH
	gIkt71T3+ZB1V+YVopenblJ+FCZvshP/DWZo2BZL3nzrHsw1RLmoQlC0+4OT/JrMnl9Q9xDsq/Q
	Qi0KEbSr5FtIeUynftpT5N7Zf9O6WaRRps5jluImeB0whQ5TeHS6CTrVkGaJBwOWwulqOdGFRk/
	l2tzTjSsgSzIdLUV+jVMGQsXci5Jkv9ZUY0TyghTPG19/rASs78+WVS6vOMrtUzWOZ6sEyfh0W9
	2myOv+8Z5Bjkilf12fqFxUu9i
X-Received: by 2002:a05:6102:15a6:b0:738:9abd:9ebc with SMTP id ada2fe7eead31-7475315edb3mr200112137.0.1784293612410;
        Fri, 17 Jul 2026 06:06:52 -0700 (PDT)
X-Received: by 2002:a05:6102:15a6:b0:738:9abd:9ebc with SMTP id ada2fe7eead31-7475315edb3mr200105137.0.1784293611950;
        Fri, 17 Jul 2026 06:06:51 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6ffbba0fsm631671a12.17.2026.07.17.06.06.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 06:06:50 -0700 (PDT)
Message-ID: <6e7ae036-e63b-4f83-947c-992f3199dbab@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 15:06:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: display: panel: samsung,atna33xc20: Add
 ATNA40HQ08-0
To: Doug Anderson <dianders@chromium.org>, Rob Herring <robh@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260604-topic-yoga_submission-v1-0-57c70c23d0d6@oss.qualcomm.com>
 <20260604-topic-yoga_submission-v1-1-57c70c23d0d6@oss.qualcomm.com>
 <CAD=FV=UaPKiGSL6mhVdywp67skSr2B7977f3kZ23FFHaD=95RQ@mail.gmail.com>
 <20260605152825.GA3740391-robh@kernel.org>
 <CAD=FV=U7jz-xwA+-Fic2thZaK6eCDhc-PZ1fqpCMAUmy3V3Y+Q@mail.gmail.com>
 <CAL_JsqK6u=x=ScTnW1jJCPZpCUb3mT0NZpsKqe6PqZmrNEKZiQ@mail.gmail.com>
 <CAD=FV=XBn78eOC_zG0S2U-W3whrVYEpghKF_WgX+3zpUJ82-5g@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAD=FV=XBn78eOC_zG0S2U-W3whrVYEpghKF_WgX+3zpUJ82-5g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDEzMyBTYWx0ZWRfX3NOdhsw0xSIA
 Mm1LHsEQT1/hjNhAKkj/6UzzqG8SdB+VgLmXpNzoc313cRyBzc03dVXE2MssLsM5Bmbd18EbP7e
 chiWrLjGa9Jqr1iwNMQCgsc2x98WOBJBEsGlnUk3oN0ywr21t7CVspVkI6X3Jnabu9cY57P5wUQ
 vnucBLLst14g4SNsdUAqH7spi8AxzYhr2FRf/oSGBA7LQXsbQiEzXPgpPXZ7jiPBFpxxEqBarpq
 kL7APZR6pZgO6VBxMFL0uyVP23hIdjd3xm9ShNyZdzzoRB14PnDEN9pl27SnXELiYmeayMJ/zUM
 hgDlrlbigDOnb+UO8HxJeObZZ06Jeh/V9cCcZBRRWVCTF3qWL/8fE+pbj+1dy7Od1skPKJgD5C2
 pOfu0HB+nyQpy/3YKG0zcKSV5VXxKmu+UV7UuPy0IHiy4kVTT9J6rTATqR9RZmw6/Iai2M6xLOr
 RuPx2kfm+PHrrUQUJRQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDEzMyBTYWx0ZWRfX6l1EgD8TWE7O
 +oT8OIzBCO1Hjzhg5CtWUsHhJwZ6JHzMWRhKqR39Alx6VXgj9Jp1apU0TIt+IrrHLkh4glvyuRF
 ezRth4C1PCzwJ3lxt+73Vl94bmoOkGk=
X-Authority-Analysis: v=2.4 cv=YeWNIQRf c=1 sm=1 tr=0 ts=6a5a28ed cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=wKqDAqYL2PsMjTWq7uAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: bYOCgzPLiblEth6wPP23fKiD3mkIw2DR
X-Proofpoint-ORIG-GUID: bYOCgzPLiblEth6wPP23fKiD3mkIw2DR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170133

On 6/6/26 12:41 AM, Doug Anderson wrote:
> Hi,
> 
> On Fri, Jun 5, 2026 at 10:14 AM Rob Herring <robh@kernel.org> wrote:

[...]

>> Well yes, people have a hard time using compatible strings that don't
>> sound generic. That's too bad for them.
> 
> OK, so sounds like going forward I should NAK changes to this file and
> tell people to just use:
> 
> compatible = "samsung,atna33xc20";
> 
> ...to mean "Generic Samsung AMOLED panel with power sequencing that
> matches atna33xc20"
> 
> Yes, it means that if we find quirks with a specific panel later, it
> could possibly be harder to work around them. However, since we have
> several ways to identify the panel (via EDID and via DDC) this seems
> fairly low risk. You can't perfectly predict the future anyway.

Are we going forward with this guidance? I have another laptop with
another ATNAxxx panel (ATNA60HR07-0) that I intend to submit a DT for
soon

Konrad
