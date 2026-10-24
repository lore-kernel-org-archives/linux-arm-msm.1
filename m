Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792873608;
	b=PNU+EaFxwnl7kNEJ2elabmd72oxz12BuQS+Z3mCjeH6MYAFb+xgUrnVOk87XaSraAa0f
	 vPyshgvIIikgNdaztsaDif9Pkr0tSlv2NeH1A6mCpSEbkSdeI6e01ZEL/sJqnt8D47fbn
	 K1Zce3fY5Dy/3S9zRvOE0l6W9BNR0O+6fX2L7i/qKj0KH8JRdEVBegw6bgXX6snNU3NXd
	 0hb8R0yqVyaVg7ow3Molp2GW4ay3S+iC0RYR5dnPTE/+MR1QymAQ2+jtCqCdAe8UYRlOn
	 SHC1Y0vjrSquWPH88h3Y3Gs7eDj+wKtrUTrzppTiSqJqpQhSrh6XS4cBUejJ2yUhTvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792873608;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=II4oMIZXIZseKoWFPBpiiKbYu/bQ3hfax0bZOTdZzAY=;
	b=1neLiMl0BsVSufHMfimaM4FxIeCv0rGLrjMN/CwbZsdIt1Jg/KhZFEyapZJk8RadPAGe
	 RQMqNC1klr82wfg8ClSwDt/y2wdpVLfOAYUqaPax7ovegLKyxfHo10csJM12PhdMoYkxb
	 T9iYnGBPfr7SfWQvRtI1FHixpuHJdsDyZiF97MTacTnuYTrfSh+4Jld5WPjiLHXr3mzeZ
	 IpC8II1B77pq9xkDf+fanWeUkHt+wJVZoT2D/Uza0882wcZnw78F9H/llP5PFMz6OYc1B
	 +jDsoyU8yvzJzt+BP6sxHzeTOU5ygKTv8FdTc6ZjBts4f/xVKJiDVHdCyzJSy+WBbFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BzuY0UTP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XB0HEluk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D35606A31A
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 20:26:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06D35606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BzuY0UTP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XB0HEluk
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69OIU6xg2307242
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 20:26:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=II4oMIZXIZseKoWFPBpiiKbY
	u/bQ3hfax0bZOTdZzAY=; b=BzuY0UTPsXpIcDYUIWFB7cqZKWoCnVYCEgZeImyM
	PzYCB2tb0FwkIFcn+ypuT9LoV0IDzPU2o0EP1keZuWoeS9Msv0qxtHYosBrnnK8W
	NpLaU8DTAu5FZBWI9SimCCeBGiLfVA1CpAJ4lpy5EzzZhslAXWInCPtkf7QAS/JX
	eMKEAD4sQ9RbYnoWN/W1PY7nYKvpaB6lAkWLnYVKJt/MCKc7kdZ7oJKiAP6aZDGI
	Un0e4el8SaKlV9z91HlvedzWYDBenr54tHQQ/RIz0AyKEyeAaqJtJHun7vKaUq9r
	6/HAC1tSjWn2x9a5vhsapKJ/QonThOsUBCCUwHbhIQEXwA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgj1pa3bm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 20:26:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f33438950so441345685a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 13:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792873606; x=1793478406; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=II4oMIZXIZseKoWFPBpiiKbYu/bQ3hfax0bZOTdZzAY=;
        b=XB0HElukSAQb9I453tWYCko6V1s2cEh0j0dbRQ5drhyBPWCIL/QlrVTMl2OrUmgIGO
         OO0si73+q301F25Cvu1juekWiH9C65bkzd67hCTWqiktITV3RvhLp6S8NbhyXcC1ncMv
         2VLZ1nuH2UtJJafi8oO98MOQawtV2pDkvsP2ZjyQ5+C/zBMjecMf8JeS6UML5Jlmk9by
         Rlh30pg4WKd82G1OCO8jzOnnORrkHmLBv4OzEFwRzJsGx2hpwQXmitD1wrEQVGn56Ck5
         2j4/1auYf98CbEsJM+wI368zCag6JHiwPgNkrjKTQiKitcYkqZdy06qgDmqQPtldMkEi
         n63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873606; x=1793478406;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=II4oMIZXIZseKoWFPBpiiKbYu/bQ3hfax0bZOTdZzAY=;
        b=2fVQCceamNbLkuZLKUFN8RagMAoEGLi4jRu4nMOZxSMlmffr+l3tTaWz5mbFhzRtMF
         n/sgDFAVkEs3JRjZnZT2y5R7WjDgQfIIFUxG1BQsankDPmjjWpA/2XNnE9/RWIV81SkI
         MWxQLQ9Em/wt/nzfpubCNH4OSHHpjJvlEI2l9lyxBvg2iGndYSZ+/pUvlkQk7UJgWVni
         3O2XkzVvc9O6pfjlpUM+9OxLY1U3OQ8M/8swR4NiH/qMjz95h9s5Rv8xjZ8fSpUdCtFY
         /iQSDd5u4wPUvNZ6J2IiMWbqturHowCCa3QansY2ozLV4mkWooogX9RIvtKwp+MMGpKO
         Enaw==
