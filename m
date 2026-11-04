Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793771931;
	b=NjaHJD5PfZpjBgUHvDRFZK9AxJEyBMylcqbVy81CmU9g5eFxSn6Prgm8YaqHd0XoMDp8
	 9BrkmcGUgUMGV1leZ33uTKBpwiKvaURIUr8pnZRE6mgecH0zU509WeOO7tDM8nwfkPHMn
	 8VmC0YCl6Ib0s1wTz4ILOKnU00dYyb8wUM06tu9uLGo//4fvoStUN/d/hZnJNxetGtzhq
	 rWIZqseQH/DpFRWJ/gLvdHIYHumBkmj9PmjuiIlyH29tWZ6x4ayudx3/2OoHO1jm89q7v
	 O7X3mMLrw7cSS8gX5CarAeweHJPpKeqGQ8LJrpWt9FcKXlgFFm2lub5bkm/yzyuaRhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793771931;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=m/OJaXcbh0A/OGTREdwWFahC1oeqC+Z50vcwN4FBE1Y=;
	b=g+W020gaMBSBSQ6XLP7D0GaY/KCeodgPVkiWEp6/juKmYCKt/BuNLg9y+3uTaDP9FJ1+
	 a3LnD+HEYPloYFu++3HzhJqST0+tCoZ3tNBwZlDtFLZ8SgZxjJt1xYKid1d3LSYXZ2A+I
	 mSCNhit1GJbiew3bTg+G0nfpaptQKVpE1989/lLyjpP72oW3MW8gGXe9qAhFwCj/70um+
	 n45juljmagoj3ZdBKIj3Xv80cg7wGMeLfDucC6ae5l8CgRxWLJaxbgt03iKmlUAIf7zzS
	 biA/ZdJzUe1r78pOG5geSYbIpfb8hdtPsnzA0ZERRLQ2RAiPvscHhdqEuiOFock3zzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ew+EDxDL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hfzkbx8z;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A983B606A337
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 05:58:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A983B606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ew+EDxDL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hfzkbx8z
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40R2Es1248035
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 05:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m/OJaXcbh0A/OGTREdwWFahC1oeqC+Z50vcwN4FBE1Y=; b=Ew+EDxDLSs8kDC0E
	FvrugefWxrjX8yDUUL65XV9mRHQ0diHUk9CZHfya/zYWk1EF7B6QnLOnsUxihepa
	4YehPZuY3lsSt+UKY3IvqeGtm33HZhKfBa/aZYwjmfitQi30ia2zS0TlqZ4yLdIg
	7/6rkaoUo30T7X/DvZOMGQ4yldP2i9b2KYv8hYPWUD4PEZfTY7pvyA3cEzRpIFir
	sCZK8c9x1eZSDJx3tWMbR/Q1L2DYbJ991vHMTGOofOC7ps/q/7688WHGlzTIYKIq
	yVSsvBSmnFw2zXEmtiSd+iriesWL64soXRs86KHy4JZYNip3/lGHxWiCHwHoYBVx
	eG1QHA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqpuv9sag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 05:58:49 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3662e7a9299so1302812eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 21:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793771929; x=1794376729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m/OJaXcbh0A/OGTREdwWFahC1oeqC+Z50vcwN4FBE1Y=;
        b=hfzkbx8zgVOT5plQBFrLAlDlJDvcPZ1KuG7TYd971IKg7eXEq+h0h4AH1A4NDT1E5J
         FSnsy19nzZnELcXpr8UTEFPkoG1NvDXcssPbs0Mubi+OKSfuiHm4r1T4SihqZ/2imeWl
         bF7yO2ZfE8vHbE+U0hV9HW+2EcmPpAp/P6HEZV8KmZuPxoZ39XfLXjtS4/28r43FWIk7
         mlBQiNDtunWf8e9OdOMBjrFGVcgKuKvduWrVsisr6cW9fuLZmB4jhs2KiKNksRGnpm9p
         XbRfIAfMeB6moJVoZ1XO/IcaVi2rwGGcs6ON0jhd4XqzjZQvOMctnS5L5pJWzt5VnB4B
         fGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793771929; x=1794376729;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m/OJaXcbh0A/OGTREdwWFahC1oeqC+Z50vcwN4FBE1Y=;
        b=wfVdY8TZQFD2wJpvUrahoWdz5PC4yfwE7aks/MNaETIu5N37Ayz3jYfCqcvtUC5wVN
         7O+9Cly+mvg7HgyhCT2L0mJsF/bhp+vwGKo63T4ifYndG8K8dgOWNWZ/6IutlapCDj0d
         LJ7pEM+s8oceIxTEacC6WECLJyVIWwMF6IsZHflIZzjDIr5+jfubY6LUBUJ2/XQ3+AK3
         CAMB7PsqKpeHjTy9fUs6an97I4kU8WvF/ux26x9JSAc2dWY/LAbKr/Zw4HsGcaO08K54
         wVl9zIQa3fmWJo8usaDjykYOgqi04lYbrk0m0L9FiUmk/kEbohLQdM1BmfWetxGXmkTM
         37yA==
