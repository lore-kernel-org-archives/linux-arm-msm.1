Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793094378;
	b=RnjX7PM1BqFW8ls4ezb0d15xnxALuXfqTe8bq+fH/Wu23dCFzlStdLrRlHLNX+xnbZay
	 N6dwcdmqFJnj4zn2VyRVWvrAoRZxD2/BOSVxP2ky1iVBYymrDfvkR7C0qmUD9BzyNykbg
	 DangCFgFv0cZj+aHoLhloqWjrz5MDoba4DjPPULydt4wfHBq7VLyrwMDvFYAIAfsQICg0
	 hYSHUiixR/WK/RbKXbmAXIFeHmQfJfXQBNNOwTx0bedanMq78t276DqAhvGGpn2hZyqyq
	 96Jmw1oKbJYe56elaZNdGnBfTLrrUU8U8zdPWIkrYRYCE1zycopDOSLrJ0oENwThQaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793094378;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SO9ZejKNzFByXqeubDPtQSU2TkzpvPQMbFoQT2zNea8=;
	b=tO7aIJRTxGUCsDodW3lvM6sA/EWbvTXB6KBzRb2OofLz9V2qvRnMVbIBq34xpYHbSeRG
	 UeEpcnfzVJ9kyF6U3qJ7FoAtRpKF43BbKEA/2IAZpfrcCVcQK0231xctdNz+I9SXE8EbQ
	 AIofNMjF+ojDy1H6OoUooG1INOy9OSfz5XmjgYQBagAUl9HY0Lw8BzDYz08771u831UxZ
	 SlnBNiNnHUoBokyvERZc9vhKw6wLECi6MuquL92o1etqnDwZvJAtqL5+kfnasiXJDB/gw
	 RGEDBbkvKcJrS/TBo+l9feHNfbmWYr5nTXl96IBRpKVd1CDRa0viyiizOBY79J+LT1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FUfhFgJa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WYML2dHr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998CE606A322
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 09:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 998CE606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FUfhFgJa;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WYML2dHr
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R8g5I01672121
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 09:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SO9ZejKNzFByXqeubDPtQSU2TkzpvPQMbFoQT2zNea8=; b=FUfhFgJaeOwflecF
	mPAjGpqS0USAJTcMefy5ALM9V499+JdRLqUgkit7wkQZWff+DXndWkf2rzm+JtKH
	gQSNqxtbKK/FkT3VWddvEqNFxEy8cMs0QqMbDqmEISzUh6FuodDooTSNBKwtp2pr
	3iZMR9Xg1KbAx27Vt6jAqLgs9gPYPjTH/zOLlClohrOrCL+Qn/ncRMcD7nYbEhYS
	e0EHwniNIzN2DR5aHoxMYqV2sXebXfxVDa2TtAr/khvozT6w6uWN3a6FJELfad9K
	ftpoEVgeYCgsqX21AFJ2+negwqmySiSD5nm7i5oCVjo3UnNtXMzqNczwH/2uPwWl
	faz6TA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjfavt6fk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 09:46:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e869e00005so64204795ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 02:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793094375; x=1793699175; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SO9ZejKNzFByXqeubDPtQSU2TkzpvPQMbFoQT2zNea8=;
        b=WYML2dHrepHQ5Fx6xlBvqLv57ixM8Q7LGw1jas6p8PSBAOE7mYYZVWvUVL/mjo5Zk/
         9j0/LfNpZLNprLZksTw7rnQdeemjCZUiQ7cZfW7e+dq/xU4L52claOctQ8Jyi6Gac3mF
         0pRFL4wPNRYGauLQBV/2/v06jfBMdrwYeLYN/PMD98JMJWqXHqAurBBfpvagu8Sg7WPr
         uFxZnGFbn2A4VqYy/GhyLG31/10xsuytxapb4Vmq3xqmn0ZcoB67CClcihnUA9HZOUo+
         c8xaucX+JL/Tlmvd6rslGA8+H14so61wGb6MTEEssEyh3QgD6iMeW8eHJCGLh3KenSEu
         NQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793094375; x=1793699175;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SO9ZejKNzFByXqeubDPtQSU2TkzpvPQMbFoQT2zNea8=;
        b=NnFn/wZF4KdWk6+df4Egs3smt+cv5qlmiBKBlLDYC8kJpnqaO/gnVohUJ8vyMo4iGA
         goJ/2VJhzphJ6IUUKCXGyA6CZVzCKfxFAErGFJWc7gVAvvBAdnCJocIj2Xxsu+cT87I6
         iMCfGFuJI23Vldbwuk/vf9oFpuUCuRR4rk7zh/82wF0kLYsIg2TxaZeudLFbALHk7gM4
         jEmo3WwekAvxzGp3Bb13HdHpt+1Gw/WSb9CTPqi+5JozEnW+XX3/TSLWzzT67FAp/nJm
         99FkHHGL2E7lmhnzqh/DrzJE6Scy33/Q2qrr9oqtW99zJGnuKK8Az39kF85pSP+dQzXl
         QqnQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRktTW9fKHzhuNhbYuhOxdhimEMOdn3koi3gYRR7/2e28eMfbzBvEyc3ujCnAViWX1COZs3/q7HaHA6Ydh@vger.kernel.org
