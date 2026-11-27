Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795783026;
	b=l/9cjD7cE9Mse39Uj7YNr/gypJzi83D21R5aDrfdfksSP7W+2VR4YeeYDQh5HA5V5n6i
	 eTzGUmiWSWdSnarPxrOwW9CErQ/u9El6VjLgz5mxS7vJOevuSUaHymhS/HeXA9QO0AuOf
	 0At8JNjQZM59qQWYWs5jWyl1ZZ/vRvS764QhsimrEBwFgZ9+fklG/F3s6qZ4K22u+jVvY
	 cYjjgc41QCNwA0/kr0VSY21CdaofCH6opYgfzbLbTDLItUvp50s1Nbmu6K4ayPa7EueOM
	 8NNUBDwNZbSuC06USs8zz0czdX+MunTrL9d9Iizc79POHgWByIr8UYLuYEWSxgMmaSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795783026;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Hh8c48r9GrudpQXzXEgvdFAldCpWfhxNFka640a82Bc=;
	b=ZZ0+XClqcnlG2hYT7PITJorzM40sMlabJgkBnVzSYNVBJ2SiV+iF8SSG2NfX8T+g5S3y
	 r4JM7geLFOx7SeIAq8T4qBmSjojsDHxBaJQf0TGTyYnUamhXE68KR/VsqbeGcAJD5FOQY
	 b/QYs+ye9S6Kthb8Nl3sX7pEd7yZwO+IZdhRjW6oqF81X4DC/Z6l08qWl0DEqjd4OlQbN
	 YyLE0ZrW/UfoPXJlQ3jlvr2LEhMhwn0e/x8XudeUHvhbj73cz2uYR1vHu38NPoyazyz79
	 FAnCyJv72LZ6Zua1PQ3WyqHaJd0pHSWjkdmsCPKS4Af4BAhmanjQ64CGObSezlxMw2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="j1M/IWo+";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AVWT93Cq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34639606A321
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34639606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j1M/IWo+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AVWT93Cq
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApAdW2677162
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:37:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hh8c48r9GrudpQXzXEgvdFAldCpWfhxNFka640a82Bc=; b=j1M/IWo+FcBGsw4+
	K9HC2uueshvm5urAsoG24grMwN3cYSVizBuz1Ya5f/51SqolpAmiPif3k+QyAGKi
	Tlkzjua7JsClhrlKnl9jM8PH/StObrmcOiA4h6nOGXdhN+BsCD03urAiWSqX1cBa
	d8PNKBF+89kgtIOeS6Ge/XkfEQba7gsLk4Yg0aHHf8Ytwdvr3XYe4AChV0OBUpzL
	wpxMB6Xmz9AP0BHsJAo8u0BbqyRASeiOol1II/HKVznBG1N+hZ1UHOzkPXSb1ZjD
	WtJhI4qpyTCUU8Kvxt6Vnva9IMWGHGh8Y8ESpOWJEcYGJPkoA+dCttM3pAszqYRw
	Lc/m0A==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gh9dh8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:37:04 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-14373747468so7723818c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 04:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795783023; x=1796387823; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hh8c48r9GrudpQXzXEgvdFAldCpWfhxNFka640a82Bc=;
        b=AVWT93CqGnjbYU+lgghuuQQ8G38o4CfXjYy2BwUSG183gqUEoBVqAIcQfuo6WCrMLG
         TZgHY8/wL1viI7l3QFfmg45MRaaxSk0dsLEdVIiHp6no1/ItEADeaQlJZFTkjvBL3H2S
         Xsjw7bgXQvUep4URxW1kJuG2jVU0iXI3O9dUEeGOpq2anlZEBPh5bXHVvay+tREc8Vol
         If2dp6KSwKNJUPvC0Y1u+WiCsOmjJ2IKZvJFWw0ZCr/twGlM1LMiip1lpRd16eUIGRMX
         vs/auD9CqFvM/8Jfd4CJwxmGUgaATauPSxy+nJKMKK/m7jWIvcN2R06FrMCnjti79qrs
         88QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795783023; x=1796387823;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hh8c48r9GrudpQXzXEgvdFAldCpWfhxNFka640a82Bc=;
        b=QbPIDBJwPaMc2q9Q+7EMIX03OaI4HAYtPKt7v+jWqoBWm7oIPHpyzfFBfqQevH/lVy
         7aa40FgTBkd6CSPcMhV1sH9vp98wtwYobDgC3pM34ab8d+2TKktAoo5XriQi53VB0QFM
         X1z0FR65zAacWPbLZJoOvLCocT3AHmfveLhpjw7UfXQYwwsnLg9JB0VHn7pUHNO7tJQm
         C1+zsrT/w9IxGYMpH7AkiH9NrHDRXW1si7FNZEV/ddMcR58RfXG3/PR+j8KWr6L74Iho
         a4K4G1h3vtzCWWclEqiT6dSnIwYbHD3OT9IpsF9PEDJLgJ7GYo9jWTBpGZod/vgxOOp6
         szWA==
