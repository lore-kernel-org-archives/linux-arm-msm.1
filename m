Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463396;
	b=tmW5HnAKGgKs1XwFtmdKrONvNSZvPUZNOqbghm2hBc8L6TDixI7snFt+ATZ2vteAR3vj
	 9iQI7QRRHJ6w19QxXGRY2AKXQxyTvEyYtNPUHQ25jX9zEeJnWpMPX321diQtmx/bAzMRM
	 N/AbwFjPeD4UNz4xPvfjRb+d/yO9LdZ+RVfC3kVb6x6wcM43b+zXOVvlojkdxWSCKt2Xh
	 yEW6s5TGOrRi5GnB/WORUIJiQg29/mTCJziB6fowZSK13VdvcttPIFzp3UcYJkSMo/z4f
	 LepyqTwjzfddIhyfp0WWZWlnHYSttyYsuQsoX0HPRL/9spzHzoZSqqiS3dPTygry5iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463396;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CVJa0ec1ykJPShHAKneJEZU3KbXeSYGrLRw9bAOsE8E=;
	b=kV3utbmoXQ2QM3mjkTt0Vkm+6yRBjdx4mG/zjt1Cgbvj8/1wY8l+WLCx1qK34GuHu6gA
	 +dO0CLZAVvkRRr61HItoUtRsvIILaM1WKI26i2i65vePoX1wztGx0tsfuAlG+LDvWL7/g
	 Uv88YVMtkqPp8JdsIqdmlbqb/oQcupAAdReyDE6boOJcX57LlV75fF22g1HZrkIP+dWQY
	 BlmdcZ6dZuw706VD3LPSPl0QN4M4kh3ubZtI51fqet/XFOi/xQ/CaGgsGAG8m5UxpPY/L
	 0lW6SuV4gZe+59p0+0ovHB44TY5oiRrBiyJlkKAgNfPWwC5z/sdSzzBG6Uc+gg5EEFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oNFDQYDl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QFCerCUJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A93606A687
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:49:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30A93606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oNFDQYDl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QFCerCUJ
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGuhN2486557
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:49:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CVJa0ec1ykJPShHAKneJEZU3
	KbXeSYGrLRw9bAOsE8E=; b=oNFDQYDlUqLDGYSfWQjJgUc0WhKW8Jlb9ArxRPaB
	JWgxzwCvr56yY2Doe23s4TlGFoH208Gb8rALErW8OFPHulDOE3OqhdwqsyFpuZfY
	RsrOin4v5QtflLUBmxtjLCLj37mPfH9H1R9KXC/LPUljoBPOoCYYmP2bA5KAWZ2h
	r6dMkSUXHyehmwbWW+CTxb/oC7arNxGXGrxNO4SlBV1ZPXk1TaZfnlu00sfI0CjX
	H55FTe4ZsCkd/chPEE4/qULcu6G1Z4pQqwjpyM5Ob/iznvZBK6H/ElhcZbGlNlzh
	cf6IWlY2a++noDatMBjVbLsyB7m0gD1PyoxM4QQmweTBJA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy037hr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:49:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94970ad532bso72180885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463395; x=1796068195; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CVJa0ec1ykJPShHAKneJEZU3KbXeSYGrLRw9bAOsE8E=;
        b=QFCerCUJsn/K8lSCVJmN/r7GGi+o976WtwkmAfwUwhXiIYmx+I6O1FZ4iOsfFknVeN
         7DDnPKwjGRx9rdtP9zfp+vawQhvPAG9XF9HUmzoDOWTKL53xhPLWo3QVzQLYTps1JhwD
         CZBIGYAmlQi2R+tT0kesuoeNv5ZwnNt7ktpSXU6EMxBg3YgowScoIs58J81lvFYn25dW
         jvV+J/YWkVjuXgrGbEeVUv/4TEdpvXOiZFNe8N1y3VQMWV13F9vUzPOn9m1va7T7p7f8
         gH42xhWZH0FAa0TprYTbrvnw3fuuEld8RMhZPRLkhNJZpHClj4MRi8zvqI2uIk8QPJyH
         jrRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463395; x=1796068195;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CVJa0ec1ykJPShHAKneJEZU3KbXeSYGrLRw9bAOsE8E=;
        b=i9JtqVUXJctMQA1umeGrqmH962/Ax7RJ5cR9dR1YUfGP9S9cKuPzABJkZcodr/bE9Y
         C0ZQ9fLWjL6ghAhmIyoXQDg9TIT8Mdw8JVS1GDp+9+jRnH9MQi+PNW2mXoP8ldKK3NKH
         3tnKCRK8u/aJZHVelm8WqMhsbWdhc83lxV5DDvXdGfMUO5ClEgmrzpZqaV8QW5niP2Kc
         r2KtAfTL3CFJiKB94OXPeOPeA0Pu5bGnC02SOu1/vof8EYqeQYzZVo9E5bybM8oJdxlZ
         t4RNH+7gpyZEqiae1CeGFA09KC87Q0L8RLFWAr7RDpIhQz6nCxMwkdhecsZHqRALs8Or
         nyzg==
