Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D55A4A7C9B
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 09:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789637144; cv=none; b=A/wIDg0dzEpI9bd7oMWSW4e23QMbnjMVqpeWaos7/ELuSVILwJtNVerFxO4xU1PYFHcQci6CPkAwlaD6LbCANMoBiNovEfHACBQ/TnmgHKJO8X+U3KkL3srwyr8GC74DUK8GgG97oYM2he7DwzUNvFlYRumjRA3HkJJN1VQNG/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789637144; c=relaxed/simple;
	bh=wImfqcMzA2hutdV05gMXWCl9C8YAeHAtDEmm3ZgYq3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BbGR29aytPIwzJ+Xov0XZUebDnMV12CH09JxXl5U1ywTSBE14JD2HvpxW2GOQItL+sC0t7qsEW6aEeL1MhJkhKzvTWXfEepSTgIPm7sf95NmMyA3bXW7RZn9lgyxJhSI2yQnYRKw5vla4Dm+oG0kdWsRb51pPSgD/eIz166ZKNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MGTIZaW4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BPGl4TuS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MGTIZaW4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BPGl4TuS"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H7wkfp931054
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 09:25:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bCa418cMIIQpTdgZsvi2uq+5J8yQEDdEU8Wb0WT9txw=; b=MGTIZaW4ENReRMGz
	JfeWV7Ui92RrfyLqfNhCV83iFmUM9jq44MvA5pZ4wpOREoKyAQVUUoQjPyRYDVLo
	rZ0+AfsnxlOvk7w7Cll0TQrgkjQsysSWWGfqqGh6lJvN+XrglAGl1lhEc4TCjWDh
	B9kb6+JG9jTa0aNrGymM4mRTV+KgZKNx96pvK2MK/eZaM6pb/C0buw2lCj1ayCX+
	dNHv4ya5PCHXrJ7Yss+Xj02VbPRtZEqVX33taoHi5iPT1/AnNWTkBmQ2Yt+5m6yi
	wo+gqVgN9/+sU30n2iOAt7elaoFGfYFNIR7SlxLj6QjTbh6xqghMv27JDlq8G3hk
	Bg2H6w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grc9w8bhb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 09:25:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93102454272so16304385a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 02:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789637137; x=1790241937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bCa418cMIIQpTdgZsvi2uq+5J8yQEDdEU8Wb0WT9txw=;
        b=BPGl4TuSm1k1xwdhTXVybM3J4Zhq8h1ADqje01j6gai3K5VDflOXMFMpi6TVO+NGBq
         MwtbRxcpvvm2COzm7lPF8ZSGqCHBy4uEfzJl4HwXZOzQsHoBHglrC/aYpAGgMgJVs2lR
         1hcX4BLrVMvOAE41DS4mXbU/+gX9Ca1wseUgPMAfl6lecLrO4PC+eyXhpOVY6LLfdBQ+
         /TO1hEa4a8UNRS0o47bTSvYidnC28eolG6A5rtyDfFi0Ha4qoxC03gsbR+C+u36G1K6+
         Y1HUCrV/cnEHPumgNsecDBYIiuSoyGEJDgDncIXZ5eXzIZuFJb01JyHvT3NYE/pTog4j
         XWFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789637137; x=1790241937;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bCa418cMIIQpTdgZsvi2uq+5J8yQEDdEU8Wb0WT9txw=;
        b=SKktUzhlhJ4oQ0aQ7gv7nNHtvgDMQ2Zea/wMzIcL1usjssNSwiApSCaH4LUEpj2gTy
         BByvRLoGT7jvZHjLPzVGlDBxWyEtfwfY2Spiq7wK+6MqI/7s9LS+2+fz0AxacZhxjKto
         Oe6mcfWdTZoQawC+LOQ3bfB0iV5L02rXI4l9M+eC+tqnv8jC3RyB23druQvhUPu3uDOk
         aswlgBszzSNlwDwSyuKAOrOxsbs/8TAwFMOIaQDoesdpgTptqFruj1JTbgdBJddN6DEN
         Iw+2hCSNXp7tlKhl7Iop+EavRDo1/B/HcHwU9+WKcwsmv4VGcWsNMdgT1ldYkSQHa9Ay
         M8xQ==
X-Forwarded-Encrypted: i=1; AKwUvBztXRGWSdHa96kxhuJqSCZjNxi+RmyRnj3eTDdK/rFCRmAOcjDomyErw4emxUlE0Q+zb+icQ2vgAdOY6pmW@vger.kernel.org
X-Gm-Message-State: AFuF++mDVhFRanPucwSwzzzPChHgS611qhtKxlRytTsFmRXoJNwJ2liR
	H1g4mbMhlxsFPTD2lLOpv7/tfhgUmxXsuQ73We6tFpToPKRak6RWfNZHutpe+/3ZmjNBMM1BIPF
	yg1sozRfejHSbGx8p40N6vj4Z6lBMsRhmxaRDFNpYb1V6UytewIn600KGOv0SnP3H8wU3
