Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486581;
	b=Pr59+5oyjMFUKf8oO8NfQX2cPDDj0IXq/GPCDlhZgXFznBQNVFRaOnpaEiox/yWOsYB6
	 SLrA8JTzY6/7TjG/Q701s08OGeyvHwbabUFxBxQ/scXYAZSAGiCXu06XPluYlJLsUHIqf
	 M2saQOu6rGQUjcTWWh3A80ioxhPKTOYwc5ewDy256MFRz++iCRjmHJX+abmzczL/D0FCP
	 7Wcu7UPGN9rhPKFZrJMzz3Vkp2bfbNJ8aLmYxuNkXU0tz5HiesfZgUc/fkj/dS+lOVavf
	 ugRyVEZCc+tqWFv4yr840ibhQZq94senpv8tSRlLIH1b3Qi0zG/fyo4r5bijIjUKdsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486581;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BvkHiyeYubNkphK+3iSkbkxhjPqzznaVKMsZvin5s6Q=;
	b=OBH8A3x1AwJvzBmDrZSvvxVgS81d/5FBNQXPgGAQw83Hd3nelRa10ZcsR4prKRxImR+0
	 VFca7OdHhJQlloSXB0k1YamJc1xfTPcwQDFbQqFbk1AJF1ecxy3LNtI+GuRL30v1jJOd7
	 RGyza5thPhqKK2IPmr0Sz4hbF90BnsLhKfNVH70ze3SQZudvdd3649m9V0Gb8jmGBwqPM
	 EKkoq4bYjmnlZ0FscxD/PrBt6sBl2Ly78a1uTZZrfT4V7GSVEmjWm5vOMGsQpcS/Y5+KR
	 e+EVG9XVOOTI2ndIazfIZGMNaQRzbiW+nKv38ZHQ4NjbfJXNLNMp7v2BsxJaqR+Bp9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TuebpQC0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dXmvX+wn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42229606A33A
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:56:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42229606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TuebpQC0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dXmvX+wn
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K7xCJj3806921
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BvkHiyeYubNkphK+3iSkbkxhjPqzznaVKMsZvin5s6Q=; b=TuebpQC0U0UNIRHD
	1V8mdIu6HgSxSNEgjIATRpxUJPiK5MhPlXTYyCjuZU6XR15wFj5mIVhp1XXm8f0y
	ZX9twAhdIxIPlADfQ3wgu/EsVVaoxQQrL91jYadcqBbFTxxA1qXI/uv+vz8UTb/2
	8wEMXlwL0tMdyVyGHSS//CA5PVCIyzfzxU9N80eU34Z7zJiSANjYY+aZpTqVQeGI
	Oj6Aa6RwqPKGmZGpe2p/GrEhrsJI/0dbCyexSOBkqcKkYAoaG0/ZbMSe77yiuFTT
	VDp6wJ2IYFNyhGSUJfzEhdiBL5itTbWTysEmmRSJWF/yeh+hlIt7PrQr2FKLaeSL
	+mRb/w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p9r1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:56:20 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91b89618384so3972366d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 01:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792486580; x=1793091380; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BvkHiyeYubNkphK+3iSkbkxhjPqzznaVKMsZvin5s6Q=;
        b=dXmvX+wnTKv0X8+VSWcrlbxSEGDFon0yb8iiXko8kYTefbE8eh5xBfw1/rRFRIDIfm
         YBTjAkAAuk99gcSuAribX/zweewRKH/a1kFELZ1taBX4ZZHsVMdSs0Xg4m+cAY1otPDh
         I9xHMo7mXwiSih7gbfUZ9ugI/IR4fUkTozuZQDVtW9rmBljAdI/3DfzH1yOahYQ5/lPm
         G/fCGkMZX9rJRuYSRxx25xyPxSz8Z7U47C4SkD70OE7P4fcZJtW4pCl+d4lhqWrOWFDy
         EeKc+DU6kbRI/0uflls+dCwTDx/Pi2A8GdJNFlaCg5Ttgwag+xv66vMgnd1JaV1fOfqC
         hZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792486580; x=1793091380;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BvkHiyeYubNkphK+3iSkbkxhjPqzznaVKMsZvin5s6Q=;
        b=i+mZ0tFCQdQObM9P72UrQJlAYwHiTkEuvQ+B/LZ/ZIPGi6qvMlfOpK4UsQqtVbVZtx
         2bmhyFspg4J1Mr2heWVSI51PdnhOTQW3VA7CN4OL7Ve8+TRlRqdz8Nm42l0ptdy9I3+I
         WDqEI4TcXY28m2S7ThE9yLhceekyKzLSLKh3t9LIA7jD6kFd6PDGwdglRjA/AYa2COQQ
         q6HWIZkPP1AGTRv6NZBLc31sK0zJQ/L7USIHO4kFKiq9gSBJg352YqCwO8CABRsG2dix
         ILK75DnYlv9EJB+iz+DcAQkAewDaXY5y/2V0wg8y9cldzffLs+ryHJ+/1X7BFgcB+pBG
         W3Mg==
