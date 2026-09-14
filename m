Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7ADE3E4C90
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371585; cv=none; b=pJTxOQxdiPdSSrlZ38dwPivbazpE2uR5F0xAwphL91cDANgR5mR1k7p6vCC8gEyv3Gvj5XNmWaeEYLGA3O0u2YQJyn378VEllCjmDZ4gB6OM2+zhZniu9PWWzzTunQkGk3VWqiGXsa8wOIfNCTM7IFBEXOz/ZedQWD34X2PNfQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371585; c=relaxed/simple;
	bh=d9Vt4dMcdh3Bu0UXJeuPxUvHEGg0x7JCETPcRfr/3cE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SWnlf2mG6K/M0NFvG9VyVO+YIrRBeLCRw11ezghw4SA0jpv+ng/xVZSMIXkzwbeaD7w9gyyTVMfiIgg7R9nnfTqZmihC78RaxJsQsEzqpLAmHkWec6SZho+LDIBd/xNEtr6IFWZkuFkWflSlnI/nTQRxbUJYJ9l95IrGwzlN2t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l3AYNJjB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xgjuzfn8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l3AYNJjB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xgjuzfn8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5j2fO793892
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:39:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=o4YUYbLCdwb5dvgKREja2hbc
	wMVPztKBPHs0R7HUkU0=; b=l3AYNJjBjxe9EAwvgDb9YusYyrPLu6drm8Llr5x0
	Sh3OuyPJU3GWc+mARnItdnxAnOfADBZ6IEySO/kc95ZI4aWYFX6t6AgS+CZIa2DG
	Z3eafv9qHhpc4Iu5/nLysjIHyS2bnqUSrcZ3JrWt3JlqvpIq032Tuqz2aMDiYDOx
	5A3ZdN/Yl+WMsGFdiBRGImTEaULflNMVl/RHz1QjuWaFcHPr32xFakdyUhIU7yQF
	Ue3R7NQ0GxVu/NnmX/Ykil1B9b+4ODBb1avO1OhNbO7j9sSlvuzY8tUVwyAl04zo
	1QkXDRTVotVvcj3X0o/CxO3B3LvfD6IFs4xAC/mYqZiEoQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cnhbg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:39:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a0050a554so471175985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371582; x=1789976382; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o4YUYbLCdwb5dvgKREja2hbcwMVPztKBPHs0R7HUkU0=;
        b=Xgjuzfn8TDvKQ8arItUNipo+y0vD0hGVQMAqNK1zxKP5SqQDkLpYMwocds8p4iQgar
         uZecoZyYyJQG7hmzG/JmI3ckW8Up0e6edUDYHZD8KR2MOGlWp96bQAo6kTG4rIOmO8Ry
         GbP+Rbj2VpjAh0kVRIQpn4vFCgRD+wGWfBj0QSc0r5C1hU4RB0nhp609bX7T22xplgya
         2BZeB+ZJGpmatboOwvkN/BlECNCatJqCO+Jh+sufN0mKLTZ76PWtfRD4NXxy0oY6VLI9
         tgV1CI/a1RNPwjNrfKSFoXmeLT8RC1rk7yj8rq6irRec+8v6s0BI4KcArcICEm9Wims6
         iocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371582; x=1789976382;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o4YUYbLCdwb5dvgKREja2hbcwMVPztKBPHs0R7HUkU0=;
        b=hrzV6+0xe2utU/xeEsJ1rou5P0oVUWE3m5ADAuuPKnd32o7I4Md2YDLN/gTSU5HZl4
         71ZH5WdaZV7dcLpq/guchTl+2L39ahzqKcaQixmAdtx7jjiIppsoiav9ZIQqZrFrYhBM
         QZt9oNDwNLxO3UwiZl7F6LPtdDqV7gk//4ihUkgC2xpVWSZT1HYsFTj966q7ox5EJoyW
         arJlo8UwBVgEi3dRQaO5wdrW7QvW9V+ZRMUdQPDhHmyAqCLJ00lMKl/jaT2bAHhd1ndo
         EceFTYK3pKy35EhXoxcqvbLIm1YHL2CLoVOtcVGGMb2zARqZSzB33Hx7vTYFRnj0s5Nl
         XOlQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+qvYs5GuQ1dgTI7n1u1GxdTsbzDLlOi5X4akAi8C/jWKtZuEZVVtiznlrfQTZV2dWLIwSEB78k9PqZp5n@vger.kernel.org
