Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5236C399001
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371502; cv=none; b=H35LeyX1BScUEfJuFjP77apCCz4ECb7ToP6R6tNaAEvurggi3WjU6jrU0E59hc4KlNjhl6GrCnTjJPCIWynxyYtShOUwnXswxCkDOm6LutYuezATo1tS6tsf4XKxCGUIORQUCHlQSziIi+DuT9cd6Z26qVRHB3MG4PB/Ryu+cK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371502; c=relaxed/simple;
	bh=eg1exeIQOUuF/0XlpVPIdG70UibnUsfpjsShexP9O3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a5tthFeRe9DeXgryfh7ulC5ZsuKHIqzg2ia7ednZKzloTZQ6NVL0GQsTrIyXXsiSTqZuaFX/1uN7kbxTIXoyjjxI8yEnemeYnbB12+g6zXy2E3oZapVb3rrCdROx9do4tbtRYZpH+fbe5ZO1yCo4DcMHfKEW+WUGOyNaOxwQPSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PFfdjWgR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RmnqzoRd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PFfdjWgR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RmnqzoRd"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ipqZ3196567
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:38:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=N3Yny/OsUDy5NzfmpLLzerMK
	Pz5FLRY9LmfMQ5omQeI=; b=PFfdjWgRmIQEBnegwwMgVfrA5q3T7DFEZRkYSmto
	obMUpmUDfAd+tVQba6NOnetiPlCNZXL29U89dxILKerikl4d96jBbJTADvX3Ebfz
	ScDYTcuRNNyur0yi8Cv5CYOHQr5K1rnL+w3YbGtRpVAKgss2F1v04152fsknD6IB
	Gh/B1zmLWdcRKRXjn6k4qxOaTZf1PgAc0v8XvWe5x1DAmy/54Al3u8elR/E2cgEQ
	SSbYEVAlIIquEE+UnP58+vZRFwhZ86+GP2qABpzUC7urOGAaBdfyynz3BMx91JWZ
	2irUNn9f1AQjgvS3Yc9TA5e24SgOENKgLblNseqzd7Deow==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cdhgy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:38:19 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91219341db7so51391786d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371499; x=1789976299; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N3Yny/OsUDy5NzfmpLLzerMKPz5FLRY9LmfMQ5omQeI=;
        b=RmnqzoRdlNbhM82EfLgVN0E2Nw9YfK2n10h6YXjS/Mya/3qovvzf26aPYkZ4rt+JTK
         /q9EniiWhnVB71ySOylNdwEqxUwOnPvRUM4BP6TamyNAQfqNdnZC67Yq/iEGIWFvIgqb
         ArEyA75cRX5HId4X5dY4C/hDZkor3GZJrB170LBZVhMau8XMlZlLvVm2lGM7lYgCpx/Q
         +INjeHPnNnnWjFAj4TjDGYgZnLZICnNvYAZ9QL/yofB1x330EcVMwYb/wdg5lazZba43
         4mAiMc8+SJo/aNJfJGys8pBRW+wx/maiQqNPehzFOvj+/iMqR6kt3dqlfHPI9GEiINxp
         JM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371499; x=1789976299;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N3Yny/OsUDy5NzfmpLLzerMKPz5FLRY9LmfMQ5omQeI=;
        b=He+NAwuSqJ3hxcasCcajo9ziFkcje0bOlEBZthSh0aMrbYmqm1sfqpXwTcq0Z66QPM
         t7CyEltPlQPJdhu2TSsdBMw1MGLbyhiPCPK+W0Ztp4uW0TycsxWag3lFD0HRuLGQtG+V
         ghStu026wfRK3Tg1KaTRbbWcI6mJ0HPkLfBkX0BTmgu/ifFpszvAN4rU6Pc555TIrT93
         mw2Z9WS1fRVbv2R6akcKq0dbNEpNq3fy5uGmr4bYSa1XCg4h2DxDfwQYQdtKgpU2/wtZ
         ICH/0k90rR5dnS6TSXgaN1EGRLKeYmEAzWOqQkLkZn3ewVYacFlX0ia3AY3cYYfO/YcB
         oGRg==
