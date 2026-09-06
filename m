Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603AA377AB9
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Sep 2026 15:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788709887; cv=none; b=QGh+N/KvmJtlOXYfeExD9bqFN82DNoBFiAqxnk2KNbg8puw7SJHqf1PSObGabU0AHV8m/6p8AR0Kpnsz0fm/Ag9B5WLnKKVHRcXQYWCb4eS3PWg5G3j2kmLuhSLyHN0kznMbQ7RnoU2TnXYsnJcgT+1qPNBKm3cag/xb1tPFgmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788709887; c=relaxed/simple;
	bh=aBvKHXJMUyfS8/ReEsoPVCIlZRhVrQR480IPSglyxog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FPPJKYDQxtt+u7ZJDhohMuBSO6Ugp1ynoSvo/xG96fuIYCMOhvw91HXOmPmtLyVRNTPtJA39n59kr3dQir75AVS4hi9hfsC9KQ7QHpEiG//QkB2WfsxSmeXu17aI0cP3LN02ZtUfgmz0q6dKr/xckg/BuRXZl0Fwsas0PLu97zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DLmEQD6I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iaPB7chR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DLmEQD6I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iaPB7chR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 686EXFut1293347
	for <linux-arm-msm@vger.kernel.org>; Sun, 6 Sep 2026 15:51:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WCNnlg4GyeLNFBgZB9Ozm8QTq3ZkWVLYSJhs0FHtgyo=; b=DLmEQD6Ii5g5CD3L
	FCtBjZ9lXnkhOq/YfgNIJf6rThoNoOq8496Ys2s/zcgDEbMM+yVBpkOke5DwMaCH
	RR07zWJd+EyUU5vW1b5yApfl3AuTr1B5Ylbj+jauQmBJMoe2vSLPf//JK1lQ2sLW
	58HyWmyfFkhKNxrRqafZZyW1GNgXU6HAkMU2NqezcGJEoYvrWwPs3k/ui7PoRLaE
	a9hGvrtLnLYVDnuMpNbgXDj5G0JWHWxkDVK48OTKhOOXYotCFKMNvoEkS8PMrfVA
	8u5+iu7zJjM1BzHCCuLc6J7i0wT4VIUSp+hXF1FFSBdLldtRWupyBVrYultfYd+H
	eyrtMA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg8eq46u8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 06 Sep 2026 15:51:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398e1fafe17so4276006a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Sep 2026 08:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788709884; x=1789314684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WCNnlg4GyeLNFBgZB9Ozm8QTq3ZkWVLYSJhs0FHtgyo=;
        b=iaPB7chRrUwVqrsYjyBlwkVRs6HJUO7X9qXMcSumcJ21v2FlE2dm5RabE5wjoWpQ5q
         9fAYNi5bF+D++zq1EJcmoZD7DSHQyTKFOD+1g58CidbtBVStZPdODY4q+myMmD+WmpJH
         26YpgRH8c4aoByizxviOh7rwSUHFCr10KkD2dRM9vnbT/GD4/pEWWIXyEz2JFR7lZ8ZJ
         uoNdc/7ltOmVhEvO/OS0IEaqMmMmy6LTthH0a8/Tln7cDJlqDpF/gRKInGPECL8nRv3g
         sgtrs6hLUC5ZD/Yr+eujXR71iEPvaqPYK6LtESybQooQ//toGOYVN1Wi7+7kb/h9Ctr7
         0I8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788709884; x=1789314684;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WCNnlg4GyeLNFBgZB9Ozm8QTq3ZkWVLYSJhs0FHtgyo=;
        b=gzHeptFdkrtg0J/jIs8M8JWCHy47YhCA51CNnZOK/qpbAcSOfuP8tCBMCUZj03jihC
         GMl0trEj2IbHfwDXSX5Sf4kA6ijizlQyAI9FlK1NzhcCeOUyME/N7Nlw/7HGnJZ3Vp2j
         GweiAPCIlqc3x/ZCQbCYfmRb5ihDOckp3uXKfsbXaQL4SPJM6cQc2N77EdvHoSsCgX12
         Gby1hHbXqIVHkBx6gapzmH7Gb0+tK/RVBlNINHu1iN2I6tDfgTQyf/u2rsdCDJKJ9lU9
         iMLtUPvBAmBShbWkevL/cyOJN1/YBJU8fAVSg0MrvUydcAJGZlcVvoI1KbZcWF9YfvDL
         6U2Q==
X-Forwarded-Encrypted: i=1; AKwUvByGZYdoIi0VI2kIafmFvosd8q1z/EauN5wWyCUO6a0J4sJuveBPHDCcmxDmi8leBsz3p+WehR3EOBDmk8jE@vger.kernel.org
X-Gm-Message-State: AFuF++k8ZCnDi/mEh7YtW6yx7LvgnF7Qx/z3NWumCFvw7YZZVo99+37c
	wnIDi1IkhXyEzNuifQpAQZongdipP5wL93UvUukc1xichlnSVNbc40v7NMGbxR22wECRRixClDW
	HJa/hA6pk1lTcCgP5P/S3yYp8QYQiTpPZ7mL4mfHQh5tAGIgj/AHYeMiGRUIbiFgnbFO3
