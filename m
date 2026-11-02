Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615829;
	b=xON2ZeTMjLGOAJN3rfpfq8xr0iJBHyu0jSJ4jOaZb5slnqUWmq01/LJ6wkMpFFRn5eCs
	 c+T4+lyuqJmdvmaVI8rfM6/jUydS8tw1vgOOucicm9EXSm3Gu3r2sJPAhgmj0w+I7mA8o
	 m3N1XRUAGRetchf9iQOAkFuTIRV98IaxuISxmXRy33tFY4o45xflvPvaeAbY/3Hpr43x8
	 SQB4WAG02n2sTrT6D/HpaM3RR9dNFoYI6YSXU8LEyZ2QBGpTyBnmpqSY+VoFAmEF47NV1
	 0NUgAO2qfHndnOaLAikS271N6d5ZybtjKb36Fe6+kiXGr9uNXaFDZNOO/2QrHKNijsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615829;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Uem9Sk5u5wAym4KNtUXWwa5Ya3q2ExNebAgCwip5iPI=;
	b=O9e+wjMXiiVrP23eoizs5uzbX9ce+Vx5gBUS5ZA/dik2V0SrSckb7gyYNH2YOtDLQ77j
	 zc7nixgc3MfNY7Qi21zOv/bsPc/ElJW5LuTZ9Ezhn5x63gJPEA+nOEmYcM/GVvX0PeEbD
	 cVWIbSANgMnaM/o2nfspafvJaf9dx+sfO0fljdst6HFXwRSLXxuEXgUeXnUZBxaVLALk6
	 7ZgJaJKcM7GvQ6XOhmdSUv5RYAxnQ0o2OIHITlwCv7DUVh/2gKhwmFBgq3TEOSAzw+Foe
	 PG6MwLP2by+e1zsMwTxp5ae4jBSvPQS5hGw1gTKbnCbZgT2f9ObM966JXt6IhbfbEyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EVu4uLh2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z+gHfoIp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C9C606A327
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 10:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29C9C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EVu4uLh2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z+gHfoIp
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A1Q43430374
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 10:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uem9Sk5u5wAym4KNtUXWwa5Ya3q2ExNebAgCwip5iPI=; b=EVu4uLh23CyAzH/P
	QSvqOGuYNbSUbidYYgRyPi/SyESPzukZ2e1DhRUJ4M0u8UlGHLy4dorkvTOM7d6D
	E+ukEU1SUF2GmQzTFM4vUJYtUcEmMchVuplK/4SxDn1t+A5q4UPnkXGPavMh1KB6
	6wJwZwpI9t0qGr3tqnH7NfBNlJbs0YflkSinRl2c6PLWU35Dy5q3L2GkRDceYOO7
	03Bz3Cvu2gmVrt3Lpnjx0zztTlcSZVneDhUFfBixop+x8/DH0J1qWUVBgi6guye0
	ukUmVYmdEh/hW1IfMpCiLmv4whOJqhwfxV1o0HhKgFppxt1ZlDFr76Zfr9LM7m9p
	C+CXjQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmervek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 10:37:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-945b0154705so189192985a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 02:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793615827; x=1794220627; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uem9Sk5u5wAym4KNtUXWwa5Ya3q2ExNebAgCwip5iPI=;
        b=Z+gHfoIpRgik0K7mLyBMTdpSNAqu9Qb169VaZQfz9/Ei0oyOoqBA6163Pl6lyyTVmu
         cIA0lCAK9tKLMlVYOfHwXHOW9OmbxIxYMSOJl09gzfTiKaG2AJHtZnD1RKaDdIcsN7Wz
         sd+AOMmKcgC/ZF721BShUl7055PHI+r1N0OuZzAiXQHNH7g1I675rXbTO1ZmSGT7WJ3B
         b6wgnvOBsgzBAMDI98TxNdfNL+G2jp6LPdPVhNX0sswIJ4wY19owpgp2tKfAJZt/+rj1
         1ANUWSZmNlUQw6KopktZN+pdVGY5ppGcr5XxoaabkCaBVMnjFTXw8c+C2MfY3OLquWl6
         Vcbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615827; x=1794220627;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uem9Sk5u5wAym4KNtUXWwa5Ya3q2ExNebAgCwip5iPI=;
        b=ACdxSgEZwSlXCAh87ws1zJNjpKLgh/dEGoRsS3wwAXeY+2nj2xolIn8NWJS3pc/YNy
         DCQ58fz6k4t/nxLLuG0LQ8Jtdfn1AoAMQ4Ca4DW36g931HgJcCuFbm6boE0DFMCD3Ebm
         GzYDPROUja6mKsKwKQRyZYD+aq+LAmJJEcj8rhisSw4OLDz92Ygwcc5qQAAElx1TbwNm
         dRGn0MBG2n4MqVtus0kmCCsKkAG3lFQbMPSiDgQuZkuujYblETBvfnIPHTF7ZbTbY1+e
         idtP4PYgi7VC2jHc79H2wQb33hLGrF/zAjPzd8tUlU1VgmArCwrSkiM443jOQoyAJ6Ed
         c+nQ==
