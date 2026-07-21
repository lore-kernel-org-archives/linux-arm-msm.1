Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F9D39E6EB
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784644105; cv=none; b=nu2lcv1jCrdmbTyatr4sTzo27SSKdEJLj5ZP170lRssiq7Fr2763ZcKhVJDoqOqqCswL0kVxHPF8Y3mswLowTM2ygh2sPJCfVQfVZ5CpMVMEYcxftWw7y+Rpi/ZXgPQMFEsDLz6uRWxXTMX4/PwAfHJsbS6oBpbWD0Qi9BMztLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784644105; c=relaxed/simple;
	bh=e5ORsw8upy88cb2oBdrLePnWNapBw6N8MxEVh906e2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hO6LXj8cxBWv4vnBIZwSaVJUQpG447pOkgUNafYB2eefNb8/40vOd76akort4Zj+Mk/IFJswLzxfl9XewBsb2O+4B3Qux7EdBESZSroqh3gZ5lNZLo77zpYYAH5S2mtsWCyf6E+r7DASS9bViZm1XbbKCK0WQhjJlxO/4imjxN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TxAFDKyV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R49/LH3/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TxAFDKyV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R49/LH3/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDfva91912514
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:28:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	geYxV6Pbr9dcYBoD+boQfoISuBiLbNESOvQtw80hoJk=; b=TxAFDKyVyZpaB1Hn
	HyFh5IWXG0EDjuyQOIRZVfEhsH1rIvwYMz5/RFZyK5WuzROw0as4MazDCW+SJyRB
	4TRMBxFlM1VSfdSpMnutoB+bym8jIoN6v0SkPHvaXJdQSlb53RVODb4VTEZyVZg3
	LL6ePYenq98GL1KmYSzTCV3g6dZd0fyn1ukAXgdCHT/IhNS9qHc2d/+57uavZnCx
	LRsB4td9dG+u6GGa/BzD4cLaDXEiWFx605fxQ4gW8NPZs5ZFzGB2Vi2RYTg4wqkO
	5Q/QFzH90UMi3vItq7P8RNJbOMxnPWp2DQ/ou7HeN7S1UVNO2feCH/MkyM/PLftr
	+XRy5w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1dujuu7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:28:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c9e97b626so21840871cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784644103; x=1785248903; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=geYxV6Pbr9dcYBoD+boQfoISuBiLbNESOvQtw80hoJk=;
        b=R49/LH3/Orxp8SNQcEQtJffcy97pU73P9hCL8mx/3MJg4bRx0DiGMsbFZ+sNPzRcn8
         dzKVw8lOJhxADAkik+Qyj+rxTRyp54ioc5xjKSKSm9kH/qFUSH0SiV7NqVRoPt1NFREo
         Viv5knRXRv4TVDgel9fTYKRo22kdf5RFs3+dauKQwXkh9GeOrwUXtdZa8tUA10C+Pzk4
         fugExG6agVsG7Jf4SAqXlhNFxutOiCFdBDjDjn6P4u+gkGxUhUQRq3o/uGjNIDZka8uh
         wMZAinHezeMvF/alS2Y6WKkCUxGiYy76y4eRyIy4otynLUpjBZPvCRY9AvWtaxRUxd0T
         x1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784644103; x=1785248903;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=geYxV6Pbr9dcYBoD+boQfoISuBiLbNESOvQtw80hoJk=;
        b=KK2CoBTD2CTiPuecDrKdiWh6D5HnYvAHatI5+Pxl0edUwsVverZdoN9YWQVerI6xgD
         N8FkGuc77dtwlVV9tSa0xdcTf2gI6UUuwi36C0J7gtZUgBJEpvbSjzEsjO04CG07QQ0S
         T1Ydj8XSQBJ213//tj4kRX0EeMzRQmPfj6TgfPO3PiJmOyUMbFv4keDp1mogrHBaVOFz
         VCa97sDr6XYzI0WLb36LzdtUeNHZS/G4MgVs9+4Vhq24LT7cfkTuS+WMA+4nWAOzYsLH
         4sZUE6G+z+RgG7dO8+HH5tkkSbu5XiNS+a3CX2/4sp2daPLYPgNOGRkoVCsb0XBjSLZW
         FICA==
X-Gm-Message-State: AOJu0YzI9yZqB/vo1Pbgwz0W3qnt6qwUIkT6tcyt+AF51zm7IsywyeAW
	USgoZl/BfQNFWKMfxYZCP9kGagIPyWpCbhzNycFsJf1kVKAVyirrfeY7Irv6kOVw+GwHypgnFlO
	8y5IS2bfrI6V6zuESSbVce1Zuukb/j36cSJZVt1+5AyOVZyksg0gC8B7smM0wNvvc51BH