X-Gm-Message-State: AFuF++n5G5ebarwbsJF22BVzZCZyC28aMdy7P6IQTxkjjfPY7cU29+Jy
	NMo+MAFXnXWe03uM0BYo7FED99vA8i6oYfQxShzPVyX9HS+idowZtBjax1yauk4yVHVLvRE+9vt
	gWUrmZe+VphL0jtS4PBZDrjMe3Fm3UoM/kVcTM5YrN7fHIOY8QEDDqdbdTQXWZOTXSY0b
X-Gm-Gg: AYBFou0yR3DHLBo7UPikwY3lPrZF85EMxTn6Kb+4S8zFq+xwCsNj0DVxEoL3I9IwqBK
	SS+ytK/7mVxCCeuovrrWSoVMKKsWyI4ZD//1xjMZ8yYcYpbc6agBhNtMAyeMKLDXlVGjtNszl+f
	wtJyQ/elaD0U3S6dhdjvoMOoFMgNaMokpnCXoZRuqXb790dWQEQGTNNnbnEyiISuUWRkXkYxyvW
	HwXOqkV7vXc2XJ5iJ/KIahJF/0KqZ5wP50Hlv+yUFF+1zQqFCqxXrNuc3GDPge7jSo7E44TYj0a
	K8AQkbIHTw0CgzIlLvPUf7VuzprU3Wt0pZU+kcXHpR1Gq7eQ+P2B5XiDgFcBNmR6sbPe9Oq8hx9
	gnsyJwtcQUknvFg==
X-Received: by 2002:a05:620a:1b93:b0:939:cb1a:2c5a with SMTP id af79cd13be357-93a299f539emr185964285a.31.1789371582007;
        Mon, 14 Sep 2026 00:39:42 -0700 (PDT)
X-Received: by 2002:a05:620a:1b93:b0:939:cb1a:2c5a with SMTP id af79cd13be357-93a299f539emr185960385a.31.1789371581363;
        Mon, 14 Sep 2026 00:39:41 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7548d99bsm130251565e9.1.2026.09.14.00.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:39:40 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:39:38 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 15/31] arm64: dts: qcom: sm8350: Add domain idle state
 names
Message-ID: <impp454jesz6unwipj25pg3i4nmtfftrm6f5ikavxfdfz2gyue@f4yqvtcy7333>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-15-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-15-660c31187819@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX6yNMxRT54+KC
 VhhhwEtEQhHWW4d37WQqfJkqUR/xStXMiOwU1JDOZu/2A3TKs0imFsz7Erqr6ZmVZECrFnHsqjI
 eerg76ILJVT8Vd2pZXEgll+/4Wld1KKzC+OCa4bKpJawQB+7mYxkR7WuSQxQMAMdoi561kpqK1/
 W1mfH/yoATUbECBFULHLIwDoeLBU9Lylic6n0qyvad1jSJhiQ2jCuGOCXfmZhZPAJCY0bOuEpcU
 eGirClsMZdzCNAv1J6gZSkoTtB7XTYbefgGU4PCWH3y6QpmJXXRe/Gks/b8Txn86MiXFbefUXz/
 JULOruHdr8aRAaWa952BVYxfbwtc+97U5XdJCJeldHtID0k8nSrDZx6m0Fx4VB3kd3loQEEp0rv
 AiVOEp8hDToWQEzpoKI7SQWZWg+YnS7qEwpxCdfwqSpix/GdRQ8tuY38hOnD+YTozjFreik8h+P
 ThicOXy30XiNi3Mfl+g==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa7a4bf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfXzGIOaRCJztL/
 wPo/Qy6mJlyW9+R8zdsSAxZu+QKYywZ3hv2l5IjzeJS6oiCZ39EwZ6632jblEuw8KbK72VmKXSE
 Vj0KZRTRG6hjrmQwn7x8mEHJ5f8+oSI=
X-Proofpoint-GUID: ypq2nWqwChdl_-AY4N4KmKqNUkP5phOd
X-Proofpoint-ORIG-GUID: ypq2nWqwChdl_-AY4N4KmKqNUkP5phOd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140108

On 26-09-14 12:29:47, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
