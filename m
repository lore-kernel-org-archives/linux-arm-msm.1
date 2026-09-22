Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC8439A4CF
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 02:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790045497; cv=none; b=exr7rb6W4J6VrWDbJnuTQ4wh4SnLXYa4FQtC4lzf5aJrsIQFXMUUscZ80YM5Du72LyQlFLYeJtYIw2ySWU9da3zLFlYqbEr8eRN0L0azLFrciwbsAVRnchtdtanu87Whjw/7Eu4+SAoNWMEs2aQ8q6iDQCPyFflB/fjCH16pxeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790045497; c=relaxed/simple;
	bh=k7WY88xtG/dMZrHKXCX+znIjVRIiI4rzbq+8jyS+OCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D83b6Kx7+jxbVfUsUiKyZyB169HOedE2qN19s9dzMvhbYUFAN1mPHA27FlfZeXMgWdeyzM6TjWNnXDuX+RhPV1vaAMnWtHvXjrKcQTWcBqlwmyxlwbEeqqqHVGGE3IjPNaLN5q5iE3WqE/wILOZo1wFaJuGbUk9exU8zlMnBTxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mVR1/yhD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kFypGFB+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mVR1/yhD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kFypGFB+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M00I3t2165598
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 02:51:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dudJJoyUyotIf/gAM3eNUXI1
	9n6+S8WkBaQO92/4Yqg=; b=mVR1/yhD7zT0X6Z3YX1Qoz0IQ6sQdIzf8jNh43OV
	r3jHoTQuuF3CsMFTSVzULxzB/XOlEf640SvDQc89BffOQdYV+t2mX5QtWDcFbFGw
	31Hst+j4qePrJsZF/3D6nAI+mgbLYsS6W24zLa9wQzG+5M03SbnMPPyP4Du54/eJ
	QzNmOGDiizUyCmB+n/vZPDvOLv7Z9OdDLeWSKB13zBASsIberRYXQ/zqUpPhDPf6
	l3asoTH7ulsecJhQZ2kQezapcUrw7g5Qbj0FhAli2+4fcORAnl679k9HX1ZiUOHc
	v0xxUmA9U8u8ExfBPOxGl9Ktf2X3niIzF7BG1qS1lM1AUA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8xesukp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 02:51:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cee1ec30f2so51510705ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 19:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790045495; x=1790650295; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dudJJoyUyotIf/gAM3eNUXI19n6+S8WkBaQO92/4Yqg=;
        b=kFypGFB+R5/tNjqUBvaxzuULs5LpJRklYWfZUnVFXwlTbOqgL26hjzhl5awnrQjOx4
         gUY4p5zPlE1AXqVzSwpvLJLI0+bKiglvo/jTZ4ulHQb7RW/lUGBQdTDiC1EpO+i7wnoH
         ra+8mkWHWRR6dTyanabaufMZHZiqhlGKW5MNnA1p1jCn/1pQ94EbkO38PnTewZJR1+0l
         VNYuBITYCIb5REv7udiNI6ylMdhFkrgqRvFhYA+X70l99fTY4Hblvwu30ZNuuT2WtTg3
         /GmS6jNSNmQKW5aGX13D4K/Q0EK+XmijV/jLHZwKFNPPfupt7coCs0JbTfOt6iovprxA
         fQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790045495; x=1790650295;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dudJJoyUyotIf/gAM3eNUXI19n6+S8WkBaQO92/4Yqg=;
        b=tjysTNl+ph+EbVaH0tANL99xfWIbR9+jB0sRY8BR4fPMOLZW6lwGkN6A/Pe+rrQ8Yq
         suRA5ytDxGI3m//v+MV6vzjUfcuvgPfgYvMM34hvrqPF/YsENst4WJozUd56eNRM0bcg
         ktVgkduLLPM1c/wLV/LlDSnnS4DubECDoDKbUuC4g72F5YuAe1fax4RhzelYt5H7f2JP
         zzZCO/tyLdVxRUtWRSqlnZ+Ca+gs/isYUqunQXuqYNrVDsLLPcBLDhQzcIp6EGo4rAuN
         yiUcXFoX/temVH4j7HufbHl224ZJ+7JkDeZlbFr17ZVm8PvMwPGwsisZ1fPa2Zb0H2As
         8/9w==
