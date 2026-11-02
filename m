Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793586719;
	b=avnFJe/hCf0J/VzZUtFgVNtO4SFHyY1iheTSY5S7lNjKgPYZwvMG5L9MpMSislhn6kaE
	 P5ytmqyb+Sv/9yyCLumtUymEgV4WtfQ0GH/C6IeDBkwF9I5LaYbLctGXdchlpmd1VzDiE
	 dTihu3Tu7PJfI1YNDCft7NY0F/d6wnKrNYms7NoDPHNZPJOf01vn672af75ddirDC/wsF
	 Zk94zCSMPgW7KnNJZhQablE2p2vQ3LiCsE71HQhr20Gy5X5tO7urCbP9NQpwC5GdTpwnD
	 VtlRZjHltJpGKa8crqt507hqcXcTAJXeLekQFngwYRyhAggMIKrtlPLjzRD/sVUo3Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793586719;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ON33HfWPDSeusn2fBuQTwDOHkQdzOEPipmglvQYmFTg=;
	b=auaq4oG6n24ilH7qZ4UbHXQPGaRAmHTa8RBro0i8/zyLi0uPn/5raEKlNqPas+61d62o
	 Zg/k8BX32T/7J0ePinqsniX23S7HAJrbzK/cZjL0t7RGpSlXcJA6xYMhxob6//Aa4t4Xo
	 OIZHtm/k8Fr3p4h/QK9fDilozu8UFCn2MxhTu6nUo2wXhr4zW2HWGTaSByL0//aY2A/m/
	 uLlNDlCADSlPIc/fMJZ7QgmLT/rVrbLvgcGSQ3/tqemXvv5oJWjK6IW4p7MfvH3g8R9wb
	 CQkHf106imrw8nCZTGVYwGMHJvynBmyO1fPwsNODlv0L1KQvNUtI/i+D48PboCxhILw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A5kZ1bE9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UNhIOhdU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1DE606A324
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 02:31:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B1DE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A5kZ1bE9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UNhIOhdU
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A20KW8M2889328
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 02:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ON33HfWPDSeusn2fBuQTwDOH
	kQdzOEPipmglvQYmFTg=; b=A5kZ1bE9RodCEQBCSQF2L7ee8xvo5K9EKwKOx0ba
	EGTkdB960RyLZXXNsHPwCRfJSbBRfUlkkgXZQUBoDoHQvWnLpQW/obcorIY9T7le
	+zcY0cbbohByBiftlw4GbMm4QNOszsPVI9ml+x4Yv+YvUGkzRoWwowEgeiNwKPjH
	xoZ93fwyPfWMv3ZynDKPHvglyT94OaYeB6sn5APBe+RmKfPbZh8m5gQDZrSua97n
	1PgTbRMZOMnt++4SPuLpaRY/xD1NGmS0/XWf47HsCysFWu7EPfCyiYUe7pi/rnVp
	w/dB/9loTfd8Urrdaa4ZVnMZ4Qb0+R9jv0zuCihRlu4KiQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7wxmuqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 02:31:58 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1383723dfddso3572206c88.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 18:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793586717; x=1794191517; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ON33HfWPDSeusn2fBuQTwDOHkQdzOEPipmglvQYmFTg=;
        b=UNhIOhdUZQ46PJUQtSFVP0QxK4qFPDT7LqEXQAEyJSCzv2GwjUEHa6U7cDW6D3lAbF
         oiewoYprib1LKaHY6KlLd0dXyMqKzQALjIFj+y1lDQGXb8mrcfrWOSbCx/Dh0DgSBADJ
         xCX5CmI7IiaZwfM3NxGZsg7p4qLGEpnSAICwzRWnzBqYzkCRMPS4DUjgR2R9jVLU63Hw
         oTFv8vwGLK6Ds/9KmuP99jxUuvxQ868BTVOmEgT+lS75C5DMyKvS/9xVDgoL8Lc88knj
         +UIKVPHQcNcnqtspzpo70NeXtz9Uvh0N/qqkri14EHHoYVfEyPMpKIwSL9G0TNOynxxg
         JNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793586717; x=1794191517;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ON33HfWPDSeusn2fBuQTwDOHkQdzOEPipmglvQYmFTg=;
        b=CcMuBp2/NCpInA4DRHDpLFHsf9AlqCr0+LSpsZLQE5iK8V8a4LDvpvjF9SAcVUv2QE
         NFmByBWM8I+qKJBqc9rlxvUB2WwFvzHxkh21Z6pRBbCVL0qoo+yHrH6bjoOt51FIR2+s
         /Ner7+xmmuN5fl6ogrJPQQfgZAC0Mzo/rYU3XM1O+OWlYpM8jd7cCLNpwn5FQNPm3Pd3
         XCr9glEpwUKyt03mfRDverTz9V8BttgS1xJDcLgogYnxcZ9kTTK8DkR2u0nIn/jZMeXe
         OUcIB+unWxqcHq/lYImycX8SLbjIsY8+E2IdEjN9Uwgr+15Rep+KJBi8i81/3Tqxbc0q
         p4nw==
