Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419B8388E74
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 08:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028828; cv=none; b=kmRkiGXH81OEvKQJbN7xwhsxh9U9CNXQyz/j/qHPW8hitkuckyrssTi9eOG7oc2S6xiF1dXhFS697WRT3mk0CwWOYB6UcccOav/oYo6l6naK7bPOaLLyqueANCKLd2VFyeKvsIme8BbVFaRFegpmpAoyPamThUlFrkz2Y0TZIIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028828; c=relaxed/simple;
	bh=CZumYX9eKEG+3MyRMIeHZ2CqGtJVgd49p+sc5m+sVU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ufS1OEHrSl/Rk0ne1n8x2bYjiQb9IsZdKH8+q3tUmxh4nd4G9EFYpSV7QEfgE7dO89BqdDYVtQLkD4QHXRwBBbvcOW39+U2UWP0Ocx27sfL67Uwz9ZqAwT8Df9iA/m/ku+74iS2/eBIopdmpZB/hIY6SVNAufbZ5cKE5ltLTUHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=crMc8DjE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GB2deC9N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="crMc8DjE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GB2deC9N"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5GZgQ4187833
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 08:27:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hwsbbABhCqD7YrBomZaCutoK
	KqKwzQ6UY09UG4GpRbY=; b=crMc8DjEAyr6qLp7n/ZagT1LKa3EoT9uF60hbAxz
	PIQXQ8Yf/R9GS34mIsbENDxisrPcNXfC8Ben+LUca0uZgaz1GEy4E5yx56e3ql+r
	Z1S35xt4I0gn3GykQrQmqQIA8e1HQBNK3wLpXX/B0/zrvgxfzzkfy54aAArPAfRh
	GL1CP7YZFOV/ERMKkYfaU3vuGVPYbaxrO7Ziwx5dfK3F3zHwGZ4wuvS/VfJ3xn6T
	Ia80vRTJIkZ6I5pcm2JkJDxYItA0vNe11DCFEasUTu6M5gZTfFkeWF1vuyC32ewP
	7Sz481WZ5i8qpcCXxpKwTdxDmVDEzddpxrx2e02Xr9ATig==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcygtv26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 08:27:06 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc132709c76so9501792a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 01:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789028826; x=1789633626; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hwsbbABhCqD7YrBomZaCutoKKqKwzQ6UY09UG4GpRbY=;
        b=GB2deC9NtD2vNWDFz6DUqYwxCLLLuECHT8aiZzTeNmV8jossLdOkZ1cC2gcC6ct47T
         zlED5bT1+TRMe1flM0jilUKgS4/fCfpRZsn4Ak3/6lzIqYH8cnr+qK6yB6vd1PZZngNb
         A1PSTDHkTfezJtVo8VWTdR+IU/io1TQ3bQHnQnQn8hB+e+U5EWsSh11JxC8gPp/hkrYN
         zBKrw0HRmFONBDrgUKlqLfJOiBg8U+VOHEdGYTq2XgBuptb/EGK+mSy6TebzwBqJSjcK
         /M6mvCx0vzhqueMGv6J5fqeXFpBhkxPlX7bmyke7cVw0uSxkeF0Tv4m5bXI3Ddi47f/7
         jXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789028826; x=1789633626;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hwsbbABhCqD7YrBomZaCutoKKqKwzQ6UY09UG4GpRbY=;
        b=k45Q9PcwoKp+kAmhtr2I+V5RT9JfAvdYzUQ0PJMDEWzpgxumj+HL1lGbb4/aY+eiv9
         qv75obzDy5FiLDA37oJq1ntT8PcRVG6mPFvfK+98iampYMmfWG+WpOG7Hn9PZwmjaF3m
         R2XpPBRlp3TyGgrZgtUqep1NQyxwbRn7M6ntT331p36J/Jiu2j1K5pt4JXtYuZfcFC0i
         F21mZ7iJTR3xOhnIdQhNxBa7XFCGGvchLCNBQKSB6a/Ay81zTQZfBaCldbjEgTykOA8z
         DOpZFXzU/ifbrOdwgO2C+pXlReUDOtdw+I87pQR9S2hOMPTkJx2GXB/i0fq7ilUVVAEG
         yP7g==
X-Forwarded-Encrypted: i=1; AKwUvBybHNi4tW2wK3KvaNAuMc6WDcihz175siQLH9YVp2v0ekOI5pUVyldjCT8uNGYv9zAamEuluEGeuTwwyTSa@vger.kernel.org
X-Gm-Message-State: AFuF++lX2YhQbT8bJPkFGsGS35JVb+yEq4DDuxK9CCf+Ra2RkGRlSbvp
	Z57/5h1SVDV5LjiS8YO+4FNhANlrYNC2mWEafiZpzjRAZLE+c4KwWP4UhfHSVS27pg3k9uCt3Az
	LRUrJU0Lf48W410cD6SVLFC7lz/nDW8xPl9f82PH7Vgrwj6kKtVQeGIQCUoSv9VehLVHz