X-Gm-Gg: AYBFou2aiKjybKnUp4unQ+PhlzQphQkLyiZM3f3Dn/dVbDOU6yUgDc9MfLhILtcNIdN
	UHd7GaLTSkrhuaBZ1O0/lRzxUl04d4PS3zaA/rc63JikmjLk9OKbt6UmdDcEqltzryDzC2jsgye
	aGCcoOvd17GHuvMMCn4lYr1YjrAZvSFZRMvTRBvZLmnlWH6LzHGVeyLw/3UGDG5qxEKdDlPNdkf
	CAlsOiKBSrXWcvu6WtrN4JSX2kgIPzB4w9zuVFx9oyK4xCNqyJAXqoN9XKYftybXbTmS52iDQTb
	vQd1QYz/Sv5ZQjii7iBmK/lNLYqHqNBdc0tkrkWve+/8+OI6JrRcmjqmoxOwjL1MpTZgECxMR4w
	ZztC4LiS/0b9CoGllGJ96Kg==
X-Received: by 2002:a05:620a:6502:b0:931:23a:83ca with SMTP id af79cd13be357-93bd3dfe95cmr24674485a.4.1789637137457;
        Thu, 17 Sep 2026 02:25:37 -0700 (PDT)
X-Received: by 2002:a05:620a:6502:b0:931:23a:83ca with SMTP id af79cd13be357-93bd3dfe95cmr24672985a.4.1789637137049;
        Thu, 17 Sep 2026 02:25:37 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de4879f1sm268554966b.32.2026.09.17.02.25.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 02:25:35 -0700 (PDT)
Message-ID: <848a64de-c120-4f61-be03-181d4df92ad6@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 11:25:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Add AW8695
 haptics
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260914-aw8695_haptic_fp4_driver-v1-0-156f7549149a@fairphone.com>
 <20260914-aw8695_haptic_fp4_driver-v1-3-156f7549149a@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-aw8695_haptic_fp4_driver-v1-3-156f7549149a@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEyOSBTYWx0ZWRfX/SU9V7W1L7D5
 fpWe8lHvymLHKzbY/wCE1xfm7cq6Ic7M2v7XArmFzdyu3Fes8+G4HtNuFp895uzRfCv+VFzQt1P
 nmf5ciRI6wv+9BytMccoS3MuMxQzxwtI5psXK8qstsjpMtcGm/AGwbu6kdw3oq6MRIzzKrhU86S
 dm5pZjq3zWasO3lV/77f6VTWqPuqI+dQ1+m+w5e82ixGka2TMoy7M3aUGuCFJ4FAYMQtcjcQZ3u
 8+4swfT6n3fitXQOFbPKP+S7L6XEnhRJOs+p6XK5NzCnNkGxQ7iCoBU80Pr06diBVZitUvciVRw
 gDmjNqD3C+4x5sFF5L97kYr1wpvjZnyl//VVS/5ZBdR3Aq84urHZJT7w6jus7fJuF3fOYX+E6Wr
 nAfLxqQ4VK5yIQZPEIrGAt81vtr/7PP8idRsABlMeSnKLW4hW1wMNLAuv/6IfzC61eBq+ZXDJ7i
 SPpmEld55LA0zroyHSg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEyOSBTYWx0ZWRfXxz/K8CJyY19/
 abg6H48qNE2U5bdsQwKNiPctZcQUzeqdgcnURHs9o/VcsLD0lOj/5G8fYwleC751MoGT9G3+yhL
 TeISMLSBGGLFMRqswylbum+tRvj/Gcs=
X-Proofpoint-GUID: ML-OP8NDzvXcnd3lk9fsff6k9JvfmRCz
X-Proofpoint-ORIG-GUID: ML-OP8NDzvXcnd3lk9fsff6k9JvfmRCz
X-Authority-Analysis: v=2.4 cv=EsZHPicA c=1 sm=1 tr=0 ts=6aabb212 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=6H0WHjuAAAAA:8 a=aHkRhLIturER-sMqCjoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170129

On 9/14/26 4:37 PM, Griffin Kroah-Hartman wrote:
> From: Luca Weiss <luca.weiss@fairphone.com>
> 
> Add a node for the haptics driver found on the phone.
> 
> Co-developed-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

[...]

> +	aw8695_int_default: aw8695-int-default-state {
> +		pins = "gpio85";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +
> +	aw8695_reset_default: aw8695-reset-default-state {
> +		pins = "gpio90";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;

Shouldn't this be a pull-up if the reset is active-low?

Konrad
