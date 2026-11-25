Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795599026;
	b=RkNLy7o+14rtpoMfofbBDaXJIg0DP0ZP/X3tzyEk/yRIpaQ/bFu+b1c0Rv3hXw7YpR/T
	 p2mrRe7RKf9reWQAwKH65PvSo2TnHsD1QaUIYDfL2C/P2m6ZoL41UG1YDIRRL/XRNW6en
	 2cgSW0Nrx7SHJ7dBX82jDHu/NhIVpT/z3b8efPQjpTR2Z/YNi6XKc/p2zEwCYK5yMFx7e
	 +1jUWLSeTpeX3AZ8Rt1A93JA91YjFRMUoqM0uaVhWtpr8au8XkgZ4BM9c952797eePCBU
	 wwHQyoT/aYYn1n+JWbbFQ6DLD3WHxCWllWIfRJAWv/lrvYSXVLn8IubluJl6hltGBSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599026;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cMF8AgDnGajgqsL/XKmOeeqWWFeYelvrpbA+S49mnc4=;
	b=NEmbqDuSHmb7mnQgceWQLJSQOscLfuu5UdC5B8PBFcrLnfjMJFba61yQblCCrQTKGpWF
	 rSdBPddyCmsRuWdLzs+bKaN8ES/TEukim2UJKqaZLohhQVyEU4RVTU5bMF+bg2maUpqh8
	 F2DH+nJI7Shydg+KEbl+8ZJNnIj3KDl5/f7ObMhxc2J1zjsxPPbx9tXerkh+wMXrpQQUc
	 6A6qHoq6ZGh9sOQ4xMs2/IT1X71shGVizxg4DssHx7vcupctUuZp1Q7PzED2CI5XemSU5
	 gNClnomrrf3CmrLJRQaXijtmN1luOb1NWdz/Gw5L+SSOj3JmdgrNMHNfSOz5I6u4QKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SLTWBrfA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GuRk2R9D;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27459606A327
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:30:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27459606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SLTWBrfA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GuRk2R9D
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68Xeq299998
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:30:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cMF8AgDnGajgqsL/XKmOeeqW
	WFeYelvrpbA+S49mnc4=; b=SLTWBrfAjL+AhhBnNSNdJoCcl3OjCwoZmueEiR4S
	wv1I9ME+zUa2DLwQ0rEFh8ltUturc3vK1NqNxErYyoshKLHtsgbZo+UI6RJ9CnYR
	2XOfOeMtzVJpFHn8Yjk3gyWO3B5uWSlKF/5v0nhCE6i0R4eEGaCceSZK0D3IfSCs
	1w6Xbvcm1iABubcTp4KGrCJ3IwqvBpJZ7LRlXUC+uuW4ef8V/AT/zV120YLma7Hn
	KS7knVatp2lVxNDSJz9bVDfWl78+qaKLiYjZxYuE98RVjiVzSq8aoV6321QKkUcM
	+HOaZBehr2X0UpHSi2N9Qk9vsWTl2uELzhHLFYutwszqhw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5n6rsy08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:30:25 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b55f4f3bb8so3158432c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 01:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795599025; x=1796203825; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cMF8AgDnGajgqsL/XKmOeeqWWFeYelvrpbA+S49mnc4=;
        b=GuRk2R9DhZFoT8kIekTrRRRPSJbClqcmRCHM1OR5urozasXzx1ufxixdlcBcV57dWq
         A9TKI6mvPTVDlDqsM79C8237X0bllFJhsQp0x28Bn2SlwX3ahYCKddpunnntQRj/wAsB
         LBFH5NbziwO0ZX4PlN1mSmTlxJOt9zXYClhLUkHdP/nQLhNUWNmEtUemC1Y9C4+hE2Qj
         xXqNJ1w3NrKDLSRw2+qwsYfk+jy/ljXKS+7ItVQFUJ1pe8ir6e8cS4wUCRbTPx3Fg4vZ
         GsveoKPQriwZO317pPgLJREdrExx+JA0Z4H751ofQ2QhPqXrMa1GZIfk/ryV4vgAsAFA
         R7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795599025; x=1796203825;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cMF8AgDnGajgqsL/XKmOeeqWWFeYelvrpbA+S49mnc4=;
        b=gjCZ0UQYGtSkyo7x+mOrgnF4Xb41wryq/fhUppktyzAbcp66JhALracurV5oFLQQFG
         rYeo2xg/5soPs5dYpJfbhdxNpgV++aOxKkMTS5TA/pDJVFooj6gbcw2L70xUYEmkoYAH
         5gUPuZYKtqexVgL8XmwOKNWukGYdQWpwDbx2TGVNU+Z/L0wRDRCXvnLmBnneliHZrIhh
         FmRSkEyTeUNJRW39VVZdHzVUUklefQ5lbGlFebK19hvzkOgNAqUA3Nch9hRMoFUMyBe1
         pXyQpf2fZ2q9t6pEoR9cTdC8joGBS3SvLAx+FCdxchyEI3OcuzZyzbn9/9a0ICf07PsD
         tevA==
X-Forwarded-Encrypted: i=1; AL+hErH3Po9bMJRACRYydSP3e8l3xgTwETuJvDq5+Nc5omneiunocITuRaKaTeWqtw3K1aTEVj6uM6rFU3WOVMAo@vger.kernel.org
X-Gm-Message-State: APuU4Z8sYnZmDHCC+Qr8hSTDCVjqUI2h28j35UsmBvdUgXl79L8Yl1mV
	0mg4dqN3HJWuCym0XJthqZ7jo1JRXzNIZhoVTLn8ZdpUqZG4SD0o35i1WR910keYF8OpfSVixWr
	vLoBiYcWnrJFdkB/NkVXiqIQ5+N75qShlMcyxJCgMDHEavoQHj96/oWZIPb6/2sxSlWWc