X-Gm-Gg: AfdE7ckPCKFzJiY/v1SXzOIzaqLCxdxnVkF3eaKHuPWAXk5aq+A7W2yqMUfpkGtFtZu
	e6zDBs0rlUSF2U8X6REVMBwQIZw3P9VkUBdNIJ5V35sribhQJj/pKDOKgRAjy1RdtOyc0VlRP/Y
	ga/GR4yaWE/cnUJ1B4o+oyQljvStqiRWCI/RcatdlHFYcqbHp/lEeEqv1KOdFzCnk3zuuAJZRgw
	lE6Tld/SEUHpgUfDWjk98MzB2PorVPGniXSgyoBE64mULKaFjAW39vtIodVdhj6Uu/vcdEJizM9
	w/XhKN3CY0uWSwcrGJ7Lzom4btbLfV5alFSgf1ozM/wcNmpFe76Q62c1hO6WZj22JB66kIHgrXR
	Sb3UddId3nDi4ncevfCrR60Ds
X-Received: by 2002:a05:622a:1cc5:b0:51c:d8f:d77a with SMTP id d75a77b69052e-526721355b4mr27218721cf.1.1784644102704;
        Tue, 21 Jul 2026 07:28:22 -0700 (PDT)
X-Received: by 2002:a05:622a:1cc5:b0:51c:d8f:d77a with SMTP id d75a77b69052e-526721355b4mr27218231cf.1.1784644102052;
        Tue, 21 Jul 2026 07:28:22 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1724f50b72sm610712066b.48.2026.07.21.07.28.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 07:28:21 -0700 (PDT)
Message-ID: <70349e4e-12d4-4cc4-91dd-9e5d45d3427b@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 16:28:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa-iot-evk: switch typec0 to PS8830
 retimer
To: Xin Liu <xin.liu@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com, Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Milosz Wasilewski <milosz.wasilewski@oss.qualcomm.com>
References: <20260721074145.1534100-1-xin.liu@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260721074145.1534100-1-xin.liu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ip6w5F9uOqALyIEggTjh9ZxmgQ7JuKCW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE1MyBTYWx0ZWRfX2ymEOsr5c9dH
 qF1eE+lpvA3xHPF4+cPAeCJpXoEIr7FqFKvxTRZecizPzGrourSDVLdsjW5242TX3+nbFPvrA//
 FbzN/LhJKYXLVhdo2YOl75OGesNTyHClkmDjx7orJRDX263B5dt2BMSFVLQLNTe7RKBMmg+uik9
 rOyprZXoB78e8poBtadvVJSlR5+wG1ijvKHe/HWQa0W7+o67iIU1iNaibjARVD3QrV/QjCv5Vbe
 C3VD5DJFKUCiS4a4v8H7vjEwSLMFOQE9sxlWGyrf0vTKBBIcy7kjUDH8bMKHJ9D2NlBTJ7XvRpb
 jyhON5gy7MWWkMZg7Mom6IuDRKpmzsXWme7QnatAKcPwXOdHRtTFT1Z8GconQbydjQI3SfToWek
 QMpuF4dVlsbpH2tm0uLuMIjWGKLn0BCWg5iXuQyZ+I7DlS0rrY88rQu2PA3nSK9tOxajeGHKx9o
 ZKL+CfSO18/fjWkdTcQ==
X-Authority-Analysis: v=2.4 cv=I9JVgtgg c=1 sm=1 tr=0 ts=6a5f8207 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=DqTL_hbh-M5QnLuVPNcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: ip6w5F9uOqALyIEggTjh9ZxmgQ7JuKCW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE1MyBTYWx0ZWRfXw91GW3aGmlSD
 sUpkPKUbFoEUVPPa2zxzbWaYmhQ/t62wYA6FxcwfR5tNsH5Os2A1h+rG6a7mKGJPaoHLMj4gV87
 z/fsHV7JxV8B8Bb6hbjtmWzgwq0bNbU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210153

On 7/21/26 9:41 AM, Xin Liu wrote:
> The Hamoa IoT EVK populates a Parade PS8830 retimer on I2C3 for the
> TypeC 0 port to support USB3.0 and SBU muxing. Describe the PS8830 and
> route typec0 through it.
> 
> The vreg_rtmr0_* rails provisioned for a retimer were already defined
> but previously wired to nowhere. They are now consumed by the PS8830,
> so drop the "Left unused" comment.
> 
> The FSUSB42 SBU mux chip won't be populated on the final EVK
> board, so remove the fsusb42 node and its pinctrl group.

Are we sure about that? I inquired about this on a pre-release
version of an equivalent patch and never got an answer. For sure
there are a number of boards without a retimer, including in our CI
(+CC Miłosz)..

Konrad
