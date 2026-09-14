Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937FB3FB06D
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383769; cv=none; b=bAbn0tBNWniosCwUoWL5VTdA59cvpEV5GIObuOQnw8GRBzfGrvr4Mc8ljtlsbnc+bUWKtNl8BpkuwqlIyhLHjQa/o6LmzlMq1mLQDDo37MGw7nYX+HWMAb0Er7quFwUD301KQJakS+eD4MwN1YbYpKWdz9KgqNGyImWOKk9TLAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383769; c=relaxed/simple;
	bh=Jtif2RA99xqemNh+pGm5sjKIjSLoxIXcRkKWYQqcSgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nXYlPJFKXpmyCe7ybGKXIeXAf40fQPvg5Jbq+003FCchJgXESFw+LhB/DWAUGAhmWrd5RUt3ZaU0zKdSh5+4PW4n38ootuuF0mxCZpWrphL72dufX9jBxLbalYbBmC+ulfNLdZ3ZNTBQY65NHVj0/y53cxkDYj1tF1F39I0xGQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z9Ca1+0J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bMurvDfu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z9Ca1+0J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bMurvDfu"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmcof314177
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:02:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6wnE+gO60PuqLHvAuGY+mC4+Z9CstvC+Ue4Va2dTcPY=; b=Z9Ca1+0JZvL3kCqp
	5QuflEKmVseuabNwl5GDt8hEKQlOvSrjUllr9DmKZqM64LwjWA6zNH5zJiXpGk5F
	0nku6ocCWH8BuafjNIYYWX+/BqWX/taGckCaToKaO0z0GKx+ySuN1DrGp6E+vyZy
	THk8cDAaDwu2GEfaOOxgSKdF8BqIHqcFL+gFDpsJo+RIQ8d971Zwda58CuRlFmN3
	bE4IMf9IUH2t6LZn4KQ0LxLCDmSv3uVW3o/MAGIXcGNtauxKWi5/KTsV97YgRKKQ
	51/wZ2emPE5UBxs+BiOjk9s7rJljDEqNPFB6c3BR30O6A8qltOttpGbAkc6/Jc99
	A+7Y9Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c69x5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:02:45 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90e8e3e6ca0so5122276d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 04:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789383762; x=1789988562; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6wnE+gO60PuqLHvAuGY+mC4+Z9CstvC+Ue4Va2dTcPY=;
        b=bMurvDfuAUCTbQE8osqV08eMIij6wr74E7y6afGI1lSU/PyMzl+bRVf6OzxyuOex7b
         edNX/rUJzQzbJehFVl6rFpWtUKQgwjvits++9rw8WZ1q18iAj2881il7abdGNxJcpBOB
         kK1OGZ+ieYUGCUKamlYjKqp2VW+O+qn3DOvXJPf20QZIOj96reAqrf7RO/LFeZ5bqOM5
         gZ04Yn/Z6GtyLAWqA12dRw/29VSlrMRAsYfVEIsO800XIRIDip7L84pcqOs5JfCVqq9A
         FbV5kcbwL39uVexEf0dCaHdWKgwZZojkERAlzRVBNN/Cj/f82bWMiJXizOkrq0Cx8Pq4
         wyAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789383762; x=1789988562;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6wnE+gO60PuqLHvAuGY+mC4+Z9CstvC+Ue4Va2dTcPY=;
        b=MUGD01lqGJsgkrUE8mat3hUsn3neLQ79hRQENNzYBGDp6aYOkRJwllGtANjJI5dRrB
         IAnh8G0dAhtdlhnEwxjjk8DR0Ilp5USFKV4wy+nSQeLdiVUKkOQTQhQ1ZVkowlJadcO4
         AID4F7lwx1/1BHFkAQrKHYg3TSTLfAQ6w0aulRqoiRITxWtm4Z6vr+xTgKxJmYpEHUD3
         lZhs1AzWK2RI1T3/uzLMy46eooDN4DrFgU911Rx9kL97652WGszp7CS8cReCqAUbxddB
         cBHxAg/eqknLY2xbZAqTJHqigGl9p26vGBswMXxgaJeDLeZdnu6bhpzEYbKs3pVQkJqG
         zcoA==
