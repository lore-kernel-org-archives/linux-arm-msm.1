Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F2A3264DD
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 02:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788403950; cv=none; b=u0vsMKeVEHIoim0QBSZyuq9hF0FC0bFf/PVhzrdZtEYYrpfbcnygygt6ztPL2HI27XN4QZ6Ww8Gcm3d9OW1MJ8XYi0rQR4J3cKp1jXT/9TzB9grJtrVrtwllm72JoRETOKGjXm8/ZPR3XFbsJA5DSBg3dSW5EhmyXBHNKXH/2F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788403950; c=relaxed/simple;
	bh=zVKvavHfg4RQjdQk1Ihpq3mREXCK9+/dqBDndo4eJCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BqyKpCdESi+nzJlqzPUlYgO/vhiMBjt4pZkwrj+Lrou9PJyIWr7IyHJO8RbNU+MrFSirl83v4A2KscZERUtnnS/K0UIftLJxGA+UuEzauWNHgHIT6zL1fiNXst2de46N4BWh9XfRpnNh5B5NImd2zlAUGFlVJ9bd9Uia2wK1+5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Idmf7Oxf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ToOdBxW1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Idmf7Oxf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ToOdBxW1"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682NIaCg4082985
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 02:52:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P4+m0OoM2a9nRL5KCXeQ3F7G
	JZWJtRbuEyWR85Y+/YU=; b=Idmf7Oxfg/8Htmot8gcnfZOmX33SQlXj6EfqjbHI
	l7kbZX7X933/LWKakb8smrvQb65W3Nmr0ElMQYDbdvk7ysylNjs9r19tFRhWKRYR
	dqJvNHaYh1eUkLOvi4JOJR3f/MpLjZj1tfbD9ZD0DXRcP0f9zNgBQN8Ui5jy96yM
	mBHGZQ1LFFZKzgzK+49/D7N7JQtW8k2dp2CUjk5A5jC0+Lu/jU9L4+h6ydtwBQ4X
	DECnNPQ3ZHCr5jzK1clbc1ho54aqvjjbc/fTdUr391JM6xbMPltt1LJbAosqgN8Y
	yAVfMoPI1eDGHrKmNQF/ngvfinFJkIsUi4doF86S5glqEw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrnjxa3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 02:52:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so2966333a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 19:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788403947; x=1789008747; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P4+m0OoM2a9nRL5KCXeQ3F7GJZWJtRbuEyWR85Y+/YU=;
        b=ToOdBxW19DzlWjtb0mvJd/9TmiNqpis9LwtZex8FJSXimsrU50oeT8kkTuO/duVPJv
         aO0oYR/dLVVLOEQT6pHl+3T/IQGc+nqEaNZXbhzM5yvCozrOpkiekwbKlk8x0gAfYCQL
         LXOPcbXCD7giu8O3q4ISr5VCZTOZitcCnPwvVMhsL6CKVL2chH+KZSXZrmqL9fYtjYQw
         M+LUlwjCmU7xQ4yQ3xaLT9omcDl1B0WX+8IDv48zJ/NveOjdlragTtwPuXRG7ec7k8+X
         UwIzdQ6hUSn+y+ToZOzLbmt0hcO/9hfEj/BgQhBFw2DDcrPRiV6R6fS/pUXFvse+jXK7
         Rnhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788403947; x=1789008747;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P4+m0OoM2a9nRL5KCXeQ3F7GJZWJtRbuEyWR85Y+/YU=;
        b=oVE9bZzZGOS1UZiWS5vK5y+lZlCkDBuzDFedZJh0bxbcV70BH6jZrFj9glrPKyGHak
         ne9TNVJ8QR5sH5sTu0Xq+T5PaDSMKXm1I3oGI308VH/WFKkX1qYemfUwLH78UBKOLXby
         uTHVlBd/MYBYYKV0CheDiTlJE4cK1lQm6/UpCp3uTQtbPV7zq5rvdoFVqOsNtwGU6vFj
         ZaluQkPhNT2SqSYchOO7bvRN8u0szMpT/KuFxb8+KDXxT50iVP4P1mjwIQG4igutpt7I
         zgqIidVnIcPo18ulMb8oM4p1GUfpFBdcCds6LW6Ujmti7Yw10T7rb8rY/Tc9xwKvj1z6
         /yGw==
X-Forwarded-Encrypted: i=1; AKwUvBzFJGt7cEsOiT4H/x9jor9G9BEKViyn4L7wSUF3c06ngyfC8G3TPzMFwhxCCEPVxyMgiA63S0UCWdoO+dnw@vger.kernel.org
X-Gm-Message-State: AFuF++nRCv1uu1BWwZ1uBnbIqswmtMlb24daH2mRMI3SLeJapobpK1U5
	gbE5XZBzVvTacVWpuT86q4MjQM584H5QApMwOxP+Z4g2T9OBwHUmn4k2elHh01t/SEl0Pa6KApT
	yoz97lEMIQmc9AngluB6w7pK+e9R+JpwY4FOu+xdhuR9vJeReiFcVF0aUBCjE0bb9hhTh
