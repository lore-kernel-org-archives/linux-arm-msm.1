Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706073EE1C3
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813291; cv=none; b=fUgl6N2FBvWt6JGViuw9xz+Ett1j+yBceoF9HmfWezm7kSl30DLeKOTAIoqvUDk7aCnYHfexY73f1qqLLeZCydK0D2CA5gFIS6xbIYgI1NxBRgQT38D9W+S3qyR4/JCm4PnsaPsO0X3As+l0tA2QSW2nVJqCMiuprtHOo1r09rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813291; c=relaxed/simple;
	bh=58RZ06m5HkndudGPZ5z/6FTzyvzAQ2MwHTbtgryBeWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qaHyHakwPeShaSHd5EK22NJAP7e+qf67FsNSGl0NEXAOzAymWISfCblhJZyOfIQyu1Vg5QxFAgXBhLZKIk+4oh9yhOmxlujXbyjyYErG4ZXxPZ2neygKDaZwF8Hr6DLXjnETS1dwgN92gl/jn3yFXEZ9G/tyIchwdD1G5R7As6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mqP8BSZ6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vk372UXD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mqP8BSZ6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vk372UXD"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0O512088487
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:54:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KfHzq7kE4KUw2rk5Isgr8vtG
	bIhjMRZ0o6HxZtX9Gpk=; b=mqP8BSZ69srrTfMwU9Pf4Pxa44hA2aMLH9zVxlMk
	2m1Ez3zsTBqdNAKOUWUKZJBAeni457ZibYdQM9AG+ddNPIa06j8dnQAJ8C7PGWNx
	KStqnkkHQb8HOarFDWkuw+G9W8ZMYzJ3NWRJ5/vJyJBoDQgth+M09oFTfT1XpWhb
	MfxzNAl9PyrLvWDjPlMmhykJZGiDZnQxePO2pnF4wHywBUOTseb4C54AJrg+RpmM
	TmLGT+PUjZp7n00DbS5FGRWn5mAZ3cEP8NUibJWr+q3k3+CAigV7MAnK5NA8sNXg
	O3oAvzbW5qfITrhyrVnqQzLTjA42zlYJ3ardlxr1H7fHSA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu26vw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:54:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb7f9bb86so361749185a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791813288; x=1792418088; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KfHzq7kE4KUw2rk5Isgr8vtGbIhjMRZ0o6HxZtX9Gpk=;
        b=Vk372UXDOIM2hAkB12S1crlHY5Xv3OzIBAtgbbHFFT1oPq0FiuMpLUzJk6lwT1Y1Ep
         TAZjWUsuGWVmvCpq7gJnZ/Bp8Tn85E353a8YdthwIAuTXrAWfs77LIwOjJ/Tgn6wdVFt
         nZdSD4HAmjMQHI91NN02BXqeQj8woS200HtdAgp+whnLxI4y+wTKc8C3ftltAkk2Y9sK
         9l82JNe5BlSOUaqGGLSwHDmtIwtyrkUbEVowmuOvtHq1TpA+Rlli/bLCRwqxAENQrVoB
         BzWhd00w8XWz7Pyz74fn6zgBT1fn1DOhs3sDI69DnhkkTTfB3Bi6oCJxUO7MOccBKXz4
         EYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791813288; x=1792418088;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KfHzq7kE4KUw2rk5Isgr8vtGbIhjMRZ0o6HxZtX9Gpk=;
        b=NXVtMhnbuBSRJKd0ZrJsaXcvAEi+bOuC1cMs1pL6SQDKw4Ob7cre2dJXcHr3r+H9ak
         ap3GgX50aYqC5+RbzdwLFV+aDsrkA5DZCNnY7TioliwIvu2bE8qE/xiHqIuUiQL8ldQT
         8/j1miq7mrtBgIDfG3s4oPaqztYDFO0WreB/0Qy6VFVs3MBNxbeGe/8eC+aXTDQNw74O
         hhO1RKYEiVgx7T9gzHsusTmjoSt5umxuVZbseLAERPlBcbH2pUKovN0/z5sMSqOol3+l
         mM2h06GesGOx4g66/N/c1WN0q5JAyJO7+99pyU/J68lc2O8/lGVlLI6IE0L1xsqRKeWd
         98Vg==
X-Forwarded-Encrypted: i=1; AKwUvBy7t8hp7ekMDkEHPtyrW95QMgsowVSG+yphqYlyZmJteBPuvpox3rpFF1pU9muLLDgWoDujIykh4Jlo5CMV@vger.kernel.org
X-Gm-Message-State: AFq9FYLC8Klz9GICwN1eUDqLHmixNMGuYMxI6bi2x3bzDkNJTgw5L+Pd
	ur4rCy+i8Ie8zZThBIsC9tlfk8eyGgfhGCwmvlY55HDsdoGoTdHe4yYC5Fh0s8UM72+kQAoQxKD
	1VU+crotyvYpVFGxuX+XG7U0I3Ibb8HRuyCNaOlBp7T6ZMu5h6zxy/kYsCLYFwD1+qJBS
