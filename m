Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC513BB67F
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785403720; cv=none; b=c2xkWgr9lfW7mA22jWxolp3TNeKjpOPCASOueYzDKyL25lPX8M7lD35+2xAFxRdcwxX3lQIkaq4FYqy8GcZxOsBudtLAv205HhNHiL0mf9p7gvs1ClfOAm56d94qTGBVnCU8BerHu/hyi89iBDEYuuL2QFurYS/DyAat32jN0w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785403720; c=relaxed/simple;
	bh=3xF3BZeMbL9Vku84u70+xX0yKmLBNECOtVGtD2Edl/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b5e86a+Z+dYZhkuHpamb18Vk7ysMwX7SQPbaI+F8gbfcodMvkIFF6X+SkpSe2y4TdOe5uMTlHD33Iwvq1mg+yNUB64XHY9Q1KNRbMnyDNREWJXhGj0GlGGAnik2iWhwHG8L8p1+agQS5Xsae0DZoQquZsyfT6ZwfXIXON+JtEIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jb54vuva; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sk/IG4vH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jb54vuva";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sk/IG4vH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U9IARi183451
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SnkuMjLgd4zfKyOblSGLPk6hM45einYtMWndJ/1aBYk=; b=jb54vuvatRvIr267
	ha7Z+fThj6o3r+FSoZQlv2zAS2UmSU58Bs1NwtHwg7IuKrohUC165UNup15zhJgN
	VpV+wdHmkWL3SJMWUpq/tVKXH6dt/91WigVVva4cNwBut+osfB9grQbXjCw6kB36
	V68f2TwuXUWtyVHTBucGf7Yz9Pqppwi0P4NmQ5Dg+TRXP2FaaaaqFJrj/HIsYaxQ
	r52SqShu+WbEM6IUtC7cYxvvUNjarKhFCDfzxTbfKb0UkiugqNmvJpmEdJFt/VKn
	npsZFe9s7rQw6t7v/Med/wQEmChBA0oNIcENuDHZ+seZbtfRvlgg5KdnpEtJam7C
	KaHfsA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3v381f4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:28:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c07313be5so3666001cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 02:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785403717; x=1786008517; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SnkuMjLgd4zfKyOblSGLPk6hM45einYtMWndJ/1aBYk=;
        b=Sk/IG4vHTDihh5Ij4Nj8YJcpxP57rhWxm53oxgFDLfHUsnRGFmY9sCdCMGYutUGSna
         ZR81EPJUJhDYNj5lc3axJn5XwKWfduGse6eQ6i4KYuBUmgGSlP0ZOFF04gRMxT3VBzXL
         /tokyAUKbrABy0BfdVhLQCJlf0hjXP/lYRb38t4ViReQ+MhkJt0g+ad+2PDiQEj1l7nS
         r9qtFisAr3FEXuUhxJcA6sMQG4Xsn6QV7l+MwTpU7yuduISCzQmWzPqEr1bSlpY3mI4D
         6qVmBfNGOqXt+qzu4COpBXoBVunIEGBeFO+izRi/3oT7iIOx95cCuO96euFE3SXbKHf0
         wIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785403717; x=1786008517;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SnkuMjLgd4zfKyOblSGLPk6hM45einYtMWndJ/1aBYk=;
        b=lsw1IWTGpdIhOJvkHuDIPb+w4YI8QVwSrSwVWAB8b7oS+C/X9V4BDE1ZazEqhGZ5nD
         r9df/CpMmXxxVTPfJLKAO04tJqOcQ6ifYI+V7bpEktmOwQkpFda6pjYv0DWgy/wU5eJx
         WcH1p/d1yWWgoF8uqMtEaclCrYJWAqdFC4aoW1NeIOY/gAmb1Fquhph3/iP1BCyt+1eE
         JBSKqQgHI2BqJAmCtf4n9n6nhHNFEGhtnrHBMh16DxOADyDGlH7/nDgeP9sCxz0+JiTr
         aT+N3WsM7eQa6w60N/pnnwoURIJP41KdwzyQamh/Id/SHk5doqNIIeZHl52RxATCWS+5
         ePcg==
X-Gm-Message-State: AOJu0YxmKBVu6kKcbD+ndphmNsTCxAjY7oA3OOSIy91kEEraYGkEvewJ
	dW0qp89dgchWOy3c6sAMaud1kUjpGXPjDASP+mQWWPaayWoXo6VyltV0UmF0SStFeelROcn2dFi
	Wtie047TYjkuiMosMrM6nJ7dM9hQBaN1gLOneCdIJAmKm9AikbBOXIiOERfLoDrOAUqJT
