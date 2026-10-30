Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793369133;
	b=tbPOKhXIB0h5iNuU8j6YWuvA8WAPalfYIm2VSf43pn2kM36ndBhvP7GUGlgYdgZ2HkJd
	 I4HvqK4QPHpKCXzuMx3bB8nXnK1LiKm8nsACxVElkKiAA1VVtQCKF3QYs5lSXPceT5+q9
	 eJKt24SlX0mRklSYnO0nCC7QddJdU7gBNb9vm5EGEbNFKQnRp7MjV1fraF9j3Ej+TfpuB
	 C/CSSzzRymDPgm4j5WjTeTM2fPRH7aqlm2mjqC7A1+SH6O9V5Oq2rHKLY8poVcyI5AE7d
	 G0dNbf+I+eM3D/cVw3vrLxRFSZNRfgtMLJqTDwJKH1pXfhF8tSaipaHPsE/soVnOsBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793369133;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rbV34oi9cJeVMXAr54dz5VJbd/j+Zn5ocM7OggS00LE=;
	b=3b0tSmxhTEOnUUayYi5fHjvZY2s5cl+wqT4xUMRwUfgSslugmB+INn/h/SBhdDvNvU3P
	 S6e+W0JcwVrjUmkMVzYi+wgn2U3adjuVzRTrbkzSuIPFNWSQWLnIOuePPUDJWIvJVXlnM
	 7fCca3LKMHxXE+JiWXVrPC2B6fKapULr2lFrJWbVK972pi8eRuLBFpkNssXpK+bGg4LJ7
	 jbe78B5o8jYCQOFE0J/pP+2+2vDY5XrnVPKT9uZEtM5b/zatolsDC2Z0sDQoCdgM2TQir
	 t5voBxo6LicnauUr+D8arFA3egdI1b5ZiPLxAC0Jq/rp5fEI2d4aPFHi6+pzlDgJMkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="I/B4aZSU";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CxBmYtt+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BA0606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 14:05:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83BA0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I/B4aZSU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CxBmYtt+
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UDn9Hc2511797
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 14:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rbV34oi9cJeVMXAr54dz5VJbd/j+Zn5ocM7OggS00LE=; b=I/B4aZSUbex+VvzH
	UGsrZ/7W+JVAfwK8lQqdrmfv4UkM2BuKAZKFE9Sm/HVI9Hi+D9fmMoJtXnah+iIY
	Up3vBSjW7ogvrz+TMhbMZNVxup2cRbceEQxdkP2GRUCjfrD44Ewx07Q/9HC5YjV1
	0iQfqKLuNrj/ec4SQoiTraQWtUci4WUAyybJqwQDm9p7B+4tXXdKfG7tIJ8qt38k
	Ht5gd5X5tsTeuRaO+vcZpAYUOnecBG2VaFwK9QVyO4nfKIQY68/Os+vGiAOfbeGR
	cy4zyS4CAwiQtVoM9a9kMOWKHqoB1jMGpIdJ4ZOjf0NytbiJJn8XaO53ZochKWiZ
	dQ4zgg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pbcvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 14:05:32 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so845078a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 07:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793369132; x=1793973932; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rbV34oi9cJeVMXAr54dz5VJbd/j+Zn5ocM7OggS00LE=;
        b=CxBmYtt+9JA0tzgdpQiWRIKtMLBNeL3HAJkpgs3vC7+W6ggITG6S76iMjbui451+oA
         2cN303WLhFG3hkUfplHFrw8XtE0VFOAEPa0wIJRe7eC2DFt2n+jSbrTZntfyE5Ewg6mi
         tmnuOtqouxtHbuxIJnnn2NFhN4hGRS9v8DZIVPZQr4cGII0aJhfNQDci8Z/KeH8FDUk5
         UigkvEewJf/wyDf19FJVQKiIo+79gdUqePWlGxuc3uBu+1iGfUaB7B1l07eWbl7rShvh
         VyAoxTOvndI4aNvihI6vi62yMCcXTvdSffGGuTS+XG9FPVWGobi5XrvobpryFNN5W/WF
         D1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793369132; x=1793973932;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rbV34oi9cJeVMXAr54dz5VJbd/j+Zn5ocM7OggS00LE=;
        b=kkqcz+eLACmR5fL7/P/kTGdk0cDwswzD2UXOonkopHKs/IfSX6pboX1RSuOqD2YZEl
         5nRS00Wa54lxRgh2HCCghP2P5X0ABRrw00/Tu05v0q4MzRFkKUaX0DFLtMghOTGUAK6Q
         WRNZzEIGkq/UgdF1zHmkzbpHoFYYcxHxuHPP8aMLqNwjamhiCg/Uktnta8QbwRmj+JLT
         5KKGaGuMCgLMNFjMnOTJ+0B5/taoz7didbrvxIff95J3TT2enaMgc8C8ZmaizIhIxaKg
         eWr+v9yJ2IbQNBrHqwH09+1T6xuaZSgClISB+Jk8nADA5Ux+mZmF8m63+2ZPUpLTzWyL
         yzEQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/kgUQQtnt2aphAJJDzP96ag4uUbb4cunfHrRwzAOzCuJqMO81gKlVnINt6rEYuclxgP6w44xM+V8Q1Ags@vger.kernel.org
