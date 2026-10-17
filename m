Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA61330DD2F
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 01:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792199673; cv=none; b=Z+FHbU+hjEDM2pj62NZFEMAEyA7yVMZr+K2JrmD7qtIQDZwlNQwlv7jI+/y0rWQsuPqtmayuQ+0vadOiAyG7wpSrFC/+6sCzCSZp0tL8bm9ickI6pIXCnKsG9Oh9Qie7/MHa64ezexekGvHwKA9wKdv1r7o/0Die6kdDgK5td4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792199673; c=relaxed/simple;
	bh=wb7fEPNZKS32fDHKkmXxrKiBLAZBQfICfJnuna9llUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oq/tEdSHz0KXB4wcR0fGufRuvkwml2Jp4fw5LjAoPm1fvYsqttdKAvHUZH/3iKEjLixO88Cx7SHOKVZS10s2wNEA+ptGAyhMis6/KgcKTrJ/wBjG+UzwMS+Bv1JWFOmbSQxoce9snK/PIMdyVbFq6pFLfSrpXZAptnuTwyudPjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aXzoLO+l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XfCZBvTS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aXzoLO+l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XfCZBvTS"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H0L7J43613480
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 01:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+zMslp4R08qyyVZNLg2DRXloJ0T40N/Kg5Y9YRyifgk=; b=aXzoLO+l2BHVT41e
	HMpAlnMMa31+trGX6g+azKpscKfA9TVYsOdy6Trte3D/d6PECK38YSiV8BFksLvH
	ugU7IU+LM6lcJt5eEvcwxbqbaklIgfV7/VqwASAoeDYICOB70oInHZDLlIET6Si0
	o52wuRPrY67irV/ghrRqmlU043BWYlucLhApYq6aV+unH1xz0DXIT+uI6WbMxxnm
	dn6jqpih4c5+gb+4GBD4sVwpX4VzmsLj9gUs7Erm+xx+G5sjgfNZQifyAKdNf8Xf
	bhSgTnTCWxUVhQqay5G4VPNdUENNTDhkeFRy/y3TVPowiNuI5YmyM0yOdKq1Ncw5
	yDhF7g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbxcnr3c2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 01:14:29 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso531569eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 18:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792199669; x=1792804469; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+zMslp4R08qyyVZNLg2DRXloJ0T40N/Kg5Y9YRyifgk=;
        b=XfCZBvTSkgVAjSvwGg97I8pVBVWY77Gyc7kqBc8JbzCBjthlWNXDlYdtjnWtcyGDnO
         n6pKmcT1OQmaqEYPOmeDRAEK2jS2AVJnZWi54S+CwRQT8VBzj9DxpLCpuPVxYRCVFo1g
         lIXaGPuzUSMp2bekCVqXjjYJFik2uVTBhIqJwb/iI4kinpndkxZ+qd9C34St6jO6dr1L
         zEl27YYYk2bqrqEcUO1WDEEa6TFRnuZm5Gaa2C7fyQEbzjGBcsmf2xzpAcJAMsg5f6Ou
         m7QW5cG6Slq7E5okadMldZrR4fGlo3pM4noTS0CjcwCIRT4V9FDaeJFkI39cH/qvPmQS
         SXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792199669; x=1792804469;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+zMslp4R08qyyVZNLg2DRXloJ0T40N/Kg5Y9YRyifgk=;
        b=vsWLbMSPWYpBnhO1Ou9jvOgSJnfNBv3BCg0XWOOS4pnqOMGiLBdYu8l5FomMzyMmWt
         pys0M/hbCfZwY8StOYOnr4dFwGXp3bqk/Dr7ecbaiGKzuC35/KYV3+cawg0N/P5oU33V
         HkuWz1jBjUfqov5BX31ftf1iFZ0qspRKt9WHy9lg61U0U91oaSC3NkZOEvff4TwU3n+R
         PNJ1GFUlXnYuB+siWnGre07O0KZ7+mXvtdjGB1nEL6VZdMCQZecB9GX+8dRNemNy7jf6
         2ld7SamcfbpEuQa5M9t9jSulYB41BWpi2yioGuUGjdjvHk2Ynma0Ig/AoVLaEzhpTc59
         VVrw==
