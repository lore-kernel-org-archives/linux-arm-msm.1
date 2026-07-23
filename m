Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9044C8FEA
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 13:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784813611; cv=none; b=PfWoSd5lMqWSuDSPn4a09sIKu8ZNz7WiSkdlgumGF8Mmi1OV5UueYV2VacM+OA5XSjJ2zGeSgyg83/Z9jO44oLcBZ/V1HL9/binvkJ3uOqjxw6fpN3CzIiL/MpVVOU8ep8Bi6S55TJVC6uuyoUvLlJ4vzCOas6YTJbkw+UyzskA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784813611; c=relaxed/simple;
	bh=pWsZFrbNUS6eEaXbQAM66UZCQPvicce1zTVxzu/L6nM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o3l7hBRdUEPbxb9ccb0124WCRiSWYr1k9uqXyoVD99XUdMTbKuqeWwVFwsNTASi0gd0ShDuQwkM4kOs82HCYkdRz5lKi6JfdvNvKTbIM/Ms3o+aUNjsrkjGWchGBX/5GOEE9Qmf+CuyE66h07ZCv/P0ticglT3Mce6yLUTaioVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d5itg1F0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h8y8Ijqa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d5itg1F0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h8y8Ijqa"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvpYG011887
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 13:33:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AAJ92+dVKkhStldqu20Psdf6IGjmApe60MPX/QGCFWI=; b=d5itg1F0Kk0mU1DI
	fimuZV/3TiUVVzE8yLSvIflcj1ApAf2/HjRwb7DE9KCmAND+kTWLsTmaE1tMl4Q2
	NZbjavDKoY3MQaNgufXBodHRUpggkEEVDXCTtYAoGY1+4MC+hSGfkiuFEf/438I5
	+J471LtDsPK/R+svfiWFa13EYwD3nFw+/P1iyCuIpBFgSptn9UBlyGeOFZFbMrK3
	BXikjjCnAB0eQDgE7eB8b6iAw/6DCAIlpavYu0qrj3AqwwvWk5xBdPnxIWlHXYDj
	qeFuxIKnk2wFpmY3bocGO7H0uFlVwSiQYr+voyuhZnPeJHTmLDXYSM14Z5hfn04i
	k6Jong==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkayha9gt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 13:33:28 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7ec54966bedso424897a34.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 06:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784813608; x=1785418408; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AAJ92+dVKkhStldqu20Psdf6IGjmApe60MPX/QGCFWI=;
        b=h8y8Ijqa2bmlp8UcFl1quWuWEOIVZCfKd4dGgrALIQfZ1tgjIUXFauriw4rQG3u646
         cVXPeya6IRlcdRhCo0T5tK4yKXpV8SA9ZJurFLUMx8WDHOZ8KfEtuGngzmuBu6rNiafi
         FZjlgwfOpiEtWfS06Zevxamyghtasx+Ps7cZcskzHMMhv3GJ56LkH9qsZzgBojuq+QZg
         Qi9rZCp7MK7w0Qbg/2n/yeksm3hpXJCDCIONkm/mgol0pfYGkyAi5DTHyDuI9hZBLx54
         Gh1Y08V4Cn0s5whl+A4B88ayLe4Zhxh4exIhpgpqXVbjVzD/9PanrJrp31D9Qmjz0XXM
         S99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784813608; x=1785418408;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AAJ92+dVKkhStldqu20Psdf6IGjmApe60MPX/QGCFWI=;
        b=RZ0chb2TqQrNL08vRej/FwLXIEkwiMlSVQBNz2KVWDGQBuUIi3zJyKd+ryRo9EF0Rj
         FybB8ugox0SZhcNNfIucQUeCGxnH/+wsyzTUrRakkKyFfLW7WqG7jaY3mb/wJhM5nd0d
         +RhzAAxu6g0V2GiJrlcQvSTVXNvGHcRrTMchtvNFAmng+sSyMiVhcQ82yiSmusRKmXlH
         41r/vb5n/e5JrF2YK492EYZcYh2x0jovcbJF//k/6teES1lQE5EZ4DM4iNrIKPzBVQQI
         H0AoMrJf6Zvb6m8lVSIswJUfseOxp2G+2jZ1NnLz6o1o0eFFDJh7hJemDydsoidxJARi
         I3yw==
