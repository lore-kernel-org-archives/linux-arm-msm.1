Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269441;
	b=p7OsCqYc/7ZUfdRb3Vgae6YWqm/ewHHUkMDXS3QHJhCiPgpn9EIjxWyw30yJDH/ZZJ3G
	 kRGZ3WwCyNOKLdb0fSZCxtlhNCr/CwLBlL0HuWJH5cbp5YUZjtasFnAVXYjwlKjG4k0j1
	 VCg+jgPoFIRY46Ka5dT7Pw0jRc0UzNXV+2thoSNbwSMHLpVcbLTdS+PLk0ALC0PSzrvLT
	 innDIdbTF98oER+h8kP0nApvkTGxpM1b+YPPsP1Euz1MvhJfvCFlyKSkmHiWkDtxMFP+h
	 yYICmsykg+BiJGBhLvVQ9CNwe8+m9nKkKYdqK8Vqk63O/2WTv7B3Yf0cdVTgkcdjG8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269441;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3jMmmstpkrevEgYUZTyeGz93R6TCogBufcXjsgslU68=;
	b=ZrdChSQCWt3t169ALZM4b+rQen2nvUpeRqxP1+oN5TX8uK8747PquK4CCZvM7eb3vPRq
	 AtGeAXb0Et30k4b++IMJxzMdEjutn8AnVNmPnuTkL+g5t/ABWHEvxR5xhP0wGXAYju59U
	 urA9+i+JuSv8p63EuDCSIjJbYpUq0yjtgQf78NFrNDJKY+jCI+3BgJ7CzbbC7k1IH5b4P
	 xV5ZtKZARycVKVcaHKz+mUfej8fOeLl+EveFD/QULzB7t5DruTwLQ2d/NMNK5Rp50SI9C
	 EzJoIgYc66J6Z0ji+eSunueXXIpJR1JsgjF7fVePi2kEz4E+R7rq+UssezDJTpXDNMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CR+jw9IK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RsBvD7Ew;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2558606A329
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 10:24:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2558606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CR+jw9IK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RsBvD7Ew
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TA3jQa3607048
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 10:24:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3jMmmstpkrevEgYUZTyeGz93
	R6TCogBufcXjsgslU68=; b=CR+jw9IKD8EvIIAOhBteoElscKIOWIfZ5np7FCjz
	ZwGrfTXKkp/KbFTepG/F/6pbw2dCYuUTenFxBavW/t0UqbI4DPzgpU08ITwpHE9I
	vtRCkDk77kqubMta6GOEN7sj0JIe1cAakJSzlv6JvvRf6LMToswOlJIJFPspJTF+
	i0X8O2OJvXKaqDwfOuPo+LSvqmZ+VLmiJOkDQ67bLLR+vs9ZpNVeGUJsk/5uxrpl
	bwRK/b50n1tObp7F2uba2Ce7P1K0aDQfw178cYRtmSLSVBHKjDd/wDZbPPYHHA4P
	aZzUeP9WcI/jal/eiFFP5VqvmegsiosLFlCf91WfczXnGg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm42fg2b5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 10:23:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93c5ab5c136so298946085a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 03:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793269439; x=1793874239; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3jMmmstpkrevEgYUZTyeGz93R6TCogBufcXjsgslU68=;
        b=RsBvD7EwzM3faihsTviiqWjI2Am0g1HHWB020McugFXvfdwJ3fvR2MbhsGf15mx3KV
         uXe36StxuIK7o3wXsNWHfUM307id8oeradrAuYRDZueVZPbngTKotdEI/oHhwHy68heU
         qTwD/3ToOsaIk2JeVzL5WiD0iEerPrqti78GlBiDUSnYyGxoq7ecsb/z4Zj4j4LGlXhZ
         q+iA4JnsiP54W8jrJOiG76AbuS62ztgcfPiYBUHnHdLS/X5DDX5h1d710GySDy3bQzKV
         rMr9ocqgGantr6CODiksUKsZMOjPZxf9pYmr1p3C1Gm3jhdKwUVCv7dg8N8hMHLdOaWO
         7pVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269439; x=1793874239;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3jMmmstpkrevEgYUZTyeGz93R6TCogBufcXjsgslU68=;
        b=MIAjLzwhkOhw74ZVcKqAUu5hADx41mJvlQhPJ7FQ5ewwtX57spov9Upja/jtWwGoQJ
         U53faGwYU4vYOgxduBfHuoid0NhwaK6xQE3ke9ON/dMwk542komJKot8d0JSGyVwk1oX
         AHOrw25SWioXHvg7ztHlhcrO5+XlpfurIdEa6cFx7lAbxsviGi/scVeYsH//1OCEKjIH
         PET/4ZgCukFXSw/B2U8UzNEUVXC36D0rwbU2rCCIC5YhzpXp5JpdqiannhPdYYeXwNtW
         Jo98FeCqxVaePBUxQrw5pdnZJ3lLxHP8Xl7xVpwVgj9ZFxvTdNIiK7CwSCQqzqTCZrWk
         CEOw==
