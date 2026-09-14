Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FCF399001
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371639; cv=none; b=SI+tFNRArDH7vNwErtW6xAZQ4LPRFb4Gbx4nchWm/did851Za+1pgpUbWdkOoiMcZF2eJYOBVJDOZtYWzghvOO3FcFNQx61a7sAgyVpNx+7DPtb5sMUFnAwDYVCiRShWAo5R1Zoeb5f5jQgMu2b2MUZiRAXTltsE3QAv/cG216k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371639; c=relaxed/simple;
	bh=7D1WrDaOXw3jEwbtz6iaTiJ0Ik7U81oE17WafVAW2yg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j1G1EEo5KfvKXdUwHCnPUNx7y4qsj6iCcIgX/yhGD0d4dhzQMutHRDI6RuZ74OxRHr3/vIKcEzcRFR6vJ7HlD3nqleOwicBdNvtItw3kvAHL2FW5BJvkA+oQQJWLWfREsrGK4BQOe1YC8gN80Zs9UaNl41heoo2PrfvYwc2bS54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WBdy/+Q/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QhnlK6Xy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WBdy/+Q/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QhnlK6Xy"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ifo73368748
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:40:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+MmYma9ipaJNApTwltViswWE
	v0iN2F3QjUMkSNVw71w=; b=WBdy/+Q/q0vdN9eewwBB5t9+2NZ37YLDTW5vL+fG
	pRODQtAmweFTGF2QIHVYwSJBRUu6gH+rnmLteHJbOsHmQNNbP7UtXFlhgYloXSZA
	4RNnihwXWLzlcpALjb39GZNuiHSnXyqZepB+5qwZZKURCN74ppNVbQyiuPuQSGsP
	gOJKQFSOA2fpS5GSrXahymmFnYvvRbiU1NbJB/7xf7f47h3S+3Y5BfVfp2Gt4PNg
	sBQLzx0hlsQpWzAhVLovKXr94rimfjUvmt0b8yLOmCHYEUK6xID+dGWTulBOEWOa
	lTXE03Q3HTeAlhgfhOpNOig79r1CN/DuyBYd6OxoeVTzxA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd5k0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:40:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a0312937eso178569385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371636; x=1789976436; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+MmYma9ipaJNApTwltViswWEv0iN2F3QjUMkSNVw71w=;
        b=QhnlK6XyH0ZPUcUbKCxRbLPmbrJ1HIaAwDrq5aNDp5XrrTtLmF61VbB+IoAsN/ggpi
         NEPMqxy2lLHqm86u4hWAkECQ38iqHiqDmSPX94m8/ZVhGteSfSm9dAq9dNgY0igyZh1p
         YI0T6Je24f7IZ8FGnyqfJCDZhGBCHt2gP8unDR0+l6hPJGkt7KfM9seZBUX+WA9MR9f6
         GjhL73ABbj6DYJGBS7MpwSo1vqlxKGEnrSzJbEonX8O1RTZ9Gu/xqtJ4J2HbwwrzJXRx
         4PEjb7lN6Soe0BZWx8+5TgAmr3OZNUH0CxOi2uURtyY01RzNd+fqMGG4ZOwEDhaml251
         j4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371636; x=1789976436;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+MmYma9ipaJNApTwltViswWEv0iN2F3QjUMkSNVw71w=;
        b=JHU+OZ3jYII9K6Uibpn7e77MAdTTOZi5Cpgk95c+PrRN24MoVxJZg13H1fY61C2ZTX
         wp6dAbj73im+Lq3ebPrMCpxWehMMESll+Ol8LAH0dyQ/JIvSa+S9OCxEd7iZpDqVA21o
         pUbpqvKci6pnTmuTDhx6CKTfndxLMad2YRbKhnPZ0EP7flpcaP1K3mAWL6SIl59f13AC
         hvmfj3k8r/Mx83XofBfpqU47ngNqk4cEq2wsCzOrGXUIb/vqgcJwTyyobZMN+MP41AiE
         YFc4FYPx9m+SmxRpKHyRZchKKo0F7LgKEXU17nzJIlTCk+5t18Yvoy/FRY2zPEE8pehP
         WIXg==
