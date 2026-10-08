Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E5522F388
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 22:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791499598; cv=none; b=b/H7VQw9gblvDqdHKEtQ7+0pc9tnss5wS7BW87ZTxwjEaNtxVn3qJtBuD/vf7WMu76Dp+aWCVyYp/TiD+AyiXXHLIdV2bP3u1AvoslpqFm7v8kG2IT7TCoCA5rjA41QaFb9uNQQV4aaEE+wNMsZz2P8A/cOJ9R+R1ERSp1YptOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791499598; c=relaxed/simple;
	bh=minayMpZxEaljxEEdcT6SsxwB/ZzWrUJRJQkueXYEgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cNnEWm6T8JTUbbOnuya4VNMRR9on5AtG2MZc7yeTDQzfo/1og/VzPI7vd6GnpiLju052ry0miKPJkTmmgyFpiXKcNcCY6EFtlEFjlwXbwXfPxf7nHS+sRo7+fxMPq6nEw07coB/P47hMG35QqL6y5XiAjic2G0yuEaM0q83Q5lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mqrc8TwM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AkfOcbA2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mqrc8TwM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AkfOcbA2"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698L0D1b2534168
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 22:46:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4EGqHukNt5V7Y76f6G9i3/IwoGjUVi0GuztY4nSPuAQ=; b=mqrc8TwMhoJE2j+/
	7Cu9dWE8NeLSat2Eu6H7ULzcXbc7R5lVI7MV8Uro1BiS/s9jyTla3VR2lgSzEwRw
	bdt/8Xt16rMWkFyidQhEIdaIHg9Sh8q7O2Fc6KyB2im+zGYeuGFCBMhl+XjwZG7F
	ek7Lfb9rHG388asSnKw7cNrXQrgxDslV9nai+5lWONP1bId3qHoilHlktY6bTTQa
	bCUzAPBSv57dti4B0mQHlF348S8xH8R+3jlTyARTMRe0U7I6M/ySldkajLCn51hY
	p2SO0ILRCfdjVQHEZJUi6cDK0sQG9fm+Krpdeap41H8Fe5yNVmEX/mvBhXGmxSPh
	aJjMtg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ev596wf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 22:46:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934956beec8so1244329585a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 15:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791499596; x=1792104396; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4EGqHukNt5V7Y76f6G9i3/IwoGjUVi0GuztY4nSPuAQ=;
        b=AkfOcbA2T3EJ06z0XuAeOUkxHCid5TWXYhdKI1gxRnxdWX6uwuKTpY3kQvsPCx3O5k
         NS8ieT5WGQk7MrRDQ7XB+6/dY2XB6HcUY7Zw6snbCpNvgpMvTnf7y1YnN7gFhwQWBnni
         Bk+uoQUwjabJ7Pex/Whq02LNXmNUHlDO1FRTXWpjNeKpe3DEQgagX2P31uHSuROWRiN/
         xEcGAZ7f7D7iOuPT6ufRA/lIcQ/kZUG4TQdRngDqNCsuiJoXr59p1dOi2nWJ5m/MyHVK
         Wy36KIcwLp/WSXELL5YDbnvxKF471cHS+HC43edV2RobIEbfgIkrSyoJieFC/s/WtgpJ
         7b9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791499596; x=1792104396;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4EGqHukNt5V7Y76f6G9i3/IwoGjUVi0GuztY4nSPuAQ=;
        b=dJEr97DGjbjQM0QfHWPjSaVcYKKpxa/UM+pJNKjTjDFkyPNEpeOUGNCzr8CuC5uoGD
         mX1PADYUNeExkUi3xawAiwNayqVVBb7xltwgLc/oEZrn7rKixKNQKe8n7J/HKhC7DFOL
         k0fVQJuU5tBQ0uVB+xBrp/3h+0su+uWp8V4YkCwv+sqr6bXW51UJSL0FVbo4OWSKK7ao
         8oGZFYZeJawMqTD2VD96Mk7X3c337WTXIm51NA+1GgNYHYQLuJSVMt/crYpTRwV7iZ7L
         G4BGNy2c19uyA2FOoSMsl26oIHLhdkvMHdm2Ipyc572s7Fk+l+F8VQ4J2UzCaihcHFAs
         iiRA==
X-Forwarded-Encrypted: i=1; AKwUvBy+bfCQUiUKUcruigj+3UveI3strs3EAQFuBfJcnVVWCBWZDxoO/nl7YUaI715KU7F6oMAEQ8w4ynWB6kzp@vger.kernel.org
X-Gm-Message-State: AFuF++lko4fI5hfeZkcOiQv0FgdVO+cqmryTRVVMmTqo5ySM0+J1hGg1
	HwX8VAJRhF7phL7xyp0UFMjLdL1f4yZAT/Y4uLP3qXQy7nVqfnYKG7BJ9vNpXgQLFRsTChHj4r/
	kAly4LjN1PQMi0VzVd3lZECzw7mbNOL2l6lerJTqsF3whNqBJAjbVm0o8VamwzW80TzdBflJcFR
	bNzsY=
