Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E80446BF8
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 14:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786457347; cv=none; b=KuYUWbpOD1GYGCz32Csyy7NKD3oO4BNwsqxqXG/IuE56gNxfvnJXp23a8rjIhP9xGcY9LDehS8r28zAq+9pf9jpLaGyGTMKN28+yHniAmPeKgxNydluw4/NfzJpsoB7W66Qd7IDLaYYPZGHBo5b4QXc/1Z+w0eNe1kSKD7kEBjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786457347; c=relaxed/simple;
	bh=+Tkm6xyqPIAM94Y9fls4QttSRxVs1kEohQrzLAOcU/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VuSS29BUQIRiB2ap88w5YJFVHfLLTfvIwIlqTMYahOvGP8dFeNftfmyI99WNRDdrGxQBrVqh5oG0CQ9sWClbjqpKdMGI/QIRrLdX0/S61IcmDuVnVhVkfXXKX/1Ay7O9LtCtmKBNq7CgeCv0UYndFFDCmCK0mhN7P5n16ffz0Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tl8k4JKt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kUC9zoOw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tl8k4JKt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kUC9zoOw"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWZdc010857
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 14:09:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YQ5sLUtEGdSUDuIMVQFtA5aC
	Da2Hzsxmztm/DUAhaGc=; b=Tl8k4JKtb0UJkTWKujhivPelS+34TUXdz4mI7IZK
	nIW/0uZW4IfkMfnDEsb4BGuNDGzNVtKoC83kzgggO/kvr90VFWDk5ZeIBlrHrHij
	yVnwlRFQb+p5Hg68HWUThEG4lyEdYzfIJZHnCmd4j3jmbX2Nd3aFC5v7+rCz4rbn
	lozy69sgXVOepJ/y2C0gLTNc5hXwuWmSE8UxqsUco33XQEG1++kqmY33T/Z2F5m5
	J2zaPqo0vgCXzEqY3Jjyf+QhUqCKn5vh/2N1jzpG60grHLxOlY0ynJAkJvbqXe94
	xt5gXNUrN5nV9tjv78ua0Caq6a6LXi+t6shlIU/l7uwSUQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049g09y9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 14:09:05 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90284139cceso10485886d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 07:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786457345; x=1787062145; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YQ5sLUtEGdSUDuIMVQFtA5aCDa2Hzsxmztm/DUAhaGc=;
        b=kUC9zoOwgsLPioSorQ+GlYad7mE6NgqWsHQu7ISoFMcVRsrdW5N6A50slxlmlUblIY
         8TuhsclqDWkI/pWg+Y1/z4C1wzYzQ7eUOwur3wK2TO2/btg/KgCWC8Ldc08rGZNpC6QI
         iHHjb1fwmp+6Yfd3MLnTL/w7VBMynIOVXco8a/U3Ak6nryq867/YVRGEJODJnDXhmynC
         eI+jcI+Jsg3VHEZj7tUAU6jSAQgkr3hRj8WsaL+FPuTfnQpfkrw/1To+6osOZSBuoN85
         E8FRoo6myDPqZ0vARBbMH/RV7o/ThAuIRZg/kWhbLol/0TPvxQG1XcdzbW4ibdkKgpCC
         pgzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786457345; x=1787062145;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YQ5sLUtEGdSUDuIMVQFtA5aCDa2Hzsxmztm/DUAhaGc=;
        b=c0tYmtd9Otwf+4GWZZ0yivl/XIh9qB6Ceb0jf7UNelXypDEyaIXry4JjV/0/FRHeeL
         82SuDNKyLOrtknEkGmid5RwWu32k/ZROnQJZHr0nRZ2B02VRZnzwKY0nyCxwYDlow/Mw
         0CkY8QMI89ClxEkkhX3zVseFyph+RiNq9bUZWWb2ctsxAiPzCgZ09ZyB75iQsrzVqgOt
         RuWw0OnuYRfEAMhucmyiRKtmgWm7Yo7C0JaOSbdgPv11YUS0sZs3Mq7pi63it3qCcu+0
         TW22/KMlgicjnyp2OA8ZcBHzGL4NPljhj+NgAEqckspZiGpUAByqYtnWsY9Af44qJh0f
         19bw==
X-Forwarded-Encrypted: i=1; AHgh+RrD9ozzTmvP1tS/wdUqCKDkWm959VisJ7UB4IuNYcm2vW+DUznxbDUOuFT/cZl6vx0fhALzSsaEFFmuXfi5@vger.kernel.org
X-Gm-Message-State: AOJu0YwfgIkMVYNEG63jl2klKYPH4PQMBlgCsXld/CU1kyhE21QYttmY
	YGdRH+qXz9vXZvBcdQDnhiydLQRsNoQgFfB3KH003GtHmxBACBYQusIm97k9xLWQjnViCEiukjz
	Tt/PWCVStuudMsdL/nMs27+XDhnwKvpHvzRgnYOLINf0+vkZPmRcnomrWnlDkkrmUGyq1