X-Forwarded-Encrypted: i=1; AHgh+RryT+NOMw2Owhr1Z3A5JOt4pINVsMOOYztLQd1jQsBPY+JeYMhY/AWfCCDITqetapaQzyoWce2f2hy9gNWI@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/G2Y2KIJLnkUYgpswAIZvh08wZ4j/E+nup2vS/W5vBFzFbw1g
	gzMgDt+XHrZNMt9DOxQU0L1Rw0IrE4JEjAh1J2rD0QDT/vtZwXmwZmEA4Hz5Xg4WXQTvrTaElCE
	GixMazghQYx1chQFAzuGP8W4Lky4sTmr0vlDUod0c08mZvCPz/gh2Z9zegsPXXA/GTi/a
X-Gm-Gg: AR+sD10dZu9ZP7qnbo8JKIHSGssVbiRoWqTLSLHO7yCPfBaHat/Pt29yWW+SEYIDDxM
	VP2KriH7Q0vRAwh6KFBSowd8TRE7khv5BUatZJuhmhGTGS9yYSfDLg9rN4Mi1Njf1ZOHCEKYP2G
	3qYbBSTqKiO5OZ/K8+vKvSkjQppORL408bIRWLNkt5/LX41g+tPjKmzmKjHFIGie0PGLfSLtnir
	1YcvlGXCV4TBHOmXIrfHCTDM8++wctSexudA/iAX/kkWUCseWEhYYmB6q2bNhedaP/7HawDNP6/
	a3pcUqAjWBuUfhmLA0pxXkeaQdUb2UPECunMbROixI6H1wlNwsKcxFjwMNspxFVK4SCz6u/9sxP
	rk6lf9TyzEwZN0IgjOstIYHRtuzZAlYqcx74=
X-Received: by 2002:a9d:7d8c:0:b0:7e9:dd46:b9f8 with SMTP id 46e09a7af769-7ee471926ebmr889231a34.15.1784813607819;
        Thu, 23 Jul 2026 06:33:27 -0700 (PDT)
X-Received: by 2002:a9d:7d8c:0:b0:7e9:dd46:b9f8 with SMTP id 46e09a7af769-7ee471926ebmr889159a34.15.1784813605732;
        Thu, 23 Jul 2026 06:33:25 -0700 (PDT)
Received: from [10.219.57.229] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ee2a0b3803sm3569083a34.21.2026.07.23.06.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 06:33:25 -0700 (PDT)
Message-ID: <0ee2667f-db43-4e5a-9b4d-2c2404d4ae5b@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 19:03:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 06/13] dt-bindings: arm: Document reboot mode magic
To: Rob Herring <robh@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla
 <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-6-e7453c548c21@oss.qualcomm.com>
 <20260722171108.GA1097879-robh@kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260722171108.GA1097879-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HZgkiCE8 c=1 sm=1 tr=0 ts=6a621828 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=PV7ZYYKFBiq-RxTmBQMA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-ORIG-GUID: gHayH17iibmQoArOaD1DF_1BWfhTL0ZX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEzMyBTYWx0ZWRfXyrLBfpBpmIvg
 yA8LBExh8Wz1htI+TXfbPFaRcbOQVgP/d/mI/hpvDFikRbycPsMh8obrLnqkXT1i0L2crzhYjHz
 y4qLp+STSxGM3udVc/yf01MmylHZkmUsVKnoBDE6O12LYg2d+9FJMCy19CJCN4hu0JSUB52ynTv
 6Lvd9W9sww/oesX/z+cao92FIZIJ0MkUViKOoXmwVYJVNWAZF9UFkm83MBf/AAtnu19YOtwhI0c
 ULWuV+IdnBHpDM1IoBpNVozNa0UhxqrjFTsfzlLM1/7RCSfTSIBmfDzVAfsyAh93RnEtq85otKY
 vhtSs7lwafDKjS0WytTQ6UAZem/Ofwn1PGMLRSW3EfCW8mVD4ZR1alzSnSQ2/Gap20w+Njeyc1J
 U7Gk/fNiLf5nh230K2qYJQGx/5av/c7O3PMvtnDk55K8CFIvcvzVcWRoAiRKX8k/votD4N3/CRa
 UEvlVPMJK22t1yl8QrQ==
