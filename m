Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B1D2931DB
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 09:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787218712; cv=none; b=XmKvwYQ3RhnnEczxjVIhhgcDMOm59/odr4HX6l4Vge5c4d6nCn5VOKxPgS8lF+6R+U2ceMJ5k5f4ZwKWVCZl6Oe8oSl8HWTqfYIhbNCe7K4rNvt907QxMD9VR+t6uYlgpVwrw2xwzKdfQkj6pfQAPJIRWXC05w/ygUeCY01gyJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787218712; c=relaxed/simple;
	bh=nKQbp0Daa/E8QFMecrOY7hwz2JZeLzSg30HZjZCnOhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ISACe0qQkDiDJd1Zedsi5BHYQNol0HZbxPpp2Y9xo2jFRJ4F9oPbNzdOi5LWtChhe7DM1SVf9YzZ0J9p6vqmUgrJd42NCkX9tuZ7Jpod9JKNwYRL1s2o02QLkQqze+u4zWyETqYMTSX9hr43eItB7my35ef0ynIqvzFkAM813fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WvcnYpyW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bHh+laU0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WvcnYpyW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bHh+laU0"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K6Kxr7490936
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 09:38:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DySblYoDgYo7P1E6YAfd7mn1
	KljtrNAErhqBAc0/znU=; b=WvcnYpyWpZSWM1HON/To1TPby8Ro30MeWYCNLBaH
	evP/BBkCQx5Pf+ulBLXhdJfjzQO2X0EQ0Vs4bpHGuWH15zeaR07KTEzYF1S7onQN
	2zRRh895wSicD8zoscxFt2A6J82fI0mVWt7tNqdMZaZxIP+K5sBElFjm7mGmxvJh
	7mut0XatahuX6a24EiFhRGm72LNWLjAGLKyNiQlEl1yAdrkD2dxdFtCUZfPrvunZ
	JBjdsoh9S6MhIiBTDaO8LmFFrxDhvvC1RkiBeHZ4Tvx6Ets2QlaiBnJ5KgP2vNGV
	pp1I8Jr11/HpMwPJeEJI/LLuBbROpIf7roWaYbUxdZXFow==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5ervm8br-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 09:38:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930edb4362dso207689685a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 02:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787218692; x=1787823492; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DySblYoDgYo7P1E6YAfd7mn1KljtrNAErhqBAc0/znU=;
        b=bHh+laU00KCnEo6UzhikFNsKwIcnhBMYhuqlfBG6MLXlNWX3Y3O13PSL7Cm0YpFiVe
         w7STKx+mSVywSzLptzoEreHSsYUIkWSbBwq9EWzRrzKjloe7kPY9sflZ11uWQNG859wo
         fD1Fv7NlyXu8EOhz/sP7Q5k2G1dFevPq5Mj6uAzNy29lVVO29eHHkfT3fXJsfupJTisZ
         4ZiYPiUoB9B472DxLdvA/Z5l2ZikFBbmGoX0Nz8FkuItl4wV8RnD2wSj6UqEDksD5C4j
         bE6XMkD5JkQvQZRMhypSfVf45Up+xarvYSTkXwygTFdAlNioj+IYzxqsm9hKdWqz5svP
         WZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787218692; x=1787823492;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DySblYoDgYo7P1E6YAfd7mn1KljtrNAErhqBAc0/znU=;
        b=f5W1dGBqz2Ik72wAVWgxlN3KtTwKNV7H6uUoUXpjLmt+FKFLXZDChndZvb2sJvABGy
         Yoa8gplnm6lODg/BXHSbpL1NJlJCycwOuFH4mHWjvbR0IKhPNJluVnYeW3Xcq3sqvZcl
         4bSTE2rQPJxf/F23Fax+31EDETgrMtw2XLCYeTttNija3zwfa0PgZInMrYtnz9Bp7xMw
         TJ+IWrMbo4lbFfL+wOpvre0ekH4c8iGFqQNr98zskO2zlgE5xx9Nv8pxJeuYHoXXQq5Z
         sBzzA8G5pbPJ0dhF+IZDHrCDFNKY8RVAT8c9v7KFq+jdDwFSR3wOCL4YjMVhXSIG4H4c
         Mrzw==
X-Forwarded-Encrypted: i=1; AHgh+RpS0QCF5DW6o3khb0n3hZm1EyJXUDYoV/4GNwk0afHIQcDqAAGzLQb0u3PP6JM37KWqTdN0DZDcvsDM5UQJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzoFpJEcZpCDtIIEYnH6AH/nwbysDNP/EbhVdF1kgA7tuBBqP6l
	XRi84vPuY2Mn3KyxqNdryuuJaMKAniT62HytkjNBG+lU9NaR5OqCxXU5YnCn8NuBZXVCIR86XOF
	1Cwq522z/7fdj8MCd0kUqps4m+hKRDK5m3iOZjmuCJ/Vbt72yfhF52hJFCdcTWJbPj51KiCBtPl
	SpM/FK1Q==
