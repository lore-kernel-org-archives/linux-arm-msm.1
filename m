Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF27F459AD1
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 11:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784805040; cv=none; b=CS0q6qxkS73Qo44TH6hNDBHtbx7vjc+lpoC4k3Lp9oRsfyZrRe0c5l+KIM5JtUVxMzIACM6gU4WpPZCWanuVI8VS1O8sJxN10yg2sCDoK0/G8PLhb7p1epRC9vEGA6vYctJXBVzG1+sSsi1/Ro6Ya4t7C2kFS5Hi3DyUuCII/zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784805040; c=relaxed/simple;
	bh=9dYHq0r+hgyoOtWxWdV6iDo9y1LV/Cw6bTYJapIczDE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PRVvPtRIhd9Gp0muBwekuSrZlmNgpP9pmfc3D4hmdG3aKcUNG2NkodxOJMGTU7bTACu3f46x4PZQyLvQ+bGioS/nsp9K2nqasNFZ0AknbMmlRZuho91kiub67uO64TgzedOpWSGNuhR/KYqKiKLwRmnigWBWI2o9TH9IMfCMEAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GDLeQ8qO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c2PezOYe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GDLeQ8qO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c2PezOYe"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qcjO3489460
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 11:10:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HZbAXQbl4Vd93GPtaUI+1QxSb0J/+QOCdBFCMSIyehk=; b=GDLeQ8qOs88b7JmZ
	7RvAO8cCVU+XGdLJ7sTSD0Btd5NO/f4acECss9wiOy6mHlLhxpjAinCHIj1uSXDF
	XzEwAKRqyn2dSbtsz5mQBADwWtgbOoTlPjmdtdkHMiL1GeJUI0wJqHgLyb69raUO
	U3fiF5Soc0Jb2r+zrijvp6oHs4PP4UcFkXZJKwLe01UFkID/F1w4ggDV+4ZBg6j/
	saXVplFtzLusq3SgYEA215fuUuzd0FSYNHd3XaQsN5I6hbuO8LoSg+ZV4GROFt3c
	t3TWoo6zYYXzKgvA8faGNdpFGOoNIZio1A5/xf7i+xCwYuVZqbXCWKwCUU5/jHDk
	USDlgA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28vks36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 11:10:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bff5c7035so15411851cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 04:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784805037; x=1785409837; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HZbAXQbl4Vd93GPtaUI+1QxSb0J/+QOCdBFCMSIyehk=;
        b=c2PezOYe0FpxcAyJd0XGgQaf8z1gb4CHm2tajDlAqVjYB8ZEqNWiYvuSNQ2pm+/o70
         o2EZ5dJInyQcoZzOZvCToBjK41sNO5cglLu7OKR6P5tk1JSKji0uT7rEHA20kS56piLl
         a0tY4aEsMe+utbQ3zpZXx+JteW6dENYpWlospUFCIzUc7aZMpcMdILQqdO/C8J0lcLSB
         FUeqbIKN/PEza7j7eHKg8rOJNBwVaRUakLy8eYQUL/yhA4oQ00ACdIOKBk3E0eSfjfs4
         M2CeG68OJ6EFzRViPAjo4G5RfnDBYgjKv/Yk3bLLhXzjkyQ8D8E9OiWL6k+7C8g/Qs9S
         muLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784805037; x=1785409837;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HZbAXQbl4Vd93GPtaUI+1QxSb0J/+QOCdBFCMSIyehk=;
        b=aenTgBa2bChRSmejtF7NNTAKX82AJHUbvdIShlsYahJrjVOS4VSdDhk6J7+aTGYTPW
         +qJTaKJfTYsaHdYBj5iZ1LQUuNK2ckMyI6Zt6vNu2bY/ZGE8Ub5sA0ROnYukodeALukg
         y7i1i0euirqKxvmTgtzg6/5DPVhO38bfwFSHwgbh9qD1U8ohZHAmqrlL/ymY9y5Aj76o
         5Y0zxHttBuYVGzhozza11GNaY2sa7xHJpyWGRF8FEuyDlcHU0DlfvXyxOBXtDekamzoG
         9HoNThTmXn8pb4laQMFLV2B3+dFjgN0EuOc+aYqlnEz/vrCCPeamGg4MWiIKLXy2cuau
         wKVg==
X-Forwarded-Encrypted: i=1; AHgh+Rpdr24FdGYmCQ6UzUSiHU23kDIxAerPDglSVa7gNGjriCHKbtYBkARDsKRhST0WHFN+j1bv3dTzVeTD9rEd@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx3MXfluF/IRbNKCQ/OC0Q2g1hxF5mWiiaYLANi4cLAyxk+2Z1
	EU2Gv+IUblCgZrpasQIiRN8Ha3SkFw5k95cD/IEnTu26tJAd7revWcTNnj2Ni4XkDxiqkfvKgYm
	Gxm+cA1KKjScgJda/APskHp0PBz4hyy1uXpa20a9w4lQUrtDeKY4Zg31UmHwTQMoAMMrP
