Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793864785;
	b=v0WwHar8YbBhfP53JBq+7uuyTM9UkELuY+kle+stGM7GXs1DZAzWeZPPw6GHl4rcZFW0
	 GfhE8xaba8bN/FT+L2cYJg4NRuf4Qw33IysJi9QUK5el+zXeZoOrO055RThMLVeyVpyRp
	 u7eMQRHs5ke5T/oYS7xsfg1stT7FaOftrJPZNWacP4z5tOYziTc2A2ND6fvBMHzgbpCNh
	 qkrvMlQ69jPzFcu5fYj/pDtsQdGhFQ+YStUP/Rbr5v3eo4Ic+gjHpshX0CENu440BBH9o
	 JOxbrLgGCfD9A6OVMPfjHgPo06cVck1Jpn8p1oSJJcVpd7B6Mn91w7Qy5LB5pbxy6WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793864785;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7hmEknDApjfBB760FHE5yV7NCo/d+7W5Ac06Y52WzTk=;
	b=evIJmrPS+OuVH3VIP3TAEyd4awhJps++g1Tw9ZzIFd3vd9xoHHi7a51WZij9uOFNVjia
	 NDMOp40kNF09EtC7oxAJ0qbl+hgl6205psWmWxhlMn5jLlGh+wQZt/nRNvjyM0L1SDl7m
	 gszcf3kpZeLzJf+6bYCBWSW/ZvjZbkoSUtJS3SOtt1QDtV2L0ujF0lJd3aW3aK9vje9xT
	 Jkqnmqq+S1vS34DPEFnfKAb7IgJQXwKWuoe7keYyWWcjsxBoTRT3UenNbHXN2RVHdhK+C
	 9eSGVhvjIoei8Y4RQG6kn40NB9cxYJs4oMvcYDEmgTQeId+cgglY5csvqcQKp1qg9cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ny7Pn4T9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QalpQnIF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE744606A326
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 07:46:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE744606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ny7Pn4T9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QalpQnIF
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UZ5e595357
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 07:46:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7hmEknDApjfBB760FHE5yV7NCo/d+7W5Ac06Y52WzTk=; b=Ny7Pn4T9zNTbttOf
	S5u4oGKy5yo1pVDCEdksBS0LxD+/oxIbFhBrki0GJSDGdvUWj5YostoFvUy/tLRf
	aw7dGtHJpgn3pcVsgdixt2kdChsfDE+wRD9m9sA6SZxSgGP83Yxt5r3szAB7PSQW
	XhnJ0WZO0pWydJ7EyA9Ev+XlqcHaidaXQFPFKWMskjBJ7ErWnHdLNgmOP5DVxmp5
	NQv66AxQIR1I80PD9V+06qdmo1t0BYSZ9Z2PUYUGV9X85re4NVHYi25w0R5Cpj1m
	lyj6u8Q+S3z9RSOweCp9FwUIKthJPi98CBx4ne6O7DABOYKXAleJjrccLPnmxY+l
	0wlcbg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr8rv3a2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 07:46:23 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a59717b0c0so1538818b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 23:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793864783; x=1794469583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7hmEknDApjfBB760FHE5yV7NCo/d+7W5Ac06Y52WzTk=;
        b=QalpQnIFJQEKxPRgTy/Gzq+jfWTbm14/TVkBsUphe27wfVktjPoTCvIFYDiVVPbLeH
         NaNVflaqv/OZcVP4EAS2Xkk+OEPkrddxIZ1A5rZqbKQuBvABpx0fiGYMU2x1x2X7BDDH
         E27lsHgGWkTbaQLspUw4M91CzvMaved5CZWsirma9Hb8H686JOSQ8acblVWRx+X2DSSj
         pc2O09YVV3lqVhHzbhdjN2xnywqSFgW9sWpmmTOmIs+HJ8jeJOjam/y3c0HKWfh1Di4J
         b+HSEkOqrI+qxcpExp63haaX2Y2UTwBkDm5ULwdoS/YXpu8Rs2AMuWMoOi2Pusue+fW0
         k3aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793864783; x=1794469583;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hmEknDApjfBB760FHE5yV7NCo/d+7W5Ac06Y52WzTk=;
        b=PBl/jZF1Oy+7WYBBPsLH3FmyhupeQDVdsjgE8/mOEAeDGT9lGPLV9apv2SZBR3oIU4
         DF/brngTM66xBkMGSA7Flz/rBejeQ1q/1npQRw+AUJeXu25a6YEeIk5KhtCXXt1J6TBy
         oGbAM5yMSpYsty/qMb6NlS/BXKizeK9TNN9uwlZmX5xSGNWxcdmeZQFd23ovIB4nw3Tv
         z6MK4uj3P9Qg2nGtTOZQRNifrt6/x8d3xRoEfZmBYbMTInpH6jopXSjReXdfhSRpkfrC
         u6gpylRoAfNW618vNcXubVMZXRqWbzXOG8Mo1GeWOtgAl0ixoj0qJbUhLCoMiQumTUZR
         VXTw==
