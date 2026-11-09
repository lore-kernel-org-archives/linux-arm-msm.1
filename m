Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794238881;
	b=Pp7/UpWe+AQRVGHmC5em+MX2/ByFRi10NYIKMorFN8mtoukiHt0YK4YlUeqxhuixsDzT
	 i2j7Gh48zA+XYY9/L/906mDGV2T/VPdai9CVlIWlLG4J8qPjlg4K3v/YIH2mYX6fFjRU8
	 Qr/6/UnT29YRk+g4OxF+8hNEjlkHzyQqwYL+CGptU9y144Eaf7mNud26n6SoTu5w0gmuC
	 nMGTyRO92rnrYiWSVct4l+qz39RDr7JThzdGXe3amjquyQpvuDWiQCU5vXjiU7kMWOyIB
	 kfWraSjRUNxCKFPDQP9yIYhVPnLb2FVPEy634s7I8JUGRyDyVdm5UEnVFCis4t7M0sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238881;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=15rx6dd152mXC9BolOmfr6zh9OId7Jtt7lhati6ZiOQ=;
	b=qyL2JtwdvqbjpyDGty1qlLNzs4OBdWLzqp+CbXQ+XOyDzeycQyIc6KCwT0xj5hPhIPKb
	 0hq1j4663jZyylL0kn0jgFDzmf81eCA/RqswjLfTCg9PKjH5sPWKHBeKR7R2W0perhzIc
	 LaRhEoF4ihHQuevZr2vAcpWZqg6vjgJMxwLxJs3HEdCPMedKViOdcJ+IuUq5oiaTZpyJe
	 210T5N7ypqz/Z+XBqMSaEk+4QvocBfoNvTefuV0pww0hIZ/Pyal2cJ59LWTSjjGESSGWm
	 Z1aQ7N+pxpOCfbZvc1OZBL2c3c4ud8ry3mCL0DEu0UGJUeWeBX7+VTmVXaLH+wGOxbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LIW+o5OM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B8ibVMl5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FE3606A325
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 15:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74FE3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LIW+o5OM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B8ibVMl5
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFTZU023155
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 15:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	15rx6dd152mXC9BolOmfr6zh9OId7Jtt7lhati6ZiOQ=; b=LIW+o5OMMmMHLBd0
	ZqN+Pt9cKAj5QI3KuNcKB/ZAXCK7Zja7T31Ro3zZBnx/olamMqxfRqZ+iDKxnOSg
	RZSN9SyLbYZJ6GQu4Yoj3IOn3c5Jbfhfa8JYWJZHBAW8OC8sLSnER0lHNGCEeCFc
	IWL6IqI+1nVCTaamsUVIfp1Nop0TdjBpT4cAyEomo9zGllM4iIF05QOxVrljU9e6
	EdG+b3+ZeDYeS8W7XsQLujBO3K9+WD+UMXjaOhmauB63ac1Shm5BY3D9mGHzb7xO
	g4LcooH0RjT5nmnXAZ/xOF7oohShEAjp89t8q6ZT+mXlqpMX6odtNKSDmz4Sy0MD
	Rdf4Uw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydgyxf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 15:41:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2bdebfc5so28909485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 07:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794238879; x=1794843679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=15rx6dd152mXC9BolOmfr6zh9OId7Jtt7lhati6ZiOQ=;
        b=B8ibVMl5tndTYPU4dQseBgIbignge38JEiekrVZYvYNLfj0ePjCEvcgkH8CRRO42RY
         qJ+9qMcbcYuAnzLDWr01f8H2gQNNW+OuYlEWZ8Q3GvFBfrLEj9Pdx0K31NbwXy53Ue2s
         JNUNdQMmRSw3nzB1knUCVvXF3iagZ25Y4BfVsuGu+dnaSU/wRa6ESr4gitoDuUzheSJD
         WQZUdkA8xzfswUt81T9pEQqmu0FUAC/Em4p4KXnQUV44DBywMCKv9Swr77pF0uxjsSlX
         xggmIpZYoJz/rZ4rGBbORjQPY16aDhSzShDJtbqEC1m7G5qeZwO20oKkruleqPBqJPHN
         vgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238879; x=1794843679;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=15rx6dd152mXC9BolOmfr6zh9OId7Jtt7lhati6ZiOQ=;
        b=Vv6QDxuZ4ffj0da4jyBzMaV6Q/G0wlKgknMXJhPNAiVQjKaDplQe8wN/seyKyQoSFT
         L+bYyy01QMFjR5fmJZSobpYjTycziAytpHHgsYreAC/koawUSOIbmf8TpClCGPzMA4e4
         hIb+4xUTHoKRMfqvo1zdscZLszSTtv7QcmHMhgnbOuwz92AuP91SXNnZ16WDXmIMPvRa
         44VM+yYNgP+eiymobIe3ZmhpmV7eJqm4Ri5M6H0eu6gI+F2gHN+08x5i9CHPmm7GlY6H
         MZb2aicDFQ1Sdb1Jp64JMhXW/He3x2kGi+v6aZxrg1womkj8ZLOR3YsIR+GEnQQW2DMi
         pP8Q==
