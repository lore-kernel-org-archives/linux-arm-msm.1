Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C2F47D463
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 13:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788269028; cv=none; b=kjC/9VggthvenJmh2qB9fSQxSU/9Qw/XR6nEcVArmnzosewdf6vyifswsCtyRlL7cpgUpcGYg/Va378iXMnA7BpQpnxP2oiIVjWhQ+2NTY/LfEzvChtjrfpurCKXkCIztAJqUpJsFsuhpDokw6Pv9ciK+WPqnOSLIQGQuJegE1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788269028; c=relaxed/simple;
	bh=9x7lniN5GJAsFMj3P0W9gPl/pKxdQN/5KAvPk77QBL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lqhW1k23z1tUXhPgJm+mJEXwx2SxvlUIEMCbIt3ikLPAGpjwuwT8KWl+iK7JLbA0QOQJP8lp7v7y/fPMLJHxkZRx/3aJ5LpJvBISkxeiQJ58pzkhK8fOkCGEsnJvn3DKVy6HzX0q+nOD5HgpcCQUeliexdDeqB/L7V88JJfTSco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pbr/RJJq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=es5s9zuA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pbr/RJJq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="es5s9zuA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJJWJ1136750
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 13:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XQHYSREK4hwFbTXr21RMHwdL+GeLgmeBuXTfbYEFYps=; b=Pbr/RJJq46Fs4uv8
	6C+/IiYh4GJgR6NVvP2PYk0A7Uq/ZqBwAz44c3DPn7jF9qmrLmupNkOBX4yOQcA9
	cHsSrUFsL4q8s+x7vtqkn0RHoogJ+QtSIY2IEdR2D7+gk3YTGvqUMgJhMP17A/O/
	8nfytJFWC56TBiJCBdjdC4ky4tvKLUirPpVa2eAOzjwmvP3trHOTchO0mBGg4DFJ
	uviKfsICRGHSxHz0wmrSvg5j93ma8TKTAu/lpUbDW6U7bBnSgZp0oZ54qORny9Wx
	sCcJn0ryz/4NyNHxK3Bl5UzmSEotWp0EgYU4wkX8MrHgn0Grmu3Kx7nHnXcNpOwS
	eAnxhg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcsj1rw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 13:23:46 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7530aaa7212so100276137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 06:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788269025; x=1788873825; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XQHYSREK4hwFbTXr21RMHwdL+GeLgmeBuXTfbYEFYps=;
        b=es5s9zuAb9IPW/taakezLbDPEiwNfcoYtw/LJZGzXmxAyNyG80HQbgq41RTW9Cb0WV
         TxtDc40O5gLUMcm21CTODqsCKU9LCBOH0zuwd4D1CLcfVwo9hHZsBj6V0vylbMrlA1gb
         eKJ+5F1zCH7NPYzLWu7cn7T+McjblF7Ghh03ugxBVQqtC5Q6pCuAooNEbSVxPYgBkw2H
         Wqd8+zBlw4ttPCmG9PDFm6QXUTLC0+rpbOhfq+/NvrHzM6esLOlnMklRAFdixVdaZf49
         gy38Z7UKmEDzgo0mn9Bl0Z4e5l19tUU9RpatvjfWl/bfBjrKinI+cpSNuUF2JHvUlbQ+
         d8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788269025; x=1788873825;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XQHYSREK4hwFbTXr21RMHwdL+GeLgmeBuXTfbYEFYps=;
        b=HGorwkobpWLmTJpP6PI59SPbxT4tcguwRN30hyqJUHhonjxD+nj8QGgSnvkkDGnaJD
         rH/aH4M+XWZsjf+oN4u8xSSBMzuVxV2/h35CDjYRDRiuXomIlBi2dDfs/mRSuExk8cl7
         562ujYmF2FxzQGM/CnwWJp10LVFmSV/YRpw7viFa3B+mlRpoQj31vlEmhV6J8uNpXGID
         CevMtv8I/ryfR/1YoKY/cN+Z/2cb5G/17D+tE9AFuKTRSBSgbN0rt0hrNm3gQ3Y4iOxm
         X5xNBURNu2lRIIgwfl7ddj0h8izpfRF/Qx52giag5Tb8k53dDYUUpg9luB8iUTRuCZIz
         tGtQ==