X-Gm-Gg: AYBFou1xn19u8Iy5zLN7lEG/MMmZ+vGUW8jyvKO/NEPtcECsnIDPKiztgw9R3ax5WTw
	sNvX2+CJj2tRrcHe/vxmyq348nSMpVz/eIg3FtQv7rZlKf1W/Wn7OKDEkys/Vi3bwcT1hTAtZRN
	naBVVdMeAJUfaf3qEzjvIpxIAbOikd6m5F3zlUNDGe93YM/fQ+YiGJ0BLwMUmuFwMgPWhmLGfBD
	jPKWI46XXBm9mj47uxzW2rGup0DOlYfUCEL93LKEl7r1gzbV3B3lHipSv9lx33Yc2/8+AkGIFCT
	n6u06b/JzrNjMn1LFhII5gDNN2ntEEwleYSLs2lGpGY63c3r3dJNNpLQn35uarGSjBDFJc27BHF
	AzI0URaYqVeu+y8hiXFwTAUUY3bI6tlcqgIUQOjUB7l8=
X-Received: by 2002:a17:90b:4c44:b0:38d:b36e:9813 with SMTP id 98e67ed59e1d1-39aee0188bbmr14466252a91.11.1788403947320;
        Wed, 02 Sep 2026 19:52:27 -0700 (PDT)
X-Received: by 2002:a17:90b:4c44:b0:38d:b36e:9813 with SMTP id 98e67ed59e1d1-39aee0188bbmr14466195a91.11.1788403946814;
        Wed, 02 Sep 2026 19:52:26 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143199692a6sm3164500c88.12.2026.09.02.19.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 19:52:26 -0700 (PDT)
Date: Thu, 3 Sep 2026 10:52:21 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: defconfig: Enable PMIC5 Gen3 ADC thermal
 monitor
Message-ID: <apjg5Ta-PatEeqC3@QCOM-aGQu4IUr3Y>
References: <20260830-hamoa-sys-therm-v1-0-27108c40fba5@oss.qualcomm.com>
 <20260830-hamoa-sys-therm-v1-3-27108c40fba5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830-hamoa-sys-therm-v1-3-27108c40fba5@oss.qualcomm.com>
X-Proofpoint-GUID: KuXUi9gmqmNJoZJWxmNIsiy13JYVSUOr
X-Proofpoint-ORIG-GUID: KuXUi9gmqmNJoZJWxmNIsiy13JYVSUOr
X-Authority-Analysis: v=2.4 cv=YKuvDxGx c=1 sm=1 tr=0 ts=6a98e0ec cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Px1P4hqg9HuXTZj3O0wA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDAyNCBTYWx0ZWRfXwjLpjD5Rtwie
 6tH5HPs3q1zFOWtnk45QqCOQ5fXwnUB9kmbbJSdDTADY6fXG8rFY2d06TF9dv31PwU+5++Tu17O
 Ki2nInN0vbhsTkU4QVk/xg8qzaLvvrfIuZXffa5fj6jZUTycL0TJAh2+lbCk2nk5ic3Ge5q/lSy
 ANZbOZJsrY/ETXUjOUdDgZvTkIXovmyzFlZMN3+IA0AuZS+eMnK2z5F2FGNul9QFfcWjmm0bV9t
 1mmLhO2plO8txcdgRva2N+9IYK2AEiFHIOg4TzDjF1uk0xUx02ZghK7g6Pt+0zKU3nV2UY0wLMZ
 OuqqWilNbglOy/FXqOaGLtnH1lB6c/KJXsq+Z6mB8PeuyqUwIuiDbKymrFDu35VKIL4hlqvLQhL
 q/AhNZzOnLehIAm8XFCgrw4KQDhKrbLpl2JgIJjAxFHpMQignSREVKpIomXmZ9Zr2Tx1+3qi0d9
 5Guvz/JNxEq4r4vTn4w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDAyNCBTYWx0ZWRfX1F8hrsEBgoI7
 oZw+dB0o6UUlrE9KOMnDK4tL7m7Yb5MijVzCCxzUuqe7HiRa7XH4iUT1qgzfXXySgQ+3VB3y3Ae
 10W9uU6OKAld3eXQvfJJuuaqgllZVFA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_06,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030024

On Sun, Aug 30, 2026 at 09:02:04PM +0000, Bjorn Andersson wrote:
> All Hamoa-based devices uses PMIC5 Gen3 ADC connected to thermistors for
> measuring temperature across the system.
> 
> Enable the Gen3 ADC, and it's associated ADC_TM auxiliary, drivers to
> enable these use cases.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

On Nord platform,

Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