X-Forwarded-Encrypted: i=1; AKwUvBx1wy+LMLPLk7k7Mi5IJkO2etJFdo2AMdT8lWLzzWq/u78ueZV1C7/uBV5iBmBwSUK8uP+qTcnwqcSTgjC3@vger.kernel.org
X-Gm-Message-State: AFq9FYJlbz29Vv2cAItUv0iRPgQe/XO6Sz/x5X4VkVFlhH/HIFRmS8/K
	NMHo0ShgNNwBrmfWS6GpyBnzf+zmySO27gQEcbyEZXjKDWn4l19EOsTrzk9EyCHr+v/ONhRYGks
	pFJby6yFxkBFnIR2K3RLo3BMtTHvVWyHzHB0kcGrA1mQ8DGN4vLVN4s+Ng4vYQSwpl1+B
X-Gm-Gg: AYBFou3MdvNFvdLyAjLE4NC/+gnOk23JfuZfudDuz8ljJXjuVAbw078VzUggIJ9u8yh
	lkiPWL94Xb/972Jh1G3XqrknSTQI4pV+5rHtqo+yV6IGH/MJ/E3wJNEBE/RfYkw+AaNB16X8/+c
	grTbWV5daP1PmX/hv1zYXNRDrODngO8h5B8uoYKyUs5bXRc5bgQpmsXUMbrQH840E6jOzLOIgP5
	3a+KkNliiopnUP8Btv5kjrelDLYQDx7zPmhWaEC0Gtrsq7KBRA2mm2wIrFrmH6CGuU11BkeZVnm
	Uct/KTugZAVX1NfvSqr81DACvsmccy9gTD815hunBlZdEPLcEC7ifwvwUS8RrMw9H3KEQYH6Yof
	6oIJwyQ3+kYB5jQ46
X-Received: by 2002:a05:620a:370d:b0:93e:95ce:53c7 with SMTP id af79cd13be357-940ef79f0ebmr406265885a.4.1792873606130;
        Sat, 24 Oct 2026 13:26:46 -0700 (PDT)
X-Received: by 2002:a05:620a:370d:b0:93e:95ce:53c7 with SMTP id af79cd13be357-940ef79f0ebmr406263385a.4.1792873605562;
        Sat, 24 Oct 2026 13:26:45 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm205760225e9.1.2026.10.24.13.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:26:44 -0700 (PDT)
Date: Sat, 24 Oct 2026 23:26:43 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sm8650-qrd: add DisplayPort audio
 playback support
Message-ID: <5ayekw74yegk5upaj7d6v2va6p4koy4yljlqje5cfgrhh7ovmi@akurrock3aed>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
 <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-5-8a189c71938c@linaro.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-5-8a189c71938c@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA4MSBTYWx0ZWRfX9M/Y9kdF3ILB
 SMZ71fgQ2dXQxlaMQxDZ4JNZCZ/+UhfcvLqSaNabPMfH4RJuFcPpqPJ5rAbLuoPNyb59DvcKDu1
 kP4GFS1zAYpjv3C8MhFdYx57zP1XGXo=
X-Proofpoint-GUID: KSnGHYR006X2DJcVxQcFpxSY1nydsnof
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA4MSBTYWx0ZWRfX4bI2tU2wb3HS
 xHiJMVcKj9aRqIjEdQJPY3KHEex17FTcU1Qfp/zsgT9GBbZReGNcAIGogGSsp+5CP70h2q/sG8p
 ZTLeTTkbPf5CDyFEKnkoX7jG/krlBKdA8rTbN7eYqf69st7XY1xond2mbUgC6OLIjIQ5MO3m8Hb
 dXmII35QCm3WpwV0/krdXJRrufX3j/4/5YhM7cCm4oIisF1gbGD2T58gcVncW/7sj8pkk3Yfiwo
 Toq1iH5BiUMA2y2Pb6ZazNt9jomUZzDGc4+FgmzZWL79wlo0fdRxPzPWtISF0lQMG1lND4CYBAZ
 h7MzOpZcmsOiSthCjd+0qI7/YmqPeaTjSvhzYGkxRy2cL9WezS6W8I27yk5RG0/6jZRK9QFDtyx
 C0iAVqpx41TUlnoSNCXC4qWQ5JveszIzxXIQc3ZC6G9MliN1iZmg4IFF/yIuV8YpU7hehM9BnyV
 2Frwb1eDMUxXlHXnrXg==
X-Proofpoint-ORIG-GUID: KSnGHYR006X2DJcVxQcFpxSY1nydsnof
X-Authority-Analysis: v=2.4 cv=D5vSufRj c=1 sm=1 tr=0 ts=6add1486 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=lwKPvcPLtPgdvEeQYCQA:9 a=CjuIK1q_8ugA:10
 a=3Q3lADbaBCgA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240081

On 26-10-22 11:36:25, Neil Armstrong wrote:
> Add the DAI link needed to enable audio playback over the
> DisplayPort altmode output.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
