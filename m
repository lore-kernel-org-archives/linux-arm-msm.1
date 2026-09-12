Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744103438BA
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 20:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789246683; cv=none; b=anE/hk+rRmp9+GmyP3kyNS5iKqYLuzLh5J1EisT8NLTg7S2PHKT5h019XW4GL5UzwP1uFaOXoofOTXperd9Ch2x9uuHSIJjztWO/6B1j2qiWuosNH1dKRDQjqaJW7Deamv2xBvCvTAVbJZgiVc3WPZ/Pr56MMlZq5o7fKqRwwNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789246683; c=relaxed/simple;
	bh=yDv4E3nFxbJNVOjCwEv/RLNS+1uCzdQdmOulZITXdgw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lFuS7xu0lunrmUvF5FIQAzwsYKSZGOiXae3Oe4aXCdi1te95BIORpWgloUUkrYRQ0zcf9acDCPmVnuqa1QfamZLmdxbJWNwPcmvHZaPlInGNJ0QXY5T/0+Q2YdKfJiluFkU7Eo85LxgUIclz397TYB7WgOUK8HGdGaWauOepT9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MhX5Xfkv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AoNcqmyc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MhX5Xfkv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AoNcqmyc"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CI5Jwv3729795
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 20:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jMJ1BP7kFCSqrDlTpk6HSShuuUbHZX05cq1SvWPnFxY=; b=MhX5Xfkvk4ZQQ6g/
	KiLgU3Jnhik938QvC1TZcJUQhVGx6Aec/nDosu5TSQWGdLPmXg4d63G4TR0PmiUF
	Cin4AjgXj98K2DrMkrfKHuCE6o2gOht947UIjAP1hMdXbl1RLi/8b9ann2dnAhzG
	m+SvtDCZ2l4qwm9wlEMPk/KUohnbnKkXD2is9ZubQaMn9mvYmol/ac09N17MmOqO
	lZSrY5rDMmh3K9frCbkPHNQsghwuQZtv1W3/nFzH1+CPRd4qYq1OL1hdQXhNSqpY
	V1bxrT8hGN/BAp5Ogx2He0gf+OpcWXPo0rk+RKd94Vh0up+LukwzO+9PqVlO1EKI
	cofpHw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d1wmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 20:58:01 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9104417215aso46234326d6.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 13:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789246680; x=1789851480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jMJ1BP7kFCSqrDlTpk6HSShuuUbHZX05cq1SvWPnFxY=;
        b=AoNcqmycADv78MD4r2s02MOeVpdfGgD33EgzRd+FnPoNMvftw8UOZP53oRj1Xt/SNO
         D6ffbaeumHzuF9iyBO5O4Z50ysUP8kNp20PrQj1YGHuDTEF6+yTXAUMKlf+jzUTQSynX
         oGkxHYXIb8okxYsi6sxGLaH7OvlZpeep0vtbk1nPhUELlI9XdWl509KCTv8hcrYzfh+f
         eOZjeQtKY3DU+YscZxJfmS+KpJlFG5auZBxsyhOcfJ7JzhrWrCG6EsbGkwdQ3N1MEK0r
         lylifD5SoTNkHOUnBZADnqY+dUUPRPsrkDOzp3urcQvR8bTwPSMm7waiFLoLsBYEuDCu
         EBgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789246680; x=1789851480;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jMJ1BP7kFCSqrDlTpk6HSShuuUbHZX05cq1SvWPnFxY=;
        b=ILarKyQ70o60ac5hcp3+BhKkX+MYdrn99a471JgiVfWrdMdMohQZpJd5ch8K6zRafr
         n/a42HQgoMAckw8IxpK4XQpeGyjZKgqKGQMoLT5orZg6AMpnKqGti/QbHRXQmaSygWO1
         LsJdfb6LUhb8YbMEIydJ/JPuVmjHEq3rePlREs9S0/VNuYTHYTCUBKXAUvzDM+aVeOZf
         JThUf4qsm/VWk7V/LyxFUnPJ9fxEU3biCW0g0yDdgNy7UpgOVrTj9qcBfpatvD1W1Cnd
         pMCSTPKOIONjFs3+umNRJ4pz7w+aF/Xx915waYWuHg5TQVpBmZMoIC4SWdZnYX7KYhhQ
         3Ugg==
X-Forwarded-Encrypted: i=1; AKwUvBw86RR5I92i3xnRWo1Jl8lX8ThujMiAerBTMATa/qH1H5dg/qf+zregaCRxLda/QAQHOhkHbMnMh/kMpMPp@vger.kernel.org
X-Gm-Message-State: AFuF++lxc0AYLpeuQVIpKTKA3SBnuQE1zqc5dhOHzo/UnJBesa0aBOnL
	VaCvUAXfGlEZEELVtoNIm1xsX06qE0YUlsPov1VNCWksVWbIUF+L8dP3OHcwG/3VRKLTwBtauYR
	i400W29D4VmLE43UbYuUDO3M1ReTBzGrekANN4sHr+KeZtgf0OUKZOeXJ8ru95ZtpjWev
