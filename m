Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E8B389107
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 09:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427535; cv=none; b=rYDOOAqHU1l5eWMwkcqeYMiE1AjkMzPD3QR3sk0Hvj87OIUyUdCkWWT7PB1vaNdmIRuMF3NVwncMISNY2qmU9rgJdh/tfOiaqwnmt4dWIYimZPgWW6BshAT4+XP0FvuAY1xDJiYEKsAMkHB/wvDkvkVXviF44bwQPYldZCqR6KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427535; c=relaxed/simple;
	bh=YEomMeML2cE+49xMRE46FgrabDDRLugR6xWa+LCEczI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SxJYv6TjOxZ8UlP3OQGeW343aHQMyErgkYOFjFedNc+RlG4Wl+bJMrsIM1HImgKm4Dd3ctL2X6kmhRtivF7AAWg1H1yMUMrtd/Zgjx/pQecB+Zh3lr0EXTR6cjjhFKVtjhzhXPyaMiy0y5BHqArq6MRnFs1KxA+K3NwRPncPod8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jdmFbiPk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cLltE5SQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jdmFbiPk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cLltE5SQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683923bo3035540
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 09:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h4AL3I1iVTY1lcvS7u5/OIzDF2L/Odk7CNpIPaVSYCQ=; b=jdmFbiPkU0C6fvJQ
	d323nGO3iMaryCOi6qYJW+nT90TlGpztKsy5xbJlaEkIS8K9YLVJQtPYa7d6eE55
	L5yRZIl7HVqpX48QOk6VP96x05V2RxpoOwhuN1JYtOmUjWCmd2wFlv+bRbHSaDZL
	eXT4KCbtJgus9lfAHUVqsTBNmIZOna5J8XSImd9s+J7LOx1/kQidCERLNq+LInrd
	EVEZf67NFvxNn/A8Hl9ccxS6fTg0QDu4r2McZfFCPEXpv4jAbuW9gAf/wQ1/rgqC
	ZBQFGo1q6GSF95VFjQgxb3M4ZPhMRBFrCspFMIuYmZmB1THbFLS+6FuzgGcRYVA9
	HL/X6Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5d107t3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 09:25:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9310484c005so42977285a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 02:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788427531; x=1789032331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h4AL3I1iVTY1lcvS7u5/OIzDF2L/Odk7CNpIPaVSYCQ=;
        b=cLltE5SQe8aDL21Wx6dupuM27DoGW+4rqvvLcvCxnHfT4LTXpl5Z3CT4wCqlhG3aOQ
         a1uNAM42H5psfPb9BLa14/GbZwjDQphGsEZHgZIDz5cfP6kcOnYVY8Y2WkhESkiWowOd
         rKTl4p78hTu/cnPkqXWm50lwknVUa15r8h56kfoQoTYIcypIC4ru7Kn8mANi6fEPB+4s
         SaTH1tj//05s/IOVv765RLfm6L8zmnMQJ8WRGaCcOZFmJD+C+vam5iFB0Iumyv6Mm5+y
         ECuCyc6B5BEf+D0vdLwYCJX4omHcJEnyGK6Kvk8cwbahs7W3L39b2Vy5tMHYf4Mtm8IG
         OkxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788427531; x=1789032331;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h4AL3I1iVTY1lcvS7u5/OIzDF2L/Odk7CNpIPaVSYCQ=;
        b=YGkG3SMv46UucvgKsLFCvFWuHpFTHZ1m3WSM4c64yTbchkn7zggyrDDpGOMLoOxsYc
         Qvoie2JteLbMHbiTscONPae6tjOXjwlAYBbvn6EgifU682Zn+EzQlzMgZqphsJfVMb+S
         c+e4qDdAQpSgpcbZ5T9M3Q4xDAUZT4EGuFDAaoRp+mebNVlu4oOoiF0r9c7NaukqGIWr
         8ir52ae0Y1fa/9B74OD5vBAwC6mHELS3QLKxf2NqQ1Bo8HApNBeMMzRQEMpdCjXiEMMP
         1FIs15hcQK1XIAQQLKTKmQkYnw0yP4OfSou4MUMZYD5rOM/DrFgMC/o7lw3P9jZNboxu
         un4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwH90rL7jbkY+NmFKTB1DyZORhZR8mxqa2gkKD0s/ukYe7ZFdDp9cBETIr3+rU8E+MM4eXL+0TxaAsuZu7x@vger.kernel.org