X-Gm-Gg: AR+sD10UNaZKF6EBDYpfAAzbH15ZdG9dFVVKNGq+HFtT363dD+Dr03k6BbwJSpq2NFq
	Rn62XjSx/x6+ZVZ3alN6YJeNyt99Miy3gEonrGtcylqr0TqK/2qLWC2uX4Y5UKR6yejL0hR0aw5
	QCS0aEIMmJP+AIgUI/J3WvEC0drRFD9pHIqZ5Uy52gVHjcf1B++1LXYEJxlfLOqfNv5BClaBxc+
	l0NeWPCFMNs3gORC1hMexwH6wNlX60kX1LIYcAhvhLpbE6g7Ogwmx9A3iKi/tL6knIkIEk8ZjvM
	9AdSloIv18UVTuy4lLhxkSQ4Rdz11/XS6M6WkhBf56TEuFazXIfNocKg/400ugQ5SYOG0UyCRjr
	inCLgcC5Buqt+ay7cqn0WPnNwlAd/UTV/6MHdoDmLvYcsGTSXrx7dbU14uN1/tB3cSNwMIzxWeJ
	uHlngr5UxzX/h4vA==
X-Received: by 2002:ac8:7f0b:0:b0:527:7756:3ee9 with SMTP id d75a77b69052e-52d60051c2dmr5617461cf.0.1786457344457;
        Tue, 11 Aug 2026 07:09:04 -0700 (PDT)
X-Received: by 2002:ac8:7f0b:0:b0:527:7756:3ee9 with SMTP id d75a77b69052e-52d60051c2dmr5616501cf.0.1786457343967;
        Tue, 11 Aug 2026 07:09:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a0fa6e0cb9sm3037801fa.39.2026.08.11.07.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 07:09:02 -0700 (PDT)
Date: Tue, 11 Aug 2026 17:09:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pmdomain: qcom: rpmhpd: Add missing MXC and MMCX power
 domains for Eliza
Message-ID: <wcmnmidvbgfr2zmkb7vs7rhrwrxutca3lbfd2xb4llzfqqv7w6@bzddrstbb2xd>
References: <20260810-pmdomain-add-missing-mxc-mmcx-on-eliza-v1-1-5e10fad1e456@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810-pmdomain-add-missing-mxc-mmcx-on-eliza-v1-1-5e10fad1e456@oss.qualcomm.com>
X-Proofpoint-GUID: fC4xxkez_i3EjGA-8KDmCuPjBv8bx0jn
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExOCBTYWx0ZWRfX+i/o6DYvgofi
 V7k3XDTqP2D5kfQF7EAL2SshiPARSoxks+amIdkhr+HIN+R5/JlvJbQMjBf88LgjEBMi3cWXYxp
 hPxQec5iIMHSvsAck4O+PlRqiBet1Cw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExOCBTYWx0ZWRfX3Z7UWHpeIfPN
 8kLy4plYxsTG8kAmeu1tQIpTgm2Gyo3k+W6J5jUqP9sxBVzoxTp9z7poSe9lDSdp9WJcLcYVnSX
 bBPo3n4bXQa6mX7uK7tyJ6nsl3MMgSQT4W9SiUNAXwJAC1z6i98GsTaoNODDlLQJDg1IWNDAdNP
 DiTl9Mu+Fq1hxn75Fso2mn1RIwyHUhFkUdeigrZPzmsM7gKPF7sAxGbDnA3tsCc6qfHRvmuH8Cl
 N5Cw5PqRJ4Xlm8yGso+JOtYYTAFv3ZvtyJURsMoNDKW76ATCgUUijKqIm+Leyw4VM9mkOkkNw4a
 +CME6Z+erykG1EHb7JxsS4qoyjjnE+Q1AZltpEhZwVbfe7m3yO5rrng7sX9YH0BE70ZrzOiCIeN
 IbwwkD5t6/IbennxkSh4rYSydAf/ihczO2TsBpoIr8yXMDlfHv26eQbZrYg0nh+2pJCMAiPWCcy
 ZS5g78tvNJ/Hzeu1GPg==
X-Proofpoint-ORIG-GUID: fC4xxkez_i3EjGA-8KDmCuPjBv8bx0jn
X-Authority-Analysis: v=2.4 cv=LIRWhpW9 c=1 sm=1 tr=0 ts=6a7b2d01 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=ZBvaiP2Ty9m7IjM8UroA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110118

On Mon, Aug 10, 2026 at 02:10:38PM +0300, Abel Vesa wrote:
> MXC and MMCX were initially omitted as they were believed to have no
> consumers, and they were not present downstream either.
> 
> The Iris video codec requires these power domains, so add MXC and MMCX
> along with the MXC_AO and MMCX_AO.

Is the display completely sitting in the MX domain?

> 
> Fixes: f387ecdd492f ("pmdomain: qcom: rpmhpd: Add Eliza RPMh Power Domains")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/pmdomain/qcom/rpmhpd.c | 4 ++++
>  1 file changed, 4 insertions(+)

-- 
With best wishes
Dmitry
