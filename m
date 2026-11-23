Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446910;
	b=OyngrfZlRvdwRzWN09PdRe4ubBLKsQZDSw7SA2TB7DoKmEruULB6wkBrpmwDJdUoIaOi
	 /gsQtGybAI6DNPHZiqdjOo1rPrTj4AHSKTNPc12IVhwzyy1qil4Np4TT6OMDM1DrtS29g
	 3C+dEIgEBW1Zg0YZeby4YFRv6+UhnaGcr/9hLdPEcJHuxjA7jUs2NvW2+Xcj3VoMwElbR
	 HlbLQzaau8eeW9ogMdg/SAka9R6Jc4pfmOHgkClLhUAZ9DCwXpqckuU3BrN6A7pbdUu18
	 QDIt4VqGTjDP6B9d4hYsmCqx+UL1ENMlg4B3P8ssjj5HYbYlTRTOzp/qc890uviXvjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446910;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=u4KX29UbNtj6ASBaygB90RKi0FmH120qIk8XcUyZC7E=;
	b=cqh53R6gmreI6vn3ktPwpWayObnvNZV3c8EATm5yFARdJn9NlBNiVCf4bUjyOdO1EktO
	 PS4fATJ/el8S+RkaOfP5GS9EjcH49YZM8SK3ZlN5BDwVPhkf0s3QwKdY+/SY3zAcBLZr9
	 HVwlzgRn6oITPaRQX2MhgeIklAaGfAIOiDIDQciEiGErw5P7ZJfdg2NVMLw7wnZnEpmSq
	 iYZ9sFijwFg1GjwhsDt6NWFp2nfEkyiCgd2Bn7fxgsuvfJ4uhnNBhe54TMwgrPBiw5MuS
	 Ci4kWIVA6JORzG/pcCwT8J2nfbVc5rF7nnFrsx0n4JdGiM+LHBlp+KygNjGhn6bJ82w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pAo667L5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QAOhEV1G;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9954606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:15:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9954606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pAo667L5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QAOhEV1G
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKwFZ693985
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:15:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u4KX29UbNtj6ASBaygB90RKi0FmH120qIk8XcUyZC7E=; b=pAo667L5bJFkWDs6
	dKLzFgchML5SuSMJY31N5nvNMj5C/B9Q19iHRxCBYud0s2acOOeLrEQ9eK++2zwa
	kAo9JxjaI53XAqrXhIRsj/90v+XBUMr2G8u5F2YoccLjvLQ/aziJnQ1+w649wfm+
	GmlZdcPmYldJk2dH9Mz+BHLYyna4e+UsGVQbLLieep1p9qGKmo762HZkmyJhazQT
	PVHqS50Jcotr8U5vfXrLupsNjClEi7EJg0su5I82m0ImqZps9e6PBtsN54XQnl1B
	1tnyDIRuG73cY3rn2j2/5ZAw2GbalHO1Cws3I1NptJ6TfEk0q/TbXbCtI6siX9H2
	QQyH7g==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0rx41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:15:09 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-46788f14fe6so1398870fac.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 07:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795446908; x=1796051708; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u4KX29UbNtj6ASBaygB90RKi0FmH120qIk8XcUyZC7E=;
        b=QAOhEV1G2DEtJgzpv7LpmABcfQ+PMIhA+dk+MgENTWgHKdO75z2XQtxfHExT+RXGJ/
         NfcNRrVPcF2mWT/4dVA5fmEbezJD5HjUDz2Wk6HkRhGUJZURkSLsD7WOwD5jTZbRO/Hu
         +yOK4/AMaJwp0Y3LfcpWW5xBHfnVUNvh9DIr/9pq9KLY3IUY3Ty1N6oH2Drt2mXUbhRo
         HqBtK1rXmimNImrN+ffDPGsVtWWTbWiUo26z03OEQlRjZHmJi5F09tIf5g28vcSwEUoa
         3mVCF3eJv7zVwZQOqwlXlKExMI4QSIulnSnqy4XipqpxlcoiLBaDD7LxYBwASfHvsJ/j
         VFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446908; x=1796051708;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u4KX29UbNtj6ASBaygB90RKi0FmH120qIk8XcUyZC7E=;
        b=e+s6u/8HeDq3FWkHA4en1Y0D3ZDcFPwSLL08LmkrxHlvqLxXFAXjDZvbo7wk8hHNaw
         Fag1Qut1rcGPfq0rYWvW24SivotzztKnd7PQXrBSbPHlKNGJrCBeLvnLhJUCMpCggyZm
         /5UMHCnit6861Roe9UJA8Mkhug4PKQOtyiqCrYyJxQRhRYS/8vyJOSG5fEf6PLHGE/5q
         zUNakxdWevnebmxdZX0UjzkEVCZEbfCmp6LhXhEY+g8Z8Tdp2LlnNHOnFfXMEg0nwJZs
         sbjHuVBP5D87MJzY4hdw18mVmOgiyBv7bIzay2vzyVWeFBzKNPN0qj6BRGQZlJYK5kIh
         nM8g==
