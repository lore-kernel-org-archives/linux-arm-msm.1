Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29F03D3305
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Aug 2026 17:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785951792; cv=none; b=ikvVdBVLXYMkd/FB9dqJpE6/3c5e+8Mj9GtldmZQ7pS0HOal0Sq5DNrP2weAms7FMDKKrOSreURAhwwbMHKRqlKM6eIi5/buNITw17hpuIe4+mxcMRuLD3J0ODBeVszZpowHDzHNOsyx1i+uOPGhVufyIXWto0qCnEJ/kHEyeTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785951792; c=relaxed/simple;
	bh=07ypCyMw1Y1DkHyn6IJ9jzEBekZq2e8qxAawukaGOdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r13fmZhdc/Ypv8S+v6rtypdxOnPmoz0/3za8aqEGUflHMHlMK6ZRQrDMNqqMBFzXjLeWMQ2uOaRyIMXtmflpaxMdE+a3cGxNiH5H0j5byWeIlKcblbMYRT66NiaZJ6uUSZJ21cyGASqLpwTPIT2cxEMWUesqujT2ZQVFsLCgmf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PzUl/HrK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f3emVvdT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PzUl/HrK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f3emVvdT"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675HSMS03561234
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Aug 2026 17:43:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nBgw39pYZbgIiZ2V9ir8GoYAeYCB97cB4QUU+tWM1ZU=; b=PzUl/HrKOa9gIM7d
	JdkBwF59X72TiyiwV9JsbIO+ND7rOEAN9f7Rt8Vt+RAIzCqlXrwxAr8VuBi2kc8b
	mrPMJ5yRUcHyX3PfZgjIwpsiSkxhZyhn9jt8KZaLpgjsjefD9oDfX1FzjmCcrsIl
	lZcaRGp0CrQ9I7yVard5MfAAs/WwKO0FmmjhFICMYA/fDhAET61KhrA0oOMnopZ6
	lbs1Po+34+rYQkDF9/xUYnIidhDZDzoRDOL0OcvVsurNsFtzltNWolrLBcOQxvmI
	sfEdvIz98pPMdYema3L35VNsgbmqt1qUGymVkrHwzlSzYDE77s/Fs/WLZYfl9RRx
	b1uROg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5x5sbg6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 17:43:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc73f47bdcso20438885ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 10:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785951783; x=1786556583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nBgw39pYZbgIiZ2V9ir8GoYAeYCB97cB4QUU+tWM1ZU=;
        b=f3emVvdTAl7VuvCxHxmHpKJ1R2ietv2FxsQ8AGWXT1rvLjY+JSH2KVUYwRRFPlsAQA
         kpZr+rZL9r+TltctrPpVKt9DqzRNloUYBLqQZ/FCs0cCwOdVotBC6tIKbwa2bMGmG2mZ
         sJjCp7WdNGO7nkmUT7Im53DzlI84CbKr1lN2DFgKXIAuPVqGcgfgBhphSZ6IjrRpDDyq
         XGWTTTtbsq6Wk8dyzdp1lP7UDxwkhPfVzI/2fHpKFXhqBZhjJDyn4zmI9e31PU3bNFt8
         qjXwThm+pcjWOV6smiaXIXMmYmpdZcXcXX3OJXawaZ5p1hRcM/j9lm8VR/+LUIoZPrJ2
         jqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785951783; x=1786556583;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nBgw39pYZbgIiZ2V9ir8GoYAeYCB97cB4QUU+tWM1ZU=;
        b=ZI1FOLHq8TUn/xRXVEPewiQeGz2qk2cnXCFRFT6NM8Q7cmFf1wxe0EpoisFerfTI5Y
         ap6TVnkO6KYQGGOcmP4rgUPv12pyGkgqGJ45xe8g2CPpHgrMDKCvy4NceGdyqRulSHre
         IDcSX3f9dgvGMeuJMRrQ+95FPrNHqwiFy/fv8c2epsKi0MuiBEGxeu07UOgEOl15K4TR
         tcX7azXXqNUyW1+hdSuvhvqVE4x/xmzgOlzlII8Na694bWHh6W/hHWPwPx7UecmnGvBD
         jpGA04zVVgwZVampYIhbFR39uHdSmo0gHZiOaStOAqp0XNwbjoaTR1uG0R2rxunEJuHg
         Yx2Q==
X-Forwarded-Encrypted: i=1; AHgh+RomSt1s9O0QG/54CLYbHTYPPn0pdZZyDGHI67OWwiw2TkSRJpSyAQJ69yJEwCjF+dC6iC835xz/yR+0lcSb@vger.kernel.org
X-Gm-Message-State: AOJu0YwCRb3f2UN3D+lv99ZXwBaf1vF6RtMDYwKvQ4pVHbBBt/S/KjTA
	SHVurZzibw8GKnonqxoglPoc2qUTtg7PQy2lJ1DFv5TCpnuPNqDx8xrGo+meJuAn35R5Ok29tEH
	aFVRkgzVTRl7iREKNZv2IsnwK9EP/K6akEHNH4fcTLYZbDyexlAz6V2DXag4l6jOFMFj8
