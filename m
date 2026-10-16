Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72858431E68
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 10:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146303; cv=none; b=u8zCTtl2uqsrKLro6TuJS0kLfhksDucFDkwgSTuRKXBGWwTchdLZSPPO8JtG/ZE0yGdmKss9J369DKyTqfxXTsPRW074T4QEyK0XrXdvu0VJ5RYwOk3tQDjc2+dCrFGw+q5B5fdGsZzb/XOBaSv8axLZOBQrcPIk1zxl2zC0Fys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146303; c=relaxed/simple;
	bh=i4Z1zdQOmksCm4c7UuNxZfLkKScOhca8kGgZ8QgQm30=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aTs4ZCY6WtL4Nt6HxBoxKhw81t3oMLc/imp3cp2zpG5keurEnZqxjcIJnb5sASMs5tT33PhjuIGs2p/bglrBHzsHF2pwK3tE6lBg8ttYFK2HJbc5O/AtTrZqME7iE5ls7Yh5a5NzhmcUB21p3jKtAY9Jkt91znbfGsBWdGj9prI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VecxJ3Sa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cElh8fgS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VecxJ3Sa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cElh8fgS"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAAXdt2403585
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 10:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kAlSZDNs3K6ft0MeWMellUDE8pbYaYQVgrb3o5m3fuU=; b=VecxJ3SalVX8847m
	gVJPDFKsO2vvc1aSyVNPYY5N9n5BLJoHtQ5Fh1QdYpKvV2qFQ5vFg8aaeB1HNXwJ
	FQp7l8bDbiAgaToofZdKHO5u0UvLmYpeGcHmRA+7UZwyQLNn8nAd2FUbhF2C4f4t
	Lc0yOeANHTcbRTlAZf2OGoWuC+3uX2aGu4e7DbW1w4jdNQGVfbwWOny4NRKzXi9Q
	dkWuGNGvpE9c2GdMChJmVhtDnjdG5tzjOOncCkUUU2btJS+yfHTK/NS1aCvEMCPi
	ASf8u0aq3xRavcaFKKy/k/513mbHbAAXdBu68Ral7zEvZwNWAehKI5+1RAuSsLxV
	6S18AQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19m3yyj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 10:25:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5362ce9df1eso1231251cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 03:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792146294; x=1792751094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kAlSZDNs3K6ft0MeWMellUDE8pbYaYQVgrb3o5m3fuU=;
        b=cElh8fgSXMDvUcK4z+wke/j9+w9tGJN0TadbTGKKvHxPsh9Al6dADRnNkot8lE9MYY
         MVjv7CS1qz9vCv9SpANpfo4Rce9OKInfUY+wwS9/iZQ5tjlpU4gd7a0eS42sfX6gce0m
         UlNTTbBK5r1J4h2Cf1QfbowlFDqvvlVulmCICvg+JcUwp6sj0XwDWVVSRzSwHCEb84QD
         3YBHXJ4vai/JfAOq1+c2akZk5xq6elrrq3GIXtzKB3csvVm3qYpUGMSvty0JhwaVwKAc
         Xyh6Fcyhk1H7uRgKIh1zXVFm4aXdo3vFJpGyGf1syWPANwOb1GsFGeW+iYdvglIgve1L
         ctWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146294; x=1792751094;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kAlSZDNs3K6ft0MeWMellUDE8pbYaYQVgrb3o5m3fuU=;
        b=LPXn0bwrjBmNxZEgF2IfkO7x82zyKmmlxQuZpScqi6/Ve2j8SIuxt8wYWzJjhkNNQG
         M/8jOJMSkXMDAijUz/tEJ7KRdxpbyeWdALQVs66tht4F33pyrMaDU++nULJcnWF4Indg
         CsT070HQfxwU8M8j6tne3z0KlXTy6/Lfo2yDC5YfFlpgtEDy7F1xxcJLK5TXV4kS+3XM
         t1jeVEKwIBlLe3qUk7YksYhDdlEhnF1sqVXUWL4aemmKch9JhDAcuGNebOxvTIe9+iuy
         GTtbX8tLg/vgPnH79dwIXaxnkDCuHe5l5Nq8KF67qnWiTX7DRcNxnXI4ufYQIANZ5l3s
         pklA==
X-Forwarded-Encrypted: i=1; AKwUvBz/D4jHAFhXxl6osUxK2Ji4EhKk7mnVvxDKycQqc+0FngLNGoQbmQ0kF8Id7gtpTFjx2RFnkLSH7QfJ2Lgh@vger.kernel.org
X-Gm-Message-State: AFq9FYKaQZHK9aCJ/EJysykyvHjqo1F7ErtciJlR3tppMo2WZnLQ6Q+c
	70a21uA1+ZXD1Nsm9IYasZS8mMwZRGq/vQvkEuP9wxYjGRa/Hz/jzDK60W/8hyf0FFfeWXdzIlD
	9GatTS6L0YmmsUl6Pzh0/eQXbH5Y1BfrcV7okzuj3QeR+LRqWDELz8eyZSTkBrwvnPyVA
