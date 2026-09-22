Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D303C4D5983
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 20:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790109433; cv=none; b=jd1yuAFJIJs+7GO+eA6+PTR/+lvxoaoklTGGIHQjV1tmLW4UoERcwmaCpDZNKZ5bJwLVKuzm2lHql5341pAp8wBlbRgrVJoBoExlZPLc4iORYEAaaL0ASe5gerTCFg2/voSITGq7YIPXxFgYlXvzjPQdX3L1LFSCs41NrloCKAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790109433; c=relaxed/simple;
	bh=aK++3JbYzV8XbA4SqPzyNT+HdEqpAKIXLsDfXp5lw2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lLWrQgVQNfRMYP3GU0D0zyDpnCwJOpq5zWXdNQmm01mNrfC9hjpJ+0R3lIBRKlgqz0DKhYaPHHloxjcTk58+3EUPmG8ZJFcEzb62HNpBVdu7fmZ2YdNNpv9TLSs0J1Nhtkg3MjVzHGrsGXatWsLBShZb2nlDtJZdnxe8bdtTwl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gR0h03wv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JhLdyqu/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gR0h03wv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JhLdyqu/"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI6xkc2033239
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 20:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cXyXo8Mcq+VUz2SeeRLSBrOs
	vJpMR+7hdf15S3RqYeo=; b=gR0h03wvvyQo3q6TcL0ZjtimSbeIzENyUxLSv4BG
	xMjb0MN6qBwVymsXhcAGlFstwr5MBzLih1JyeyRh4uGwajk6e6Yc21gSwlDNCX+p
	wVeSBk3lTwKG0CQjlL6datOFsthDKcA/K0Cyb87gf9jPYvD6pCKP7JHcNsGDAgnu
	FDratzjSfvKyP7F9wBnCNEQ7ZFLj4/meOKZiIY7rWdYn5msiXZ1l+3XV92zn1Wdd
	GXs3ujfcITSeOY+9IwZslID0aeUaH4rfgTAQScTFV4Jqq2x5uZRlCGjUUXTR1ERf
	lTLYYOBVvBI30LXH0H1/Xbx9K+ZexCP2GUCw2XDtVPDrVQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c0xkc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 20:36:57 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-79285c98038so224330137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 13:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790109416; x=1790714216; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cXyXo8Mcq+VUz2SeeRLSBrOsvJpMR+7hdf15S3RqYeo=;
        b=JhLdyqu/WzTulXreM+9Nwq3DjWPPd51GfyKX7AuLy6TEoyBQN2fOGF4nvqpxcAddNe
         es258lPt7UQM8c78LJosz/ntLEOXCTs6IkggEohClVryVbsSkDJSHL/RYnsvPgpm80lZ
         yK8ehnh1YmeXyf97vDjeAmYcWp+MF0jsAysTlcs0Om7BkdQrERxOqWOU9M8N3U19KjIC
         9Rk4SaEfiwdYCCNoWrA0E0EpwtuickQ8ucvoFnDeq+lFYBLmk1+0tbg+26ipUii2UGiq
         EsqMR18T9bKarQvNbgPfwQj+N4zM6mvBbtidrHThbLPp6FTN79Rs0Q4SrRJLvN2J7Vsd
         fG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790109416; x=1790714216;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cXyXo8Mcq+VUz2SeeRLSBrOsvJpMR+7hdf15S3RqYeo=;
        b=FcF7k9qrOVmyhWLE4shWS0sXzJjEGEped+EjykMYoaCN9uVf4barcefLKI86MhNol4
         2FLujYTlPvDdTQku/j13VKYTovn1QkqTu547DKLMhXeTGeV/H/h+C65CnKUSeWTOXhqt
         5Tjl56fRN2fEmZrR1AnPTeKRtlt2ZbdiFmfXnkOWZfVPU5HnjOMoJHCnJr36wjuCA4or
         MaVOHwItLHG7qiV0Qn2yj3YjZgOkZD/tCfinR8iGW4PHs9q+YKAerVXKjC/GH+sxzqNB
         aSeLXfawNtP2GN4lobVbSUD4lr05ucs3ElJX6emdPn4R8EFT6s2WVOoe3eePKk6YFqxE
         QjxQ==
X-Forwarded-Encrypted: i=1; AKwUvByajE4Jrw7+1CZhWyi8HQ1FwhmL94vXJlp5x97jj4fMsY8x9znitm77Oqs7RsQPao3Zsf1fWDlAGsGl15x6@vger.kernel.org
X-Gm-Message-State: AFuF++n7/CcyDMy+NQBi8NvL7pH+8oTVsniHmHDlKaB8BgveCskdOYG0
	NDoZN03o20pcdTjdbZYUwr17Z+Bif+nxcqi0wQj1jVvT6KGiWA3jBjt5xN/kNDY7STZ4hhOE18n
	RJaD42E2lvgMJmSCo6j6Gsq1w2040urlDU/VKTrsMFKoF9sjFWs0Gdl2BIuhnYBD+9XQ+