X-Forwarded-Encrypted: i=1; AKwUvBwvV692ZMBun4SCeUs6oU/+E5/Ahn42jrkAHfvRrIJIFTd99PAUQkAgYnRgb02lg9hkTuhdVtxWHUAVJkM/@vger.kernel.org
X-Gm-Message-State: APuU4Z8r7SsrbH+q2+sX0m1aaSbLEaviDqUqkvjsaw0pj/vf8/T5qFZO
	8zjtMeZ2AMpKkkPVx0LDvDzF+gdsdLUATQkaj64YiG7S/BMVbsW3wFr0pC1oAJHyOKLEm9rMk3B
	sOaQN9JHBZmN3EQwDri9cbwDsue0UmqcrtrPYvLeVYXAN0p9PoHYtJ/FMQG+XiX7q7pK5
X-Gm-Gg: AYBFou2te5BZQklGrOXYFqxcQYtifT42JfctDn4Fr94Dm7MN1W/q7I9AWJYW2YVWQuc
	HolTclO5JnfQMeivx2JCwbDRd93di+bv7aXLYKbPdziNTpRJY7RmUo+125pCJ8yvmq0RYOha/51
	0Jg1ZiYQcDRsFRCeUXlHPhqrglAlQoq/50Sip4NaRxw3/qJIdI2gTkizLyLUzg41DOwPJXM76I0
	3coUVLCiR1NOLeFDIeblt4I0vGry5Zhjw7tkHxtmZWYlfhhliWlRVH+1aBW0Nvv0H0PsKYIj2ww
	jb6e1RBHCPFHt2GSnG4tS7rsDRBHvsM26E+E8zQBU84U4SrTWEIkvESRP9dNp5dI2pxvcJg4mcN
	W3D4a+l8AFTCcHlSOEJnOh+0nPHCnunyahD0jcCaR1oYyQBPnc8+sg3KO3p/v8KkJAzYQyd7sUB
	+g
X-Received: by 2002:a05:693c:4084:b0:36c:9c64:c547 with SMTP id 5a478bee46e88-36c9c64d2ffmr5341849eec.26.1793771929203;
        Tue, 03 Nov 2026 21:58:49 -0800 (PST)
X-Received: by 2002:a05:693c:4084:b0:36c:9c64:c547 with SMTP id 5a478bee46e88-36c9c64d2ffmr5341810eec.26.1793771928636;
        Tue, 03 Nov 2026 21:58:48 -0800 (PST)
Received: from [10.216.40.83] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d36besm6269224eec.11.2026.11.03.21.58.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 21:58:48 -0800 (PST)
Message-ID: <f8327c0e-ff47-4e67-a37c-9b636758f83b@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 11:28:40 +0530
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
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Subject: Re: [PATCH v4 7/7] usb: dwc3: qcom: Enable VBUS override at probe for
 default peripheral role
