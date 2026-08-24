Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0233AFB1A
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787561574; cv=none; b=RsEzXrJIMdjBUsGMz9ekeLncLRLdGjeSDfntJUxP+CTjfOQo0P3GDjhHfHJqZKh6D4Y/vuOgD8PNEbVoRkVBmgUElPqPIs1qRnvx1II9o9VHmRHDhamKFD5Sjy3sBrOJk2N/A1RLv54elfyAn5RvVfWQ70CqsjcXp4HuK2cViI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787561574; c=relaxed/simple;
	bh=DKumgshbWin+GIVZDyjFXqN2fIp+BEAViJFEGBnKa7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OajaJV9FvPFHOMq1hVFwMTYoYfOQLphlIAfEiF/ttqzcwDVILbjc6KyGBTE1+iVZ+3qVkgnOcowPbDTOSsrOOZaXuaf4DVjzzbF3+Hos5UyGlFeobhhc/5HyyRbRXXFHEuSC7y6lkEVXTqeXJ7clTlu/NnKPrgHiz6U09V8MZrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GSVZZzUh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LdUWhUdq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GSVZZzUh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LdUWhUdq"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O7Bgae1815879
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:52:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	81N4kV2o1v+XvSH/7d55uXGNnT+DU5JPpdy5v1w9dHs=; b=GSVZZzUhLuZQfqv8
	/2ZAsYAZBLLJzpHUDcjfkMdb9+IBApxxFUw+5K3dnyfz/81/6xVdhwm8qGV89BC0
	TFKE4W6+W6p7tum8OwX5LTFvsPYM8fBuwzkpUFdt3GcOTsu4JiZpZVoaiWj4E7+c
	Idux6HH1czBmHHVMPYnCZv+TgW9bDHfuurm0jXHwbFRnrWE+qDoi8sLhi3ID4Sk1
	rgczhFQr20TYKZl0oAM6blLnxakSeFDPIOamN6cELlgyik/B+92KqoWM3IOp3O0O
	7gziYK04nRdmSAUJNBmqe++6afKS/zl1DqF0vRXkIaiTLSO7JzkuwDOWrr94+BdJ
	3r5hxA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hbtgck5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:52:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9310484c005so27117385a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 01:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787561572; x=1788166372; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=81N4kV2o1v+XvSH/7d55uXGNnT+DU5JPpdy5v1w9dHs=;
        b=LdUWhUdqSrhjIFIxrUcoNnM/a9qFLjSCXrbDmGDtQvalgrUwo0/73W/+29DeuCGrPJ
         s2TAm6slloEbLBm/MkKs6aAVnDARZqu+KpT3OMGjz9YTzsfk1p31n69VTddq+qx6Oqzl
         f8BKXXtaPBkjh9vRxQzredi1BC2olPQGoTFGroyks60lrm8ozMNfOjCk3a3RUjeUTsMA
         XBDNfDWmm/68e7Bm5/wVjFaKH6+3rUgaMs7SLqmu+LAGFQuqWV4FrZvfCDxNhRx0yJ8H
         2+b72aeehm22NZSs6NHJVdP/0c46Hz3fJ13GzZrBYC1qoUA87ZgCjrOKB8Dke6pTx1mt
         oVJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787561572; x=1788166372;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=81N4kV2o1v+XvSH/7d55uXGNnT+DU5JPpdy5v1w9dHs=;
        b=GR1sOVeBkoiXKNO2ybUQ6U31dI2V2NL9RBc8HIfVZ+EySgoa55lWE79j0yszt/1Yu9
         CrURb1LqjQCOqHQOzWXS0UJC68fmEd7l0pYX+HjKwWf89JpwgF32d988Qw+O+74dY+U1
         p8G0JLEZkLsfx/FC8+9LOqgDNlpFQwdmpFIC84YX8Rn5w+0mYws8qIdInl10ApJ8CJWl
         KLn45XpqCO+df3I5xNfrZdYlAJWJMnHuOoL2DLJuZw9QIwyFSYbeh5csPnHBiE/zkDtz
         kldO+wnktycvC7IFrr+FbwjklWfEmkuDMj9HvLDmNmMCOVDSslJXoTZi3q5wfZkRFT1u
         iaZg==
X-Forwarded-Encrypted: i=1; AHgh+RoRDZEBhJ3+tLd0sf9RqjX6VxHw3sEzEG6S+9n/KedJX8j89yZCNdWup01vl1QThY65GVH8ihQis1Qor+nT@vger.kernel.org
X-Gm-Message-State: AFuF++lj/ei/SwcZaqKMzGhl2d2ARbcfqprX6MqqBfZrFstDou2opzuh
	0sAS84otAdV4EkWxPgOBOlJedp6NKScvb1qPKG0mOk63nUoalu8O/yyuu1KhSKj8gkoI89IJHGr
	hKUJppQSN0t0/2qIE0k3wzOsdVZmaaYHceAndf5ooQDIfNHgUlbhi6yzEv7aD9cJOR8wW
