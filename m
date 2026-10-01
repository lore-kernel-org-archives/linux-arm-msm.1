Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B634B049F
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 08:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844168; cv=none; b=u5h+5INwRBokM2wLATSU4IGg44LgQSZzzVzluMXN3qffuWJTPgnUbxDHrYdvF+xTJXFVyLh+2e712XRN/dVBDkMfyETp6LrqkEBZHa0ENgL4lAw0OViSnKl3rY4/iMppeNQqRzrXiAGQcywEFRskAfsNW2rLtB5xMpY0TiBpNHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844168; c=relaxed/simple;
	bh=yvAl4xjOA2pRHrKdjrg+4RmlERN0xJQ/C/7p72SB2yg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O3VDIFY3JYB09holla9l+ptYQFuCyQoXxGvjfT4bl8KicXwhrdMq2ijUz96Wkk3f60yWXEzbi5Qqvk5tGUSjiYYXDXaYoD5Ow3nvLo5dj9tQuUzxOrOf7tzBw1y6IIDpT3uNOmen0wGwmhfKTOfCLNAfMqfO4qiO5yoW0aSBZfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cq3Tx5fl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OiBmZgH8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cq3Tx5fl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OiBmZgH8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xfUI1511890
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 08:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oimd7qvPs8zhJrz9SP0gUQVsE98vOmsbEkCGIvji68I=; b=cq3Tx5flAQse07nt
	Az2xrQe6uUyD6QXF6qmNxibg/nQjzJo//4u+9zzhFxPH106jlcD2yPPbWYi2Uhb0
	qiUXcPLtDAlc7FILg7EPUxAEegFlmO7REP3SWbyc57htxW6Sso7WN4/HkQjYg4VF
	6mdl+OhQSGFfG9qolM0TKvCbjNW1/x/ELppz0y9Vz24/PZXga2OzxWx1pDQ3rys5
	3cjve3SdEMLtQeJByV/wwk9LWH4sFJf3e0LrMLPx/jP3hdFHQ99dALZ55Z78a3b0
	LfVTBz82nWa/UqbgOSTxWRIt63c6s5RO+KRENccmGJC4OGrjpkwa8gJp/D2kMxHw
	XiuyMg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h188stn67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 08:42:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939fc317691so115759785a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 01:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790844162; x=1791448962; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oimd7qvPs8zhJrz9SP0gUQVsE98vOmsbEkCGIvji68I=;
        b=OiBmZgH8yk376lbo9GhDDqCWlNwnJPVQCTNtd6oS/Do9jRveHXQ/beCAd2mTGYFo+b
         KlYbpbYm5J+jIt5Dvi8qi6V/nsEWOlc8odyID5m5DU309YxBc8YLFchvCqN0kHWOvIPH
         8YQPwoDC5tHCrJwWJRLsxLiOae1WcqKbSe1DdhOONL1meD78F0UY1r2jTb9XUNOu2Gxp
         G0g92s+1205fbfwMfkyEIwMdmi1QKzQbqrZZF5XnbShM26kK+pGNfCiNY/ML8gUgugJ7
         I6K027OaSUEB+lxQ/ftd55kTDx7io8C5A/qwFt6zaBrk/QpXUuX8aQdLFDgFiyFq7UCu
         0NuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790844162; x=1791448962;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oimd7qvPs8zhJrz9SP0gUQVsE98vOmsbEkCGIvji68I=;
        b=bIK/fLwNHT4qEWaugfwvlfnLaLgBXywXlPnktF8/MZ2wtc6oqvTZbaPpSFn4jIGE8Q
         OPZWtHG44v2VIY3zqVldzmSbo3nJgyAHpammVa2V73S/6Z3pl5pUy6BXw8P/I+8hgO5/
         Q/j+6H8WTFo5DlLhSdGmydXFicMoLSFNTWM8V0RBzjVdL/hD7WNYb/w5kowezViUwyG6
         y5Ci6v9zDGmhBcc16gIdo0krdV96d3DTkRs23P4ijdt9TLkMSN4BKtyF1kkUEvxSZGLe
         ne7e9dBMwcORLgpZCpdNjvLmmiSJUpi3igABFZXFKC+N1wavHqOA2TJGHwE/u3KRo30w
         nVxA==
X-Forwarded-Encrypted: i=1; AKwUvBy6Zf9/P2HsrKhXNpGSVzzxZcwRQ9BgXYyMcgA7jn8ezC/4n1+Yu21yib5PdHWy7GJQIK71TTMlooELLvEZ@vger.kernel.org
X-Gm-Message-State: AFuF++lx0HB/a2OkxsyNF7rFvVwyso/NAN3yRxd6N7ylDMC92HW8kDvt
	fNFKaKZrEQ+YCNKmmoWeH1DH64JgmnpucXMWGsvoqKdj+YQyrhgR8B3nrJU+LBDJfI5/52yCiDR
	iIOIyhb+gHWSNS1yii7zuyIH0USjYF/e2QtibdfXy4xWLntuBFAeI2/BfMy9dpzuBjomJQBqZPB
	h1
