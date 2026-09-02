Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFB4448392
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 10:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344914; cv=none; b=KNwb7Qj76D509TvnWD+es+mJfTwMjR9PDKiVs4W1HMjRuyQXnXJ9kDaFxqIR1zGnOivES87gibmz/u0Mz/Yxe0AWWMW2N0eG+BmuGJ17qXhzY1YTbQHozPQes3maXlxIvOhYVC95NtngSGlRe2QQ9Zw8RhQFoE7fY57VcW2NZ1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344914; c=relaxed/simple;
	bh=pD72Y1Gd5KDdelVx2ox+ICyyydV8QNZgHYJuoes44AU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IwhQwV/IXL6s5iXMZc8rFelY9oFqnypzPPTVq12/wTPhAEuw6CL3ln33hCIKAIJDA53+ShfiOs2FNvlAktbeu7rMWjSQS6Oszl6cDxESkpQu9wqjdDvlQR+bNrUNl0oBPEEbzq5gldHmFooOkoqxCLNPV5P6YSCNvwRLOUAy5XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fgIObG4I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JVCfbSEO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fgIObG4I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JVCfbSEO"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829MtRO4141323
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 10:28:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4sS/8auj7XVVOCiV9ipoVmQuGPplhEaUoIns8k/ZjJE=; b=fgIObG4IJ1k7QrEU
	cP74toYep4HOEcUyq/X3sRPm5E5t8BC5srdwxYeufvGKj+oGDKG0Drz9yihHXglU
	tn9+NpBvNcupikKBGNB0Xl5CrsVKbsjdAbAd1uSdI61gr04hycB2nlzuIwoI3IS9
	ngw1+ZW1Bn5gQDLl4rrd44GhsQtz/Bng8/1iuv7byRIxqQKwWtBi9GrPCLz5sVn1
	FZetGGtmYn2HixLNJ8C8wfRKHgtbBuahn4RTTQ5g2x3blVWDvqx/ONFcZPysH+pa
	Teqh+rh9ndeVmNOy1cyBPwT1zyd63mQ5ymV6qA0umK1ut7eai6p1WTqnhyYIXVZh
	AAS4VQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge39ckcqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 10:28:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936aa34873bso142053585a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 03:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788344908; x=1788949708; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4sS/8auj7XVVOCiV9ipoVmQuGPplhEaUoIns8k/ZjJE=;
        b=JVCfbSEOupSJqIFrPVsJYcU+Qxa65g+PAV3Y2/KqB4yqaqRH1kk2msm/1blnK9g4JA
         C56gb7sp6TKgp0kJk6kzpXnNVFLdqBmJmfzAiCX9qU8dXw7HJ9C8l+p3cuS9ctRdkkSX
         SboO9zKhXAkXOq6u2zg17m07lsl7ebhu1oypSjwrBsyCLvx50UOWPlkE2WpFzkbuAiZH
         x6jD6TuAEKGjuv2H32EBnFJVh9ys6gLaEH7LEizLxlajjncMa/721Acevza+7a6ZzDSS
         Szn7fvDeIVdV3bIarOx3OPfvnJ9PnpZgeX3I3b6lvdzqtJtvIFBFUEn603nYHTZOeBmI
         +dQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788344908; x=1788949708;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4sS/8auj7XVVOCiV9ipoVmQuGPplhEaUoIns8k/ZjJE=;
        b=OkDwYQRfHYYtCHsJ0icxgwrk+CWqcOibbtVOSQWGPVTE0jjT55v9KkTpDiJSKctsqX
         +jTsHbI3rbAjjuFbRxfBYrQLMKuanZDVruQAchPJznwrt+Y8sJNmeyMeg7tvlxYU0jDb
         jyMQ5IhKWP6fHMfXt+Lzd+Hqm+/Vq3OfW+3ZpqSP7pK1sGP6Y8WdqKOtoq7ZyjbN15mr
         o8xlcekMi3VfbX4LaNNWb9vGKqSgrFEpdqZWZ1mLTFJI7+dSjBqCrzamp9p9C1ngzdcA
         BeFHW6ERXSD82xGBg+oVYKYzUoB09yLfAmpGT4eGpoOybleLHndix0djVM8nJGsdEMnW
         cDbQ==
X-Forwarded-Encrypted: i=1; AHgh+RoonEXPJjuKihBqcWB3ul1ONmFAHF7clHWCpfVChibKgrVFmvMs+PPZ/IrGwylN6G4f2QLOn10zYTJK/fMJ@vger.kernel.org
X-Gm-Message-State: AFuF++mVx7/QvTfQ/TqNKki5OfKmythm03EmLDhaQ+8aeD5jurpg55hc
	oFT+fhvtOsdr5TwEgkv9IVQwmlKkcN+pn+7cZiHda9rlMywkcn40JYW/hFpC1Vr4MIEU6Hz1BUD
	VUf3Wowab97iyYOLCYxJ0im0yoCRGKMLlyu8UelLzwFlktZFFZLPn8FdSKO0WtJJ3pB3l