X-Gm-Gg: AYBFou0eOKR4LDHzvWQlCIYGKqagMdhusD0MUW/WTi9/iRJcxSzoJxaTpVj/43t2bdq
	9MvUjKUr5MBMHHMQMbqBoLXd0QS4atW6cmSc8LzX0a8dKuI4mLVRnlkl4ritlrkUmeNyU7DoU1x
	sobDf9eYv4/XDX9Rjm77S/CYAcDe7Faa6N+I3rCXk16m3LmgasnVhUxnx8mJ6GwZwWSkKUR55WS
	V2M6fVcv7GLbAjHtzInJ/3Z5qeml9wfF5ddEevT/B0a9j2xrCgIakFNTlKyR+fnba2nKJg7pzoI
	OOLNXQCxaj5kIBV//sHn28glIeuJuMBuMJ6pTdILm4wJa1aJheicRlDcNB9AxdadptDA7PhBbzu
	Ihte1G/AkyqJykws88n+3Ziosx/g=
X-Received: by 2002:a17:90b:1a86:b0:398:ba96:1afd with SMTP id 98e67ed59e1d1-39d709dfda5mr8554924a91.8.1789028825627;
        Thu, 10 Sep 2026 01:27:05 -0700 (PDT)
X-Received: by 2002:a17:90b:1a86:b0:398:ba96:1afd with SMTP id 98e67ed59e1d1-39d709dfda5mr8554868a91.8.1789028825144;
        Thu, 10 Sep 2026 01:27:05 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14340a69666sm27957557c88.9.2026.09.10.01.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 01:27:04 -0700 (PDT)
Date: Thu, 10 Sep 2026 13:56:57 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] interconnect: qcom: Some defconfig/defaults
 cleanups and improvements
Message-ID: <20260910082657.4egpdfaaqm3jlroz@hu-mojha-hyd.qualcomm.com>
References: <20260515-interconnect-qcom-clean-arm64-v2-0-adeebc73596d@oss.qualcomm.com>
 <20260909062907.f43ahkic5bnv6qja@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909062907.f43ahkic5bnv6qja@hu-mojha-hyd.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA5NCBTYWx0ZWRfX0lrWTX7oy+dJ
 R3nAYm7kvK2jIXU7jWg6E833CiaYaYRZklvYNrgikmZpGs81QPxSR+CzrYKWXBEya9VRUnCb0/c
 RMf7LJ4jmDyCkA45fLmYtaDcpSjMMJgUf282vzqlrmIrDcAhOtzLKbBpiOSxAe5PJIzPxrnyj/D
 d+oa4b+v3sFyeOpA6wv+Q1V1UoqeMc5/YkaHqpTxv835wuXqLUMlx3Le9wivXEYjAyuPxt7dS6s
 RNhTHOwmsm0j6uOhM0RiZIHf6euojr7j7HqmUskW4XkrtI4mLTqchHekgARX115iSe+gQPkJX37
 Up3pfryV4ctKYqJ0+Pd7Gt9ptQi/+KWR32Ty75u745637n37O1pfvPs2f/+HJ//Byvtagu9OrSU
 6nnToC5H+IRLIU8cKEVKvfRJHlM6RXm5Cb1BdV+nBaPVCzGh8genNy0ixvH2+Swh4UL7wPVeb1D
 +10uX0f0S2CY4J8DMBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA5NCBTYWx0ZWRfX8djPNy1QhRMk
 /yoQV0LzwAFu1ECwL3GkBnueSZGGf9VEZJvutOT5EhSQSyfUr4kfl4u8NuuJoGgvERrx6+6K+KA
 8Oj5VaYNyco3AbButxNpbmTcfo6HiDU=
X-Proofpoint-ORIG-GUID: xM9eZ_h_Of6s93pPrMg9FpsOQNaBt77y
X-Authority-Analysis: v=2.4 cv=VONIDNPX c=1 sm=1 tr=0 ts=6aa269da cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=lubSgy31dtm7KxBdwZsA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: xM9eZ_h_Of6s93pPrMg9FpsOQNaBt77y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100094

On Wed, Sep 09, 2026 at 11:59:07AM +0530, Mukesh Ojha wrote:
> On Fri, May 15, 2026 at 02:11:05PM +0200, Krzysztof Kozlowski wrote:
> > Changes in v2:
> > - Patch #3: Switch to built-in for everything, with explanation in
> >   commit msg.
> > - Tags
> > - Link to v1: https://patch.msgid.link/20260428-interconnect-qcom-clean-arm64-v1-0-e6bc3f7832db@oss.qualcomm.com
> > 
> > Similarly to clocks and pinctrl, interconnects should not be a user
> > visible choice.
> 
> Is there a conclusion on this series? As I was depending on this series for
> Hawi interconnect config enablement.

I see this does not apply on linux-next.

@Krzysztof, would you be sending a revision of this ?

-Mukesh Ojha
