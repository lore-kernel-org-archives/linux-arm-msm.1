Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE53368D4D
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 09:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788426989; cv=none; b=Ruvi1qlODoSvp/JwWSI+J84DlrruF7c2OCw2pD3G0BqZaKWUT9PYnlX97Le0XlJ9NwfDNuKf9UTyGD4V0uNu8iF0tAE/xLnsALNI07sDeDb3pVP1FyaV/ZuadJFP7pu9UUltAeu8I+ipZeMWafrypwXQ/RiNe8PRt5hCJ/U9B44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788426989; c=relaxed/simple;
	bh=EOzit4ePQalFdhj1u9LWkuxLUtPDhNk9uR8Y3CbHhOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tjNX3wphFxuWhDFKlbd/F3z7HeQkdfZMGQCweEKZuOEfnnZfP8p8BNAsB8UrDrOqhZvOr3aVxRCUIs0rwHE3xRzLXqKYC/dmo7ZYquuU0Pt1uhz0DQQKRfii05ueNitzc6Az7y/hTKp2e6CQV7F3Ol7gq6EHxhPyTPYeFaabwvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DX/VigvI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iZF1c6q+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DX/VigvI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iZF1c6q+"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683924YS043829
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 09:16:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s6CA3LvUMgf0CwPU1omfs/ySoc6PX9EgIo/ZHobgyq8=; b=DX/VigvIrJ1c3uQ2
	bVW6Hdoxjfca3hhtERWJ+reIwguqN1Pu4Tq9mdarPgjG65zPdknlUbo9vU+l5in5
	eZluYcfew1Dpo/MpwbbFS2YCGjbb/RePVyO20JKr8Olzr7OW7c3K9X9pjPPIn19Z
	7jnnhqkQZ/aMFyReQvRHWp8zJyeVYClI+IcVhBRYXwepM3dpmQB5QbA/cqy9aRHY
	dB8kScArQWj+pN0UbDyD9kyCp7zXgMpa5Qlxn15z8EQh8jEBs8Do0d1ev34Ds10o
	OcOXt8wIPllDcgbKFPG2vzJy7/QmaVBRcBdjzRzk5k+oXR7ihYI15YnUFXgL+Za8
	eKjd4w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1pyh57j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 09:16:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93494b1e35cso44784185a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 02:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788426985; x=1789031785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s6CA3LvUMgf0CwPU1omfs/ySoc6PX9EgIo/ZHobgyq8=;
        b=iZF1c6q+uPyPKIppdVfeaVaLnuGogfKTPmI0U4Sd9x9ifYztaAbKg/wZWyNqxbn3Jn
         arvzkgSLZmrmi1VdN7bV24bwx3awbWrjJ//XfuNMXzgCTFs9qRNFQAcSoV+eOuc6jf2g
         GYvl1Y94+wPvJkegoXhf8dj/rZarE/H3CrJZiq9wxmj2GBUe5dtjuucJBFtw5/vhSOgW
         NEK6T8qLaivIUtrykjm+mnUQ68IxRbDQX8Uv5MZjmu3IWxVbqcnmMgTjULdVEUl+maxy
         ZcFXBj43V+/wbRBtUl9goa/h5hYY+8QqcGtfxuO30L96FubIcJ+epSuVaX3JcWwHfGDk
         5+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788426985; x=1789031785;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s6CA3LvUMgf0CwPU1omfs/ySoc6PX9EgIo/ZHobgyq8=;
        b=tR0Lrebjon/UiXd/xBkYztGkUQz1AA5rz9Tua4GfDGKg8WczQtaxQZeZpA5FnOFtHb
         dxnHZlFKm+kZBtjJSkE7wRYx5TE5qiBtpdovJG7mrCPnj1j5zsZhF/RtfcVrkgaWzqDF
         +IWMbT/V7NWnbG0XrpInv4eclrUfuT0SK9Um24tGEZNyKD1rISfgr9rCF//ES2aj8POJ
         xMIct20BmpmYNBa6OJswFazN2jLwDTQ3ezI90GMU2ej8K22ZlV/CgiixpL3jBe20XqKw
         QG5d8X3DGPJuAzcgd6LVj/HZ3eJVMdrMRLKbAkXYRnSoS2UXJDAlpzyAxPJn+9+/x8xl
         C5lw==
X-Forwarded-Encrypted: i=1; AKwUvBwfyqqB3oqMrCYX3UyYg8D9ckoA8OZkFUdKOfGvLzKUbgvxolHjp4v0nGVCLLbrJELuMFPrJPtTCu/DEZ+Z@vger.kernel.org
X-Gm-Message-State: AFuF++kGml9RuBGH+zfGK5QDFg2Y9qt5EDNjZqWTc/bU240HTbB9ZeHv
	hzSGU8e2YcMsrRYfZyrCw1dxtZs42sTUin8jllV4oj8ojSt0DQ3VgMU9R7bf+q6UxmyD+jZsvQ7
	F0F+Iwpkp8A0AfzKYZAVUHYlJtm6/30fOgzMfG7y/9zmaZdbUw0QiwEbEDMt2xXfwN7W9
