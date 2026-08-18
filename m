Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643683A6F1C
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787048246; cv=none; b=htuI8MoHMM/1zjzKuNmGQRUaSrvmvTVY2bf7cXAtFkVvBUoyctwi5ROdakQZH7yePuqwgpqk8y7JJRc3vDMmbpdVYus1gjGwFrndV65U5YtFiPaDs2w6n7m8324UQhU1bEBbDKadTVjg2jpzDcbPg2edexUk28wzrVIQ3tZDTKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787048246; c=relaxed/simple;
	bh=3La5q+t6nGhdvaDUpaFeU9Yyua8qQeYslPh1H+AySuk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pUNp2fUaXM16Qhdsp7ZZhAIXWDr8sWF7UcZ7bnB4VXk8kRykZ3E28JKjEgR0V0yeYaptyI0KfGZTynV0K95Y3LBm5YJwGm6qd5JtGeb/0u+Hfe+sPzxjBAnEWaqNVnpsG5JBRZMKb/QvvSAedgCWuJ4dU04pNI+8l51Z0My3APk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kEN7wH9S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vx5CtWa1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kEN7wH9S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vx5CtWa1"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABeTC820089
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:17:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0eZmZ6af1TsFSeP69im9Q9imlxUhyA4Ib8fV+99bbJ4=; b=kEN7wH9SygKAtVlr
	49XlQ8Dz9TRX7SfcXJzIJFs9ktAy8YMJh64iueMoc6t8DzPiUc47PlTpBTFeHafi
	YmSGpXwQe+e4AEuVFfGT5cxlXDruxZUZtBypx1tmzGg0hdlUWRUyBlsZCFaOv0ok
	k3AdSk6oZy7Sk7dDH14B6GtZFy+0QQDneeB+xx2ptPt0NF2GrnGKtjHTlGPPol3O
	Bra05fsSaJ9Jnn6kFcm+n/nr8ax3J7lMAI2j0Id0zHixK1vxFZFVhtjmDdP9V12B
	0oV8/QOomZHF0hYynxseEuBATAz4pGhbHp34lY8m36Jo8MBMgHa0GECcC+QVhsHO
	APAkbg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4g2p1fy5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:17:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930a312222dso28217085a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 03:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787048241; x=1787653041; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0eZmZ6af1TsFSeP69im9Q9imlxUhyA4Ib8fV+99bbJ4=;
        b=Vx5CtWa1dwmNSSX+5ESjVkFADPcu0AnfC3RgDWoMoTutmhYtIIJz7WNErI7a9cXeAA
         vAZtbsFQO69K4N7YEnn6oY/TMgu+wr65SimhWa4vFMfvyODZxyxq6YCDg8Vie7hkfClF
         ui+cAuiB9RNe7TkE1wmull5EZqUF0wnDTe9ybWpcjZ60besxfEEK6tQ4SVXtP97UBiWc
         FMylWfSL1vxX/2EAyOA0iTnhEG/PKPL8s7HxmJeVRDVI6BIxCiAAlP6bPMrOTpQC1MM7
         p+NNoiej40haySiFIUcAvw9ysWOZZEtjbnK9on7hUOJdaOJSX7LOEYUbRqM2+/Pbntga
         c2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787048241; x=1787653041;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0eZmZ6af1TsFSeP69im9Q9imlxUhyA4Ib8fV+99bbJ4=;
        b=ZGe/mhzxzunCqPRKRyr7+hH5KYa0NDBkzvRuvG7VntKoCXQ90ruqPNe3Pe6mJL3gIZ
         D/8adkKMGjLpSxLNxqBPMgqHFOw+98j+unMl1A4BZaZBS1+Yo2DA4L621/E5aa5/rlT/
         GDh/3/J4LeN2JwcgYH1ZfwYEdryQ4vRJbUDPyF9tFgehG25oWRSwyTsWqMhoSCsg3N/C
         /D/rhC3ateQsseTCJDglw4lMURkmvwj2u3IvReWf2ipJIvcCGEk+w3myT/TKOe2/+AOq
         I3JYmfKDTf55YcEPq73E9M0KDw6mi2tPugz9FyD0KmTxyii1SJl1IfWKNLm0wfJLM05/
         Vzew==
X-Forwarded-Encrypted: i=1; AHgh+RpLbDmcrNWwGSPt444hiGz8Fhdg8W+fMkE+PwmtXKgp3WbgbkQmJIVYPtH5ziwxbtdRNOF90+WaWspJZ7ou@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu9ZzPpAPjwMKrMUr3nm0lL+BsFC0gBAuvprwlvqtA5UksU2GV
	wiiXPk5PzOD1vvSr12cCYiUtE7Ke5E3G7NnchzzHaaLuuAxXlWr5mbGfg1G47ZbYWxnGeYjWMR4
	ZExwdZvzyGa1Rbl/TWUDDqzSodRKNR5S3xMU7TQW3pCsIqG1fcyqjdI8/LrrV9bYEsfRp
