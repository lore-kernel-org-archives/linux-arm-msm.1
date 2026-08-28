Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B081521ABD7
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 09:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787908109; cv=none; b=nXHb83kDIEuYO7LNh8CqCTCi5CWC+FviLqy/V5Jia45EYXVMVwsYIJJSfmnrQ6KODlHtICRG9VLehYQ5AN1p/IY04mIH9x9wMcpkUCS/ZzBwfEa8LqHME/gVQIWP1vNMzpaItRE+rAIN67uP41bat7jQthj8UhxGHfB3QNh+swo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787908109; c=relaxed/simple;
	bh=U4qA8vih7MzINpEd8KMPt3wplR688C82mT5m9URdllM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AbLoImut21P+BJItuX6mcmP6gEn6PfvDohQxcbarA0jeoOONW1GgbzTowXu+GSCzzKQKaN6zrW+V96ifjxzqM0mlsmUUxDgVHX6NQwIQSXhJ3SxoZ0dBq7b9ln/rzmyK+WSHGcgkY7tHwuNTCfo8qpL9KrTZIbFPqnwbVXF77Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VHbwyY/b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CASNPQGX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VHbwyY/b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CASNPQGX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S66pmG2046035
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 09:08:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9tVQheuLW2e6VRcfQh5w33UF
	FY45a+2U1jfjiSX3HUw=; b=VHbwyY/bNQX9JWaxjmLeDoZws2o9QaCEDgGPeG6n
	QEySchxLypwCfZo4duFGVhlZTiIo/LC4anqIycAMs7jLJ8Fkqf7dfhRZ0/XTROf9
	+8REQpFTmb2FJKmNoHcOrTeru51mnF0BrzGT2n5MwDMUnZBmTRjPyg+qu5u4+7BS
	sSfyVwhm5TmmxiLQ8zVpDolwdZaAYqxBJm1ygKkOHwxV/CqFupnUJjN6K5jR2c9A
	QLzmsStXP3PIygV2RgZ5jY/im/YKEriHvvJg3re0SQk0upH45EizJg0lao+HFs61
	EYFv0bUNv6FP5tHLYR4xWv205Z0IsmfMrkQH68vRCv8MIg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb1v39du7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 09:08:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5283df62d68so9352791cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 02:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787908105; x=1788512905; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9tVQheuLW2e6VRcfQh5w33UFFY45a+2U1jfjiSX3HUw=;
        b=CASNPQGXK71e4wD8HiYPrkKxpX+vFa18GRRwcii7D7siZcqDXBhmtrUlrVsNV21TO7
         jpBYWJxGQL4VstcQKUDw/caRwk2edkVPmgpHc4kyZDOyzt6VJD8J5QwHnU4x14i1okSM
         GXOBcqAlFjYMaoRHQ1/hMmFlRRsiHWDSx2F7Cp3ZKD2IEh4Xwr8RDqFnMj2fOx54TRZQ
         N6fEaW235CwmAYr7oMeNNdkX61n3pBwN90I/uQdnZUjkZHBD7OBvyDLCNwG2o2JrUhig
         a6pS06y5qG85TCIALwuoF05n0f0AZ4cp1klhzXGl3c8x2BPNhAQrZEM46kUpuvpBQ8TT
         ieZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787908105; x=1788512905;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9tVQheuLW2e6VRcfQh5w33UFFY45a+2U1jfjiSX3HUw=;
        b=q4OKgFSqet+HCK20AWIS8K2v4k2YLtpQDYHOeLoy8dnCNhYdKoY9M+iIbV4xHRGYGs
         2okIfSrqwL2O+Qt7Bmq0/k+rhmKmMPD8kX84ZUzu2tmY+CXkJoZC06vIj52DuGMYrI+W
         MwzR7D5h/nMtm9N9DDPe/gMJTSe9SYB+61NDv4Ve007eTc1ovTBOxxdyqh3prZaFBWmw
         ctaz6AXaXaV/NEsfQzUC9NjLx2rhxoAJUfkb6IO4ytYKGlLzp4cyQ4CbbH4kFPBMyZpJ
         5On+XuhtUdvSz+Tt5hvYovzVnG+6bQojZ0bOayQzlDg6uNZwzFdcAdvdfL0PY4g0ub5S
         qW3A==
X-Forwarded-Encrypted: i=1; AHgh+Rq2SH2CXh+d0isCA/c/yvrHbsxzsOH42+mHO9jap16RKSRCBAMTzDQJrEnTtXaOXvI2F/8xpUPNQj18GKP5@vger.kernel.org
X-Gm-Message-State: AFuF++mDog+YdCo4OtbuwzGQJmkLse461Pti+9zySWE4lEO2rZLVpMaw
	xNwqH5a/tSzzMp1Ywow9G/2BMwMU0R8PUPZvQ8wEFBzOZAZGwLNuJTFp7ilL9vyGohlZmFwEon4
	NyXyiTovvaCDVLc5J3XO0ANvBF91incdo4LYR14uEUXWx4n7wy/+MJ3lQhZEWabeZLCLf
