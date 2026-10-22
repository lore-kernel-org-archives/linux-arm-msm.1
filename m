Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792665265;
	b=IGDkXRJoYsXmC385+tRspb1kV6xykM/iH85B/4kZ29l4ROQsCHKAk/zZiB107EmRAk2T
	 mpg2AsuSpghJRe5aZhrfnLy/E/3WxKRYJuxKsfFIFUTHtraeZMpatBNrRmc4Ey+iZ/HAJ
	 4s4J+ZzJTUZLT3cbAd7CRLxE8zQJHuK9IsSa4RCrEJlENsGUVkRI31LDUHMkb8SvOnmTi
	 Zx4V5qb7BYzWhgnnJLl1pllru3BGMxdPzfEY3xepvAeJ0XaCPg/hXVOolqUPEpm7C1CWe
	 iQHQMGR2T6GaCrS242sqpM0lV9lSRgiICgQgWdfia8sHs9Z7f+E1SpMdRHkD+qcZgiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792665265;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tuRL21Mz7vx7Caeva9OhHL4q0LwXFbBiNe+JziOrgzQ=;
	b=wmgz26Ko7rvs1gL8b3mtiZVBEE0uEckkCxixAPt9TQ/MezDlXfuv3K7n8SDpH5IKbeY8
	 JrunYyq/QXMlveHIuQp2Ah3DkJ4ZC/V7Rr16Q+ekSA1vdI+CcBrLRig/2qWPcXhqVy8fH
	 sXyY3UkWcuTqs52c4Wj5XvP9BL/udFa430L8LHGceWbpL61b8bRYIMBSSNypJBJkxDRR3
	 k9ozNOsUdCz+lPkzWlevtsynlMk491gPbCeavA6FE4qmicI4hpsbCQ4J8RIIkjI8rzQes
	 PIdt18L5Q04O3FT8x1JrMVFLTZHWx/IUmOPuF4TZBYPIwxZrZ+182Hq7JyEyXEmdpQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kJyd3pRT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="a1h/d/fn";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0D1606A319
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F0D1606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kJyd3pRT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a1h/d/fn
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0KRK3995484
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tuRL21Mz7vx7Caeva9OhHL4q
	0LwXFbBiNe+JziOrgzQ=; b=kJyd3pRTh6yzgD/CCAOI09SdT8zc7h2QRltA8RfD
	JSvIxeeB7bDIxaSj8OiKbzb/zZ9Hyj4+1uQirrMyFYD8n8dApAmPepP6SkjV0WUM
	mbPlAstvexd/bHx61ldrH49RPvOieLjD0HMll2rhGxFDBxa4t7a+5gxlbCbjxe//
	bKMoZuw3Aa2aL74jsxd0gyDFmE3NIJqJ3/hGX5pzAIBilHX3mDo5GwVeIJ+TqEKd
	w378gGs/KyRu/24pw7+nYxocy2dhWuGINEjmcJrci5Yhr+7QGvIPio8K42ivHzDs
	4KwDvODGxPbW4nblBvnEr8+U+LBb5SmwNhqJJ1F50utC3Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ca1te-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:34:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93dd3c3badbso382046285a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 03:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792665262; x=1793270062; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tuRL21Mz7vx7Caeva9OhHL4q0LwXFbBiNe+JziOrgzQ=;
        b=a1h/d/fn2xo9X3TP3HP2JPLu54P2NW5OgG/MfqdFbPTGO7grhMPMRSrz5ZerTgvGF5
         qBSoxsc/ppWMbhYfXhmwb/bm5gJvDNIXaktOWvHQ0CH9LLUXJcwKJwzxI9hmL9uYEDuv
         eyF0iO6AxEylz5gkRIyAyCIQV0NxYQLfPgJBdO91ib5nSNZzho6GYs8cLAS1QkdCdi8S
         jSYL/jMT1ceiz16/mM0HrvS4HzbclHS20RrodEwaxOn5Y3hZYnser4+Osz9PekG7IMn1
         T7yP7APKropBYssc2bYeNiXTyPo2dpK9dF5/gTUx28KhMi3prDjWPMbb0lod7smeImgo
         e22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792665262; x=1793270062;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tuRL21Mz7vx7Caeva9OhHL4q0LwXFbBiNe+JziOrgzQ=;
        b=V3TenDcKbkaW/qEyM6wak0iWS8gK2RpgLf6hHR9M06a7eBa7/1/qw+GjrfPJd/O1pD
         4GDRQwHLKji7CWhPENB2PLuEFaLuZDEKEITRXjusFObGVwgK4O7GB8HgcoJU+Ed66dqp
         CkdN6IJdyUSz8fvCa7L1ceEwa98YE7627b8+w/V7Gl9IdrX2OM8lNlFk0kPE6uaFiFHB
         T3NuH0eKIAAP4dL76gArIOk2d0HzkrrPoQ4N55a/KIid+h+hWIDhAGifQsQuGz1PhlZb
         zSSnwxQT9Z79tPxFBCia7RHghysGCa6IJBAmhC9L1a1cbHdV02YFP7vdSpW4CRYy8Uc0
         EW7w==