X-Gm-Gg: AR+sD10Lxmj/oGDtYfg46pyHY+cq3XCVYS6tEI/4Jk5sbSwlT+nAIuyTNY8SK+1yqG7
	O/DS++mixWGxTv/uMB06L77XxhTkPJ9weM9szyk/jIQMstCyy08BudWylTLUJeauV0B2sjGiuYe
	RTVwHqnG9D2bdXSG3lTMmdybPJpPTg9KEX7ogUP38HoN1Wm+l1PBG7YGeS3frxBb8MNqefwROj8
	jTUCFa69TwS/pCe9Aef4SM6wyW7UsOZIPIoI+VywurJLRuDPlEPIH6zhf7OQ7xosEiKzdbq8nlh
	D9zxE8WU0fF6eD3pex6SGgT1WpDQo+TKFvuGF9EUf1dZIDkW0uBy65wX7Uot8kZI0+7m8rYRzOg
	YMr0x2n7YTiJp3NTmSCV5Hmcn
X-Received: by 2002:a05:620a:4804:b0:931:23a:83ca with SMTP id af79cd13be357-937397348c0mr1615431685a.4.1787561571880;
        Mon, 24 Aug 2026 01:52:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4804:b0:931:23a:83ca with SMTP id af79cd13be357-937397348c0mr1615427885a.4.1787561571465;
        Mon, 24 Aug 2026 01:52:51 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606b60asm1065146866b.9.2026.08.24.01.52.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 01:52:50 -0700 (PDT)
Message-ID: <d8093899-48ba-4e6c-a61a-144113b39c51@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 10:52:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/13] pmdomain: qcom: rpmhpd: Add RMPh power domains
 for SM7250
To: Sreeshankar K <sreeshankar0910@gmail.com>, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, rafael@kernel.org,
        viresh.kumar@linaro.org, konradybcio@kernel.org, tglx@kernel.org,
        ulfh@kernel.org
Cc: bmasney@redhat.com, radu@rendec.net, abel.vesa@oss.qualcomm.com,
        lpieralisi@kernel.org, quic_tdas@quicinc.com, danila@mainlining.org,
        davidwronek@gmail.com, mani@kernel.org, robimarko@gmail.com,
        linux@gurudas.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260821154030.2514-1-sreeshankar0910@gmail.com>
 <20260821154030.2514-9-sreeshankar0910@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260821154030.2514-9-sreeshankar0910@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3NyBTYWx0ZWRfX1HUDf0xkR4N/
 mU6X+/vE3hxAmu6xXiMhkv9t5Q7BTPZU+puCf/VPgs6GENm8BrSeoPHiHMUh4oEtfElKHs6HIdD
 NAB71QO7rREBZkzS+Gwf+AnuvtR2lWp67GF8DUAJEAdXnMpN8KGEC6p+e0fK9JG8WX1BQlO2O1S
 uFjK7ULHHEkxKRH/ci/L+fXYEPR7cQi+GONLkCR38M48wbJOa7LU42BrBHght/RYKku6GpacK4T
 3UYV3THpemaWlfuuuoyLXP2zgiuoFFsdircFdS6SKj1PX5XXUHV53kWeUwcEqLV5I2YgBLTLcmb
 ijIf8gQ8HiERSIg6bLxdawv1KhTC55WmxhzL3upW1fyzlIDoPcwSFljjBG8u7Wp+aJzJVPsc8eK
 RGeNihCvWIvezN4Z0+TrUpKtDlFoh9NL3x7CyEz2AYoPxPVevA70yMVTRKkEfUWQkbueoafXLa5
 HNyGdu3liIBZJdYiRrA==
X-Authority-Analysis: v=2.4 cv=JL0LdcKb c=1 sm=1 tr=0 ts=6a8c0664 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=0Fz9-S7UgyL-nH97HSEA:9 a=QEXdDO2ut3YA:10
 a=Z0LeWUw4VpMA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3NyBTYWx0ZWRfXwyRORTPeyJOW
 Hb6fKG+L15o7M+FAQOlEiqDo5rttcoBztmmadbWvR8+YD4RbLRfl1bHD+gIvdRnvUiCTNzwIzlM
 gxLrcv7MQ8zOnnITt4vu8M9ZVTIdnrc=
X-Proofpoint-GUID: 7fkQh_5s3S-YvgDVeQkc9P-GqezLywlU
X-Proofpoint-ORIG-GUID: 7fkQh_5s3S-YvgDVeQkc9P-GqezLywlU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240077

On 8/21/26 5:40 PM, Sreeshankar K wrote:
> Add RMPh power domains for SM7250 SoC.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
