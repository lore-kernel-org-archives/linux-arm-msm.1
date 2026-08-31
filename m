Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19803D88E1
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 12:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788177792; cv=none; b=WpudzgsM6rycd9lrWFpX52tQApBYRhcT55huFwTMV8S0WfDCdUcR8BtvIi6dTeuEmEVyW7MoNZjv/Ui3J0u2B5LFxx5EbjAGKmtw/b93dR/YHBQOvsrC4yIuLe3Rp0GvfaQDTgNL+dVLT2qar9hOxabRYTh3AIZUZuDoPfZXKFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788177792; c=relaxed/simple;
	bh=BLdIX4JmDDmCb/nESqUPLgpc5EXO7M0X8FYZInOGzg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n2LoSLWpVQXOZFgzmh0Hb9mlDLbGZzUw+iLq1oTvH/x41uwEkO3GYRcBQuugM+aBr8nCpuGn0c+5Os9EyURlzS0cEXlrjFhjXKRigEMt1voSvt5xRRe7+GpwwBeDf6j2KghE3jH4GdK6qzgOi4p05Gs6S9RRNQteYXpN+Nc8DJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b/JY0HZc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c3r7YiXf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b/JY0HZc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c3r7YiXf"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VBAJ1j3600882
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 12:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NOEJTVFIcyoSbwosxVwbkQo3ZwwxOkwI5Yd+ZvI7e9U=; b=b/JY0HZc7fjI2rEe
	xT3mbk9004ZfT32oo+urk6xdI7RATR9xcI0wgQLl82QLpzA8zl7cpVtqQ5f799C9
	pxJ2hQEG1vSTmAZ9SQa5u3DXe3+FzIJcYNPDxeIgydSaKuWiBhOQTCwtxRrj9Vmf
	WgmJxdo5AHnhCSabGjqeNI0o2znqkVYhNMA3ywSmpY/S2jRULCyBqO09h7iSDHhP
	a76RBS12vGNad3+zoDCPXXuJAbCiqUFcHHMHrCfrAidLlDeoba9YDvULFKTRX939
	TlhDfjn6Jn8iHNjknuFDNApafSGuRf4PdQMZB1tE0TiDiWvq4Gva/sjnJF5gmRfr
	uxtmUg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6jggnux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 12:03:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52ea38b1e7eso8844251cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 05:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788177790; x=1788782590; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NOEJTVFIcyoSbwosxVwbkQo3ZwwxOkwI5Yd+ZvI7e9U=;
        b=c3r7YiXfOKevrDU0klJO+0I5mnuVbJZot9ojdU56PxXeO2yIS6kPL8YU8oxQPJt6rR
         fVypCb+FLGTNMuLA1VaXP7FCRZdi3kvc9cLZpkmJ7w7TnBIiqmXKSukjKOo9u0hOmVud
         7Y24cZ8PE3JapXapJ0h7Ir2WFzB2Bw0kIWOobn8RKF+AKXPymyWUI92gNk5qtW3NZBuR
         /G299Hr0wUcrOM1rHVb1ewHoswHXcK+aczEotzLJiKVi+Kj+RdDscKiEsE1/l6QBN05+
         RCB4dDmxLbX4DhUhXkO/nBLnMyMSE4qhY+R+XpZmkifIKIR1aFaNhsfLhfgQzesty4Ar
         WhEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788177790; x=1788782590;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NOEJTVFIcyoSbwosxVwbkQo3ZwwxOkwI5Yd+ZvI7e9U=;
        b=Q5T6HSdV4DCOxfJzK+DsE/oOjtQr0QXXGriqbN6hgb/BUBwy4/jzPeISpaundX7Y1j
         IMfuRRiaj5YXmev+Lw1WuZiNSPbcRl+Wa5Y7eBHGwIbijT0s3l8G2mK/ZdVB41++z1ro
         U98ll/bzSEtcjGjqIm1Fl0mccdr4j2BJbeAU+C1WaAlXjpLzkkKZ0HbEwx1HUbWMQu34
         E+3AkgRA8vqatpQCP4N4GwvYdToFFmeDSYVkDvrNWK9ZWRT9wOSfBT6aWXhLq0oBaOlP
         swCbU33h8uj/RR5S/QAStR55pZybxaYZkeKRTJDq/caJ0L6IEUahIze1iOzGHOvyeiAr
         i0dg==