X-Gm-Gg: AR+sD12paYjKlhz847pRRdHOycWXmTselflL70v1voUPFLrRljjfJue0Me/2mjHoMOV
	R4QTm7Mdvw3btD/IDbSMvab1kqyR8QnO2JN9hWnchLiZQQMl/U/X1asDiqSyyxMRfnU1A39IzLu
	3Rhrs0FoopgksYOwGtoBXVL2WwKSjBiOY6y+b83bVqYeUGdNUCyoxqge7adWpizgl/oKsBEVAHo
	foMQ7FRYDlw1feIKbV0ggRK2xDqLyBLDjQ2Pdvs/BxcgGioGgPBhYB2GoyPlieA0aAIqleL5H7y
	hulNJGFKcKD8JsoD6732OJt3ijjLgqWg5ycf5/1S8fTYmDRmQRA7OP706Q32mVNtArENHLRwynd
	QXlw9ZOq3SLixQrobK3oU3KMi
X-Received: by 2002:a05:620a:800f:b0:936:5ad0:fdae with SMTP id af79cd13be357-936d23c8621mr2530518285a.4.1787048241552;
        Tue, 18 Aug 2026 03:17:21 -0700 (PDT)
X-Received: by 2002:a05:620a:800f:b0:936:5ad0:fdae with SMTP id af79cd13be357-936d23c8621mr2530514485a.4.1787048241143;
        Tue, 18 Aug 2026 03:17:21 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217ff7e231sm164193566b.20.2026.08.18.03.17.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 03:17:20 -0700 (PDT)
Message-ID: <f569cf08-408f-425b-acb5-3d56fc534573@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 12:17:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] ARM: dts: qcom: apq8074-dragonboard: enable the
 HSIC host
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xu Yang
 <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Peter Chen <peter.chen@kernel.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Stephen Boyd <stephen.boyd@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, Greg Kroah-Hartman <gregkh@suse.de>,
        Peter Chen <peter.chen@nxp.com>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
 <20260810-msm8974-usb-hsic-v1-10-e5f93ea76ffa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb-hsic-v1-10-e5f93ea76ffa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nzZFvtOO6OJSJaHPCpE-mIjTWukGb1z5
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3NCBTYWx0ZWRfX3j7tsa2x3Qzc
 HZQGOkBW8y9BhDKOsH1DwgiOVBFA4hnKKNTRgJc24n7CU/8mYLUavcjMif3ID8ayqgZeQm4p3hB
 AefHibGrQdNfoh5gmjN5BqV3QAeteYQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3NCBTYWx0ZWRfX/qSbJmQJY6ix
 oxA6jRNGN3AssjG4FC8+NmmXGt9NBiHYW9YwWw0XiSec9ISQsOHkjeNTQVNr7Tst/87Y15xlaUV
 8P+Th6H0jOqumnDtkc4Uy0dmI/vGzQYDHkd7XTlbBjgtfXvj9XU0HZvVU4QveM2N059HgpR3Uzo
 LCFGMfH+rMX7dGfKjtgymqfEUWuHap08K7ApcNzjQyAth1a4wmWMBWmEACOBBEtoPA8dMkuQsN0
 BeYYLHaaLjatg95hTORS5LnhAglLbaOhliYtT4IlmqBtk5YiUuhwVbzyNBziOAHHZH+tqnmJuRE
 B6XrZoLccJNL+y84hLo+AOWK/GUPQ0Dhb5vH+pCsqfLIvikztfGFKJmPdAjd8GM4obdHgrfDK/F
 zMDfdSQjBRI8e+eztUG2zVmJmhCPKvDLv3qn3JQlygeuUp0Bpkb4LLfTlQgT+ERlJa8ToDlxIjc
 5+idC5vR4+Je6rlLSgA==
X-Proofpoint-ORIG-GUID: nzZFvtOO6OJSJaHPCpE-mIjTWukGb1z5
X-Authority-Analysis: v=2.4 cv=bfRbluPB c=1 sm=1 tr=0 ts=6a843132 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=fR8JJq69IY22NewaCa4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180074

On 8/10/26 5:42 PM, Dmitry Baryshkov wrote:
> The dragonboard carries an SMSC USB4604 HSIC hub, but with the HSIC
> controller undescribed the whole HSIC-attached part of the board is
> dead.
> 
> Enable the HSIC controller. The USB4604 hub isn't controllable through
> the I2C because of the board design issues, so reference it as a simple
> USB device, describing the reset line.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
