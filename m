Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C72948E0D4
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 09:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791453233; cv=none; b=pzbz5v29zGizHC97m9rjMIZdxTkmzLUphWJI47NuayN/b2zG0WE0ReX8EYkQvK1220s640jVhU6eX77p2isleoZCEYnb5KEWEHA0dEnOqaJEkqLQoz1RAXToYmkkzgxaXDq6WcGl5SBgqHO37X6Hc4F3ZVSD/lzDA8rq6hjOEJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791453233; c=relaxed/simple;
	bh=Z7yiThIhyVmO+J9+tKPLV3/vKur1OFGl6JNxfPU6UKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WRP/K6+nr8Wk7ARSUb6QfvdTxsA+bqYo8AJTzlWRmF5VCdCNrH794A0qdyIak0t/pT7kdgl9BkY44j0xFQL/aCXIpRZkh9Q8foER9lO6uhn7O0pOXz3FVsS79AcM5qZuTZyxBOXwwq1iHygdF+kF/jB6sIWeAZaa9URu+DzgfaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OZI1fMPm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mn2zNYqX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OZI1fMPm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mn2zNYqX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987L5Jn2068162
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 09:53:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aMg1bw/vHi2bfRM4a3njiioU
	TDtr5eiuMVLzrt8P6+8=; b=OZI1fMPmIEeYave7maaJjpAYGKD1wEky29zJlhFb
	CMHIf9qIsEpqSRqY0SfMgpsEs8ZOu4EF3HLDn/faZUS4RKmlOjspWsR3nU/ZulQR
	mDD5GLnvE5iN+WjX10IFgh2U5IurmIQjuSG0sXqkfbUZWVHPGrNnnBB/EvqdKlhi
	237cmCb1FpkP9TQuaTSEsPQyvtl8vZVlV7/GizloE+j/VSbRaQ9H7y1szVgVX+k1
	HBAWN+PbtzXR6IklBiJocbxFZiLDFGUe4JFi6lpa55fLiXpVjAgoxUUAxaZzOdIg
	FA+qBiUoarVM2QpBC7IVP3lxt5F+E4oNvbjpSYsgr6uSpA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3ja74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 09:53:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93be1861d2dso836405985a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 02:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791453229; x=1792058029; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aMg1bw/vHi2bfRM4a3njiioUTDtr5eiuMVLzrt8P6+8=;
        b=Mn2zNYqXo6SFDEkYlfgkGZiTUjWUwynEDizV25gypt1vMn6P1EI83NTDdOkUupCS7N
         Txs0hiKLFrUDvo8AWIVfbDlJrnyY+n4Q+I/7sc2XF5jHFZsH3jBROWpmXldvkROcX/mm
         kkCLum+ge06qAwE0dR2P8pKrQMG/zPoh2OX8/6IyKxK4iH5GgJi1hP4jRI6jhEkOXAAr
         yYStYPhQXtUbhGlNGyG6noEoxw7U+1d5c6rfl69CoGdb3b4Vu348kTrMzEkoMQFDPlU2
         /W3eOboIgaCY7ro0YUcdAIfb5Oip4HbQ+/nVGSwsdd/k9YlHmc5XEUAafO5PH38BIkcT
         OkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791453229; x=1792058029;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aMg1bw/vHi2bfRM4a3njiioUTDtr5eiuMVLzrt8P6+8=;
        b=WveeN33HZKRb2Ia9qq8puafIpbkvpZWz1fC7ak+AV9p6mD5kDYkjuzGalpArEJxhOK
         OUy2S3cVtmXsuZrKKpWnTUsNLh7AAibz+5jgfJxiobe+BMuLeOpbuNIXdRS9KDkhECcO
         xvmk6L/wR2SWpQDI43YcvNJZZmBjnlrJtm9csM6OJLTg4V184XSD8INWaWcBAmgBimIi
         EfUaNLu7VpuWP/LXI+1ftqN9F0IOicJB4gtt5tH1UTBrTsBql25Vi4HA2yj/BVsK0LOf
         xxLWsbwkGFIbB4mpNH4+QbUkXyoFJWH9qAQNeMuJqJmsKI/tHTuwQfCDclclX4FY81AH
         tK7A==
X-Forwarded-Encrypted: i=1; AKwUvBzYg5p4MrhgQb+0LGlisWshHe1dvBzXRx6Ad1pUUOA5r2AG5K5f87pLt9uuPTGomBWYr6lqFaqroqi8SsUF@vger.kernel.org
X-Gm-Message-State: AFuF++nhBjwAJ56sXpxfFp7Hdu0kM8kjwMo8F1veu2j+7C0Slua1UqbD
	LRP6HI4GD+fkvpzHOTlzZ6YKc7ce0n7d+/uN6ogkntmr4cH9uElYZz4ByQoiu+67rFcTx45gabS
	5rzjXoE2fdZ6yPbFSUXTn8rB/35+26z2dYYgS7WAlJgfnKq9SJd8Qt36oNZOum0q7l4Lr