X-Gm-Message-State: APuU4Z/tJQpXUmjoaJ9fiK6SF3BtmhQybQ0kmFRxiMLIFp2xsYmRTNzA
	Kmk9emU2IVBxlLY6+pKdw245kZsxLl1lt7tM7tTSBD61eiU8aVusNuHouEWrKQQUAbrE3eR4FfF
	24rkWlknHjNlTH3Pk2icrc3b/bPpKjX81UOMsKfThOx7AZqhd17hwCQND/mZJ9DNg3BcK
X-Gm-Gg: AYBFou3mnIk9dpmhsHtjZkRh9vS0nhMX60T6yp+cVVnbA57FfR183EBIxJ8kxs87bp2
	EPOZrgN1wq7RNy3z5KOX9GkFf0BgGcERrHzFpyq9QC7kO9ebakLxl+RsR4ZhlPeiVPXC8H4IgFC
	jK9COFYEVu/IWS5juUjmFdXmQEixaPRiDYoDoLkvZjclyd8EacnAxHsXMsfv8PLN6QXbyxlkL7b
	6ZwvNGFZn2Rq/46Fo9BbdhqOPPKV0R3cKFoeLKxHarH1VL2ly5+S8QQVB1IS0DII0ntUPVQ8O5G
	838IcngXpcMI0BUB7gF0fhOiSa2uh2YRjFt+uU6SesQTuHUCrWlIsBACzqcy76Tnw5rbMaOklDM
	Xu1iirc6AzJGLM1L7CTr3iDG64XPwALEMOtrbSx/sLmsC6rVE7bDIlR7DeFVcNveGbn5Hxg==
X-Received: by 2002:a05:620a:a2c8:20b0:945:db0d:9cc7 with SMTP id af79cd13be357-94783fcd83amr660952985a.0.1794238878614;
        Mon, 09 Nov 2026 07:41:18 -0800 (PST)
X-Received: by 2002:a05:620a:a2c8:20b0:945:db0d:9cc7 with SMTP id af79cd13be357-94783fcd83amr660948985a.0.1794238877975;
        Mon, 09 Nov 2026 07:41:17 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b755543354sm33732a12.35.2026.11.09.07.41.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 07:41:17 -0800 (PST)
Message-ID: <427e15a6-cbb1-4c3d-9547-cfaa08fa90b3@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 16:41:14 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7:
 Describe the HDMI port
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261109-t14s-gen7-hdmi-port-v1-1-1a691e6c180e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261109-t14s-gen7-hdmi-port-v1-1-1a691e6c180e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2MiBTYWx0ZWRfX2ZCXkYFY/gZS
 /hZihKWV6SxuFD87/C/xnIlPWh8fhJTTxUwZXk+O31nTRPAJbNRYBiyu6v51VjYjaChMTXMGgeG
 Op5ZArt3xgg84tn655K8UOaCuAFX9ts=
X-Proofpoint-GUID: uuujwv1NlJAxeanwBhQegPxdz4gcfRKW
X-Proofpoint-ORIG-GUID: uuujwv1NlJAxeanwBhQegPxdz4gcfRKW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2MiBTYWx0ZWRfXyXKW35A6mXo1
 qMOcmsCioKsa+k946b2U09pQqC34eQL/zsLo8j3Ov4tgSFWWpQeFtgB+S6+xkSh3YmHNP/draQx
 GZg6jVFGmQBOsA9jgRy3iSe8LVyw5MYkBqSw+n9bRRUfavMlIqLs0XKlkC4QP3fmQd++MQoL2eu
 WGsjpwm1zoGZYSrWXb9Sknt++i9JHaz12lUOXg692EZQGccYBl7b/P83FRBlHEAwG5l97vOMvEq
 YFJrvV8URfrhNPzLU+l0DLazLXraCjEpP2p4iN7y6EDCb0/LTGLKqh0iI7j3Niqp1CK9tj5Pf87
 +MEVXZt7UgPsnDg+5RMWjbtms+LdU+AB8E1tiU6zErF3nZesRG8PyrGKWJYBmV6agSWA8yqiGfp
 CkUi5HAgmN0WqhW1iPldV6HuV2e3dwIEAHnGo+RAxhampr9zuhzvg9KMc//nXhSmGhT5WQ9kA/R
 QKZNW1JKOGBtiXUArvQ==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af1e99f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=WC968W-qZJN9GzRUQ40A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090062

On 11/9/26 10:06 AM, Abel Vesa wrote:
> The HDMI port is driven by the third DisplayPort controller through the
> DP lanes of the third USB/DP combo PHY and a Realtek RTD2171A DP to HDMI
> bridge, with the HPD signal on GPIO 126. The USB3 lanes of this PHY are
> not connected, the third USB controller only serves the eUSB2 port of
> the fingerprint reader.
> 
> Describe all of this so the HDMI port works.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> This depends on the LDO voltage fix sent separately, as the combo PHY is
> powered from one of the rails it fixes:
> 
> https://patch.msgid.link/20261108-t14s-gen7-ldo-voltages-v1-1-e0ad0d528767@oss.qualcomm.com
> 
> Tested on a ThinkPad T14s Gen 7 (LCD) with a 1920x1080 monitor: the DP
> link to the bridge trains at HBR2 x4 and the monitor shows the desktop.
> ---

[...]


>  
> +	hdmi_hpd_default: hdmi-hpd-default-state {
> +		pins = "gpio126";
> +		function = "usb2_dp";
> +		bias-disable;
> +	};

nit: order

otherwise whichever way we end up merging the dependency

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
