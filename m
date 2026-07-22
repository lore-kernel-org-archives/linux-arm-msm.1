Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5292DBF75
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 07:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784703842; cv=none; b=r8Miy7uZUcdCNSNQJiF1it5ZK8ZCJ06C1jDPThWGp3hQrEMHYenMx6Zm4as2ToVi7FT8N0NuVW82nDxOooVIXBZVBZdUXChwp8heqKoQqwiDYwO657lzjTk6bpor8m/u2g5EPd6dFbNt2yBLJkQ1Nj4nj523yg/Ldl+97U5kMN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784703842; c=relaxed/simple;
	bh=k9qZW9UhONzZxPEWo8ci0GdlJAaM76cmpUULCTtHNas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R7rRwgNBbOmqPqEubDTDfMuP3kKGBQUuCvefKhjzipP4oaHhNaN3K/23idGvi2jKoyz5ipB18g2omgF0BfGv/w0O9RZCs43Z2WS1iBDxc/b+45fEt3B+2Vgs9lHU2al7n2Ui/GSHvVZQFNVD8atrLgpIgkosdGx2pIoo4TYHsk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nWRoQMTY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MCldnt/Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nWRoQMTY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MCldnt/Y"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53ax73662161
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 07:04:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1PGM/fNkKCMnOQV4wTPTHzuEafbmKBg3WAOkdVHmfKo=; b=nWRoQMTYs/cku+nz
	dDam3QxiUWU4k+P0jhM/7KbXQnFZSGTcvPkF2TcFrUeDhGaqQZzm2CBHmnUecn/L
	Ypx9bq7qu82z6ZUXIG8Fpd/Bcztd1DsPsxEorb01aRzuP9tD7toi+iWJWcKvXC/f
	WzYUgzpMhX+NIcY0yFR7CKtzz1BH1GrpjHiPkbHeDYA7vn0OGMP7gzC7rUMFpX6b
	FCCATujiyaDdzqXgB6LTPVJjF3Kd/mKpiEhDXnoPaBAOFfdII2fCkHOPbc6TSE+l
	LgGV0LwZ1sFNJQ1QSEhOrzVCCoBexkC1/B0SVVYyTGDtmJA7EIZ0bH2pktBr7D7R
	Bs8T6g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd5e2pe1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 07:04:00 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-848544a8496so9848192b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 00:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784703840; x=1785308640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1PGM/fNkKCMnOQV4wTPTHzuEafbmKBg3WAOkdVHmfKo=;
        b=MCldnt/Y+vGkWUg6PKPvE+7Ow2o3nycAtt9xN7y/6kgwPCf923B3jyA0WMeDGBkR9K
         Nwu/TUp05t4rwnZntBGUQ/UxdbJ1fQSTp9rTKN+p4Kz9ABGObjTHJnskfQnoXD9KIYOI
         rCgKXNDguy1dXLwY+HxZGjnAhfA0DDRoW4CnQHNJsXuF1w3XGJ1EMsU/HYhYMJV8nSMZ
         XpzNUYej+jGM42Ft/S/DlWK3oAmHTXkanjdFOQxmIYn5txopb76S94OGyxHfHGWKVr6v
         2D+frPZRRODDfnafH3dKiBwfCm8NQ9zA2omR9I7/JL83eHphPvE0xgOydwsVrCbWee1h
         wogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784703840; x=1785308640;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1PGM/fNkKCMnOQV4wTPTHzuEafbmKBg3WAOkdVHmfKo=;
        b=ZdiJu8xAJbfJmCVvyMSoD60TQJ7fHBKkrsc7bKc4gt2e/epZHZNaJCHea4Uwrxmxmk
         huts6xHHt5zrd3OB82jzBBPr5CI4MQMW1r60vGSYdjoE7Aq4ezGvxl4EQ3VCs0P9ghu6
         0n8I1Kx7aF6O1Jc4/MEOD6dtoVpLlrxoNH4o4uSNxizbKGVASnzrBc1WIs506PoNSWQk
         pn0fNxJd7fcUL7SIjfEKfsGtAsxyo1sKwT1cD8zii4vR3V2tcImvwkAsaOvET1fEXAIh
         q8BOHh5fcgh7wV/Vwg9V4B0qOrHXIgMXvuaKfH3yun2sjtl0JB8euexTvfgiB1DcvDAl
         fkzQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr2MEM1ZBGnBXew1m79OBaqKbRrGVID12w2pyEbWwJQoNNytQGYYLda/LwBtsyWE/FQjcEMfS75HkvFl9X9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy38nN/6kXrg/GpiXm5qZzh5/IdbZl+8bNK5fKpV0/kmiCwTaQU
	Uc0WAIJpLAgjTdr4KFMha68oPbc63o67SXtjDc42vp1JWPBNlOkm1XmlnJIT/9tb0Ariy3WVTep
	1EEc8BxA97PIKDBdMvCXAIlSIYoFZB5RLYxrGHVRfesfWDID6BOmrZ2tcCKqOgzqjQ2xl+3Ek7Y
	X8