X-Gm-Message-State: AFq9FYLZlsH2jTS/CW4DAIyHXzZ0yH0sXoaGKQGTeASw9brgxHiZOHp0
	tntOL/CmMKa/uYX9ZXptAxuiWG6Q/wZXGkia2WxUPG5ihODHh/JyzCoIBgQPhm/MB52Lhaz0vBO
	huqHqNDmx62BPkTr450oJs0rj32WueUaMArW18GYvtiZ4Gk1TiF4oaB6/gyRoQUbcIFz6
X-Gm-Gg: AYBFou2k5IqcRDwfYkF5hxN46Mp5r1+KC+2sM87dSvCocd+On0teJlgnjgVd2iLWTsr
	Eq5TpUwvxRzGYS54QXptKesnmA/y19e1GMkuM7qsJT4MzscvV19ambTNPLBFTG9QFZqOAUhQQFc
	3u2cZSKE+MR0hXcnv3JOYwJVJD/bNlx1hYD+QkSZSx1j6liTMtiAKoQguikZjsmulzSS/F94bHI
	OodEvknEyz+wRTYYDdrO+J3+i77OMHnaHjhbaVB5k/yYFjfAzSrgN5W1pBV1KUc8MKrsFo7as7e
	RneKylVs0ilICZSR5Na8bOtHrLmO/XaTojuLjEggkZCCgfzu3Fr+YU5Ay4QTrjrlsnGY2EQ3CHc
	MgjSrZEj67aWatFa3RsgorniqSUA9yQ==
X-Received: by 2002:a05:7301:18a1:b0:34e:f5f1:2f46 with SMTP id 5a478bee46e88-361a0e85ef0mr1712651eec.6.1792199668360;
        Fri, 16 Oct 2026 18:14:28 -0700 (PDT)
X-Received: by 2002:a05:7301:18a1:b0:34e:f5f1:2f46 with SMTP id 5a478bee46e88-361a0e85ef0mr1712600eec.6.1792199667129;
        Fri, 16 Oct 2026 18:14:27 -0700 (PDT)
Received: from [192.168.1.133] ([172.88.17.160])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608297f4f7sm10294370eec.23.2026.10.16.18.14.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 18:14:26 -0700 (PDT)
Message-ID: <ba7e8dc5-a5a3-45de-a1b3-ca200faf1ed5@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 18:14:25 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/8] usb: misc: qcom_eud: add per-path role switch
 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
 <20260929213513.2401005-5-elson.serrao@oss.qualcomm.com>
 <944d39ba-6e1a-46af-b5ee-32140947f924@oss.qualcomm.com>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <944d39ba-6e1a-46af-b5ee-32140947f924@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BNUmP1QG c=1 sm=1 tr=0 ts=6ad2cbf5 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=p3NwzfejtmCMKWTc25r7/Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jtekIJVuu605EDGJeY4A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: o0CeqC7xPbJNUuYsU7zF7BdV_GS2RrEg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAwNCBTYWx0ZWRfX9vWZN6TnrkB8
 b7m6uFWchA2CBxFzJcvXQ998z9JMmKugf1ymrsYI9bubl2odxu+rxhF6SofDs0RjzLilhXUhHwr
 Z+CrcyJPhoodod9Y3K6uk5BeXYwoHVI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAwNCBTYWx0ZWRfX17sMBUp+k37a
 NZcU6ciEMm4PAX2W2KO21GSDeZxQSvnUTKmVXLf/jVOWmTt4chIv1PXrlXQIdDZFZBUnQ4PHTl1
 GPQOsdG0KL4uaFEk9GLpB5tqzOVa+wYUzR7yEBjsB6sF3J5r2mU1MqxWNg3Yu+SkFZrkTnnmim2
 WAxhgZ53gBPIpqX1sM6+L9lo8A+ofAPf95EoFlWP+1apsmCEqx0R+sGuqc/VZscmjh+4SJBzncK
 6pnaNJc33UeTRVtnMf75Ii5d1woB7hEaC1GWrtPRCfL1M2+sZE9pk+tMCl7eWl3BZiNuMT5ZH3y
 eRki9lk1bLh/aDdho2DNT7riiqGt4MzxM+/tPrEXj3lpQPN3zB3jHDp5wxKVYH95ZT45ZaRkKQY
 Js1HnE14Y1KFaApEKCGN/m9nHusXx9ReMgxpl1aeTouQurpjrBZ/1lthewGIVVMfDBzPd3nBxj9
 Bg4MH/bQl39g5Lk5ymw==