X-Gm-Message-State: APuU4Z9CYPtSSIrGAKP5xsqxS83Wc/jq+IC/o/DD+g6KfkGd+OOwfwU0
	LcqrbhJ6+M2QJJRLKsTAYRn2Y3q99iH4iz5xNmc5Z4wRmj3jQG7FJil7auHXH3/Mqi0b2DE7VxL
	nFMYMVdyERUKM2zoCgDvo8IrXKMOH1iMQPZOk01W5oG/VrPZDdaaczkq4WusRWmYP35c=
X-Gm-Gg: AYBFou3eZlvNONfJ/gtjRKdmBiJx+ps9vxDANNqYtvy5V1arUX8UY4TSBnBOrVi/AZZ
	Tt4eFafqpGq/JALXHim/q7cLBO+KDFzc/FAw46UD8D9CusOwpZqa3xiBg32h0e5J4/FFKbf41rF
	sqpp2R7Sw0Y59K/jseAyoKX+Oc2B18sVDba3MGboR8SP9hxhF/T1jKQQ6hBGwItBqSEe8IlKSqj
	bfaad6Zf+J4Q2uGYILujG+J87NsZaaIlKpYKe3zvjuiaQpxdnPt9/R0uG8JUz4GMcwn9/TL1SPB
	RnME49w7etdcMDnUhGowOFP9I4K3kEZAxS+tRKSWYr15037funOUqwZmBjlWCGM4n3F+eqtkzhJ
	9IL8BRdohwyEkeg4SO8L8wqOow0g5raMZdncmdSec7929GzY/D95YLQuAKPAdBHYrSyP/F5QJxJ
	b3MrMZ
X-Received: by 2002:a05:6a20:7f90:b0:3e2:6ee4:a758 with SMTP id adf61e73a8af0-3e928de07a2mr15987021637.54.1793864782717;
        Wed, 04 Nov 2026 23:46:22 -0800 (PST)
X-Received: by 2002:a05:6a20:7f90:b0:3e2:6ee4:a758 with SMTP id adf61e73a8af0-3e928de07a2mr15986999637.54.1793864782211;
        Wed, 04 Nov 2026 23:46:22 -0800 (PST)
Received: from [10.218.26.184] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb4693fef8sm1887983a12.17.2026.11.04.23.46.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 23:46:21 -0800 (PST)
Message-ID: <14d9e262-c3e6-41b4-a408-3d12185b0d48@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 13:16:17 +0530
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
Subject: Re: [PATCH v3] soc: qcom: icc-bwmon: Update zone1_thres_count to 3
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260227111051.1789439-1-pussin@qti.qualcomm.com>
 <7a92ca6c-cc66-486f-b297-cb2907e1c0e6@oss.qualcomm.com>