X-Gm-Message-State: AFq9FYIjlePFX61HP5gdEg+16n6sq+JCR1jul/64YO/xhhLCV7c/n8ta
	OLcdbKZK4p5XlNiN9nz55TKSEY907Dp+QCeuMisMmxcfPOSBFDZAgY7jqsEy+lW55tJp+XQ9RXx
	+lj1gUAQHas2S4yqDSUtPzmG7vsLjhgIouzvXMycx/yReHvQ7Q7ykshKNvT5JTsv4hI25
X-Gm-Gg: AYBFou3NQEyNEJw0/3mGT8OTuUyOQOJCU7qGTjq54MgjXmMTq1S8fr5t6eFjCjqaE3o
	qNyMo5Y0ePji5msSfG2iQW4UqTdIuNrsb4DTFeiIbKVsW19R82Gzql+GJwpCTDHmA94MphLyLsY
	Zl71Hw2ypeD2oEPnnxwx3FTovREbcNUDpt2eLG+lezGpjNzv00lE8/Rs1X9mqta3Si/jy+o/qpK
	iWvODsaqheysnb3g9vcVVWhsjsi8nWpwlp6wpitaZWGcLx0ktREwVOzvD4YKs7ynM05BsoIk39L
	26rPhOaqVUV+qLaCcAAx2n3hOcBKjx6jJH+N+hxG8/scHMfTCb5N15vsuyYMTKh/jxPhrMLdpBV
	l6gKouQc20m0wb7sCAwj3h9XqOyFwJ8NxoGe3aE6HTEfP7nbMusxuzMC/tly2bDAJWZFx3As7ml
	I=
X-Received: by 2002:a17:90b:4488:b0:3ac:7749:2f0 with SMTP id 98e67ed59e1d1-3adead4c649mr7498325a91.44.1793094375495;
        Tue, 27 Oct 2026 02:46:15 -0700 (PDT)
X-Received: by 2002:a17:90b:4488:b0:3ac:7749:2f0 with SMTP id 98e67ed59e1d1-3adead4c649mr7498293a91.44.1793094375038;
        Tue, 27 Oct 2026 02:46:15 -0700 (PDT)
Received: from [10.217.216.29] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebb75254sm6585735a91.4.2026.10.27.02.46.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 02:46:14 -0700 (PDT)
Message-ID: <79f0f94c-e474-4343-bcd7-a50ac858097f@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 15:16:07 +0530
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
Subject: Re: [PATCH v2 1/3] clk: qcom: clk-alpha-pll: support a 28-bit
 ALPHA_VAL width
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260924-nords_dprx-v2-0-fa4364e087ef@oss.qualcomm.com>
 <20260924-nords_dprx-v2-1-fa4364e087ef@oss.qualcomm.com>
 <9dc66fa5-47a9-417b-b8ff-b3a61ea75678@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <9dc66fa5-47a9-417b-b8ff-b3a61ea75678@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5bY3x23m_mm8H1dyY9v507L6h347-87k
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzOCBTYWx0ZWRfX+5dkwKto2omG
 0GMvfwCzjMYwMWFRoOZIScs3hSlQXx7YrU3e83LCj5dloIuQ1wrhFCSNVro/BlT3MBDoWLVCWZJ
 tvvkGxRSmzb+gvW7nA5Bl8yHZw/1Vng=
X-Authority-Analysis: v=2.4 cv=EIeTQFZC c=1 sm=1 tr=0 ts=6ae072e8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=UHJlGdhkk8AUXz-q67kA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 5bY3x23m_mm8H1dyY9v507L6h347-87k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzOCBTYWx0ZWRfX1GDE7n6OmzgR
 gjzv/rG4RuV/ry1jKU4/IVYZpUjXZotZ6rraI3HfD0FxxGCGiYrlFV1jQ6eZvd2yGWmuE4+I0nc
 hlA2PHV1PfopfSoFV6xF9ZO7XkxaXFUW8FIKQbPBkkCJ3t/TR3cbpCzjAkyQwS0DYHuQeclxo+K
 Bw9P9jRBR4gK7cOyRitq2Bd/sZUUMAQpUt6fFqPVN8gMTeRvl4EsI5qBRBhXi+6pIIgUidNmfcL
 6v+AVT0Fk3ofkKFSnzhYRe0wGJCAKndRcO9eSq8LQRxdx6DkGDllONVhmCxFghaZ9pE9ySdm2Jt
 6YaZ+Xv3I/eI5mmblQCgWtwiCYJcT+a+QM71o5F/q5Yxz8xurmGonLiA/6POBTiXaY6jlN2FvPM
 9aEeZ7b6i4bXF8qerpwltJNzfMgq5DeQNUIrS/v/VlWVP2PCkbRFJH28GkETqt1dlcTT2x2NkQn
 y9vehb1S/PedcX1RvAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270038



On 10/1/2026 8:47 PM, Konrad Dybcio wrote:
> Suggested fix:
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -2271,7 +2271,7 @@ static void zonda_pll_adjust_l_val(unsigned long rate, unsigned long prate, u32 *l)
>  	quotient = rate;
>  	remainder = do_div(quotient, prate);
>  
> -	*l = rate + (u32)(remainder * 2 >= prate);
> +	*l = quotient + (u32)(remainder * 2 >= prate);


Thanks Konrad, will push this fix.

-- 
Thanks,
Taniya Das

