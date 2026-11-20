Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169352;
	b=fWXoTrpNDjecldhJ2H4lvDeH7TPbLsAqWc9YvzHKwGebjPkFQvGxXbUs2cHg1m+QP3NS
	 lu5uXP5UD3L+mogC5A+AXRtZgL3dxCwtGLfwMa3QAk+nQt6xTfcYXNHXPIER2VzwDYtW/
	 m84ecKK4sN9Ulg2jir7uWGIUkgU6FFlTwYxnxhV/39xpwtN/Jf4S8GvZ9eeD3mWvzGAqX
	 HYSNjWyi7SRfTLKUmlKDom5GJZGqDt9ES5aKe+ZAwVKZvo0Zr/Y7NJfcdc73e0VEiRlbR
	 qlyCEb7BTDxR+Q1eLsb8Wl64yfyHRXN+cfIzLdbushdMAxktVz65LXJJMdpR5gm/9Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169352;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xosECkvOuZ/563n8Xxgz2gyDsJH59waH8UsNshqhV4s=;
	b=R7khynYHkzQuOy5Empz4e1SbFLxb4jRExZYqkNtVgB7Kdg88uEgz7/RvWEC8XopWY+bD
	 HQhXHZsioiTaMEeSr33TSMjHc1AvM3hfZ7YWJSWYeSH4YqW/w9RwXnGq36iCXFolREbDG
	 g4gPRO/GHyfUFASN3IPAbs6ovAwg0cUjn+atY3MMv38IOIgkCZxN7opiQ4ib79uZNEPB3
	 +4PQrMZ0lg1GXhjazIIiAUzF2SWMKudIV58t3G6NWZwRLgsYnxKH4ntR+Bgji13/Rqzmo
	 w493I878Hy7/3dWxPiwEE2cbQ5x4cil97dGkjLJTR2mQ17aQu6eapPs44TgiH//tbaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HBV87Y8i;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WgXHO74m;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5D5606A32C
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:09:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B5D5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HBV87Y8i;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WgXHO74m
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7frd22695565
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xosECkvOuZ/563n8Xxgz2gyD
	sJH59waH8UsNshqhV4s=; b=HBV87Y8iA19w95VMXvBhisXc7CBbCY/9XV5ndlQW
	5pHzxWPk2SX5g7G0UwSYAgTfAW3bm/zZKy0Auw9lpGl3tBd4NWYjH2F2EFJua1aZ
	AObNGfX9l8lktP5X+tFN9CRAeNytHQBdgHU9iSJJPDTuy7rMMJmJ0l6nVvmnC4Rc
	mLCDb5JZKJMPj9uSYHvIQWJXkEGBIzhukomEr2ShJjxTuUXi2ZdvHXoir3IJcQ8L
	K2v8EYWm4goWmnNGT8gCo0QU8j2vxEzS3bwlfW9KGlmZb1x3APQ6rLzHTDgqdH23
	60DbW/+hF69FcPkS/kyyPWrDTEKv3Gl8Qq/BPeL3Orv6UQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27au350b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:09:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844cb60so139881185a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 02:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795169350; x=1795774150; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xosECkvOuZ/563n8Xxgz2gyDsJH59waH8UsNshqhV4s=;
        b=WgXHO74m1uR46QkdPOO9EpJbTHBWy45ZonesB4l+2OSBKpEYyVXChClj6kNIZlua9w
         1f6BGCkkXNM5zSSolEQBYw6xeBcc96tZRmUHtd/7zJciFjx+vomTWBILrTROnbIEac0v
         biR7N6kRLucVImAa9QaOJLjl52e5UdQCyb+14x1Qm5DwODIclF/fT1hEBV54AbDzzfko
         +QUXW8niMkMT6k6wnXssGDFw7yT8VZsLLRLyDrhegU28MXwSOT1j5fbmOsvpbqkt+Xm6
         U0Dnj3HmZ+lNjv8T/AtdKJXhsxiNxuhhQsvRKuV4oBniKE3m9n+qU/PiNhy+UbHEqrBL
         QybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169350; x=1795774150;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xosECkvOuZ/563n8Xxgz2gyDsJH59waH8UsNshqhV4s=;
        b=l9Tbvl9au+pTK77aslCp7TrqhBy2KxgFmRbLAJi0a41DY72MCfM4f8kUGuFU3l6/j3
         eDlzNn4Rlr7WKdKVM9I55ovP9aloJ2z2rKmVElFIMEdKmUxlzc+qvd1dhWkV7OSo7qqp
         EsmHvHpEOcEFM2aCUHg3LzBMkVuoa/USMgII8mfnW1ebthiJsD7D0kD+ME2Ng2DR0YNT
         JnGhwk5G5TLYkgcthWBgQfwIinmEnT9BaclFFDyXOf7FzaS2Z7WG89YIC9QzMlFVq2XP
         hf6tBxh4kz8g6louasbSb5IchBfcuNiqgJBoML2GCHHdGdfzg87xKSnQdCfd6wf7pveP
         +wmw==