X-Forwarded-Encrypted: i=1; AKwUvBz1kpVMKt50/9yuPEmIwCbdjLknWDuMA21rwnR1bymYoh2J9DZ6mjI6Y1WrfFGgRh9uSkqpZILRggwd8o3n@vger.kernel.org
X-Gm-Message-State: AFuF++l1/jhBuZinQqxbLx0JHq1LwIa5hhY8ABJsw8i0aE9NgnGZyxj2
	4hfUmrCtgAfpa7LpQ96HfbK1s5nZCaf2M4wTsH6K4UzEODASIYFBhJENNmdL2/4YLA/TXxYMKOH
	vWSUTC7qaMgynREn+D3A9SWWmkMY0XbweiUv7FX2sqI88bYFT75cac/WA+i3Z9+/0X9LE
X-Gm-Gg: AYBFou2XQOFIBvZZISmfuTCpgbH1prCQh6CSbuc1ZhjQcqYrOFDSqETWnTjkimhA9sj
	YxWcntjkRqSRYB/U6TVbZGL6f3GkYFeZvSOLAU5vc0xD3RWgYQjJx+uVEbC5WOj+LLOcgXVC6ZW
	ysN6w2NDi9/R/fHdjIPjM3g5Lk5WVEg4ledRbqGE6VT97SCwn5BHn2SXIm6IwZPBvzS+9lKMYpZ
	NYBVoB2oT9k85ZDpbOVMvBDYB34/1y2KD8JLGklY8BQmr4hH8Y8w9E1Ar6Yx9KtwxZvcXK841em
	IlOfgNhLSq6BomdbWatgkDUeV6pSX21DgVXqjcvtKUYtTvZ/tgmdygNkrwjTQbFVB8rvSff2sK4
	cuGqyx9zzWyS8fQ==
X-Received: by 2002:a05:620a:6018:b0:939:6df9:f991 with SMTP id af79cd13be357-93a29c360e7mr165549185a.52.1789371635955;
        Mon, 14 Sep 2026 00:40:35 -0700 (PDT)
X-Received: by 2002:a05:620a:6018:b0:939:6df9:f991 with SMTP id af79cd13be357-93a29c360e7mr165545685a.52.1789371635437;
        Mon, 14 Sep 2026 00:40:35 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34f353sm23982368f8f.26.2026.09.14.00.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:40:34 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:40:32 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 19/31] arm64: dts: qcom: eliza: Add domain idle state
 names
Message-ID: <h3grscehc53f3rvw73jbvnpwbc2m6fhr7xqrexsrrd3t7yphpu@vq6gu73yqiom>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-19-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-19-660c31187819@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa7a4f5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX8wYqkH3Jgtss
 m4RursyliVWP8b8z7VHe091W9+F3y/mDtymWnZqhpBTlTvcaCBRPC3sDmpmNoh0s7wImruw6Ro7
 Rewh72l908bPZD/eR790N3kfIyfViCJsodo5eJciQCKXwciMiBXGKOTHRySIZQxnucgDYDy23vp
 wRoEpP/J81Ap09mdVOLQQ5F5IqeHins8XAiwqEzLmHwxjobsp1BuIV5s/xgXahh/N8KqHh9D7Jj
 3xayj7/Dgmt52ItninDlgz2aSTZV/DMlLzN5/Xp4Ur+000VKWotVLftgaEypwZj19XJ7LZnOWKD
 pfJ43EY7tLtQpQavw7uLzRFIGpLN6Ett3vHMJ6SGpgCYaoael8wZ/76pPdV6E5oX4fGr+IrNW5e
 eEDedDFVMrV6i963cb6HSVIlHaczbXbYIhOJL+8cgOS//EgZMPjrSg3Lxxn+rzDM5ucWB3ffO2t
 mjpvikZHaKtOkHHqZKw==
X-Proofpoint-ORIG-GUID: 1Xt1rcwh9p907RWOKws-ZWjCbuIbr6Mi
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX06GtjJ+nIDWc
 OoGViDamfjAhjJU9OPSAMQCe5oxQE+zd2cN+fHGr+VahIvBtXaam8GCUc9OAvTxqzuO7Odxz272
 YXce6Nfn2V805pUL513W7uyWXD4n+CM=
X-Proofpoint-GUID: 1Xt1rcwh9p907RWOKws-ZWjCbuIbr6Mi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140108

On 26-09-14 12:29:51, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
