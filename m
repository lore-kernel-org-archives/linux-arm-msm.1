Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556F037755D
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 07:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786607132; cv=none; b=BNH/0nWA0zrgtMpAGaBoU9uU+yXd4J/1P50JYsd0S2CO8gK6SyuoR6lIdbKBGXZoUBm4NVwy2Xn7K4ceJF8TVQUIDVKqK8WabYMVoVh/K6vZpFgQXaeEKW2TjiKA9PlBdKkdjzC4ArcGGwdMMv16BWMMnmI1PPpY0PLamVT4Zbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786607132; c=relaxed/simple;
	bh=j6WjXWBiSsQUQt9bh/4UfSp3b2oNBPr6WxKI7kAz3jM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R8TZkLesb2GeNs+aAHmzUgyZlzhPO0fyLZjfL2skEkiy1V0PUJY0P7Mpol8VAypbAzqykbCZbrxmkmHvQgGym1HCH7wa8dIs/vgvqVfxiQdG9/kcrAEDdGbqiAbVMWbbA31HCmBBTpnjKC2pbi8edr5zgT+QvLDlu5v5Ve+d/Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fYSCitxZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JynCR7Bt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fYSCitxZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JynCR7Bt"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D66HBM2453000
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 07:45:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9VIi5gbm+o/Cvix7njYFCpqbSntmg4C9aERKb/x1kFw=; b=fYSCitxZzc+oMkbH
	ERQ5vjKScGv7z7L6Utt4PT/Kx6hb+9HI9jnp+KzDpTiXx+IpG6UXuBE2yZzxRNWY
	D6w4TqVaKgOUOr3gI2wao14eKq259IKjU+ObokRiqy08aiWh73ljORNCiJkxdAn9
	GPDN3fP2MVUijXW+bcEnJoM5Q38GhQdQe6tjBo76HuikZYjYEudO5j6JIoi8ZiaJ
	wF1mpQpTVBZiQm+7QPENCYfMk2Lo8aJvbp8yrVB+zNdFkNMvC5tD3A3izFSXrUq3
	79YsFiPD8H1Ipflr9oSHszdAg6GFw82Z2mw6wbDGJNFIMfu8d0BTNRFyawcqX+2y
	N0e9kw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g18c5gdf2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 07:45:30 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8e9489f62bfso5840836d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 00:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786607129; x=1787211929; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9VIi5gbm+o/Cvix7njYFCpqbSntmg4C9aERKb/x1kFw=;
        b=JynCR7Bt7BW25TW4e/o9yuJcH4MJyKTEBTr4WmHlnnz1JXFs205SNgIq7w/I7Tr6CQ
         Jgteq1WTZapp0w5DiVjSfQpaGmEXRtHZYnmzkayntF9Xj/GMa9b/GTKJJUOTSkDOWmcY
         HdrwZZYkZFzy5nPkbh1HFKTnWX33LLXx5rNZZ5jhsqUJIEgBdF7FoHk6TIF0E1jdNgn9
         zttZDCn3s5/wZ8Ig7803lF/X1aKpgLbz07YQqdYK50imLytz2MdwvZJNQTVrAHHrICF2
         S1P2POG48FlBzllfO+G59L9OVQ1G2Qfvwf+jv+NJWt27wFuasPOtmxnNKw3b3Qc/gd2u
         Rgrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786607129; x=1787211929;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9VIi5gbm+o/Cvix7njYFCpqbSntmg4C9aERKb/x1kFw=;
        b=XkA/FPn3x1eaILFt8RTxjl9A2XTsTLWprH/AcbJvzdU/YRwjJUB/OYGnKGpwPpzR5k
         943PiBE0ksGgMtKylb7O1Q9nZnNIWwvAEZuX7MtITZUR6Dswn1Le5eHytKF7lx2aTq8c
         KJsFNYX2xQZh+4OqCFOw8X7dSh3ilJX97Xnr/+QPUvL+C4pzUW82BlSR8UpKSIqRzJDh
         4gzP1l0jQdC+P0sNLFRzOfssYHT3DGK4ao3lblcAZbj1i2JBjBsHndhQpCLzeSHZcnRR
         InkFDYN5jeYCEXNEU04ZURJEq6kZrpvswZnEFCkEN90+DGBgZXKYVqH6vuvFgRwLtf8I
         jL7Q==
X-Forwarded-Encrypted: i=1; AHgh+RpAsMI/WTydlLqmKBY+40JDVmwObTwoVsEu6TeSH8GavwMQMmAnZ7xGT93bNLulUL6RCifEQ1FscRJ8eXIe@vger.kernel.org
X-Gm-Message-State: AOJu0YwbkjmvOvNXiY6eKBwZDEcYZzbj+H8B0ZUzHkhx2Vgnb5EEZS+j
	PXv6no/ozLjXOZ/SMw+aWwSvL34GohSUGqknHGJljJXFnLVP9Urp8lsdqvs3Bqrl8xK+zbk+iQv
	ufWuHv3/IzAcjUgVh28dJ3L2+5AleKgRivn0KO0MtyzJb9FX5vdy/nQPBGO8UOdVBxDhC
