Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68333955CA
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 04:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790138576; cv=none; b=ayctkSLaR4+iWVcUsFMN4gjLHuvNXOv/R06mHAcKqaV6VSCHNP6fo7tQ1SSgQu6wwFFNxIutgOYksOQ9iKd9M2WNBoWM4aXKTkhMsFfHNeVRPwm9gI9J5svVVqsIItJhSr/benRFRjJYRmZuEbmsaMJviLwNI9lEiLe/OWpfhXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790138576; c=relaxed/simple;
	bh=NYRkHZWGs/bg6cz2kdzaAQq8rRGG3aHwfU8FC1Vs8Yo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=npPqld2+tBzPnsrJT1hRYFIy4A75SLP5pusG0TJw5QYF53mJ50HtHGZFFKOMwuuMgZocD6JEp2Qdontc/nBxj+7NVGguT1yWILJw/YgsevX0u6DhN3n5aqt1V8L153n5ilXqxyfTmq9JP+Iw0MnIAZcSjELvFvHzhX0fYc8K+N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JQOIjq5h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h2CjpMW/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JQOIjq5h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h2CjpMW/"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3ij7h2116331
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 04:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EhE2eJTuj8/rqFHSWLA949aI6y+p/NWKo548Ep1IwnU=; b=JQOIjq5hbCV87pMM
	UDu1TAg1G4lCVz+s9TrLQ8eBp5fwBWUQN6lc2qSZU77tUnSnfIy0/1Z4oQ9gpFY4
	nbMBF/v0uW3PhYPPVzzdOJTSbIxSxDDPtXfcebV4NC0U9svS4vT21W99bjMKZk6s
	RdytLoKckyiAGTBkmBqPFiI6K4w9zjWWzkj3FnsMRKe/JU1ia6p0qejjLPw3Ha+U
	CIAf9YNStjzROT3NbbcABzMXMaYqf2VVLBZabo8Z2QiVzRhQ6y9BjaITzxStB3ij
	aVjFWXFjhW3B3fovg9dgkIPvYkOhi5IX1/g4eAhnad/sN4+PWwcdCrnFqM/JiXvY
	Nq5B8Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv32qs0ee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 04:42:53 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso758594eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 21:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790138573; x=1790743373; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EhE2eJTuj8/rqFHSWLA949aI6y+p/NWKo548Ep1IwnU=;
        b=h2CjpMW/gheZBSrI2tmxKlnpmaes6yGGyXggRRydyYDpSXMEfunb9fXoTtnH2wjWIo
         mndGquSkIPiSA4QLjsPtdFy5r/rpvxFey0DR87bGGygMlQfsWIIsPGWcnn+7Qw85CD6x
         AJQjPNWhTPiegut+PTi71ttlDG928xgMuU39y8ZXW4mf2DZEGFH1CdXbFxanBC73VyJ1
         CHUqLFVIePZsBO7yBTRA+pOY5Tk8yp7G42v+hlKmrWq/C0U3i/0i3RN1gFD0+geijg1y
         RJ3mqEE78XJ7m3BQBtsERMfZL9lP+qpZJplIwbf90VzqYEJoLu38KB4pTj1KZ0nVaCmX
         leKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790138573; x=1790743373;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EhE2eJTuj8/rqFHSWLA949aI6y+p/NWKo548Ep1IwnU=;
        b=U72XNvZo6/arF+BDHicTA8ZNgL19BquStCFOVywXPP6ZqC1FWeAIfeVBZmfpnBmFq7
         c3tcmYYsi3YPCZKH4WMPt9+wTg5rNiQAANxxxRx/PM9Cdyh2MKGhU7J/XbhTdsLh+uSm
         FW09m8kBbxu2xNJLrT71mi6w1LiCAKPbipjQgZn3N02xFL7HA1RZ2CDGwl2nT6zU/9Yd
         Awy69Uf93kuXbc1JMLFnOW5LR8+iwnvOf/n47CXb44lKlPdTANlKctgauUf6ZZnXdzBv
         VEcUOSn82Rzd1BAyrFMHJN9m0eyAtasQxOy8+Ol7ruHU0t1sgP/IcDDWkbrfAwxYae/U
         vueg==
X-Gm-Message-State: AFuF++kfQiiL/4390J3N35MkUNTuVYghrq8jemVhdAsSMcM82KNUs6Zb
	JmfoxxsIXWgf7P6n64KahUquzoybvIh5JvJW3MQNSMamp4ikVWfNJRXwP9/FfosQlSdZyt9DJHa
	OYw+IKdymnrmtnGg5cuxoaV0G20OwLHfgSR9iWBrehcZYVR8BW/V0ZLidVaa+qeAffNWO
X-Gm-Gg: AYBFou1fSnNDulY1AclQgeBCaX+FOJ+mMSjs8Qi/mXJoHHR2cOGLZR0PSXthMPKOxQo
	wkcVTgPErkybpa141aH/5buvzJivMeC9fNbMwl1niGRR0zEOyBnTrOu2qykFZDSuPzMwZmkMOu8
	lJJpeh7JljnNE72WU3RP6Lm3MrYPSJ50z2RCxw1tU5QFMvATyAgc4Je1vVAFC6vtRsZXMfSxoee
	LiReCsYGyb0hOqjgSZhpbv7JMS54B0imxrrdgFwKYPn+W/ZFqcymUaeuAzE1JSkVv4a4lvep6Lv
	U2ghLe8IUyY9oC7qBFRNj2Oj73O9alS6Ke5cZswfseXowHnrXkLQb+zL7deQckQqnUBBeHgA7+u
	LnVekejYPNCzYnE7rUCiU7koBIFpFqA==