X-Gm-Message-State: AFuF++mulIW/ySQMKNzDGWtjtT1H1V27uoIU/+dDYJB/QtR0vHBgd6+s
	nZ5mpyPshTEcGZY383iziyJqmxCrGEb0tFtwrP3r4YoR07UE/CtW4RUbcpwvcgDU5b/gvH982lS
	UGdIw5jtXJf7FJblmwjUNXxHh++v9C2q2laLoIrYVoH1qVFSiixxf4G37U8P5yc8qj0KR
X-Gm-Gg: AR+sD10vMMX3uF4IKy8P4AvZBGQg/OedKQb/r6InhHQMbCljOPME7EzpGMlUDJfohxd
	yNrfbxIXR9oveLjaOeka7J1+Ah6J5Etw+xyJS/1lSIf+2XJiod7eeZjeJwciKNvvP6vx8dYMeDO
	eU6f9jrsZnSmscKIXUifGy5e1Bc57UniYCLwemQs157CKRWWmfY76ttfzZFLEeJGrI4GD5EMmDB
	cG2ho1Rxix04BZPXrPnuWz083gwoyZ2Ibd+bwlFOsO1ohv5iD8Xc6k7ceWVm5IXoOtj65bp2lTA
	mZIOyalE/GSdidO8jqHqgJnQNDrgX5iiGAeVDQvgFrYsCp/gyugeOK4iA72j+km1X6+GOjHIbUO
	+4WeYYPuot1s4XEYAXYN3LQ==
X-Received: by 2002:ac8:7f4f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52fb95f4e1amr202144181cf.3.1788177789954;
        Mon, 31 Aug 2026 05:03:09 -0700 (PDT)
X-Received: by 2002:ac8:7f4f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52fb95f4e1amr202143721cf.3.1788177789522;
        Mon, 31 Aug 2026 05:03:09 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611b5c567sm3300432a12.1.2026.08.31.05.03.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 05:03:07 -0700 (PDT)
Message-ID: <adbdb2eb-0173-4500-af16-de0b7c251e10@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 14:03:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sc8280xp: Add more thermal zones
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260831-sc8280xp-thermal-zones-v2-1-8c2b89b4c9c5@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260831-sc8280xp-thermal-zones-v2-1-8c2b89b4c9c5@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: T00HnFCRnNxtOUuo5uqZsOq7rdEQDqKV
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEwNCBTYWx0ZWRfX/Ka9vdTs/2Wr
 /WC9Qv6qtN7rsiOobIhj+ZnIj14EoJxVZFPqmPkJXXmbSA2+6dO2M7gOwrqUzHQRTRez/xojM8b
 wlnhyF3Ph1T7bHvVQOqiP9x4Q4djbIk=
X-Proofpoint-ORIG-GUID: T00HnFCRnNxtOUuo5uqZsOq7rdEQDqKV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEwNCBTYWx0ZWRfX+YMU61+SBCw9
 4mkUHGOCl+vIuFjt/vUuQ0535YIbsFyXXfz4IRAyARE1oBWdCSl86JhogI6stDsPy+vnewDtsic
 seYQ6V3QcefxlWoBtd+rEydTxnN2wehSsY4C8nz7GaAQXSm7aM/uQ6NaxCngN8NIjT/rgh1xE/V
 0tdalZaifPWl+2gBLoYC/5UfryiGwxrClcNImVWuA6p7U3uv4rH8QlyNpLxKHoiznYiH4XmU6Xi
 9L5QsvJzL7Cbs1ab8dEdQzwOr/KKnKVkv5XXmpfzrX2tsP/cGdueuOIEdNQEW9w56JnXIYUZuN6
 qkz2BBGr5bZ7KnCi4JQWmxow7oLVfcqZvMWfK59ltB5b745T2JpnSeg+vIPxOsY4LQ+dTp7oVd0
 lV57yEAjnFfZ9PilqhKSEH1zjnpCpP5DRliBhk/K9G3T/yQr6vNliAnBKz2XIbIqrKoy2ur3ttL
 Q5YYMUI0iveihSsrZTA==
X-Authority-Analysis: v=2.4 cv=YsY/gYYX c=1 sm=1 tr=0 ts=6a956d7e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=ROVUC7vSL5sbk-NUvPwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310104

On 8/31/26 12:19 PM, Xilin Wu wrote:
> The SC8280XP contains a lot of TSENS sensors which are not yet described.
> Add the thermal zones for them.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # SC8280XP CRD, X13s

Konrad