X-Forwarded-Encrypted: i=1; AL+hErFtFgN3gA80QMq7r2kXpCTMlb5DiYXAU4Rx38e7Tr3mfS+x+CLtmuSG5pcq9C6eDiRUwQZWyyd0yiA2Z7pK@vger.kernel.org
X-Gm-Message-State: APuU4Z8HY4ppNZTSpcM0z8WECfLf7QmWDXNYt/hqDnw7o/Q8xvxUI4dz
	8ZKzsuv4S7WTOskXcVHy8DjuqeMNGIBnV9IkOC5CUL4EoxK6PwcQUK+hSSKPmYr3f2cwtZG1gHA
	7jAxMjlzV/al4Y583+q5dx1d2dkOjW9TPJoHgKT7mnCCf1xoWh5exNMe0JbKS/vkNIOTE
X-Gm-Gg: AZFdTZdd8NVuUV9fH1tpfWYb60aoK/rd2wdmgkiFHuyI2ZfmSnDELiULDjI8Y/i9nn2
	NVUf0rKxhiFQpEwg7u9sXeahevQav5dNrhUjJvQxAfhYL7gKH2B67dSmThHurQ8wP4YT26YIZTV
	jELU1aosrXdQUdBKzs5oYVnhxeqTm3jogqDXl57lzzjJevDLaJXv+IytgaMxhSnqc9LqAIJ8ug7
	OYnuoY2adcpjO20/HSj7pgCIjsf9D8yTbdCeSrfODzJzRgvuncMHxvMDn8t8yXkOdaYeZsew7m/
	khmhEbJb1R+mIQf1ItT0a7V/HA6nCOHAU3VGH+tWCfH7+YkTylqlbCfpxq7q6cNr2hkSNqedewA
	exj1cNCRshu0ZC4RmXGWIGxBhYpNslOA/m6EII2qjlZl0gTYYhxrXA5ex9KyYOPSX
X-Received: by 2002:a05:620a:4485:b0:93e:c12c:9b6f with SMTP id af79cd13be357-949bab5bbddmr2003883185a.74.1795463394464;
        Mon, 23 Nov 2026 11:49:54 -0800 (PST)
X-Received: by 2002:a05:620a:4485:b0:93e:c12c:9b6f with SMTP id af79cd13be357-949bab5bbddmr2003877585a.74.1795463393771;
        Mon, 23 Nov 2026 11:49:53 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865a2sm376934425e9.3.2026.11.23.11.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:49:53 -0800 (PST)
Date: Mon, 23 Nov 2026 21:49:51 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: qrb2210-arduino-imola: enable
 the EUD
Message-ID: <wq7xaiclvk6mxabafp5suuczp3n27sifs3lilfqpjx24esgike@q33z4veqdbtw>
References: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
 <20261123-qcm2290-eud-v2-5-9bfc432dee07@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123-qcm2290-eud-v2-5-9bfc432dee07@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX3N+5L4VINVVk
 jRpQuNZbtVaWW5H9LYn4RqjrMPP4MoqGa1FZciAaw9IDgpqZKGHaJQXBtxvZu7HztZiQv9GahYJ
 2YMvF8zZ3H8+FE87FIgE7MgkEXhCGybbSrAsWpsrKSfetpJo3OCZIwIqu8K2RBWhx+B/dWDUH+P
 nbdIVb6lFIQZrwVbr+evihU8bT3zkBnxUkZMN87Py1DlwJmmcaPzMvXmFoXpJgSo3oikDY1VmDg
 uBtYPfP5mC3aaxgNs/wAju2r/2eQrXCkG0fWajlWK8OCENFq0F13T61nlrA8eTmxgI2r67VybR9
 /1pwCMzknKuBMSt5yJpu+cUsJwRWgXzBIAzHf7pPR5MlS7Q+R2oPmCPwbeWnBlSD9NhRsZjgd/t
 S8XzUGZtnp7ymRZDmIdPchZW+d7d3cN8q3zsF/SNH/Vy0IPze/FGPKw6fIH4vzOPXGZOUBu1gX+
 BzWeBamLJPBxL0sQYxQ==
X-Proofpoint-ORIG-GUID: M3XZtVXlW0X0SkXiiMWPV07nUkx6Mv0z
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b0498e3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=kF10rs2o5Heqwnj5SzoA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: M3XZtVXlW0X0SkXiiMWPV07nUkx6Mv0z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXxJUP1SJutB+g
 xk/+yPQ2hTVG+UrgTxTOhZlb3FQBIXswnt48qimg74a+zWusAWE83BNyip8K/HkGjQdk1s+lBfz
 sMA0+5hFOlO9Op3/dZP0+1hAaeBnEGo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-23 17:43:00, Igor Opaniuk wrote:
> The UNO Q exposes the EUD on its USB-C port: with it enabled, a host
> sees the EUD hub and its SWD/trace functions, which OpenOCD's EUD
> adapter uses to debug the SoC.
> 
> Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
