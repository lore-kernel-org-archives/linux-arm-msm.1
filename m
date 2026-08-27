Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DE53A9D8F
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 11:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787830752; cv=none; b=QeB+JoRSWWC599UlEZUh9w52T1/05aBDY0WPaHr5lrcE+QY21u7qShxjPucxxrC1sGBuYKxCWodEaDbESdafLXkP0capAYy5M4p54Se1JJc7rVv4gXfWd4UTwQvD65gqc3qL1jH20NNH/p1hcZXsOiQJlCJJHf5cmQOfRrDFFfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787830752; c=relaxed/simple;
	bh=jwoWm3TgRVzSKcFItDvh5nfmhHbHsJv+vWqf+nJirq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NSGdmcXDub1EKaY45Sm48usXuO09lzcUlj+kKEZdc/8aVfV07JzqKPdiGFEVyHk5V3i/Zdfse0wknZ78hIuXDTINjVaHJLro/P8YpNxk8YjVtH8TgE58y+aDOqONFKx8O0CvYbbQprar7jlS0JJFgxGNCVMcHKLHxvp7spvTHnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XOzfhQtv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IMNz773j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XOzfhQtv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IMNz773j"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RA37Vt3525480
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 11:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dN6Da+AraTnD64BnmuT/kJB2
	ZjkAMZ09+7U+VzYVeuU=; b=XOzfhQtvRY6O0X+UrQGVSQ98Rng4l1+kP2ldRhmZ
	txMIOjClRV6nnfBZBoofmQytUiMiUcEBAP+eBvZ473S+cbooh4NEgX/tpkd23f+m
	DfX28P23Jw2oI6Pw8FI3PC4GEK6DQCdpfUrYCHqfjQo0MTZWQMKeZN2Rl41Qsqf8
	4B2IIfhGmBKXGYZwVrASYSPA5zkdA0hnZkO0D0s7TkJDpi87ZX6CNXm/bVJ4HxBK
	p9VBRX2XAy9EHFRWjFFajQSdqR7hWyCMbm3LPG20amuemh242sa/4npEinaLu0TA
	hFw4r/gGd4euFY4Z6nyQXw+TgH2S5i6uDWLmHgNkLdRe4w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gak560abm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 11:39:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfe3fa93bso312491cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 04:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787830748; x=1788435548; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dN6Da+AraTnD64BnmuT/kJB2ZjkAMZ09+7U+VzYVeuU=;
        b=IMNz773jpZJOaVtUHxNTV+VhHn4WhXNbWOuTo6bVPn9gYY8kExf2nXQVcAKHhO4YJD
         +nuQFuJzR5ZBI9sa6zqxIqW2ooEXa0QdQgk1DOJqk2NAc6QFA/NKvuPgiNhAnzxTkVCk
         /wGV5TZYO5iJd2QdgTb66RI94p5rSRCSCN/ZwU7W41UyGtW37bKKruvdST7s68WGQEYx
         tAL+xSaV6Nuwv6bUllBx9YhgOQsoLZxmBdPAsxVzRAjGQ4NSam80lYGy+Qhj2msK9P6x
         4GqeM3iOKxjpXt3Zml3P8a4Uc6EzaFkHaHsHybCtQazuyunMMvQhgFQpU8jL1CR4p9oV
         j+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787830748; x=1788435548;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dN6Da+AraTnD64BnmuT/kJB2ZjkAMZ09+7U+VzYVeuU=;
        b=SwO6XYYf6KjNNxptp+lGPC/Wc7Xgvl9a2LaGIJorXbqtyAi7Tgjeep37sx3lUgpwn7
         ve4IFWP47tkTPyQKKxf3BT9k4cKttdCfdIltwP6zUn6VD+0QJjPPFIyvV0myqiTtne/k
         19SGUeQhgfYwDRtHUwBr1oxhCSNvFhWikK4Z+Z8S/mMq+UMt86CXV4GwCWzmJqrqdc20
         sq52dNR4FBqjUiz/MRMSjpG8iIhCmBedMFTgTiXKvmMrXKedoAGGMUV7orut+PAy+5zS
         hafOAiqeTwnsby9WA43V6mBdVk0pgvdJkwDrZJgNnDIcX/2fnIvb5u1mPR1pk7O+4Whu
         zyZw==
X-Forwarded-Encrypted: i=1; AHgh+RpGdd8K9Y9A/UtDFk8GkNvc1+T3082hiuFjE0dvSlCFFCdLp7KJR/0Lw6x7FkosrGFHRQHa7AW8cvJI5eqz@vger.kernel.org
X-Gm-Message-State: AFuF++kCfC/FWQS5ZOkyGJwQaVi5wLPrH38QSS7ybzdWE0DgQ/r7PH/k
	5Sh7yI1IPVM4Tb3Q1XoGpnIzHPjAlzyVPmOOedsPdHPUeLWu96Q4JfQ5KZXIOaRlb+3h2qr19jL
	EuCyNfRdXteL1WD7pHfirOIRDtZ64xOzZjFKbhgYmvoqGCVbOflmptOyx040lYhBxi0Ko