X-Gm-Gg: AYBFou36RP8q6GyFp9CxABkX8cBCBPFzu/3X8gCwL9JOtjG/GxwH1/1PgHAMZiRZRi0
	XNFtrw2MGsN0t8XQL81zxp1zSYF+nK/tUG539mvpZv4UraHzzCp0fMbmTzZb0Wu/UDSLuxnlExU
	+rC3q9c+fUEVcdhBqdYfyRe79Bm4psSbuKz8mGSqFWM8G0UcRORzu0agfo9zcXI6kBeCD8gAHZh
	sALJxAG3qBhjKM/DmQD/QApGqCxJflQw0sCvpjiBFP5/hF8vyaPLV800WBudE/lS5bRPxC1lslg
	9oI4RqXV1CrbSmwbkbAeqKKfCNAQM5ceYsz5m+yFMWQhnmZEUhyOuDCwxFCaqrCJEBMavnPqDWX
	ry1Ich+8bsHy9QCWB+J4NoVXot7aBde17SovrcLAHma/C5Lx2nrhGNt0SWX892RMP5yI9rpM4i/
	iAnov8sacUClv9
X-Received: by 2002:a05:620a:2913:b0:93e:9553:3acc with SMTP id af79cd13be357-93e9b0f46f8mr1024762585a.12.1791453229198;
        Thu, 08 Oct 2026 02:53:49 -0700 (PDT)
X-Received: by 2002:a05:620a:2913:b0:93e:9553:3acc with SMTP id af79cd13be357-93e9b0f46f8mr1024758485a.12.1791453228690;
        Thu, 08 Oct 2026 02:53:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcd3015190sm1056704e87.6.2026.10.08.02.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:53:47 -0700 (PDT)
Date: Thu, 8 Oct 2026 12:53:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>, brgl@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: nord-rrd: Enable USB ports
Message-ID: <wkwmg2g77xg7gvodnrrn2hvi4w67brmygcpqruyus4fzxxopn5@626h4czj3gz6>
References: <20260922-nord-usb-dwc-dts-v2-0-ba2b39f1a843@oss.qualcomm.com>
 <20260922-nord-usb-dwc-dts-v2-3-ba2b39f1a843@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922-nord-usb-dwc-dts-v2-3-ba2b39f1a843@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=NchzRGD4 c=1 sm=1 tr=0 ts=6ac7682d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=iQrKqlqNRm4S_ViRXwQA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzOSBTYWx0ZWRfX0f0jShuW/JMu
 MF6OgKLNkhSkoTmnyKrY78VdDJWlW/ewrF2Xgia00WZ1YOmt2E28SlXs3NhxHrdXyxMNcqtyLVj
 GUMjNqxP2QROqqwm5uxKhjX+6+PwoLQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzOSBTYWx0ZWRfX0XU91q4qnVZ9
 Tvbma4hrZ9nSguCZOPR0w/ibdWwopESE4RSUpetYoVRgcDZzlbQrdzJulSVB4yo8HbhaYf8LlFY
 uOUEBE5vN7SmmQisH4okL7U2v+L0TCcNhnZGpOf5AdTTAsJ9lHepZBFROhlVSIlfC9+IU2Kh1RR
 jxxrx1XYX74rH8CkGs2j0FTuMaRJELDi6BERWSWTsihGfHWo7fSAdI/jkfUW3TxYraYJigwiLya
 wPbkOJ9CjbLi19oQ5xnJggxzTTFzoRXMtYM/qcAbWPWcw+ZUd3MPjsGgxdCClBHtBl7+tP5qrZ2
 MndWdn/F8xm0J1WX9g34ZcNrXPJaxWVar+tVIvhamFHDn/O2jijyB8VSlJbXEehb0fZmqBGrbJ2
 6rDtmY5N9/hUNyQQ9NU20MpAbK0qIhz/6OAblnvY8X6z2ON+guw8wluYKN6Q3h7ymphMukvRF/9
 JSe5UfVNceRaHHkTrvw==
X-Proofpoint-ORIG-GUID: WIrIkArkQNszR_XERkAMLHXR40gzTIfq
X-Proofpoint-GUID: WIrIkArkQNszR_XERkAMLHXR40gzTIfq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080039

On Tue, Sep 22, 2026 at 05:01:09PM +0200, Bartosz Golaszewski wrote:
> From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> Describe the RRD USB topology. Enable i2c9 and add the two NXP PTN3222
> eUSB2 repeaters for USB_0 and USB_1, supplied from vreg_l3l_1p8 and a new
> fixed 3.3 V pre-regulator, and reset through pmau0102_i GPIOs 9 and 10.
> 
> Add the onsemi FUSB15201 Type-C controller at 0x50 with its interrupt and
> pinctrl state on pmau0102_i gpio8. Unlike RIDE, only port A of
> the controller is wired on this board, to USB_0, so a single
> usb-c-connector is described and port B is left out. USB_0 is configured
> for OTG with usb-role-switch and its HS and SS endpoints are linked to
> the dwc3 HS endpoint and the QMP combo PHY SS output.
> 
> USB_1 is a fixed host port feeding an on-board Genesys Logic GL3590 USB
> 3.1 hub. Add the HS and SS hub pair as children of USB_1, linked with
> peer-hub, with the HS half reset via TLMM GPIO 170 and the SS half
> additionally supplied by a fixed 1.2 V rail.
> 
> Assisted-by: LLM
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-rrd.dts | 166 ++++++++++++++++++++++++++++++++++
>  1 file changed, 166 insertions(+)
> 

With the order of regulators fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
