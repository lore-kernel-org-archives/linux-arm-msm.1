Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCB14457C4
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385010; cv=none; b=BuKpZAfvY7I4zY9QkivAcG+AjmFvUYviq24rUqGS0yqPYVd3jzc5E24bap0+1XRQ05Fpw+VQ9FFDhX85VbIfugbgU3b0yefmSOX44MKagQaPnEdp+IjX8h+vWjF+A8GPYz/bRpy6vKnx2IJ019jgIqQKR26lXHoCiMejrMlxB30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385010; c=relaxed/simple;
	bh=9NTdtJ/TSp6i9fELQDWEuFYvwbqy3ev3R+H2YTC2xv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PfwLPKrvMl/fAdQEwimz5jsXVW9HBpVyz1xde1E3N+rKqcbhZAicxUn+kU2MsfDCUEOZT5NdXUa5BgzE2HuphpsjBVwQfkBpu+/HHoJIIDq4AnC7tI7FWfTpqoUra7+R1pYLoCUyYR6K9pxfptnjwG+pZ70ueNZUydcMf5OEmAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E/WVOCmY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DBkvD32a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E/WVOCmY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DBkvD32a"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm4Cs1216222
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:23:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C99yA2ahM9Y0TtIpiFt1fwPT2Pp5VWgJygOu7Ai3npc=; b=E/WVOCmY/+5Enkgw
	YEeOQ9dPHJUB8CWxTR20yFYOlY8UkoMJaYfEbZw5mtWvnO47B9tf1wMQPeafNwuh
	wcPa+7jFxuwllxPm+71b/159YFvZtg/2RACZvfhGXsdX3lRflqfucbjNfAT60rpW
	nT2W6tgRlLZN6L+MSJ/TNerjJkANtic5DzviOrYF00TQxSgNoyEqEGVr9kcRPO/3
	gIuOu7yV0ud+xAE5Z0o7WnQCbf35GMdm9FpQLiSsBTvoxEBODy0Mr28DtrxMTC/P
	1BajQAshRn13edHqPJho+jbGH0cD+CYPJc+8jjhbFR5E60BgJZv+Py3P6XJNpBgD
	ZRcYpg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k0a884-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:23:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930a312222dso32874285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 04:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789385007; x=1789989807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C99yA2ahM9Y0TtIpiFt1fwPT2Pp5VWgJygOu7Ai3npc=;
        b=DBkvD32aqxLI9wF4aZReOHHt/CFbFdO57QJR+F3NG2uXcngQ3T5t3M+Wwif4/b5TeF
         Gdd43OED+A9EUxcSqXIcIhXl4ZE+TtOOs5Rv/f100KPKnGVWXwGjwLH2nKIvuoHhfKn1
         qByFWjWN642E1o2XwSctAqayln0LUI4lr2Pva7qhPEY8br3fp0A0xjV3Qcw2T7caLw8D
         HQTAbjtuS4TB6fGo14k/A4bUkCzaPxCmKt6VAnhdmDSzkEylDO8HUfGnuaxkx4yNE05Y
         qd9OPVQ/ZG9qf0nDwsMjNq5pbHfQr/dBm7jJJ9kxXHRuta8XEibTAXFKsr8MXIcUwIf4
         WWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789385007; x=1789989807;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C99yA2ahM9Y0TtIpiFt1fwPT2Pp5VWgJygOu7Ai3npc=;
        b=Eok5q/qxoWoUlmhgKGonhVMuTlmrIYyp8+ljxhbTMtzK/b2NXUblnuhgQZJqFUiBEN
         nVANbzVY6KnfNCep6yt+QXMktxofbmGLer75MIsQ03nKW0d0Px174pCe6zAgfLgYsIQt
         xqT2TOsoqq5ZHpp7yOeGqXjTPqGMcoXKcuaN+p2kavgAQ9Us/YFsTclS3CT2E/8Pxx5R
         SrQi7psY/2Gl+WxN4eGBpYAWXnmgJB6p8TSBH/Co/YaCqM1Gz+/haiY9IaDQXEcuVlO0
         4G+49b48AS8OtKTyGR5to/m5SFSjhbvEWReSaNo07WEHjykhJunZFriDfru9ptUzj8RK
         f+6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzg9Wfvx7MvSsnX7dPXBkpHK7+CWRsvU5FFh9rTzMGXmkuIkfgPsOFLMcn+WhRPCxUHHEESuioGjCIHs2lN@vger.kernel.org
