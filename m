Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421607;
	b=1C9gn5J9co+DcCu3gH7/cd0rNCwXD6xOyfKzVDdMqj8TZJghYJxIRP3ytUZvIXTVZhBD
	 lys0bvyybesU4fy1dGRd+FAN3Ir89NZ5Y5H3ORyCTlE5odgGcPURNjctjQY1XSL4klpLX
	 N+7vD6RXs2IwZWbrGjlu1/UJf5EVmbRdV6rFY9DCKMoumGrr4JkYEz9HdlDfkEKZEBvVF
	 2mbPic1VTYqkQANQ3pF1ZSEMWhNj3y51HMlT9ysIZRauf4BGrdOQnViQhkr4PlZNFkysf
	 fWaG0YP3wdZJVE8m9kqZIu880JUm1ppjnjLRE/d/dxG8hWlm5+kQBbCc54NaAmgALxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421607;
	h=Received:Received:DKIM-Signature:Received:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=j+p9fBwAnabUV3i4xKq7EVOzYjB0p0hPp6wh9smUiZQ=;
	b=yyjrl/f6hkeqUe5Q02ZjCcmrfqR9WElQwtnvKz9PxRlIcyDZYfTIuUVP6tn0yaO3CP9a
	 HBl8w0YNVhD1nj26wW807LYfXnseKK7nODLx9CO0+PWBIBmr6bBvljbJElRQzR7ov6/5g
	 zHkQfRnUNAaSMqy7D/DowdZCXY6vja+TwWPEp8bkbfesJMk87NsFZVc2daQtLOO6ahMdp
	 qSZMV8gHqKITlKfzfpi/WEOZuNYWsODM3qnTYPxtxm6FYYGbYG2yYRIgZ6tWg6J3Wvg/F
	 Y9n7zCzh1LdRhuqHOsfydlbaUo2OJdJbeDT03RSe4Ww5JcOYS6QndL00tbAsbw/0kSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KLH+1rr4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fK5FitJr;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BD87606AAFA
	for <linux-arm-msm.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 14:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KLH+1rr4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fK5FitJr
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0824C846E
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421607; cv=none; b=C5AX4vehsv2e5AnwOsZI5u3DFk8DirbCRmzVR1a0LI+WxKqV2GNr9R04iGlPVjTz48ehHq28iU/oF4qTTqaOc90JPcQtw2mg25e9kO/0ft0xk5j+YGBXluYFw4C4adfls2jnrDLkWrZUxfRxYwa0ysaGEHmacb1sE98IUTw1A9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421607; c=relaxed/simple;
	bh=G/kjWIzcC3oPmLS9q/TvtvOucNt1bc2bS8JpSzIl0VM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G0Egh+0kh7Ja+II6brIzKkoYMnAKHdod/IftlZHVrsH0+zn15ah8dPTAfmVmzTWPQavDYuzsG/WQwopu5doj8YAv+RUCBIGXy+KCxRuT5uKso+zCRnC/MdurUBJmNUqKJIgVhgBD48lXaUbBLU0iYc1tHt9cjcdV8/Or+rloa0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KLH+1rr4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fK5FitJr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0ite1904125
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:53:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j+p9fBwAnabUV3i4xKq7EVOzYjB0p0hPp6wh9smUiZQ=; b=KLH+1rr4147Ms2AB
	6RqJrPWDDnYZaWNnrObaXTkZWdce6WgGf6dwdf6RZJtvMRpbVtBALjuHhqez/t/L
	v8+NZMdpck17lxe7YVHLcTUw+Mkbt7C9y81Sk0iD+f0W2Gmh3r8Jshw76A8WF1FB
	Kn47TPuRTlogof/oaPOCXBa/emBdA+DOFFgbmozdUmg2dP4AeBNrIZNsJWfvdqik
	/wt9Mn8ITAibwrQ4B6NrUG24PbXqX8OrDeMABHn39MEK4IN7XztTXoeu611n2uPj
	me2URMHEocYcKfGrpgsczO8CYyA14KL+GIQH0P3warigUQpDt6zrCc+jeFzhDGxA
	XUE8ZQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf5c9qj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:53:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb1091fffso20611585a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 07:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421604; x=1793026404; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j+p9fBwAnabUV3i4xKq7EVOzYjB0p0hPp6wh9smUiZQ=;
        b=fK5FitJr8MRY8YX1lZ/LDMRb1kP7hWJ7g5WV58vkZk5HiGA6mZUaDUOT3MXJD/xVv5
         i5TkmQOirL9PnpxiuBgA4h2sA5qINyKWUHoWoi3RtzpIYhHWNTjsO5kc3wpcE/pAZFCz
         cJ4npod7S5kYGwFkPZCKg1r4KkQbG4mZBE8eahMqDrN8rUuW4rDz6XV3U1IMkBoKgBgq
         PDLgyZGoe1078C4kb5FeVQunGXEvwSLCtXj1PIyasuP5MjGRpWxa9yCdlBzNA+miETs3
         yRDVMzKeI7fgOEQV5DFvGeCQiUo9eHOLvx/0Oa6PmBE3BrzdHTWBEmFmPElcIKalV8CK
         oR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421604; x=1793026404;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j+p9fBwAnabUV3i4xKq7EVOzYjB0p0hPp6wh9smUiZQ=;
        b=NpXFrGkWetfzyr7fAmkiYo/xbqNE9IW0nVVSWUURXSnpNJVNUUQ1HbKevqYtRTsxdM
         pkDDrCgVSCHeaDVRPzMxwLzq3nluXUA8jgbD1HtRA3cfCVBlmjAjN09uV+9MGgPODPSC
         L93uUNn3vu3DrTSZ7KmHFJrWH1hbcJdEi3QgTdngMStyly/R8G/chfEf2SZZbZeXcZXQ
         Yx8yEAhkSGyECjU7wQ/635ArlroNiJhzxrhIX26hyQk5x3PLEFykrj3VvTjKHv1GZ/qH
         mreqctXqZO6hjweliV0xZ1i3Zx1VbifHM7bFtTi/T8cjIsoA8gu2nZAjwqglYqW4OBOD
         BUeg==
