Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2560485CDE
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 09:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789638611; cv=none; b=WoDe1xwzO94oOFG3ElTqHtQx3lD91aC66hEWonJfuDtO5oUq+z+PwVUzshPb7LTCSKUcxMiMKu2QN9v3rkg5ljq8PTOwkKO4yodl1akU5vABYMxSICF7p97Xf5L/GN9QJi8B2EHApm7ncghpKgk606JNfhiVNYGmfvecTRy46X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789638611; c=relaxed/simple;
	bh=VKtvCqmaFwakDh3dPdx59QHwtYLAF0CeW9u+HP99fIM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KKVNuIpZceohuuDS8OhTBIBxfLBQx3kCoNzLKLyL4eXWPa+kvaRTycmkZReLanw0p9BgOCqAcZCYmkxYSRyjHIX8OOI7yPRupEQONbiLQzCoTvr6Wt2TJFctetnOfjKeblroxQC5vzTuXA1JCHd5YN7FaOngzwjz20zlk8/myq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZWNFDDrL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IpbPPfkK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZWNFDDrL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IpbPPfkK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zube1390194
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 09:49:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EXfjpYF/qRx5R7vw/ngOXgeAsq7XaRfsZ2rZhaAn2Fo=; b=ZWNFDDrLmTQxDCuQ
	HFDQlHMYRRCo+rH2wLP6KJcXoMJ8HI+z1pxwgOXSBrbhfMiC7OjhqJkMx4i5kIJP
	AwJaTN2D6t3ambX6BPl/8pR9v0pmvtwDa32vIbW1mrUzIMb5qrXaO6bbugZMRZsn
	+VXJ8X3YFMjpnizlN8t8hGnwKJ+yYpFGJgBL5AyJb27KW9XgaAuG6d53uPGvPzMm
	lqMNnSS1Ik1zfwape1U3jAVGp4Gn7ZESpuKhHd+6Jw0cQVesTbS5nyjtU8AXCryu
	XaWpXmwJh3S0yS5zirrCu8D30NDPMcpnQsqfnJv+EYJvZSdtlmB0I5n43w71rZwb
	eeIIvA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy2d3r9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 09:49:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9394ad7f64aso86565285a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 02:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789638595; x=1790243395; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EXfjpYF/qRx5R7vw/ngOXgeAsq7XaRfsZ2rZhaAn2Fo=;
        b=IpbPPfkK46aF/uZ6YQq2AuAsYeQO2JVXE9INb7wH+Oj93T5aGihLAQSBOeId9JteIn
         Gxvhxg08YGWcYTU7t2+FfLDT0ojIlAhyQSGtFLiTAZMjnxlpfFSeVBipYyjCKDcKaYfr
         w7iA2h13sR56lJ4Z+N9kSXRnTZJlH3mZl/6mEiE8EtHRuI3DO2oWrgubq43Rn3gNQcww
         K+LuiQ+mFCoztEZ4Gjwz/tvcTVoVbYudtw7Ug+SSVHebxcwn3z1mrPhA3/4qr9NKoqvu
         q8y708VzMoZx3noVZ0V/To53DgVTcDhw+bKa2eTbphWPBiy8IITOlH5fnD1e5ABZgIi/
         DYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789638595; x=1790243395;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EXfjpYF/qRx5R7vw/ngOXgeAsq7XaRfsZ2rZhaAn2Fo=;
        b=VT5qSy8jwRCq1HLnebTX495M+IY60RHqMzZwGrRyedE3G1y5uohRXnEWbBueqVU66z
         yVfxyo7RUG4SLS2JVJL2G5UsbORnUTbHLWatQefknXEzaaMVAwf1GX91SBeCL6PjO0Uy
         WqmTCZ//2NE0sHHuBcF/tUFS3Hgxz58JfLKHJr1r/7t0Er2oXDSncOhb7y2VhVQytQH4
         CUjiOnj0CNuayN23WCLZ8HwvBiop51QgwPHBseaEOCPKvOUyo8kyD1d/NRLv4oSN7jSs
         zPIF9Rfyxua3ePcHHWg50BqpZb79O/G3VXLkHSnQcnjhQ8f73BJQukwDMvYzqwgXaHGu
         oS+A==
X-Forwarded-Encrypted: i=1; AKwUvByzpiAVcjbBwMsx1KhHv30u8hBLaeyf5pbk9luNfxesfUbmd0PsmwWPKtYT9EvG2O5WFlpwryxxoGJVbhhm@vger.kernel.org
X-Gm-Message-State: AFuF++mS+KZ+iJelQYhklYVw29I2yHO2cC3YjskKOJPyd/dj2UTWKueC
	ZShP2HjNMaQBVajQjrmI/BJ6keAVyro83vW+GIaxo2tUeqeafO9IdMzhoF5NzmPt2MhwvDxkm2L
	q0D7LjUFRVB3Vp+S45fzBZXWDncsVRdNeR0+gEXMFt9mav+MKBPkK0u56DwJuHIZn8qD+
