Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445865;
	b=pXWOdOPoZ1HM8xStOZfp4jaxMraEDp2D5M3sTGhCut84BpjOZYpQhleKAYfbG1N0gd1X
	 YycxrihDgXJtNHxUhQTJ/UdSMAMPKqx/OApsr5UcWUGq0+5ya5pqbjLlg5kEAx0t+A9XE
	 h6bZIJcB/fKEhjfd0B8ePT8ApBbaHEbUR5Dw149F8iy+leuS+L/soWkUjuUQJ1GLw8IrU
	 hq2nELn35tYpvotYX5s+SalHwNnkk1zOibskaOL45VTMUd6aozXD6g7AYdmxpUPGVuCOK
	 mW59wxT4GC3/1gbD9wkeb9HWybrq2mscG06jTZCO1iSNrDPRI+55LsNVkeAGQHqOnkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445865;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=YR7IFYT5RaUwifn6Orf77wIJhbjy7lkSMcEb8T4uCjY=;
	b=ZZoToyxKJvgHd6VzDtVGF3bjIvHTK0PIaGFPC2LPBQlGeiRCTBvggNCVb+11/TJ6292/
	 iv4PJekQF9IfOfFcJ+gUSylcRbb+RSA5UKJHhY6lVkRsf41NXHeHXQrOLBlt4mwJ+i/f3
	 p63oHNeT4DWgk37ZZ6Xjf9qhgMKQV6dPdVNnbalvJ18GefGQhSePSMQczlNzYNCHlCW14
	 h6Hl4/pJBTgco9akyWihQ4t8jiQoMoinHrVu6f4D+M1zfyAnV5oCRmV8wjCoc01CJqoZ9
	 KwOM5i1yaVCxB4mBI24j6/tf/oeEVZ1UXHXytLh+OXWiTZIwUgw5FU3RnbjheVEW6dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="pJcK/qha";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="j5MrQ/qE";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A45A606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 21:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A45A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pJcK/qha;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j5MrQ/qE
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JLZgA42457971
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 21:37:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YR7IFYT5RaUwifn6Orf77wIJ
	hbjy7lkSMcEb8T4uCjY=; b=pJcK/qhaee0RFV176+sf3IOhC1NqK60aNyrNHoxC
	vzkKauCsVoayYvpo2I8yLrSGFSFMPLd8xF0HNKyCBKC+bjqjqEN0DXLY5kg9XJ69
	ZJ9NsVHSbPcwzDRHAR97KUZithqxr7blLJs0EOxMfyitMXdS13I6kHzBGSCfqp+0
	HEgtv9MAJTpNXCsH7BDLnCzFZT8QyeUE1b+Wk45qHzAiDtIzVAcy3iCSu1xHNbsr
	zzrec/i2nffdZmRon4JdBk45/jHh9yIk5FLueo0qoVgwkyw3pYGY4WDx5av+GujZ
	+Y2X6DKFjg0WORhymslJXv9m5LYIOxTAMjcO4RP0GkHafw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf65kca4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 21:37:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ce7a85f04so531341485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792445863; x=1793050663; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YR7IFYT5RaUwifn6Orf77wIJhbjy7lkSMcEb8T4uCjY=;
        b=j5MrQ/qEij0K+79ExcdkQxLwYvojFKdtmSI5WOfWps1nhVQxnYZHrKKf8ngBkt9C0X
         jtTklS7vOAlI+bpKYj4dXhtiGHg5PQUW4yoolT64NsU59/ni6IBeHh29ougID5I7Bo6h
         KlcomfGBhszCYL6ZBGgvJo9fAcqni/GDUZ86HRLL9QAPLpg8IRhhYgMbalNdh/gD4xFN
         IINQgSr4mF+uAHKAuedXdGzRDjNCg5avOyiVJye0l2woeSttUnyiJGKyS9GDM5Jb/pK/
         7kA0oCHbQOYi5uw301JI9voAWQdZNs7WaSuDyMqqAINzUUyJIyYThWQuo5CMJPLxERUI
         Tc5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792445863; x=1793050663;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YR7IFYT5RaUwifn6Orf77wIJhbjy7lkSMcEb8T4uCjY=;
        b=L+xNt1K7FSjty19n38ErXbOJ7EQn3IDUG3nUjmw5v9Uj5jO2LpYo3D8aOJERrMkkg4
         VOIXjdz7lMFK3ugSS68FmuUYK4pQD9sNALflOl4YHRr+0B3mkTuUP7naplzF4JmAEujA
         xh2MDoiIBl0Z+bw6UMB5hqXUkSMYYlPnZ8EShLRJ9xZtuVUlW2FuoH/asWVPomqrckAN
         urx2u3ASSBr+i+98PJ5gsyvoh+SrzgpRjsozhIHyZIhYtN3Zp+ZsQf3rEBz+OZxFcFaD
         DN9dRltoWAxyFmOpRoYKjAevENmrRAU0pl8C7CPKoZSiudLRGBr2E/plcAL21HmG5sOT
         qQKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcY+UYatug3AgXtv7aC+Iha5cvX8LuW774uuwo9hqzLABjRdVZpTFvaYgfQRmrsRy5sXHPt7LjK9Sl2q0F@vger.kernel.org
X-Gm-Message-State: AFq9FYJlN9xdowO1BZs54r+IUdP1peIaLB7KBLaM3gSfT7kUnopmzaEV
	PzA/XoiXjTNgeinal3ya4cb7tdZh+mwucy8+0dKZujDq1FRQKrLDFKd/ucrnM+CJmtjTCPxRrju
	C1aNBBVXScoDH9oykohS0RmAAGbbRm7OQbPFAqf1GAHCw0MR4nJ/tO1GqTCjkiXDbQ5Os
