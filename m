Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53FE3FB06E
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 09:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785317045; cv=none; b=Pxt47lFb/K9ay6GebB+XM/VDMArEF+wmSeK5JGnaZwtxEOoNCki62Zp/FRZybvPxx4ptkpLW1FQALatovqMbOZWXnJmnpvjto58X+Bd1jEmnyI4kqGoF7IU5EVDljeii4LxeSkajVVrLAsQNJmygl0srdqMTN7K52ko+kcJHBZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785317045; c=relaxed/simple;
	bh=DnaxPBCkYhfPSJslYcQGqgj8hMjnklWS6dZq6za8Vgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fp0ZwacxPIJStRaL0dDxs9Hn5+zrotyVzcELKjlLflAk4dSOq/5S84GBG1NppYmzXYsg5xae2cPkWbpweY7KWYC3jXsgoN03UiFvT5aYD5qFzzdKzhZPR4wZxRua7c/bh/1i5Il+PgFtZ9IF8mVXSK1I07I1uAs3/WuvqNuGX/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a4ZN3zd+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UGW97eiU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a4ZN3zd+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UGW97eiU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7f7kv1181559
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 09:24:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VMvaD5ZZHFjIgOBUc3cOIiKm2r4D1cgeWhUvtITUHDY=; b=a4ZN3zd++KWAQDd7
	pv1jh+uZ6MHsZzP4e5+SFn3yZTcIDs+el//r/S5hUlVfdRQpyFsAUvLOGFpVPetl
	V7NTXVNOJWYGFTABjW2ssJptARrEL3uUUG73cy3jQEqoIrPorsqEipLh+s8HGUtb
	cYdLvRrbJsDDWy0uj2ULIZOTG0aBcD6+4NfKDizn4A1086XwAH+em7dtyL+CgSS0
	otP2MLVrFvzegqj4UNDrjPJah+VIAq3EkImslVZX42KtYk2RUVHxstwq9HPCpeaE
	/3gLnlVrPDo9pEO65CKxdO07jIzyqShBIz+zVi4JHyFNKcv2e4JJIyomMQF07FAp
	v+homQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbmcrvpm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 09:24:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c9d953b71so1029641cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 02:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785317042; x=1785921842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VMvaD5ZZHFjIgOBUc3cOIiKm2r4D1cgeWhUvtITUHDY=;
        b=UGW97eiUL8vXXoltzoHgyZel4bHnI8hYRaloAbOeJiMXhNfLsTZJCvm14qIbd9kFht
         +7uuGbl1JO6WCRruzl3C3Eq+dGVzskX7ThovQfxVZw0NfJ/IsVlK0JSBVhzOFINC0CpZ
         Ilv1tIYIeguaW9dscppYfDrumKl3k34kzkD5l/+37oZAnl6/NhAErDNtFYcJBIJtcfIQ
         s52uCcUMZ6zKnMQug1bgbUXWxJuSdYaNNpQR3JTXCYRCfVQ/o0Nc7ROHBexR+2qwEAq4
         RS4/gDMx48QGt2JwwXeN1/5FWRH4RDZy64S9276WXB6TWI0aotxDuW3EhHooWPm+HbED
         TMDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785317042; x=1785921842;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VMvaD5ZZHFjIgOBUc3cOIiKm2r4D1cgeWhUvtITUHDY=;
        b=WFm5E5M+FVqiPAblwEEehGaF5G4n40lcpU3TLNuIUFgsN2BFBn7nyEQUb88rMAqgQw
         rc8AokqBHUEaTOmFOnZW4ldaFcVI5ZGTHMpCWtikmDbkkJZbNzlQGpAvcn4FiU48by/P
         3bOm7ritdN1asncUQsPp+VTaqwYry0evwLJfQTcQA5J/N3QomPKlinZ16OYQP9/UJhp2
         87oZ5b6PhY8+mzmAf75YIsidYEuPL7PzLm6iTpqEbN8/DezMgr6wKpgqX+P9SmLGFYv+
         qtcaBgotyC/lDxlG8ZlhcgR/gJdomgxaw07BEe3Fhe17fb0Yh28dl+INYT64KzeoKViu
         CA8g==
X-Gm-Message-State: AOJu0YznDzwcuRP/puaENaA1IgdNMJUOtmKeTuDX6F68+MdlR2/bFU3T
	BIakarbmGi1b+9rjdSBW/QlhGzkn9wUH+vFwKqERpo/IdPKnJ36dVXeVgmxHuLtiykKunXIQZ8T
	JfwwOSo0iIBuSou4pQ4Oy0Lcb+y7tN4QFYRgnUh5gsuaLJbx1qh/qnDPes5LsC+y3bYUO
X-Gm-Gg: AR+sD12gQF0lN5a2fgSSIKkdSevfCp9J+n5Zp0HTa/aGUvfyMBf8h/1MlV67RLPlj6Q
	Fh6T4BYDlsg49lmhePPyU61DLAqyQmeFvyCI8pgoEjNyKAcMulAPzHajYSRk8WITLgadeTsYzEk
	RNDAUQJ46qeBay92jGXllFHpvOlgKeRlqyV9QpV5JXWiBQmpSfD9sM7rc85E6krJezsmDuhvKtx
	zkjV7L/XScgrfxxmTkaqsixca60LFx4/nnCFbKHxoSYwhd09nCTqC26vvLC/cA67rXULLdGduQq
	xrPhxd1Ei0z3TI8dQLjEiHOoiRss/q6f/oQhUKyjVfE4hh4muVi1IKELs2qDSU3W394PvrOcCl7
	iwvXTITV8B7SSpS8usj20nfvp
