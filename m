Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A803C13E2
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 11:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783077328; cv=none; b=Ce47cqdQXQUDlsj00IvqlA1ACvUcyzNshGeRx/5d9H9APzI43kT8fdbuAdM/YixOQM5B5574OFjkfLyf6ecQ5ESZ1k/Jw4Go7whPlGl55PrXj8Zy3MTuXLDoNg/UI9XyaPZF6GDM6F6bAzvpo7kWh6REctPfhEOrejsEhgnWd9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783077328; c=relaxed/simple;
	bh=fh36BDF5Wbj/PXKC4YWBxl1j1DTIaaaH5aqUWXZOVrw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K8S+rle1R6gErOVjTuTPLHhlqkiR9UPRltl8GIg4XF5vyjA4kjL/EzO6jMzWxZCKG3VH8QmafkulTvR2TGop2TPqwQMnSkcA1pSRcqJCpXtqdGGX5Rr+nCIFVBzyWoxJX1lbgMe7Z8gHSymBGtJithftcpTXN+F4EGgVIpu3AS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RmwOdMMt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z1OalHRF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RmwOdMMt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z1OalHRF"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6637IZoJ3195362
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 11:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gsBCA1giK0XVWDpPfKpAgEuh7s3EHL6OztVzj2y8Zj8=; b=RmwOdMMtKyw9kFMm
	O9wPwrVqt29KlawWaGggpSyZgOHw+QkpxFF35U2uC5UuXLe+iSYtEcp3tb5xxmEC
	uKkImPFEk+lP9XBHT1io399Umq6LKNsPYaSwYtenfqrcFsyHgytTmF4qFGmiui0n
	DRl1KvaU4G+w1LIcz9oxkt6j5Xy/5zY7UFg9ehYlpMx5ACqYNJBZyYxWBlahk0yR
	wWTzgy8lvegErjNZeabVDcKHlbtw4rbiXmRb9FCfazrlLL5ovSMgehWJ9RkA9wOF
	PTyCh+3E3y6zJeGEOBn+bYKxMAe3sY8Y+NpvsFU47chwb8zN3XFKdpR3UVIrcWT4
	gFUhuw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jyrumh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 11:15:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e6a7d3645so6887685a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 04:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783077325; x=1783682125; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gsBCA1giK0XVWDpPfKpAgEuh7s3EHL6OztVzj2y8Zj8=;
        b=Z1OalHRFyjhFEyLi8rIbnWfm0DAuVl1bY6yLDv7NAUoMeRja7kH0pgL4S27AumiZTJ
         koEG2sSp1M8yt3GWKu31MiVJpUK/96OPK+r2dKRmkva2UX9RmFTZMy01mD1AHrjCAMIc
         i4YvH/dLyxDTK4H45uV8+HV6ec42YcdTM+aEvuIyA6GyRDLIPxklo3sreuD35rueOKag
         g2UL92HvRdlcjS3RzWSPmTMrugVsqXW5Ozx0enAHC3tuLQFyGB2kwcPT+5R5WnqS6adi
         p39BKzy+5g0seJPTyK7Cu2QNzlun0DaMIaVTaAbQUsZEXoFI6ugQR1u/XHDZ/XYk+yBG
         CUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783077325; x=1783682125;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gsBCA1giK0XVWDpPfKpAgEuh7s3EHL6OztVzj2y8Zj8=;
        b=DnNvoOoX6iruQskr7gzZ8J0J4rxkt6I+/C4GyNCWYeBtcB753KjfpLJKUBgQCCf9QU
         Yzt3GAcfZ7hYZRkjdVm6GEzYkbNCgh+yBz2wCxv1RTrKXjp2Hqi5WHOmZc5wj3CyCogb
         VSg6lKlYjEBXVerd/g8JcVEA5GAJvItWkfLBWasW/qHkmJZV50BZXm64iu60dWKhDNTD
         dI4L+TL4t1eadv+pNjYGjqrgm4O+m4ZkszRSXFqT7GDNFj2qXpPIzd89EC8RZ7OiyEbl
         xZFcPAlfSAcNMTkFm+XNIFwAbGosAZKphR//4rfNOd5F66HesuEthBhlmqysL2JffFc5
         L3lA==
X-Gm-Message-State: AOJu0YzODW6c6EGpdkGBYAz9KpB4ndkQuG93Bg6eE4TiZJlXlSC+G9tQ
	cy3YXwQHIMoAeuLhbj1YY1SeFxpVIUAd2lQ6/AIynTNqF+u1i3aM1AOk3hTWT0YzZr0DKZc2fSQ
	1/0XUdkoEBSSZCUCqeNH1b4srf2gd/hrJhQmX21DsFzpKzeteSqQbco0j7bWMgUKo3bsW