X-Gm-Gg: AYBFou3m7Ql01KsbByM1SGMelEqa7IQhw7nBYtemvyL5lUcaJsKzrMT/z2NlpySPoRC
	IPoxHZ9FbQPXTjAvT724Uy3xkE2tz5TSUtdzhuOnxgks2GEsXCi2Rqvt8p8yKBja7kUFqsMPF0X
	Fz/orUhPkGUurO9KoxxktpSPUxmaGJ1PoqWpnt8F+vSR1pISf98Ua56f9UOzHwVrI5k8fURtDK+
	eOQI1TlKzqaW4Xs+UWVwpuvkN7ub44V+Ll1NILB89STqL9q+K4zFMXs+n675eWD97Rz/WwTXJea
	e6eZb+FbK3zA4svk6LEhB466uqjKuRyN3PWx2J/0KUvZNgF1PgtXGHMfM4prvPqRZljui88v7oq
	IcP7WQdsO9jU612Hjy5xl6dBH/C4B
X-Received: by 2002:a17:90b:4fca:b0:38e:5b59:c2ff with SMTP id 98e67ed59e1d1-39b260dd278mr27450038a91.3.1788709884260;
        Sun, 06 Sep 2026 08:51:24 -0700 (PDT)
X-Received: by 2002:a17:90b:4fca:b0:38e:5b59:c2ff with SMTP id 98e67ed59e1d1-39b260dd278mr27449993a91.3.1788709883853;
        Sun, 06 Sep 2026 08:51:23 -0700 (PDT)
Received: from [192.168.1.11] ([103.211.19.41])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243bfbe3sm19755723c88.11.2026.09.06.08.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 08:51:23 -0700 (PDT)
Message-ID: <3a2f535c-7ccb-4b50-a6fc-f73ec02d4acf@oss.qualcomm.com>
Date: Sun, 6 Sep 2026 21:21:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 0/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260903-x1e-csi2-phy-v17-0-26606fa9a039@linaro.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20260903-x1e-csi2-phy-v17-0-26606fa9a039@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F61nsKhN c=1 sm=1 tr=0 ts=6a9d8bfd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=HcLy/BXbbKFjgnJyaMb84Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=0VQvOID68a5ICqMF5fEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDE3NyBTYWx0ZWRfXzV8GupG+ZeAT
 cDyHfq5uQYyuP2ekvmJHg1ftomPw7kRIt2uTFmyScXEBEzjNCRjNPzVs2RNW82B15dHqBD3MWJM
 xaK4+omOtWNx2aPKKhbVdXTpr8g4EOc=
X-Proofpoint-ORIG-GUID: UENa52Eur9b8RX2MNTUtdm7dVcxcu-v8
X-Proofpoint-GUID: UENa52Eur9b8RX2MNTUtdm7dVcxcu-v8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDE3NyBTYWx0ZWRfX+h1bN6CWwDWZ
 kYXcUBHWN7gkuMYyhoa6OVNrnscoRkdA8eyKQ/ygTSIsg0zpoE8smysrjH6AODaAeqOAl0jSjlQ
 Cwe7IBFQ1z686GPWo+zd2cI7n9eDBULaRMYWGKt91g5ygV7ATHtikdTrV2zoLU4krlZXb0rvNGB
 7NKYxaavt6fnwzdzHJOCR6Ko6dl0RJkxIj5v83ca/F+SYvYExydFDOl7HBwSf+ZL6UYPSQJ+Ycy
 plYlWQ9pFGtSnWME4geT2XFBkwKI9T9Pql8ovUTed5FiDJPhh9UwMLRHjvC4N9oGf/uoKzIOA/K
 p4J67DTZuLIJR2qkHQr6MeS9LUR/ZY73o3m5jgZ54ADinLYNIMcn2ComPY0MotS3G34iP7Y/z72
 9JlAB+7utH7hzFO9yvS92X/2N6diqMbQDA9HmMoEtMCaqBr6JpmhZEpe18b6Y1FpVw7SniwrFDG
 R22C9I5E4XWS/J1sJ+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-06_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609060177



On 04-09-2026 02:14, Bryan O'Donoghue wrote:
> I've retained the callback indirections give us scope to add in another type of
> future PHY including potentially adding in the 2PH later on.
> 
> This driver is tested and working on x1e/Hamoa and has been tested as not
> breaking sc8280xp/Makena and sm8250/Kona.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

For the series:
Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> # Glymur CRD

---
Regards,
Nihal Kumar Gupta