X-Gm-Gg: AYBFou0oCsGU2QnSxSUVAIE4j/PA3gS+XT1dWBOiHzPTwXGsESwFU5I/cvnLAICznpb
	XXZ7NFzJ1wcQ8XtxnIMmILk6M4bKSXkEdYZzsvZ7/nOKiVhRD5sH3etxgizpprV5hafxNGj1XV0
	LByeESc2AYmdlStxgfBRg4i/KsqKWDGBFkF6ogymm6jCaLTMYRbcWbjaGohKm00ECG3vGwwtzJw
	yZew5OiP7n+fJJ5vQJvKEl9NIsk2FM6u+sHgyJh9bLdYpQNdq0gAv2i89CL251SXTwaxAdjJiBv
	ue9CioWIUPhU5v5t7Oqm/8c1dY8s1+St429My6RyAcIPkSxmHEeNA9TTx4+F2WmpVfMpZll+tnW
	LBwjZL+43bHZEON26o5q5btoRl+Y=
X-Received: by 2002:a05:620a:bd3:b0:939:6de6:9516 with SMTP id af79cd13be357-93bb79367b2mr1090293585a.45.1789638593119;
        Thu, 17 Sep 2026 02:49:53 -0700 (PDT)
X-Received: by 2002:a05:620a:bd3:b0:939:6de6:9516 with SMTP id af79cd13be357-93bb79367b2mr1090251685a.45.1789638584950;
        Thu, 17 Sep 2026 02:49:44 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef7687sm15736333f8f.1.2026.09.17.02.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:49:44 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linusw@kernel.org, andersson@kernel.org, brgl@kernel.org,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        pankaj.patil@oss.qualcomm.com, maulik.shah@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, shengchao.guo@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: nord: fix GPIO interrupt target width
Date: Thu, 17 Sep 2026 11:49:40 +0200
Message-ID: <178963857686.7532.12774109057722051769.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916085720.771498-1-zhangfei.gao@oss.qualcomm.com>
References: <20260916085720.771498-1-zhangfei.gao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 3Y0rd-3lkDSIC7yhqZ8Ue0lqzVUw5eBw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEzNSBTYWx0ZWRfX4a+QBfQmS4BL
 LsbEv4frVPpCicojwjvwlBJbqmSx6UI4Fo3IPztAZSaOqanSPLm0aYnCADaYsuMvRbwkPiEVYJ+
 u3tTFZvWZj945VV6RkMmGdGLPVyu9hc=
X-Authority-Analysis: v=2.4 cv=HbeB3SE8 c=1 sm=1 tr=0 ts=6aabb7c3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UQ-mpCxKgesnfiZAKPwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 3Y0rd-3lkDSIC7yhqZ8Ue0lqzVUw5eBw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEzNSBTYWx0ZWRfXwqjaWpOgcjv4
 Mmh16S9WcarwzZQbYuyczXaXXn5UQ/fw84J5APR770dFjTeI6KoDqHWaDl6iYvYwOIXJWAspbBp
 ONAd7kQQogD5DcotOQqt4U4rQ8P7dgpkmaP2YdVQ4q9uuldCUVefX6VZSpvFCmlk+On5UhoaQ/u
 uLk4sT2fZgSqmA7RfUqpdZfPb4SgWXDYqQYzsSv2pq4m1KOc15Vl9rup18EG+Qq6DKN05kR1Ifo
 vMKA3QHI2VnYuyXD1yMmnKT7uJox/1zYl+Tm5M07tzqTU+bPpwZDQc9VOu4J5Jqm4B8Qc2t2Srj
 Z9Lp6YRC/buak0OJUfftx9yZvFes/NueLvtoupYg6tvNuWid1Wm8DYzBDskuhkof0k7eZOgMyxH
 ptCVsLJqV/uIAYs/ebwYv2iRr/+9Iwh2exRQ19FAwnpE3lCNYlPx8S3eT0xAdx1qvOrpKurynAK
 Vl2M8fJf67+TlBBe4Og==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170135


On Wed, 16 Sep 2026 16:57:20 +0800, Zhangfei Gao wrote:
> The TARGET_PROC field in the Nord GPIO_INTR_CFG registers occupies bits
> 11:8. Describe it as four bits wide so the common Qualcomm pinctrl code
> clears the complete field before routing an interrupt to the application
> processor.
> 
> Without intr_target_width, the common code uses its three-bit default
> mask. Since GPIO_INTR_CFG resets with TARGET_PROC set to 0xf (NONE), bit
> 11 remains set when the driver programs HMSS target 3. The resulting
> target is 0xb (HPASS_DSP_1), observed as an interrupt configuration value
> of 0xb1b instead of 0x31b.
> 
> [...]

Applied, thanks!

[1/1] pinctrl: qcom: nord: fix GPIO interrupt target width
      https://git.kernel.org/brgl/c/68ab4a6a84b92f52650508acb60317eb76454250

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