X-Gm-Gg: AR+sD10AzAgjZj3nDpiH7+yZryE3Wipw+zkqpISgtsc1q7a4gx2EjnfHqGDQVI97f/2
	5bMyFgfQO50FylJcV+yvvgSR0dXaS96PKQghthIQF84Qn9gxHVJHmN8+nQ7yqdi02cwvFzQVQTs
	cyhsmbSwhtgJtklsiO5p14sGqhtw9W/Vpcdsqp2qqNEs5pjsRJSXrXl5bHsL7vZnbmgJBU75tEf
	Z24i5UJJfKbwoQlXQfBD+baDoQJc7Eg25by0KmtmVp1CPmhszQLUCkYNMUdEiiO6vind0WuR923
	GCLvbBmpn6pPDg19sjFM8FWhaSb1RPTAJNfP5zPZboQN9Fkp54C0tIYDeCVwR2S2IVF78OCb+7R
	0wfVCDnqBxRRD
X-Received: by 2002:a05:622a:1108:b0:52d:f12c:59ba with SMTP id d75a77b69052e-52e4235cbe2mr147377321cf.33.1787830748307;
        Thu, 27 Aug 2026 04:39:08 -0700 (PDT)
X-Received: by 2002:a05:622a:1108:b0:52d:f12c:59ba with SMTP id d75a77b69052e-52e4235cbe2mr147376601cf.33.1787830747714;
        Thu, 27 Aug 2026 04:39:07 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd5616f7sm69152135e9.2.2026.08.27.04.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 04:39:06 -0700 (PDT)
Date: Thu, 27 Aug 2026 14:39:05 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sc8280xp-x13s: Add DP0/DP1 audio
 playback support
Message-ID: <vkspzqyss22gyus37upq6hd73tfotjpdrgmhstcvexi4bgfswk@mndm24aug54n>
References: <20260827-x13s-dpaudio-v1-0-da73414c6ab5@oldschoolsolutions.biz>
 <20260827-x13s-dpaudio-v1-2-da73414c6ab5@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827-x13s-dpaudio-v1-2-da73414c6ab5@oldschoolsolutions.biz>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA5NiBTYWx0ZWRfX9he90DsJ/GHq
 LUEiK733xeTXUVTBbHJVVC2FEfvFtXZdyCQLL5rSxkASL56i5+6K0VK8WPkIBjRwoivs+N0y0Tt
 2+vbMYQPIklOfXuRcALvTJvgjgjZxc0=
X-Proofpoint-ORIG-GUID: D6f-1gXG4AfgQx4yNQzw32TfLfgH4X7L
X-Proofpoint-GUID: D6f-1gXG4AfgQx4yNQzw32TfLfgH4X7L
X-Authority-Analysis: v=2.4 cv=G+Ms1dk5 c=1 sm=1 tr=0 ts=6a9021dd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=EAEWhcUvtLHaY9PztCYA:9 a=CjuIK1q_8ugA:10
 a=zgiPjhLxNE0A:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA5NiBTYWx0ZWRfX+Emp8lE+5nqR
 7VF3fjNDfFKgKPlwMVMlzxrsW1qZqHBPxPb0yBNFt1YtRO3a29KP4IsOt5UIEupLGlejX/5qjyW
 2v1pTTM1OWsJM9HsAhryWOyuP0lhUzGCjI5vD6bq5NkUQoOOabp2S7wAjUnH8M6liGPoeqXxFl4
 mSX8j9k8Sv9KcGKiTLpmtjPwiJHdvVOlkBE4wVyuBsVopHS33QCJsfgcmt9lZABbas5pc+kPXcP
 5ySn8ZzPoJg1BUdMgojTerJiJ0Cn2MrziFcnHvVce+Z6KG6L6vyWydP3hcGeyGXzWWTFi6HUlAW
 6JaFQZoXiqfIhzQcoe5DCLG9yXBP7jajeB85SXzP3ZIyWPey2OjaXl4Y3lfy2RDXtr/PfRVvpkH
 +CuuP99Bohe1bDPOvSwajOWzbRj53QoBh63IBwDqr5wXMuXTstOnlU7WHTPsIZRuGvcZIPJMlEY
 lFrX2X5RLLvHnsCs1ig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270096

On 26-08-27 09:52:49, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> The X13s sound card has no DAI links for the Type-C DisplayPort
> controllers, so those playback paths never show up. Add DP0 and DP1
> links using the existing mdss0_dp DAIs and DISPLAY_PORT_RX_{0,1}.
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
