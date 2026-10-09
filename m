Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2791647607C
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 10:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791541719; cv=none; b=PLtpzebC7M/48InKYB3eKkQdlZFM+OAKJ+jLMkj3Ap22JdzmLVN4xk/gwYrr4g2X4ZiRykIrtvgYwfFcT3MMpULSRDRwTk6qOsbtikrTizsdOPTd4uKZRP0Zt4oA9KzpGRMAxq1p/TbyBP+dUK58sCwUGF7l5oCOSwWg3CQYYrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791541719; c=relaxed/simple;
	bh=z8x0WcE/7xm7pXjVo4mK5xEsBQsqge6KlTXf75BL4CU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zhja46iPDFzxH6SxCdQhvJMfDMlUaKQIbLP1x1AAynDIoingX7pnhnOaiL9WGh+E2zJuC/f4cotoSm6Rre+K26yw66Ig38y8Ab23HmHOnqvNLXpersOMLi5fw7AOiYvhHTrsN9dEfMpPBwfHyGkF8QuTwufb0WQdhf6YUJxJS9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OGQkYIQQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D8Lo6aCz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OGQkYIQQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D8Lo6aCz"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KIZb404386
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 10:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z8x0WcE/7xm7pXjVo4mK5xEsBQsqge6KlTXf75BL4CU=; b=OGQkYIQQ4RvfM+Ap
	IJlSx7rqsMpEPPnw5aSWZpJ5i8aY72mZpAN3V60qPKBdauN2p+oLnmUAFl7gzeaZ
	s5ppFAIMmqzBGtRLXUqWU3f4f6/ZdA8DZQxvwvNXPCmMAuZsWqy4T/QExt80chBI
	LYNQS05udZAEds7J+bAe/XtGPHB0LD5qbc+LNgdeWAepI5m3QsUfyqINmT/clUYQ
	UjZ2yzj56ZOjh5tNMiAU0lvvHw3qsNbOUPWGGeRtBzSYHZEG+NeAcwk/GU3a2nok
	2xC4E5pB5chtds/3RjP1ItTF6IaDzO/KUvNfNAyx89GOK3+eN8HT7n3eKyCDl0VA
	Z4Z2HQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxk34yh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 10:28:35 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so13240345eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 03:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791541714; x=1792146514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z8x0WcE/7xm7pXjVo4mK5xEsBQsqge6KlTXf75BL4CU=;
        b=D8Lo6aCz5BXOhVS4sXBgiO6dmOKPO7fsQECrlRqKjb5z6DMKtIkV6Fsw2qQv6eGtgp
         oKmJi6q8ZOTqtSSBlP9vDMtg9x4b6KR0v/eYeMoRjnOxRkrupZW2TY928uxXnxHp4ghp
         /gYIMDN9U+Z+1Qy7asqt1xt3Z9zXOEsxunRbGlBLdIVicjOTTQiGfYCIExkMJgf4VxiF
         UXO/HSD/jXDNnEP8xchU9A0KzgGa/4tiYMYHx3sUVrMjPZpYl5S9ieTRmgrEHUbpI2un
         /GlgslvRumR6czV8LR1f6+/5hq/+1EE0FUyaF7hrKW3vze5fzsle0WA/krsTyp5WnCA0
         +CgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791541714; x=1792146514;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z8x0WcE/7xm7pXjVo4mK5xEsBQsqge6KlTXf75BL4CU=;
        b=KtW2OjYAj2PC9r1I3n/dU7z40K4sF828jzes8KF1s9CD1x/Yc3g/rPehOOtVQ8c2P9
         tMtneMukSubCKdnLz1IfmPfcu9ICDB9C4OBK8U6iJjuNhuUUPJyJYprZGZ0/cTf1DudJ
         IqS4mg1+nA0CKtmtjQ+gmcDEN9ZxhYcT/5UASCXHcMBM8FtGeRCzC+S78MlJNLiScfye
         S5DsgVnaTNJqpSUUtczCJ6Yh4wfD03Ruuxl3Yyxzq6NK7xOziIKnr/r1QDxuOwOz/cku
         KZwnlp2W+VdAia10ml32/5QjCAHTZS4z+8VnHC7975R6Op42qT2dpA7n19MMQySmPxJ1
         1sRg==
X-Forwarded-Encrypted: i=1; AKwUvBzLsuQT495zXdMvgBH6QE9T/BuOJMoYuhxhYB+fcyoAAgIKZPIeCazx7Q3D6H/eblx6TZql7/Hu9z5NeE5i@vger.kernel.org
X-Gm-Message-State: AFuF++mI+eXdr9dkjD6RXswEeLj6V3j+7PYhPzv6bAZsJ15GkLAbkp+d
	6NgNZFv/yBzH4OL+1NRUD0pxXrAE2Pf8kaj4ForGHMe5WUUOPcKsyvInqUEl/MxhkY0o+X6SFYB
	jz55oy0H6mAjrfrG1Bi32RTZMu7UVEnoSeDBlQsgMPEXBB6diIom+WR9+HmWls3CTwIos