X-Proofpoint-ORIG-GUID: o0CeqC7xPbJNUuYsU7zF7BdV_GS2RrEg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170004



On 10/15/2026 7:44 AM, Konrad Dybcio wrote:
> On 9/29/26 11:35 PM, Elson Serrao wrote:
>> The EUD hardware can support multiple High-Speed USB paths, each connected
>> to different USB controllers. The current implementation uses a single
>> chip-level role switch, which cannot properly handle multi-path
>> configurations where each path needs independent role management. Since
>> EUD is physically present between the USB connector and the controller,
>> it should also relay the role change requests from the connector.
>>
>> Restructure the driver to support per-path role switches and remove the
>> chip-level role switch. Additionally, as EUD need not modify the USB
>> role upon enabling, remove the unnecessary role switch call from
>> enable_eud().
>>
>> Reviewed-by: Peter Chen <peter.chen@kernel.org>
>> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> -static void eud_role_switch_release(void *data)
>> +static int eud_role_switch_set(struct usb_role_switch *sw, enum usb_role role)
>>  {
>> -	struct eud_chip *chip = data;
>> +	struct eud_path *path = usb_role_switch_get_drvdata(sw);
>> +	int ret;
>> +
>> +	/* curr_role tracks the role from EUD's point of view */
>> +	path->curr_role = role;
> 
> This should be assigned after the fallible call below
> 
My thinking here was that `curr_role` should track the role requested by
TCPM, rather than the outcome of the downstream controller role switch.

When TCPM requests `USB_ROLE_DEVICE` (e.g. cable insertion), EUD should be
enabled regardless of whether `usb_role_switch_set_role()` eventually
succeeds or fails. EUD access is tied to the requested device-mode
operation, not to the controller's ability to complete the transition.
Likewise, when the port exits `USB_ROLE_DEVICE`, EUD should be disabled
irrespective of the controller's state, since device-mode EUD access is no
longer needed.

If `curr_role` is updated based on the controller's outcome, EUD state and
`curr_role` can become inconsistent. For example, TCPM may request
`USB_ROLE_DEVICE` and we enable_eud() as per Patch6, while the downstream
controller subsequently fails to switch roles. In that case EUD remains
enabled, but `curr_role` would still be `USB_ROLE_NONE` (see also Sashiko's
observation with this approach 
https://lore.kernel.org/all/20260811215406.7FD161F00A3A@smtp.kernel.org/).

We could keep them synchronized by rolling back the EUD state when the
controller role switch fails. However, I don't see a strong reason to tie
EUD state to the controller outcome. EUD is intended to operate
independently of the controller in device mode. Preserving EUD access in
this scenario also provides a means to investigate why the downstream
controller role switch failed.

Thanks,
Elson

>> +
>> +	/* Forward the role request to the USB controller */
>> +	ret = usb_role_switch_set_role(path->controller_sw, role);
>> +	if (ret) {
>> +		dev_err(path->chip->dev, "failed to set role %s for port %u: %d\n",
>> +			usb_role_string(role), path->num, ret);
>> +		return ret;
>> +	}
>>  
>> -	usb_role_switch_put(chip->role_sw);
>> +	return 0;
>> +}
>> +

[...]
