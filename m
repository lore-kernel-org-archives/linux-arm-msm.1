Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792637555;
	b=DUai69CSaMTtcHbIjPzwRJhSvGRnblvk/mEDR5vjFpMQQYMJ0e4SBXssCwKR0/ux/OuK
	 RU8dIJidENNM6Xs1Q3efUphZbSfHIrb5ezC+AmysirzYV2C0PJfZjyq/dkmDQ3s/kgGeG
	 zTEG/GEXVY+tmvVK3QjKOVhQMpRAriP0JCRl1cVv/Ox5He4+ifV+mlq+HxF3uab8W2hjC
	 ytdKDLELy4PLyKmnzu2s1QzG44pkmj7x08tt9HLdXVg4KwvNRhoZCScDvbiIMiR8kNcSh
	 q95RDWlyKl72pEUkr9QcVsWocvmDqwZRBNCfCDyYMARb4R0v6K9WC6JGlIFA5cwc6ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792637555;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2KsmcwfPU0B4n9fvquhuv3nC0jKgk9A00OaniATuFj4=;
	b=iKzc5N9+T42loBE1gdSRVzBUHHCOZhceWU0fm6iMraWPqyUKgzTFkLSWpjVycC/Lqm5I
	 nLfRMfhcBJfOX6RQxjpLRHEf/n1YOCX1dnkpj/c3Fhy7WlzovLGa5xSJfbcL6xQWRyVds
	 5Q1qKXkrEO0abL9TLoyXrvlOqI/TEKPbi4oHebVkLSfKwI3OrJIe6XTs7hsAlcmzGZlEP
	 dBBgsZFsBEOMVnOENHw3a2xZtcb8C1x9NyePsyC4Fwehf8z/Pu/bekLqT2Ji4kI+Zm7VK
	 WpttKXRo0vzbyUzJ90ypf53f4GP2BsYU6qZ6qBLxl9sxqTrRP7GgsNPvxzFEGgc76XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k3KslQfo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ijlfmOWZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28A6606A31E
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:52:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E28A6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k3KslQfo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ijlfmOWZ
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M1iYIr1303456
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2KsmcwfPU0B4n9fvquhuv3nC0jKgk9A00OaniATuFj4=; b=k3KslQfokLDwp3Uh
	M2ghKmiRaCWGXWwVVbF3171UCszgjCjlTY0vowF5YxiThjqY3g8YrSjOhS2TLUmh
	tkA5l9Jvx665feuuKW7ulrw8XszqJgqCCPex57j6G9/QMBa0bVlignmCB7uj4S/s
	C+q77C8qQ63c81OD0D8ArlNf+D2kzPKB9T+7dVug3tlboz1JRT9LhbR01wI26kVY
	NRACKVC3xICyE1pD0vNi0GAcrQdGnHloQyP39SFTmRUKpTHryNVMWoradEAwhCgW
	qrH7FwIqoZpSRFMxSND4y68oYxNBJJ+ifTjI0tNeHR1rAj+L6PobGmEQd/62m0Ux
	REjCTQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93brbm7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:52:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac450b74b0so2426577a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 19:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792637553; x=1793242353; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2KsmcwfPU0B4n9fvquhuv3nC0jKgk9A00OaniATuFj4=;
        b=ijlfmOWZ0rwduIpE9l6SWhqeeRKlWRp+XmkaZyHRCm7e2/SehBAlosjKPvWMAS5n/f
         EdXxlbU2i/zSxRE0zpp48JhzxIdUOt+b6fEC6vnx2tEMhsfvEvLS5Xhy4IFwhp5Uc9HB
         WLq+HCrwUxJy6S7BnMPSCeRSEsbXdaycOnrUAvxKZy/j7ll6csGYFbZyagRjBQcQw9ER
         YVdY9XMhu5CaCRqAAh0QEHdPHe4Jtp/l3Dwp9ZFIM0QRJLssqR1c5Z/WtyIUsmN8yqzV
         T+V1yxG3EHfv2HydshelC8Dr40NhWJgJzkcb31dr5mIsPL0rp1Vt8T7pu3DCn3Xl30+/
         v1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792637553; x=1793242353;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2KsmcwfPU0B4n9fvquhuv3nC0jKgk9A00OaniATuFj4=;
        b=MBVAEhwxJwEys5JJVqTtAHnMn23cPhmIXYPj1QWsZls6dsh4u8bivlzOEZ4n36EguV
         3RHnk5tCxs/Op8jtSFqSAcCd/35XGGw9Un8SS7A6ReI16wmFmimI+eRrHszVqPEm/a8N
         1DRF1xf7XuUhSSGEFypCNQtsOOol6U9CkpFNgPFkAvEW3e0ceQQI6ntt/02RYAPoE1I2
         xbKTPE1IVExnDni0cTAmv7GKEQUHY/4OBNvduQwN3r1AgNlb1vuU/ST2yh47JDX6q+If
         9Zf9rZzOM1GSO6/5/mdk4B4B7rhnv8dHDm4TKmsNWZPQPWg/jqzr5HY/fJedo8Jokyh2
         a6Iw==