X-Forwarded-Encrypted: i=1; AL+hErGGDXbW5fharogl5mwgPGco/jZX03Q1UBJcPxspKkIQJtVcX3pWCXXCxQSswRebUs9Xfvit30v8AomZqhDq@vger.kernel.org
X-Gm-Message-State: APuU4Z/lNmAd7G7L/MvAV7o9sXGGhozoGQyxqeuSHjAgW8RRHjMKz/oU
	edyKWGfEoUVmVBkh5qoUr7Y1XcF3z7cLvywiASgY9tzshPWH0zkTI/bQcmmz5ITLr+n1JLAjH6q
	yNHL/9V3hEu5lEd4tkAJrAQzKR7Dqr7ol13g1yDpQ/ItJBXs40iiCZSIJ3dmIYlGA2dD+
X-Gm-Gg: AYBFou3UyAxs6Mml54VXzpJD/xWr3mP7Re6AAO860w37DPFJeFRCeoW8dA1/CyccGpW
	jFitHJOTs9rg7QfXXok9V2O83/rW+YcLMRv5oNzbV/0UbXqH8iOb7pCSYG2yn/YA/2NGhSZD6dF
	Y/+N3oYl8/wje11Zu6BdkbRgV3N1lgraAStSRMO2Cm4rATOjCHRqDQhxOo/Nconz7CD9zpMSNrJ
	zZsGXAjr5FjPiVheeawMIKusk5ZDpFeUXEmXTcoBON/QJ1h/uXjnXup7L3FaJ7ENQg0Wz7H3LeR
	jJGKZKYZ1OVI7p6OXUUX1Hhi5zTmVP6+K+3Yo7Utz0MwNBcptMMRSpjVRnZoG+I+B6KneqW+8VP
	lZ5mB1vIb41ysHpi6BK+AVdkR/hGAF2c0RXy3Q7FPxyxtShQAYEP6u/FiXGfsnvUw
X-Received: by 2002:a05:620a:1a09:b0:93f:22af:ccdc with SMTP id af79cd13be357-949b340223bmr618411785a.4.1795169350003;
        Fri, 20 Nov 2026 02:09:10 -0800 (PST)
X-Received: by 2002:a05:620a:1a09:b0:93f:22af:ccdc with SMTP id af79cd13be357-949b340223bmr618408885a.4.1795169349463;
        Fri, 20 Nov 2026 02:09:09 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm4714314f8f.16.2026.11.20.02.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:09:08 -0800 (PST)
Date: Fri, 20 Nov 2026 12:09:07 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-shikra: Use retention for USB power
 domains
Message-ID: <yxdwoaan2qd7pwe7ueyxur4nu7zr4fjxix4blqr6qwbw3razg4@si6qol36qa5r>
References: <20261117170854.3257471-1-akash.kumar@oss.qualcomm.com>
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
In-Reply-To: <20261117170854.3257471-1-akash.kumar@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MCBTYWx0ZWRfX2+rmOWawK8KR
 igZx9vjqUcsCIawJl7HArw+i8gcbHYJvitUYXeqGI6HzcJ9+DnltZcYeHYkqcE2gfv8m979sz2i
 EEqyEcTAp92TppMQCFHjGWNJ6a9CV/VQRuertqDE6mC8hNH4nX1J3oaUQ8h7mrthfOuGD3XAS6B
 PtDaKQIa10lZ1h/P3yFPFwDv1b9XH0Hht3ygTgUeI1IqrrGBotqXkvxTuSVnL/DVb6pGWnTuP3a
 zvWszq/egFxekc+EXvAwplrh5dEJ7bndNCPhU2tILGWothjzcsuyuP4BFcT+LVHPpHvLwOTgVzs
 lK6iMdajsZ7N/4VIk8nUSpxmPGhzX9K6g0ZHNsmn6gNr33nlHu6ivbx5EbTZcfXtXPlYLEWbCOv
 OhcgDjVp0HVxuGI59WMnSGb+ZASzLFywaUJ3KAdG1/3N/yfjhdVxdobiCuMzSHQgS2KeKGjr9HN
 q/2aAn+ByrZISL2NiCQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MCBTYWx0ZWRfX1MvRYSmxyHl/
 WEP8LvBb4ukCdbY4P/0PFStMb8WoJUWc+hgXxQRQ3Ku19yeVozZPUyXQ/zIOVkM+Cad8zmekfa4
 l2Q3bT5u1hz57TPEG3pqx/unAh3La/0=
X-Proofpoint-ORIG-GUID: Z0mOrOw746KRynzIosZnCGZvy1Qi1grO
X-Proofpoint-GUID: Z0mOrOw746KRynzIosZnCGZvy1Qi1grO
X-Authority-Analysis: v=2.4 cv=KuHYSmWN c=1 sm=1 tr=0 ts=6b001c46 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=qsmAfw9a2cmmedO3nsUA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200040

On 26-11-17 22:38:30, Akash Kumar wrote:
> The USB subsystem does not expect to lose its state on suspend:
> 
>   xhci-hcd xhci-hcd.1.auto: xHC error in resume, USBSTS 0x401, Reinit
>   usb usb1: root hub lost power or was reset
> 
> To maintain state during suspend, the relevant GDSCs need to stay in
> retention mode, like they do on other similar SoCs. Change the mode to
> PWRSTS_RET_ON to fix.
> 
> Fixes: 01cf3e27824d ("clk: qcom: Add Global clock controller support on Qualcomm Shikra SoC")
> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
