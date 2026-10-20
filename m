Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501098;
	b=MV0xLaQPSZCIKxkrCswAy1h1JECh5jb9wos8pt8J6Vremp1Z24NCD16oGufwwwFA6SZt
	 QslPTc9dbIPbiBPCjXBG4e25LnwdKYQYhfd4cvTxP/FKUmBqi6KeHwVBUUsSTq0UMgwcv
	 vZrLI2tVEbRCxpl0lNpzM6M7IHhp8GZ/3PwNI3DsNk70HBE4aip5d9nN5dtb2bDjWKMQY
	 p0jm5DRpWsMTqt5z1FZKDIei+j8lyQJB32BsRWojuKmL25RYRY33BBgiIsWfRWALKnEns
	 CDyljqyWiQyRpU+/g4tZeOMqPESVkvezuwlurqZXwBxG72wt4kalVWBX3MZKHvIi+Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501098;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qKQN33wg42pkpBLtGqBWtg9byfzk6Ew0t8Bo7SdAs/A=;
	b=i0/4k0GSRdvBLX/Oy6ppqdxWNi8Cdh5N8scKL7f8oRdeyFADRK4BDBk2szlq+Z7hw0J5
	 9yE4fLLTZhXNYB3Al+yvMhGECDd4NoBSGC0GbSXG4zlxg7t7ufOpapjjuE1Nw2RHQV9YT
	 CFR8l+ziNnXn07UgkpzSCepcOGys8tSq9u2y/JNzl3FP3JIyIj+OtLxY6Gv5k8kdeeYMN
	 p5beXeXHVON1lNH2yv99n5ce42uPVtq5s9VIrkMm8IN7UMzT3dQ9IyUXv5HzJE6icvLK3
	 0rH2LfVds4kuzMcn6x2Fr6cKF/BSXw97xtBmihoYzdUh7Z+SNNUh25U4r1ex8tFe3eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jha6VRrv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CsVI5W0T;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31521606A320
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:58:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31521606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jha6VRrv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CsVI5W0T
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KCUsOO1646895
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qKQN33wg42pkpBLtGqBWtg9b
	yfzk6Ew0t8Bo7SdAs/A=; b=jha6VRrvWrZisQB7f0L7jZ5SFBRBsqegbN8CBx+V
	h/P3cCLvR3weXlnvMaCgUBTxQr7Or7S2b3UHTBwPrPt/c/6KEVkNflV84OPmrSAE
	V0/31Qkf3DHjNpvfds6+HliqFgEjx9I0NpqBtE6Tn//3MKW5hNQx8QWz6WRaAvgS
	iSnsHCargdNaQRxgkSp2gUkDT/1jbdJfGBrJDrMN0jXYKESD+4JBkBXZPIwOMNRV
	CKRJaO6rDXTKaG4Jf6iarhhAn6a9ybMKhkA6AF+iEHN3/A8p9SjFTQNXByoxmb9X
	2Y1CFQ41CZq+z0j2L1JZbdnOKlIEB4QWRlrCYonolhoC5A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2hmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:58:16 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91b861c0618so53582966d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 05:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501096; x=1793105896; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qKQN33wg42pkpBLtGqBWtg9byfzk6Ew0t8Bo7SdAs/A=;
        b=CsVI5W0TpqyHHqRK3rmDr5QV3Cy5xOyBmfOlbX5RgVrBWr0HjSgyRX3Gp08x0bYWMU
         N8aXlq8TYzBvS0clP8u4DqKON2UorPUz8w895b8WKdlQPOQ4oS5aRCrRMVYOLI8xBGBT
         LIv4sQ2C7lNmfZHzjdYIIdkk4OzyBdPzfL9jLajkE+Ah0DpihTxHcHmaVYanYeJIxf1c
         jf3YCDcJZvoW5nUPke2R7Sb6wNPU9ca+aHaGQm8XqMt4TgAyEOaC1VcVeuw/k4ya/fwj
         aNfFXysySxa+YVRW4cbGQ/w6q7T5nRnoUIdktd8i9RnxB8qXo+43Qp4cwCerpY4sAFFU
         ojWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501096; x=1793105896;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qKQN33wg42pkpBLtGqBWtg9byfzk6Ew0t8Bo7SdAs/A=;
        b=0IocSu0Ok72dndCn7BcWcClP4pReU/0Io48K8n1W0FH+6GYRT1gwQULnHv1cP6TFvH
         Y7TB0REuBbhoCca+lJ9OwI9PojpNDuIEyaagqACN6xLYRjsXLP2LXJ3W9cnvhepGyogj
         Lj4Wbi/PxbwQHPh1ewXxmw9Z1dQllfJKQVodrtbvFkkEixhL1eV8tdF5+dqtzSFX6JGW
         McRXctMNdQvOxyFxq/VeLUDhJRIZzzg1a6Tr3/tDCtpt34XjGM+0sT/Jj64+g+CIwRNw
         o7SdmcRurFz8LxRQnR0lYzeZmPF1ZcYB2prASk5wB/2ubWi3IvUx/xkcME9hnXxpx2YM
         OZyA==
