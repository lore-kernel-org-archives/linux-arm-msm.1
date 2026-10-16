Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12B745C709
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 09:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141870; cv=none; b=mLErSKZAOZVROs0a7pDxsuiO0oJtBXLSktqFtN42ErKAp/+0tDSDwdlR6NPmwjHgrrkuvatKKV8M+fWuMdGbTSLnYerrEuTkjESWibTy5Cgn7OqsYZORKsDR5S/Sz09o4mnLDUccESLCBm3aHzmdk/+MXETo0KDGb/6qy/+IhFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141870; c=relaxed/simple;
	bh=ui6Bd43itbPmjDYfgjpB4sJYquNsVyCGU4xYMkeRH2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=geYNBppGophDXWbtxrE+ZRIXq3f82mlBZTGBhXdJsXL7YCg0iuRzJwFy+x/p1Aal+jnJQstP4afl8McLQPffoGTRVKxTE+21nSSX6MGx2hQoryHT0dEV9oRCBrecxieVADdmBU3ybly7yUTYBys8IsNMnzwK+TdJcXLx0WLlYes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mO1EusKO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ApVN/73g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mO1EusKO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ApVN/73g"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lfu71218651
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 09:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QIOZtlc4H5WdZ+JHF5mX59cxfjXnkubowR3t/yD78FI=; b=mO1EusKON6JQKbrg
	dwNjWV0Z0zHVec1VDd0Qwkn03nRBvGXbbG++qvBxjK1rGs/ZDAxT4bpQE8/EOOqB
	hefaSQyfs/qOWf+hNJ+mbdWf95Lo/lDzP8dVA+eXcmiBcqrhu7e3qRB8JC/9Vf9H
	m7XQM9iaqZc89S6tCLzyZRN2xL/p/BObKeTBi9m9D/lQXflPkx3W6xOZG/R6IjPI
	dz0m37f+Cey+mUWrh318vbQ1eTtLGjYK+CP4gNSSfzI584O6VD/LJlhQZUt3atnU
	7KwxR2FO5ui+Edo0JmrmppKNbhX+y0VmMLlipeZnG0hxWP964/DCJx6Za59R0wME
	1tVEhA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb5seagb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 09:11:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92eebb130dcso115878185a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 02:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792141867; x=1792746667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QIOZtlc4H5WdZ+JHF5mX59cxfjXnkubowR3t/yD78FI=;
        b=ApVN/73gGE6oqQP6YWv5XVIEzCk8Ofeo3H7/nQF+TtVWVGt5eDrX68n6ShIt9O9cPk
         9zFnqwm7hDd/IN14YJjBEBlBLuOTsYLcM3KTVLFeTSLvwuF9zJ8FGYRhGe/knFYKYxPa
         0KWQHaA8+rLNMDdJ1bnLWV4winTbKJy6vW8mTsW6T6vKHHSb7CHDsPtwzw8ZawJyvVSn
         45T7umiVBygVUUMqaG+TOpmz5GFKXzgBEX1WOomW69Vg2QTdTXxi/yS3wFplvS+ErEQY
         BzO1YCWZMrorx5yY122hrD7bvTbdx3rIFuVeptTZbjhtapjEGObUMRfxlS2lXom8ZC5C
         8K9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141867; x=1792746667;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QIOZtlc4H5WdZ+JHF5mX59cxfjXnkubowR3t/yD78FI=;
        b=BYVd/5dPqL6EQthMz7R9t353xjomk0r+ZpFRoBU600Y0ZElmI/tySgpmZxoU+oTgYG
         NQCrRKPFmlit4HhFprKIxEwzsLg5oWAlFN5WucZJQ81/1vKA0Ka0vKyJcFbWOEc1klHS
         Nkame6nMy2bcuCe9CAjHR187H8OorQsanbup525IOHglO1L+onT44WPvoqhsuUKYq/AF
         di6nyIiTUp0Lao6AwWxy4gXDYLySxXn1AkwScCQKQBshkeV0RX60g1LW3cDWU94R50Ex
         M8buABIXz0ngT+H4yMjuQfxGd8qs7ZHD6PBGNZu/o3cBZW2JmziRoLlBwXZE+YvWOPpD
         5rhA==
X-Gm-Message-State: AFq9FYLszrtf3LDjbKRX1kBsdaAxOyDgXIr0bj13/nx5zzWyKQykOBRr
	3VG3tuKOqmMDxL87HZ+/4N5exdcLJDLYERZ07rGL7AMpyiV9fnv7DeQz9QgnxHMHtzzVoOZHsvs
	C5an4q1sq9Eb3og2T9nAFH9qYfYOkFDImTMLujl+Fn2qZt988o0y1EnEx0B2jK6a+tzXW
