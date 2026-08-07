Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C78442375
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 12:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786104449; cv=none; b=dXALfCq0nEoFWiVh7TxG5Xrww9ZLUp1s0Rf9GTJY3E5LljsPWyUEk8Olf7ckJVGvoxmeVPoikZt/O02hnIKkPsDdBYaBThRRqrPsR9qxYE3z9AvDOBDSQsapKWDmcgnGFx2O0PvKle3+zckOTZ1P9/0DCYbgwSNy1z8vkwCYS5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786104449; c=relaxed/simple;
	bh=ehPxIFQ21Ol+ZycPPlarMM2wALuLgzffeeMI4q+2ToQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cM3YrjQknPAYIR+b/7iB7m1gbcz1M6GLdLOyLJcSKorK4gKaRWnBnNKwu9cW0wn7M3qm6qVVUnhdtVRn2JQDmXN/96yzcqWlSsvjyDIYLZntv8nIKi8U9n8bcpWXlesZkSVhFq41jDwf/QChxRNIFZe1mMW5XcOc/4aErGu59c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nD2LLTVu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ob8KhSJg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nD2LLTVu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ob8KhSJg"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6779ENDm1064617
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 12:07:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J5PnJPw5FcNJb0sJKMIKFrFpB7jUpmhAZkLfowS3CEc=; b=nD2LLTVuf553t+ER
	LM+hUnXn1yDSGlIUMYMLHCDOv+jUeoJiBeMnREcZ8wLtQ9YEvIORaGGNfx3wyLIj
	J0t7r/w4Jfdeg9Gs9cEfRMjiFsW4b0f8a9iLD/TcJ8gNN2+6yW++QuRekUdbl3IK
	PpaFaYsTbKA+4Sg1cLC4c+9/tnf0ICB3UmrKDmKKDz4cOmvqVttR/VkBdWFUP0VL
	neKD6ZffuAr0s9YOvq4dmZyfUM0qu7mnMRJRr+ZHapZoxF7mRknpoTpXgUSMEoFp
	lu0P3DptBnANXohS6z9fdCY5gdp3cIz1AINmYvACbO3aah87abn2e5j6WxSnU4fw
	9XvvHw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwcjb0j7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 12:07:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e63df032bso167892985a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 05:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786104428; x=1786709228; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J5PnJPw5FcNJb0sJKMIKFrFpB7jUpmhAZkLfowS3CEc=;
        b=Ob8KhSJgrOFmVg9jiZPxWD3/XQa1lnruOMTH+pkOKaessR3LVZlRua7vL9rEg7vefs
         eM7NZB/75OOIUE4q6YqDWDNtBB6/B/N3JauC7QSKPbNxogKnp9pnCi6JYOlU3Mj/sAV5
         +HzFtEYeSlhjhkYbSe62HMP6PhrlSlyhh9XU7zH7fhQHm4G7UU+tOOdlXW99wPmK9deD
         zcSeG8w6PpM82gQ3s4CWXeRW5+LG4PJ7dctJvYZBuvutWa04h1TPabqzA74xOco8Hsd9
         0Op3YA707ntdeO3thbMVl4CiKWkFYxWaYUIDQLMR6El2+ItXP2YAsnu6SIAfQfjbgAW5
         Nubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786104428; x=1786709228;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J5PnJPw5FcNJb0sJKMIKFrFpB7jUpmhAZkLfowS3CEc=;
        b=ekzxKB6L2fRnY8kRua+UJhSu9G+fJTNSOEZI57wstlxcc4us+Q+vnaz/q4dUBPa66W
         967Kl/44E0nPMJablBhNiRdxSgP9pTMTRBe8gwI2/hyaxuhI22qDe4lkxNkaEdWIkJ5g
         MH3/R0hF02CSIIxMCoPei31xNcYuWHyQgBZWed5NwmweTDntrsLzMTAINxWVhbRbFSEd
         wV3Hh67gngYcYm0W78rslT9f9oaFzGQ9ujX2uyh2UEymXi2Z0T69uGNiTQDufUcFFKSe
         XZIVmGnK7FC/9YshV5FlAjztjImI6H0LYZ8jBTCPFoTdTgUoTvtHOcy4FChrhsguNIlC
         Ubqg==
X-Gm-Message-State: AOJu0Yxc9jtuds9VIF48rG0Pa9DA8MSqC2ZYeykCsTHaNWodc+H5sQWH
	jRV5N5zM4rvo/faJ5/ftuCPTr8ia4V9a5vodymTs154B43jZYlA49ovQfsTCKapV1ODGyZeRxv+
	7kGmknhK1Ahi5NKH99xv/4/U8bMpQGt0Fy6ceDdlQTWxYidFt14KU0se77oIk80JPMP5u
