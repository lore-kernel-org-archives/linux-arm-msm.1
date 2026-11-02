Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617586;
	b=2xTNB5qWoVqwLKZLG9/8Eqt9+caI6F9NJ8fCYZBTL2Gu8aIu6QdRIEPljKfDaij0lKVj
	 g5myZyeBsPCzjsau1M3rVGuoxQkq6HItxjZ430t4jP+4mYb+PO7gUbPp38mDw1UfkQyiG
	 2wRksHJQBSdzKQ2Z/9ZOkc+qX+QmMJdi6xiyL1nRfrRvP3RGqZ1etEH5zUY1XtFuUlXzc
	 CLqTGtvmH4b6XKiDzR7fGNbcQO/WzvZWcQmI/Ds3Y4hSag58zDf4+ZV7ZcIs28r4n6B3e
	 whhmJ0mOk0URfCpqfQiRGSaiZdmhKT9wt6T0JD+nQyKWmKUu6ODeXvGD/lMd5Np8IkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617586;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8VexOwUS4nB1TRVAfE4qKBfboYevUooTSYEch1IVOQw=;
	b=bmLQkAQEA1dyHZE5OgKNzQxHqgl4iUV+mdFplEw5xMn3EPNZ2qIZbQFpOhMG3FJ97rBR
	 za1Xa7LKoFBn4q87KMTNs69Tk4ogyvRk1iG4Wnu5gJ1R9sgEZi539gHKFmsUfR1hTjWj3
	 pl4MLqxF53gDn+gPPzsx6cV2JyJbBsX5ugLRLWXWxVi/0p0ZkxHrbpf+IHSPEZBsfVGEW
	 f03BLjXc0WfydMH6BGlO3/Uu7PLQ9NzkUCIRRMn+ssmVu+CEm40lz/bTaqMBPmw0a2L6K
	 Ov/itA1/Cor7ILuC1whueLBbapUtG7dtysZr6Xkm4o/EKYjJS+EYEnd9JzFLylG53RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K4P9gBfN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jRjgPt6p;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3ACF606A329
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 11:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3ACF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K4P9gBfN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jRjgPt6p
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AO7n3086537
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 11:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8VexOwUS4nB1TRVAfE4qKBfboYevUooTSYEch1IVOQw=; b=K4P9gBfNFfYhga8t
	CbQutxvofJsoWF/CvkeWYKvREfH5CcZEasccFLS3yOtqf+/MKUyPQpEO/osDuM0z
	YjyAwJ1nfay16y63LbsIRRkRwjVZ8BPi3qcBiMBSjtPSObrx9Tg3Kyt/a1+4Kw56
	pI/Zafkf7QTAdF/Hl1gyjq8/k84nwQtA6Jb8xgNC4bSsw1CohiQNdtWzKxDXGd6U
	3BQN+0oOiS0EmZNNlEVPPvoXIrFcB8jVcGaVfpwpHQEdTlTxp6NA0FvTQUB2mQBR
	lXWq2GuoXtCjxJpDlpO06hCPYzv0eI36aWpuWzTC9vJe3yjhjQEzY758piT6ZWhi
	ebFttg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka61fvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 11:06:24 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a05bfa6af5so2069128b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 03:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793617584; x=1794222384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8VexOwUS4nB1TRVAfE4qKBfboYevUooTSYEch1IVOQw=;
        b=jRjgPt6pB4eBnJAZXlx9mc4PoNxxDz1IgOz4jYn3fn6GZXPFRFD4XgFNEYcfArbqzj
         LysWdyz2TmhxmW5j2qO0f4o6ts3sr6w0C/+f80cBAQiKHUE69p5TXqb4WV4Cx8RooAz0
         TzfeCOR5XYmw2YtCyTBqe8lGGbFpBj13bMtKZJ2+hNKwoENiuK0d3qsJBUYSwn0qMXBX
         TClWnz9/6UIOlynYl/LD5s9smJzTclslYQxAqjqBlsDvtLKXDwem+X8PUXWtozMoweZX
         2b2PGSsI5l0uDjrRt4R03Y+x2OEBMx6K4pG5kuj88xPlFGJNGaWjCtCSiQTiw+nPno2Y
         SStQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793617584; x=1794222384;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8VexOwUS4nB1TRVAfE4qKBfboYevUooTSYEch1IVOQw=;
        b=dHKfNVnQM4b2ojrQJyyvoBwwmoDbRndM0eHivvcPCdGiFzMwJu63MILXA8sOKdhP9l
         6qPSOeQQYdM+bEAVDaLbdh3kEdQa9IPoAkcZdxOBRAUazYnWJAYVP4O8SeG7+lGRegOs
         Nc36hjuta/Wvlw4OKTUXqW1hKXUcDwUslRzssyUYtV4z5UAokmbpBCPmfV12GD5Q7oAj
         evxXesymUl908OWfSnWxNUgp/VwRMpW9wPwUOZODXOgSP79qC+Z/lVTk6mTl0MU7yX9C
         zkywYg7tuiJzXUFiU0jv2sYmgm5A1d2T8qwbOc+g+zXC+R5W1CV5myWoONKIO1cHR6MB
         GiqQ==