X-Gm-Gg: AYBFou0HjmwCIvj3B1CurzdQHda/VvjrcA1IFJkiiyYd2epvMKHHGNXQrmWqhWhuqAG
	E4ZUW71IhQUfL773xEy0pVP185LfKxnQ2Wifm8HIcIOzKRLfAnzXvT4hR4HpzGYvgh3d8TqkceI
	PaG5N60eGkVLxuOpFPmyNhz6ydR8oteRHNphaUJFn9Hf9xeTcBiqAKStRqECV41XiIfd/lOMx9b
	RxFY6gXRFyig19VCC33P+iGdl47MTyVycZKoREQa0buzyncmq/gvXMHWc7cL77UBAodjZy83wDP
	Hd8fYLt7HJHLlE2NKb5naC3CeHygJUtZIq84vMiG+n/QAjPYfUlacqr40vPtqkA60Nkfx2Xhyxs
	ceNkoBdfcWAxxaqfdxxtAIJE/MDJOv2snMR9V1j2ie7TNkB6yKRdOETaWwD58x8Dq8gDzGVy9i0
	03hdmlLlEVdRus
X-Received: by 2002:a05:620a:6606:b0:93c:5958:9de9 with SMTP id af79cd13be357-93ebd24d6f1mr9896285a.33.1791499595852;
        Thu, 08 Oct 2026 15:46:35 -0700 (PDT)
X-Received: by 2002:a05:620a:6606:b0:93c:5958:9de9 with SMTP id af79cd13be357-93ebd24d6f1mr9894685a.33.1791499595402;
        Thu, 08 Oct 2026 15:46:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3befebcsm1390371fa.1.2026.10.08.15.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 15:46:34 -0700 (PDT)
Date: Fri, 9 Oct 2026 01:46:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: me@dawidwrobel.com
Cc: Jianhua Lu <lujianhua000@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm8250: add device tree for the
 Xiaomi Mi Pad 5 Pro 5G
Message-ID: <6bi4ywt45f6lhyvxkbp7vtzxtoxxlorwhnwizooz5jysubr7sa@krybqpl7e5m7>
References: <20260908-sm8250-xiaomi-enuma-v3-0-0198c3bf954a@dawidwrobel.com>
 <20260908-sm8250-xiaomi-enuma-v3-3-0198c3bf954a@dawidwrobel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260908-sm8250-xiaomi-enuma-v3-3-0198c3bf954a@dawidwrobel.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA5MCBTYWx0ZWRfX9TC5pCmy905x
 i9208ZGurHXt0LUhh6ITbagHtXjJKPAimv5WMhU5txSTOKrGVm2qPsRRer56RbnzAOvFZOVXRlj
 syWVzVjmb5SFqHFnb+E5RDGCJ1oDS9U=
X-Authority-Analysis: v=2.4 cv=MMT1C8Zl c=1 sm=1 tr=0 ts=6ac81d4c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=VoYNWTs0KIJBnnxc:21 a=xqWC_Br6kY4A:10
 a=8nJEP1OIZ-IA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=br21HGidAAAA:8 a=EUspDBNiAAAA:8 a=16WXXSGXZCMmNkSL7LsA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=rq5_1Q1BYlbxkLLkNd_B:22
X-Proofpoint-GUID: ohgdoyBtcRL12rd7fQOAi3QCPnMcvIP-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA5MCBTYWx0ZWRfXzWpW5YJC22ZH
 TT3/CBs0SRGNW2abrH2ZIbi2fkzMT7VEdSZobRTjh/6QiwTCcHQNiWLMWyDB8Rvn6vEwA+7L+42
 ozdXb/FNzHSkv+rvenTOtqTG99taO8V4pEQNooate2dTOJkIewKO/9dlsVUllgE0uITkKZ3W6li
 o4kVHR3gTpaX7izbPnlTvlKZ7url2+qVISIv9HKvHfXAL9hxztJ8yRmGM8ruWkwO2MMTGFDsUpz
 Jp2KdkfFqqxqcTGRSTlbyEfuYocaJDjarVT6uhhRGJt3EmxidIhpIXINasUg5479Me/F6iH+0Xc
 97x3jqTyAZotLk9Xs1rlJIsQUYZquHJn894hMWV/AJ2Nvs95mWwVuRE3HrKnnYtb5yqtnZ1eMmz
 NZus/Xblu3H+y8mGfyIBjC66n9OjKZqLVz0qvaO6N8jbI64/NCB/59Ri1qyLPZ7inG5bcwezDKr
 3YHw9bigXVzGuyqYhvg==
X-Proofpoint-ORIG-GUID: ohgdoyBtcRL12rd7fQOAi3QCPnMcvIP-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_07,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080090

On Tue, Sep 08, 2026 at 05:57:01PM +0200, Dawid Wróbel via B4 Relay wrote:
> From: Dawid Wróbel <me@dawidwrobel.com>
> 
> The Mi Pad 5 Pro 5G (enuma, 2021) is the modem-equipped variant of the
> Mi Pad 5 Pro. The board is otherwise the elish design, so describe it as
> the common device tree plus its own board ID, panel compatible and WiFi
> board data variant.
> 
> Unlike elish, this model shipped with a single display variant, so there
> is one device tree rather than a per-panel pair.
> 
> The WiFi node in the common device tree gains a label, so this board can
> override its calibration variant.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dawid Wróbel <me@dawidwrobel.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |  1 +
>  .../boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi  |  2 +-
>  arch/arm64/boot/dts/qcom/sm8250-xiaomi-enuma.dts   | 27 ++++++++++++++++++++++
>  3 files changed, 29 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
