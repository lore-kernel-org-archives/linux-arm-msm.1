Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6EC376BD6
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784644925; cv=none; b=alYkuq7lG+EhKuqc49KYWsfGDppaBCLaBhxEbjW3690sUIkyQh+/8W1CZuC0QLP+STYimBcH2Aas6FCNiYYUcepaXHXI2keg8Hhed0xKoXAsAKjAFXON9d0hi3puHHZnemT/iu/kstAkizx5hECIz2dec2z9TVwz+OdR555X7lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784644925; c=relaxed/simple;
	bh=yIVcQH5G2ut2Knic0OdS1IC1iLJaYh7soJm1oKSAToY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R0Via6VVb7lF6rEFek317aKBMkHbZ+fyuXaQyIGkbqEEZqQOHIkEQQpH9Tf5dK2e1vggfl6Bq6TerCUii3U8i0QaXqiHdwPaH9KN2oQhdL5bmAT9I8il6a8Y5lcyIwGsMUG6GTBHtcK7JkbN49s+GRnx4x/QOMwsYqiyuQcU6L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WK7Lewzh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fYZP5S+K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WK7Lewzh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fYZP5S+K"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDgGVr1399798
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K+EqBaZALqNLxdoOLebWj3o9+iNMrqHFuEKh9kAYXsw=; b=WK7Lewzh6GDaY9K1
	zfXBPsKoGt2wVXPdN1tVzxW8IqfjiVqjcevJFkpm3OozCGuDJCRsbLaO1+yciCkf
	JkN9WDneF2e0uAgQ2t/fh9y4zxm2jU/yG7Mlbd+eD+JsSBvJRkMkp4GfGAbLlIy8
	i/N1SdbRKpZgQuy+NKhsC19c3AWgt7P+AGAfM0eblhhMsDAMfgMYnJNjnI4xEUMd
	4/wLIqvqLLgqsCQfoVQlqqKOlpcq3M9aajTlz8Bya2DkYdiGY5LWkjonkX9XoKW8
	kT0ypnk4nJ/1ghuyM9z4gVOrqaG74nxnfbtFsyuUbHKBhvIb7zVaW/pUVqsms0Fi
	9ew1NQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1es2y1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:42:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfe75b7dbso24283481cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784644923; x=1785249723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K+EqBaZALqNLxdoOLebWj3o9+iNMrqHFuEKh9kAYXsw=;
        b=fYZP5S+KTB7ibvdRU1VUH4df0H5N/U445+uuoy3jSnX39xxwimE7sSD6TXohf7BSTm
         SuJuLuApoaI059soqqTft4ymRpfNxy1NAtzH6byqg25gH+Fgb3ZfQAL5wLgeyMi3RaTE
         O9wqliNS/qHNLyjdqdW56va0g+HJzTFGw71Oqk3dXI4Yn1KBtEJdbVyBklU3opU7Me+o
         acpezX9QAB9ACb/Q25XOiKvT7V1uufn6kiv0jE81houtB8hC4fOoHhUpJeUSmETRR8nC
         5V4agOyiCcSSImUZqnS3Celilgcse64U3DL5sQDLEmiVm/hR8ERHkPNuUo++lzhXaFlc
         VdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784644923; x=1785249723;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K+EqBaZALqNLxdoOLebWj3o9+iNMrqHFuEKh9kAYXsw=;
        b=iw0eWxY6Lc5CLZL49KNl643u138zSLySTS6rRld5F5qNpuy9gFT5zETqd5CCOf1rrh
         MbaefZCQ7PLJQiC0F5F545TG0Q6UNg78K8K+PyjOV/ch+t+M7zgWUTYKZFJXvPjPUSPW
         uqUI/7dVk/JLcvmUIXChUkcb2dCj4p68gh2pynkzy9GhGtJ0RmJABAgPg1UrwlKfqNjz
         B1DMxirLKPi/Bvs0x3DXpY4omi5eOLDUQ/hvEZ29AxKHL3gA5SrCgMr+4Ydv91Csqjn0
         iyDyXOD+rWWHf04C0VJ1xPjWavCbwaKmLPIVCYijvOpb6mAUFzE22G/H4SYlaYbRG24W
         nDlg==
X-Forwarded-Encrypted: i=1; AHgh+RoNSFtOacLGFWaN725RHyP0kQnhkNyAhoE3MYW65XQ3Q+PEWaSjsC7c/MW1qAnzGoNiZzXxPfmAofQtu1hc@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm/rAT+pVmd3CcgvQ5Jiu6pwGYViK0dRGuVK25EkhRZB+Xq8XY
	Sexd6V9sH6o5vjwuedXZZ9jZF/ldnPigNKTq3bzIpx2mHdEwSoDTPTiQSb7lJh/C+5uUeZtLQs4
	ChWrMA2LZKpwkK6qE5EKf8Z8KL04fK8qSVajuEocIT8p5oIBPt3nY82ZP1g7JkGVjwYqY