X-Gm-Message-State: AFq9FYLlv7Jcx1BUmf+q3q4nMKo7KQAK3tBTsqkf6c08WOpnA9iRwDt5
	ICcUiaJhQk4dXag49uyAutjVHB1P4VPNn6wW/8OoImxS1o6Cf+10FgEOVic68LQhvvtjSVx50S0
	Cgl+xTZKisM43ZLGC4MaGTSk1uIixPe2476wnE3DiPfwK/OF4QQtpX6v0tim7xyoTQkdJ
X-Gm-Gg: AYBFou0E/6dDjYO92TmmJyEF+ybybQmxdP8OlOsa6Ju92Y3ki1FxF5sMb80qysb7k18
	2CUuQkRefLtZfLA1/9nI+AfgtPcbaK6asSZTQyYSu4luK4bZ38xSE7+kdxDyPdaAvb3dYuI9oNi
	TzHlY80j7mPltA9+dGlNyO0b+cNPFS7IXpXYZch/i6y3cV02oAlnvIiWztvPTmKndagsurbgNly
	Lu4/vPs1kEjxvJKJAHWiJBr32wPI5LKRVOQhFr5WTZ8M6sFog0sl5sxu5ZHihvEDyAhDi7zxp4p
	Fj3sycy7F9BWNUWESjwx5+vlva4oa39oKSeBl8JMIjuLnKGMWkrqdBVMro6I7FWjgvU9G5GUuew
	oj/X/H1yldudAQy/NPFxsmUiNQvQtaksnEn9paYXXhOrCFutoeomcW2GVKoio/lkPTQXmwwUYhO
	jFLZ8Tps1jbYQjv8vQkN3wGseEPGIwaUaj3wo5
X-Received: by 2002:a17:90a:dfc7:b0:3ac:6e91:3f1f with SMTP id 98e67ed59e1d1-3ae6f00cccemr3780120a91.37.1793369131958;
        Fri, 30 Oct 2026 07:05:31 -0700 (PDT)
X-Received: by 2002:a17:90a:dfc7:b0:3ac:6e91:3f1f with SMTP id 98e67ed59e1d1-3ae6f00cccemr3780080a91.37.1793369131298;
        Fri, 30 Oct 2026 07:05:31 -0700 (PDT)
