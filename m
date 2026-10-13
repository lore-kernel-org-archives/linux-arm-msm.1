Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C55731F986
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791879241; cv=none; b=bND2AxXNPlxV3ff2Uy3+jWw/7dSlQb5gTGO/eYzixvANvjScUOKl97dtNSRUZvQ2QCZJ9dQWQXsE36RXWxnrhD16KJFsA3Xkxf2IORkKWkmcypxkxYIkQIlegmlf7sQgd/V44SKS5R5oPi60vq7nZwIFgEy+m1QZW6X3hMew5O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791879241; c=relaxed/simple;
	bh=KB48VjcwJcdFoEyL1UN4JBUVOXRybNpELXvG/sYq2zE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wb06BRqTLMWH9tffxsladmI6N4yc50VzwMhO8kZ6NkB8ionepj+ulpDsu41UmtFf24twijcn+FdvW7lucL6hP2fYPvwfdtsR5o4WxSkl0cKWRCntkds4KieWKKqXlYhELcZ2Yi0mIGTuzaFF9sk/y2jxifToev/9csJyGsAYUB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=akl4rTte; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E06oGQD5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="akl4rTte";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E06oGQD5"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D20mAC988774
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WJdzVCQH4Qf/a3uv4uEeaxQnvMeNIwDQPXbAQYhpzDs=; b=akl4rTtetvUhueYG
	lX71wEvuTkaEw+ZVwYal6+1bouF4goqpDDD36wZVv2tXzlRlAWhZwOdTof0hPswV
	eRhYrEWF3a71sOjjiNYYyQXVTKkfPmgpSemMXdmH+zl0bHlg3BzoUjuGS1e8zfCi
	4kPWIAsUcPZPUcC/lr6HZvL31ALeBFIDySgrwG4qCArjEl7CgNEcf98p30QpOy9n
	oy659c7XwiCTs4qNAtmX2mzbDDkXf9OTsSUU5tzveGOvb6gir5oCg5T7//TUDoXM
	Cme1KNzybjqFwd9/NTCDH8zzQCDIvMulDJyMbeMeMZkrOIkuQr/ZeGcrOvNElQM+
	xwkNow==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98hc9v9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:13:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93df7a9466bso26997185a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 01:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791879238; x=1792484038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WJdzVCQH4Qf/a3uv4uEeaxQnvMeNIwDQPXbAQYhpzDs=;
        b=E06oGQD5wLsh2fmJ5DWHzYAggFZJfzpoKRItWDWjuF8DNLOWtgUQrfXLsNqrRaAn7k
         C1DPYtjnExt4r5JnOoJHWP+gHEYd2XbkEu/v0VWVZ7XZZztbe8J/YyLF/lCEa5e8Vq/w
         Egd8k0jE/5/j+HLbKXGEMr1Ehp8RGZCHoH0TXFbyjPX0u/RqUlJCUqCr8OVFDT/PzSeE
         bnSMShSUJmJ3UCTKC2dQrHaRbm/Z9S9sXdGBMrj85e0hA5JNbabHEzvBZUW3Bv+y+dgN
         4FzaZRAWLTe5eEWlNqnnFfD8PbwOnYD4rRr6MOI0O45fE0mA+xLlwP+9wBh0UISf1k59
         ZU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791879238; x=1792484038;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WJdzVCQH4Qf/a3uv4uEeaxQnvMeNIwDQPXbAQYhpzDs=;
        b=neK3PEePy/xjlq/e9h2WlbDCxeUsJVCAbCOsWB4ROAV/6Um2Rb+vQyyljpGHYJPZXL
         2j6rpYxRhT5OBEAT6Y6JnkIEoizQwfZdanHy60OuXB0ObKdb4hy7vhRRERFCIuDcijA2
         6sfYKFWU+DyCPE5++AiQlXGoBcOOX/II/2scofoxcs9FxMaAiBxN4vDW0OWedsBXT+6D
         /UUBulLNTdKiQHZOfUtx7fNfpbaLVT0TpkTJP+0y6q5amXb/uDlAktiZKTCfmpOKvgfu
         rRFlyzog9L32GT7ragUIAVNLDZBXRNDDtK1GzqrH0VoK3TnL7pE5EvsU2jtEj/e83Cqj
         3r1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwYcLezinxRS+hgBUfb+L8m7oKTaGtXS2Q8QQc1E0GXmuuUVAUflfTWWA2KVKuDBS7KATf4EpEC2Diox7sH@vger.kernel.org
X-Gm-Message-State: AFq9FYJCL4HHIuOxLF1cKesKeyEx4BBDlTmtC6zSu/fzbFGhz12RBBvQ
	v/O4xOWT5HHC7jYx5s56arwvcylB17znBfbIZflDLFmX/HCM/u1QJA5RGHyJ1Q/mQQ7fCYajF1z
	y8EUSYXZFunVwVySL4qHByP75kPDnHesSJEbhsorJjVYQx0AEINx8GNvKgKcpDsKPTA1j
