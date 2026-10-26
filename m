Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793024594;
	b=MEBajdeuJ81TQvJekr150N0ygUN/9OapQ1GJg+eXzfT6UIBJ+7vY3sTPo8l7ibT6tmmh
	 WBcG7klwlqcRK23t/uBqwQoeCuEfxi7kf9uR61RjhBqj72GkyD5y7j5kE4vMmmg7mtE71
	 UEE2e6XGJGijByEmlkg9mRnOr0iptO7Jht1eaAGqT/++kXjIeXEB4JZftYJkOsB0jNNDI
	 a7EncCIvMnWDh5KiKua1vU7xH6pZLG9xIFDJqkyNX8VBQc92W4dVHd1YGEHpN2SjWPIOH
	 Wt4kknjKkRIdSpdYnIhuVWiRBGwgGehsTbdRTIdpiiI5OCj4ZKBrdlmixIj/tcxDelg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793024594;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/lxFqYB5pBZiAa1putHmzekSVtSEmnPZDxaN10xaQFI=;
	b=IHA6T5id52dL1Htj+wXY0L0B+DvG+dFulmTX5tjI9eO30hh0jOhUv3YhXmV/7IejcBG6
	 JmtmarY2ypjp4Kiw17VjvRNBOVuEw1R23Aam0CcS8UrxZXFkInLK1fi4c2kW1LmqCytEE
	 FjpVm7KwA/Dkv4LbRwfip10dfE64rmdFNnV9rFU3AqDAkppMALRS7h5CF88Cqt30dfXuh
	 UpuCP9a8ko9dQrR0KwfEB/+WF0VjeLWcSo3qcpukLtsFyvG9L3JP9RQ6mtf0Y4ihitcpF
	 nu4sqDVhaXqfw1Fn78lek0aRljhaQkwkN96/ALWDjL2JOPSMwc785EOcwST7RB8aaqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D0zH+rPM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NvtL0J0G;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D325606A31D
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 14:23:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D325606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D0zH+rPM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NvtL0J0G
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt8Ae4126450
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 14:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/lxFqYB5pBZiAa1putHmzekSVtSEmnPZDxaN10xaQFI=; b=D0zH+rPMcrb+kex9
	RMk7N6WejxHJypspAeFfRqfzDj1NLB01Qr4+Zx9JPOrOboDGUal2SLVIpYxHC5ee
	OCrvD07eqCRvhNfaWxuUnieEPmq+VFBe9FRqxpN45wYODryXF284Kf01kLpBN9eq
	uAWvf8Gl/XzfglHllNpwf6hBux+OhZIDHDh5vFq0RgeQxlyC3+tSg8b2NUgB9xJr
	ziYJHtzx8lJyajv6XiZAOVy8UTEmzULjsEVkbunqRy02ctMejz/kpOZgXHlCnHhe
	h9NyxmJ3zxBr4VtxFimFoPaSL2ria2jTmlsJaMMEzmL4o8PsQP3Et1Dt198B6mnu
	x4sXCQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhshptss3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 14:23:12 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eabddbb650so58295e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 07:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793024591; x=1793629391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/lxFqYB5pBZiAa1putHmzekSVtSEmnPZDxaN10xaQFI=;
        b=NvtL0J0GZ3DCwpRijq+GpXmHH7YM1UUlUhX+Wwc09arHzquApQNgLnYpoGqB19kKWf
         hIfNOUjSgakyTJnUH4plJ4y3sf3TFKsEnci61QNj5ikP8hu8jK8WNOJpvHYxLUOtQG8Z
         HlJ67cBbypuI9EzFjqa8RjOADybJF1Xz02RPnQnbDZ2Q63Q/UkV3W9Y9QDfoTrEF2zaU
         1fRhIajOHvLGOhjK/8BnPM9Qgst2qsva09jAVRwMj6AWxiZMOEEaE32dkn8LtPz6MnGY
         Vm9JKG8viILrzZPVqiwQhtV/FXcB4j2r7dNbP4jHI90vAk+V+knMYmH2w/N2s67H24oV
         E31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793024591; x=1793629391;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/lxFqYB5pBZiAa1putHmzekSVtSEmnPZDxaN10xaQFI=;
        b=Hp5mv0yL3NNDYDAinxhu8fwtXHPJxgVoHDspmfI8cXCtJp9y/Qf/oY2yExJMPLMri5
         SqIqUM9Z2j6xTbSA2svFDwoMBRR3TX0+gb81F70mydog8wFrptX+qOMta1uuZezZQeDA
         uSYCfieklKfGn0+yH/XlPXOgQJl2+syo6F/08bN42A/pSpxntJwxgTSwWuA0e0Odta2x
         ZeToMdQZdIRNRPwojSurf5WIA+kUsnB07L5QIfQfWwJ1hGH31wMQKYeh6qo0gbFgxAq9
         dMp8KEHvucsjxJP+bSFVejbjcqikAIQxK4QFvPclRPzgEfieXJdCCxQxpmQjTz9J0DwL
         aeRg==