X-Proofpoint-GUID: gHayH17iibmQoArOaD1DF_1BWfhTL0ZX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEzMyBTYWx0ZWRfX6qSiHdZFHYUP
 Z90jUPkmh+l9HL4+mxw1nR73FadPFeWU0RE0nzI5kWVwnq8sMuaWH1q14t3dT5m3wje+sUFXs6I
 ajx+bFrgWsCGZ/wEPHLtvbnw9keHe1E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230133



On 22-07-2026 22:41, Rob Herring wrote:
> On Tue, Jul 14, 2026 at 10:46:34PM +0530, Shivendra Pratap wrote:
>> Add bindings to describe vendor-specific reboot modes. Values here
>> correspond to valid parameters to vendor-specific reset types in PSCI
>> SYSTEM_RESET2 call.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/arm/psci.yaml | 54 +++++++++++++++++++++++++
>>   1 file changed, 54 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
>> index 6e2e0c551841..11b90e8affb3 100644
>> --- a/Documentation/devicetree/bindings/arm/psci.yaml
>> +++ b/Documentation/devicetree/bindings/arm/psci.yaml
>> @@ -98,6 +98,37 @@ properties:
>>         [1] Kernel documentation - ARM idle states bindings
>>           Documentation/devicetree/bindings/cpu/idle-states.yaml
>>   
>> +  reboot-mode:
>> +    type: object
>> +    $ref: /schemas/power/reset/reboot-mode.yaml#
>> +    additionalProperties: false
>> +    properties:
>> +      # "mode-normal" is just SYSTEM_RESET
>> +      mode-normal: false
>> +    patternProperties:
>> +      "^mode-.*$":
> 
> Since your example violates naming rules:
> 
> "^mode-[a-z0-9]+$"
> 
>> +        minItems: 1
>> +        maxItems: 3
>> +        items:
>> +          - description: arg1 (vendor-specific SYSTEM_RESET2 reset_type)
>> +            minimum: 0x80000000
>> +          - description: arg2 (cookie_lo in 2-cell form, cookie_hi in 3-cell form)
>> +          - description: arg3 (cookie_lo in 3-cell form)
>> +        description: |
>> +          Describes a PSCI SYSTEM_RESET2 vendor-specific reset type. The string
>> +          after "mode-" maps a reboot mode to a vendor-specific reset.
>> +          A vendor-specific reset takes two arguments, a 32-bit reset_type and a
>> +          64-bit cookie. The arguments are encoded as up to three 32-bit cells.
>> +          Each mode property is encoded as mode-xxx = <arg1[, arg2[, arg3]]>,
>> +          where:
>> +          - arg1 is reset_type and must be >= 0x80000000.
>> +          - In 2-cell form, arg2 is lower 32 bits of cookie.
>> +          - In 3-cell form, arg2 is high 32 bits of cookie
>> +            and arg3 is low 32 bits of cookie.
>> +
>> +          All values should be provided as per the PSCI SYSTEM_RESET2
>> +          specification.
>> +
>>   patternProperties:
>>     "^power-domain-":
>>       $ref: /schemas/power/power-domain.yaml#
>> @@ -137,6 +168,15 @@ allOf:
>>         required:
>>           - cpu_off
>>           - cpu_on
>> +  - if:
>> +      not:
>> +        properties:
>> +          compatible:
>> +            contains:
>> +              const: arm,psci-1.0
>> +    then:
>> +      properties:
>> +        reboot-mode: false
>>   
>>   additionalProperties: false
>>   
>> @@ -260,4 +300,18 @@ examples:
>>           domain-idle-states = <&cluster_ret>, <&cluster_pwrdn>;
>>         };
>>       };
>> +
>> +  - |+
>> +
>> +    // Case 5: SYSTEM_RESET2 vendor resets
>> +    psci {
>> +      compatible = "arm,psci-1.0";
>> +      method = "smc";
>> +
>> +      reboot-mode {
>> +        mode-edl = <0x80000000 0x00000001>;
>> +        mode-bootloader = <0x80010001 0x00000002>;
>> +        mode-needscookie_64 = <0x80000000 0x00000001 0x00000002>;
> 
> Don't use '_' in property names. This is a W=2 warning.

sure thanks. Will fix this.

thanks,
Shivendra