X-Forwarded-Encrypted: i=1; AKwUvByCEcz3sdKc+l5kTsguNIFZfae0HRGlhbzS4MzHgpYmpWGMIwDUd4R0Oqaaly5eX1OsjVB7iQziY6QRcYiA@vger.kernel.org
X-Gm-Message-State: AFq9FYLvr+siGOe9ftGVSq83UzqwVGqtd8G0mlCvMeBW305i6W6sGx9j
	EZnjGzF93RoF0SNgPygKXG7fAITiBXC0p3oW9EkNb2sjfLf0hyEzjWhx1H0SNbRSFurza09YcZV
	tdTPk1Nz8r3p9SA5zty1LxyBlEKN2cYHXtejoC3TtPXFerSibU+lzD+UA2SZL+WKaFcf6
X-Gm-Gg: AYBFou024uPKzxTkWe5tkKPxvgigKLUzySAMYF7hjgBfz0xSYZBvfBdENv6fb44ldzL
	4bLD+bLBlbASI8oJLxZY/p9a5UwVtkT18VQAWCOqY6H5OEDhDltXL/VCAE18Z7+WAY3XQSwynDy
	B14vhJ0LAWY/+f6/8ZHNNSpEuihzRrA1T9ha9+ymllqiKdzqQguP331e0HsdFAOKBAEUS76jm2z
	1xVuIi+TU4yUacEopOV56cgHS05LPX1d4Fw312Yt8U0pBMPXLwTZ57oPmRh9eLtDZsY2AykMwV4
	lluU40vudNtSFsCRC+V6U9oa/6bvpC27Vi+XcQrqTEV4GYoKYLibyiX7tpGOukUkTCaTofQkeU5
	JSepLtNyr62s41xEcHDo8ix4a8nLc2Wcff9scUNJ8MKTEAJxMPi1+qRRDLU5p1mMn
X-Received: by 2002:a05:620a:28d0:b0:93f:2b65:f47 with SMTP id af79cd13be357-94408cb5c69mr730115185a.25.1793269438995;
        Thu, 29 Oct 2026 03:23:58 -0700 (PDT)
X-Received: by 2002:a05:620a:28d0:b0:93f:2b65:f47 with SMTP id af79cd13be357-94408cb5c69mr730109985a.25.1793269438371;
        Thu, 29 Oct 2026 03:23:58 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm12399755e9.12.2026.10.29.03.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:23:57 -0700 (PDT)
Date: Thu, 29 Oct 2026 12:23:54 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v27 08/10] arm64: dts: qcom: Add psci reboot-modes for
 lemans boards
Message-ID: <337wsyqgnma3l6xi3xarj3ed5wwxweuf45vq3k64igjgufszlj@gnb4zg3j27ml>
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
 <20261029-arm-psci-system_reset2-vendor-reboots-v27-8-fa4b3ff1359b@oss.qualcomm.com>
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
In-Reply-To: <20261029-arm-psci-system_reset2-vendor-reboots-v27-8-fa4b3ff1359b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0MCBTYWx0ZWRfX8RQK3HQTFN1u
 O8aU717+bsMiJORDkB4RSQV7e8Njjjq6+HcDYw+OE0pESMHRFTQHtIOhaXBWae9xUyEG9R58lDu
 pI+UGreldC/2ouHu91MOYXydEP4l+1lPTnSDjWKxu7GKoE7dGrni2QDWSy1fGz/JMIzycgS69+5
 91uQzqUS98b076bItCVa/zZTq8K2f3Zoi18X56CRsa9LY49QhIxnltizcMYuvV0Zw6duK+fbN7U
 3XSisH5Cf6f4m2F71wPdlpdstPCcyR5rN0ShDqkFzaNyC6mitwSkJZJTN27TOmnSD4zwkMQoncZ
 xBYm2pQg3tXz6ZqGBpn/NSdN6aqGpdL08FMB+7exWhefppG6spGdRfZecDFTUriOsYEawd7ZND6
 z73UPYxEi4vmY5PuLyLNap5/Wh9afLEzpZVpqEDCHbI0P5XJK2F2CIQ6KG3miRGjnvBGftsVs/q
 46nYZXPJT7pM4SMg8Tw==
X-Proofpoint-GUID: kHKc17NEHwdcOS-v0ksXnzlPZ87mLiSa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0MCBTYWx0ZWRfX5Jcawf0Kk27G
 Vi3BA/Qtp09+r0TGF8l9WBS1edkqzRXxrbs2zPobivqHGL1xA/hx00pyIDPRKgaIpn+lpiwKODf
 1/dP0EW3FQyCGxwnZZ9bMZK6i5IOHxg=
X-Authority-Analysis: v=2.4 cv=UN9Ijyfy c=1 sm=1 tr=0 ts=6ae31ebf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=shUxFSsEnBkLoNWfsCEA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: kHKc17NEHwdcOS-v0ksXnzlPZ87mLiSa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290040

On 26-10-29 14:31:02, Shivendra Pratap wrote:
> Add PSCI SYSTEM_RESET2 reboot-modes for lemans-evk and
> lemans-ride-common(sa8775p-ride, sa8775p-ride-r3, qcs9100-ride,
> qcs9100-ride-r3) for use by the psci-reboot-mode driver.
> 
> The following modes are defined:
> - bootloader: reboot into fastboot mode for fastboot flashing.
> - edl: reboot into emergency download mode for image loading via
>   the Firehose protocol.
> 
> Support for these modes is firmware dependent.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