X-Gm-Gg: AfdE7clq7gxz3ubZulZ+acX7GDdk9Dl/d0IOTrsZGfvsq7RnlaR+I5gaW6n2dx7NqpM
	ng6+hDDlrjKi2am/cBAEALsaOt+SO3YwK+B9WOP5K0/YDUbU7OFzcIyGSA65MRXUbcnNSo0o+xi
	6TI9Iu1eKVIRykUU7xGiewdXWW+pOObQjAk/b0GFezp2ysooraqdyrBQbGDMJAfBqrRiwwHLD9r
	ysJjBWfFUiHOhcFb/PwCTTdvI0yXtWQlmGTz02MvwDQqv/XsHq04xeZSTeulssgykc1y+ro1N+Z
	mGYecm3njMF7gToIFKgb8aylAmWIjRYvyIARlVLP4zhkS6xSrN1Oqvt0sDgowe183XRz8E/JQ+J
	EOAsh/7jmVccRSeuDxmOgo3JP
X-Received: by 2002:a05:622a:840d:10b0:51b:8543:cbbd with SMTP id d75a77b69052e-5267223028fmr20945691cf.1.1784644922995;
        Tue, 21 Jul 2026 07:42:02 -0700 (PDT)
X-Received: by 2002:a05:622a:840d:10b0:51b:8543:cbbd with SMTP id d75a77b69052e-5267223028fmr20945411cf.1.1784644922549;
        Tue, 21 Jul 2026 07:42:02 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c19457d6f0fsm553667066b.36.2026.07.21.07.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 07:42:01 -0700 (PDT)
Message-ID: <8cea29db-d3ae-439f-9545-8d61eb620d62@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 16:41:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550: add Xiaomi Pad 6S Pro
 (sheng)
To: code_0002@163.com, andersson@kernel.org
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        map220v <map220v300@gmail.com>, code002-2 <hiez832670@gmail.com>
References: <20260721142147.1618-1-code_0002@163.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260721142147.1618-1-code_0002@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SPZykuvH c=1 sm=1 tr=0 ts=6a5f853b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=pGLkceISAAAA:8 a=2aqXnDry0AmhDEcoRX8A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: ty08v0epd-5pDE0rt2H0ze8SEEWnfZ1w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE1NSBTYWx0ZWRfX9j2C+JORAu6M
 u0D561RwfYqq+UkjxyyyuApSYC2fDGIgvkLVgLviRku0XSOuJLT9VLVFwLzNZKbc6ZRV0/Ge5rY
 +MDhLEJP0hblPmmOfE9bB65E1jAwGgrgG1pVqINT77t6ztdDfyI3fuFG2YSOJBfr+LrTc4d4b4b
 k+mUYdutQk0dOF5qeQoBiDqk8CcE+vgof/7AeOLH22If9vwYG8iI1V4PfU6mEA8zOaONd+6ztbo
 Qp0D+xeqv+g2+5welVBkekNeWm6wXS65lWnZw0VQGUoecozOm3lDcsvRfH/881BD63Dw5E4F1Ui
 WJ+3PuGzE/8LYlmHUsogdOIFUErheDjJmG9C+CLyiOd9SS3N3elWClesHwyJv8j3S9LDcKuhIUs
 MXoY7KYQlVYR/kLjzLJYbXXLuf2RrqqTPCr8h04uGUaqAhYG5yuJIbTC2Ch2M2EMt1qY99qRnHT
 iev38cWE8s4vEKePSaw==
X-Proofpoint-ORIG-GUID: ty08v0epd-5pDE0rt2H0ze8SEEWnfZ1w
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE1NSBTYWx0ZWRfXxHisHu6xe4PM
 ifS6McYzmIDbeYtyngip1n79SQpvSZ61bAq70KSYIGj1TRX1dHL1Rinf/2su2wRDVKLvUEu7wJ9
 HoD3SkMLEvo8gFuPCWluHUyHl8CJIL4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210155

On 7/21/26 4:21 PM, code_0002@163.com wrote:
> From: map220v <map220v300@gmail.com>
> 
> Add device tree for Xiaomi Pad 6S Pro (sheng) based on SM8550.
> 
> Signed-off-by: code002-2 <hiez832670@gmail.com>
> ---

You sent a v2 with no context and no changelog. Please follow:

https://docs.kernel.org/process/submitting-patches.html

Konrad