X-Gm-Gg: AR+sD13+tlVFAxLHycPny8TA8ZyNuyHiWzIKqrcZv0eX76NeRvzQP15pJAWL5nYyudL
	IafUeBVcH90haPevSnKBEAuZYh7voKlcdKvgSccVEZkhcM2O7CllOhv0vnUjSnEpbVFSmfOOtxX
	I1DQipkssJiLPGp53MHdA1cc0cNeUfQcVfyweIgBRvafm/6EtDA3hvR+JCjvsJlCxxF0zMMfq49
	1nkqqaCkRV23vtxsF9ZQbY5nsZg0bo5vljOwOq8z3D4nKP2844I7yCdyimkilEdWWSfXnc1d7/A
	/OYZjSKMqzS9YdT8nvGZYI4yknY8fmlWtlYQZhBlUsCBFN94Sn+CPUyZIbmyZ4SJZOlId2fCQ+W
	9FovX/InDNfU47g==
X-Received: by 2002:a05:622a:5592:b0:52e:12e8:54f3 with SMTP id d75a77b69052e-52fb93b34a9mr75597021cf.8.1787908104518;
        Fri, 28 Aug 2026 02:08:24 -0700 (PDT)
X-Received: by 2002:a05:622a:5592:b0:52e:12e8:54f3 with SMTP id d75a77b69052e-52fb93b34a9mr75596411cf.8.1787908103985;
        Fri, 28 Aug 2026 02:08:23 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbac4d0asm2646753f8f.10.2026.08.28.02.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:08:22 -0700 (PDT)
Date: Fri, 28 Aug 2026 12:08:20 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Yadu M G <yadu.mg@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v13 5/6] arm64: dts: qcom: Add device tree for Nord Ride
 board
Message-ID: <tljh2vtbx2gt6fidw2b3pro6alx2dcpdtpe2z5ccyg2vugdic7@6q5p727qn7p7>
References: <20260828034958.3165-1-shengchao.guo@oss.qualcomm.com>
 <20260828034958.3165-6-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828034958.3165-6-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA3NyBTYWx0ZWRfX4Re6WSnzBFrg
 YRk/J2E+y7AvZpCRoFN7Hls0gdMBr7p3v/1ciAJFsLw8vfQivNMRrbwo1PrdOrtojX8fYqKhmuI
 eGLLfdVnvBQg6iCNmJR3Jw5bKfrq/Uj8SJlBafTDuiQgFROgSayWy1/eb0zVWqJ+99BJ3ow6zR5
 W4Fod7xxWTubjST1q+l0apSl7sYw/tB4N3NcJ2+AeCKNjj9JZC0+5jR1PSaCuPvG3q7nCR8nXId
 Bk6XBNjLIgDi8oeDsT42YD30Iz/O9YLvW8Oq0tTDfDuPRA4qrdW2wW0/Bct9VTqr/NpBGKMSDyv
 nzOCYgzrH9/vTBFwsVLJ0P7ncKqSLxH6giRhPs72yOYxjIIG+mPamC1O774Q0lI1wjkl8+Hi5ZD
 cCZ8gv7lzdUJ8qzh4KG/cy/qHPz0LSqBe/zNiUaAUnXUmOXQwshFTJ8Z6ENZ15w/cEiskZaiqzu
 Ht/BPs8poaVICPPhaOQ==
X-Proofpoint-ORIG-GUID: KBGsVP80H8IrTYt6ZUuAYzFdIttZMrvk
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA3NyBTYWx0ZWRfX5tF852083DZg
 wYroqseJtC3X8q6JeAm/7x0Xn1uO32k6o4JlW71ZtsMLLxasmgyzoICXoWMwZ3IHDhDQskzSl2v
 gdN17ZMTLVtTe+yoQ9MScTCT0VOwMHo=
X-Authority-Analysis: v=2.4 cv=faedDUQF c=1 sm=1 tr=0 ts=6a915009 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=HHB2upKr6LlMs7tUYOwA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: KBGsVP80H8IrTYt6ZUuAYzFdIttZMrvk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280077

On 26-08-28 11:49:57, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> Add initial device tree for the Qualcomm SA8797P Ride reference board,
> which is built on Nord GearVM variant.
> 
>  - Configure UART15 as the primary console and UART4 as the secondary
>    serial port
>  - Enable UFS storage support
>  - Define thermal zones for PMIC dies, UFS, and two SDRAM sensors,
>    all sourced from SCMI sensor protocol on channel 23
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Tested-by: Yadu M G <yadu.mg@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