X-Gm-Gg: AR+sD139laGNPHycw6LTWOjxTUIZx1HkVtSVrryKx0Y7Llyn+Y26/dm7ISeMVyQrPsk
	478fu3R8HtrBl/DY6gtSKErW8D+ZutaHSvGxbUUkLbDhLNJ7+FUBgl9S03hQAfR1EINlQVE4u6g
	oNJ6nByXfL8tOUJpOsCH2AXH/OcyPBbavSUt6+LCE2H2H/thcy90R70eM2Mf5uIi87f9szHuHpI
	l5XQI70zEWhrk/PxJJ9ov9ew7NUInYRoW0YpW5WhXA1mvpS+te7uK7BvA5DkYUurkadfM4K2nYR
	pEn/IRxkpd7KVoEjtesMpys6WaAPP062QZelU7/mc4fXhAuOtCCgExeu09BHOT/FmDKk6gZzxs4
	0VKDYi8Q7oItOkr3UUZtv9hqSbvk3rI/Xt4x1YtjcvXvBuM05vQnJvbl+c/V/r7Ra
X-Received: by 2002:a05:6214:401b:b0:8ef:e0d0:9fae with SMTP id 6a1803df08f44-90a80b2f028mr32615006d6.14.1786607129676;
        Thu, 13 Aug 2026 00:45:29 -0700 (PDT)
X-Received: by 2002:a05:6214:401b:b0:8ef:e0d0:9fae with SMTP id 6a1803df08f44-90a80b2f028mr32614586d6.14.1786607129167;
        Thu, 13 Aug 2026 00:45:29 -0700 (PDT)
Received: from [10.111.164.29] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a8179e4fasm9733956d6.2.2026.08.13.00.45.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 00:45:28 -0700 (PDT)
Message-ID: <bad2e899-106a-4d7e-b082-345ec757ee9f@oss.qualcomm.com>
Date: Thu, 13 Aug 2026 15:45:18 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: Allow two MDSS power
 domains
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang
 <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
 <20260720-msm_gdsc2-v1-1-4687866d6cb0@oss.qualcomm.com>
 <20260724-cocky-uppish-pelican-3796ee@quoll>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <20260724-cocky-uppish-pelican-3796ee@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA1MiBTYWx0ZWRfX84E18iEMBIBC
 /hls1kZRYEjr1dMYJ4KwrKdDE15+OCYXwxzlTJRH8HmDt4vgirxMXSBv6G7CSh1qZMTPJyPeVV4
 oCv97X4PZ519++iYa7lmj/JeIf7vLsw=
X-Proofpoint-GUID: QWJXLjpcU2PUE0IWiqvRFtEZXF0sd1jk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA1MiBTYWx0ZWRfXwDkXZ/jOJFO9
 OFvzjTuYoUqACBNr27cqI/9Y5HSgvV75BNdqkaseRg5n1/4ucZL9R8BOd5Imv/hwJqyNnJh2no2
 AsKFV7tIFXj5yWMWlhsv+Qblt1Eg7eUKLg8dkDuRgoiL8SI+G8KWspO9X9ce4kT/a1uLsi8V8xM
 QfjFWpCwjFuwThhE8Tn60U/C8HlCDxvEFP3JNnrWuRyIHVk4PvJ/J1s0nprg3wBaw2Dcu0y3p4u
 OB/ktDOwDHDKN+pK12C2mpfguvoN/tMv9W7pMOcJXKrbv3/7g+bPYu3j1QS4DUeBIDxySblccQV
 VvT63CzaF+JzqVFmGQX8386frJ0rA8nv+O3mj1blYj3IIE/60rUp0N29Bl2uZ+GoIsoem+zhep/
 uUMXqCqhTRaFsF5YquxQXoqF3rxluXo3MP8r8ujZlcRjXz6PwCIPLrEiKSKD3EjIBLco4Q45h/z
 EAwXvft0JU38PyruRmg==
X-Proofpoint-ORIG-GUID: QWJXLjpcU2PUE0IWiqvRFtEZXF0sd1jk
X-Authority-Analysis: v=2.4 cv=VebH+lp9 c=1 sm=1 tr=0 ts=6a7d761a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=0b-XH3JjkyDtS5VtSh0A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130052



On 7/24/2026 5:36 PM, Krzysztof Kozlowski wrote:
> On Mon, Jul 20, 2026 at 04:43:53PM +0800, Yongxing Mou wrote:
>> Kaanapali (SM8750) and Glymur use two display power domains.
>> CORE_GDSC powers the main display hardware while INT2_GDSC
>> powers a subset of SSPP blocks.
>>
>> Allow the MDSS bindings to describe both power domains and
>> their corresponding power-domain-names values.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/display/msm/mdss-common.yaml        |  3 ++-
>>   .../devicetree/bindings/display/msm/qcom,glymur-mdss.yaml   | 13 ++++++++++++-
>>   .../bindings/display/msm/qcom,kaanapali-mdss.yaml           | 13 ++++++++++++-
>>   3 files changed, 26 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
>> index c6305a6e0334..c0b650ffd9ef 100644
>> --- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
>> @@ -31,7 +31,8 @@ properties:
>>       const: mdss
>>   
>>     power-domains:
>> -    maxItems: 1
>> +    minItems: 1
>> +    maxItems: 2
> 
> So all deviecs now get 2 domains and this is completely ignored in the
> commit msg.
> 
> Best regards,
> Krzysztof
> 
Thanks, will modify a proper commit message next version.