X-Forwarded-Encrypted: i=1; AL+hErFzdHzd1FGMffkuMV/ld9z0Aw98FWtEpgSLHEfwgoLCyJUbFF6g5Hg76ffXy4+OryIcLri3vGPkhV7gIXY6@vger.kernel.org
X-Gm-Message-State: APuU4Z9zcViEaYatoVn3GvMpj3hRTXhKfXm+VpPt5rxCak+SjGE89e+c
	W6IKJEPRTnlrekeE2pDGaOW1wAnxxaRvxgEXf1ecFVvAGPwXUqN9V4EgcqNewP0fJ4qyLrE6zeG
	H1DGEc0kOXGsTEQaYhkvQ5F0o6WU2o0eNruxBIjxDCuBmLguMwAOYO1IrfPEhF6Dd0gAu
X-Gm-Gg: AZFdTZfFAoYD8IZl+SyDV97efSl4RiOL8qABmXF46LvBnlZPKGaFAuKWbQ7irCS622+
	v0V99JMipd7wH7XeU/iHsbgFwJIC4e8tqDr2qAJkcOfbPGVcaIrhyonTHjsmyLk+tY8XHaS73Eq
	fIGKEaA3YwGCGyYBqDoVVoL4GY+aVfk54D0/WbLCJNJmzjUsFrG31d96Qp1lO9Eqh+VZ+6GTaWz
	E2s7fZa/vzZM182x897u5+pLxviTTAHfotiaVgAE8wStjNfpO1ldfCJIe7APpW+oxIKx0FD4FJB
	Ceg1XEr8Xeo/ZWr0OnTVB9V4/dppR3lC7huUrCd7Cu4WrSl6aVVZakukZTP8qz2tAAxLbkWTtYb
	w0zxyZIGBRGCnhMxyHFyD7l4LXHqoj2v8t92LEHIfOlDeWVeFFJ2izMONsYdp1G1z6YrvGJ0AJu
	jZmYFh
X-Received: by 2002:a05:7022:290:b0:1b5:dc3:209b with SMTP id a92af1059eb24-1b5568ac6b0mr22594263c88.22.1795783023133;
        Fri, 27 Nov 2026 04:37:03 -0800 (PST)
X-Received: by 2002:a05:7022:290:b0:1b5:dc3:209b with SMTP id a92af1059eb24-1b5568ac6b0mr22594243c88.22.1795783022646;
        Fri, 27 Nov 2026 04:37:02 -0800 (PST)
Received: from [10.206.111.23] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b59d8c0cafsm3430688c88.7.2026.11.27.04.36.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:37:02 -0800 (PST)
Message-ID: <fd5edb54-0ee9-4aaa-ad0d-9e92c15e6779@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 18:06:56 +0530
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
Subject: Re: [PATCH] media: iris: Fix encoder reference buffer size
 calculation
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261031-fix_enc_ref_buf_calc-v1-1-54dcba5977a8@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261031-fix_enc_ref_buf_calc-v1-1-54dcba5977a8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1MCBTYWx0ZWRfX0EuNmCe8P946
 dTa/RPl9m8a6UqXcDbWOTfVhSFSbUXVgzBsPwY9MhTv/iYxlI7TgJxGUtejLpR6XqNaEUzs2bIQ
 MBZ8tytQ6/98K3+7KXfrETbnP4kVu3I=
X-Proofpoint-GUID: ED5_L172OiNsl3TU5lngBLIoTGxB4ykM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1MCBTYWx0ZWRfX5kyXn9GFoVaf
 mUaRXxEupcpPUFriYXCUI0erAiGhRidzXhmLuTvKm90jWFAXUjN3rV4m2H1op2zZ9u++oBHID4+
 rsqHeRr86O8CsQGB9nf3CCw1csIS+1CCH7T96YU0/DOFDX2NF4POP/G/xWAbtZS3ZSs3Mw/Gm0X
 TlOwJyJnX5KmWZ0ycH/Me5jJXuHRxUSzOvBsMeUoKrhHUca741Mi06WpHxlPr6qOPtHY9w60Xdg
 XZcSv0tfkuGkJcpT7yB+gFJJWb8ei6cNWyRd3wqZlKfxqE+iMzoXf0BEuaUnbehD2gtVzNQN0B2
 3X8VwOjOQU5h3Wn+6A0LkiL6mRiW93uCN1MYuqhFhcgy/9weEiXrMVCHkSWVqvg9p8zQ6PRhNlV
 4oHjsXuwJsBthIhzU6uDbpNsXqxO8q3srYsBdnaNMTu6kd3m2gd4I3R2M5jEC++AU3E7JN3YTmG
 y1IfHFaW4cXTbfp67ag==
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b097970 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1hkGSTuj8OjxEnJCJEIA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: ED5_L172OiNsl3TU5lngBLIoTGxB4ykM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270050


On 10/31/2026 1:43 AM, Vishnu Reddy wrote:
> For frame widths that are not multiples of 128, such as 864, the
> encoder reference buffer size is underestimated. As a result, the
> firmware reports a session error when starting the encode session.
> 
> The encoder requires the reference buffer width to be aligned to 128,
> but the current calculation aligns it to only 32. Align the width to
> 128 when calculating the reference buffer size.
> 
> Fixes: 61528e86687e ("media: iris: Allocate and queue internal buffers for encoder video device")
> Cc:stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