X-Forwarded-Encrypted: i=1; AKwUvBzH75vcSwVZ/UHXr1hrAOgaWgpFQylmnpxLVvrWcCu42qcEW3aCSqg5Jw9xLpuAQh5DUcT3jhZDK+UYvRXs@vger.kernel.org
X-Gm-Message-State: AFq9FYL/IQ97PA0Qmdfc2acNumI/iht2fzP4lmvfneC6T7xauAMtb7zj
	V7Gyqet/014qiwRwq2+c8/DIS2ZfQ7Exmh31jq5Myyx9SgjnDj2JkaTKxG8RP2O8AJUK+kjo0h2
	wqOO7ltOw0fxvi6DTd59z8Qw7dTodLIRIodM7DrWNm2lsW4dNnUA2Y76Nc3MNL/FKID6D
X-Gm-Gg: AYBFou32FpxWe8kxqlofJLB4TaQ35ENfRj0xhmOa3r712mbQxnSMMBmuXAZJBr4ZoGN
	jKYyhN2PzxHtr22U3vn3LayQsx7melBUXWgMnDQWEjhQAbEHxDMLbHIWiU7ZjF0W5fWrIuWdDYG
	9nTYsXjXIomism9Np8WR2Edj+SpviYNFIhV9uJj61Tjh0egRHQIywOb7ErqJ5kbXi51lnPRUwxd
	HWhTpgZnjWaNPBEp+awoeEUFXiy/vgWYNtrmWHorGm1IKH/9BiikxxMA7HB/0pLvv8Hr3JjRifO
	8eOjEsRts353wfFJ+fSF68bEdKsXwLx1ychKwlkmi1JHyBHQZqSF9LHl1/ONFl5DE7wH7CUHBZQ
	qci7/Qth+CCIJ5BcX7T42JcMcpbD974g3DMFDd4baGQxX/r9Vx61blPQtYvPE
X-Received: by 2002:a17:90b:2e42:b0:3a6:f1d2:57f8 with SMTP id 98e67ed59e1d1-3ad86afbdeemr2985670a91.2.1792637552786;
        Wed, 21 Oct 2026 19:52:32 -0700 (PDT)
X-Received: by 2002:a17:90b:2e42:b0:3a6:f1d2:57f8 with SMTP id 98e67ed59e1d1-3ad86afbdeemr2985630a91.2.1792637552158;
        Wed, 21 Oct 2026 19:52:32 -0700 (PDT)