X-Gm-Gg: AYBFou3uUkZY5Qd5zPta9eiML5dQ1unaOdlEckXIKTh/7ME+TKN5fTc3PDAt6+1LeLl
	42rbCtrgesjMiKo60iFJ1af518ve/yXj5ms8bX/FO16iPEFlyX8H1BpgcyjhYr7Fj5nk9luyN/B
	TTC8sBNulsyT0znsXeb7gWj4a//Z9towtm4xqYQo7s57a92sUDgbQQKKUf2tk6kALcfITcQqkDP
	sdJRfJg3XstgOTeQdMW6MAVyfcz/KZ/kvCa+tS1jEfwaxx6oT1Q9AsbgrLEm1X3pSk4P2xTXPA3
	7JxrUCtNIHUtS3qiPvJqu0dpFYZCKgWWFYwSnq0mEs8Blma3MPoLfRUVhQXhhelv+7x0PqET+QR
	cg9nqQHn4yOfzVUgmXJWFyg==
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ebcd2b830mr1998190385a.0.1791879238329;
        Tue, 13 Oct 2026 01:13:58 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ebcd2b830mr1998187985a.0.1791879237824;
        Tue, 13 Oct 2026 01:13:57 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34feaf0751sm197267466b.35.2026.10.13.01.13.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 01:13:56 -0700 (PDT)
Message-ID: <cc9c2f25-aaaa-4113-83d8-4965822e4fce@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 10:13:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] arm64: dts: qcom: Add a minimal Xiaomi Warsaw
 description
To: Zhang Jiaxi <Z1529105815@outlook.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <SY5PR01MB10600FCBB6CF8F9233D1214BBA1932@SY5PR01MB10600.ausprd01.prod.outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <SY5PR01MB10600FCBB6CF8F9233D1214BBA1932@SY5PR01MB10600.ausprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzMiBTYWx0ZWRfX8Vji0n9KDcwO
 1QvlpOCZypTJruuTBt5vl2YP9zJhogHvuQ8yKVgnIygAULFHdj0xM3cLzdgWRVACfWcciND2pow
 g300PxYItRfC9V5uGm8z1UUlay7TB5r50T3XI6C/CohBQTM6lpSbbwb4geJzssMZPMaPq1+JRHv
 WaiV6akwRLaEFyR/gGTZpNeVrqPrkq53IOGQsloLg30iw8fE5cJ18ZFCIw4U0/NDiremuPyTIOf
 DKyf3cTHg7PhIM0PwyZviZKE2PLvvln28F0vwWN0NgpS2soKCbSlJdbqgHLMg2oy5mm5+8w0cBA
 eQkYIeolKnM062c4XV3Z4TIhMfprWc8oUii0H4sH0Z5iRUwUDkMU7LJm6iIEb9fgojI8whogWGR
 mby65YqDF8LcU5oMrtoHDXRPNW+4qYOOCsat/Ob+ScS7+c7x7Nj5qmwB4hkmrPDcmY1bMdPW+be
 j2INZttjkbpzyupclpw==
X-Authority-Analysis: v=2.4 cv=VPVIDNPX c=1 sm=1 tr=0 ts=6acde847 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=cNoKYFeJyS4W4/1HdvzxLidmn8o=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=UqCG9HQmAAAA:8 a=39_P3G3aOQwE9Waq5pMA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: uwhOUT0OnRouV32mLRNKTjCgmhYUZUL6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzMiBTYWx0ZWRfX7pJwx0WSc6dv
 TIEPcYb5R0VfLE81GHmDlBZ8b+NS2CsuFilz1KoRliGvi8xEQB7l8Or/vFOmzHhw+kO9Wi8jvBn
 WLWzw3UcXlztLf4bq88GJvS1mrGYYG8=
X-Proofpoint-GUID: uwhOUT0OnRouV32mLRNKTjCgmhYUZUL6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130032

On 10/9/26 12:34 AM, Zhang Jiaxi wrote:
> From: Jiaxi Zhang <z1529105815@outlook.com>
> 
> Add the board identity, reference clocks, PM8550/PMK8550 devices and
> keys used by the v165 board. Retain its inherited debug UART alias,
> stdout selection and QUP wrapper enable. Keep peripheral bring-up
> and the Android bootloader memory contract in separate drafts.
> 
> Describe the board from the SoC and PMIC includes, rather than
> inheriting all peripherals of the SM8750 MTP board. Reference clocks
> and key pin configuration are retained from the MTP description
> included by the existing Warsaw BSP.
> 
> Signed-off-by: Jiaxi Zhang <z1529105815@outlook.com>
> 
> ---
> This revised minimal board has not been boot-tested. 

Please test it.

Konrad