X-Gm-Message-State: APuU4Z8dTVq+qjyYSblzagQm6hIsr5i6x7OQfMw/QeA7BWsX5aa48JgH
	Bj70O1LkQBj1MYDdFYHt61B3K53EZ7W36klt+Nhwnuxhx2Sxuc5l826C+devodQqa6ZC9ioqKU6
	KDhtsK+YFR6Nlmqk1PUdpoJ5YsIWXb4oIEHxsbK3/H2tWRGw2SUzRx1z8q4DYQ0sYUVXXABecJp
	jb
X-Gm-Gg: AYBFou3Gi+DwUsPxDf0WT7Rbh8jbbMUxt/IMcNYAFMHUNFQKevhR36jSRASzXdiTMZs
	foWLwFf4E299n9jlvc01+OwJFBlF6Y5bcOrNYNkfxOkbS7mXMeITX+c/zq1inp56VYRf5IMBMVd
	YjNVZRglUveRsSp6wXI6ksNoFFBpjbs874XQH6Fw+Wfjj3tT188R3g9SQk3QfrdNBrcDSrkri/O
	lhUskcSRoBDEDEvH8sqBnd+HiRA1YiwbwAYnQBGOqn837ZXPFC01+IFKAS8a4hwQVDt069UZqqO
	pO2z/OsxYs9OTBd5GLj71RIwzRLMwnANTpg+L0znpldDsB1Vc5MaLyiG0I2n4en2VrP7BJF97Ra
	9sOKSLtT4Vqq/7RjK4DYkTo0fckTyTF8AWex5emhAuK9UUM8LmddFwhn4WKBWkUpmFZQrzxgSMR
	KIFtNpMA==
X-Received: by 2002:a05:6a00:2d87:b0:886:281c:98dd with SMTP id d2e1a72fcca58-8a9beb61305mr7142668b3a.26.1793617583572;
        Mon, 02 Nov 2026 03:06:23 -0800 (PST)
X-Received: by 2002:a05:6a00:2d87:b0:886:281c:98dd with SMTP id d2e1a72fcca58-8a9beb61305mr7142622b3a.26.1793617583012;
        Mon, 02 Nov 2026 03:06:23 -0800 (PST)