Received: from [10.239.96.176] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4890c56sm2048165a91.2.2026.10.21.19.52.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 19:52:31 -0700 (PDT)
Message-ID: <a661cd2c-debd-4444-ac38-531df07637d1@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:52:25 +0800
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
Subject: Re: [PATCH v21 14/14] arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5:
 Add DT overlay
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
 <20261011-kaanapali-camss-v21-14-04fd28d815c6@oss.qualcomm.com>
 <92bb95d5-946e-4169-8382-487ed9ed2254@oss.qualcomm.com>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <92bb95d5-946e-4169-8382-487ed9ed2254@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5f3utQI6btzLmgIdNfjKgOYBMDrHuehF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAxMSBTYWx0ZWRfX1HISOdxtt5XA
 IX6v91HywTBQvdiIWLy88rO76QBskMkGQm5HpV4qZuldyktwL5vi7QBrvvvcD0Pi6MvfsVjWVuD
 R7n74W/fPifF3tjtbdZGWxOAKmpbW8Y=
X-Authority-Analysis: v=2.4 cv=F4fC5ahN c=1 sm=1 tr=0 ts=6ad97a71 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-Nk8vmC4l4_uGId51r4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 5f3utQI6btzLmgIdNfjKgOYBMDrHuehF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAxMSBTYWx0ZWRfXyYxAkc631swu
 JS7NvpSeSZ2tJEBZ9WyLBtyWyidGQiC9OunIbmEdd1FOoeKfJpFNT2TF8yIXPpieHoqE/BS449A
 U4+lD1DvIvdsit4vDJF0byXMsUyzcZmoEncst3f4n7z8GqjQNnMTQqo2SE4hIw+JMHZXkjD+lhb
 v80dR0Zj4sITTwjn/zK6oB+biapFg+BXbgTvHGrANudEIE8k/Kg9VsBYJeKvLXvmlbIJVMkuviI
 CxRwmFMuYqvSxcozcmPvjJ1dh7chWfx5Frp4Mt0SjPoeE6eWV4q5FSSylwFEBcZmF34pduBaiHS
 WcGnAzbKPcZngnHVvNHwys3HwA7E2xrL1XcXB7P6ztlwCGk0EJBAjvx84A/Zrn3B8ict66U2Lbt
 6C5CHguy7lb9qkjXfrZL/L0m6M0/TJGISedZ4hvjuBTDTKk2yA/lEgVy/OgimUFlUuNtLdxVM/9
 QgHRQVBvq7J5R/HO2FA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220011

On 10/21/2026 10:02 PM, Konrad Dybcio wrote:
> On 10/12/26 8:45 AM, Hangxiang Ma wrote:
>> Enable the S5KJN5 image sensor via CCI on Kaanapali MTP board.
>>
>> The Kaanapali MTP board connect S5KJN5 with QUP I2C bus by default. This
>> DTBO enables S5KJN5 on CCI-0 interface connected to the CSIPHY2 in four
>> lane mode on a rework camera module.
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +&camss_csiphy2_in_port {
>> +	camss_csiphy2_inep: endpoint {
>> +		data-lanes = <1 2 3 4>;
>> +		remote-endpoint = <&csiphy2_out_ep>;
>> +	};
>> +};
> 
> Please define the endpoint in the SoC DTSI like the glymur submission:
> 
> https://lore.kernel.org/linux-arm-msm/b5734dac-1285-452b-8107-9164e6a3e5fa@oss.qualcomm.com/T/#m55a2d04f3fe573dbbc86fe89a874514494eca345
> 
> [...]
> 
> 
>> +&csiphy2_in_port {
>> +	csiphy2_in_ep: endpoint {
>> +		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
>> +		clock-lanes = <0>;
>> +		data-lanes = <1 2 3 4>;
>> +		remote-endpoint = <&s5kjn5_out_ep>;
>> +	};
>> +};
>> +
>> +&csiphy2_out_port {
>> +	csiphy2_out_ep: endpoint {
>> +		remote-endpoint = <&camss_csiphy2_inep>;
>> +	};
>> +};
> 
> likewise for these two
> 
> With that:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

Ack

---
Best Regards,
Hangxiang
