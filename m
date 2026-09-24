Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F00E3B9617
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 04:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790225842; cv=none; b=nvcAz1CFKIqggNUcyCcTGGb3nam5AqEeQm11Ru2eLGMYq5OIV69/gzYsF4aqT50es0ahrscRE+HYT0Z9e4NOyiRqHPeBf+JtQ8QV4SzXTwnfrB/0xdrDy99i0tK6Ngr1G/s25nOWyzBWnIDSbqUdmBNnhH3WJrmSpGDfbqFx2cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790225842; c=relaxed/simple;
	bh=Mpco+6yNdH2y+nlCpp5arIK1VEtWdHw1yaMXxUPtWOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W04WZXMG3qW0ZP/fEYmo6YOuEbXVikMgz0PUhxe0drGRZyW8F5v/SXZQBhcfAP3yYfYy05bGhHx6rHOexCKc1py5N5k91vlUg4ofYHxu59XdlDO7I/mdkYxV9paTHPT18LQldXcduI151R2vdHe1/uvTu3tf9mRCWXePhDVtcWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fFiYGhSW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RCSXbeCm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fFiYGhSW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RCSXbeCm"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O36gRd953521
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 04:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ut8DVTQEfpH6qJZsAQxJYFs6sRDVv54/ARUFWr3kTyw=; b=fFiYGhSWRQWymu2b
	PSG/AjuiAoXlbs0NkxQmWgI4tCo4OFt4fiFScB94yiFXfGxQRm2LWFkZegMNY2XP
	Dyo1ieW4T3dkXjj3CVgckAAwQih8li0WUZqrVWLHlhyIhFaqtWSTLxUU88kha6+N
	zrKiaaytH73VlTeEJBLo5yMZcsijNGTbT10S+GinUN/Z1jqLH0DhscPBfT8dQYTS
	s05FiE/rJggcmh6ri6VTIvS0d7DDYbSLlyfTxanwRDtAF6c7S7zI5Sua0DKwqww3
	Oy5NrcNd4HFDzyQdDgv5NYjGGnkSqfyS9EAYgbgFeMeVTPmKaFUCQqJ/7LzJgX69
	Cc4gyQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvhsb2nwp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 04:57:20 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1416f32fe11so2199908c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 21:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790225839; x=1790830639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ut8DVTQEfpH6qJZsAQxJYFs6sRDVv54/ARUFWr3kTyw=;
        b=RCSXbeCmY5kIV6rLkpryqp7Cjw9oPcTE4bs/KKiG7foUoTZF5rPYr88RN2ekDKmxDb
         SyxTqIV9mQMtvEVnBSSE3697jHqnbzU6Y9jd1Yq7+GlPazbVZXMP0SAhfJLrjoN6ynhU
         CTXuTiFRcn6/GTs5dE3m/g2La4NWV8PVE7NkP+h2fTV67Ib5WNua7bmy2TVHbHJcjOtv
         TzaTE4Vsq8ic9UYOMesqPsP/jmy6BAP1EFF+FMYYfjWHkXKqv9gXnYFItkSYvAJSCgbJ
         1HS/LQmeZpGXw+kaqi/k57u0XufxMMyykHLVttfYSXXNtK08DedUX2EijnbM1uDXKQ83
         oYrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790225839; x=1790830639;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ut8DVTQEfpH6qJZsAQxJYFs6sRDVv54/ARUFWr3kTyw=;
        b=K3nAFY/UxRpBBxx2rvi9P7zqcCKwhaFUJHIRV1mcGa3PwIRTJe19MKJORQD3pX+8yW
         CwHGLMsUIWYVIXvox/0MdcrglkWtqMa+YCJ7lr1GDmon10zZyDw7pX7+QYzDtMk/Ue4/
         Xd0rdidMfsFw8ViKhK7q0bz5mzM2Ios/vNhdGglnEvoe86wApfrPDCXjPsX/ZkT0dc0+
         H3Z8pwxh/TWb6TvNDwxPT3fPGkdIdBBIMswAxuu+BdFQF5jAbCEnAXUW3wtERqqR7+J9
         jgan15K2CjTN+2y2veaolQHePXWC21JyZ78UB8Z925TEJduZoX1W/pjWbREVWVEGgJLm
         Bn+Q==
X-Forwarded-Encrypted: i=1; AKwUvBz82wwXsJF32zYiedU13nanN6NsGNbq7Tu+yNpoD0zatqq4wjlfTjUMn3MYnVmxnMGTYmo1EdUx1/IpqmXB@vger.kernel.org
X-Gm-Message-State: AFuF++nQTgv3gtPuftkLhgDbhHfd8Vjta/uRKWEOsE0QSJ31ktJETIKa
	03ESvg7BJA2sBSnmUfvpHfihreqQRp8Tj/m85Oabh/NlLkwsX4rxEJETTEfra5GjUnsLSztpAhg
	diK5ygsJvZKc8jVLa7WtuJaxVBzEVqj2aCgbRW60ajgr4K5Wb4xibcgvP5m2PbJIw09tD