X-Forwarded-Encrypted: i=1; AKwUvBy/zdiavOLeZygpOKWiixBvswPl46miMDzcDfrfMFuSsora4v1+ZQ8hjN/Ttgoy0q0TyLqBOGGXLMZ+9sLp@vger.kernel.org
X-Gm-Message-State: AFq9FYLoIRiy3TZ4ttCH0nosXjgUPQz8P4Rg2ZSZvWNk1eIu/QE+4UUf
	VLIQ5euy1YB4q1W3fJQO3rKmRoWi85V2WZ595xeG2vOj+NpM/UELW1/BQApG+O0fWk5EwLyBvtd
	F7bJCeUbRDMyCUeXjwOj1WATduE4hD8bAYS4onrjcXQUCjMwDKPIMSuo3pla7AuMAqjyO
X-Gm-Gg: AYBFou1Xpp5y4Aav3bRi9V8THwgOPiGipZ+yHLfubSUSL/S+VvaXk+bFwzxLh73CUvq
	5qC7Tio14XEaeTPEUvftl4jfLdhdJxc6ZXPU6SRYiG0L78AkmHuwwrOFXxwOMgdqr2UxUlrl7QW
	GrDUxDiPczs2nmlpyC3YC/5hmA9+Yq6F2xP7Kn6gl9C9/e7xrVNA3Sovk7iyCuIcbYO4UIHGzAE
	1Sx9D7yOcN98x+gMJ5bjruo9I82ToT4zI3795jEI2Dls9w8aqZJpJpwsmPiN0xzq/74KSEm8USj
	gvwwL6a6fWm6I1Cnx9jUemThEutIlnl4WdSulVE6BLzfoVpbWClxZ8a9ubNNZn2bRrQpJ7cJ6na
	caMpcsIFb4H/e5yRmaUCTUQEwM1xIqNxpnCXI9KjkScbeBx3ZmMtKfWJLH6GPA3wM2Q5L6yx4ok
	hVTKe+9iA/2aNj
X-Received: by 2002:a05:620a:294b:b0:93f:5445:c667 with SMTP id af79cd13be357-93f57f6f700mr868120285a.55.1792665262401;
        Thu, 22 Oct 2026 03:34:22 -0700 (PDT)
X-Received: by 2002:a05:620a:294b:b0:93f:5445:c667 with SMTP id af79cd13be357-93f57f6f700mr868117685a.55.1792665261982;
        Thu, 22 Oct 2026 03:34:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f4e0563sm7635571fa.5.2026.10.22.03.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:34:20 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:34:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] arm64: dts: qcom: allow SM[456]50 HDK/QRD boards to
 play audio via DisplayPort
Message-ID: <5a7wc4hqox6gbpdkttgbtwkk4rfohe23lajlnydk3sl3f756ax@ywultzk2f5xq>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
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
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MSBTYWx0ZWRfX5ZXno6GMOuD/
 yeQ9vLcUSsJtB6VehA854Z1da5Ft274aUBTvQsRjvI3VHH8Sw2m9RWF1inS5kmsFVvmqTU/NBEQ
 x38nL2aSFyrR7GnsMku9O3ayYzlxz+M=
X-Authority-Analysis: v=2.4 cv=ReAFmFtv c=1 sm=1 tr=0 ts=6ad9e6af cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8
 a=67hlTMCujxtZ4D9r8sIA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: zmX4yw09Dd9mLdq5D3SFckOaWxPZt0gv
X-Proofpoint-ORIG-GUID: zmX4yw09Dd9mLdq5D3SFckOaWxPZt0gv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MSBTYWx0ZWRfX4DM2iorTIVMd
 2QllV6t04PNs5ar9MI+vOA0Ca8xSs23b7/cDasGb08xuMPvd13CBjpTlgseSB9vN2Ulfm9niMCt
 y4eKBouoHVNnZ1rNpeqYQIbDMuFhmUNWB353XU/OSD6prEOA/p7736YLMac6fq2wz2GVYw2BETW
 qaHCL4qjMe+ICuu7YjznxV8ml8C7mc3gOM9ODtL4tnxgyz/Fu041ylo0WoIzMzpbn5hMbpSZFlb
 o68b71w0MYSQMRKFvw6CeQHJlqY0N8ZVwIBJgLApbMHFlXu0oarwGg+TVPKrUO/LRzR3lRZEFm3
 hUFZbQVoQjLZNQEMvXrCRLmDdK2r22Tu99Imig+rvfN+U5hDWFpzsU7BLwIDFCHFwq6Upaq0QfC
 THCViKap1XGZTwQn5OT1cElSLLdq3zkIy80KyiXv6wMa7y3pjg7FmlH/5mnxXhKCN3Ivm+oP9Bi
 9u1t2jl7Vu43AYI4XtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220041

On Thu, Oct 22, 2026 at 11:36:20AM +0200, Neil Armstrong wrote:
> Add the DAI link needed to enable audio playback over the DisplayPort altmode
> outputs for the SM8450/SM8550/SM8650 HDK & QRD boards. 

Does this need an update of the AudioReach topology?

> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Neil Armstrong (5):
>       arm64: dts: qcom: sm8450-hdk: add DisplayPort audio playback support
>       arm64: dts: qcom: sm8550-hdk: add DisplayPort audio playback support
>       arm64: dts: qcom: sm8550-qrd: add DisplayPort audio playback support
>       arm64: dts: qcom: sm8650-hdk: add DisplayPort audio playback support
>       arm64: dts: qcom: sm8650-qrd: add DisplayPort audio playback support
> 

-- 
With best wishes
Dmitry