To: Peter Chen <peter.chen@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
 <3c1778a36380bb6d9123c3791f15cc3656b80145.1793212717.git.faisal.hassan@oss.qualcomm.com>
 <augvX4NwBcJot_AF@hu-petche-lv.qualcomm.com>
Content-Language: en-US
In-Reply-To: <augvX4NwBcJot_AF@hu-petche-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O6SsLx9W c=1 sm=1 tr=0 ts=6aeac999 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VcVH6SLggcOI8xUk3fAA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: Sf4iJlqWmJAVD2Z1nf0nnxCfol6-5uP8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyMyBTYWx0ZWRfX5NqIIYTd7rCs
 Kx3ZQYDIcw0gUN8XEzPKOB++pRDdAg+ozpWZU4urSok6dOp+IHixFdcWZyr4zvlbFbcBQApB3Kf
 1k/NX1tct89bO3RTHsySbP+z1QQbZoc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyMyBTYWx0ZWRfX8eL9kSPcSMu3
 Wue+ePxz+U8t33EvROynLVro8HyJblCRXVlYuw7X1Bcl1i5r6tvy1/K3biWGhKwhENO2atmmA4e
 wDVIqpy30XmH8vSo0y8vuMyBpxuJNmaGAQy78xXtSsc+snVtT0v3E+pLbexpbinEVZprntR+XvW
 u3Ro9VmEZRJNouapR6Kwf0CVECvSog5g1k69hfqCQBLapFbfxxTHrY166ORYHqYLOshjjOifdl4
 fGa+FRleukNpkpVVMeI3p+FID3dVMfjsUlgtX/UYNY2lQGTfDp+EuMcAsVikKq6NQZLmSB/FCOq
 joVYxKyEFx4QJ950Wn5u9yFJeZULrbiGV/z9UHpQVmTomt1W770QdmZ6fBVLg55IKdwxIv9B2vu
 a266rENkKFT64kaRGoOEC4TORWaGPa9Xo08klDr6KI9Gcbq1zw2N8XYwl1xz+t72ZYFMLwBZbl9
 bdAdjQ8vGVGDFd4CH3g==
X-Proofpoint-GUID: Sf4iJlqWmJAVD2Z1nf0nnxCfol6-5uP8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040023

On 02-11-2026 12:06 pm, Peter Chen wrote:
> On 26-10-29 00:29:37, Faisal Hassan wrote:
>> When the controller is in OTG mode with usb-role-switch and
>> role-switch-default-mode set to peripheral, the role notifier never sees
>> a transition at probe, so the QSCRATCH VBUS override is not programmed
>> and the device never gets a session-valid indication.
>>
>> Enable the VBUS override at probe whenever the initial role is
>> USB_ROLE_DEVICE.
>>
>> Validated on SA8255P with an HS host attached: 20 unbind/bind and 20
>> suspend/resume iterations completed with no failures.
>>
>> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
>> ---
>>   drivers/usb/dwc3/dwc3-qcom.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
>> index 0896a323bdda..92f1223f7b21 100644
>> --- a/drivers/usb/dwc3/dwc3-qcom.c
>> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>> @@ -953,10 +953,12 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>>   		dwc3_qcom_vbus_override_enable(qcom, true);
> 
> ....
> 
>>   	} else {
>>   		if ((device_property_read_bool(dev, "usb-role-switch")) &&
>> -		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST))
>> +		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST)) {
>>   			qcom->current_role = USB_ROLE_HOST;
>> -		else
>> +		} else {
>>   			qcom->current_role = USB_ROLE_DEVICE;
>> +			dwc3_qcom_vbus_override_enable(qcom, true);
>> +		}

Hi Peter,

Thanks for the review.
> 
> How about move it and above [....] under device role, let above code purely determine current_role:
> 	if (qcom->current_role == USB_ROLE_DEVICE)
> 		dwc3_qcom_vbus_override_enable(qcom, true);
> 
> Peter
> 

Ok, I will make the mode and role-switch code only determine 
current_role, and enable the VBUS override once afterwards when 
current_role is USB_ROLE_DEVICE.

Thanks,
Faisal