X-Forwarded-Encrypted: i=1; AKwUvBw5zbGWeJcsPvRpGWqM/m/yBDGqbgJLZGXCmh5DyS0msc8vI8LYdctRpSaqF1r/z5vzpnuwGFPWR25aT+ey@vger.kernel.org
X-Gm-Message-State: AFq9FYI4nmkG1kwpIH7TSMlnehEM/Ztfhrt97q25Ucd91bru2/tDCdd6
	8So5U36fFMjWUaa65W5ozC6A3rICMFebbfiqKsfxwVtqCPDMCydVeOA9pm3KpqkB0DsFI7mSnjz
	Ec3S/SPJRcdSGKDyd5H+UqcXQD5DaWChs+lgfoyCd7w6HIDO09pjo+wCUBLiHIWp/7L+W
X-Gm-Gg: AYBFou38umA/Ka0qxUmy9fovz4julPtblnScuqRv8INl8s0/Ik/XXC4SK+wev/9L6ZM
	dz6W9hBjUrMAjAk49QDIWrBkMfBP5TXfyFLFKE1t+ntYzamUT/+FPHN1ZcF9jTemwSrFr9iIRaV
	lDiyzga1X7yU81oICGmgUNuqlYEZn+AU8xPCUHVuUJ/Ptna1Few0DXDq/VuZoaerORUBiY96/yG
	/OCm+Ga8KRWvCTRDqSuSllkk6izfIYkG/6qTfJMW667gkDa/pSJQZnvG08Whi5IGvXmwZDJEZOy
	HeeYZOpI9vNdxBMk1mtrHcMMeezxDNRFUIFzU4sIB3w/eC1/kbw/RJ/iOE2T74ZrmUCVgFg9zCO
	gAyJMv906hYv1c1ZUzyL5JZW6yehR/scsLLVZyemUdMRxdPDXYnTLPmWRsUJpOi3/LBstbQwqy/
	LVGh9oqhdU1H6Y0w==
X-Received: by 2002:a05:701b:271a:b0:187:c940:21b7 with SMTP id a92af1059eb24-1ac5c55491bmr10957236c88.9.1793586716875;
        Sun, 01 Nov 2026 18:31:56 -0800 (PST)
X-Received: by 2002:a05:701b:271a:b0:187:c940:21b7 with SMTP id a92af1059eb24-1ac5c55491bmr10957199c88.9.1793586716340;
        Sun, 01 Nov 2026 18:31:56 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1aed79b3dfcsm26876256c88.12.2026.11.01.18.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 18:31:55 -0800 (PST)
Date: Mon, 2 Nov 2026 10:31:48 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3 5/6] dt-bindings: arm: qcom: add SA8255p Ride board
Message-ID: <auf2FHHbto8lAf47@QCOM-aGQu4IUr3Y>
References: <20261031131042.1200862-1-shengchao.guo@oss.qualcomm.com>
 <20261031131042.1200862-6-shengchao.guo@oss.qualcomm.com>
 <e5b53ac2-87f4-45cd-9667-91cbb45fbcb0@kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5b53ac2-87f4-45cd-9667-91cbb45fbcb0@kernel.org>
X-Proofpoint-GUID: k8lugXs1A2cZBNlbr7xV215rG9TkC1d4
X-Proofpoint-ORIG-GUID: k8lugXs1A2cZBNlbr7xV215rG9TkC1d4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAwOSBTYWx0ZWRfX5EUz0R5mr8cm
 saCvN9wdXOSNctD7z18X01IumhQlVf7Vhi52Fo39u4eovW40Nfoxhrv0rssjqtYdgcnWDgVefZG
 qrJwM+5JNKf0naLN2L9Dg1vWIEbhMNg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAwOSBTYWx0ZWRfX8c7K0yRM4Twu
 ucIuVLDZQJBQV4nbr1oNv1k9GYyv2ym2aybpFkm6D3HMcHmPtErbY+TjSJuniex5b2/7q4XK9vX
 FjYiECi8N7B1omR8CFFxLzyuQXsSqb/LMu2WabSGV2mSO4tLxKdirbYxmafgUNbcpL9GPn+UvFr
 o73R1i1xB+PENfjju/W+GrDgusC9wv9AfpofUKBWUwKQ3yiBQ9993YiHgN+Jh2WfXT7NTFctjXu
 v6oh27gvPdWvEHAEq7J8OXpXY2cHvg80cHKkvNXIKFILVHKhr6Sc39YKfwaKW8nvAA6EohV6xWI
 ErS7dg6JB0SpZiUmiOw6TGvJg/dk+e2KdQMHettqFXGE4mEpe/CzhFbwrtw0C/0WFLc7Aj+rPrI
 qt7X3DY7+afln12U8MTc63WI51x0w3AyTVI3A/FDPu7JYQcCK7PERsyRnrsSSjjCRwk61+FYuDB
 DiWSG2/rvyoReBaot0w==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6ae7f61e cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=eYKOoy56NPTa7UcXW_kA:9
 a=CjuIK1q_8ugA:10 a=Fk4IpSoW4aLDllm1B1p-:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020009

On Sun, Nov 01, 2026 at 09:28:41PM +0100, Krzysztof Kozlowski wrote:
> On 31/10/2026 14:10, Shawn Guo wrote:
> > From: Nikunj Kela <quic_nkela@quicinc.com>
> > 
> > Document the SA8255p SoC and its reference board: sa8255p-ride.
> > 
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> > Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Drop. Binding cannot be tested other than build process.

Ok, will do. I thought dt_binding_check could be part of the test.

Shawn