X-Gm-Gg: AR+sD13w0+cf3vFZJeq2KFqCMgYwid/cOoBNJ0Vzw/qtGZAsBg31OlfNFUYI7HJEngX
	iGq83RC+90xH4w3vFtdE/wivPZhe8+Z1RkNIHgnO+sibtvRdeTv9ZmJF7U/N8MeGqVQJDamUZA5
	8kz3emWzYRIAKxO5Fr09vKUqDKMXIp9V9SMDUmd/XgojP5rO/Tav0H4X/WLxrew0LbDWAlOsNkQ
	3KXqOnmE+OLgDUzjNVai28KsEqBhdLRwfaC9sUYL/s8s2aKgVjK98ru+BgJOVUm+FxZ/Do5BKFW
	OsMuY2Hnzytja3hnjB64oAQkOG/8IC6weuU9z8r7lJOAEgVLOAMcGobk1nN55CCkfwLdoSMvq70
	SaTYPXzwniMZtLdNWCYd9uRGDb6I=
X-Received: by 2002:a17:903:2288:b0:2c6:8d95:fd6d with SMTP id d9443c01a7336-2d0ca98f8a1mr93789325ad.21.1785951783528;
        Wed, 05 Aug 2026 10:43:03 -0700 (PDT)
X-Received: by 2002:a17:903:2288:b0:2c6:8d95:fd6d with SMTP id d9443c01a7336-2d0ca98f8a1mr93788605ad.21.1785951783054;
        Wed, 05 Aug 2026 10:43:03 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.24.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa49295asm20647695ad.45.2026.08.05.10.42.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 10:43:02 -0700 (PDT)
Message-ID: <0689a62b-28f4-4c90-bea5-065467d2ea9f@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 23:12:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: gcc-qcs8300: Add support for TSCSS clocks
 and resets
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260805-qcs8300-tsc-clks-v1-0-e7a5101ed479@oss.qualcomm.com>
 <20260805-qcs8300-tsc-clks-v1-2-e7a5101ed479@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260805-qcs8300-tsc-clks-v1-2-e7a5101ed479@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZlY3fSc_cXhTvD9M6AbIoWRQKF29bG7p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDE0NSBTYWx0ZWRfXy/MrmFWCSAOc
 kwJsULWW3AcDvcPpcvRr94Cp3hkpzJCoT4yAxdmVcZZ8paOHdXuKpEIxe1Wz96FDNRhjgtUZsZX
 3nWRTzkLc8OuLWz97vPKua3wrowU+spPE5N1wYZjoPOrzXeto6P+PviVbH+OuO9ApUJFfxJBvxx
 jjLIJR7LnrFayK/9jD3DYzP7A1L+lN3361kVENhfhoucH/LZ+erklmAEK+1oD5h4v4RjiMUbBjw
 lljgQ7Ks1i4VCzNM6jfE3aCzA2aDlyMKl7V3YpAWUJOQe3ZkM107CSrbXp1vJc+U4jchGRFsPPZ
 /rDrgqzXS0WD33FWE0UUxMSwsQtIc2q74CqHVKz6cXRstZ5Z6YOO817l2cEAh/0vrt0E89CQPYH
 zTXBqT48W9YaobMswMOHlcxHRTeSCZP5kkxCSPKbKK6r5AbgAcj5WL/kUeC47VjzOi/0exCOFRH
 gtKhkyqtU/gTJzsyvNQ==
X-Proofpoint-ORIG-GUID: ZlY3fSc_cXhTvD9M6AbIoWRQKF29bG7p
X-Authority-Analysis: v=2.4 cv=RcygzVtv c=1 sm=1 tr=0 ts=6a73762b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=zf9A3FKX68OF7GX/VhWQbg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=J0kFQpeBCHEeCUjyc0QA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDE0NSBTYWx0ZWRfX8JCHCe8vulBE
 P7PNOYS7kyr8elwmSaJUQyrQjWptfvjZwJDFqnx917fqXTbajXU6hiV1DxPauc0mxqP5M/+HqWJ
 esLu5ScsJSMd1evwwU0N/dWRJaLJxGA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050145



On 8/5/2026 10:17 PM, Imran Shaik wrote:
> Add the GCC TSCSS clocks and reset support required for the Timestamp
> Counter Subsystem (TSCSS) functionality on Qualcomm QCS8300 SoC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-qcs8300.c | 103 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 103 insertions(+)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