X-Gm-Message-State: AFq9FYL9o9gc9NA9xLBuFZaGiUID/bSFQb5Uz/Z3uBMkVvbYljlEwSBq
	odNXXedU/oV81J7ogurC+IyFRM6usQYOL8nfGp9+IgDVWw0cQUF4u8cPkhaTHVMi1i1/e7LpLSW
	Owirl66nGvjstE85JOmsjsAmS4ubcz4K34AHu3uR71bu/QPTipuqnAfNkAgqVJS8HR68M
X-Gm-Gg: AYBFou2x06QiJcyftiyF1EASZCIdv9Sp/HbG52Hzz6x7Oo2tRMrCO9aTbRWCFVg+5uf
	jRgc2TzFRUmLgAvnEfaKMUYGnG1fSvOSw7rgd4c15lnwBj5KbNIi1SalTwjkV+lSjcbdBgkTdje
	j8ylhWng5QsPqHB8R9ivoYUoayosiyzJtF5O9+VWo38tubD0xYxekzBG8rQvvbnG+dBSgVQJxWn
	RnU7a0/8oNe2wUnVz9JYwQharv7zP1Dw3FfVOL+rGv3D+bS9MAm/YKUut4xcYZhDx+s7LMxMU6h
	zVI4ajAPjgJeun3zFgbUsUe2OjejgdquMGFsHgcj56LqZlAkDcFvDHnU3xRzCEuegDKUip1Q1f6
	7AdR6S80SjUiZT53h0n9lAQ==
X-Received: by 2002:ac5:c8af:0:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5ec232688d9mr2115554e0c.3.1793024591144;
        Mon, 26 Oct 2026 07:23:11 -0700 (PDT)
X-Received: by 2002:ac5:c8af:0:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5ec232688d9mr2115521e0c.3.1793024590603;
        Mon, 26 Oct 2026 07:23:10 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd529b47sm326826866b.40.2026.10.26.07.23.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 07:23:09 -0700 (PDT)
Message-ID: <23131f02-0df2-4875-a409-b9c9340d0dd7@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 15:23:06 +0100
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
Subject: Re: [PATCH v9 4/8] usb: misc: qcom_eud: add per-path role switch
 support
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
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
 <d4907952-60e6-48d9-ad81-1a0401f3207d@oss.qualcomm.com>
 <c28fe0db-6ce2-494b-b3d7-9261e3045b41@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c28fe0db-6ce2-494b-b3d7-9261e3045b41@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NyBTYWx0ZWRfX1mmvlnjT2qKj
 2OsmkGYuzvphiFZI54TILnKjpIz0VLhBNYiYI94L9n8J+06fHKTxonQwmPgibH8WRaJviBBADBn
 QBIAJ5MSV20itnzAjJlacfDb1mfPwfI=