X-Gm-Gg: AYBFou3ldl6za4uLLC8mDzuGqqIW6PaHvtC+7pAWIjOYzNFK2Ul0neOUdUDfNMxCqVO
	M611cfSlH7LKe85JZuANVFKr6nlmZcii9yOx31qbN5Z1fch6Y9jQyo/2x7D/5PhOfGZyjcPpdTj
	Stp8mx0IZPvoOSGkcO6szE+hvRXHSYOnRN6ysETjYd4WfF/HwwDcKrahIHmn2X1dpJi3HZeSYFT
	Nq8uT/8A/Cat1e3RBmeR7p453/oRkI4klU/vpI5wZcTM+dHGLG9yyQ3e9o3VVJJC1eHh/Zl2CyN
	C8GPnensj2St7B9Wx2LAwcQiibsDC69KtoBqtMSPISxshdht8QbVIadm2flJCZOYhXJbxjdn6e0
	BBZ7mNntoVex8sPiJhHLmfuhC1aMn
X-Received: by 2002:a05:7022:eb47:10b0:144:f480:3541 with SMTP id a92af1059eb24-14503fe8205mr1007944c88.21.1790225838858;
        Wed, 23 Sep 2026 21:57:18 -0700 (PDT)
X-Received: by 2002:a05:7022:eb47:10b0:144:f480:3541 with SMTP id a92af1059eb24-14503fe8205mr1007916c88.21.1790225838269;
        Wed, 23 Sep 2026 21:57:18 -0700 (PDT)
Received: from [192.168.1.25] ([122.183.173.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f983d73fsm12919002c88.6.2026.09.23.21.57.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 21:57:17 -0700 (PDT)
Message-ID: <92ec9d68-2baf-4b8e-a8ff-74e0d2c7295c@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 10:27:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/8] arm64: dts: qcom: hawi-mtp: enable audio playback
 and capture
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260923084627.748920-1-prasad.kumpatla@oss.qualcomm.com>
 <20260923084627.748920-6-prasad.kumpatla@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260923084627.748920-6-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AWZCXjLz0w_sns0-O13V8oA-jW6Wk_2x
X-Proofpoint-ORIG-GUID: AWZCXjLz0w_sns0-O13V8oA-jW6Wk_2x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAyMSBTYWx0ZWRfX1gS20Rs1dToz
 DTAZS9DH7VEVqF7V5T18GRFPEYv2J5QjqJ6CWNq/9keZoF3HzOHXO4viMr+It7TCNLnKQul7S5H
 BzB1in9EWxOeXtqDznLS7z4cYEOmLto760uu81iHQgvL/msvQbxuUuaiWtOXDePUu8lY03a8rZe
 M3OunFQ+KyWAjSe9iTLHb8CnG70OfEufqHpFPWvKVDeLeqw+Tdy77hrDecByzl+wQ4rY2fiiboJ
 hUDCk/o5Ab5YBfzhY7vn5bf3bFDe8jGUkLIZGqCpp1e4RC/GIL3FZE2RnTxAdWLcZJ/053EtoHN
 Cy9o7vW15v7U6wXjK/mN8pf1QPnXkKJpbBYfRt97zMrHZMgttdCk1aYyRluxSYAeo8fwfcJdMtJ
 VCrIzKGxLYirYjMcd0Mv6oSx82H8Wzkj40GmFCyCyfojqsNmwYKDQDYdBFMnHyaXrEP5MjC+aZL
 L2sJCtej4dre0lzvMKg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAyMSBTYWx0ZWRfX9cXZawqM+Rub
 1WesbEpc1OQ5lbBNI3n2Nqi8lvrpKzY6sWpPJc6e1kld4tS/Zks36aW0+s7BpeAJ2axUDD16uil
 EcvcoZoVBzn68HLHyD1fjQmALoQF2cM=
X-Authority-Analysis: v=2.4 cv=f7vdl+yM c=1 sm=1 tr=0 ts=6ab4adb0 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=uk8ae9/F1LYL5lfeGCaUoA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=xu3tYevT26_x5ihNIyMA:9 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240021


> +
> +	vdd-micb-supply = <&vreg_l10b_1p8>;
> +	qcom,dmic-sample-rate = <4800000>;
> +};
> +
> +
> +&q6apmbedai {
Nit: extra blank line here; please keep a single blank line

Thanks
Ajay Kumar Nandam
