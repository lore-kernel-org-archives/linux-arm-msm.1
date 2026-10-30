Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377196;
	b=U0L/q9TBvPjslfcAHDcNgvfC/I6iJnFV2jQGHOui3xp/DP9h7I7DMJI8iiwPX3pCLZQ0
	 ab7U8InR1duo+7PRuEXlEZpD/QPhLJ7oGLbNjHv55CXYV720RbiekzO0ge/DN5MYSUpGF
	 8cSaEqI5/JS8BdCYEJBPxYOTSMBM4y0TsQloUFX/HyLMAR2BHmZOFlUMbi2OzfY+bSuCb
	 Oqf37XxVVGpn2RhhQxmTYu/khFSolWMfhvFAwKZACAJnNrvY90z3sXtHwYhWjS4rICbrN
	 w0XxAeWI85aTcVCivMuWJEyRgKIrqp6+mJA8TG7c/73DSsVSa5XVOw4z419AT5+aQFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377196;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=em7nwsBvfkjrmGxpt9MT8h8i0Wxrvo6KZRBsSUc4l0w=;
	b=edAsZX2uRFmN5tO/HyuwiQ6jaEH+98BgRadDvtR/8qE6eh7mfLGQYZCx68KsktV6wKy0
	 mAVLemSQttIR70q09xwRxW7P7JlPcwJmtFZrPe8Kp0I65sw7SVb0XCKKGO5tUFntsaq8z
	 IovU7RtmNVDK3V87xbda6R7uRq/Sl5QzEvEIS+EyrTITNdjliIsd4psDc9G1TWcCUHmox
	 PUoSdwSVPHwM7nKCM3bQ9JAgZfzIjdn9ngtehIeF2O0X1Skvs5ieldadjYXD3fTv4JFDI
	 QEGBqouZYhOJilf7rr4UNIO1V7Feyi+CczEpQSig6HL6F/UkRbAhnLd41wBx8SO6IKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BZJFO39b;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q7h4hYvz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDF4606A31D
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 16:19:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEDF4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BZJFO39b;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q7h4hYvz
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERiXF3207515
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 16:19:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=em7nwsBvfkjrmGxpt9MT8h8i
	0Wxrvo6KZRBsSUc4l0w=; b=BZJFO39bVpwRcsNSYuDl9B3uxiG74rruMnfkZrIU
	Mu2PYyaDjL6u++CRwdn5AdtMY8XASnCVN8kqgiKt9nuMtZns0XxLF2fO8hbD5j/x
	4eckunkiekMnuMbD3EsOQOTRBn611K9TiF+u9wHLqKBb15j4PHqJoHwF0SsbD1FA
	0+SfPB9E/K730dRBI5/ZaFGWQKJQZzc75jtLUw7eypHPNIrj58C2anOAoEgmapTr
	VxH5gxon9uwaoZjVilUYyBa/uYULDxZsFzIrPAMYRSlD9jadWzNh6zW7CccPk03U
	GfkuOPQ6XrTtnboEZV2MZ14nob0dGu1hFIlNz4/EOUaEBQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qky69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 16:19:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ecdc701a2so107015385a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 09:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793377193; x=1793981993; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=em7nwsBvfkjrmGxpt9MT8h8i0Wxrvo6KZRBsSUc4l0w=;
        b=Q7h4hYvzLOm7FJg5o4lcC6mwrfoVcJ2k5uX7U0uRMq1aF28lblN0W4ognMaRhPovJl
         ruMRuoRNp4jINI7jsaZ+XQlxokDFrOAkshPYFj7+OB9Dvsn923YscxYXXE+3mLfa62aT
         A4FQL4ZxIdnbELebv4lFaWwZIpqonEiSRWsZxxsgvr+4z8yw0vpxBfFK4QmoSgkW6RJP
         EP/UCc364aJP665F1BXJEq75Me/laViyAOX0nMQC7waohl67+XB2BV9XmoC5ic4H7prD
         Q2O4l0u93cs5o/fT8Ctu/9AWolJPeqOgjtZAE4CN9hDlvplt6oiKnjtE/aWH+KEiVJNQ
         53gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377193; x=1793981993;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=em7nwsBvfkjrmGxpt9MT8h8i0Wxrvo6KZRBsSUc4l0w=;
        b=uYhae9Twx6ADWFG6bxTuM1auac8VcynthjorMlLY4VI0NiXSAJNqqY0voVtsGQK2UE
         yxGD7wxn+rET3zWvOc1HN+K2Vm9pG2Ozaoqd9scmgqoEKgMCSL/9icKaY4C8hlbmZtOb
         Tp1yiSssTjxUqSi7AjcTRh3RjZcca846CRscFZVmF6rheUH3kDcqNSafgghyWX0espLc
         f21F71U4NjFTfi6ZSJpARw6PxzKFvULiIYeBxQmrxap12ER6B8fsQUfByAXhIvu76cHj
         i2oPXaVGo8nA/3WMNnBdPSHrXslTVnxeY3K3jP1T+LqPRWgmW0Ec1yxMiCtlOsb/q0ja
         VNpg==
