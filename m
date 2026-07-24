Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F4E3515EF
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784887666; cv=none; b=R0uIBfPnYWXJZGeRELMhmdV2Cht1Eq3p7GZgOdJCyZTAmdxscZpl1WhvACfrhnGaFQXeuZnxYgK/8Dl2WbSnCzSlAw7Zxwotq9CVCb6OeTLM/COY7Vp7p823ybGyeiVuASpLcnOw4mfLZrpOTsHE5qcmQBNCkmikUKGufZRQJoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784887666; c=relaxed/simple;
	bh=EaGN/nByifhEW9Zc80vl6P0OpgbqCWFqUJyJWIHBrqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fs9VmUno7jLo+2NPle002XNpmhPUjeWR/5uZLaiRHOFdKsrlxtaneIbPeEs/p9yLQSiScD4zQYyJwWi7c/HoCC75Nd6k0rd/KndyZA/yOepuY+R+bLLMEbFILSoQJm/YxbSa0Xh75/8ctsbxEjCI9GmBNvjJ3OkC1NXvWPxQHqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qxwx5qZ3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kDoRgE/4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qxwx5qZ3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kDoRgE/4"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lUpa1510150
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WPrv3G3rnxf4/ikhwHF4l9kt9tuml/Fqoiz4xRaUdbU=; b=Qxwx5qZ33jTNYz2n
	k3LvWD2Wa2/oWsyA43HXy4XgxT9FsajMV4F8UwOTRamNzo1McBc9Sy/MnkEAfkm8
	JvAr6RfZsDtkJHPCfda61MjPSGfeRStY09xBaw/czObWzGOYXeo6g3LaleU1JCUw
	Q6TUIyX3OReVBoDHCrVSb4YtGEJpuQ1Dsa6uYXc0AFsgMLZkkaVYlE/AYyC2gXY9
	clwt4ZYiU7DeZg+mWNrnMTBZRuBxC9pus0g5oS8oyZnkPORU5yhp6Yx1ABO7luOj
	0rtR+ys1K/1As8swtkSeL8DLEG3IiYfowI+MHMjwgyJKXBo2HyUa6ZCAUf76Ay3q
	2fPYxg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkusrt4wy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:07:44 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb5cc1e13f8so350532a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 03:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784887664; x=1785492464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WPrv3G3rnxf4/ikhwHF4l9kt9tuml/Fqoiz4xRaUdbU=;
        b=kDoRgE/4k7rYOZ4b8OdN/b2P8h/hoOqAIQvxREa8uxTo9c/ljUaF5i2CGt5977j3DA
         WDoHWNx/T4IlN+IWggKPKwn0Bw79oQKGFCZza+da/BFkA1ez3eZZaP9roo6Q7eJDyTun
         AkG+lq/c1njmZR/Tdar2kQLLAyRSfNSjv8lUFwx6eYS0QRh2wrWkck90R8cL4CnuHadl
         XwpWNUpMGuKUxGf/1KdM34epeWXQHaKiBUl5xJf84V41//08VFJK4JMIRlNqPOThVDb/
         8A4OcDKeFZ575cn0mJthkRqd6WwIQLUmIuKaH84oswdwf1kpmGbS1W8qim/dr/vsSjp+
         oFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784887664; x=1785492464;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WPrv3G3rnxf4/ikhwHF4l9kt9tuml/Fqoiz4xRaUdbU=;
        b=p/k9rls/IBfU0CQbV6d7gcjC+dCvobtZwveT+fv8uzdlNLcGPZ/cuWqpkTi4Sei8QA
         pHkKIxE9o7OVeF4ubPXWKZD6q8WPKmWwezmagt+mj3qQPZT+oh8DPMjsKLa9b0riXxA7
         GIi4t05otAZgvv1aqV79GwvRwS6M8H6StBz1MFvUM0otgcPwv7p7JSBsH/7PgW5cK4DC
         RoTLukuerqLgagnLYkgGZITMjRiGf7m+yvFUJg32x9zpk+3jm1rcbW7aFA/Jk7dKnECg
         gqX8DPXKLDBf9jFRfVWo892lNITS+/EVBmuNVX53GK7MakMl4a2VyEo7az0vKTimiq5d
         5wPA==
X-Gm-Message-State: AOJu0YyXmEqznk6l5jKWzwv30rlpN2HGBUsAg5k31nHClnyijAL42Pwf
	LsB9Ise7zG4m4hI+WZHSiC08Ez4iO4Kd+BGtPuABw6H+m/KYmPYNTAfmtnT1oKY6u+H71+WtY17
	HpzILUsjEg+viD1T0Q8Gm3aE/Cem9VZFJFAREfqm9hmgBRb0JcY5HdGXti47qjP7i6xmv