X-Received: by 2002:a05:701b:4501:10b0:143:26d0:702 with SMTP id a92af1059eb24-144f917a13dmr1605798c88.27.1790138572649;
        Tue, 22 Sep 2026 21:42:52 -0700 (PDT)
X-Received: by 2002:a05:701b:4501:10b0:143:26d0:702 with SMTP id a92af1059eb24-144f917a13dmr1605779c88.27.1790138572013;
        Tue, 22 Sep 2026 21:42:52 -0700 (PDT)
Received: from [192.168.1.132] ([172.88.17.160])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f949e60dsm2567181c88.2.2026.09.22.21.42.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 21:42:51 -0700 (PDT)
Message-ID: <1d8c0aab-90d5-4052-9676-bc7dda7c77ec@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 21:42:50 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/8] usb: misc: qcom_eud: add per-path role switch
 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>
References: <20260831030147.1500616-1-elson.serrao@oss.qualcomm.com>
 <20260831030147.1500616-5-elson.serrao@oss.qualcomm.com>
 <6495b9d1-fbf1-4ab2-bbb7-2ea20e82a1e2@oss.qualcomm.com>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <6495b9d1-fbf1-4ab2-bbb7-2ea20e82a1e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SJnXx+vH c=1 sm=1 tr=0 ts=6ab358cd cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=p3NwzfejtmCMKWTc25r7/Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cWbbo2YNG3VjKU0lMbkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: nH1zLhACixu3DrOWTW_nxqomlUSlFnRF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxOCBTYWx0ZWRfXxpnsON+b/I/f
 gisZw+Ks/y/0zKj9urVZ5m+Jvm4HxohL2Vl8Uxt12/rSz6472Q/SABkg20JpnjyWUSTvKTSdEMp
 1oxn4TWDxtI0AcKv/TMIbvNRd49nw+o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxOCBTYWx0ZWRfX2mq7lzt8oQzo
 ch9gG6oRL7929XFB+Etopx+sgB5OJeqhFZlMETaE0AFwVfKHXin5jCQeHE67Avy9FlsB3VvRQbe
 RFj2e24S7H6j3nAWwAHn8vTRUG5CSS+sVD4xTjncPcBmvOzcXeMKS21TTcHk/hBPsy1GXuK2MSc
 JnFWxiRn017QdjtYHx8yMybXgFfioigPg+ibd1yWP3CJCdxt/Jq7FNR24K3CSdzMhF+OEZ/SI4Y
 4ewUfNnGWPv5mIJag4sTkvK8PK2rR70dqmz8uP5ENyuJUkFYb9TsQntHCnyKrHEhXc+VqX8axXT
 qdfemAdZa2/xUD5c13d+ghPl3UBJzkyyJ24zzQcmdofTKb6Tc3vdsvEeSiji5+D9gwYqzxHXDyz
 33jFiWY4jOnittj6RGqAa5+Jc+zkiijd3tew2RYB5pBHD9EidLiimEFevox0a6oylOfwyQOx4d+
 /5+mFyPvH52qac1mozw==
X-Proofpoint-ORIG-GUID: nH1zLhACixu3DrOWTW_nxqomlUSlFnRF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230018



On 9/21/2026 5:36 AM, Konrad Dybcio wrote:
> On 8/31/26 5:01 AM, Elson Serrao wrote:
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
>> +	of_property_read_string(controller_node, "dr_mode", &dr_mode);
>> +
>> +	/* No role switch needed for fixed role controllers */
>> +	if (!strcmp(dr_mode, "host")) {
>> +		path->curr_role = USB_ROLE_HOST;
>> +		of_node_put(controller_node);
>> +		return 0;
>> +	}
>> +
>> +	if (!strcmp(dr_mode, "peripheral")) {
>> +		path->curr_role = USB_ROLE_DEVICE;
>> +		of_node_put(controller_node);
>> +		return 0;
>> +	}
> 
> I was thinking.. wouldn't that also get rid of the virtual detach
> functionality on fixed-role controllers?
> 

For the attached DWC3 controller (the only controller coupled
with EUD as of today), a cable disconnect in fixed `dr_mode`
configurations is effectively a no-op from the controller's perspective,
as the disconnect event simply does not reach the controller and hence
DISCONNECT irq is never generated. The behavior being emulated by the
EUD driver for these fixed-role configurations therefore matches that
of a real cable disconnect, where the detach event is not propagated
to the controller. As such, there is no need to handle virtual detach
for these configurations, since it would not emulate any real
use-case scenario.
 
That said, I do agree that if a real use case arises in the future,
either due to changes in DWC3 HW/SW behavior where cable disconnect
handling becomes meaningful in fixed `dr_mode` configurations, then
we would need to revisit this logic.

Thanks
Elson

> dwc3 currently only registers a role_switch if it's in OTG mode,
> but other drivers (such as dwc2) do it unconditionally - see
> 
> https://lore.kernel.org/linux-usb/8fabc049-7fdf-498a-a3ef-6f2570d510c8@oss.qualcomm.com/T/#u
> 
> if that's the reason, we can change the dwc3 driver to match
> since the maintainer there expressed he wouldn't mind
> 
> Konrad