X-Gm-Message-State: APuU4Z+UgmuyPAo4R0J5gosF2i7tTt/03UpAV8rdcZZH0MbaF+n5fhzC
	4A7v448RgOzTb9q4WCF1LQhASZkJ7sHXGdy2mWCSWX8BYDMw5BkTlPJ21Ty+n8jXkutH25UfdvY
	wjB+WKqVFvPeZaytGag9yhSbmGcHTBhYc9ZBnkfswCPO1jNQpkJGXiOOHrefEMIH/RqiB
X-Gm-Gg: AZFdTZdzSQ3j7eR9fOvJB4saMC9EuYQ36Hwz+/fvVOqCZrXZxvRgNM/VG7Sx5O0uC9L
	9zPOT+5n4shf8a7llHSu6i05OE5QSsi9hKRzSBL41x9gHOSK4vFXMR5nsUwrHvMMLUM/Nr/+a9P
	IkR5cCRpvEaWXBtUZcmckOw8/VK+SdLsuHZgd0e/7kRIv0R766wIw/1ZVDJcz7eQT8b/Yhdh73K
	bnokWR9D8zJabhZOFkTcNGPa4HdW9FIsIWqbzWrZktF6S7OutpiMZ/pz0venRa6D6CkTOmB88A2
	/m3d/z52fETzLP1XuSY5nuSThkYF5kDnpWrR+RinBtqcz5hizevFaM3JGyktlo3dKQdXvo0P8Lm
	ce1MBymSDW7XdzmMfCJ8Lsj6QHrdWVCDSvNZ1p+0xQ054PObuto+lI7do9OW14vHZMAuApHk=
X-Received: by 2002:a05:6808:251a:b0:574:6f37:672a with SMTP id 5614622812f47-57a094feda1mr17350804b6e.4.1795446908242;
        Mon, 23 Nov 2026 07:15:08 -0800 (PST)
X-Received: by 2002:a05:6808:251a:b0:574:6f37:672a with SMTP id 5614622812f47-57a094feda1mr17350742b6e.4.1795446907772;
        Mon, 23 Nov 2026 07:15:07 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba37109b55sm5294415a12.32.2026.11.23.07.15.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:15:06 -0800 (PST)
Message-ID: <278b370d-7ffe-4247-9a58-8bfa5b7e0171@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:15:02 +0100
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
Subject: Re: [PATCH 1/4] pinctrl: qcom: Consistently restrict MSM8917 to ARM64
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20261122-b4-qcom-kconfig-unify-pinctrl-v1-0-f0068f161636@oss.qualcomm.com>
 <20261122-b4-qcom-kconfig-unify-pinctrl-v1-1-f0068f161636@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261122-b4-qcom-kconfig-unify-pinctrl-v1-1-f0068f161636@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kMSMTcfYmnXxsgmt2l8AKlImE6zDcgye
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MCBTYWx0ZWRfX79MRmxVGEzjM
 4G7rWN1eX94li4ydbA7KWVlhsPIFE+DSQ3qIcbdJz2Nf8AvECqBUKpbdp0tUakYvN6eRTN9xkGY
 L9hJRMbpLGHzWOpgc6QmnyVXR+Iu+pw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MCBTYWx0ZWRfX5GEvjP0xC9jH
 Cu80n1xVOaQCp0GVg9wqL7/GHHjYvMLMd10+Z15BLdI7vgQb5A8NmSzbgvAG4uUXCb3dhFKd61N
 oOwI2Ing2/RRSH1kBPO0xtPrA86bQk0PUZaG3651BIyphOgy/5w0uDBZDRKcvFLKTDrTwEKc43L
 3Oyeq/kuxs+27mfPkyvBHxGv0aoXeDLr0lqOEMWyH3yIT0ewKzaiTNkOycR3kqoVK8LhKk34A8Z
 DxzkKPhB9iVw56c7gCvX6x60/nQooi1ulgRVDBxSSoRbe+7/9E9c1o+0GyOlZDAG3Wweaz8sEXF
 rtj4+yr5hYNopa45kcQBh691SUuPMkE8YN+1V6cYWmuk43WPb5spUfoTBzF7ynKR5fDFmjr4g+g
 i4BAoeNVxU6nTDJDCubUx8fsUagm883kcOmxVuVfSSvcy9qIwmyVmxtbnnFMnPhQ+fMSOqvKI/3
 s8odK5JmOWqjPrgzCTg==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b04587d cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=-hlHpN5XGj_yJvU-tI8A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-ORIG-GUID: kMSMTcfYmnXxsgmt2l8AKlImE6zDcgye
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230060

On 11/22/26 2:34 PM, Krzysztof Kozlowski wrote:
> Clock drivers for MSM8917 are restricted to ARM64 and there is only
> ARM64 DTS, thus consistently handle also its pin controller driver.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