X-Gm-Gg: AYBFou3c+M4fmd4feQ9OJVbe0NXVzqC1ak2BHG6QbXn7PmZlRpTe9ioo7k3ZrTjJsSU
	YjRywqHpP8zQStdQXWUBVMEKTmLPgLgdqpvDmC2bJd7LEC9gp3bT02fHnKrUbHI3cesRmt4adFY
	HLEj1tAgqGvPc8LBNuIYGiBrEoINWYKmNfytQiiVmFpp6MYz7t3liL0xs/iRe9QfcBnVbYXdgiF
	k35MPSVOm3+rjCvGnEa9CvPWSmdLMnycxUrxFSEExmW2zcJElaOr+Rsj1pUACN1VAAcXDhtroXK
	WNOrOZWPwjKbyVMWQgJ0+zfG2+cpJ+P5yTSIj6HHjIqyQQEdc0Zq/FqifD5Fui5jTIPqJECDkK0
	uqlVNT8svJV422J3dmDw/yJHrJrGPPfge4w==
X-Received: by 2002:a05:701b:230c:b0:151:7f08:5961 with SMTP id a92af1059eb24-16a54ada8e0mr2160622c88.4.1791541714524;
        Fri, 09 Oct 2026 03:28:34 -0700 (PDT)
X-Received: by 2002:a05:701b:230c:b0:151:7f08:5961 with SMTP id a92af1059eb24-16a54ada8e0mr2160580c88.4.1791541713961;
        Fri, 09 Oct 2026 03:28:33 -0700 (PDT)
Received: from [10.204.78.217] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a2f17feasm7713134c88.9.2026.10.09.03.28.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 03:28:33 -0700 (PDT)
Message-ID: <1db319c6-eb4e-4821-85ae-f8ea5e41d28f@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 15:58:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: display/msm: dp-controller: Add
 Kaanapali
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
 <20261005-kaanapali_dp-v1-1-6faeac3a6d59@oss.qualcomm.com>
 <20261009-subtle-tricky-locust-b09108@quoll>
Content-Language: en-US
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
In-Reply-To: <20261009-subtle-tricky-locust-b09108@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fKesTpae c=1 sm=1 tr=0 ts=6ac8c1d3 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=n8cVz6FT7eV6zO6OkoAA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: DBdAASvsKz-jAQ5GNEAvG0BjW7VL7Q95
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0MSBTYWx0ZWRfX1opaDfCZEAoA
 x5IjswrqGy3OUJIb22O3TbgnosZ2Prb81NUyWeC7/axz0mTl8S31zuQlisBD/Z3eDci4tQMd/Qs
 bsLjG0dv2r84ryft+BL8JSRlGKmqZmE=
X-Proofpoint-ORIG-GUID: DBdAASvsKz-jAQ5GNEAvG0BjW7VL7Q95
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0MSBTYWx0ZWRfX3aAgKFMT/joY
 nuAaorMhUSd7oa4CAUtdoYyX/JKznGWoFuAi6BxKRs3/XwfjdxRM6+h+3NT1XCRvv3GDI/3n1hT
 8ue5NpRy6auBTNpJ9J7DRMCapZZwu3lhgqrsdYzC90NRoobr/o31oioWNwjt4J8UeGmINmP0UjW
 ts9R29D7bB8bfOqqrZiQMDfJ/igW+4zh5hVDw1Xki42205G8PVdz0HeMlWLFsu0cXn27LY4yluP
 7noIp1l5Slnf6ucE/lORDPvnbG/IxShiwpUYh8sbg0KW5KqkhDW+9eJbqFf4CYqRRUf5UN8/SAe
 3RsXfl9SJZixFK74hF+4k6OpU/dHZTadXr4HVUAiWzHLwM+xq9eQ309U7FONVDcZyd258duLlM/
 pAtNREykZRKaxIrsolIUCAYKRAtJPuxa4wtUJMCMqM2tSdTotG/r4cTr3N9nA3/Q1dqS4rhXz+n
 Zv0v8JBjCc1hsGJ9d+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090041


On 09-10-2026 01:01 pm, Krzysztof Kozlowski wrote:
> On Mon, Oct 05, 2026 at 12:54:26PM +0530, Balaji Kalkonda wrote:
>> Add DisplayPort controller for Qualcomm Kaanapali SoC which so far looks
>> fully compatible with earlier SM8650 variant.
>>
>> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
>> ---
> Dropping, unanswered comments.

Hi krzysztof,

I will address the sashiko bot comments, and it will be part of v2 patchset.

Thanks and regards,

Balaji.

>
> Best regards,
> Krzysztof