X-Forwarded-Encrypted: i=1; AKwUvBzKbxgVU6sweFYb02KdZtPqlER+/cDwlD/ggsthP6FW9xXrY9NGuWxJF38J1QnrRlugFX4c2lny84GMYVuK@vger.kernel.org
X-Gm-Message-State: AFuF++ll8TTous7XLH8Bi05aCh5rwSTrutMsbQsDRSkyrv3jFqV/oexx
	trMr7uR7Vnzq8NsObj0sJG6XADoYb13qWxZv9NyS85d3t/dCY8YFlGhiT1QTjHqE/7ZL4AofxPC
	XEx1aJ7/DneQ3ASamv2dTeraUO+Wv8P+jym+HLlLA8KvEgfWZ4wcNmh0kZumWnam3DuVK
X-Gm-Gg: AYBFou3tSGubGlV83WCpCNRFkFgCKqoVRAIILtxsd27Gqgnvzp8EyuPjqTJkdPnxSJb
	1OdRSfH7xgfDXsT8PKm35/6TFwNLJKrfPwnzo7y2vlphV1Vyp0JmPh8VORB9lSbpofNb9KEY2ZY
	Z2iyR2e44ICygnbdZlg1vXEi9p2snSv2dpdKgn4I0WusooXn4+uiAmAKHkl/XkU0wbdpSknLDGT
	3RgaBK6I/cGziykpRZx8jrRE31WI1cbaxd9r9n+FHat5nAbAlMShQ0Vf0nnNttnGRVfULZOObaG
	VzPWYNJhGu/xvtJfyYT6+rqw4UhoQI6xFQlqXn0Wfm/5IhopY5LkRfNTVaFO7Uf88iZVissKrlB
	MznMIkvXcdM5QCoqR3Tcwrc0mxRcGcHnllBGu/sFP7g==
X-Received: by 2002:a17:902:d48e:b0:2dd:ad74:ac2e with SMTP id d9443c01a7336-2ddb1b9a0edmr187471225ad.23.1790045495090;
        Mon, 21 Sep 2026 19:51:35 -0700 (PDT)
X-Received: by 2002:a17:902:d48e:b0:2dd:ad74:ac2e with SMTP id d9443c01a7336-2ddb1b9a0edmr187470785ad.23.1790045494503;
        Mon, 21 Sep 2026 19:51:34 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e61311f86sm1158375eec.23.2026.09.21.19.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:51:34 -0700 (PDT)
Date: Tue, 22 Sep 2026 10:51:27 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: nord: add GPI DMA controller
 nodes
Message-ID: <arHtL8M9SL5WCX_q@QCOM-aGQu4IUr3Y>
References: <20260921-nord-gpi-dts-v2-0-4f297c983b94@oss.qualcomm.com>
 <20260921-nord-gpi-dts-v2-1-4f297c983b94@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-nord-gpi-dts-v2-1-4f297c983b94@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Pm5IT5hjN2-4MEL5Lw8Ix2wXZVVxImeX
X-Authority-Analysis: v=2.4 cv=PZhqFShd c=1 sm=1 tr=0 ts=6ab1ed37 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=svJ9ipqeD9EGsNKrb54A:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: Pm5IT5hjN2-4MEL5Lw8Ix2wXZVVxImeX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDAzNyBTYWx0ZWRfX3aW4FY0y42dQ
 Q0X8hynkNR4tEwhF6ionByyEQ0xn+zLFFxVpfw6Tt0MGNxhyBf0jEl4uXAzexy2qPltJzKN3mFh
 jeXml0L72s9TNWn5IdrSYjFnvr7GRu+VYJtI8U4WVXE8vRRPZ9KQY86+lNRF9Se6lS0t1F62VU+
 EoHN0XmFYYpm6m7+e8b7SVF3IzOVe2WoiasW/Ef09PlHoKxIr2hBIjZVuneRiNAHUEnuhqWkYjF
 IsvFaVUPYWPzcWXtzSPhPd4OtDuTbF0uP1IKcnGxD0qqm/dt4JNzOVL3AfjdC0OcN7eoo8T0BkX
 mjRPJB6PU8cQPv13PYAGJ4r/TypAVwS4mkv6v2M7dy45c8qVnTq88kbtCIMyu3Yhjvz0Hi84nhd
 N6LrfGcTHFb6eOQ1ZEps9FSR2QiUNt03PkuF4/Tu5qKPx8lpLWjbQyvHL8OVg2C9/NiBiLdpe24
 rnfQUXZgaPMNsiLB7Gg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDAzNyBTYWx0ZWRfXy/BBvnD5h+jn
 QkDvAe+ugtIu0xvPtDsfMMsU0eydTgC0qUTsxEUjWcJGQHyqxI0cJr4pjGMXoPrSZW/bZwDW+re
 EBWw5480qSkEUx+VfACsWlNe1H9rG48=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220037

On Mon, Sep 21, 2026 at 04:46:58PM +0200, Bartosz Golaszewski wrote:
> Add GPI DMA controller nodes for all three QUPv3 engines.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
