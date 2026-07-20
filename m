Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A153D25A6
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 09:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784538805; cv=none; b=dZyfFptBrDcVQ55ds5QFs8rAhE42JP/46DBiep7vrKt8Np3Q/OiF1ZI9Ll2rQEwvUznJsiur9VjtFj8jmhzfPIgAm1fxtZiT+PwpkKKETL9WjqPsX/WVzOzOLQLG5b8s6N9AZJatPxQf7bQ266z826NTAy8m3Au3Rj3cWgDs/2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784538805; c=relaxed/simple;
	bh=20nn5wJeDlF+hmHrrk4IsFjcAIFgDZlGRKYPV5ojj1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iNqx+vkbKt5FO4dnvlnlWAt0siSUe3Cy/Q5myH63PcUe/QNqzKrDyXElh68Bmd+QOFSejT+TuZwT5LIhY3PwCKzTBS/NtJGDJOw88fYBluYfzAlysiCt7pa89N5w1aQuRg7JoGRcR4dUYVYYqGQpSqdNcPOggrPprdneyY1lWtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AVn8AAFk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dTHvwv5N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AVn8AAFk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dTHvwv5N"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K965Vg2110642
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 09:13:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KgY2JyzUmY92NsilhAYHcDIk6+jUtLSlAIUQZcVPdZo=; b=AVn8AAFk5KepBkvN
	hv7VUz3hvMpyv2FMSVC3Kcl1RGnz/QEj8S8CnZMcAEW+tC+LWd9/S3RVrkztadvK
	C4w8TOsafvKS5flgx1YKMAXogbqc7YCSIBozMDLHpRe7Ky76ORhdgeFOFpVLDJqM
	HGmUoJGNL6UHzpRrhe9+BCjveFrmEbd95KpNr+T5adNov4wZ4tecQRfBAjiljiM8
	61FkqUkidXiY/yQFg0OiLppTkw0sUx4nf8iB8fTUzuIHRjBVGvXPGcEIucPIftJM
	TmTr57xxlNz5nfFWajOLQCtd/+xVjqeawxYxj1IiLBPFww0IONa+qGChWNRfpqYN
	ec5b/A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgre81bu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 09:13:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51cab6f7517so13527831cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 02:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784538802; x=1785143602; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KgY2JyzUmY92NsilhAYHcDIk6+jUtLSlAIUQZcVPdZo=;
        b=dTHvwv5Nj1k1HrNCvgocS9gJbN0ps4YFrBcqb3/wgrjMJKixO1gpZJhg3sVWFDEaXR
         XemynN++g6OsZKGRp2utHy+JugLi+20GhQBfa0JQWq+zE8WTtKeUiNDvN9yfi2zONvTb
         d1xu1XkQGiR4jLBz1w7+sNrCTygz1WPAeZcA+nKkaxeoUXYCH9c7XDhadU6MJxooxbJx
         9aKQO31dg4h6wusaiJiip2ojcWBZbbRDbGg6/2sB26Xm3ui9GA57UibWEOmzWhZ76y7K
         H1bRpKHX5k+zVrSgX4NAmrhuZezJ1v2ko+Jai2x1BFdi4NDENaK9Xs4IwQORG0yw+IqK
         +/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784538802; x=1785143602;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KgY2JyzUmY92NsilhAYHcDIk6+jUtLSlAIUQZcVPdZo=;
        b=EHaufcDxztb90gW40MBvdAOPknRA2BBpRxajZT/QHNskfN6Hd1lDMq8eqMQfZh+uNn
         fokrk+zCVP+fkEL+P6XsAfomYogu4oA/m54lLudbec3jjkEDvZSvFi+6W9JojO9TxFMx
         lpqUpxxYjQI/v63OAbgcJ3d2a+ckbuut+Yz6eR/4kOf5rvnYHkIDM5iYQ1tzj/wmN0Ra
         2B93vX/3EIAeOpKaPVFz6PWrJMDZiQmnqyO5rtm067OwQrwMVLV3N33F04E2l9zqb/7x
         JQ1DT9qdJfNZziyNxqU+Iu4B9rrRNvkCF5PCkNZlZb+SQli6i0M+ULRxxTCHOsYOB3ZM
         YxIw==
X-Forwarded-Encrypted: i=1; AHgh+RpzMSBahvmOrF/8tSH/GUzb0aus0ey4xHjm/yLximi3nLQplJ/oe1NCHf5dTCDrDk3OuCX0cR0S4sqXv5Al@vger.kernel.org
X-Gm-Message-State: AOJu0YzG/5DDgQlxpeSVSwQTWeqNzeca0ege+bd7n6FllP2ryC/pnrlg
	thNfUvDFEiXyVwtO8eCyaYk/crxZry7TauS7zm3qdkyKza58yItJCK9yrwYLQ1F3NiVM+wFwjH2
	uPkfIUBV+Gz+LAoUjEN1bYwD1BFWxcZn8ZuakRH1iuoKpoiFaM1utIwnKwjHauJFD2wQ+