Received: from [10.218.27.184] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad963cf90sm1795605b3a.16.2026.11.02.03.06.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:06:22 -0800 (PST)
Message-ID: <c3de7659-726c-4fbe-989e-148bcd13bc49@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:36:16 +0530
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
Subject: Re: [PATCH 3/3] arm64: dts: qcom: glymur: Add EC thermal zones
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260928-ec_thermistor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com>
 <20260928-ec_thermistor_support-v1-3-d9c1bae4cd0d@oss.qualcomm.com>
 <e77c0255-6299-4718-aaa6-04f4366fe749@oss.qualcomm.com>
 <5d84ee1b-a765-4d6c-ab01-ca1a06a0e3d0@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <5d84ee1b-a765-4d6c-ab01-ca1a06a0e3d0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: hlri01Gm1KWM0LjZE2mshAmwnO_KOt2v
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfXzO/eOzislwjL
 pbaKYm4jBCLbMM43ECw+KVke8F0zAzuDL0bNeFGj3h2TaaHyc8wnKeDpCHrT0sFCnev2Kp/DGDs
 VBn4WrRxAfG2zmnaXUADXXgFx5eDrwo=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae86eb0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=7-sR13JiO9-Nskhq_G0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfXytkeBuKUGQ4+
 OtS8B2fHyCeF9rhM895pfKf8+2Xam07rF0j5FsyB4lQpPQBQGxR+MmmMh04qlxw2qRQH9npC/8n
 uKgIPHd65Hwkttnt3Dsi1+4WfGUoPwQRWYdYU9sbS0n3uBVNOWNxgChHnyM6RrPnl5WHgzHek2A
 h9CdUamt2VVekNAJxvkhmoSBFgoMUnMuwflhtTjF1Z+lv60i5vDSxTpbuxcLnWhQqY02X+1gB/d
 yi5gJPL8ufoY1urKl52Qmt1vUASSa8OrdE0SW/VUvVplTjjfY8V0kxTE89wqa3f0ygiAabyfv5p
 KJF1azxugQ2fl2kwaoPTxyO797Tz/scb1QcDbowZAd/Q8CMVUl236vbiZru8w7yxcsWK1LCrBN1
 aT//wbQmXsn7qH42YDVSOIJqd1ldz+JeAHD9ptPENeEguVm81XNqLcVO4w3ZN8NpCjDp85PpMBf
 vNVCCreuo5/YE6WnFbw==
X-Proofpoint-GUID: hlri01Gm1KWM0LjZE2mshAmwnO_KOt2v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020044

Hi Konrad,

On 10/29/2026 2:38 PM, Anvesh Jain P wrote:
> 
> 
> On 10/20/2026 1:33 PM, Konrad Dybcio wrote:
>>> Add support for back cover, keyboard, and SoC thermal zones through
>>> temperature sensors hosted on the EC for Glymur and Mahua CRDs.
>>>
>>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 45 +++++++++++++++++++++++++++++++-
>>>   1 file changed, 44 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>>> index e27c697e3170..571c98124a40 100644
>>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>>> @@ -594,10 +594,12 @@ &i2c9 {
>>>   
>>>   	status = "okay";
>>>   
>>> -	embedded-controller@76 {
>>> +	ec: embedded-controller@76 {
>> "ec" is a super short label, perhaps let's spell out
>> embedded_controller
>>
> 
> Thanks for you review, I will rename the label to embedded_controller.
>> [...]
>>
>>> +&thermal_zones {
>>> +	ec-back-cover {
>>> +		polling-delay = <10000>;
>>> +		thermal-sensors = <&ec 2>;
>>> +
>>> +		trips {
>>> +			trip-point0 {
>>> +				temperature = <90000>;
>> This is *really* hot!
>>
> 
> The 90°C trip value was suggested by thermal team(Manaf Meethalavalappu
> Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>). We are open to using a
> lower value if this is too high for the keyboard and back-cover sensors.

These sensors are intended to be controlled primarily from userspace by 
the thermal governor in thermald, through the powercap sysfs interface 
[1]. We do not plan to add cooling bindings for these thermal zones.

Based on discussions with the tuning team, we agreed on a hot-trip 
threshold of 90°C for these sensors.

[1] 
https://github.com/intel/thermal_daemon/pull/614/commits/7f3dd62353e039957e52eeb40c67ec388d543ebe

Thanks,
Manaf

>>> +				hysteresis = <5000>;
>>> +				type = "hot";
>>> +			};
>>> +		};
>>> +	};
>>> +
>>> +	ec-keyboard {
>>> +		polling-delay = <10000>;
>>> +		thermal-sensors = <&ec 1>;
>>> +
>>> +		trips {
>>> +			trip-point0 {
>>> +				temperature = <90000>;
>> Likewise
>>
>> Konrad
> 