X-Gm-Gg: AYBFou08qOkSjb8z1B9+7U4+bG4xnxN8QRZivzTqQZWCX3CC07V+Y7BoiHmLiIwzQ5W
	F8kHJUY2EaybAfFcvxUN+TM4tqvD59ni1Pm5Rcf2xitOvY6IH/wH63eaQyBXscDriIFOIOXdt2i
	DelcFArFQKk1dBvfb3nhyShX/Q33HbNaxfI8PnAX7tpCg8oEZL6FsTfHNXiGUWkm1aa8t59/KYW
	CtZXvecAo5vpopJjzXZPmgXZu8sLojby8mYI+9negWoKK/n8XTvPnAkQqR0jEvsFZDB00zunOMx
	G87J8TZtnO+NyDMw2o32HNrNpxQukcyqrPTKJkoaaaEbAS/BSK/e9W8Av55zbQ6QWs+F09AdfTz
	CubYXhWOHZqekf2G/mNG5lsyITAFfyR0+GJjfoyRFvn3enkgcHe7OHews7WNBFlAmcWSpScIjTq
	wqGpDkj4B5Xuzn
X-Received: by 2002:a05:620a:468f:b0:93f:242c:f4e3 with SMTP id af79cd13be357-93f29d2cea2mr1487452185a.32.1792445862518;
        Mon, 19 Oct 2026 14:37:42 -0700 (PDT)
X-Received: by 2002:a05:620a:468f:b0:93f:242c:f4e3 with SMTP id af79cd13be357-93f29d2cea2mr1487447385a.32.1792445861844;
        Mon, 19 Oct 2026 14:37:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a63cd1esm2232451e87.72.2026.10.19.14.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:37:39 -0700 (PDT)
Date: Tue, 20 Oct 2026 00:37:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 07/11] arm64: dts: qcom: sdm670: add adsp
Message-ID: <ya7xujl563xnvdwznmr64j24q6vao5rqdbjac7tx2azbzoezon@b7677fmbytj3>
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-8-mailingradian@gmail.com>
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
In-Reply-To: <20261003175659.23536-8-mailingradian@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA4NiBTYWx0ZWRfX/LGhwNbK9gPW
 pbWrHxYyNcKDIF0tWp/lha8lSnF5uZEaEqX/gebRhaGTlZ7Odg+72129vK8X/CHc/4Aa5NACbyN
 zWX7eRDx175puqXO5GSvE08uskJYMuI=
X-Proofpoint-ORIG-GUID: gxFcIGtGomuY4q10TyNdhG6763Q0VGIM
X-Authority-Analysis: v=2.4 cv=Y5ptIReN c=1 sm=1 tr=0 ts=6ad68da7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8
 a=7JjGCdC6NS0evCYxf5kA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA4NiBTYWx0ZWRfX/4DAvL70lmRi
 32oLwgX7550gJBJMi69BmTAbiZP2cesx8VJ2jpYHSRDu7B++LvOIs/AhTYLzVLDnnn0Jh2WlSaX
 N4C29ySAf2XTQcXiiLBGNNishmcB1b0PssSFYpykvmUCVDkdhnLKg6SGPnDuyjjYmbVCWjpgRnI
 d/3sE7WntljQaztXYqU/m42sGRthWTwB5KsGkkcwgNRO22Xhr06KNIUdWpanTjlLnXAYAwqYg+B
 pJ9saAJBdGzzXzxTX+PlgfaWJXqrZ4Mfsih5eeBIEFeyEVjIPYFoXj7rg5kZUv9CZprDN3eNExp
 AFqMTONboyhR7CtUm3+IhxEVLkR5Snv7FRtPV2ljK2dZ2sJkgsOM0yUjDbCVAwHeFn0aLYClbmP
 e+azW32ueZckeasuqKOXcbGHnGyWRwtvqVDoyhnrZFLWU54rhWOm3s+WWwBiz9IUhv9tNw2wczB
 rQuRkTLzvBiEVQJk44w==
X-Proofpoint-GUID: gxFcIGtGomuY4q10TyNdhG6763Q0VGIM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_06,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190086

On Sat, Oct 03, 2026 at 01:56:55PM -0400, Richard Acayan wrote:
> The Audio DSP (Digital Signal Processor) is responsible for audio and
> sensors on SDM670. Add this, along with the SMP2P nodes used to
> communicate with it.
> 
> The sleep state is included to prevent the following crash:
> 
>     qcom_q6v5_pas remoteproc-adsp: fatal error received: err_qdi.c:450:EF:sensor_process:1:sar.cc:27:chre_utils fatal
> 
> Otherwise, it is unused.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm670.dtsi | 168 +++++++++++++++++++++++++++
>  1 file changed, 168 insertions(+)
> 
> @@ -2301,6 +2349,126 @@ cpufreq_hw: cpufreq@17d43000 {
>  			#freq-domain-cells = <1>;
>  		};
>  
> +		adsp_pas: remoteproc@62400000 {
> +			compatible = "qcom,sdm670-adsp-pas";

Looking at your DT schema... Can we use "qcom,sdm845-adsp-pas" as a
fallback here? Then you can drop a driver part.

> +			reg = <0 0x62400000 0 0x4040>;

0x0 instead of plain 0, please.


-- 
With best wishes
Dmitry