X-Gm-Gg: AR+sD11GI9bumbEP3gBO9ODeyzuXGz11uI1ka2asz2dX4FKA8Heh3Jx5+Urzyg0MO8r
	tRdXGucJOf3mbVaS3Zj+VN1aQqJTH8xuPTRe3prVxsJDgISI46UR0do9B58YnBkUkPJmg0cVq1A
	kbTYc1t47nAE7WzvK8w/qzEiSdAyNF3I+xPo1wM68WxLHWCyCo0oJXK4Pzi5tYKax4JUTuDkOcD
	FG8hPytJDjFsQdaCjSlr1lPhxLVaXM1hcLwEn8nsfwuxl26zWgKPMz62kmq1RRO3Mszw9S1Lkkh
	rIzGKOqlcfJd4ZdLfEkqvuyYjYv5ERdGttV27Wy9QF+tCmK6kbErMZIkIsjYURsUqYmek9r7xXb
	Q4Y/s1GIXvJ8sAj7GvhH3Se8lIcCjbiGDxBTdjsrTh/voRvhia8U11lJUpKTvtLxpDg==
X-Received: by 2002:a05:6a20:12c8:b0:3c3:875d:704d with SMTP id adf61e73a8af0-3c44b00802bmr7811669637.25.1784887663881;
        Fri, 24 Jul 2026 03:07:43 -0700 (PDT)
X-Received: by 2002:a05:6a20:12c8:b0:3c3:875d:704d with SMTP id adf61e73a8af0-3c44b00802bmr7811635637.25.1784887663493;
        Fri, 24 Jul 2026 03:07:43 -0700 (PDT)
Received: from [10.133.33.207] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f1c4c3asm3985530a12.31.2026.07.24.03.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 03:07:42 -0700 (PDT)
Message-ID: <875ac597-83a5-4fcc-9c45-fd6ea6de5d09@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 18:07:36 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: shikra: Add coresight nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260723-add-coresight-nodes-for-shikra-v5-0-fd5494471b36@oss.qualcomm.com>
 <20260723-add-coresight-nodes-for-shikra-v5-2-fd5494471b36@oss.qualcomm.com>
 <52a09911-a846-45c8-a9d9-bdc9371acce0@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <52a09911-a846-45c8-a9d9-bdc9371acce0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MiBTYWx0ZWRfX1rLQg2+Tng6d
 uXCp8Ag9z/wnlw1UGnJRBfYIx2BoxWq0xI6lTHTFpDHmII41Tf1zcNYhIYbUJ+/GuNCJ1Y6xQ4L
 m89qsxy7q7kMzOno4hh7PULgh+21Tj0=
X-Proofpoint-ORIG-GUID: adoKELAefeOeDIwOdojIUd3SI75bCgY2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MiBTYWx0ZWRfX/M/C8ddgg04N
 fgBe7rpwXKXtiy3wTDdR/gisuMu8zOXv4W6+ZDLmRmYt5QCFu6cUXB36HYDONZTOKi3vjOZ8tY+
 31C5FE68hbHAkLuvuddcH+zzvbqiEocnlFvZ/QRB4YKvicQ10Lw9xyWy5pOl9F0EDeNax9fB5D6
 N0KckyRt6flSx4bG7xF6krdT+uTKfOqnmV3XkVTMx9HnoVOPuqJJFLqdst1kCV0hLp3TrJK44Cn
 BsaThmJ4bnzaLfptnRfJ7dTbUcYBhvuAn1MJBDpNKzyiZzeFsYsazlDox6REzgza059n5iv6zSo
 /8OmCjVMQlIuBcDaQP2yHHrsrMh9IKgo/uHAY9//iCSrwQCGsMAaQKA52U9gFyIT7HU1MNHBAj+
 n9QSUljDdeffC/x8zi9A5tCR5r+MBl7/GPD4+dXayYjWrNvaTL6qRnRc4uQpn8hS9Diye1p9oFQ
 I0HY+NOPlfp4z2RG3Vg==
X-Authority-Analysis: v=2.4 cv=PtejqQM3 c=1 sm=1 tr=0 ts=6a633970 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=DtxiUo3CK3xeHLiv9V8A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: adoKELAefeOeDIwOdojIUd3SI75bCgY2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240092



On 7/24/2026 4:18 PM, Konrad Dybcio wrote:
> On 7/23/26 10:26 AM, Jie Gan wrote:
>> Add DT nodes for the CoreSight debug and trace subsystem on Qualcomm
>> Shikra SoC.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +	modem-etm0 {
> 
> I think it'd be better to keep all ETMs 'etm'-prefixed to group
> them together
> 

Will try this proposal.

Thanks,
Jie

> Otherwise
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

