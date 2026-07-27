Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2045C377AA6
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 16:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785170997; cv=none; b=V1YAzjk7vpq0nghmvJHoDnToWiTu5A8bpoTH3o1zRoc7uLfk8xymjKOBuXfkYve++AF7yfNjucQDCF74vI+Zs/AkUbByqwOikM07adaDE785itiSJT59ZUzvymvvcDvRXlgAamTeL5BFILFDP32bpZR9ufpQVe6EErfrVCfyV68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785170997; c=relaxed/simple;
	bh=znPle7dvKWP/hCK132Yclq9rL0M+HUEppJAzsumkx3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b31DoAR3QTdmIIMdRlMb9zxp4Ou7k//sCrl+kV9m9LUWoZAlQ2TmRGDvxBiucr2iyOptq7s3d8aUQq7xVstRxuqbILeSSGNha8wy7UDSxRMrDde1hj77uVZyUWk3s1UNEZZncMuWETJr4eg+tr7Qw1DUbptyPY9+DzVopfes0do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UuSqR4u/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RK7PpSzK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UuSqR4u/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RK7PpSzK"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDmAB13823665
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 16:49:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nnUsSySpB4cWUUulQpZRR2iFY96c23Gd4LJH83/DUkg=; b=UuSqR4u/iVS4Xadi
	HzszftTRpcnYWcZNjvHQLq9qHtGr6KV6scdgOC9z9AUhcAKQtNtlCuJ1C3+Rcv4Y
	PWvUI0Vq+wv/Wbj3h351QPEPj1NzZPMU47yXjjj7MMStrCeDOHkn/AjV1XJsbxhm
	gqWJUvZUwQByjBj0hw8xKIdUafrMDWFZK9skI6Mfwj2eqw4PO2B+wUHM+h1eOCx5
	4L7GMkR0JwlqGZSNI2nSRXBBhgwWnQ8QPj9OUkeIs/0qP5MyMWre3EPcUW1hl21S
	vGOf3KSNczxfAumhMWJG3gKewU9wbyA28RDrWvGKZz7BvDNDIrRZ3NJRgNvxb6ic
	/OVSrA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4nbswrb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 16:49:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c069f73e4so97571cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785170994; x=1785775794; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nnUsSySpB4cWUUulQpZRR2iFY96c23Gd4LJH83/DUkg=;
        b=RK7PpSzKskrRdS2Q70H7HtFx5RP7uiT7e0LC5Y3sC/KbkzKhScQhnMpuq5/IKk36Ae
         oXqxztOBxZGX4DHtACDxuNdiMQWVIBi46N+os3DWB6INyiMmkarzD5wllBOhQZnCH6aV
         nHGJtEpyDyLiX8C8cbhx34HuNh8FfWY/t28ZxBIXWhHrtTeadFPRWLUUVDNr8/bK+Trz
         dWTyHdRtqvtnbYryqGEkDs15a3tsZ5bINMjLtJnjIpYZkmSZnxfHmmhJ7fMwuYX7+Ow/
         EKuXDGwJujafq164Ez+g3bZzXNnTacHj0ssTdU76LQ3uoL3pLkj6W4wfOP5JiCNv1fyv
         4DRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785170994; x=1785775794;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nnUsSySpB4cWUUulQpZRR2iFY96c23Gd4LJH83/DUkg=;
        b=FqIZBuCB3Ktn3HV0su4h36hITNYwzq8t5hdYgfceeDcxZBaUn/wa1GvATVBcOqlUdd
         vZjpGqC04tzY4mnWCnu8C4jmuYnGd4wifbJcL/wHzdgEMqn3ZcYyJmg6FKom8cGb43ke
         X+UgVh32yvWWOwAbAdW8pDntz8nraBqUJb9Own2cSngaEree2z14VWkVUMH0AhYhLdgf
         4Zpe7rEqqnNfYN+8BLkm32k+0qY7oMA9jR2nKXyLKvoCU7/J8I78aYppQ+TCi5qqrRWs
         T0ItD0DZNtPHfnP7D8HhQddO/y4kPBbc/Ptlto6hn8MOXUmrX0d1QdvIk9cuioCycLe5
         2gSQ==
X-Gm-Message-State: AOJu0YwZ+X++87LAKge8ZAO+B2YKpgAcydMkPQuiWCzthFo8BPiaxRRe
	wwkDWy1NsDcfm8frwHB1nX5DMWlh+vaA7BGmZqeBvMtfmbGQh3q6QF/dh7iXx3mTuw1N/q53Wvb
	hb8KRGu+06sz0lkbwKd9iNvfIc0015Y3tmQWUT1UmEVyRes3aFmnS1mjxSPMRPkdM/+rD
