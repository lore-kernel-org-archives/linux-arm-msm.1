Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410A544BCB5
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388613; cv=none; b=kYZ214dGt34sTqG+5QMI7gwkGgto+od2zgIwOLSMF1kUjbvAPMADD/V4JGjVQVNB698r0nUBo6sspADmYvL457K3k46xHGoRFI/u0K/dzJpyo9dl0DlyXKke0+LpKWMbMuiy7oarOOGz+L8MCXaqWBxpqUiCwmHHvB8x07Alr9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388613; c=relaxed/simple;
	bh=iOVStLhKHnv6aiuKlx4Du16W2rIOp5ORNcollFu6OdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VR8H18HfeSliiLqepmSTtc5XnqFfxGTHFyta2og+Z+gnlRHyyg7fp2AeWFHgelnbpGHwPB80416qNGjDUHjKvFULEZ/3JA3gSuEeyHH5sP0KQsoty1sxxvUkblMhxfrnQvQL1Mtq2msGOpdAyyzUlknwHq9Kn3zm7Vaj8+S2knQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k8luz7dz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gyNkaqBy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k8luz7dz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gyNkaqBy"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm31A728468
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:23:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wUjOy3a9nW/DIDKF7jzbsGx03F+1F4Hb4J4J/5z3Kd4=; b=k8luz7dzD6dwUTcs
	j/JE20IsRC+l+Pkwz+QRkWJn8mWADNXfZ0RcHiwX/s+7JppEq1wLyCt5I9cZZTFZ
	6xbSjWht+leiTv3MIkGL2bj8q+UaT5OnnJfFKuWaCT6zZ2gx6yylRYe6xbZ/t/v9
	vqAmDdVDWgPRTLzpZMJeIIUMfTXoRy2EmUlrzbRyaSugRmf5noTM6Khyk0g/yYPO
	aW+eNMttJjaarc/NyGBaRE1yVTaXo7ImWnUPTs3d8FmnKyNdit9o9fBIaEPudNcy
	67GlsduIO8Vk4ZudAQ6/idtrth5GZJ8EdhqB11WaK+hO3g4RLsO9qwjsRFzd7X64
	dyh7Ag==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5ruwp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:23:30 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c65b0280a2so117430e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388610; x=1789993410; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wUjOy3a9nW/DIDKF7jzbsGx03F+1F4Hb4J4J/5z3Kd4=;
        b=gyNkaqBy0O1qWFzTKiMt52x69oVDokgXy0X30Nq+VF+nYygcML9XTf2eFAznynK+CR
         PKMapGPNzY7pbMtWGC3BYIUnU8LnME+m62NE4SWuGIEzEfLymQS3eJ3EeXW0+SU+GYCY
         wGiDCGvIBsxVTybaIlMuf64bffS2wCMMjYJKO5nZoGQIrPs7TL0nW7BOdzRdchXXLVrm
         D9SwdzBa3DaDu+xHHK4zIqWEMhTrQpMug7SA4Tu5nFDAsY+SqiEyWnORdS+6/rFyfY8t
         8HXtCKiMUw3hHZA08ZLdr74krck1JzfOWCJNqVjTUKfvPkWXa5X+ltCB0UNpuaNKIYd5
         g9Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388610; x=1789993410;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wUjOy3a9nW/DIDKF7jzbsGx03F+1F4Hb4J4J/5z3Kd4=;
        b=DExu3bpb6ZlyKIaD67s1VH4807GaercXXcXM8LIh3toopoAjqlLs1KKfBq+3K0waWj
         GoHclKRo8gOwWvlPWB5kSMlQJPbCA0NVR7/Wul1FcGxSdnOvqHHTO+9o8TrmdJJXZ9ER
         MIILTITitT1WVCnh3Sjo6wvW9cODiEKAQNt4Tg+8VEEIBAp002R6+yERRfnXxY+3RM3V
         NhDRW9WfTKZhjiqWrj9K3ySdo8orbFrrTCUlLATIap4aLLNgS4WcdV3KPER4bbng/Ngw
         KaD96W5JYncK31UdnYG1w+3cGp2dozxbUycFpeu3jEuh0rk2rdJAxDWHQ6DPsnBQdiid
         DvwA==
