Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC1D3F411B
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 20:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790109005; cv=none; b=HbvZkBIgaTno0JkjOtoFtkS8XIXNNcqS1gMaoywEeVkSQ8sKiXBSGyOb9Po5F7a73F0itEnKNs+YNZUKorwkD3bFzHjDsvQ/+dCSAsGV9A6abmFtS8FRJJ5Wnibfbu8+FiphLDmXolJ6SyNi1GaWo8SF4B58aFHGcc1V52Ke1Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790109005; c=relaxed/simple;
	bh=KGvbFC1xv3w/KWSmZCD1JwFEOhpO+TBAfm/srEiklcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u1bgZROAju96ZT4lScObUUtNamJCxlHoFj7L3fksvToWm8CuLePIAmL+VsTFN5ekyT76AkyJZGiYn3No7cahIM7ddMzA2qQORdtsHdVxLdl6q6tJojHVefOuoLEf8sYp1pzvetpqXz3Bhvui6TcO4hAcPb3RgkAJXD3Ygjylrf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CZ/MkQkT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eD1eLA3h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CZ/MkQkT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eD1eLA3h"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7FaI368089
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 20:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aqW2GbHYraxyCydIIqan53+h
	l0kg0DAN9SKEJbCAd7w=; b=CZ/MkQkTQfdZ5U6/JpuGXfceYOre03ov/Srq9mu9
	iuJgNuC11vM4WHmNebyR+AsMhxc91nRvc6USQoi8pdOWwsYv5LKHA4oGMdsVrljJ
	1ZKky67J8CTKssjhdHpSvaTkWEPWvu+axOrlC8xmEyMbw76HS3cjovrriTkLrvs0
	FgUZL9BVqget0TfgKIiaCFb0VrbX4zNaBe2SHsKdYH4Ga3aWxnUrPJlqbf4BCwNq
	tDKyeBaSebx19PXQTh5lBTlTn+rXpX+i9ccC9hKxKMK1KIuxCcwqT9xVOyNqu3mm
	bWEsou/70a1HBLSggvxx965DN+mKZjIwHrKdl5KSIgn8Yg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gurntat99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 20:29:41 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97cc09260a3so1382740241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 13:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790108980; x=1790713780; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aqW2GbHYraxyCydIIqan53+hl0kg0DAN9SKEJbCAd7w=;
        b=eD1eLA3hbrspA9Dc2eCGQPXGCwHm9drgV6t9e4PxS/0ff/oWQ86BJpnxfGxR0G8LMJ
         E6izVXrBX9ZFhsmplbAeVUakTSmUH50eb7Gi4CQ8dJCG0w+U4V5TlfOxJVjfjBbnmKyB
         xi+eciKl4C5tS2tQaN2wyahgsZZ3qsfPJTqBQm5TjbpuIAkrK56iQwPXcaTPOWVa3A6l
         o+k0pSsWw0MRu5FEUhqECAvTz2YFQlXJAIlw9QtT/ZbueeON4FEMmzmYgRb8nfL62/h8
         NdmGQnv3w7XRW9j9NeJMgSOCdiPXdtvQj+9ehodRcL+fiPzGo5Tw1iZk/3mSJGdGV6vm
         TfNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790108980; x=1790713780;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aqW2GbHYraxyCydIIqan53+hl0kg0DAN9SKEJbCAd7w=;
        b=ebkUP6I8befnTJKMR+Q1vi9UnBcShEkoaNdsPKpoEyu01YLvd7btl6VWahI3ow6L3P
         gD9UHmXBxE8rmWNB9tM9A9Wm+nAAiRWxx3d5GeahExh3kB193MzMk7sfVfkzVRF8K2Ku
         jjkRIxdpf4ekrTNgfdj2Xb0BOcWgdYiV5dXfRJgiuZ2hsbcYgfiHD1VVdy2FOpdVmfzP
         fTOOHkwcrM6f2J/BrYvwN3uUIjYmehV1c/AJq87MzJMKnjGrNxa2wa8qas6RxGPCAOKI
         Baf85efVTD/3SbdQdLPJ/rBbEJLmq8tFDmtfYvOKPeRxrZq/ePS/Edw3DqtfdK6UclR/
         84oA==
X-Forwarded-Encrypted: i=1; AKwUvBxq4BFakEf76LuVVJDbgZernMK2VugQKp6XnY8OWr28FLaOsfOWGDl0vw0CZSNuWmnkzRPtBEbq2tVpgKBD@vger.kernel.org
X-Gm-Message-State: AFuF++mBgjDzQQi71HNsp7yj5BP1cKZhN0qSPgqYacssvOuP0CjOdcfX
	qSabOKSfqEcnQ4vKR8ww+XL6uLiqQNp1IFLi4Eokf6pL6ayOiyd+ij8tqDk85bAxqROm7p8I9uz
	W1EIUg95m5YU32EpXQ6F2XpCojDaLJGEKOEMuHeypibNIs3Qw1shUc3Ixp0e4MuRhvcIt5Suflo
	lr