X-Gm-Gg: AfdE7cnrfBG1U8sX3dvVmYDts1P0t8k3wVWx0cF2JJcbBQjsl5ym8zb3t1f/LE6rDaE
	NN/bFyB+mXGs/r1XvG1Hgs60BLIQmegV19VHUPBzcxaH/1yOF9AJiBZOebzRRGXWyL9Q1QI1IGK
	zOhOZsXE2f0QuHXxscYTF3if0WEYDwxHboFYXDgmwdu/Uj/tiH+TZSPh2qy2LcmHA3Rg8Qpea9g
	zf7NFsfoUeUGQE/VFbxx6euOxpHx8iT4IPkOqCJanb8eOE0kiPvvuXtWaob2Ou6tVMfgXtq/EpS
	EBHjaKMCi33kA8mVnjRruHgydiaVuYjwcERvTnD/9/QlXyTwoQDz2s/pLsT3OyzCIauRLkOuqjQ
	eA5QsP/TK1tfLnYF5RYs7ByveaAGbTmUBYGs=
X-Received: by 2002:a05:620a:6482:b0:92b:2a80:3ced with SMTP id af79cd13be357-92e782d254fmr822406785a.4.1783077324583;
        Fri, 03 Jul 2026 04:15:24 -0700 (PDT)
X-Received: by 2002:a05:620a:6482:b0:92b:2a80:3ced with SMTP id af79cd13be357-92e782d254fmr822398385a.4.1783077323810;
        Fri, 03 Jul 2026 04:15:23 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6095b7dsm268392666b.19.2026.07.03.04.15.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 04:15:23 -0700 (PDT)
Message-ID: <76d4b184-e089-4dad-90d5-96da762c1fd9@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 13:15:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] firmware: qcom: scm: Add support for setting
 Bluetooth power modes
To: george.moussalem@outlook.com, Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
References: <20260703-ipq5018-bluetooth-v3-0-62da72818ab3@outlook.com>
 <20260703-ipq5018-bluetooth-v3-3-62da72818ab3@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-ipq5018-bluetooth-v3-3-62da72818ab3@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwOSBTYWx0ZWRfX+1YF0VKSXrgI
 8dkk0Cgg43b0+QQ6wvVWfH4oJDYC4qilnjywS4ZDL++nlYrnyOgo01+VRHQTMgkly19ooSuUkqF
 phfYsV6r7lRgSe7a54lWkoUS11o9z5VuGHxH4S05BQhOYKcP09j3rBP2mNSMAnlQcVUJtHt0Uh4
 XR49MyJR+MGUVA+iL8Ev8ZIcftUvTb+Ik9LV8ks7THAzY0kbGgvWsMYysaw19VXbnRJ2uzus53l
 mxnESVYTtV3LZFSo0YhI3EjmSdxsQeea0uy7wBBKwchlWjsU6BE44BA+uKYzziA0tgZHaAnD+qF
 M9rf+d1N9N5gGemJzRg1sNRe+xBOJr/rmM0VYS8yagYoxXypjr3vJSYBUAsyOZrrgSReERRNvz9
 r3Qggx28huI/X7SjKO+Cz1xDRJ0p/u1bYL9ZdYK4kSU3IWi1DudzH0Nkd/4EmXefJXkESmhsjDP
 p00qlZxp40t70ow1XQA==
X-Proofpoint-GUID: XiUscLXQJrbDKGIBhetATtKnkrjQyImc
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a4799ce cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=EFz_iqN25vaghz0NCYEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: XiUscLXQJrbDKGIBhetATtKnkrjQyImc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwOSBTYWx0ZWRfX1oVYc7jgCGom
 LxVp7ldvTnpeyRtZesTxjIXUm9TIJWQCUTvUeey2RGTmnwb1t7AtU51SblufvIkncVqz07m5kFv
 NxWUW+Xn3Wi4+O/HxhBiMa7ZI5kGBwM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030109

On 7/3/26 7:01 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> The Bluetooth subsystem (BTSS) on the IPQ5018 SoC supports setting power
> modes which are required to be configured through a Secure Channel
> Manager (SCM) call to TrustZone. However, not all Trusted Execution
> Environment (QSEE) images support this call, so first check if the call
> is available.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

[...]

> @@ -105,6 +105,7 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
>  #define QCOM_SCM_PIL_PAS_SHUTDOWN	0x06
>  #define QCOM_SCM_PIL_PAS_IS_SUPPORTED	0x07
>  #define QCOM_SCM_PIL_PAS_MSS_RESET	0x0a
> +#define QCOM_SCM_PIL_PAS_BT_PWR_MODE	0x21
>  #define QCOM_SCM_PIL_PAS_GET_RSCTABLE	0x21

0_0

collisions here are *bad*.. +cc a couple folks for awareness..

Konrad