X-Gm-Message-State: AFuF++nKk4meCrR4vDCcSwI9YnQAmGWbvNbWve4F6liF7eQIqm/khBmU
	ZmeX11VcuvXHnKSKJJhhqS8ZYeRXqLgBOS7KEeGFrjLjiWu36SdVWLNm25NKEozTe6/FfHHI/Wf
	xXXWbFTpNQlCNcebb4vx1Naby7tu4FNbXKBEQ0MbWtpm3aCMvG1OL/+EdYHLJI7gBET2p
X-Gm-Gg: AYBFou3c3GQ+49LtggHE609LTMaVAqAzqukin2jt2FMqUVxSOhCy60JNHwDUZ/+9jR1
	LjVYB7y0gmepS4VtAo+uuqdXpJx87DfibIEhk6+/JWxzWhnCkzUJ81dqYUytTw/ezjWCok5VO85
	VaJw1AwgnhECRGgnAQXutqdl2vQx3YcayJI+qdyVjDk1rgwXvoUnpwXeokx2+HkWs7ALuDzKF2g
	0O8hMohfvWX7cuFRV+WY293NATFIjWSoWMEt9bkEJ/8c/IxleWbBkTShhlRG0ZTWQ71335PZ5z1
	c3dbrWPBkPwK1yXWrKq9GjbEBP7SwpIZIHcV9t3Y96MTMicJ/lmzgfpIbVDvOnWZQAwoeqr3ff2
	SIWHGK0P4lktjhGDdIt3e/Q==
X-Received: by 2002:a05:620a:2b46:b0:939:288a:8a30 with SMTP id af79cd13be357-939610cf0bcmr847809685a.6.1788427531245;
        Thu, 03 Sep 2026 02:25:31 -0700 (PDT)
X-Received: by 2002:a05:620a:2b46:b0:939:288a:8a30 with SMTP id af79cd13be357-939610cf0bcmr847807285a.6.1788427530904;
        Thu, 03 Sep 2026 02:25:30 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f3eecf0bsm69605966b.3.2026.09.03.02.25.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 02:25:30 -0700 (PDT)
Message-ID: <8fe6926e-723e-4051-8816-d9d5773e0a96@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 11:25:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: Add Retroid Pocket Nova
To: webgeek1234@gmail.com, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260829-rp-qcs8550-v3-0-198d5b2fc475@gmail.com>
 <20260829-rp-qcs8550-v3-4-198d5b2fc475@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260829-rp-qcs8550-v3-4-198d5b2fc475@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4MCBTYWx0ZWRfX033iA7bk9p9K
 GpGfaqzIwm5brdgmVcIzkrH0dA6YKo+R1te4/77D7oYuJxQ48EqlyWXwcFq7dzmQRWOopJjZVS4
 39ZRRx/K5+96JcyLAEEa8iBpg37z4GBj1BTXI/sIJq27n+PNsjADje2/OyglRH8j7SwhZbIyKME
 biZiKM8UacjrJOYOVzT2byh1K2BrgCrq8yLn1NQ45OYhR7ByZATSh42D/trAR5MeabNIrmQyG0O
 xYtnclztKvrC/Ugwwf11bI2YrR1HOrdfkFdi2j5wwLMCXW+b9Cy3YfuRJ+2VvBIWAAWlTGyEEsE
 JOBXrDuft47A5Et6a9aDVlzAjBSbonINQskeKXRhSY14Nuic2AwFpICYH8DJupfvHA+8doRKJ38
 fXD0yopHIXk2IPFkoS3aE4jfMExBikE5l/S9AOMoINDjjCq8mOW2NEgBrnPFG/VWEd63MZUob/+
 zDOX9VgAufL8Fg1kgdQ==
X-Proofpoint-ORIG-GUID: pgE9R8rJJHpt3fViXsId9mVjHD6ptV_Y
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4MCBTYWx0ZWRfXxXGyKCDxNYqZ
 ss4Oa34CxTsdPBlBnxzBwsLBss3+ejP9q2VbIMAaZEsA1qkdt3IpmZvbILzXfPV3zqtR/62qWyr
 uES1/Au2zjKW3iAMvYy3BDUg7lbqj3I=
X-Proofpoint-GUID: pgE9R8rJJHpt3fViXsId9mVjHD6ptV_Y
X-Authority-Analysis: v=2.4 cv=J4GaKgnS c=1 sm=1 tr=0 ts=6a993d0c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ZnTXIAIJv0AbCldGE5kA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030080

On 8/29/26 9:35 PM, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> The Retroid Pocket Nova is a high-performance Android-based handheld
> gaming console powered by the Qualcomm Snapdragon 8 Gen 2 processor
> featuring a 4.5-inch 4:3 AMOLED touchscreen.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