X-Gm-Gg: AR+sD10T6Acb428PntaGvQtf2C0oXRRsehml/OtKAYqWESrqGJDo4NRd23D+rUKmNlw
	qwnc6p6jCjIWVzNaxhEMrygmaznj70nQsbyYmxVBMndjV97Q9uxzRz7e7bniHMCutElarinJ0vT
	pQJU3fB7U2l0vcB1hc7tS8Hkf7+bLnnOx8/kaMPzlspZ+xzxIoN8vxDjFKh8HSaNkiIIk3gXNVW
	a+60ffTAFaH5NQYFBJAnqyA9wCvwWqGFXlD7aXGIAvrfKfor3c0U5NjBEGYl0ZPgCuMnGTqGRqY
	NWOHfH9SMUywc5Ut6wtqvaHRsvomh52gtKfB8+FWCO6rRWkc3JZzA6qbhZv5gdSQH5G/WlqtIbq
	aZiZ+f8VE9b12HXfnF6yACQbY
X-Received: by 2002:ac8:5981:0:b0:517:5d21:9899 with SMTP id d75a77b69052e-529a85f9b2emr131699681cf.5.1785170994442;
        Mon, 27 Jul 2026 09:49:54 -0700 (PDT)
X-Received: by 2002:ac8:5981:0:b0:517:5d21:9899 with SMTP id d75a77b69052e-529a85f9b2emr131699411cf.5.1785170994034;
        Mon, 27 Jul 2026 09:49:54 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb50bbfc0sm2944116a12.2.2026.07.27.09.49.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 09:49:52 -0700 (PDT)
Message-ID: <b51a9ccc-b850-42cb-b533-1f80fb3945c8@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 18:49:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Enable cpufreq cooling devices
To: Haritha S K <haritha.k@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gaurav.kohli@oss.qualcomm.com
References: <20260724-eliza-cpufreq-v1-1-38f01e47f0f1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260724-eliza-cpufreq-v1-1-38f01e47f0f1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kL_JiZb_4v6SRocm7h81iTsF01qp_X-n
X-Authority-Analysis: v=2.4 cv=cJjQdFeN c=1 sm=1 tr=0 ts=6a678c33 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ipmcamAeJJyiMEZOMjcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE1NSBTYWx0ZWRfX1j3PavidRctx
 k5u6xtPbc9ceEUxn+mFxagp86lZIUPAm8Gcku07br0t963+YD87inCgnD+6CzSUWDJhVrOmj9wt
 h1yN5s1bCnbBVeCXwj+iuwQOKdkDLuA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE1NSBTYWx0ZWRfX/jiDc0lGmSBw
 8D8IzulWC6URxdpFORHR06cLuxYWM3bZjpArbsaLoveH5G9axwDzeYWdxWVcis073/utgtEmnLd
 zMcBDar4mLrPKR24k0RgVCXPgQnlPQs2zlihKXK/4xLAXWNqi0v3MBLJeuP7fKLsZ3uS3l7VZ9x
 6xFmLq5rsU+HyvCNDDESurveNLPOuHIZ5aON7r7DcEZp5oZ7ggo01JXsKON87StRfnkZz7GrowH
 AATjz3jAeKwYfw3jbMZ+oLIEshK9Q4ImHviRStIJ+SY3Be5mwkBvQi9pBSFkbg9v/t5ofTwlgDv
 zZeL0hEB/HEyt3RWhoy9kt685bpnc6onkeTVPZ+XruzMOzrtH0KkWMnZKriEB0T1fCYog8y4IZN
 jt113zTiDH8sWhjp1mvBI4oYIz0a4AOE/FUeq1QIcqEA3gvMjbWF7kYRtXPwea/oO3VfUMeGj7a
 5O6nrar+gWTpGGLfIDA==
X-Proofpoint-GUID: kL_JiZb_4v6SRocm7h81iTsF01qp_X-n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270155

On 7/24/26 7:16 AM, Haritha S K wrote:
> Add cooling-cells property to the CPU nodes to support
> cpufreq cooling devices.
> 
> Signed-off-by: Haritha S K <haritha.k@oss.qualcomm.com>
> ---

Please make sure this is taken care of in the initial patches for the
next platforms

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