X-Gm-Message-State: AFuF++k8fTa5odbCr7n/QF7ujYL2+n32HcOAwfqj+VU+3K7SDuUNIz0a
	9qovBvIwYYAVwBneacWxCVeqxCC+vQM4KweIO3MSuvSnvrSzhUDW3r8giIKu3sw2A0qdicngb6c
	t8PyS+zTCKVMxF+lwchP/puUO6PYpUN3WNcQtKuihAfuYDKuc6lzvkAcULpiIxTCcV8+5
X-Gm-Gg: AYBFou1HzUhB9y/ExrBnhu74+5EAtHUMv18+DHuzV2V08PgWAQjNY+37+/vziU6uKXa
	qHyzeI+w+7pvTTU2Y9a1R/o36ax7Bt0n6rLOQWHvO7/h9AM3MwTAVD3xwAeHsy8+2i94O8leX1a
	UAH5Mg5iVh4JM9GOMWOWGZEPYcMSRDhY82+Ll+5CZkPgXWJeyKvOWxxLEECkr75krITCh5vOb4T
	Nvz8ANCBKMYY2zqsZA424fJ0kKa3FboaLu+hjKaQ11sK9DTriiJoEH5EpfMOfLnCq8jBjip0nQy
	g0F3ngE3KdNx9//cypg5465AIjF37CPFr1b5M2nzsw0kQX7SOgH8X7Ok7ag0dijuzzbvYHDbnEJ
	KQHgIkbSdxwldAb8M0vs5Hg==
X-Received: by 2002:a05:6102:50ab:b0:799:e864:aaba with SMTP id ada2fe7eead31-79b58b76fc7mr374719137.1.1789388610217;
        Mon, 14 Sep 2026 05:23:30 -0700 (PDT)
X-Received: by 2002:a05:6102:50ab:b0:799:e864:aaba with SMTP id ada2fe7eead31-79b58b76fc7mr374634137.1.1789388604938;
        Mon, 14 Sep 2026 05:23:24 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a3303fc9sm27798501fa.6.2026.09.14.05.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:23:24 -0700 (PDT)
Message-ID: <8a79c948-dbeb-4adf-affd-1fae64dbf736@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:23:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/31] arm64: dts: qcom: sdm845: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-6-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-6-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NCBTYWx0ZWRfX+PqpNmKMX7fl
 /H2yfwIt8yNJf9nBPuHOGmQkXU1TBLIjdhEddAMd5alG6EZl2az9TBBiAot96L863rjgulefeVC
 w0QnoeDq/uahnPK0moNiiouOAU0A3n4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NCBTYWx0ZWRfX2LtQn5fQjoSd
 9eyG6omhNy0pyloOgOxs/zfC6pFzlgfmw4QHXkovnTHRrV8Y1SasWZbHo27HQ8KXfa1gdJaB/1e
 jBFLA0kVkCDix4ix3vD0V9KNm6UUpiPhWSnZanLwi5rTs07RXqsijb8YkGUc/BbUYjX+K6B0P47
 O0/4NC9CEmIUBOZr7ToN/rkjdPmRxldDFMG5kDJS7pCNGh+GG14Z8tjBJ7QKqEHijGycZLv0xq0
 RXWHKj99BLIiA0LACifgSvOHOjcnjorLQDaYigC9X3znaEN+uPryTcjpDNuV9JePbc86SXdk1LA
 7QJVnFcGHBNmcAv/ULxEvkkLi6pFNuwsJdcoTB3R+UPxGH6b8KqWTNYjyRWGHobzZJG9Umw48h9
 UWKSUCmylgt2mvy6COXOdl1WDZdwl3a+AFiUhgLCwDxBV1QODgbPgbuXMREjbxWV72uYnVfl+vU
 f2YEY7YCvf+H2SRGUoA==
X-Proofpoint-GUID: HbKhhCNQ6HB4EAJs0wEH_WVtL89bQJRZ
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa7e742 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: HbKhhCNQ6HB4EAJs0wEH_WVtL89bQJRZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140174

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index b1f6782a3ad9..a5693bc72636 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -330,7 +330,7 @@ cpu_idle_states: idle-states {
>  
>  			little_cpu_sleep_0: cpu-sleep-0-0 {
>  				compatible = "arm,idle-state";
> -				idle-state-name = "little-rail-power-collapse";
> +				idle-state-name = "silver-pll-pc";

This patch makes it less informative than the current state

Konrad