X-Gm-Gg: AYBFou13d7xoIhORJ6aUAziVxJLlRkf5NQyM67SEjnzp1521JaHYG6uClqBvKNijpxr
	GK5aA2w6Vh6/WwIQZCr1TQ/EKB4c2RP8Rlrmnwy9tY1npekUpxR/wbrCl7y+3uxB7rUAdtW1w1x
	4q3uqQ3j0dDNr3rNx2F12yTBn4npUQ7OMxqqBXL+nFzwdpC871nyyel2tVzRYgmWAKN5DqMC1b/
	oKXldzr3iyeDaXQMc5hVZesAGGcjEfeg92TCHshfTXxMpvsD+gkdvJiUQh/7gY4cevkbD8KX4Br
	L7tfFBuRaHkFzNNYx3RsZgc1U1oeDYkbuSXE+POKjPzTihuRP4xZ7/yOdaDEwd6iK7CYcOdfolz
	qMZ1HmRt8Xrgowm5yVpHr9w==
X-Received: by 2002:a05:620a:1a23:b0:939:9205:4d78 with SMTP id af79cd13be357-93ca9704feemr643090685a.3.1790844162417;
        Thu, 01 Oct 2026 01:42:42 -0700 (PDT)
X-Received: by 2002:a05:620a:1a23:b0:939:9205:4d78 with SMTP id af79cd13be357-93ca9704feemr643088485a.3.1790844161997;
        Thu, 01 Oct 2026 01:42:41 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31c8efb0sm107709866b.23.2026.10.01.01.42.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 01:42:41 -0700 (PDT)
Message-ID: <58c1c4a9-afad-4059-ba81-cdcc92d0c5dd@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 10:42:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: qcom_q6v5_pas: Drop early_boot flag for Nord
 ADSP
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260930020745.1940933-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260930020745.1940933-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfX13omjCmNwqGr
 SUU3SPEUftlvW8B67NU5rA0M+ShAdc6mErBpMeyY7fzwJZIYbaodORuD7SDgMD3bxi/f/4k7Hal
 cPDvuClZaxj+rGXCOFsUeyYoMfMz5fE=
X-Authority-Analysis: v=2.4 cv=OozaWC/t c=1 sm=1 tr=0 ts=6abe1d03 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=IuaHxTfj_tQD0nhE68oA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: BDOdXn99bd4XCuUNlyjCYF0fHdz9rwib
X-Proofpoint-GUID: BDOdXn99bd4XCuUNlyjCYF0fHdz9rwib
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfX60JfkboIMIkG
 XYO0D0td8XJAGViXOhPuJdteInGVjzlzTvAchijgCXKvCOJVCYen4AnfzmyPR1wXyOrDrx17UGy
 X6hcfIOsN9BiXXmgV5CfzomulXk/+160PrgLlF97t0kq3DipFERiJbaOnEH+y/+cnu9EDZ+t5o9
 UpF4ChV81hVZjEJNrYyUKf04Sf5x6Kok9+WgVvYQHHp0bs9tlrOOFj2qlasTriab8jMhJ3wZQ2+
 sqiOWpIbnFqEZBQegJQApWGnDxjtJK+ip/7JePxSqaYdYe7rOYkwhkqfp1jjVrwCHs17Xywk2Y4
 7drKw1ezAhVOqAjRQEyPf1vFXgS16L6eC16Ui2J2NxsJRCVPIzRjqGUOvpr+4TRAGpofZlDgMuT
 LJiifqdRWBV1nCw6eW3Tm09kzbsfWm1TD1UU2GH8k9T8t8fhy14UpnPccJsLf4jDYjvrebr1s1Y
 +SGIw9n8I8B9JuUzoAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010034

On 9/30/26 4:07 AM, Shawn Guo wrote:
> Qualcomm NHLOS team changes XBL for Nord IOT/Embedded variant, leaving
> ADSP to be powered up by Linux remoteproc, so that Nord IQ10 Qualcomm
> Linux (QLI) behavior gets aligned with IQ8/9. Drop early_boot flag from
> Nord ADSP for that purpose.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

What happens if this patch is absent?

When the early_boot path was first introduced I was really hoping
that this behavior could be made unconditional and Linux would
figure out if the rproc may be active by virtue of it sending
back signals or not, unfortunately that hasn't made it into the
tree..

Konrad