X-Gm-Gg: AYBFou02bGRsPTrKNd4MX8UA74WBaNGZtAXtxTnbpITNcOEx9bJAPsIdBcEoA15jWZf
	pdrcy5bNS3L/duSo7qyi4D/BQvkeLUS7MpbXPeL8knKFzoIxAZjzSs1tN7wZyMyIbasya1wKY5o
	yz4kdCXvU8Z43toyTwHdf0BhOVZzEim5bGmveVfZqI6pLivDVenij/gAVdMcbYrq0cXcYDhZCbx
	BEeyvI2pIpEdub38N24KkH1kJdtWh9x/8FfniVBF4TjpPrdqRnM7pDTO3VSUnilfdgrDh6BXAfJ
	34Lj8q0izBw0hKNWM/YDnyU9DOPsXNuEST37GeRUyiUM5FDZOQbyMD3VEO6rosa+J5V6qgJMds2
	XevbOGiXhQY6Tsak=
X-Received: by 2002:a05:620a:28c6:b0:93e:4833:82e7 with SMTP id af79cd13be357-93ebd22491dmr1590004185a.46.1791813287565;
        Mon, 12 Oct 2026 06:54:47 -0700 (PDT)
X-Received: by 2002:a05:620a:28c6:b0:93e:4833:82e7 with SMTP id af79cd13be357-93ebd22491dmr1589998885a.46.1791813286734;
        Mon, 12 Oct 2026 06:54:46 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18beacd2csm315386005e9.14.2026.10.12.06.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:54:45 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:54:43 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: William Bright <william.bright@imd-tec.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Depeng Shao <quic_depengs@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] media: qcom: camss: Add the SM8550 CSI TPGs
Message-ID: <5qabq7hqheokkaim2ebyq4ubhuhwlujuvv47ggk7scrlgjv5m7@2qbh6uvs7hck>
References: <20261012-sm8550-camss-tpg-v2-0-06dbbe36ecd2@imd-tec.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-sm8550-camss-tpg-v2-0-06dbbe36ecd2@imd-tec.com>
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6acce6a8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gNcS5RXMAAAA:8 a=6X3vJ2KViZPjrVoEpqIA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=VeqYHxXNbGx7SVBbL1V1:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1NSBTYWx0ZWRfX7es2CcKaocNl
 2ckdVSPMPMX+FkS1vTXh41IjTeNVQj/1i+is824j3bgEmTIyFNGDrCVOyskPBMLUn1Vd/YNmkW1
 EPQIxmDQLJupwJA+yIkkVqYIFYUU3y345c+kD4g8r2MjtUiPYb4Y2F22K4SHZS+g8VbuEdcJgTZ
 UKBP4nwCEtOnCjUlTNGrYp6HAXAGH2kQeELHqfb4LBBIMyo0cOfJ3azx4cqBW1sYKEys9XGpJ/V
 bQjLul1KoKy3rGxzaIFCgnUTLIQvBIqSN8kjCwhf/2qbbOTlTxe0BQXAgT0n8DWBRS+jDS3MtOd
 wUODefXl1Y/zQQe/7wD9SiWsBRN7wIRgvoUcX6lLdLwREwS7K1RyWwrwaoVcRf/4N4Qy/td+jOf
 3w31z7HHgmpzitSOnrudUlV8AR+0eGsSYQiWAPpHRu6SobDmXeJqGzH+WvotF8SaLASv4M7+aVZ
 HJDiLQyxSf7kAJK3wnQ==
X-Proofpoint-ORIG-GUID: S9vZysEBUDvvbi88BM4BHhuN4rJ8g98R
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1NSBTYWx0ZWRfX2FjxHux57D4F
 PGKOtGxZg7yCfUSIYdpRR4Apspg/0HQdp+e4sGL7LAlPlfwuFUDI7tkqxzkl+oRdf6N/g52miA7
 O8pec/5OtwFvHC+OLtGvfz/ztmDAiiM=
X-Proofpoint-GUID: S9vZysEBUDvvbi88BM4BHhuN4rJ8g98R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120055

On 26-10-12 14:51:59, William Bright wrote:
> SM8550 has three CSI test pattern generators next to the CSIPHYs. They
> report hardware version 2.1.0, the same as the x1e80100 TPGs, so the
> existing gen1 TPG ops drive them unchanged.
> 
> Describe their register regions in the binding and in sm8550.dtsi and
> add them to the SM8550 camss resources.
> 
> Signed-off-by: William Bright <william.bright@imd-tec.com>

You sent a v2 in less than an hour. Please give reviewers a bit of time
before respinning.
