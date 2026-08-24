Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6583F403151
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 13:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787579209; cv=none; b=FZJ9MlIxYmitlVMnXYRqD3zTgTAJaxs0IiJQCJ6Gpe2fj6dNaPi+NQDm18ra0XrRuxEOKioNpTWEfyLd4opyWJhQ4wFXAI8dgyLu7naHHTmJO+pipM/2eobjUv1FnE5YYTC065TCf4ieeV0ZGleDKTqJ0La8tIgo+npFXaiNQGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787579209; c=relaxed/simple;
	bh=u7ptXGg46h20+ycS2XTm1WSVKz2gZ9zCx+Gra8HyM2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A/kp3THRREKHxRdJ+a+dHpr7SV4ON1OB71muzjn37LjYdnTodum0SCUilfgs7giElgOr/XJttB1X1M5TQ91JUUOlGw6ELA8L/DHTLN8w8KYC1/iEjZF9DWGPPOqtcyWsshtGuwCZAr91Hnw+zVmVnlvPe/ZnY1LJhZ17pZBna74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UsyQI/ZG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GtROgGHo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UsyQI/ZG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GtROgGHo"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCvBro2481295
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 13:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nns8MPtsNp7ny0utoj3zguksz33o1lq3WNM38Fnh1Kg=; b=UsyQI/ZG0RP0lXB2
	C/BDMVKmfhmKljREkvaPmhueQWqkkcO8zS0r/DVK25iHTlV1/o9EM+L78j5Is/Sk
	I/FjcrsnsIino7G3J9hSvjvNSGbey78jL03naR2/PpBLg5fA4DDhzITqQftU4iwa
	uzNK0Ta6emu6QSAc/jUunr6aJzzjb4g4Ja6gEjzGurYg9jioCndfMWrWUhwAUqnE
	cET/sAfYE7HGe4rzjLBY2xZ55FvOtdftGbv5xzx5ZBMAWQfBbe59+OYeRAuXcuFO
	79FGzq5LMEozefIuQegxGqz7o7gq/LaAXRoVcGraIxsY71+JZfS1IfPDYyhjfxFi
	hKZEEg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8kdsh09f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 13:46:41 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73966c839bfso79289137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787579200; x=1788184000; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nns8MPtsNp7ny0utoj3zguksz33o1lq3WNM38Fnh1Kg=;
        b=GtROgGHoxMGwAkvgMpOWeGkxdifxpZRlYLsSQH6wd6jCByY9KVSgl+l8FiT/zmXW6T
         n3ZS1mxhhu3yJfHJduyUVP6yiuOT1HC5aUt6w4MyCD+uA2A8J5rePCDXs8PzPDkKEGu4
         bO1MJLp1gx/7SqhNaShRc0669GdmESOq5XuFQK5XU3ik8oUL6tWmDAvv1IV1YevCRtVA
         rjINyOX0PmS6zRYn5x+VRORG/F/U2oqo0OjuVSVDA9HqmX6KkPcS67p0PPUAGBVqgEa6
         yPjNGrKfN93fXqr8G7aiTQ+Ve8GDW54LKkLVc7YkdEl3gy2HiSDj7KkenG7hjNrpCIGu
         f/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787579200; x=1788184000;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nns8MPtsNp7ny0utoj3zguksz33o1lq3WNM38Fnh1Kg=;
        b=Y+5C9XF3liyGfbwDL0FKWKfLRR5PpgmmV7hrlV41qYvHCLJFr2ExHELjtEfzJRsNvd
         nBy3xfOsmSeJ5QPGdpbZcm/AMfhh4CanZpB6WAoYkQLMdK0Jb1i2ahryvORWuRWNeG2e
         WNWEFdpBQy2abkLGnx+z5s8mNptckefPw5JS162kL1UNVFawvSGJDFIBnabIB3UTs/cg
         S6s6FIgyLpAcpb0HAmNFHXc+CUyDZhf62/6Tm+eVXSSRt/4FHg+vrKFRXCxDxvRjKGS5
         WtsUbL5upDx0Lv7b3iVPa79iIMyZCDO/lME6jevCOCIdoSCd5kuKKhsy7NfB4z+k3gxZ
         v4zw==
X-Gm-Message-State: AFuF++kC4pefSdJCrw+0eGAc+tZF+v5bwpcwCnaLMyfPHahQYjc5c/5z
	QjgV9B/2/hLoIO93y3TqNe2NHf6uEXP23BnitPVy0z8gKKHDLKQmxYZL0RtZl0KzBaQXeLBue9A
	hRyUdRS2xHVbHSPjt66YCRoGy3TbjfeGUQ4QCZbCYl8NlGRfcU1ufrRLCX9Bm7sHaJa7I
