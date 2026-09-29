Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97DC51A14F
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687870; cv=none; b=fzepObB7FPK26MNc+BqFEkEGH9/E4+wMFPO+TF/UfYsc+6SesArS564ojm2q8uLvstOSxmt75ouJMmMFT3PqUI7/+oP57WBdmIyCryPD7p7A7qiQ/H2a6iVAgSQVZn3HDVo4oz5daYP5Utk/wdjsv9brPrQJAbZw+iUedEu//OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687870; c=relaxed/simple;
	bh=9uITES1c+z1LwEDwwhjcHSvT6lcopxRkz7KYTY2wSgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L+8O9Ymc/3NWJOik8eMIWCLgP5gXmh8sqn7/6k04Dve+LdJVDarzXN6lG90osUHhgiYHiY8iSe0gUvD8ehn+mIWKenxIXV/Gxjy7suLxmYmwFjSnI9YSs/ib5BNybaGzZ4N+TbM1ukq/2pZO5kF+eqoL84N+hUO37rUnGpgq8OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PMfaLW/Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BN8GO+B8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PMfaLW/Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BN8GO+B8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCql3O205001
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:17:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hOM6D8WYiBBJwNCJU5OIk+JD
	Q8hRCCk2RfwO7zCPqXg=; b=PMfaLW/YrGuBxy1SB7cio23SoWepq8x6J0tt4O/I
	0Qmp4rots+8j4MIA1GQ1qw3ECR6GcRyMMOqqY4FX7leyLzHoGUHcj3XhbAuNMkQy
	X5lhfjXcy/JnTgdlyTfaG17rz0Bs6bzCXTR1vaZy8yU0LiYEaaJ0YGvwYl9CiWLF
	QsJK7zowDZgO8CMzrvT4fdu1OOICh9R88sj9cA57GzA/o4Ud4Xo5uCVpZzi1Fei4
	SgUK2tu6wyoaVfSZDSQTa68pW0IxF84egKFdmeYpVS1TXopbjQAGhyvs6eiLotS1
	BI4DnZz6kWOu/H25YV2+JEdDDtK1Q8yycEsvslSD3eHHAQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0144u56y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:17:47 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7b34a3d1f9eso682182137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 06:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687867; x=1791292667; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hOM6D8WYiBBJwNCJU5OIk+JDQ8hRCCk2RfwO7zCPqXg=;
        b=BN8GO+B8n38ORXombr3H7CSiJ98HK10OKxQa0OuySxKFNVidD9VyhmvMUDCpPtDkCI
         2Fkd7O9wfX6S8+LnT3KlSwxpvSiZTu7MIVV+EACZIBMoa1hi2OMkczJVNfMdsQCYauYZ
         FAk4qL6i4t7OmEIEHU8uxWWcwOCZ9mg1IspZmKDPmDk4osBddwggaUoZhtLEhOSeKj5Q
         JVttBMeUQRmnndZXtjpRRxGdTIXC9VDgJkz3Bo9b04WK7RrusDPuCrFkEhmGIceXOJU2
         WB+BmDJbkQpW2/UHSVqMNpMKOmSfBTestIoXL78F1uLXA0W+jpXqKfxbbXfVXgCuu5cn
         SIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687867; x=1791292667;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hOM6D8WYiBBJwNCJU5OIk+JDQ8hRCCk2RfwO7zCPqXg=;
        b=LjHqSSaEYcJQQ69JHIGvC009fsyatPbpqELZROOn2j1ke/HM+zWFriNvnk3xVqh6Qi
         NbJJf6NykWtZh7pdYqCZDN2hSw6ncS/EEy1eTfKVjH81AfbV6cWsrnpMxPMD+4W5CCBq
         NPVio4eaYuQO3GpjTMhMweCzpaS4yTGxHfIjaWe0fVYpat5bAuaRsKeyfBMIy1ZB19TN
         Z4w+anLRPgPKpf4zDyT1B3XKBCJ769ZCs/LiulpNFmxku3Z3WijJeYcDUVfnOs2maHBo
         Vm3zqI1lTwLej80JXClRr3qwnAPjc/HY2ir1Rc1NY0SZWn6OoCE/c/GRy6Wlsixb4Dbz
         AlGg==
