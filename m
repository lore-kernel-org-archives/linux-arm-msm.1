Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023317;
	b=2U1SUbRh5fNcrPpRMM3t7BvoU+/yixt6IhZjTxc8YV/LHbTvEP7nKj4bhOt31WMcLaME
	 rjbzwUi+e4CIr6rfoIS1yfAw7B9ucR0QUwsIJAmbgmvaY02xwkHPMqVhBuFTK/LwTMZjs
	 aNlfLGcgKbPeHoNb/JFESgl8X7SVGOvKNtgf8OOF+32Gj+ryyYatXYGbIpPXe5orRVAHR
	 rO69UUwD3FfFv/+4JDlxJJz7ROiF3/o4NvGUpVPRXlmb+fh+m0ucPgSuZxt5W26rOr52d
	 o9nNVG+PXX8thMat0PrPNbieJ5SpmR69IFtTRgDEbRv3I0F1oVIT//RaJ8yIElxBa3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023317;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ghBeo+TK4npvaXsZEpt21+g1yXC6b+Urto50LbpsTK0=;
	b=pdWKIDQforOkjRE8N/SkNOzAx7iRVOVBmmeiBsUEuhmZ2we/HUhdYXavVYtWURZ0iguU
	 eZl+P9NQaUWV6ba3I2q3NJymTm7ipdXYtz8Gdi9pNgpewNjiicKFqw3gZQ/bwuEJUjnws
	 C3Xfg3tZeyIG29g6QhmPkwe1eADRD387qAUDjNm3Elr6rE5O1OrfvsZ9vagDuL6VfLV94
	 LvSFv2oCy8P4olvSCMDzqrK/z8BvodkRZdrAcZt7yqL34ZUo02Y1YFjRELzlvyjCIjYCt
	 DUVsj7NMIs0wWRH1ri+QL5M5olKr/YFVeM1AnpHBnNs6Dpu/3okacXejTVRCnefm84g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P6mhZ0lf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O+zoa0X0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE7E606A31D
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 14:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CE7E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P6mhZ0lf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O+zoa0X0
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtKg82734645
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 14:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ghBeo+TK4npvaXsZEpt21+g1yXC6b+Urto50LbpsTK0=; b=P6mhZ0lfV80JodKf
	qlhHrTNNTaPjsSjPQpgo7tBVjmWl3MKkJ5obEIvI/tgSZrkHAtB0/n/ydTk9RqfX
	f3clKbcE+Be9utsUDOiGiHU59Rl+yj4chbCiY8tufsWz2GKS8hliy+8Ge4CKpER4
	7aURYfDu9QYTeOdEn/57LT6/PEbpps3nSyZsev52EU7iAnhes4kICSBdx024/n5p
	bhdMDUs0W4j7Kk/HhklqYBcTIAmWzGw6jPF1X3QoaFKmG9qbs8R8H2ESFn+s62xQ
	lAZpSlwQIDA/JWWv66UzUeS/rtLE9WxelSIT80+6L4dQJTq9gtzfmjBonp/pGonn
	eKTC4Q==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp9024-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 14:01:54 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eacd73e83bso149564e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 07:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793023314; x=1793628114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ghBeo+TK4npvaXsZEpt21+g1yXC6b+Urto50LbpsTK0=;
        b=O+zoa0X0GmaUXb+NMh2Nc7StA3H6od0Qgt5jiqh2r9dBIfFIgWdVFCflnuRTu+bLCC
         ZVujLW8OLJHyCgRdf8+ChgC42WeGZry0EtLdhSkN6LPJBsV+0XnUEz9x8PZ5R5a3kkhj
         iAHWUdGkXqouElxMtAOZwuVsjvxhUJ99EibZztgVFJJmEZgAoU9BWaLNem8QvNrtD2+o
         VIRSefsq8O1Z/gIcLC1PtXKiytKhFfbLH1m5fS5YjbzGGxqPhNlkaP+vGGlreIixpEiJ
         IuvTlLcPvP3or7Bl4ufWZBEb0EDqZ/hr+fD39n9jgyQnKd+aIZlh9Zvj7DBD1xeW5Ln5
         3uRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793023314; x=1793628114;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ghBeo+TK4npvaXsZEpt21+g1yXC6b+Urto50LbpsTK0=;
        b=anVsHRLkA1bWXi0ezynIoizKS4sHgYuXbsN4ZXUzD5LLj6hNinE0ZOLcYLKk5V73rR
         qKYdYMsulKH3KqexCPocjvY5Pcvxt7NCd/SBKL8jki03BAmIs6L67TpFrR2POH2XCm0z
         QUwGwsOW8ZzPwvqERHvzwaBstN19d4P5GgecGsAML0ZqSlWhKpB/Xfu+n1Bll2yGlPpf
         Ybm9433f9uiXiyWeUl7efL5BpMEfb+p1MYiOfcc1yBqUHA2zvVCWDtVqdNl0V3wLKDdX
         Q7WCumNL/Yt2Ru1Lwz+aWtnyXTbLJgaatmqjuKpGu3aDZHO73FchOtOFG5pnlUaUBGtw
         QT8w==
