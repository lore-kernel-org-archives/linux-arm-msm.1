Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CAD3148D9
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 07:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786432843; cv=none; b=Bg0WGgr4rSc3y7Y/miKr2ZwlAzn80jMHWBJ1VvlK98FvQMV3kS7Ji/tFsUB9hnialdkeTEnFRyyrPbE6W7GkcoFfNZu+KeiWSTWu1ANSRSxHLGlkfsZU4kE3H/ptPmgNgVLNIljN/hgz2HTR3MPrchMzaESCtns75Aw+ACeX3Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786432843; c=relaxed/simple;
	bh=ELSWP/LCmlAJ6V8Ixl4FbFa1dksuv4fk3KIB6F4Xp8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PKT1cWpIKJEqTI9/06e6I/W2rE19uqKhkVSYdWoYb37YPgGDlPL6Y6Qn/laNkt7oHiwkDRKJ4GkgNZuptp29w/qq+i4wj/EzohNx5Chj0ei8g6rXB1t6+eONoHg4i0qbSZW4m1S1/NB1tF4/eP8bQJPB6DWbpFHNZjAweCTXdDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BROfoEkF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rotc/W/5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BROfoEkF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rotc/W/5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B75JAo2687969
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 07:20:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bFzyB6VISH0tii/qYJ6Oxsgbw5NSvam1B9Xihdt4yjo=; b=BROfoEkF4/NnP1tY
	s+bqslzXNAebJkvTSZot3aOoYdT4C1lX986TvcF7nOG44Dr3Trml3ctOHPLXXlnz
	H2Yi5EbMEatY6E+3/IHLT6JuCnT5UTshYrzE8X8EZ13u/EF2FXyx5+hup3rjX6i1
	ATprHoiXpyiDJbr0x6I6pdx/bPil6p/C41Qr+kq0eaKmc5g1EUTuV0pl8Cs5oCOq
	6ihU+HjC8DBdbuLlszqbRUk6ajn1d7Re8fIqeedogmrMA1KsPqJXBsAfpYFRSZVe
	Kjrr1AjsigLKNBsS01R1hcAFyXD2FybStFhl3sIYrjirs/IOv31adBpe/vWOP6/A
	ONK3dg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjjsjwwf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 07:20:40 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc5faecf01so10604085ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 00:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786432840; x=1787037640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bFzyB6VISH0tii/qYJ6Oxsgbw5NSvam1B9Xihdt4yjo=;
        b=Rotc/W/5XwlJlWY7TG5R7Zy3ijfWgISgMVffqw6jzYFGWX1X90ss/8noUCzaZh3LEk
         /5f2R7DPt6dD5uG4nXe4p0cF70/+InlQc0H91Mz0QNNGC3G0Fyg4lVC4DGUNILoCnbHh
         RFFktrtWxi+R8G/jwh6ZeyWRQSD4oxdCSKUyzw7H/a2thGSmAy1UFBB570/r2bwKXS3b
         FiV58S8njaNp5Nk8rY3PeYITeRSdTewthEwevcaGgeNFIs73Kl4+UZSgZAg+V88o89S6
         KPIKW3/ir3wPiob11QVd3deL1j4IAZGCwpCA/99TUw4XO6h275J3Cw86sWeiU0AYcJ6G
         yYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786432840; x=1787037640;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bFzyB6VISH0tii/qYJ6Oxsgbw5NSvam1B9Xihdt4yjo=;
        b=hJ2ld03wTME7yFlmjEVaiIp4fhRtFXgJBFByn6ker1ce8eRKJDv3JTcNClIuXASfX5
         j2WAnYnvV8TzeDXWauuoMyy22TPl8cmCVyx2So2jvW1TF5idIOIjzhoCrHZIz+rQsA6i
         Bz++OMm8VYinxFOkMWw/yOBOGbDPtiXH68mk0lKLxO7Df0lbTx8T0AariJ0yuab8PnrJ
         1uQfNdQwLNMVrXtT5UjtbEg1zDlw0f+51uUYi4m32R82nH0b8KDeJHmBD3PgEHMendR9
         KDyXMCWeDvsfTE4EBUQ0UMO3UFEOxT0sMIjtC4xKD9Y0fUtO5jHkVHYsqdquc+kekfX/
         U0qQ==
X-Gm-Message-State: AOJu0Yzwkm2SlEmbkrm3oX+0RuETTDcR6ozojCuOVMYaacOY30c2ZWCE
	fWKuIPLSV7ybOegMGgLrniHXFo59psGJjAZ2986m6/VDzREt/qIwqIiRqBipnkRCnCHmf7Es6Ab
	w18jS9y0vqnOW2SkdNeLED7dzYBpXl+GZtamY0mdX8I49jWTj/sPoq2nvkVFMMdmrZlnB