X-Received: by 2002:a05:620a:284f:b0:92b:14bc:7936 with SMTP id af79cd13be357-93302679d68mr452319085a.1.1785317042202;
        Wed, 29 Jul 2026 02:24:02 -0700 (PDT)
X-Received: by 2002:a05:620a:284f:b0:92b:14bc:7936 with SMTP id af79cd13be357-93302679d68mr452315885a.1.1785317041693;
        Wed, 29 Jul 2026 02:24:01 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a050bd4a13sm606941a12.9.2026.07.29.02.23.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 02:24:00 -0700 (PDT)
Message-ID: <dae4c944-4c33-4cae-9b1c-22f9995e7217@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 11:23:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] arm64: dts: qcom: Enable USB controllers on Shikra
 CQS platform
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260723-usb-shikra-dt-v4-v5-0-5b69d9eb0888@oss.qualcomm.com>
 <20260723-usb-shikra-dt-v4-v5-2-5b69d9eb0888@oss.qualcomm.com>
 <1dbdd44d-070b-4abc-a79f-3cde09de7d74@oss.qualcomm.com>
 <40f21498-a982-4dd8-a7a4-36da8e647a77@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <40f21498-a982-4dd8-a7a4-36da8e647a77@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA3NiBTYWx0ZWRfX7TPbcNOnzHCq
 VtBlsJ8ZhpbhFgxK0mBO1H1zCOKVx6J5ik8sKn+KXejOYGLtbMShVkdAjxQtZl/zwjol9ZLDgOq
 +Vmg711JiNOVouXR6zrsyPYXjhp2twigss56IHFQQXmPwQwafasbciR7Q7pk//PTne7p0MkU3mF
 dBvxM9Y9rLKHSGpY4P0PlFZZ9CCweaZQhi4ya/ulVdD9046g6wSN/sNc+D6ppu+43qZJF6YSOUZ
 U3u+fkZZSSHjrv2AhU+SrZtovxwHTU0b9sz8LeJA8jgoiuY//PDeRls90A/trW8lw24IxHuYo5n
 LkGID7RjPoedrYyiiJIH82K8vYn3VQbAAL4uWZ8NDy2ceDVxTDxqpbAXUMN00lbMJiISecLdVm0
 FVJ8QDuqFZMqAQMoivg4Fq/Z3llUcMESCfvhxksJUPm9rXUhjcd4JhfPLFTVz0Pn9J3KY5hw6aT
 PX7RNjhou6wJmfq4Htg==
X-Authority-Analysis: v=2.4 cv=HP3z0Itv c=1 sm=1 tr=0 ts=6a69c6b2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=-1RbvBRAzdijRCssOkUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: ATQLbGTgJOwgb8Z2hZTsiCQchsz7AtHn
X-Proofpoint-ORIG-GUID: ATQLbGTgJOwgb8Z2hZTsiCQchsz7AtHn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA3NiBTYWx0ZWRfXyGS/CjBIvjCG
 y3JrC47EIcpmvJHv94BD+w+Lpf67uAMf3v9reOny+ml2NKG1NEXolvPpauw+F8GYbO1w0RNSlGI
 Qd507JchlY5WZeIli+OK+Pq2U2GWEXU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290076

On 7/29/26 7:13 AM, Krishna Kurapati wrote:
> 
> 
> On 7/27/2026 8:09 PM, Konrad Dybcio wrote:
>> On 7/23/26 12:33 PM, Krishna Kurapati wrote:
>>> On Shikra CQS platform, usb-role-switch is handled by PM4125 on primary
>>> Type-C port and Cypress PD controller CYPD6129 on second Type-C port.
>>>
>>> Since those changes are not yet present, enabling both USB controllers
>>> in device mode.
>>>
>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>> ---

[...]

>>> +&usb_1 {
>>> +    dr_mode = "peripheral";
>>> +
>>> +    status = "okay";
>>> +};
>>
>> $ rg shikra-evk.dtsi arch
>> arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
>> 9:#include "shikra-evk.dtsi"
>>
>> arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> 9:#include "shikra-evk.dtsi"
>>
>> arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> 9:#include "shikra-evk.dtsi"
>>
>> I think I asked either in private or in public, don't remember at this
>> point, just enable these controller once. They are all the same board
>> with the chip and PMICs swapped. Override just the supplies in the final
>> DTS files.
>>
> Hi Konrad,
> 
> Shall I enable all platforms in one patch or in separate patches.
> 
> Reason why I am asking is if I enable controller and phys on cqs platform in patch -2, then cqm and iqs will have controller enabled, but not phys causing inconsistency in those platforms if only the patch-2 would be applied.

One is okay because of the reasons you mentioned. We normally prefer
one per, but this is a bit of a special case, since these boards
co-depend on the same include file

Konrad