X-Gm-Gg: AR+sD10dW7hkE9sO9z18p1QUSZvDFa7vS17MoMNOKCrCGo4RBZ3hTRlJNHtzJJHOa7E
	1EhaS+Aq4UYyKcipvc/7LCCOjABEeq7/4pvO9F1UbuI7diPDcrz7/qvp23wz8ZMIByStxdcBTvF
	2dzjDnS+PVnGg0QbC+NFSgsElIIRBAwTj1SAgmvEb9UA1v8PBMIzv2jOzRPy3eqYzus9wK+Nxuz
	SeuTAFCTp1xEIy0sV+RFfW/Y6Ncg352eS6MEunnOIXqOr2HGZTBBOGC17BCaUugCGSQjwBrWQ66
	zVNwMp6QM0Q9kHmp66scQfq8aQWHQZCB0nSHoSFipE2jbz3T/YJxmoaMzDu1wGQ5/I7H0q25nCR
	/ynejX4zcXfgCbkDYeTE+YO4v
X-Received: by 2002:a05:6102:1594:b0:778:30ee:f44a with SMTP id ada2fe7eead31-77a5f2e70b7mr3427933137.0.1787579200632;
        Mon, 24 Aug 2026 06:46:40 -0700 (PDT)
X-Received: by 2002:a05:6102:1594:b0:778:30ee:f44a with SMTP id ada2fe7eead31-77a5f2e70b7mr3427912137.0.1787579200146;
        Mon, 24 Aug 2026 06:46:40 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e00108asm13140614a12.2.2026.08.24.06.46.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 06:46:39 -0700 (PDT)
Message-ID: <c3b857e7-3f23-40cc-9e6f-c69c7b368e1b@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 15:46:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/9] usb: misc: qcom_eud: add role-based EUD control
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Peter Chen
 <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260811213610.2956147-1-elson.serrao@oss.qualcomm.com>
 <20260811213610.2956147-7-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260811213610.2956147-7-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDExNiBTYWx0ZWRfX3ylu/l+HOmXL
 cUsoZsGr0cCQxACNkNVW9hzIcl+hroounU4Q+pJoZPfOJvbRJ6cGJWGUreQc77Kz7EenOZ/3bXT
 l1eqLL2j5c/5Ie5kKzrJ3/1BMVrIvQM=
X-Proofpoint-ORIG-GUID: 1z3AyRZODn-MSemtRD4leBHsR9HRQRB-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDExNiBTYWx0ZWRfXzpF6l+1JdQxO
 twkIzjkQPZ8ZTao/R9zp1bree4rNdilx04lki2xdeJMRuKwhtYVxX2DAfcHfMRwRlzbq5k3qCyK
 QP2yACwfiZEKldLDo7E2oyFBOZ/8eD6XA4rT89ef5vQsyM0K4iNoeqCpd1sPcuGkpoxECz3WtGX
 6nRr+MXQtKxhum+Y2k17AJDo6MTTwBb2T+8S2Dp0mJlZiXI6tPnEVEIkkgWsaQ3jPqlGa6ex6sE
 2wxt9ljfwyQdAhO3D1nLVr/4v2OZjwjkj90X8avUwGzDBhnBHELVU7yRB5SFvj63p5nZFDX0Bjt
 dNcxNujUDLBKWEYbUmhBEf92pQGrpDHXHPxMqLH7+tQtW7cafZpO4sE7sHLe88Eb1Y+ZK1aoQdC
 XjPnHihL+7rbC3+qQub3gKNoscPDnOatU8MjdzLwFJ8w9unz6xp51wMjDApHDnMK46jwYE8xaGq
 h4rRtcA5kSykFnFZa4A==
X-Proofpoint-GUID: 1z3AyRZODn-MSemtRD4leBHsR9HRQRB-
X-Authority-Analysis: v=2.4 cv=d8DFDxjE c=1 sm=1 tr=0 ts=6a8c4b41 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=X7E0pNrBJpJ0GBZA2WEA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240116

On 8/11/26 11:36 PM, Elson Serrao wrote:
> EUD functions by presenting itself as a USB device to the host PC and is
> therefore only applicable when the port operates in device role. Keeping
> EUD enabled in other roles provides no benefit and unnecessarily keeps
> the associated PHY resources enabled. Furthermore, enabling EUD in host
> role can cause the USB controller to misbehave because the EUD hub
> supports only a single upstream-facing port.
> 
> Address this by treating EUD as usable only in device role. The
> role-switch callback enables or disables EUD as the port enters or
> leaves device role. A sysfs enable request made outside device role is
> recorded and honored when the port subsequently switches to device role.
> 
> Reviewed-by: Peter Chen <peter.chen@kernel.org>
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
