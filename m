Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792476863;
	b=tkapyIOv0/bonGgWu2ow0mVlGK/PmaeFKOAyLowt1oUGKmL5PWrnYQ2u/rcGxQDS2oUa
	 shl32GR5r4b8gEt007zLybOq9eA1rA45vhv9NuPYyOy5L8EtZpvHtgwuGcxR2yzboxt9q
	 Ky4mZpQ6Y1yQVC1EJe82E0DTgELLihaqesnrRffSnSq5aHbsF8HVCmulcfQq7iGLi1Ql9
	 jlOu65xiqQpY5nU1ZoOggvwin4+EKPhVpZ3mZEdCANo6jrVMMLgH4OcpdV5SIiCbG0eMU
	 rgj1brM6QSGKuiNlzbviHLV0/T+qwJJW1yYC/levpCWgQV4DOFEevKNvUfUogSv283Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792476863;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Hpn5/imhVLkyJfVtXA9ZyfLeHTm0l9wahpNmwyZ1iuY=;
	b=Nhuh/JcmqzOF2KDeK3e2KfJqbQM8D9PPyhHtUCJ2Zz5ve9p5her13dhSLwJFEw39WzD8
	 JKMtOvCXVa0OrICcH4OovveQ3zdlyel039xoFWF0Bu5W1KF+2FTg5FWJP39B5C6qo46r7
	 S15WZqiSrmlQJr2lG9C5k0nYKYQny4472NNq1UIAQyskQgEjtCYoOJXcggMW90JFNjjfK
	 mibW2h2AEWPE9WU8MytoI4IjgBNPOR9FwyJL0Kb13jXXKHQDfFldX+VQJTK20B3RVxJ4J
	 SqdojYllwxSpb/RGOGJlRt22dJ7XLdIpLMEHkiF70FIj9bh0HHZtS0diVd6vrbKLd0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZfKSDihK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HOiV4n2e;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480C4606A321
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:14:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 480C4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZfKSDihK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HOiV4n2e
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tLOO4032064
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:14:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hpn5/imhVLkyJfVtXA9ZyfLeHTm0l9wahpNmwyZ1iuY=; b=ZfKSDihKFacIqpqS
	d2+KviIIWhZ2wrHxLy5ztQw7gBdTjQXQXvMIA9yBUS/2k9EgKzGeNcRGHTOUeaAV
	IgJM5M84kimu5wAu2mN/VVJEyXSErm8ksu/ZNtJKioVKCaJ6CJPDFF1SnLNZtZ8b
	s6Re+s5FmExW6AqeoacLL19yDIMr3KBi3KTLNcH98zPJyj39tBn6YJO5am/lVAgA
	e4SEQYzbMmIbpYtJt6Dh/N7oZ8aclFn7mtXjjj5ll9L7PAvGPk2iD7KW62Y+fsbh
	/YBm8H8YObw3Z/0G0zHhYJQoIvGfKEJ0bqizP1ASXqty5ouvbBuUEreZMRm4kqqt
	Dlx3kA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5q932v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:14:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2005ce21so512359785a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 23:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792476861; x=1793081661; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hpn5/imhVLkyJfVtXA9ZyfLeHTm0l9wahpNmwyZ1iuY=;
        b=HOiV4n2exjuLkrjSPhWReDJKCI581JGKeqSEzq2JzamYrDDYUFRn587f+3OpvGEcYL
         VMVqCP9D1gRocl/qF36evYClOrtj8MBNHdR7BpTCQpuHXbpbNL72FjaoNskhSRPYSSbU
         vjlzDlDzYBVoz96r/gCRdhr2/maCjKBlLkCC7aldsFZVDFDfj71/AsTidDRZ/m8mTZ64
         5GjQR1pYwzQxQacp8VtaIV4KZ6fc6cM37IKM/IcL4yaZdBUTLG77WubJle/ziFA0/nyO
         mCAYSkVBXxzl7EyGp08Ac5AhCPQ0KRZK4KZXarXjxdt8IAngUSOXjVgeweysdWQjwwNH
         QBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792476861; x=1793081661;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hpn5/imhVLkyJfVtXA9ZyfLeHTm0l9wahpNmwyZ1iuY=;
        b=Xt/yiEWLOMs+3QKOTtg/mwLOS3mgL98QTVjY7395LaOpWgctNHaGTtzRIwpj0jGOSl
         vjg/zDb8swcZtYs9T2i5DBCQw8rfMNFiajv5G0STGQw4lOMFqs7fDMe0VRMOD524Pfrs
         aX+yd4NOSjB/QA41LmHINA841j7AC8pVi7wGdiHgD6vXKh22jNBpggnet1rAQtLsGLuu
         j4WmM93a2pbgeQDysNWJq1ckH+X0Ro+jYZTiOrlEZeSHxNb1SNrw2cw1m+bT50NeV84e
         4WvDNvyIejcqUbTpPaA/GWeMy3SQd8+2L6Gb5wnudFYnQ9EK2+vvUit9WrrvuFo1NM1g
         RK3w==