Content-Language: en-US
From: Pushpendra Singh <pushpendra.singh@oss.qualcomm.com>
In-Reply-To: <7a92ca6c-cc66-486f-b297-cb2907e1c0e6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Vtm2kO2n c=1 sm=1 tr=0 ts=6aec344f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=4pBTPSVEyfT0CdRydYkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzMCBTYWx0ZWRfX+wlh0G/T4V3m
 ODTpSHc2lGHHlcXCzOUi0P8tNgjrmsDYsNRbRhZjxVwU41WNWlINIurj0W/eMhAC3VmnZDcz1p4
 vcg8CmtIQGhIYpYNsN3UvX40T/yV/zc=
X-Proofpoint-ORIG-GUID: CAQQSqRZLST8inbPKkVARsi_5b4DY0tl
X-Proofpoint-GUID: CAQQSqRZLST8inbPKkVARsi_5b4DY0tl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzMCBTYWx0ZWRfX74vHepn65BIf
 3SYscUvDde0UdVU4vWwvshPEzyRk0OzzPJCrp5O5r1KxRmEF0RGKPfz0aX0XMFMOwoVRQWRjeUh
 oR3J5sIF8RPsQdkMts38ERkjvisc1/I2psnkRVo35v52AOC5Ws7iWFj1hNsiAZOA1/2U0/Ij5W3
 uFb/Hicsn5o6SDKPxYnB86G0GxJd3dqbHxeU5XqALnNfAbQXZn1b/WY2rOmitT1XjXGX4rlnret
 yt6geznx9FU7UHtQtlwguAD8msqxOE3jSH0ifOVVSDjvOoPYVhRJwivhq+ee1FulMHUKdGxylDk
 lis2DPsD/jqdi4fdxl6bJ9eXtamKmAWZxJXdpBsR7fqufxoYMkc747DK97nTJJphYsPUyofWfiu
 yKAec1YMXYlqFaUar6he5slAT7oazgGzUiBkznX/Q33i0UXZJ3HmlK6GBNzvAiy/eIDVjzYD/Nj
 O5X1f/Bc6WnXSiaYrhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1011 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050030



On 6/16/2026 5:09 PM, Konrad Dybcio wrote:
> On 2/27/26 12:10 PM, Pushpendra Singh wrote:
>> From: Shivnandan Kumar <quic_kshivnan@quicinc.com>
>>
>> Reduce zone1_thres_count from 16 to 3 so the driver can lower the bus
>> vote after 3 sample windows instead of waiting for 16. The previous
>> 16‑window delay (~64 ms) is too long at higher FPS workloads,
>> causing delayed decision making and measurable power regression.
>>
>> Empirical tuning showed that lower values (e.g., 2) made bwmon behavior
>> jittery, while higher values (4–6) were stable but less responsive and
>> reduced power savings. A value of 3 provided the best balance: responsive
>> enough for timely power reduction while maintaining stable bwmon
>> operation.
>>
>> Significant power savings were observed across multiple use cases when
>> reducing the threshold from 16 to 3:
>>
>> USECASE			zone1_thres_count=16     zone1_thres_count=3
>> 4K video playback	   236.15 mA                  203.15 mA
>> Sleep			    7mA			        6.9mA
>> Display (idle display)	  71.95mA			67.11mA
>>
>> Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
>> Signed-off-by: Pushpendra Singh <pussin@qti.qualcomm.com>
>> ---
> 
> Since this patch does not seem to be moving on its own, I will gladly
> hijack the discussion..
> 
> I was wondering if we could transplant the bwmon devfreq+governor+memlat
> setup from downstream. It seems to be way "smarter", in the sense that
> it keeps some hysteresis information, unlike icc-bwmon, which is purely
> reactive to immediate signals, in addition to (in my brief understanding)
> sampling other data sources, such as the PMU 
> 
Thanks for the suggestion.The downstream solution explores a broader policy space with additional inputs and hysteresis. It is an interesting direction, though evaluating such an approach would likely be a separate discussion.
For this series, we are focusing on a small tuning of the existing icc-bwmon behavior. Based on our latest validation, reducing zone1_thres_count improves responsiveness to decreasing bandwidth demand, allowing DDR and LLCC votes to be reduced sooner and resulting in measurable power savings.

Thanks,
Pushpendra