X-Gm-Gg: AYBFou09FdVrE0KIQ0R/rg1cdmktEDUnSBwnWqCsZ822NM+CstliMm9pjVw2AeT/mWB
	y5Pblzq7T61FyNkKNPLChX9+CvJUY2HHtFRxwOZPflpod2SBRYq0SuloHeZM7TkuuNfd1YVaSYM
	wDkfPwUbaKZ+ued4A/zFTj3McVHBPtbf9SAkArAQ/sv3qGwrdQ1FUQK+3j4tJNrbNtWETYUTSk9
	WkQzjnnf9WgdM1WKWkL0tIvbmoZ8VxEPeBaEC+JJsa9J1XFAo9IwA2OqoyXJ+67pBVb4m07KROr
	LmoWCUzyMGK5y7nb1RgBL2y8SXD3py4iq1T3jKQK36W/kyG4O2gUbsTyKVSpytAg2O/nwxUjW98
	elrV6tS0abXU16+ladtpz4zEUfz7XmjtAAM74RS3LoultZAVupMGXwR/0WkgxibSylRXg3XW8Er
	uVNnhE2Wvvce9zJiVV1n9BrXMYEb+MAj6eJJ6WZRxtxm9McNlHbtkqBTuqlR+AsAcwEkw=
X-Received: by 2002:a05:620a:4386:b0:939:6db3:6cad with SMTP id af79cd13be357-939ea13c648mr1411256185a.12.1789246680658;
        Sat, 12 Sep 2026 13:58:00 -0700 (PDT)
X-Received: by 2002:a05:620a:4386:b0:939:6db3:6cad with SMTP id af79cd13be357-939ea13c648mr1411253885a.12.1789246680244;
        Sat, 12 Sep 2026 13:58:00 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b59644f2sm1993071a12.29.2026.09.12.13.57.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2026 13:57:58 -0700 (PDT)
Message-ID: <a7f109e5-50fb-45ab-bf8f-c674d9e8fb3b@oss.qualcomm.com>
Date: Sat, 12 Sep 2026 22:57:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v6 2/4] firmware: arm_scmi: Fix
 scmi_protocol_table_register() error handling
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
 <20260911152329.5822-3-johannes.goede@oss.qualcomm.com>
 <k2agmmtgq2tbx2zyokidn3dsdkcjpdjbasx7vlch6b3xz5sjuk@pfhc5npwwegc>
Content-Language: en-US, nl
In-Reply-To: <k2agmmtgq2tbx2zyokidn3dsdkcjpdjbasx7vlch6b3xz5sjuk@pfhc5npwwegc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDMwNSBTYWx0ZWRfX6YmOlrmGpPky
 4WvII3q/763JINa5VnzrgHZogxP9pQY3QS2fIcJMVq5FaBbLKAYpnFkWjWQQ4aTN84p0HbBk9B3
 PQVvjyH4y6GMUic7pmNgCQXNa+8oUQ8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDMwNSBTYWx0ZWRfX7F63YmARzq/k
 yF7ojKxBOc2aCtBVR9eZyMFa5gAM8ABdhj3tnEDAJmW+nZa3iIb8Bzk8ZJDKVa6EgK3Ku2kSk5J
 CldGegTGl1SWaaJYo8ajIeR9A8gum/Sjc3tI6oy/IKT31zNUj+NqZDBcRKayqyYgn4uoLZxZhpj
 aFykNBMsww8YmTjTh9D3tWODVDQll5mCAxVLnzWqBxCXvTuk9H5ovUAEC8P/9sC6pw9hj0JQV3x
 TU5Dxuckp3DRTl7DVAQ2l3syO5v11slUdiKLfwqyoo81YV+5cyjoRHIHQ3oe17Y6T7syNKM0f5+
 HJAgkq01BwOAZpey/OuVyFIjTV+zFL5+FrMjWhuR0zAztYd3bJ8VT2vzAO4+kVH0OVVBRnT6bYi
 mnrFQGj9b8vd2LJM4mNzFMsQWDTp65jAU1EdmdyATEvfddd53w2A5jiRd7/em4t7ruvO6zdlU6K
 E0aUco5moCBSkN5EYEw==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa5bcd9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=ePD8OZhNOdW2f7jq964A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: X3cPPFakAz4MIeS64JSHjzRXBCHBXr-C
X-Proofpoint-GUID: X3cPPFakAz4MIeS64JSHjzRXBCHBXr-C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120305

Hi,

On 12-Sep-26 22:50, Abel Vesa wrote:
> On 26-09-11 17:23:27, Hans de Goede wrote:
>> scmi_protocol_table_register() stops at the first failure to request
>> one of the scmi_device_id-s into scmi_requested_devices, but it leaves any
>> previously successfully requested device-ids in place.
>>
>> Unrequest any successfully requested device-ids on error to fix this.
>>
>> The code manually unrequests these rather then calling
>> scmi_protocol_table_unregister() because one way this can fail is because
>> of duplicate device-ids and in that case the original device-id must not
>> be unrequested.
>>
>> This also moves scmi_protocol_table_register() to below
>> scmi_protocol_device_unrequest() since it now calls that local function.
>>
>> Fixes: 2858f6e5f064 ("firmware: arm_scmi: Add multiple protocols registration support")
>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> 
> This was already done by the commit:
> 
> 2224b622260b ("firmware: arm_scmi: Roll back partial protocol table registration")

Thank you for pointing that out, this can be dropped from the set then.

I believe the other 3 should still apply cleanly with that dropped.

Regards,

Hans