X-Gm-Gg: AR+sD13V3qCelvu2PYYqpvW9Mfznl5EqJ0+LH1439h+uF6FUyhOspNEyzbnlowKigDM
	bklck/Ndiib63VhWSaYMSl9CWpBQY2TRxk6JVRLjR1SJyfyHMGMt+yHK0GFvHyL5ZvIHHoC3Ag9
	sLmYpGgW43V31EvzXzxExWhBogjv1P5YKRjaOMchvee8P8U2kY0rtcThsUBfBPg/JCeuzpQPLgO
	0/Zv9ZXxQLdded/4iG0bLeUa3ommiA52+ST7BjZECuTwmx+co4ASb4W/lqIcsccsJSazEY6Nmjc
	hXVYw16yYkHorGzpBBi3BbqZK/+ZBe84THsNb6SODnzRgdXAE2uwfksDSD//JbLwV7sYWAtta1i
	seOQWJA1MOShHtFkmRAdSMXkyGtpq84cbbf7PH0d0afSBeERsYWHto+AeheFnuixwlK6D
X-Received: by 2002:a05:6a00:288d:b0:848:2f74:1d60 with SMTP id d2e1a72fcca58-84c295777f6mr21391307b3a.70.1784703839945;
        Wed, 22 Jul 2026 00:03:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:288d:b0:848:2f74:1d60 with SMTP id d2e1a72fcca58-84c295777f6mr21391287b3a.70.1784703839445;
        Wed, 22 Jul 2026 00:03:59 -0700 (PDT)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e172376ebsm873905b3a.12.2026.07.22.00.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 00:03:59 -0700 (PDT)
Message-ID: <e0a0a184-b1b9-41b9-b502-124644500d37@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 12:33:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] arm64: dts: qcom: Enable USB controllers on Shikra
 CQS platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260721-usb-shikra-dt-v4-v4-0-2e7a092d7f27@oss.qualcomm.com>
 <20260721-usb-shikra-dt-v4-v4-2-2e7a092d7f27@oss.qualcomm.com>
 <mh63jqjocq2mm6h5dpqck6okfmsugjg7frrehmd5t6f3mynojc@tpfnitctm6ye>
 <842b4369-3167-4247-a170-e62d5c78fce5@oss.qualcomm.com>
 <2xpkigm32q6eq7nh4bgsfgswwjquru4pa5oxeciyx3jpywjf2i@qnc3i5sumo2p>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <2xpkigm32q6eq7nh4bgsfgswwjquru4pa5oxeciyx3jpywjf2i@qnc3i5sumo2p>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: t0bOA3DeFLDkUwtbZFYVxU-RQccnsGIb
X-Authority-Analysis: v=2.4 cv=CbE4Irrl c=1 sm=1 tr=0 ts=6a606b60 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=4Bh_XYDmQjnsVvAPYLcA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: t0bOA3DeFLDkUwtbZFYVxU-RQccnsGIb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2NCBTYWx0ZWRfX6WJh0v6mT3Lc
 9y3avfQbScZKczxsPD7Q2SBUQGwjiBVDserNYd1CJyrQrwfSaovCb+o8VJsRC+sc9rTGT5bD+76
 ZYw2aKyLjmK7kwDQv1m93PrnMy6GbHEiEUgqDLtM6bXlcNouVOuZAc1jiYVdjGjwLG6eo3lVYpH
 +c6wrB/bgtOlK08VFyszvZ6aHPKLvuLSgnY1ciZa/bSjjOfmhxKtE7HmUciq02rmpeKqxq5Ax9g
 VSnpPGhoj5A6u0sKov6F8Bkad7fWEXKzwoVSp2JeCBDGS1d2GfZuK0OgYCvZHV1kcASbVbXiCHj
 m73WU6uN0kGc6WanBuyeHsp8Oo9Iq0fcmUfx/0oAHw/sqIOqZDiaQGfaseV5PaBLGffK8XISF1h
 Q7FZmpYlUeBBB9tRHE+H7oOJ3QCLyc9Lc2GjlcGHbv8pL8w0kn3sAuScJPs29NB++mkle3BviVp
 Q6drIFJLmbO6Myp8SBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2NCBTYWx0ZWRfX6gpk6VITWRiY
 +t+r3d303+Cv3h+YXA1dDDq0QcISPYfIhJ04TdMRNQQO8iCt/JPB3eZao+jIpF7WFLIKRcr8arX
 2wdtb4Db1uhIpwsqXgRATLRzvP6cbZo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220064



On 7/22/2026 11:03 AM, Dmitry Baryshkov wrote:
> On Wed, Jul 22, 2026 at 07:22:47AM +0530, Krishna Kurapati wrote:
>>
>>
>> On 7/22/2026 3:07 AM, Dmitry Baryshkov wrote:
>>> On Tue, Jul 21, 2026 at 03:23:46PM +0530, Krishna Kurapati wrote:
>>>> Enable both USB controllers in device mode on Shikra CQS platform.
>>>>
>>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 35 +++++++++++++++++++++++++++++
>>>>    1 file changed, 35 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>>>> index b3f19a64d7ae..006e24a62f5c 100644
>>>> --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>>>> @@ -38,3 +38,38 @@ &sdhc_1 {
>>>>    	status = "okay";
>>>>    };
>>>> +
>>>> +&usb_1 {
>>>> +	dr_mode = "peripheral";
>>>
>>> Why is peripheral-only?
>>>
>>
>> On First controller of CQS/CQM platforms, usb-role-swtich is controller by
>> PM4125 and on second controller of CQS/CQM platforms, and both controllers
>> of IQS, its controller by Cypress PD controller. I will push out the PM4125
>> changes in a different patch set since couple of issues are under debug. And
>> the cypress pd controller changes are still under development. Hence enabled
>> both controllers in device mode for now.
> 
> That needs to be explained in the commit messages.
> 

Since putting in commit message that there is a PD controller or the 
PM4125 will take care of OTG would be out of context, in cover letter 
can i mention that the above information, and state that future patches 
will enable OTG.

Regards,
Krishna,