X-Forwarded-Encrypted: i=1; AKwUvBwKJD2YYAdM4EsLTn+WdEZDsnGeORLLl9koI3nQv1XRuFVUGUgI5mUuiZUanWN+zXXj6YXHI2guxiKy4E8Y@vger.kernel.org
X-Gm-Message-State: AFq9FYK4+BEM//3mlCZdQVw98aPH2On6ZPmQUDEXKHT7OWsvmDrBCEdU
	fq46OXVMNrF4NDYoKZuvOoWYpQ7iF5BE5vOFxsW4K8cGgUwn/XvbGlR0vzByHGXSlPmxcR98uR8
	Q86juOPKUiX7aesm/KoliYzA7vt8sLroRNFKbqSAk0fzecqym+M8s0RHGSrsBKCvkNhDV
X-Gm-Gg: AYBFou0gUme53+lImIa8DH+w5eVAp2QpKGlAEwRbzR9NqAv32GRIbnBNVA78D9CG175
	JWxJ50dFo0LAh3SaIHkoaA5r0YbGS5gqTuZuSywk4Gl28RRGEpq9DcToVeRlN+DPdbkOfLauNV/
	gRkmjVa+bwt0qEjlPowl0PbMJlz1mhfniIyxfC4bzaRsOM3ARARiTMMDSnJxIi0MeCd+MdaWkt0
	4cb5wG28Tw9z1tqMRSKURcZfRNfFfIJB4LvyGcSxMuSyE5y/UgV326/1diZd5drg/MuJP/Oo/Xi
	Qs5dqlqodIWIZ8xi0wOq0Z2Lpum78n2U/Wqrei6rlubCtdQgvJE0iOfZ4BSwHCwrNRKOjasIm9c
	PToLMm/R1N4Cocevp
X-Received: by 2002:a05:620a:372a:b0:93c:b721:b108 with SMTP id af79cd13be357-93f29b80a35mr1761767685a.3.1792501095558;
        Tue, 20 Oct 2026 05:58:15 -0700 (PDT)
X-Received: by 2002:a05:620a:372a:b0:93c:b721:b108 with SMTP id af79cd13be357-93f29b80a35mr1761764085a.3.1792501094964;
        Tue, 20 Oct 2026 05:58:14 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d81035csm6353477f8f.15.2026.10.20.05.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:58:14 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:58:12 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/9] arm64: dts: qcom: shikra: Add CPU idle states
Message-ID: <npllqmvej6ua43g3vfr6yx2kh54iidd7x2gng66ltdujwi23at@fswwuqxc6l3r>
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-1-ac7f1a0d5638@oss.qualcomm.com>
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
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-1-ac7f1a0d5638@oss.qualcomm.com>
X-Proofpoint-GUID: IFIBf0ry6pOO4YTgSHBSGyEdUVfvsNav
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfX4R05Q6sfhW0g
 8DPTK0cuSO70wEGukqsmwDAZwHvUHP9E1wz2yP8uV79rJ8g+m0M65YZrRxIOaCmb5E7vSZwlO67
 045y0tDm0Kn8W0wl+3U0WPNow3FuRiA=
X-Proofpoint-ORIG-GUID: IFIBf0ry6pOO4YTgSHBSGyEdUVfvsNav
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad76568 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=qThvZ3sH-gZQT-B3TrIA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfX1/C2z5XGrqVy
 XL4LEUQp5nC1iqU17T9LHpQDk0vrXT2mR9BsX7tOx1T7ssURVllpHR4raw9pOlQ2T/F9lNSz9Yi
 6H/q5Z1/ApSb+Ky/BMu5UjugFVnND/XeiDyjbk3y7dd8vWyTQPccVnyFc3Sl+zOSHY0dBT15RcF
 unzRvKfzYKPE81P89bSaVP6El6hVRVyNkPU7LtCvp9T94QrhR7bU8vy+KPTO1WtBNSviwrI2LET
 EhAQa8pHYsK4wfz/jmFZaifNFrDW1PHWkGt4rYDVwLbHzuIKbocgSLgnvS3p90UBzo6qweFhZUG
 LQaXMsmBwUZwAI4HfJTGJll+Vs/Kp3ATO2LeObRKrzFY2TQQKuSaVacrlaVhx2MKSbCR/Tqa6dk
 GHaGNfT9KqmCJq5RhzPwChKty+A2lkrZEbMJqsh0MJtxoUXwC9IOOiqF8tWWoBNLMXYI0iRF/kq
 w9++pbWla2WWzESJtBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200051

On 26-10-15 15:25:17, Sneh Mankad wrote:
> Add idle states for the  CPUs as well as the whole cluster. This enables

stray space between "the" and "CPUs"

> deeper-than-WFI cpuidle.
> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>

The rest looks OK to me, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