X-Forwarded-Encrypted: i=1; AKwUvBwUNIWuhk8KzlxGsUgg9M60pAUdwukbTENPk1x6VtyEZ4SQFYYqnmTUX/7qpuDAJOoFFbWz7aQKDUiYBIzY@vger.kernel.org
X-Gm-Message-State: AFq9FYIFEX/rBVe759k74XRG4BOhxjnU1U8riJpnUlBdFEW4O+TVVhQL
	eA65NOy0KndsuYE7CbmBcPXJR4i7b36QZSyOdavmTsRietL/LFr2jSqLhD8S4ZYGpgcXdXoJcUU
	FLyaZfRdBlIEV+0lIMlS0tLI/KN0K0ZYiFJ2gWjzGCE+lHpJMIo/jfxLX0/COvUYK9Vnh
X-Gm-Gg: AYBFou08OfaYTZD8jCcfp4N2dJrdvfwqX9NC0IFv3bZ3b6vH7zOcJ64MS9LPmf6Y1D4
	xdtMOkFDQL2KKAl2dXlGOFixgIg9s6+KlFXW6w6/lvsbuW6XOwcfqjdr8wen1ntShy1FtX5QY09
	nZMYgKj5P/JtlMvTczeiJqVreVwKqgycAKbmOLjpkQCf4Ef/ro4dAMK1rkG03OmGtmck/MbUub7
	ADphmw0a/dFC2vgip7eQ1eOKwUBAXDXY9t3okl8dvHbV4jR4H6cr2VEJTBg7qLwSv5VOaFjIZao
	cTDB2zLRcwPTKEfAOLFrm1yrksVua2RgzrOSx7iBovrbSLJ1BbiWjssFYsmWQSVIXb7Vkd7Lx3o
	PT3T6oNaQD2PEnpxCV23kGBGUww==
X-Received: by 2002:a05:620a:3715:b0:93e:c12c:9dd3 with SMTP id af79cd13be357-93f29e0afd2mr1621876585a.83.1792476861472;
        Mon, 19 Oct 2026 23:14:21 -0700 (PDT)
X-Received: by 2002:a05:620a:3715:b0:93e:c12c:9dd3 with SMTP id af79cd13be357-93f29e0afd2mr1621873885a.83.1792476860971;
        Mon, 19 Oct 2026 23:14:20 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1ce33ad3fsm276350095e9.5.2026.10.19.23.14.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:14:20 -0700 (PDT)