X-Gm-Message-State: AFq9FYI3Nd2QSlOIoky1Fgqia2e4O20aZoHTaAZlbdO2eqI1YQ2YXnMd
	akJUE8w+iyDOA6fvLs2AEy1CqaYRIswP2H9t6aRIS0qhbdT4nK0MUYmjuA9bYi20TvW1TdWi3St
	I5ZllunMM57v5XlhIjlH1tS167awAdhTBNI0TQFvV17j98pWmbTxtLcXYjcWd1hDLAZzn
X-Gm-Gg: AYBFou2AUd6IyU6UqWDgqmLePQN/c0SYAV7/tLWBRWUnrVqO7aBNNxFcdlJkX5CElix
	yFvOk75KsM79OxuIk4HmHDuzqsuq4UwagVV0psf/AsC8YNLt+oiUPuybWpOfBAvpE18ak0O2Bd0
	fzKcOXyh/n+iv4AXNxg9fVWHawJgDXmBbC+rSh5fa7QJXqNnFGU9RrFOaql/7xVTXI/jrWeoS3i
	LBe+rwqeyey0dLqkij2vT2uon3W14pc7DV6WR0LvSc2/HFErwUgk2Jx48tRkUqKMSPR39S77CWN
	Cdv14URsW5sfOkFhEGtn25r3yY4EWfidpMiAPyC+G8IWJyn1KvMxQgdLuYJexbHUheKt6GIT6/z
	4ecir/m3VYZQ8vEwJc9eFTQ==
X-Received: by 2002:ac8:540c:0:b0:534:f411:a5ab with SMTP id d75a77b69052e-53645ff6457mr128003751cf.4.1792486579657;
        Tue, 20 Oct 2026 01:56:19 -0700 (PDT)
X-Received: by 2002:ac8:540c:0:b0:534:f411:a5ab with SMTP id d75a77b69052e-53645ff6457mr128003561cf.4.1792486579189;
        Tue, 20 Oct 2026 01:56:19 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32bc33sm462325466b.5.2026.10.20.01.56.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:56:18 -0700 (PDT)
Message-ID: <0975b38c-381d-47e6-8894-0493e0daf613@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:56:15 +0200
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sda660-inforce-ifc6560: fix
 ADV7535 interrupt pin
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261020-ifc6560-adv-v3-0-5da1a33fdcbd@oss.qualcomm.com>
 <20261020-ifc6560-adv-v3-2-5da1a33fdcbd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020-ifc6560-adv-v3-2-5da1a33fdcbd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hfKOWRul0HeKwWbKjkzRZhaX1doL4H2P
X-Authority-Analysis: v=2.4 cv=fb84WEQF c=1 sm=1 tr=0 ts=6ad72cb4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=rjRgt0PbdpDDpmAIlJIA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzNSBTYWx0ZWRfX/u9CFEBvl/fS
 UzraHVQvYnUdflGjiinls2At4w9B9fFuGUgl2XkNwwKnzwhOI7lqXbwI8ohpULDOQBKMbTzuS1M
 68NU5nrNWQHLGsnDvAMpMWhYfQcENF+UBSiuYoDJlF36rKHkqRzvpO2/oRKU8stoNEpEcFM1z8F
 gZs0LE8Iwiy6up8pLOcavyYTkdRNOFcMUXVeaC0ABojw3apAdlIpKx5GkYFxfUeqERIj/Qe2ms8
 ZqL5bbxOaYEhZ9Ny84DYJlTt9i0gxSME9omfrO8VpJMol4lhzd01XjkA6PBqWdUa0WPreggwE58
 xoe/vKyYQUKsO3EFHQDgE/U2fjPPaGgCzLACeJL5l7hKdPzoqJldKW/x46fNbk913dvQGXYL23w
 LBmBs0Al9HS92f9iPcb20CPhLZs8zwKjIvQKqOxthMIgliVwwlZg9/+mOQYcMLy4bSQHDyt0w4V
 0p1HU+KA9Dvt/a1NnBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzNSBTYWx0ZWRfX2YuKv8ib/vX6
 8o+P56u8cqrcSjgeyZvVBBs+O3Sh1vVbzvk9NJtzr4L9JfFSWl7ly/An8fAyl4bFOjsqXY5TD/7
 qQ8CHahxiSoN5bp/fs/CllBHOmOl85k=
X-Proofpoint-ORIG-GUID: hfKOWRul0HeKwWbKjkzRZhaX1doL4H2P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200035

On 10/20/26 10:44 AM, Dmitry Baryshkov wrote:
> The board never configures the PM660 GPIO11 pad carrying the ADV7535
> interrupt and relies on the state left by the bootloader: an input with
> the internal 10 uA pull-down enabled, working against the pull-up which
> the board has on that open-drain line.
> 
> Add a default pinctrl state switching the pad to a digital input with the
> output buffer and the internal bias disabled, applied by
> pinctrl_bind_pins() before the driver requests the interrupt.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