X-Gm-Message-State: AFuF++l1qNAkFVQ6yUI5mmJOydujgBvpdORJ0H5IgvX6BRLvzdHZZtGD
	mKiGOJ70BAr6l2Ndge3g9I0Nb9o36niD1pFzrb9Iyk8PJ4kdc3CFOjYM3jURARiTEMf9CohSPMZ
	5fBYWb9SfU9GQQRKG40B7KL76uxVnCML4tjnpYTYarSrjwi5wNYKBDoFbkd/1uV+AV7AD
X-Gm-Gg: AYBFou0HtbYeHI6PuPRCsc0tYJsI5OyNo9Kywxeq6BuQEU8/H+B8hQq7r1WvYJS68FG
	QWiMdVbEGKdUO9GmifMDN1rgq4Y0jOa8iCLYID59VIpJHPGUOkk5LXqdDFA6EgG/ufPbnDHxmZl
	a6mV7qDOS6wlUSGIS65AikbqZula3xrnJzE2kabbhe9QWp8BkQKD7iwSQZzC3UPaFej+v8n2qAr
	yEu5LyN3GLHzEyTu4FJchLMbXpxRmMr14zTk3n6DlFoQWJ0fX7hFcAPMW4Ev4V5ChrI+thv0+95
	ZSKekc5Kgl6M7mTqKrRjzXeD4m1GH1tTQsQ8byGeiOzuet/8bO0/kxUozIDqZV9k98rdat0VPyI
	W2L4x50YLMCzMUQqonUpXQQ==
X-Received: by 2002:a05:620a:4555:b0:934:95d9:85fe with SMTP id af79cd13be357-93a29a8d250mr214248885a.3.1789385002606;
        Mon, 14 Sep 2026 04:23:22 -0700 (PDT)
X-Received: by 2002:a05:620a:4555:b0:934:95d9:85fe with SMTP id af79cd13be357-93a29a8d250mr214244085a.3.1789385002074;
        Mon, 14 Sep 2026 04:23:22 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296601f4ccsm406660866b.20.2026.09.14.04.23.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:23:21 -0700 (PDT)
Message-ID: <757e124a-4c7b-4d3b-b73f-19e7e39f2677@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:23:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 15/20] soc: qcom: ubwc: Add UBWC config for MSM8952
To: muzafferkadir@mainlining.org, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Lee Jones <lee@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, Dang Huynh <danct12@riseup.net>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        iommu@lists.linux.dev, mfd@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org,
        linux-input@vger.kernel.org
References: <20260912-msm8952-initial-support-v1-0-0e742578b524@mainlining.org>
 <20260912-msm8952-initial-support-v1-15-0e742578b524@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260912-msm8952-initial-support-v1-15-0e742578b524@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE2MSBTYWx0ZWRfXxQA9/4KiVttQ
 ZXAt6YuzUjKikLS0Z6BDgUG9+D75330biAuPKTFrFhoT3JRJYDMm3PlW0rLyLy7Shtlxa9guEQ+
 0n6FWOIjxqlph5HPHeA+SZLkwrv9c0o=
X-Proofpoint-GUID: NJ87RkBjyGfosaySTdwaRIpLTujj5E6i
X-Proofpoint-ORIG-GUID: NJ87RkBjyGfosaySTdwaRIpLTujj5E6i
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa7d930 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=OvtQcJRYg_U4C0nSOkMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE2MSBTYWx0ZWRfX3yW6RTTDAerX
 VzXD3a/i8I4GlVkKxAu0TFFC19ZKfN2iJDNEkBH7Bh64lOhO6UQBBhQXRKQFgWYkGcMMbakHNXE
 +PLfGXovuivRLiILdFW9UgvLkCCqKjYKz03aLqRISIcfGnhdgmKrfVYwDScwl6cC14+2NheGmlC
 Cj4ic1xDH5heVevxuzqy6OmmRbXaJyB87M6wa/T3Os/G/NSjSSszHAlujlvs1mlclFj8wlPDcti
 YkeMjBxVO+aRES6LmgtZtp2TJ8V59JKaZ3D+QH2LP5xX97/pOiEV13MP1CSROdNsqJGqki78GJ1
 SWNe2vwzLKXdV/FUjTbKmDkOobCEQ8ZdNboqfDRmbbNXiqYLBDipJqgGIogipQsNXbC791qFBme
 b52Xj2psmMDYrSsBBPyLXNa23d9A1ngb3RlyRmkR0ongzudwaRpqtswmkYo6a34JL56zTYjRoAj
 xMyg08KedIVQ/ee+zjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140161

On 9/12/26 10:39 AM, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> MSM8952 uses Adreno 405 and predates ubwc just like MSM8939.
> 
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
