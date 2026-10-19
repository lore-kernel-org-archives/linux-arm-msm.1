Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039A7526094
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421492; cv=none; b=ZXjbyOiO4BF/d0WGyQb0M/MeIvUzKawBsX8GVXA6p+9TEM1nDrcQ7ZO1UWxJAvl60LxQV0+/5mJFm8u1/uWHa4eb09gGgAYjF7Bd7ONPUtAE+S48WY/e2/AaTL7YekWAC5jbawY/RaVckhNwNda+uckaveE1EaRxcFQZrU279wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421492; c=relaxed/simple;
	bh=zvVlRGPfV18YCPCiwYSoInnOl8u2eP57S5CcXqMx7/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U18y+d/gPIEbRsqIJUo+jvWFiEceSDVuxgcUpkzdOBGRNwhs4gOh5n3LhiJANkI/8lej2lMy2anrTxolLqATE3EnKgVMa3kJ2+M7jVFEyWQGYCiFp+rXPgZGMHyVgq/ppqFxAYs7Cy1fLrc46U/fsrVwE0oRK4hD1EfMNNcRdxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hPhx03yE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RS/popTU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hPhx03yE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RS/popTU"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0dsR2081650
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w7M0iJEy9hTraQhyfaGjwba1FzFb0/2NEss+BKOE7Ok=; b=hPhx03yEApUtS2Cr
	G/mnu/lPHF8i7R5Xbh2U5J5RZyxLTdfI3aSP/kgAhP6l9orDBuTvcv94G8GyFQ1a
	lIduw304YqkY0Di5O58pQ9+hgU0fkY7kJWGti+yvui94zphx/B4AoO5/4F+Y/XKa
	DkTC9ZiIX7VMWKFTH1fkjDAgvklQqz8N3HOkDg73nAFOJSLZhdY42bDIHSryHwKl
	5al8zVCFVssTXigjEO5Gx389G9Dz03w+2TTlpcec0bnnMoBLPfKsALuYIPqnWXIh
	16B+vGNJWo03AxL8/ENT8e2+KpIl3tU6YjzL6JHNzGl/5Ck9VI4URkFmWWDarHGw
	2MZcqA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf4rhq80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:51:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-536540909e5so2990481cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 07:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421489; x=1793026289; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w7M0iJEy9hTraQhyfaGjwba1FzFb0/2NEss+BKOE7Ok=;
        b=RS/popTUkCJwd216WSikbLfc98gazCniIfFPlIdwCSHk4Z95jdrch9J1YgXHDkjjxd
         TYGQuAD0Ks+lKwN723TimLzi9kwVr1pITqS4e5sX5kL8bZgNSccwPx6RZ60TwIkecheb
         s+ehG4usR1XSqPPRURyrBbjI94GxZqzLUspNzUvJUrA1tLjTzELS5j3mv+Q4sOa/b2wz
         tysiXUUD/EytXznoq/qRtKfJQRXL8bb34xCRfJ4XzaPFiXM13tDSo/0H2i5o3RjA2el9
         gV/vbXAUOwH+o2NTk/40sNczRz8mnpTq7/Zug1AsTnMY9xjGx5l+Zj1bGBO3mlr9j3kL
         EyGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421489; x=1793026289;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w7M0iJEy9hTraQhyfaGjwba1FzFb0/2NEss+BKOE7Ok=;
        b=d3uGIDXUVv2x8k5Hs97MDa4Eb5lRoPRuazfvGgiSXohXVBMw6GvQYhBmyGRCyUbtGL
         r6GanAiblbJlVWV48gNOhbHFDBRXPGYIiJ3aw0+/WfiuRuXI6vdLcpM69tVFA22w8X7V
         6jhlZJHhh7ClPsWnKZHJkgFR2/Bh3TU7ruhAvwJHXpOv7JeHD+RNjaR397rdMqinH7xe
         KsV2FFolQnUilBTYUDpLTcBdQy6jhNxuzCxc/jk+lAoKc9VKEBRMdJQtsPxCzOrK/n+9
         9AviP4mBEzFMjFUoPmZsJGwLjItmCpKuF3QpxNEvpUzSUPO///Cu/MuHze58Dp8bUSQl
         bRCQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2K3oxARY7ftCbS/0M2vwcyuAwyJ5C6cOJv8DaQ21I5bpesyrKklNaCY9Y8rf5tncC9xaZtksqXQ3gttUF@vger.kernel.org
