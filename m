Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD9F4FDA71
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 12:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686716; cv=none; b=DEWCW7dbLuSXi4vVUPSEMmFXKELu1iGtbL9diWd/KPuoCGzKO6NmxmcDejGDBnERbl6ebwifVy3M9uoZ4+NpZDabYt87Om3ZrZBLBGDDch0A+WnY+hQDNhQmKEeH1JhqshL+jB4WmOhNAyGh4D3IhPod2E7aoWxcDnpOAZ4DOKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686716; c=relaxed/simple;
	bh=poKTzgMcXmt/rXMV3v5aS9FWUcoH0tIk65sQFqa+kWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HRT203M624jV6Q3Mu1uyAyTNZlwFJf02XLs7osnO1Z3CDxQ1AI3QH/gRYWhElOadu/v5fN7Mb4ADOIkNzPDBuVeikMaaA7kBBoo9JDWLNwniK9Cn3AUSehy6dRyZdqEQHNwrbbLN/NmLVCnKGZF9J/CuuHW8S5J5NakHgReuWFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MZqjhDjT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CUwdizTL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MZqjhDjT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CUwdizTL"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCw8GN3301599
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 12:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h+dfVS2AQIbYUhZhPWcbjcXR5H77ZLShPoBFzO/u0Ic=; b=MZqjhDjT0vZVncHZ
	Q1W4OKXD8HoQp/xNhjb/0wUlzoAvXYIbdaj7k4u/D6HSWoVbzI7MGVblODPDtovC
	kZjv3WuEXNDvujVjaBVIj777EB/VwsrbhZOMY3hqboUWeH/jDENH5/hGtKItQfwF
	aUcRrx5G/Y9PaQjg6r9GjyeWf3yn6oJJBDU2QMc2N+MHcQP52g8QmHzl2NFsMLsN
	mJJ2aJ7SE3muy9AwmPucot7tlrFWBEYvtjQck6J0i4WJgeTxWWpmj5P1UBTKLIt7
	AY4FvSE8+GvnQvaDhY+PBNyvy9Huiy6a9dfSDZ9nfcYRe4w+nEv74IVv/cFS/yWs
	X5VG8g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0dsx0039-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 12:58:33 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90520763ceaso5504816d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 05:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790686713; x=1791291513; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h+dfVS2AQIbYUhZhPWcbjcXR5H77ZLShPoBFzO/u0Ic=;
        b=CUwdizTLngRy4GB5Joj40ZOcmb/YMapYtMWlLDARhxPBjIMpK+aMMno1OdXZ1OI+PZ
         /i46270vwa3opcUB09ePwFMlzW+74jI6at1ycZO4rjdCkS/ETl0Ofht8AinWujseV00H
         x9Dp3/QUcuY9bK24jVRW1G9QjdEm2oCURgilmAbWRS0001WquSTQJ7BJTuELKwDXvtQO
         jjeZZFB84EEqk1NULrVNkJk+dSg46gmnSfiFk4EZrOvF8wsQ+m5xvxmzy5eSQ2Qk0+7A
         3QSpUhCTb7aLkut013751PC41PUAwdjKDnerHIuj1Pcr60xruqDjBXvVrveeOjtbLk/F
         QMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790686713; x=1791291513;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h+dfVS2AQIbYUhZhPWcbjcXR5H77ZLShPoBFzO/u0Ic=;
        b=Ur7Ud+9JQnI1wZM7NbqGE+8Gg2lztmNDlAmvrxrYNI7/G+zM5DbTwvwXZ4wPAl1gNi
         yeC6CHrlNuKc6DIUE0oR83DgaL0I9eLWV2X58Qkawomxk7y+HHXKGqIDhX5Lo4Np6wCG
         lrsyb+BCzsLSr8siikX98g1P7Xvh2tF8/GLHQYuHXimF4bL9JFfD9pjNRODmqWNn4K56
         BSeCMKm1QU/VKhP5wQwQrBhbgWKnfZTUOU5bRvpum/c5knBFkVEf7eROBPGgtrcxDbLt
         3eMRd3MARR5o36fZ3cyocpfEt1jiJvtEQ+AlsYkh3iw1BTNahG+mbOVqm8mhfLTBsvim
         J3Ew==
X-Forwarded-Encrypted: i=1; AKwUvBzSUBWfZMRGTx5euXkGHmiGC5XnzhZDeOSZs8rhbFYQil/wxCIwNoexsBJNREFkvc2+YfeJl+ILg/wIz5mE@vger.kernel.org
X-Gm-Message-State: AFuF++lvMwu/oo9bxKNERL04HkABavueKEspSpYvo+VUj4wPUr2TADhY
	03uRcKYX4sVgz8eLPrLu9mpJt2koMlGJVtfPw3Ys0uc7FhMto80JkzsjGcSRtJC3Ryd3hesL4Sr
	i6/LX+/k0W+eN6YWx3BUaY1AHFB0RjK7jV4/zTDu8W8rmwFA10V0B7F2myqerADwWbgLm