X-Gm-Gg: AYBFou20830Y828AflzoBsTS4z10LEhjOFOuGHDoNn13b48Q8r+iYmBYpHS4jUMxv23
	12Fb0kcIWt3YeodtRtvZSpEBhpeOpPdRxXBtc546PXkEVEgRLXVdUfzf1ME0mx3c7F/4p+9NF1n
	Tki1J5RUwQvV7LVIkafPYuMD3mrqwLlo4Hxn/G+pB2Kr8SMEMHOytMQ2tFFXYuKDm3dktmno5sr
	YmlSsTlYpJlws4LCKLoIJB1qttddNCP1elBNBIjJsPqHG7N9Pf6jxpmUaKTyx7ESfq+rtsqpsIe
	/x99+SJ7NGTgC6ZsQQUOsVSXirVeQH5fVtmbd2TmJDqfD0P2EqD0YBZis3uxC5J4Zn05HJPyAom
	vFMSNpaUmDHYDkW1FURffyg==
X-Received: by 2002:a05:620a:1729:b0:939:48c8:656 with SMTP id af79cd13be357-93960cc57ecmr824991885a.1.1788426985445;
        Thu, 03 Sep 2026 02:16:25 -0700 (PDT)
X-Received: by 2002:a05:620a:1729:b0:939:48c8:656 with SMTP id af79cd13be357-93960cc57ecmr824989485a.1.1788426984928;
        Thu, 03 Sep 2026 02:16:24 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f41ebab0sm71905466b.47.2026.09.03.02.16.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 02:16:24 -0700 (PDT)
Message-ID: <182336df-b505-4ae4-901f-e09c0eae80ed@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 11:16:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/16] arm64: dts: qcom: x1-crd: Mark the EC reset gpio
 as reserved
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett
 <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
 <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-1-f4ab7e4bb75d@oss.qualcomm.com>
 <3f26bf2d-19de-4cc3-8af2-c26601da2576@oss.qualcomm.com>
 <ygyu3t7o2p2xvm3j5wrxp4svzo2rzymvzgod2szhz4z57elc7a@hznrw2e35oen>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ygyu3t7o2p2xvm3j5wrxp4svzo2rzymvzgod2szhz4z57elc7a@hznrw2e35oen>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3OSBTYWx0ZWRfX7vNdXREzTO7q
 OJvQ4KkyBmJrdd6bsHkvCcprXUAZ3cp6OtvcYTy7k0sQH7+b2zOG9U+O+/xv25J0bXlaQwqDs7D
 wbPf1s44rPlOuuBthBs1LnXNVikA2jIBcUFCEoIpAqo4gRFViDR6YcV4fjIRrbXaEuV9qlwwVHZ
 qzpBwlx3/NZ8TQHp8SFw/Vs2sp8IEkeTTf2tGWGUP1dZe0peZRZq/5V8i5ajOyyfhWMvLWLSb2Q
 CiZg51huryK7iw50n0MvYlzxZZ3FE+/kh2GaCUuEfGYnLEWXHSaNYvVjB54JepX1UBdz+/SOV6Q
 7+fmu6YZSwcsM7YNEKuXKaUcnsTDTfG3nMSJlH+chAkyIe1LfHw6XN+aO8fVpLqQcMNvP2k6xcB
 pHfHJGFRMKlK0Qj8dBA1FogZDOhDN/ECMWHpqaNMPfCjIgCfHMGHGN13Qttpr4AZU++djbrXB8R
 W7LKTBhlJFr1VMx3/Mg==
X-Proofpoint-ORIG-GUID: rU5rUS6Hehvoa3CABjh0IMwnCD6L9AzL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3OSBTYWx0ZWRfX/PPncukN8NgC
 raEs5ZNfHEQhi154VUg5h39JKzCbRFKWezjNBInEsLL5dW8z+ge9BOtROOGdP/atkjyWDU0UfJy
 C/0NbklbfCHBqBmI++vBXbO1hPxYrHU=
X-Proofpoint-GUID: rU5rUS6Hehvoa3CABjh0IMwnCD6L9AzL
X-Authority-Analysis: v=2.4 cv=DMO/JSNb c=1 sm=1 tr=0 ts=6a993aea cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=QOIhewo_p7yaGBQ4SdoA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030079

On 9/3/26 10:34 AM, Abel Vesa wrote:
> On 26-09-02 17:53:23, Konrad Dybcio wrote:
>> On 9/1/26 10:06 AM, Abel Vesa wrote:
>>> GPIO 65 from TLMM is used by the embedded controller as its reset line.
>>>
>>> On some devices, toggling the embedded controller reset line makes the
>>> device not power up at all, unless the battery is unplugged.
>>
>> Have you confirmed that behavior on the CRD?
> 
> Toggling it does nothing observable.
> 
> However, the documentation says this GPIO is actually tied to EC reset.
> 
> I still think we should reserve it, just to be safe.
> 
> What do you think?

I believe that contradicts the reasoning you gave in the commit
message then..

Konrad