X-Gm-Gg: AYBFou0perAyZx5CBu6iabYETnQ4yxQQxNhpYSpkMaHFAlWqd+KlD9xS4U3twZb6i3y
	MvbleVEs/zjoO1lvR6tqEjqsee8F5gmAweUssKPdmm3vubLjB6nd4KIiuWuw6VlmyEaTNTt8Dgi
	KWj7piR2zOyRnMIKqM4CeHOi/J+HQ9FdbNVgy3WwhRBdbHnN2QrNHi88I7t7nS1vvNDgjMOHU3/
	1VBV/23nTLX4ttJbN8Ef/zgHtTFpBd1Up9/XUtC33sJA7R+7j+kQP36on1FGrFB2R1svL/2Ogie
	ilXe/tBQbaxpQAOwdk75vHb4iJr+4VOZUtwCK6mZdTHUhZm/uFiKr/aNDHNzeqcuh43p8IWJP3r
	6LkeKXlRsZ+wBscJ15cm4fw==
X-Received: by 2002:a05:620a:2855:b0:939:8148:1e3d with SMTP id af79cd13be357-93ebd0d7987mr3686938585a.2.1792146294569;
        Fri, 16 Oct 2026 03:24:54 -0700 (PDT)
X-Received: by 2002:a05:620a:2855:b0:939:8148:1e3d with SMTP id af79cd13be357-93ebd0d7987mr3686935685a.2.1792146294032;
        Fri, 16 Oct 2026 03:24:54 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1c633asm749378a12.16.2026.10.16.03.24.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 03:24:53 -0700 (PDT)
Message-ID: <7cda0970-2ccb-41d1-985c-958bc9fb2a73@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 12:24:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: qcom: glymur: Set
 snps,resume-hs-terminations for USB controllers
To: Peter Chen <peter.chen@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016091336.2715717-1-peter.chen@oss.qualcomm.com>
 <f28d3582-37d5-4443-935b-615a7e194767@oss.qualcomm.com>
 <atHvDcClXC3smt5U@hu-petche-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <atHvDcClXC3smt5U@hu-petche-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aLdlOr9m c=1 sm=1 tr=0 ts=6ad1fb7c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=TzX8eDZg1TTv6Nxa36EA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: tnRKN2DQA79MxwScIPZWRDpuxozUnJrG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0MSBTYWx0ZWRfXyS1Muh9sB1tS
 OdU9+Sasebmj+o31unvjhSgSfsta1WmSJj3Xpz48nyTOWHIhWnCHdZjV1+bDi7cX0ha8ZXdxuui
 niPfEyoKpJQeqovZM+8qu2wmqXISLnU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0MSBTYWx0ZWRfX/TXVOGaWJdQx
 DrweC9/WJyWemcecvxzqq7RhhzlTCYuVqiJ3VHnmGZGEdW9iAKW5E3Bm/1H1CCPjl9+npobQJ35
 n+Fflzku+rUsUj4zMb0XsTA07yCEKOIStk+FWlGm1XlkY4T5zfG21og/XIJ+VXarKmf1wgXsOFh
 ie14JKgQF5bfWqUxpoIjW47/AeAwDvmQF6DJ2yaTkYlXL9z9BAaTbeZXNWV1vAnw0LlwZAB/MAS
 l5u+5R95eyF7ziPbajuz8Arw8O/f+BB2nL5Pbfyg+A8m74+u3q33+to8zKV13mINEm4ur/mPs6G
 K0koR/7a+masY87N4LJB2d1A6GDZVGUKUWiV7WduPbpFJhH7AVngp0SOj57Z0cq1gRXssvtryNj
 libOsp8Bbr6rvhEusQEHiW7zlyvgjT89Q+uvPbUea1TsFIvaX+7rAac8HcrkRPbTxlZsi8sLVZV
 2ihRze9PLkVHYjIicBw==
X-Proofpoint-GUID: tnRKN2DQA79MxwScIPZWRDpuxozUnJrG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160041

On 10/16/26 11:31 AM, Peter Chen wrote:
> On 26-10-16 11:24:05, Konrad Dybcio wrote:
>> On 10/16/26 11:13 AM, Peter Chen wrote:
>>> The DWC3 controllers on Glymur are paired with the M31 eUSB2 PHY.
>>> According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
>>> (RESUME_OPMODE_HS_HOST) must be set.
>>
>> $ rg -i m31-eusb2 arch -l
>> arch/arm64/boot/dts/qcom/glymur.dtsi
>> arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> arch/arm64/boot/dts/qcom/hawi.dtsi
>> arch/arm64/boot/dts/qcom/sm8750.dtsi
>>
>> Can you send a fixup for all of these?
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Sure, but I only have Glymur CRD, can't test this change on all hardware,
> is it okay?

The hardware programming guide says this is a necessity due to
the hw specifics. This is enough evidence - you can then ask some
of our colleagues who recently submitted support for these
SoCs to test it out.

Konrad