X-Gm-Gg: AR+sD12/OX/l+VfNiuLx+CFTvcsKFuLWa0UZ6Cno4LAb4YB0y5xuarvbwrgpLzBSEge
	DtOROvZEAwLfh8/8hPh/RmRLUvj4FtARX65dK56HdrpDjGF4n+D5HwLmqY+WA5f6K6qPLkkS1jf
	e6cfOUzSouLsGZVm36QHqMXAN3GD5oSuGaQuWEllXtpMK7gcTtukp+n1nuIIR83xyCbLK23eWUt
	PFaIuQ36Cv3c76igfA8z6SV4mbMG1tcIysqj5B4vP7bPp3ULrLtUPI8KpX+bMxpiZ9XEcyy55zz
	1hMXoHeMt3SLd2lceofemU/GA1AgZ2SsTHBQJ/Ykn87CbZHfKRJ5P7wtuYY+xxV1DeQeoqlWbqf
	hfNdBP0qZlmuD4D4=
X-Received: by 2002:a05:620a:4143:b0:936:e723:27a8 with SMTP id af79cd13be357-9371e2d3809mr936586985a.23.1787218691784;
        Thu, 20 Aug 2026 02:38:11 -0700 (PDT)
X-Received: by 2002:a05:620a:4143:b0:936:e723:27a8 with SMTP id af79cd13be357-9371e2d3809mr936584385a.23.1787218691258;
        Thu, 20 Aug 2026 02:38:11 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm170401015e9.11.2026.08.20.02.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:38:10 -0700 (PDT)
Date: Thu, 20 Aug 2026 12:38:08 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Xueyao An <xueyao.an@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: qcom: shikra: Unreserve GPIOs 14-17
 blocking SPI5 access
Message-ID: <4qqhyhy5jmruelj4isbawvlifiha7v26z4hl346hvr4rc6bftk@kn3xakfvje3h>
References: <20260820085347.822-1-xueyao.an@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820085347.822-1-xueyao.an@oss.qualcomm.com>
X-Proofpoint-GUID: 1jtPDIy72XchZlJYNy74b3IDPcrdWsAR
X-Authority-Analysis: v=2.4 cv=VZ3H+lp9 c=1 sm=1 tr=0 ts=6a86cb09 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=gIkzSn-ZV6KDZrmDYscA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3MCBTYWx0ZWRfX4UYCX4mIBkA+
 1s3LDP+0ZrCaMqaVaQPWdR+sYFmWIDOZ7NtJTU212W+m1bDvYSAklMlSPJXPqbEsjlL6i6pZAj+
 jUh7dj4bnhL1vVzObUglfXaujepdLBq8SbopSZZJlFh6Imj8l3CkRqxDDKfdBOxBbzz+9KfAhax
 2B0KC43a00hIzOdfSkYlCvQ36OyBtP+oVlstG2UMNwTC003J4W0n3xRNxXa6IBYiZtjamVMgTfh
 2ZbBqE+y2DOjh+nsZ85slblowXDMKlVbQ3VrkjVVMzW1HPTPncTE9sZwY6eSmpyFIwNz4vojNb+
 1ymWcmcMBCE9vKfI0pSoAO2BZI1+BnNwr04bXZIaGH7uZ0+lV6ipMSyCwErv0+yj/tk24C5azje
 LffAh4UtLnU7CAe0GS7P2GSMpUFbfgAI9/7j7Di74wU2XJxTnuwgVZFnssP89HQmtgPRY+6PPv6
 Eu/djK/m7VlgUzDc18Q==
X-Proofpoint-ORIG-GUID: 1jtPDIy72XchZlJYNy74b3IDPcrdWsAR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3MCBTYWx0ZWRfX1/6uAEs9CFqv
 Rc0DLsiO63Nt0gMEKhWIxI+VNslFQAtPD/L9+ehQUwBLghs6FtCQw0bhOWRj2KoJIbeILQxqV82
 rb8zoDidmiDYWmmRcyKFgC3PnQ4p828=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200070

On 26-08-20 16:53:47, Xueyao An wrote:
> GPIOs 14-17 were previously reserved in the tlmm gpio-reserved-ranges,
> preventing Linux from accessing SPI5. Since there is no TZ use case for
> these pins on Linux, they can be safely unreserved. Removing them from
> the reserved list across all three Shikra EVK variants (CQM, CQS, IQS)
> resolves the SPI5 access issue.
> 
> Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>

No fixes tag?

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