X-Forwarded-Encrypted: i=1; AKwUvBxwsjkvDbxzXx7MRJJW8d6WytpRojR332VoZ5THNXWl4yysgzOb9DGdtlzKvX5WFUVcWdocuxfITBsrMgJy@vger.kernel.org
X-Gm-Message-State: AFuF++lRvC+6rlmwnMs5nod/kjSHUiePQ4hxiWsoCIKTn5Tt/rMUEYkV
	Z/QWVCcTIUhtqZM3xGfo4QK8aLY5RpxgjxCtU3OsnVD/QhOlqKW8vdtT0J8L5no0uKebJD78hb5
	HqYP/7B/sfNMw0gT3mwv4mjsIP8vxZjV7/sSY0rpVeZ0aSpx/hdNMQK3tWJJRRfDkbf1i
X-Gm-Gg: AYBFou0srSaaDaFn6FnppPNRmCfou3q0xKBYbG7IkHOkr53WwymWrPiDeNxhWJKmxq2
	42MUBM1fm39ppcEncqOm/+LTDE5LS1LiiqFRt5aeoSLVkZxNXpGfM6sxlajC5RFaRSTTKg0NGgp
	ggByJGVM4ka1ZpstEo7OGiOqY4N2zwl0Oi/aZzAZRZlLqS58i5Sfbr/be2UGjITseEfnn9U5VuD
	lq+rV/5iK+wBAy7B9okT+La6i6lqB0sdnTMiUFNhZhIcp1hXAuQvK7yrhf13V2GjPrwJr04/nWY
	s+jm6wNQ+Ld5X9X788iGZR6SG+KdtRpb0rzdhOCJQ2czViw1hMz+KwNbQRGxolqkL2hx3lf1lke
	PzQiwZ5bjCYrwbg==
X-Received: by 2002:a05:620a:4889:b0:934:ab73:ac53 with SMTP id af79cd13be357-93a294bf61cmr210771285a.0.1789371499304;
        Mon, 14 Sep 2026 00:38:19 -0700 (PDT)
X-Received: by 2002:a05:620a:4889:b0:934:ab73:ac53 with SMTP id af79cd13be357-93a294bf61cmr210767385a.0.1789371498818;
        Mon, 14 Sep 2026 00:38:18 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee5csm24899801f8f.20.2026.09.14.00.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:38:17 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:38:16 +0300
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
Subject: Re: [PATCH 10/31] arm64: dts: qcom: sm6350: Add domain idle state
 names
Message-ID: <pkyhw2dwwbzlp3v2kr2h72jlixzlouappyal6kahrrgezs2dol@o6ku3lbgbtev>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-10-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-10-660c31187819@oss.qualcomm.com>
X-Proofpoint-GUID: TQ81eK0oDGwhFtsw2t49nuZyXZ1zlmIE
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa7a46c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Dm1D3uWegqzzbaKFt_AA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfXyEOcCwaIZH7B
 9QGQ7+A6jlYkjFWGq1A6TccEVTzWW2bCFhNS2i6hHYfFJ0J6wvD6tZq/tGw0kO4lybA5rZV2uVN
 CnWn2myBBIEJSVanMiAAF9DUh0mGzFc=
X-Proofpoint-ORIG-GUID: TQ81eK0oDGwhFtsw2t49nuZyXZ1zlmIE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfXwqwlORQppK+w
 V2pd3oyCVag5A2idx2n/ZP5dAJ7LOA9gl2iCJO4Pg7gQd77AgvCwzX4dSFB9XAwQeYqXydvoOzS
 Xfmaes0B/53IESe26skTeShM8fKF4biP1PkGPwxjPfGExwWQClp9IOjST2seiLr1LZjDWOSemgO
 pzIP5EjrO9suL8KbVIi3GNy4+t8bfvIl6G1R+AmjEExl99PEY2pGevDU1CqNQXaUZT+PI+uomJ+
 zhPBc0nVWIQcyTj11ZSYaFJc/s4qBHayBEnYaaXADey2oMvbks+ikHgoouLFCDRXVxKdiq2c/Ie
 WLNHY6WdyJkZlPZAOoZ2m6tsslmrf1H5mzkNmT2jom5doaPEOg4xopjmJlTc8LytkBy9ymDFYPM
 eWF1nVqO+w29PhtgZfTHopVnfaqTdL+K0F4m3UOVev/IWfeoFOvGMRGDwEfm6TIHYMfJ/aZ/ypy
 mN1lT6tnhqkYz8lRxzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140106

On 26-09-14 12:29:42, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