X-Gm-Gg: AYBFou1EZYB0yBoHiOiuIk7cgGOWLbdt2NC/j+o1Qz1CK2ee5FLee9y24Hq+AejBjcU
	qmn8wy8U8Toq4R2D0x7jKpVRyCIDahcocRZFKAYaZgbE1DZzxAedrnJKy9S8dTj7et59ebdG4e3
	ArhNc0hzkEaU6oSI9LmBH+mK61xyL6JTLzRUQpVPAPGR/HhTnJv/F1D8EVJiKvgqs48AWbZsMo8
	grMwNfhIAN/wRY0rqdJDRdt38vLSlhrVj31xjYG5HZ5jz1dGpgamPLWD6e7lu19CpH7wU2IqsgU
	+WG7vCHUesDzQR5n42PoNl9F0FKYMZ6RcepDEqRvmG7Eu+RcgHdpa6s444zRHjbmqheqQlaqQfR
	eEz6NhdIA6tWY7Q==
X-Received: by 2002:a67:e001:0:20b0:736:f95c:4bd4 with SMTP id ada2fe7eead31-7aa9df8eee6mr3852486137.6.1790108979913;
        Tue, 22 Sep 2026 13:29:39 -0700 (PDT)
X-Received: by 2002:a67:e001:0:20b0:736:f95c:4bd4 with SMTP id ada2fe7eead31-7aa9df8eee6mr3852482137.6.1790108979423;
        Tue, 22 Sep 2026 13:29:39 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48867b49661sm1029351f8f.0.2026.09.22.13.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:29:38 -0700 (PDT)
Date: Tue, 22 Sep 2026 23:29:35 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Oleg Keri <okerixx@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add
 the embedded controller
Message-ID: <2bk74z5ukyuzddmxhacm5lvdpxtlmd2jz44tz7dyjlu2zuyzqa@vw5k7lmxh7dq>
References: <20260922165737.260443-1-okerixx@gmail.com>
 <20260922165737.260443-4-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922165737.260443-4-okerixx@gmail.com>
X-Proofpoint-ORIG-GUID: SNpP1woKZeZo2K_Tvziudt6xo8HHudHU
X-Authority-Analysis: v=2.4 cv=eauo7LEH c=1 sm=1 tr=0 ts=6ab2e535 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=cXQzEVsWzZF_LJZYrIMA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5NCBTYWx0ZWRfX3+r0elVxMFQ8
 XwKFBga4CtOjbJoHJJjb8hEU+K/EZPn6KiFN1fUU2uEhgJ3uvNWrdoBCQgK85TjrMF0OSnA86I6
 MUFLBAEX1tiYE/N9RLLL/rF3iKFhhRqjsFAucaDFdZmwSuUHOhdvZo7mbCFWT/1XimM8NyGwZbW
 LCrarXbB84Zoe8DgedacZkNyS8cKI6rYPNcaQw5rwaRAAzWeDFefZk+2QhBLhKCWCOvxt+QxAp7
 NH8jl0/FAsZgrAhTDjbJzvCTjPSL01VT8ZHzPedtuBLV8Z7bGYScJP10cEeIAGjMV7yMA57/trt
 5BUidvS3idV/1ctHRKZG1lDF8YWsStfEE19tCsfoeSveOC8Qut/FHwit5JdBX4i+vtQ//Z0iRtv
 Pzd22FqvVi8cAQftP3mOd74jHTfdb+TA1Ld9kmpcMxZ+x3b8Bx+elI8CjRHxrsbk7ZPae1K8em3
 DadfIPgKT6LpX/lY6tg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5NCBTYWx0ZWRfX5LZepOJBlL+y
 bpixsLrxJeTfI8qITXkOCBXR8C9UNOgE0UnAcrmh466VqkPOtIuy4VSMAZRstikhvow2DHfx0aM
 akvdU/2qLkyl0hx5Ri47h6WUZAhOnIM=
X-Proofpoint-GUID: SNpP1woKZeZo2K_Tvziudt6xo8HHudHU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220294

On 26-09-22 18:57:37, Oleg Keri wrote:
> Describe the Compal embedded controller on I2C at address 0x70. It
> provides the board thermistors, the battery cell voltages and the CPU fan
> speed, and drives the keyboard backlight. Its interrupt line is TLMM
> gpio66, falling edge, for which the file already carries a pin state.
> 
> That state leaves the pin without a bias. gpio66 has no external pull
> and floats when the EC is not driving it, which shows up as a steady
> stream of spurious edges; the vendor ACPI tables describe the same pin
> as GpioInt(Edge, ActiveLow, Exclusive, PullUp). Enable the pull-up.
> 
> Signed-off-by: Oleg Keri <okerixx@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