X-Gm-Gg: AR+sD13MXYVfgp1zTQc4JEB7OPkH2NHoRKU6iYbh8I7k9IXem9W2IQmk1kXzK9CE2tr
	wtVR68LJihG4IrgOCK59sj45eTPD80m10MOW3sz4/IIY5hyROL3DYznMJoT1T05N4OMLXJXVkA+
	9RlMocUvd1zuS1m00cPSZgHGirDiTAuVn975C23MghHG0ntRKYSP3sCxo4yWyc3Dg9vrjgLpKWR
	1BWTH358L5Z43WoFNSg7zHwh+QfhUQkhwMjIbXZ3cFzd9YRtlQocWhOSOHjQanAJCMLJtsPxnUB
	sxf5XFr6qqE5n+sXZTA7d3IHpjtKs2p5riwGZ1YaCY3KcuI9sjesq/xx+bCfUrl8Drdr2g6kVGT
	LmbJ3CWy8SwK8Xd1tcTHjKXGn
X-Received: by 2002:a05:622a:4d8a:b0:51b:f40b:2faf with SMTP id d75a77b69052e-52b386e56d9mr33596741cf.4.1785403717180;
        Thu, 30 Jul 2026 02:28:37 -0700 (PDT)
X-Received: by 2002:a05:622a:4d8a:b0:51b:f40b:2faf with SMTP id d75a77b69052e-52b386e56d9mr33596471cf.4.1785403716724;
        Thu, 30 Jul 2026 02:28:36 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8bf2098sm45936766b.60.2026.07.30.02.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 02:28:35 -0700 (PDT)
Message-ID: <0b9554b5-b339-4ad3-919d-afc7fdf77d0b@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 11:28:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: Remove unused macro definitions
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260730-b4b4-pinctrl-unused-macros-v2-v1-1-315337a8797e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260730-b4b4-pinctrl-unused-macros-v2-v1-1-315337a8797e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HcJhwGSRCpy0cNUAFJ2l2Af5cobUZU4K
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA2OSBTYWx0ZWRfX9+DlebJopbSB
 ucu4C2uIIkyb5BQkHMtUo/BKQIXJlN+SftlPXq7k6zj8xLqp2SKElm++6iSA/DjluwyddmaxM7t
 1ka2tGu9arp0MdFtjszQQwxYKgBBvD8=
X-Authority-Analysis: v=2.4 cv=bZlbluPB c=1 sm=1 tr=0 ts=6a6b1946 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=9c4g9-vIVPbi2t5wHb8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA2OSBTYWx0ZWRfX5R66PihehxUZ
 CD4PFDZE5kwf3+iNFai0Pv66Y9qufrO9hQQ6/CzU7VZMJfusC3BvpBORK1aVkKPcCC6gMbkWE4G
 wwFX8xF/E2WoBxJx/Nt8hREVVep4isLj7N2sfj3fCw53hkWgw4mFdizR3KP8x5YWIgYeAPKHtbp
 1oFAv0ETf5DODWSrdz99RQv0HoV6WLAIjvmPqyMz0kX5vT1ZmbyB4iuhE0YwmH95ZpAcEip7Zks
 9Wx+z/WdZ5448k1amdD6tFuq7C8ttZko4k+lkK7VfYv+plwxmskujV7iO+L0MBh8kjbuYRfLVis
 UelXh2y7/lxfowc344bzgNJQVNn7YnncF+LckEYjLXIp0FC2AjZB8PzIBEy1cPZD82tS4jicpHC
 gTXhM+SKHFtodu48Kunz1waDmEz3qQieIG/gbMWmbMZMlm78dA79j2Pmc8ww62qxiFNP2fOpbmP
 0PIxK28So5UNVloZcwQ==
X-Proofpoint-GUID: HcJhwGSRCpy0cNUAFJ2l2Af5cobUZU4K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300069

On 7/30/26 11:00 AM, Maulik Shah wrote:
> Remove macros that are defined but never used, as identified by
> -Wunused-macros:
> 
> - pinctrl-qcs8300.c: QUP_I3C_{6,7,13,14}_MODE_OFFSET
> - pinctrl-sa8775p.c: QUP_I3C_{6,7,13,14}_MODE_OFFSET
> - pinctrl-sm6375.c: REG_BASE
> 
> No functional impact.
> 
> Assisted-by: Claude:claude-sonnet-4-6

Switch to sonnet 5!

[...]

> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
> Remove macros in Qualcomm pinctrl drivers that are defined but never
> used, as identified by -Wunused-macros.
> 
> The QUP_I3C_*_MODE_OFFSET macros in pinctrl-qcs8300.c and
> pinctrl-sa8775p.c, and REG_BASE in pinctrl-sm6375.c have no
> references in their respective files.
> 
> No functional impact.
> ---
You don't need to write a ""cover letter"" for single-patch
submissions, leaving it empty is OK. You can test that with
b4 send -d

Note that if you try to add a single-line ""cover letter"", b4
will trip on that and (likely) treat it as a series topic, which
will be unused (because there's no cover letter)..

[...]

>  
> -#define QUP_I3C_6_MODE_OFFSET	0xaf000
> -#define QUP_I3C_7_MODE_OFFSET	0xb0000
> -#define QUP_I3C_13_MODE_OFFSET	0xb1000
> -#define QUP_I3C_14_MODE_OFFSET	0xb2000

Do we maybe need to use these offsets for something that we don't
support upstream yet?

Konrad