X-Gm-Message-State: AFuF++nIuaR0O3xHYLnB3hBgiBM31hj5ZojcXokCf7myEkx4NyWVwFQ0
	ldo2zeAXlJuonh5OBVhSCQxUcv9YB5o4z89LiFfrhCfpa00Ip1q+8LLLJKRoaOhU5S0YoJK5pql
	4mVezcKVxAX3nFvnsDi0l/OL475g8GEgSWHZuCtZfx/VJ73g6BvwNbjRzqEw12XrQ+zQA
X-Gm-Gg: AYBFou3zTSv9hL7eHOB+ysQkOz387zef1HMTBl5LuRDPEBXDlRjTeMgD7I6APEInbO+
	sWvO9EAPPwZA6MjSCVC6zyqiuOKs1oCPml3kSNx45PCJQjlXLBT1C+7zwyIndag6Wld1bwh7NK+
	morWDYnzmBg6ZHT/cWfqbwyGFH3OwrjGT9QhOWiXF+zseZIRP8ZU1L/8NWlYsRnyXYUDjGGazPS
	enMLg/g0bQjvzJnAZM8gajDEfIR9TTpPcmtfGow7wZtbXtO4sny3NJUXZSp2tQFydchq5SyMcrM
	5v6m2KTZ3KQwyv0+2/TAENEDAa9mEZB8wVffuIA4VAhZxs3w4sbPUMggaPvpu6p/Idv7wQwWGtn
	tK2LFGQOsVIlgfuP0sF4fGA==
X-Received: by 2002:a05:6214:4283:b0:90e:9aba:f095 with SMTP id 6a1803df08f44-9122e6bc978mr28860806d6.5.1789383762291;
        Mon, 14 Sep 2026 04:02:42 -0700 (PDT)
X-Received: by 2002:a05:6214:4283:b0:90e:9aba:f095 with SMTP id 6a1803df08f44-9122e6bc978mr28860336d6.5.1789383761856;
        Mon, 14 Sep 2026 04:02:41 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b5968cf3sm4024671a12.31.2026.09.14.04.02.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:02:40 -0700 (PDT)
Message-ID: <ee193823-257c-4ffb-beea-b3e78996cae4@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:02:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/34] arm64: dts: qcom: sc8180x: Move PCIe phy and GPIOs
 to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
 <20260910-root_port-v1-24-90a252ddbbfa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-24-90a252ddbbfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: E2SX6nu8HHdCdilB-eF82FbMSLzCHjBH
X-Proofpoint-GUID: E2SX6nu8HHdCdilB-eF82FbMSLzCHjBH
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa7d456 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=6pHcnep46kEejBPVP2gA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NiBTYWx0ZWRfXycjgToLepoCg
 I8WUnqoMp8Ba7qTB/hmN5sJJXxRn/P8DnQy+hGkCWUuQanknJbz9HouMv6rYSblufLioAtnGC9R
 ou2rEAPMie5JTnDxMn8DeU9AzxcSjEbKVZVb09kp1aGmt0SGvBXd9N2kGzlcuiSH6OIJ3ho7L/P
 SPCXn5/zt2eXA3x8QhuDMoQS17OU64p2ncMULLLyOmOOUZwRLq2Dw5NvIYIF+l6LK473jLJuOMb
 FVw6uUgLaVPI4o7bzhlkTBKE1hTOUJ5JrXwJF2vMVWOYD+068dI9AwHE9cZavEsy0jxt1yydgTR
 2/v+ooPyZo7QZvN0VsPdHPYScyNCQfcY9M2Sua5OlegtNKfPymXnu02pAZr8HUaVhHHnCCSCeb2
 2b49+HeEdjfJ46B07e/wdCukfg0cXhiffjlbuKbs0gsxr8q1cID6KmuFc1p84IKKqQ2hnY2chap
 Lwi0AFaDKOfO7whf5UQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NiBTYWx0ZWRfX/krHB/4kiFeL
 gzLyVHsSudzM6YIPWXY4Yq0PqVSpYuJrjMaEzWANspqyg1Fx1Vs9bG+g6a9IPx2v5usN/wi3f0x
 EgD7WKpJENzSsfUdbYLSBVum0bqoo4A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140156

On 9/10/26 3:29 PM, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> pcie0_port0, pcie1_port0, pcie2_port0, and pcie3_port0, adding
> labels to these nodes to allow board-level overrides. Move
> perst-gpios/wake-gpios from the controller overrides to the
> respective port nodes in the board files, renaming perst-gpios to
> reset-gpios to match the binding used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