X-Gm-Gg: AYBFou1TGzRRCSH5o9SbloYsHOmuws99jZWSnpOUs+CpcGH/zqW0mAGY+xHYYQNd+EB
	ophaOU0Rpe2k/jJ9RN2etZ790usgcAGL+zQjmf6N2ICzmbxjhx6hxUdfDzJb5p0HMDI/LO3wDyL
	V2+X/x8QWasxVEbLKD4fiDTOy+zkrhygAb+Tm2hdu/neS0WZNp4SlD6093x5+W9yV9K030/nu2Y
	zdBl7+n8aTCiulsmmIgDjlzu0vLy/W0WZJy57lLVFe5dl7w1cYzcbkAU1utmu1aJ8nG9rygXWIc
	uwnaioRSPokPeMDiPKYbHVVyvvvVC2zItVe52yRKmX0SDOdV6M3Yz5nbZdWBgy6dHzMFF3UWuZu
	E6ziQ+hbT4zvzT3UdT9K6IQ==
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr4105013185a.2.1792141867079;
        Fri, 16 Oct 2026 02:11:07 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr4105008985a.2.1792141866485;
        Fri, 16 Oct 2026 02:11:06 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb1c55sm54193766b.74.2026.10.16.02.11.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:11:05 -0700 (PDT)
Message-ID: <e7768d31-a6bf-4ac3-af30-9de313b16ccd@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:11:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: kaanapali: Add DisplayPort
 controller
To: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261015-kaanapali_dp-v2-0-c15cb83d9140@oss.qualcomm.com>
 <20261015-kaanapali_dp-v2-3-c15cb83d9140@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-kaanapali_dp-v2-3-c15cb83d9140@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNiBTYWx0ZWRfX4omtthBebtWR
 c8UXYx2G/8fIVfxyck6n4/OqnhBzny7QE8ythJmS8xkjxnIT9jpHGfbnccTCFZnjKFlB7O/xTF7
 AdZ6RD2j+NkBb/HpAaaDzXuR5fypdrQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNiBTYWx0ZWRfX53diJU+rEI19
 vurPP7N6xtIWTO2hIBWWkOU3C/UjhLbGupxII/b1gbmbllZzQm8vaYbbjfDqB1D6RVCyhXu5WNj
 dkajMulP/O7Qd1Cq0jxIXMMHIUL59yyziQVLT3bRwDuAjEEs/gHHvS7cal8EhzEst7Y7Ssnye4z
 FjgfksYPzDyKQ9HUeSWrKQJJKftdA+FprRU1sbozUHPUKaRhQg5Se23Gnj4GTIuWq6bVOmpPIBx
 Xymamd3qx5zG8GM2lB/3ss6nmSbUzCViMZnX/nq90rOXdljthwzPUbHoLwDn1c2f/+n/ReAeKuX
 f0wMu4Z4vlKDbQiMWdgQRZ1B7ekJuoqn46eJ9b930lZLu0jcUfwMOpzsJAb1iZr/ezWCDJANnN+
 XKjfWI1mP6ZWeeLTz2EtM5060fGUlsRsu9hu7ER9GB3ltPm4BryI/pj9TeNwCjquSkUi317+AaA
 F0CW8Fm9fi3bx3FxayA==
X-Authority-Analysis: v=2.4 cv=P4yvFSAu c=1 sm=1 tr=0 ts=6ad1ea2c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=dzNGixxSrynEd2cHrbYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: q4jkbNDL51Vb8-BFRJ1JuJtLe_8D20y1
X-Proofpoint-GUID: q4jkbNDL51Vb8-BFRJ1JuJtLe_8D20y1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160036

On 10/15/26 11:54 AM, Balaji Kalkonda wrote:
> Add the DisplayPort controller node, including its OPP table,
> controller clocks and power domain.

[...]

> +			mdss_dp0: displayport-controller@9ad2000 {
> +				compatible = "qcom,kaanapali-dp";
> +				reg = <0x0 0x09ad2000 0x0 0x10c>,

sz=0x200

> +				      <0x0 0x09ad2200 0x0 0xc8>,

sz=0x200

> +				      <0x0 0x09ad3000 0x0 0x78>,

sz=0xc00

> +				      <0x0 0x09ad4000 0x0 0xa0>,

sz=0x400

> +				      <0x0 0x09ad5000 0x0 0xa0>;

sz=0x400> +
> +				interrupts-extended = <&mdss 12>;
> +
> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
> +
> +				clock-names = "core_iface",

Stray \n above

Konrad