X-Gm-Gg: AZFdTZfSELos/2DNpHqvzEm3ViEZQZxB9TBtoxWocWhdltp3u8/cMSiZ434QGB+GjXo
	TKUvPIxRiJQWQf0N3+J68BPN+Fca3CISwb5LuZlgayJWYBzdie9ikngLE05cbhs8ge5zcWO+2gP
	oIO0NN6agJkuhaWVki5z5V7Hg3feHpKqTQU4ETzYjzOA/47Qs4ilAP5ih1TQPRv9lj7ospqEovb
	ccD7U7metOr7Plqoewagj8VyS7+ilXyc4y76JwV0htS3I8iKW8wNDpViMTsAC9z2bBzRsvsthGg
	XYIpWNv+iqVmtipr0nOtr+4jlpnxxEjYhg6qiI/TbXUW9/NfNH3NeO97KcntsIhX3hMZHCpxtXY
	viiWQaNgqKwtWrON4GIpjMlqDz7SNKMXvO3yzaCvDSgenN2vcV5g/N+aGjwyY4o3ZrfYvcDYeeC
	/vay/HYAsnfmK6WPa4E3TbDdw=
X-Received: by 2002:a05:701b:4193:10b0:144:eaa7:2763 with SMTP id a92af1059eb24-1b55689a0fcmr18649565c88.16.1795599024475;
        Wed, 25 Nov 2026 01:30:24 -0800 (PST)
X-Received: by 2002:a05:701b:4193:10b0:144:eaa7:2763 with SMTP id a92af1059eb24-1b55689a0fcmr18649537c88.16.1795599023960;
        Wed, 25 Nov 2026 01:30:23 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385c6830815sm46753868eec.20.2026.11.25.01.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:30:23 -0800 (PST)
Date: Wed, 25 Nov 2026 01:30:21 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Prashanth K <prashanth.k@oss.qualcomm.com>,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        "cros-qcom-dts-watchers@chromium.org" <cros-qcom-dts-watchers@chromium.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/1] usb: dwc3: qcom: Keep wakeup option default off
Message-ID: <awaqrbU1n-40XQ5G@hu-petche-lv.qualcomm.com>
References: <20261110092157.2989350-1-peter.chen@oss.qualcomm.com>
 <avUMs981FKk7Kr3a@vbox>
 <avV0Y5dLG0HOD1ny@hu-petche-lv.qualcomm.com>
 <awT8VH-ZccQXmw-G@vbox>
 <awZoaJ6Wlfuxvuit@hu-petche-lv.qualcomm.com>
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
In-Reply-To: <awZoaJ6Wlfuxvuit@hu-petche-lv.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNyBTYWx0ZWRfXyGN7vp9G16xf
 zC2cQz9G6Af2bjjZ2wPzjVLZmYr7v3KAE23wCXRVDOsmLxpqQBPU0xXYZ7MexIrdrphOo6tLKmb
 zmVWFO2xVvlhVvtE0jh+HCCmYIyyJQTdycOsBD3xqpAClTb8DrBtgv8YOEPttqbvfYIiqpEs03M
 G8jN4z71fYMq631gQmSWULcbvqd0nWX5TxgoZofT9A5q+oZhy4XU53PuVxKDyDVk92IgAx7EAEB
 bJmsJerXBR8nXQ4/zDDQjcCzhyIrKMIYDmU9lscsnW4bou+9AriBydxjiqkWiMLsL7T8f0RS1LF
 oP/RSTvTkv2vnP6XxVZkS61MxuKjALQaCNA5FbAXCPnelMIh0oDGMkIlA4oevPONowHNNEA7uIV
 PZu73128U0s/u1aE6tP4StEe1sQGMkqtkkXCe46akqBqfymlwxw4Y+zzDWZG4nJfxHahpTEKRQw
 u/9IN39YVwE4DG4FKWw==
X-Authority-Analysis: v=2.4 cv=Voa2kO2n c=1 sm=1 tr=0 ts=6b06aab1 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=yfwHPf6EdPLVZ9QPc6AA:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: RDXFcHeUmBXGbLfk66lH0_k0JpN9kqeh
X-Proofpoint-ORIG-GUID: RDXFcHeUmBXGbLfk66lH0_k0JpN9kqeh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNyBTYWx0ZWRfX9UYRhnH39TaY
 EloScdtgRQfu6sKAI51bggnLAVGfmR3K5iFiGzKbHQKhGuVMcGFxTYqiJf0Ap9lqnQ6UjG33G7O
 RNrH14aiqSK4uF3xk53amE30jp7Fgiw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250037

On 26-11-24 20:47:36, Peter Chen wrote:
> > Which other platforms can you test? I'm fine with the change if it's
> > tested enough across platforms, or if the affected platforms have a way
> > to keep the current default.
> > 
> 
> There are 10+ SoCs enable USB wakeup default on for Qcom, I think it is
> hard for without function regression we keep PHY off during the suspend,
> although it also should be fixed. Let's see Bjorn's opinion?
> 

One wakeup disabled failure has reported and fixed [1]

[1]: https://lore.kernel.org/r/20261112141512.1840-1-26rote@gmail.com

-- 

Thanks,
Peter Chen