X-Forwarded-Encrypted: i=1; AKwUvBwY/78r9LLQp3te/kdQg77Yoh/79qzROt8PY4LyCRP66NyI1i4Zoc1V5Mb9HlHnOFzUrigBSyBvp32tt5nz@vger.kernel.org
X-Gm-Message-State: AFq9FYLy+SHBeTcWtNswX/mc9+hPx6qmx+oHVjDR9alV2uNx9gMCiszE
	ASHwN8yOx8PoaerQwnmPAlnu8OA3NA5JCFCj7dmJzCTav0ot+Gce8A9j/8AqMKK4+t6MrSnOI8K
	H9t4UIzi5lZeKoLaWYKiB7fnKbLyo5pSnw7PJwuAp2asf+sMVGSdM2WK3fVDPm8qHbbah
X-Gm-Gg: AYBFou1HLy77+cqMX+GOAbnVWPcA4zj+fzeKMhIj2w9837eGlMmCng/DOVHXI2nI2cL
	NNMFo9PqOAdGL9aDcbFGNywICxitEgStYk67qqUf0c3rr+aTK5399b3ZnKYvVnpNpd4GqO6NYlK
	wv51TLWMoX9yHYCGSr38y5YFx8Y+dqJE9PPpzM/Q0kg6DvrQZjmlpS9nfIm5tDPRfKU8KnPEo+e
	piKULhkw8Z1nGf1YPtJ8Pn1BwlLf2aorQZ18VYHGNBvdXbCVdE3yI4QNBoJ9VLtIBWA9AUi/64u
	fCSciwmj6lpxrUJVtv2fBbUTlybYC0kqvhHuNIGCDQN+HmgmPYX/G7bOHj95FJ2Y7iW/J0eFJFv
	S+lgQjJ4F2V1QADhB0oI+sjHNpGWs9XCZc9282RnLZOyJzLB8onGiYs3btEs7WiQuS0s47en54A
	==
X-Received: by 2002:a05:620a:6406:b0:93f:2b23:4820 with SMTP id af79cd13be357-9442177e71bmr1490846185a.48.1793615827483;
        Mon, 02 Nov 2026 02:37:07 -0800 (PST)
X-Received: by 2002:a05:620a:6406:b0:93f:2b23:4820 with SMTP id af79cd13be357-9442177e71bmr1490843485a.48.1793615826944;
        Mon, 02 Nov 2026 02:37:06 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9b54dsm18907414f8f.47.2026.11.02.02.37.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 02:37:06 -0800 (PST)
Message-ID: <cd3f4711-50cc-4a0d-9f15-455cec5cc1f4@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 11:37:03 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] soc: qcom: smp2p: Fix use-after-free of irq domain on
 removal
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <agross@codeaurora.org>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Chris Lew <chris.lew@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
References: <20261101202404.156522-4-krzysztof.kozlowski@oss.qualcomm.com>
 <8f91b302-8cbe-4bf6-9558-041ac10f4696@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8f91b302-8cbe-4bf6-9558-041ac10f4696@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae867d4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KI6MEPFJG_Ll42QlAT4A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX4Li5YeCX1EOp
 GAyQmFeM0IFY+O62EFOSx/HyySSfFKw6HYihdCbPmjcQsGWmPDWOCdJig1C57mXVnzJXqA4HO5q
 g9WkI/E5BZF/msGLIWu6RbzzUHaJMzTKImVPzsFmS1Rk/sAw87MdIcBh3qlc4bKSDnV4ugQoApQ
 36spRq9NIEoB2o1PVnLUdlIaNSZMXfMzQ4lEhrsIx0vruAM81j7mz7e0xOF1zXx/O6GS6R2ukRk
 RkEYeVy2zAy1Fz7bU5IF+HFNa/iFz30eFY2Z153RSabc1DjNRpTQM7v4sdvu/33VKgxWTGGmmEo
 MjnjurS0HX1w4r92es/wG/EYgdMFK4Gk/XLq/Jv/pdrD9suqH9dgmzztIFv0DzrKtb9Y5slzuWI
 82O6j39Pt6sz7AzDIAoo+AlwlsOYJ40FH68CORX/3AXa1zq+EDqpO9nPnxZbssXJipkbaXsuEmd
 b5gFpn6KN6FDQtjCvWQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX7yH2WYaXMVbq
 d/KJI4aGq0e+g3p4+nBEGxBwMG07Q8GOc2L9JQZCzV8sb/J+hSJi8FPgUrrPIsC17NAsAuqTixI
 qPHPvhee7/oypLh3QXTYrRHH0B5np/I=
X-Proofpoint-ORIG-GUID: jIckKfXqOJqbyma6aMyMw2LK-3JblCCN
X-Proofpoint-GUID: jIckKfXqOJqbyma6aMyMw2LK-3JblCCN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020042

On 02/11/2026 11:28, Konrad Dybcio wrote:
> On 11/1/26 9:24 PM, Krzysztof Kozlowski wrote:
>> The SMP2P interrupt is requested with devm_request_threaded_irq(), so it
>> is freed only after qcom_smp2p_remove() returns or, in the probe error
>> path, after probe returns.   Both paths, however, explicitly remove the
>> inbound irq domains, unregister outbound SMEM states and free the
>> mailbox channel before that.
> 
> Sashiko flags an issue with this one

Thanks, Sashiko did not send email about it.

Best regards,
Krzysztof