Received: from [192.168.1.6] ([117.143.160.247])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb096fbfa9sm739707a12.17.2026.10.30.07.05.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 07:05:28 -0700 (PDT)
Message-ID: <10c00e3b-bdbc-447b-b8e5-23642faaa4d2@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 22:05:18 +0800
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
Subject: Re: [PATCH v3 3/5] dt-bindings: media: Add CAMSS device for Hawi and
 Maili
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
 <20261030-hawi-maili-camss-v3-3-9742bca8cef2@oss.qualcomm.com>
 <CAFEp6-2vN5UEbSwDH91eUzP_w7DHd3WtuLnui-_k7az2oQnoHw@mail.gmail.com>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <CAFEp6-2vN5UEbSwDH91eUzP_w7DHd3WtuLnui-_k7az2oQnoHw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NiBTYWx0ZWRfXwZmz8CGGiX7h
 fEwUXczGOOv7lmcyTMPMzBzNj04Jr4KB+FGGNBXzbgPtFkfiStpXGF+Km54+i8p95n/YtfCL5KA
 L8USvRwmKV6oPRR3pme+ALufFpT5z9aZgQvtBiTKAGAzAoLszcwUCBcDk0i49hABvShsnN1hux1
 Bn3nL0QbcO5qaJPl5fAHDJZWDlvpR23sezE2c5/3NXL1ch2OwdhK031INCKCaaDaOrmZdB8yCTf
 gY+pTyfOQHrZcU8RkT5+zaZS4KG8wuTdOyLRxrdFv+KVoTGGvXcaVHywbrB5OuCQDRffKvXLHDm
 i4QuoWgc5NetyzFSQ4chZtj3n+VeVrUyCsjrYETtGCK4gfQODQNMqTexaZfNOj7wb4I4jr8qZtX
 C3wNTc/Pal2h0caYnoFUe6sHMwKi9f0P2UjG0DL+dPn7VJ/OE6hHeolbBVnTPyMVaIvSZAevo0C
 737y/hgQv1Z9vItgcfg==
X-Proofpoint-GUID: ylVuty19tSKlHn3wF8-1sOMA5dXvJBkE
X-Authority-Analysis: v=2.4 cv=Lp4HWXdc c=1 sm=1 tr=0 ts=6ae4a42c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6d0oVIyUxUng7TJeo7N4IA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=tb7J9fPpy6OZh8FWujQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: ylVuty19tSKlHn3wF8-1sOMA5dXvJBkE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NiBTYWx0ZWRfXwgtI64JKkuCj
 8VzHNJ6gS5BELGJYSAnCmMOxp0RjfAhALvCu41/GE5kLz2PRjGvd8i5DQVg2h6ccBh31o/kuPLV
 8IvReaEn5sSXitTjHSRRDtaO7rQc60A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300056

On 10/30/2026 9:38 PM, Loic Poulain wrote:
> On Fri, Oct 30, 2026 at 1:43 PM Nihal Kumar Gupta
> <nihal.gupta@oss.qualcomm.com> wrote:
>>
>> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>
>> Add bindings for Camera Subsystem (CAMSS) on the Qualcomm Hawi platform.
>>
>> The Hawi platform provides:
>> - 6 x CSIPHY (CSI Physical Layer)
>> - 3 x TPG (Test Pattern Generator)
>> - 3 x CSID (CSI Decoder)
>> - 2 x CSID Lite
>> - 3 x VFE (Video Front End), 5 RDI per VFE
>> - 2 x VFE Lite, 4 RDI per VFE Lite
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> Co-developed-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
>> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

[...]

>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,hawi-gcc.h>
>> +    #include <dt-bindings/clock/qcom,hawi-camcc.h>
>> +    #include <dt-bindings/interconnect/qcom,icc.h>
>> +    #include <dt-bindings/interconnect/qcom,hawi-rpmh.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        isp@9253000 {
> 
> Address should match your first reg addr.
> 

Ack, thanks. Missed updating the binding accordingly. Will fix it in the 
next revision.

---
Best Regards,
Hangxiang