X-Gm-Gg: AYBFou0B6B92KG0lC3U/JVpLGmmlS8cSg+sd5vCOU3E17pkGl9WXmw+A66Q97CCQdlC
	6r/NIHW86RrwfBiM72dmJ30a4NlX7elUVX+FLXfbykLLWqqsap8d7YJNOhFusCR6rdW/0HyL17R
	3dzd2WD+w/bx5vsG2URP39lt6oZGjnScMuljGWU6Cw2ovThHS2pm/+Oz1LVEZE/DoaO1HLX6UuC
	tGZj7vNaoaGXpCylqU1eKK8tDwnKPrdMsGD1GRq8g7vdOYB/cIaPIR06YoR1qQRRvw9h+jtCGMx
	gxZBDKzQiEV9tljmWT9v+bMy8KiECLkt6pvVtwSipQDdzyT3Vh1Ot/ILKlNAB626HWIi3x8816n
	w7/3ifJqc0ZtOgjYIR49L+A==
X-Received: by 2002:a05:620a:600b:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93c43f5e580mr2597724685a.6.1790686712711;
        Tue, 29 Sep 2026 05:58:32 -0700 (PDT)
X-Received: by 2002:a05:620a:600b:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93c43f5e580mr2597721085a.6.1790686712170;
        Tue, 29 Sep 2026 05:58:32 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9deba80c6sm1361214e87.28.2026.09.29.05.58.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 05:58:31 -0700 (PDT)
Message-ID: <7bc9ad48-b8fc-4feb-a5f4-56d822242773@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 14:58:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: fix sdhc interrupts property
To: Arnd Bergmann <arnd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Abel Vesa <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260929104127.3156764-1-arnd@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260929104127.3156764-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MSBTYWx0ZWRfXzKFUjtmqWtbS
 eFmsY13tXBCkchpDtqp9/wgIjFBNid1sVUl5jNNVf5jKnl6OB1v0czX7/RTaY8b/18/IBf/Gakk
 CYgqKmWD8ASQJCgaTKkYm39+gO8kSTkXGOy3BULGcF2r9cclj+S33+EcFCnwHrPQKKv5BnpPwXk
 ljMRzgyK07wqcLfiD1rAK15zQG3rEqmJJLaFutPsAfgnUSEGsnr2tfmy+0vHgAvg1ShzMjjiet7
 nU+NlanSXbUxXdr6CBdhDauV2zTJWXB9tpd8l4ZMpk3UbyENBXtQMeEKd3HzTgGxQBHSqnp2gIs
 xIUCQJlvowPSLpTqj/RVqyW3A//J2A/yHs9NFOGotIQhHuaTBv0KVDaqBH74T7zV4snKXnG/N04
 SSiA3GF3fmnnt7PeLJOzpN/Vt1rFrDdLRZeMF4q4WFbzolsoQI1DeU8x/eq9sIgJS5A7hnnHGGo
 rDCLGCuJftLTw6BSzQg==
X-Proofpoint-ORIG-GUID: 5DGX5tHL9G3cKmLGKWkFXFeidweOuiAf
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MSBTYWx0ZWRfX6hJunDa5AYAI
 XBI/UwvjslgbP+6kOQgMb9w5FKsWblvPBIpI4AcJ4JJCw0xxkERHtXYzTOGI9IcqYGtr5YH+WUw
 XOqnBphT/p+WWamUmG7DMGMEzBqIUTg=
X-Proofpoint-GUID: 5DGX5tHL9G3cKmLGKWkFXFeidweOuiAf
X-Authority-Analysis: v=2.4 cv=DqvDa2/+ c=1 sm=1 tr=0 ts=6abbb5f9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Eo4bF1euHd9rOWEQa6AA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290051

On 9/29/26 12:41 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The gicv3 on this chip uses a 4-cell interrupt specifier, which
> includes the affinity, but the newly added mmc node uses the
> 3-cell format:
> 
> arch/arm64/boot/dts/qcom/shikra.dtsi:4151.4-27: Warning (interrupts_property): /soc@0/mmc@4784000:#interrupt-cells: size is (24), expected multiple of 16
> 
> Add a zero affinity, same as for the other I/O devices on this chip.
> 
> Fixes: c8e3d40457f1 ("arm64: dts: qcom: shikra: Add SD Card support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