X-Forwarded-Encrypted: i=1; AKwUvBxODZ/FJ9Kv6Nju5py0SJ98NVfVOLqUtEf9AybT/AmP6qQn6TX8aFjIv1eQHIEA/YNFtl65r0hKVLTSmIEn@vger.kernel.org
X-Gm-Message-State: AFq9FYLNLOdKbE0jpCjbP0Emjh/7Q1dL31zqMKpSgTfXMurdaOkA+qam
	6oYTVblvUP6EBNUxj74nGIoBKNNOq0+q+VJc0izv7xkS4we3Zl1BcbccnG6Z+/FSmg9ZIX1uRXw
	aByUEgznxhZNDHpq+cqVy92PFa57zxG/4edgLwWnuFx6krlCxiEmLABhCncvpuffMwogsObT4Vo
	IKDK8=
X-Gm-Gg: AYBFou2TeZVNglCQo+4/mcgFf3WwAiFPfPX5JYRUXC+/URsu1HbrlkmM+MIu10hTkcR
	9I5dSuLg/eu2oEetc+rrXPaF5HYysvlKdABBePuWpiPHts+zmkzwtqfCplnD1uAkyQlKYs9tByz
	514pQ/IksRhA14x2L/Clx6j3im8MGQUY0/24c1z1FmSRLISFuRu918H7qcI9Ktxu3StYHxfefVI
	aTjVBCLR3T2eGztgIJfZWA4G158zGvJ9RGgIOypvV8EdX1IvFCAUNPumX/f7ApGUltlc3YDOY7h
	CxcNHSPVk9Yxmf8JfE6A3PbxYCz68VLTuwKK4TY3Yn3BVjtms9aDvIn0p40i85SF3dYHEq9CMRr
	Ykj3K8QdNKQIWa89ayhTVgsZQnnFMu9Fe4VEwZ+1vAWGCIel9SfMPBsmYuN2hmI14
X-Received: by 2002:a05:620a:28c6:b0:93c:ba88:cd65 with SMTP id af79cd13be357-94421542269mr462073185a.7.1793377193004;
        Fri, 30 Oct 2026 09:19:53 -0700 (PDT)
X-Received: by 2002:a05:620a:28c6:b0:93c:ba88:cd65 with SMTP id af79cd13be357-94421542269mr462065885a.7.1793377192292;
        Fri, 30 Oct 2026 09:19:52 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9ee537sm126104a12.10.2026.10.30.09.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:19:51 -0700 (PDT)
Date: Fri, 30 Oct 2026 18:19:50 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] Mark USB controllers as dma-coherent
Message-ID: <3mxenh7tqbblbipiybfjfgbm3zboui7gnzw47ondqet2pjvwo6@55xlnjgmop5y>
References: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
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
In-Reply-To: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KsrYSmWN c=1 sm=1 tr=0 ts=6ae4c3a9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=q5fyLHn3ZVvuh8gySswA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 0V3B6WanfcAhOD99QRXvVH-t7cvEVqgs
X-Proofpoint-GUID: 0V3B6WanfcAhOD99QRXvVH-t7cvEVqgs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2NCBTYWx0ZWRfXzr3YgfVrUgcd
 fy9Ek/vUGSMOm1vziPOzIMOwMh45l+JJnrGD/Tu/RDkDq6/aAYfSCJdSO2Ao3T68G6QtdJYS83l
 VVeQSqdieO/zBGmAZbdDUnxYQrmk4wx/r6RXrfiKIluGs3VAn3IjgyFWfs2FT/Q9bqseD7nQW/5
 w5/mR9zpd2omy0UT5ZmGVlU1t4nLBfEtVg4tSNk7nhp9NUTaI9QC4GwGbyR97Ys+d5yln7VYAsm
 7U4/vJiZMuFnIMp4BEfP0bLSo0+tFPJsJKnBMtNCDYd8SQMSXrnUWDRu06YfJxlSHZjK6aZmwMC
 qUc8WYxb93amfnbhw6B9UqUs4ZMJNxmZXOGvB4Fm9xpFBfxswj59T5t6KOUGfriauSp0eT/6kQe
 rgZVA0AsJiGZ38lA7KnGGLvM0aukPY+gCnkWzsRpJrZrf1MmRQ4zOsKXWsd9g/t5owrTJvvyqTR
 hb47xnqSMToPFR4F8zA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2NCBTYWx0ZWRfX4z2tMx+bnqBC
 dan83oQT0wDQTGZ90IpnDn6/9YQT1VKt8ut0zZFwiV9GTwAT7yuHrYyuMmBVbPItpVLJkk+S9T0
 8Q1isrLetW4h9hq5JvjAtsSwDv2e+Mw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300064

On 26-10-30 00:03:37, Krishna Kurapati wrote:
> The USB controllers on some platforms are DMA coherent but that property
> is not marked in DT. Fix it up.
> 
> This series has only been compile tested.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Entire series looks good to me, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