X-Gm-Message-State: AFuF++nb5AbAvyakIJ9NQ9Y/Pc9T3C1AwZpvgX4uNGk86GrEwDaFo0S3
	xNSCfRBew9E/WRRYIiuggb1KJTRznIjzGU1xOoPta65dg4YpObd8jMT8sgOrbEAKI0oHPFFScXU
	3DpHD35XLMBlb2EyR1QLKk/7cIn07fj9/O9EHuXLytdDMl0DqRVlWyzeBXTwh+v3iTgNu
X-Gm-Gg: AR+sD11pSXhVnVDGZd54hhfwbTXpMV2AB0HU4u+La024ZDm2po5/jdYH7pXYtlgmq12
	ekM1O2C1/pxHfX7rIjpoEcpkDOX3yRhD54dr4uMvyNa1UHDWIq0APVGbYOaQa4ZbReoOTEAYao2
	/4ViJkK8LdZY8pYcDFIQaQyw6Az5XDwiKhvit7wP0J/HGY7p1ukwFyaT0FIqf2rlF3kUb9RSwZB
	8M8mftkCLELM4Lzi//fmzO+wZxDgsxEOPY9LIovaekrIHx+p/rEl4iXFEKTNVObm/PdGaQCMvkz
	B58py9+Q5Ueq3GU3omtR7pLGobkIMM4KdN4bShNBLvrYimVU2z7Rblhzjl/taC5jhsqx5eOZAcI
	9Z+lUqddM0XWVxos9cG4zeQ==
X-Received: by 2002:a67:f091:0:b0:789:3f43:6458 with SMTP id ada2fe7eead31-7893f436636mr1692819137.0.1788269025068;
        Tue, 01 Sep 2026 06:23:45 -0700 (PDT)
X-Received: by 2002:a67:f091:0:b0:789:3f43:6458 with SMTP id ada2fe7eead31-7893f436636mr1692794137.0.1788269024570;
        Tue, 01 Sep 2026 06:23:44 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e89ce877sm2884326e87.20.2026.09.01.06.23.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 06:23:43 -0700 (PDT)
Message-ID: <e51660f7-5913-4a1c-b15b-0ab0fd600e61@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 15:23:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/12] arm64: dts: qcom: ipq5018: Add clocks required
 for USB3 support
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <praveenkumar.i@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
 <20260825-ipq5018-usb3-v3-10-39be0955a6aa@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-ipq5018-usb3-v3-10-39be0955a6aa@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfX5ceaLGPuiDJa
 AJFdvSzUJ4cMBZs+zHcBHvmC1EB59yqgCJi0SamCXxVjTPYmoUrOH5JJT9u7FVpZ59nQeIOhJ16
 z42ive1IW5SuispAoGIyQDZr1z7TjpM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfX+5LbRJkZdmll
 Zkt28LoOXDbGSVXJOwitI1zDQs7u/LCsmdhf6kAH+X48xf9WCfsxz/j+PDR4FcYRGWPqDKCoRqD
 LGBX0ipTrtrb5lWGK4hoEVFmnHwRBJM3p+vg5kaHVymWvSfuVckso5jlR/nCzoDbyLfsJ+K4CwR
 yMpMF2iiaEDjV4Y0k8IHhZ2RSmzGpQ6lmP2MvoYZawACgw9mjtp1y2hsCHY7Fp6yIgl4OwEqje1
 Tq9HuNccJiOF1ZYJYKxdBbL9JnQseq3/4HPlMDvAqeowmmVs5xcsTj40frM9YjfZ4dNdX0E5xtB
 r3bY42kjoAZbUDCg5E3aBTtB8fpncs8pgrUKA3y2P9yXaJzUQL3/SPQqjdEeOjZ8sx5GQMtK/Jw
 Tp2X6UIVgZ3LxPhi+rcT/0LbtkEEUycF1i6W8S21rOzjrI2juGAUcufrhMo/6Sf/7OxB6j7QyFA
 vYn0NQkxXZIi5GDPewQ==
X-Proofpoint-GUID: Wp81ESACgYVycdp-83ri2bVhWTaNTIv1
X-Proofpoint-ORIG-GUID: Wp81ESACgYVycdp-83ri2bVhWTaNTIv1
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a96d1e2 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=6stDa1oDzhWvrrRwHtwA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010117

On 8/25/26 2:37 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add aux and lfps clocks to USB controller node for Super-Speed support.
> These clocks are required for USB3 mode only and are not needed for USB2
> mode.
> 
> In addition, set UTMI clock frequency to ensure it's parented correctly
> and override the clock rate potentially set by the bootloader.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