X-Forwarded-Encrypted: i=1; AKwUvBxGg9KDWTwl8C7kmnOkKUSW6ELqIxaNlWpiJWsBH6adIeZj5hIPClKnP/zDC+a1JQ4TUCmWy/Hw8oHRy1p+@vger.kernel.org
X-Gm-Message-State: AFq9FYLIngVTnTE6QBSOFhXyO74Ggc/ZxIgxCaOvCJZAEobdu/XwYFo2
	MLkduDTegGFMpEw8J17/qDl15+24W+Aljw9o88pVU/zAa3Z4Ip62gu6+PFW+VKymYYS9421+onE
	FNjmp0eAIDWLQUx/G3SHQEIr4eg9oDmMndPM1iiLJNbSVTXWJGPuABbz0QlY4m5Ex4T60
X-Gm-Gg: AYBFou15o2lpeS9PtJHU0rCansT0aqeVunDJaNR75azRJM5MIUbr8R0CdZVpcDw9H46
	L7CqGhkfoa+SghC0Vxr+50uMeJOYJvqZE8Iy3xwhCXbDyJ3laBAnFJCIlhglMvjOuHs5vUPkfAr
	RNW/J5oTFmJxcUaCy/Sxp1w1UDrfT7xFuCZEJ39GwRzgmpnr0MaFq/yptq86SWBxoBQxRqMTMEG
	RYvHO8dAAF3CD3p/oPKGBPyBFZ6iAQwEX/kRF/p/MZ+uS72lgq/2oTw6PoGhredWYnRlQiYuIZO
	l8e64nA8wmKfCBmwEl1eyMnow9cXVKJIVokxdddgtgGkGhP+vQb6E/aSqDOlKCgwxV8QHcmbyWb
	rAqn85uw3FQksHKdTKIAeEg==
X-Received: by 2002:a05:620a:3904:b0:93f:977:5d9 with SMTP id af79cd13be357-93f29a13be3mr1426527885a.0.1792421604028;
        Mon, 19 Oct 2026 07:53:24 -0700 (PDT)
X-Received: by 2002:a05:620a:3904:b0:93f:977:5d9 with SMTP id af79cd13be357-93f29a13be3mr1426519485a.0.1792421603076;
        Mon, 19 Oct 2026 07:53:23 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb2f64sm365653366b.77.2026.10.19.07.53.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:53:22 -0700 (PDT)
Message-ID: <11592f75-bf83-43eb-ad51-ab3aa77df0a6@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:53:20 +0200
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
Subject: Re: [PATCH v4 09/12] arm64: dts: qcom: pmh0101: Enable BCL sensor
 node
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-9-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-9-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfXwtD4rJdQzQB3
 hsPkPbpq6S374D6DMsCBgusd9rFqVIkxfa/9Nrv7nw0EORvXcCjlhY0r+O0tX2G+piOMrUMKp8/
 5H7QaXyax6rCBrbfBzvulQrMKVPmOjw=
X-Proofpoint-ORIG-GUID: e36IbFakN6df1u2nF8XsUkqr4cDNfPHU
X-Proofpoint-GUID: e36IbFakN6df1u2nF8XsUkqr4cDNfPHU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX9GGfY16JmKzD
 CVS9fV1WCJ+kioXx0975KODst0FkmUPPfN+1PePH2L1gK6aKe4WTRWp2k0WR60UcykRO44jN4/+
 Y+uCB0xxBtD+702GCcu+1Dn0x34y1Y4NJuOVEq4cPCAcqnqq1BvVtoSl4fM7dRHHqq5bX9MSunU
 so2k2b7DejgAMz1xVlmL4b7/C8P4aqb/Jy/1TOK7Y1VpR3pXrCzBJo+kvOE/zgPwNj0Ruy6Ujlq
 XtsjyySiLAdVrs9M0zQePlln/gWNVp3RFjOLA+ZZsIy/9RLi0qdrS9WW91AX17uWiAyhBv6Pb+0
 5YcSRgWcOVAlsV3dMfQpVW9zr2Fc7Zm18I+dCFlvN7UzAFm7YMZu4IuCAMi+uM21+E/ped3hm56
 kmiIe2xsYD3qPiPF+isE9LGI/hrbj08dXaxHpqWTeuQGCTTqeMFvY5HuOF8VirBPKKAmDrfCsAK
 BvVC0OcwhQYJ+iQUXCA==
X-Authority-Analysis: v=2.4 cv=K6O3jCWI c=1 sm=1 tr=0 ts=6ad62ee4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=zUvQE7La0P2yE5F2ZKYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190059

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pmh0101
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