X-Gm-Message-State: AFq9FYIwlYpLxWywOieZfOxdXx/7ckbwocGFSXmWHg4a3e5ao8IfOIK8
	1QqcdPyoK9kRzfhbRh4y5ICGcSVWKDiuV/c5qoKweuCUqUb4JE9767fdyBQaNYXYdaXxrA2uKxp
	zX3mKqeSgbQVDrh+h1mVlfS7xtm0c3qz0GR0t50wM8ZLFyxc2TNnn8TYFPG/BdtesDAbX
X-Gm-Gg: AYBFou2kr2eX9/brZGJKFBToRajkhAo3tg2DWuXUNz5kUFT1b/RkOcBcLNiXgS8tGGT
	uT6+60FyrmRQexlXcJOE5ePzPCIFAyvXMB/4MCGqtCLe939AAZoL/PxYn4hyRxtcajdodkzlx9W
	OY+N9IvPTrOFGiNJHSRFH60mIHTy6ydvg9l12Bd6h55eluZjl+DF7Ab5hFYzDHYm2rZsTDNYDSh
	wxRkAWgGGZQEbyECrVd3rYtNgdi+D4jyVg1BZmtd46PF+hLN4pLbe4YbdMJilJsF0vNyVQl9vUV
	2ob93D7VRTVvEfHZivdf/am3xyww1bLoIX7wtG00Gbs5fzqz3d4tDGdzP6ItL1kEYgNgbbsMkR1
	j1a9WR3ik51ZTxzvNzr9YJA==
X-Received: by 2002:a05:620a:a99a:20b0:93f:43a4:a48f with SMTP id af79cd13be357-93f43a4a566mr197678585a.5.1792421489237;
        Mon, 19 Oct 2026 07:51:29 -0700 (PDT)
X-Received: by 2002:a05:620a:a99a:20b0:93f:43a4:a48f with SMTP id af79cd13be357-93f43a4a566mr197672985a.5.1792421488554;
        Mon, 19 Oct 2026 07:51:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32c075sm380856366b.11.2026.10.19.07.51.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:51:27 -0700 (PDT)
Message-ID: <43a57f69-caa2-4943-90a5-729e0f378b21@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:51:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/12] arm64: dts: qcom: hamoa-pmic: Enable BCL sensor
 node
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-3-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-3-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MJGjetMufD74m4b0_cKgg1ZlZsMipwXz
X-Proofpoint-GUID: MJGjetMufD74m4b0_cKgg1ZlZsMipwXz
X-Authority-Analysis: v=2.4 cv=H7NOUOYi c=1 sm=1 tr=0 ts=6ad62e72 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=-LKvvtDxBJcjZvG-X40A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfXyfyZdWnTGmeY
 jsZK3jvSdWoLhbxeXlkAqLIjqAT7VJWwQ8aKTWEXv75vWK21KUnb/p13EugRq3YLGEdwGIZsDju
 sE+go89ebCuSTTjwbsNMFGH7inxow9lZirHMurWgnYNPErypmZSAyFJC0Bi6DXf5gFPS68A+c2O
 9ZKhur2+UwcgLj98wdGQ5QSnLqEOWp73wJSoZCWbNuBeHZKjLil/25IZdZuxAN0ycvh61deRy4+
 EsDSw7cQecvExiJTtwWsGVlTnYtnKAQ3ZrBH2Fy1hCS/U4Hk8AWSyH4GjoVtyJETBg4OGgwkPu0
 K6rxsib+FQE+WrEJVgkNUPEdfitFFRu4Dwz8VYUzwPFb2tGHxAoema15jQCUXI6tY7y9ulPWdkl
 twRzonMF0Ey6ZiPhTdSyAAjVfJ9Y9H25HcZUOS99KUxUvVJZrNrB26F3063uXNozxWYTUrVxKQ1
 LeJAXgnFAWhbFsfwgrQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX5dzvcpXDt7sA
 vC3Pj16i0ykSmYr4u6Xw/ZH8S1a+h9dObAt0e4kOUeItwZTosIa9OlZ4ahpxZ7Ce17TOJlWh9EV
 4hU8cwiRjKfApwf9j37sEbomJUOUVps=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190059

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for
> hamoa-pmic. The BCL monitors battery voltage and current, providing
> hardware interrupts when configurable thresholds are violated.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

[...]

> @@ -674,6 +685,17 @@ smb2360_0: pmic@7 {
>  
>  		status = "disabled";
>  
> +		sensor@4700 {

Is it not there on the 4 other SMB2360s?

Konrad

> +			compatible = "qcom,smb2360-bcl";
> +			reg = <0x4700>;
> +			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
> +				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
> +				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "max-min",
> +					  "critical",
> +					  "emergency";
> +		};
> +
>  		smb2360_0_eusb2_repeater: phy@fd00 {
>  			compatible = "qcom,smb2360-eusb2-repeater";
>  			reg = <0xfd00>;
> 