X-Gm-Gg: AR+sD13PxOwBDXrC4NUQ4pdL4OBGxHk6gD37E6GW/X+Sk1aWWo5+XSyPapdk2fuTsFY
	QlBg/nILR0v3oPSQG8JIXkSBZZsPXru1xOwHX5f1mmVU4ZsZbVX4PXiFMlDjHxJegEE8fjtDu5L
	fuySGuTJnnt/00GkRz2iOp/JFnwLnD4y5f4s20KyDR/F6yfiWSlelo1cT0aqGhiaJ3kzsJKuTxB
	tkp1DtQ7lgejnzuCmBAQvv86oXL7i7vj83xhKdzfDxGoGakFvkclznrG7UXrysnaH45GmZrM/h8
	Sy5m71nnN78uFSbD9t1h4n1Xd4REfuMHONzL75hz0Y/pDP5kvkGM3CEherlW0CVlk5abqBHVRw+
	qahsEOS/LRvXoQsnoO6yH+fKWW/J7PEakvf0sYqyNOjpIsQ==
X-Received: by 2002:a05:622a:1646:b0:517:63df:91a5 with SMTP id d75a77b69052e-52cfb04c58cmr151075951cf.19.1786104427863;
        Fri, 07 Aug 2026 05:07:07 -0700 (PDT)
X-Received: by 2002:a05:622a:1646:b0:517:63df:91a5 with SMTP id d75a77b69052e-52cfb04c58cmr151075161cf.19.1786104427457;
        Fri, 07 Aug 2026 05:07:07 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48002145966sm5365813f8f.5.2026.08.07.05.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 05:07:06 -0700 (PDT)
Message-ID: <70f39b10-c529-4a7d-b1b4-6d0f04b2e38f@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 14:06:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] thermal: qcom: add support for PMIC5 Gen3 ADC
 thermal monitoring
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Maxwell Doose <m32285159@gmail.com>,
        Joshua Crofts <joshua.crofts1@gmail.com>
References: <20260722-gen3_adc_tm-v4-0-011981f756c8@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260722-gen3_adc_tm-v4-0-011981f756c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA5NCBTYWx0ZWRfXxP9WjP0rk5wr
 JyayLzPYgJwgOGHvmXPXitP3M0sfD+ojQfcR7mOWiWeXI6VBDXkBY3xuJkIs6z0aE+b7B9uTOb3
 q0z/kRWlXb0oBqxu7/Y/Ws/pEv7tfJlE34BDR69t8UoIlCUHh8yjSIAQP9XWVsLtMVdCRPVOKyM
 YCw07sP4XY7Et5rqveYnkhw/tSupQwKCB1C6PnJsX77yC/mfncdyiC9garTf2tz9zyDA8PdjmbK
 3+9iFhnz3DjNm1y3vKsaBDVHvilohY5mUdYtCo3n46kjqXpg/LU2fBV0FyYdbRfY1qFqIur+4Cf
 aGeZ9ro0oyudtpV+MVhd3ghU/mfm08VoQa6qCJXGp6zdr/e0OXNxbY/No8rFTrEMrT2ypZNn8h4
 xL/jHSdHgss4jEJj3RX+Yrr7m1DKrtXpj9YBRrZQzyodImdSMJvu3rE8kbuJeVAE2yLq5h+sB26
 x6h7BFKQmF67pOv9IHA==
X-Authority-Analysis: v=2.4 cv=QsBuG1yd c=1 sm=1 tr=0 ts=6a75ca6c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=RQz9wGa70jnH9Rp9_sIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA5NCBTYWx0ZWRfX1DqyfgfONWUd
 S2g4GhTmtUVUiixl6kw6Tspcicq4ZVELJu0IxVcWmbI0Om4ILwRvdVCeor9u2RYsmXooZ836iBe
 GCBCM/2YE9NWgeiLhSD9CvyIKuUVx/Y=
X-Proofpoint-ORIG-GUID: o2eK5MSYtLfW4JuvQ46D4Ah4aPi3dz7h
X-Proofpoint-GUID: o2eK5MSYtLfW4JuvQ46D4Ah4aPi3dz7h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070094

On 7/22/26 13:26, Jishnu Prakash wrote:
> Support for the main PMIC5 Gen3 ADC driver has been merged now.
> 
> In order to complete adding support for the Gen3 ADC_TM auxiliary
> driver, some more changes are needed in the main driver, mainly to
> improve its shared interrupt's handling mechanism.
> 
> Patch 1 removes an unneeded print in the main ADC driver.
> 
> Patch 2 simplifies the interrupt handling in the main ADC driver
> by declaring the interrupt as a shared one and dropping the logic
> used to call the ADC_TM notifier for handling ADC_TM interrupts on
> the first SDAM whose interrupt is shared.
> 
> Patch 3 adds the auxiliary thermal driver which supports the ADC_TM
> functionality of ADC5 Gen3.
> 
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---
Applied, thanks