X-Gm-Gg: AR+sD10aZUpfx1NKVmKU2KCKDPRUMdgySLH38/YYqAjJUuUAPb1+PXDbQgvusb81NpR
	xKGOjImyJcrd+W15r1HmLWwwguDFttbTcccZXDOmeyOQfFzjTedDaOMSiDVll8xMcwDNItgRHBf
	700U5Xy3ltZZlivA7iJf4lQiEj9rdASkd4H67K9dtXCj7SnAxIHh2rv+k8EX+V4xLhI3kXoDXb1
	SLB3ygWsfBgcCTsxeDDTyomcb/jeDkQltyYOPe6UOW7KINrtHb8Z1mrwi37hy0HYT5Dx9tbkQqm
	5i8VkLWAIYNpvRDjoNtR1RQ02QpCYem6i0KuwXu78cnX/P62H7NFAveOEHYsxvwpv3ZC9/X8HgI
	v2sDlayhH86l7+78desZS3jV3MjY2VTPqGQJTexrJowa5yFxAxPWT5WksiqXsCevFhqyYQ3VkF2
	yy8/cWgjLhbsRJ01yen4hrtq849RFJwcexJLoozZEVYV17ISkt84cPhvG+6XBEDAY4Nic=
X-Received: by 2002:ac8:5714:0:b0:51c:9ab2:dfd2 with SMTP id d75a77b69052e-5283de386a6mr21717571cf.33.1784805036883;
        Thu, 23 Jul 2026 04:10:36 -0700 (PDT)
X-Received: by 2002:ac8:5714:0:b0:51c:9ab2:dfd2 with SMTP id d75a77b69052e-5283de386a6mr21717201cf.33.1784805036302;
        Thu, 23 Jul 2026 04:10:36 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f34f1b87esm1924051a12.16.2026.07.23.04.10.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 04:10:35 -0700 (PDT)
Message-ID: <6de56f24-bef1-476f-91a5-5efb8ac2a0bb@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 13:10:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] media: qcom: camss: Add "gcc_axi_hf" to 8775p VFE
 lite clock lists
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260722163658.409872-1-johannes.goede@oss.qualcomm.com>
 <3f1492e5-2c79-4084-bc5d-adfca230506f@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <3f1492e5-2c79-4084-bc5d-adfca230506f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwOSBTYWx0ZWRfX6oO4e4sWuaXE
 8uHWflE91CK9ABOhFeNKHczPTR+AX8sbOdYeywVnMjcoh8X+IxhfmePNzj9I82BBndXBvoM21WO
 Bao71TDEgmd3JGlHu+sBCJSIFiUrSO4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwOSBTYWx0ZWRfXxhEWXuDSFKfJ
 HwIS4Gx+Bk7W25+WFoanfRz6IZgQrBZRdrhfia1Imitf36lw7N8E10/qBdpb3MjN+AYNf1gPq5l
 8grQZOcs8QLoY9bM5KmDU/5D3I52CVgzzXJTT+KMHkdhSbi7eHM8NX2QYeQmKoZw/fL6NMqrrEm
 cygXllg1kDs+2DtYGeGjIXgf5AeXw1xneYz31MsiSxw4uU/ROBQM/xVxlxcvcBRrxiF44Moe8hw
 xsPsotJ3MOnsBDDC8N8BoyS88GKbqZxeRCkM/1eArLlMRRos8407LMdPgUJRfieDYNcS9BM0T0i
 4HAcZNTHzsi53tM9aagT6sYAVItXwoRMz+YYHfutv/lE3C0eOLEjnMMOMYywSCLE5DzH75PsjxD
 e8H6wKMt5RFV3GCQLMfoLmrW8+f1UQA2NVIjtmioWplefppazzNDSGn8ZUC6azYHOZG0Jv998zc
 Eo9XyKI/dXqr7TC4SJA==
X-Proofpoint-ORIG-GUID: JaBo766nICRBE2wIMBGEgVY77-Gg8V4K
X-Proofpoint-GUID: JaBo766nICRBE2wIMBGEgVY77-Gg8V4K
X-Authority-Analysis: v=2.4 cv=D4V37PRj c=1 sm=1 tr=0 ts=6a61f6ad cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=cFjk3PDMhnmkfAMTDuwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230109

Hi,

On 23-Jul-26 04:31, Wenmeng Liu wrote:
> 
> Hi Hans,
> 
> On 7/23/2026 12:36 AM, Hans de Goede wrote:
>> The "gcc_axi_hf" clock is correctly listed in the clock list of the
>> 8775p 2 main VFE-s, but it is missing from all the VFE-lite clock lists,
>> causing these to not work on platforms where the firmware allows turning
>> off "gcc_axi_hf".
>>
>> Add the missing "gcc_axi_hf" to fix the VFE-lite blocks not working on
>> these platforms.
>>
>> Suggested-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/camss/camss.c | 20 ++++++++++----------
>>   1 file changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>> index 2123f6388e3d..3efbf2fb4472 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -4037,8 +4037,8 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
>>       /* VFE2 (lite) */
>>       {
>>           .regulators = {},
>> -        .clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
>> -               "vfe_lite_csid", "vfe_lite_cphy_rx",
>> +        .clock = { "cpas_ahb", "gcc_axi_hf", "cpas_vfe_lite",
>> +               "vfe_lite_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx",
>>                  "vfe_lite", "camnoc_axi"},
>>           .clock_rate = {
>>               { 0 },
> 
> Please also update clock_rate accordingly. Inserting gcc_axi_hf
> in the middle of the clock list without a matching clock_rate entry
> will shift all subsequent clock-to-rate mappings.

Thank you, good catch. I've fixed this in the v2 series which I've just
send out.

Regards,

Hans