X-Gm-Gg: AR+sD11maMf7uRrLn+GHNBv1NtccTI1disyUIxtwCxWHfwjMZbW5O9fx94D3LQdta0b
	MOzlH4tU5zf4z3AZCi0D5h1p/M1ae6SLURLeuH/Q1y5jXxP0TUSGSwbW7Dr271iXC/LpwFVZRkL
	3XtqeLRSOb8AdTcIOPBJoG5bYbo+S2XVZlEMr59ctzwRohxRF2hMNF1D16YtOT49nLQsCR1xwDf
	9iKmfr/ovb7Jpg62i5xFhnAQWOfm6PtkYYSTdTL+THzmHi+/v4t2SL8Q/IegFz7KXvtiWHhuIeh
	XgoA6kfsoCNhgSGQflV08NMFuWSYmctrmHDxbnyte9WqIZHcpsCcHPBnO1RTwaFrXj669IXcgev
	b+STxwRGxw8P8cSCdewbTCTI3LweiWFCDYA==
X-Received: by 2002:a17:903:390f:b0:2c7:f4bd:91b5 with SMTP id d9443c01a7336-2d31760dc41mr19356395ad.0.1786432840246;
        Tue, 11 Aug 2026 00:20:40 -0700 (PDT)
X-Received: by 2002:a17:903:390f:b0:2c7:f4bd:91b5 with SMTP id d9443c01a7336-2d31760dc41mr19355685ad.0.1786432839710;
        Tue, 11 Aug 2026 00:20:39 -0700 (PDT)
Received: from [10.217.219.92] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3160d3f3dsm2984455ad.54.2026.08.11.00.20.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 00:20:38 -0700 (PDT)
Message-ID: <add2ce94-14e1-43e1-8307-33770435b392@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 12:50:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/15] soc: qcom: geni-se: allow selection on 32-bit ARM
 Qualcomm SoCs
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-1-5e0ede4a0c72@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260809-kuno-soc-support-v1-1-5e0ede4a0c72@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA1OSBTYWx0ZWRfX47qmdioNFyj7
 +zfK0gUWNGFy8NCraD1mYHOLMLapcZFoTPxtxsPmQpM5AJhVmyLRFEXN2G0tCUhpq0+ki1fr3s/
 tJrrWTutNYoHDlXBvbrEfyp6WLUh6Cg=
X-Proofpoint-GUID: yOY0f6OnW5IOTWF0CYpp9Irbe7D-D5pr
X-Proofpoint-ORIG-GUID: yOY0f6OnW5IOTWF0CYpp9Irbe7D-D5pr
X-Authority-Analysis: v=2.4 cv=cfDiaHDM c=1 sm=1 tr=0 ts=6a7acd48 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Ax5LA6XsPdTS7ErXUsIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA1OSBTYWx0ZWRfX28xiHiG5dEaS
 MP+SPA2oOUh7fW4/9qlc9S/4T8zHP3X37wBwrt56Yb/RuvT9fAWT8EbGusMFvxg8q16760Ch3/R
 LL23mRwJsHf0kBbUkMOWKr+VV34ChHJwREsVihwtLZ/E7MdRsh3S2sPVXmbj6/uOppAhI5Yaws5
 QwPATDPuFn2nHCcRQ+xL8id9JRIlbq0yFBBB1BVik5ah/R0NqnFeBPQcHg+qj4XuRLF/fkZKNJV
 FrnwxllOWLUaEqScI9X9RMZvs/pHCvN95e2hJ+SYGdyE84VAaF9v0gXsUV5rJaNhGtAsXLmCP/n
 lIARzJy1YBQOrfAph4UlQOYwdGAfjom9fnqm8GN9oaRUB5ogRKIpQIibWK3LvB27IhvpfNp1fId
 yUDr+OWYeiGoWvGEjiegxCiqxhw3Mc/5hZNX4PmFdL6Xpfd9PX7PS93r5sJQtxGy7C0Ta5tjH7f
 4VDnr7hd7q+sVBkqIxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110059



On 8/9/2026 12:57 PM, Hardeep Sharma wrote:
> Commit e10b198a94c6 ("soc: qcom: Restrict drivers per ARM/ARM64")
> tightened QCOM_GENI_SE's dependency to ARM64 || COMPILE_TEST on the
> assumption that no ARMv7 Qualcomm SoC uses the GENI Serial Engine
> hardware.
> 
> Kuno, a 32-bit ARM Cortex-A7 Qualcomm SoC, uses the GENI-based QUP
> wrapper for its debug UART, so this assumption no longer holds.
> 
> Fixes: e10b198a94c6 ("soc: qcom: Restrict drivers per ARM/ARM64")
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

Acked-by : Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