X-Forwarded-Encrypted: i=1; AKwUvBxwnlmpyGyHYoQsfLVwTbLX4A/csdU5aFgMNAELa5JeGrf8cIyrVELNERusE7GYBLfAukZ5+2Y/YJxs1ib3@vger.kernel.org
X-Gm-Message-State: AFq9FYLkHbD70dafqyUiEDOE+FfI3EyQp7xI7F57yP/gl11jHpk9EyOD
	jSZiTZFKyBD9whf8AjgOpq2gbV6ntPT38m59pS9PiFhNO2sU0BvO61azc4JiBigV9iBtvnZ+Li1
	zcI1ylSBVOYhzEIIT3QrSmwvu+H4eCKmknX5k1Uk7jMPb8HnzRXRQsawg3m3VvbM1SjPr
X-Gm-Gg: AYBFou0hp1LIQRh0zJKwVbeJFltmmJ1gfvQkDGKhoKgw7QyTRWL79ibrXJyiGkHsG7S
	xs1N5k9PMpWtZp7PON7Nz2BewPAAq4/X1XZKp5n192ZXXj3H/wB4MLiBa8EK4VGwjuX9ntidzFY
	mIQ7P2F5YL2yhILwC7eH0T86VSOyGT8EeNEmyPCcb23pRTTl/WC/1TTdtczwI2+JSbDm6JvUcBq
	ePsh+FnO/PUT/slgxPaGGka59RT32Gd2x+4dmCwCLsaf6jztBaaKlNY5ce0MdNoSaTajm8KybRz
	0Sqo38Kt6/f8xKRCWYNYeTO2ZHtFlWNWS79LYr+6+RmINBDr+H97Ybk/C0VYHbFz7ptjeWAMo5a
	gqLvmev61WaPoZMEl8VnWUA==
X-Received: by 2002:ac5:c00f:0:10b0:5ea:e18b:16a8 with SMTP id 71dfb90a1353d-5ec22ec8268mr1986259e0c.0.1793023312319;
        Mon, 26 Oct 2026 07:01:52 -0700 (PDT)
X-Received: by 2002:ac5:c00f:0:10b0:5ea:e18b:16a8 with SMTP id 71dfb90a1353d-5ec22ec8268mr1986164e0c.0.1793023311680;
        Mon, 26 Oct 2026 07:01:51 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7984f5sm322859066b.77.2026.10.26.07.01.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 07:01:50 -0700 (PDT)
Message-ID: <7684f3dd-e5c1-44ae-bc05-49d2ce64af24@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 15:01:47 +0100
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
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add initial Nothing Phone (4a) Pro
 support
To: Oleksii Onchul <oleksiionchul@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261011095221.24767-1-oleksiionchul@gmail.com>
 <20261011095221.24767-3-oleksiionchul@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261011095221.24767-3-oleksiionchul@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NSBTYWx0ZWRfX8Q/B61pMCeF4
 ymnLrLG2BDoySP0sEM8KcEa54bTI5dMpxHHp10vVxdbkx4dcUdl4PWjEfkm8qFHDwlFQcDjxtfX
 Rjk8wcFkoB2hX7D4ncLeEHPBclmvERlvCRxg915t7WZRt4b3TUY7EFavImuIVYIwxJuv91+WZsp
 OpRzaqWMFNQ7hrpmywHSwav1gauFbxpLHjllTq26UwZpzeqkOU1/SR64UXA4YalRca1QrGWeq28
 yHMl7mA2+mcm7pHQz5cfl0ppg+cpaaC2dL8PqegGkyAcgopef4VRuP9+76jKuWUSfN7n2eOgslL
 rXBOtf4gk8i8RYPolXiXUYwBgKUVEB9ea7d9kfXSLt+vDeAABT0hekILZofzr80eEiOfkaocTEH
 Jj0A8Yu46sDoPcLWiEG9Ih/LcQXIlg==
X-Proofpoint-ORIG-GUID: K4s_MbjS0gjH7WLyBMPggiUt-q4lwGVh
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf5d52 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=g09VQlvOWAvZh4W_s68A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: K4s_MbjS0gjH7WLyBMPggiUt-q4lwGVh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NSBTYWx0ZWRfXxw/EduYJbQ3+
 72LnK+4WtLXY7hKIVt97uTUSPvyi9oMhxDGVBaO17zsozLTXyY0dgSJVBFwj/EH6SI+Ujxnw+2r
 Jxe3oO+hPpn61/SIu+CmKRSH3a3f3u0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610190000 definitions=main-2610260055

On 10/11/26 11:52 AM, Oleksii Onchul wrote:
> Add initial device tree support for the Nothing Phone (4a) Pro
> (FroggerPro), based on the Qualcomm Eliza platform.
> 
> Describe the UART, GPIO keys and reserved memory, including ramoops.
> 
> Assisted-by: LLM
> Signed-off-by: Oleksii Onchul <oleksiionchul@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