Message-ID: <cdb55ed3-b19f-48c8-8803-dfa32000dc1b@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 07:14:17 +0100
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
Subject: Re: [PATCH 2/4] leds: rgb: qcom-lpg: add qcom,pmk8850-pwm compatible
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261015194732.64428-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261015194732.64428-3-srinivas.kandagatla@oss.qualcomm.com>
 <179213351749.2581328.3338477962958404050@kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <179213351749.2581328.3338477962958404050@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UygsHfe1TZXbNFt8RE3400geAGhvp3G8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNCBTYWx0ZWRfX+fhoJA8UIybp
 r6Jjvrtwk1yC76YkWZfOCNRazaKr6S1+cQ7k7a+oI1ST0PPwnLqzYd827MJAMLPRDTDHCtWJkPY
 Wq5YV8eKNrtkLv7c4adnBSd0lMF/bvGCunGhgfiLQw5E3ifrudXJtrBpK5akLbRE3n40F2HPIZL
 upGbIl3RPkaB53whJbMGC7ykQZaoQ1WrLVTJHxeU8MWh0WJG6sxfrNlLiJPsuRugwiTmIYQhANW
 wJ+CTLNkkxWy8qYmuh2AsGOk6P8nnPfDmD27QJr88FFxnewOyYSdJ7mzTcQdxh2o+DJIaq9CFYo
 0eIjrSBZN7aKnM08nzcDyw59fz+QPMPtnnnZLZ8PpYTq9Ldk6Hql87+2xcVpC99Y7vwc52ODrwO
 LKozup8jmAiMW7HXgCwUYW8t010efLZXEGFw5uBm9G+EGpANRXE/Na90z4YKxdkJX7HzxIFVt+g
 GYsP6sverlXrz6k9EGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNCBTYWx0ZWRfX3PelVTHc1nTp
 76y8RWbD90g2fVC7xpd/9pjiyCnM22MixkmT1rzuyA/OoKOY+5q1ldPhgPqFB93LNiZ6wl+g2Y9
 +XRJo8nLa01sHds3OslTpCuDCn/mcfo=
X-Authority-Analysis: v=2.4 cv=LpcHWXdc c=1 sm=1 tr=0 ts=6ad706be cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VAR32ooWsMDrCBR8X2sA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: UygsHfe1TZXbNFt8RE3400geAGhvp3G8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200024

On 10/19/26 3:34 PM, Lee Jones wrote:
> --- checkpatch.pl (1 issue) ---
> Line 23: WARNING: DT compatible string "qcom,pmk8850-pwm" appears un-documented -- check ./Documentation/devicetree/bindings/
this is in patch 1/4.
> ----------------------------------
> 
> On Thu, 15 Oct 2026, Srinivas Kandagatla wrote:
> 
>> The PMK8850 sleep-clock PMIC on Snapdragon X2 Elite (Mahua) exposes
>> the same two-channel LPG/PWM block as PMK8550 at 0xe800/0xe900, so
>> reuse pmk8550_pwm_data.
>>
>> Used on the Lenovo ThinkPad T14s Gen 7 to drive the eDP backlight
>> (EDP_BL/PWMR_BV_PS).
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  drivers/leds/rgb/leds-qcom-lpg.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
>> index 24ffe079f221..485fa2a7a848 100644
>> --- a/drivers/leds/rgb/leds-qcom-lpg.c
>> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
>> @@ -1837,6 +1837,7 @@ static const struct of_device_id lpg_of_table[] = {
>>  	{ .compatible = "qcom,pmi8998-lpg", .data = &pmi8998_lpg_data },
>>  	{ .compatible = "qcom,pmc8180c-lpg", .data = &pm8150l_lpg_data },
>>  	{ .compatible = "qcom,pmk8550-pwm", .data = &pmk8550_pwm_data },
>> +	{ .compatible = "qcom,pmk8850-pwm", .data = &pmk8550_pwm_data },
> If PMK8850 is completely compatible with PMK8550, why are we adding a
> new match entry here instead of using 'qcom,pmk8550-pwm' as a fallback
> compatible?
Yep, will update dts in v2 and drop this patch.

--srini


> 