X-Gm-Gg: AfdE7ckJUB8lbOHZpw4+x/zaYSxiVaPMNIBfVvwWpCp+jMpZACnDL6fb4g01Z1+hFtl
	y6tdmjSONCrUcsMnjhgYLrHmUXFnBN2dqXvyoQBX+rB2E443r4w1FsQskdEDsR/+4iVvXig4j48
	U17VIbYCFuJ4Joi3psYMWGUG2yy1Xpg1DE+MfW9rKBQj3XBUcTWKrUy6T0+f9A6QOScaIf3uvnh
	aYql3E4iE25yPwBH9/X3nikGijlQGML29KGbBlGCL5HSwB0KW2oCmVCzYdeHeHJLeBCWR1dLOwo
	MKWB7+d+5R8IFZnJ9tVic2DwuL9ER1qXy5k3o1/fmYCpDPt21elJ4RuPuJNyYDxNrOQ8yrrg3p0
	oU4qwKtj7rKkmJTHlHlzhjAio
X-Received: by 2002:a05:622a:a993:10b0:51c:845b:ac4 with SMTP id d75a77b69052e-5213d7b01a2mr74484681cf.3.1784538802205;
        Mon, 20 Jul 2026 02:13:22 -0700 (PDT)
X-Received: by 2002:a05:622a:a993:10b0:51c:845b:ac4 with SMTP id d75a77b69052e-5213d7b01a2mr74484401cf.3.1784538801789;
        Mon, 20 Jul 2026 02:13:21 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705a09a44sm430117066b.19.2026.07.20.02.13.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 02:13:20 -0700 (PDT)
Message-ID: <3e7ecbf7-20ca-4871-ac66-bf52f3a5012a@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 11:13:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/16] clk: qcom: dispcc-qcm2290: Enable runtime PM
 support
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
 <20260718-shikra-dispcc-gpucc-v6-4-62703e05ef0f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260718-shikra-dispcc-gpucc-v6-4-62703e05ef0f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEwMiBTYWx0ZWRfX1FRNL5zeJQa+
 0m7Qr+c+5KiM6wsOTUhlpdFKO5FSgS3GnAVCroo4jChO3rCU8dF/CrUhx1NbakQrTFDsoJcqQPK
 oZZ5EAHkJNyJsFPblzu3icS9CwujK/k=
X-Proofpoint-GUID: CEJuWtMNmC2KWFwIvnvOrmwy2Wdz_vNo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEwMiBTYWx0ZWRfX22jnMPlyRStT
 qxQFvCnT05y2Or3ymwuWcaxLS5XAe9ycSwyUVwFbHPbppXvx+ailEhOnIEqqiwGBfBFSLm3B8qN
 6sVgSuhCVkf46zC/nEq5z3T9Ve1AWgSzry2hQ6fpr3rQh/qu2z5IM3cJod4N+6FWEbDEbkXPcaK
 IIi3owVc0gaJZPzAckSavyjVcteuzmZaSzB1dEpXK1wnPnX4eBHuyCpZ3AFi2YlPvRwsZ0ID3fa
 w0Z/YbB+zEA/vGe/o6c4Fy4fWRPWoKJ957qr1dJZWLZouAIiGF+/rQlGxRbXJjHv1MzRyUlKWFG
 z9dO1i+IkeopDXej2UvtFxcJJqNzee25ev4YY4Yvzboxxt9TDnSwwbNvznP5XZI3q47OfZ6hJ8I
 quMgoxEXCIXKgiLz62hb3Aj0qcGI1ZWbNpifd/eN6+ymiP0hH/fPhrpgVPlWZsnD3kHA1e9poUl
 ZXxGPbBE8VliIggPYEQ==
X-Proofpoint-ORIG-GUID: CEJuWtMNmC2KWFwIvnvOrmwy2Wdz_vNo
X-Authority-Analysis: v=2.4 cv=foLsol4f c=1 sm=1 tr=0 ts=6a5de6b2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=jzfokHZFP97BDSaoeOQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200102

On 7/18/26 2:56 PM, Imran Shaik wrote:
> The QCM2290 DISPCC is now associated with a power domain (RPMPD_CX) to
> propagate genpd performance state votes to the CX rail. Set use_rpm to
> true so that a runtime PM reference is acquired and released around probe,
> instead of leaving a permanent 'enable' vote on the power domain.
> 
> Fixes: cc517ea3333f ("clk: qcom: Add display clock controller driver for QCM2290")
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