X-Proofpoint-GUID: J-tbsewAPJdRFtFnWs-lyipbraLhn1P9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NyBTYWx0ZWRfX8xv7RrrfPyWl
 RGDaPt/gHWUFr1YdV8uC03eokv7Vh9odEnAaH5dDH00eZGV2M5rh9l7YlXBza5JA5s0me+41RKA
 xbWWY4QKLdlar80FVYXiX4qDFSzmX3LSb34vKOoZC4osaJPEPkWYJnxPR2FCLae6yWQ6IYFucYe
 WUc+SUe7Qm+JZPGEZ7Fd2kf3dW7VLIIVdpthDXC2/BBv6WCUtl5i4FYLtCrbZLGBZrcDs4Ik5OJ
 ULoqJhkLSHSx8DC5FzkVNb0LdEw7i8+DYaoukImApGQg2W+vuMe5beGv9f9HFI2CK+Zr1mocqxJ
 ldwmwdtzym2amO96UIWSlt029tGgrA735du62DU0VGtcBUnsTQbXPSPe6GbPmMl+FtCzc4A7tER
 I9pXls2+ePX95oQcOzS+n9ZbieZaneSdMijMNLOwXLfhVpLryDojolFXqVzjypJq8/sXMboTWnu
 cPXd5DBiHdDg06/on+w==
X-Authority-Analysis: v=2.4 cv=HZWB3SE8 c=1 sm=1 tr=0 ts=6adf6250 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rqGjVLSmFW5gv3Cq8oYA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: J-tbsewAPJdRFtFnWs-lyipbraLhn1P9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260057

On 10/17/26 3:16 AM, Elson Serrao wrote:
> 
> 
> On 10/15/2026 7:43 AM, Konrad Dybcio wrote:
>> On 9/29/26 11:35 PM, Elson Serrao wrote:
>>> The EUD hardware can support multiple High-Speed USB paths, each connected
>>> to different USB controllers. The current implementation uses a single
>>> chip-level role switch, which cannot properly handle multi-path
>>> configurations where each path needs independent role management. Since
>>> EUD is physically present between the USB connector and the controller,
>>> it should also relay the role change requests from the connector.
>>>
>>> Restructure the driver to support per-path role switches and remove the
>>> chip-level role switch. Additionally, as EUD need not modify the USB
>>> role upon enabling, remove the unnecessary role switch call from
>>> enable_eud().
>>>
>>> Reviewed-by: Peter Chen <peter.chen@kernel.org>
>>> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
>>> ---
>>
>>
>> [...]
>>
>>> +	sw = usb_role_switch_find_by_fwnode(of_fwnode_handle(controller_node));
>>> +	if (!sw) {
>>> +		of_node_put(controller_node);
>>> +		return dev_err_probe(chip->dev, -EPROBE_DEFER,
>>> +				     "Failed to get controller role switch for path %d\n",
>>> +				     path_num);
>>> +	}
>>
>> This will always probe defer on a fixed-role controller, we should patch
>> dwc3 to always register a roleswitch
>>
> You mean for fixed-role controllers where an explicit `dr_mode` is not
> provided in DT and the fixed mode is derived from the HW capabilities?
> For explicit `dr_mode=host/peripheral` cases we bail out earlier and
> never reach this path.
> 
> The EUD databook does not explicitly mention fixed-role controllers,
> so I was assuming all DWC3 controllers relevant to EUD are DR-capable
> and register a role switch.
> 
> I can see how a no-op role switch would address this case. Would it be
> reasonable to handle that as a follow-up improvement for controllers
> that resolve to a fixed role at runtime, rather than as part of this
> series?

I think so. Generally true-non-dual-role controllers (i.e. by HW
limitation, not through DT/firmware configuration) are probably
unlikely to ever be hooked up to EUD.

Konrad