X-Gm-Gg: AYBFou0uKuL1zi33q54ErjfkjKgo3VQvy2SvHrPqwbdbYpYpb+KWP0XeaqYn4a1B00g
	+lEPOPojl7rTA9jlpexilwwLeonuECeJcpo03wK9+kqmzjAHlgHJ4bGd8n+ltcJ3Y4v+hqFt1B2
	iNVpZXhJStVqeBgM5w5uaN7i+CCh1zJuRVkdKha9vb7U+YCuiwf8Mjj6to0ODhJ8XffLvft4AXm
	Wz7CAcghaZKZN2WP8VfQmwuVsZFwZTZrGCzjD83MZ9KIHM8ada5kE8js4ELdFpBnJZP25igKBZ6
	O+v6MMf67DNBU3e2x18y7OvbaBC6rNvzZ91GidIsPsWPaXDG3Kev1kmecadIhkdhX5319vGTMlV
	0/KPurwrvaaM++A==
X-Received: by 2002:a05:6102:6882:b0:7a7:198a:c2b5 with SMTP id ada2fe7eead31-7ac1d2d4830mr739412137.29.1790109416146;
        Tue, 22 Sep 2026 13:36:56 -0700 (PDT)
X-Received: by 2002:a05:6102:6882:b0:7a7:198a:c2b5 with SMTP id ada2fe7eead31-7ac1d2d4830mr739375137.29.1790109415566;
        Tue, 22 Sep 2026 13:36:55 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdf3541aesm5332835e9.0.2026.09.22.13.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:36:54 -0700 (PDT)
Date: Tue, 22 Sep 2026 23:36:52 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] clk: qcom: Add support for camera clock
 controller on Maili
Message-ID: <kjj73o2paa2psrd6lsrszmavkog36v5slrxlctr6d7byyyv5xz@6ecvirwrodan>
References: <20260922-maili_camcc-v4-0-87704b664dde@oss.qualcomm.com>
 <20260922-maili_camcc-v4-2-87704b664dde@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922-maili_camcc-v4-2-87704b664dde@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5NSBTYWx0ZWRfX+F/fWXpptweT
 gsaumAY0UF7fFehUuTnRXEDJhRLDWG3snY3vf8UXU4mRAXjuwz1m/N3GSn5zPbcfbrZHZ6dPFeL
 JMULZFwK0BrtXIyRSBQK9All2mxMPY/7TJ+UQ1s33xiY3dsgvgRcutZriAx7ABCoak0DKaDZ3/O
 2SvFZlqGrLDpUOFUSqs0cm2dORvIgMfzU51ScFpaZfYigQ5eYWS9Lr2CJYsomivnaa1uUY8GZWP
 TGqBJPCv6StSdUXHrsJN9m6TTedMEzvNJoX32FqppM6XJ5IChInYzuwNRx/cQY6GVqaJSeucKwG
 AJ9OHL8uSWJLVyiMfKYvXNkQJTfrC2jnUNH4P/X1ASK8cx1VryeVRAwoYGv8R3AxEQrlYeh3qbo
 yNV2rm5vF+jtddcNomMFsG5seou9UBYQIQYH8nbCXSuOj/K5lQpU1PzdFlmTsRx4MNtJnxshg3E
 kh2KbhTZBOz+qDAfqGA==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab2e6e9 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=3jvcJnBrcLkHgcWL8XUA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: Cu7wWfyl2hMEzva9ttk0n0PCjbV1SB9N
X-Proofpoint-GUID: Cu7wWfyl2hMEzva9ttk0n0PCjbV1SB9N
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5NSBTYWx0ZWRfXzA/vjaWjizz1
 JXoqJV8D1mdDw9d49Jca2u+go2yAG6j7+TM05kcCnrFaVYnipOyPnrsp/I4m0lzX3c2nP3EpFwx
 +YQqve0mJUpQzy3/qemQhUAFARtME98=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220295

On 26-09-22 09:26:38, Jagadeesh Kona wrote:
> Maili camcc is mostly identical to Hawi camcc, with a few clocks
> removed, frequency table updates for a few other clocks, and PLL
> configuration changes. Hence, reuse the Hawi camera clock controller
> driver and extend it for the Qualcomm Maili SoC.
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