X-Gm-Gg: AR+sD11VKncups4Iv1g7dcjONnhLNO6O2FhiLNu0U5y87RrVTCzQ/oVuCINvM5tEDe+
	MzNV0jWz6peWlP2mwzHz3+qlVfjgGLo/4sMcy34nqzwPG7p7HNdKiiZOOjqBLi19sDayrDtJBVR
	Sk6NQbqqHJuDK6lmj0wi9/IpiYXm/FtnQgW9LPxn09TkEdUHwxR600al5xi8qhsdXrwk8w0hlSg
	gJHQa9geUdyMP7v19s2ZSYssl7EHKlmNEXGouWdsedPhNHdALqUBRKR5g4jBYODphodN4biAESQ
	AMxPmM78bohK6Itmw0LOFWr9gAhw0myyJytVje30wZqKNB8rh9f51Yh4VmIXf39pLtqQL/oG/UH
	0PSkOku+YgcUMXc6ZmyHm9dFKVJg=
X-Received: by 2002:a05:620a:4014:b0:915:e9c3:f1a0 with SMTP id af79cd13be357-93960e2b771mr416388785a.12.1788344908011;
        Wed, 02 Sep 2026 03:28:28 -0700 (PDT)
X-Received: by 2002:a05:620a:4014:b0:915:e9c3:f1a0 with SMTP id af79cd13be357-93960e2b771mr416381585a.12.1788344907613;
        Wed, 02 Sep 2026 03:28:27 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:b759:bed7:f8b6:ccad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eeabbfsm5202660f8f.31.2026.09.02.03.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:28:26 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 00/15] Add initial support for Qualcomm Kuno SoC
Date: Wed,  2 Sep 2026 12:28:24 +0200
Message-ID: <178834482169.13446.5654514434501289508.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T968ifKQ c=1 sm=1 tr=0 ts=6a97fa4d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dNNRhoiiR9TqZAOi20EA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: JLWETk_POZJ3M-reN0JOysQHbTZP6_x6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5MiBTYWx0ZWRfX9nfdc712KK5w
 sQcGy45TTqDHK3KADFqJmuGvZ5m5lAhm465gWCemgk+CphhglU+FA9e6VPffTHov5VYwKhjAfYI
 SNOdQmTnJQDOn1TYf72pPz/jz1vXTXQ=
X-Proofpoint-GUID: JLWETk_POZJ3M-reN0JOysQHbTZP6_x6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5MiBTYWx0ZWRfX8oFKF8dGcB2/
 c0vVSzMC9hXpNCMdZP9yx730hzu+SddimIWIOf8SBk2C8M9r9baEl/0tdmUDs86wa63zofnQzsT
 Xawf26q+UBvbyNpApUP21w+R/AH2yCaH5PjgBlvWq9zkYzpMbt+fGy2A23Q3+upv1ojhWWCUOlK
 HjL7T9qe/6+rJAcTQB4QpubBW/DdZWFcZpf7uA7JqN9gdrjZAYJlCLiv7+0PSUsmBl+3p/7s04Q
 AVrY0DB9qvlvXOvHlEpxCM1aek+SNr/l6Q+yDHYyaXjLyyRgH8qnVelYEHnckLoWbAqRNMLCoYQ
 B8ebTxfOMJozoU+gPHmIknONMIn4OqJ48+5ZnVAi7xyOl7SpQVwbZ6TQ2ciBhTqFjeDnxMwgMBc
 qsBHwisnCwlUPBso9D38J4+VmyDCwSDpLBWgfUJNN0XM8vjKwyXwGHhAMISQab3Fc0e1N6oGZAf
 DJxFdCL1VE7clKf7z0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020092


On Thu, 27 Aug 2026 23:21:03 +0530, Hardeep Sharma wrote:
> This series adds initial support for the Qualcomm Kuno SoC and the Kuno
> IDP reference board.
> 
> Kuno is a 32-bit ARM (Cortex-A7) Qualcomm platform. This series brings up
> the essential SoC infrastructure required to boot to a serial console:
> 
>   - Global Clock Controller (GCC) and RPMh clock controller
>   - RPMh power domains
>   - Interconnect (NoC) provider
>   - TLMM pin controller
>   - PDC interrupt controller and SCM firmware interface
>   - Devicetree for the SoC and the Kuno IDP board
> 
> [...]

Applied, thanks!

[08/15] dt-bindings: pinctrl: qcom: Add Kuno TLMM
        https://git.kernel.org/brgl/c/7d65a9c8fa31e04f41bec15fc4a4f51e207d2aba
[09/15] pinctrl: qcom: Add Kuno pinctrl driver
        https://git.kernel.org/brgl/c/d0344c6510d050ee79c6aa3997f2c641168ebf08

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