X-Forwarded-Encrypted: i=1; AKwUvBzOTDZKPCLPVYFUCWs+6YcC+e3Jf++e+izPmK5aLHRGPK5yxzm5oWdWCh3H8j8d7y63ww/FP/XQe/jD7pWh@vger.kernel.org
X-Gm-Message-State: AFq9FYLjQ2qYmCPT4IHrs546oa3z5nNnZY03+hklExAQDruKtuzYeeW8
	nJ5OkBIIkMqpNv+1BXBEjj41t0cKPBzGsSQBd3eYpw1d6Br6flsNXZ33qXHGrq46swHcJjY7vbo
	Im2SfEIpVGLZuvRBZixFMnRCPrOC+ckQ7C8ZXkBzgkxxc/hjxjBgYVOGGYkN/RCF0SRxZ
X-Gm-Gg: AYBFou3Ooeeoh+aejbAU5nKRrnCpTFA5FKx3mmlML0tLUyFpjd0z//sZcGMqWW2MT5D
	9tkaBK7mDlla9M9yunZMJiTeqquRmsHMVjk/cWCAAcqJ1I0Y/hLxq9/HK3OcwNmfqNjImXR8U2m
	AP9OBby/FHdofCAoK/6Capn5kyYzgIY1XgfVOocvGvKHYq3CrrLPmHsdMNT+Dvlvs8xDBaBZ8/+
	x8KNXd/MUoSAN37r123q7p9S/l/pof9yWgXoBXzqiR7OHbaJ0OV8kzntir6MUMIEsn/BjuSFKLl
	ggvBA6FP+pKEyqUq9eeFBriJf3rmsBrZTJGsRWGiTs6A7/r2hSvXNt0f5t9i2omBSZP8FNQirfO
	jeB7G/vWN+YIl11s=
X-Received: by 2002:a05:6102:390b:b0:7a4:c3b9:1e99 with SMTP id ada2fe7eead31-7af1e9f582amr4743121137.19.1790687866862;
        Tue, 29 Sep 2026 06:17:46 -0700 (PDT)
X-Received: by 2002:a05:6102:390b:b0:7a4:c3b9:1e99 with SMTP id ada2fe7eead31-7af1e9f582amr4743103137.19.1790687866208;
        Tue, 29 Sep 2026 06:17:46 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfe13a1sm76923395e9.5.2026.09.29.06.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:17:45 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:17:43 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: [PATCH v3 04/12] arm64: dts: qcom: pm7250b: Enable BCL sensor
 node
Message-ID: <nqpxb3zpvlpzw5ots6otyr7v662q6ql2dk2sies5w64fvrfbhh@5xd2nixnjnii>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-4-f5ca00889cf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-4-f5ca00889cf7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfXyWq33dICy6Ff
 fH4/u+FtpBx1s8nYex9x1Sp4wCINOtUhqyjOnFDMJLnFX22+0Klg0HRfQYcmPDTljVXMlTAZF7V
 xtsYgUr+7ZCdIwijLNVHPLKdxN31PKI8a8pfRtky3ZZ+byAq54EunwEsKgcI8JIOKu6e6bFOm5P
 Ld/319KdwsbK4YmO+sFr+S1GDHOpb8dv4WS2IybxdCe4dtbnI1aFSaMNMU4Je4vppNJcHT7E/eS
 4+jnwP0L0yv8Ne2jZfKQQLM4K/Xq9Bhzm7x2p/BxFZhJouW6X3ztx77whEXI/vS2RBJ6qSZD78y
 ICKIzgTgEWPjtLfHsT25Geb3hHSxdts9aKQW0DRNQTKJT6CZrXi658FRMitz2hXz0YB5P0nofqo
 aF2bwYn/G9KEy29xBnW6PYUteV2eXMK5pJZX6xgUAa5PpozrIs6c238kknOG4R6iPTBWPcLcesj
 Ay01j55ZYsC1BcHmjfg==
X-Authority-Analysis: v=2.4 cv=FJSOVOos c=1 sm=1 tr=0 ts=6abbba7b cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_82NC3t17uPQdkoQo54A:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: GgTvAJH3IlDHebxZ1BigoLiPvXDG-vvJ
X-Proofpoint-GUID: GgTvAJH3IlDHebxZ1BigoLiPvXDG-vvJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX4UJ6GaeZIhzK
 FpGICSXw94KtXtO/UyktUM3AzAxaKK0vgJRDrEU5j8+z401zzPmimnR9QU4qjsZUMk1YwpvFJZR
 ZCq3sx3s0nAiabLka/gPXS2wv2yQrys=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290052

On 26-09-29 18:39:36, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pm7250b
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
