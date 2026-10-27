Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102540;
	b=GF1ObzPQD6SjdoKdCLTQNQPYeurDS5V7c8Xl3JII4j/EcPg8F6NWyW9t2mZO8uySJFTR
	 +KlqukcTOxkFCkv81YWD6Uk/VU4n7OHrB+2URXyVrTrJuRFkHf3L5EXt/VZpIgy+KAhdX
	 5OPzj1l6FuiMhoybvU5Eq22w64nIZu687XCRqqEkmyQy2ZVwm8Vn1AYhZcBkdxYvIIKI5
	 wV53pXCBfteM9fIiZcPOq5uUXnRZ5UswE7fXpaoGi9AbPEq2bZpvIXLBdOS0mg2iJBJ85
	 Dlalb2gs3DxzG0DkBdnX6UB9ClYHO3vpD8NVExGDRaWUQAIqLLAIrFX65fo8NQaWrIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102540;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Kn1jCEHUW1d9uLWgsAlPA35l3RKW2fh4gEEZlZKSWDY=;
	b=tUW4q+2jezYw0pEeKGrPBNscaS8Q/FdMvW/BiHXRzi9x6+8AIfOJB1a7fnv11SeSS+tf
	 TdIF/d42+LbddQQStccp002HkqfCvBVpaXj/FKBzBbrIRHESicYAfG6Ms6+hx/PR8edxK
	 Phbp6pxL6FqdLnfDHaMavKEyw+UuA3StdIPvpNcD3HgolmyKSB/H8hC/+7Y+wD8UoPuSN
	 gKe42W5THSzIOazWt0r2GTMkohpWd/dtiuYf05yi8mXFOyX5tEOJpm7ACeIOp9jZHLeV4
	 bYLBVdNeZ+TeGNsmMnDiYp8Z+nGLuKI/v4umA0r5HvdLP3LDBHLaYMnzPq96JG+lJAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="VY6nyYT/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="i1AI/301";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C7C606A31A
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56C7C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VY6nyYT/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i1AI/301
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdsLd1973264
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kn1jCEHUW1d9uLWgsAlPA35l3RKW2fh4gEEZlZKSWDY=; b=VY6nyYT/KRTbNCFC
	54PQYBA2zoc6U17Izq0U3o8/EyrgmiDpVBFpqS1Hog/UAm7o+P2JAfrf0RNEwfc4
	h0CT+6QhALItvX2cDGlPHVL0kFwsuzL1XKA6dhnehQzwXvYubi6ZffI8hSHBboVf
	25VyvhyY5eUjGXmw0HRZQtp4a0NY80F7y7sU79GfWdi+feJTSe42rJA+tSn5dqWs
	dB6jFsOrxd/MAQoV/vI7RIUOQ6kHGXlND2Ek0tMf3AO2R4rOiolhsTR0Rxrb1ppv
	gZyMSrh1GMofm2sNUgUDrSJCrgg6xd+o6vSELXd75cAaKKZ65Bxztt0TRlwYt1TZ
	FxOtdA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjst1ge6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:02:19 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-81b5451da7cso2466757a34.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 05:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793102539; x=1793707339; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kn1jCEHUW1d9uLWgsAlPA35l3RKW2fh4gEEZlZKSWDY=;
        b=i1AI/301zX3heTMkN9c8ZZkb5Tscj40kcE1z85dn6Vnbx4Gdg+RkXhRiuyUrVzfHqf
         5735QFXK6gbAASSdhsQi9XDevQIaljA63li4tCXFZ+dOUKEO/d7+2rJ8KTJy8hYAwIwK
         l181Sv4IiDnqCfCa+QWaLs8d70mJkxzzGGOZFwFPiBvwcj6MhtoMvcPAGSuLcrE+kDdt
         BVhrFjbvYGwjCaBs2z92c//PLAYMh9I7qwHYgq4wB/HlVhORZQ5x62+/t8999CxpMMoL
         xzZWWcIUild2fBi8z0qu+/6k9Ro7gnM3BwSAA9JyIC+qR2BHzQRmdY3uGqOsW254DgAN
         8Csg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102539; x=1793707339;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kn1jCEHUW1d9uLWgsAlPA35l3RKW2fh4gEEZlZKSWDY=;
        b=BNEloNhMETLccNauDS0H/1LX/Div1trhyr6bMDvhkyz/Mi9+feaslm5TKHOmRhQy0a
         cYulQnMAjgv9bbQpx+6RTT+5Ty9+vCWcK9urQsC/qUmOuNJcWsyT8PIqT0j41MRBYUVK
         9b3d2pr8t6qYVVxNO5fWIp45p7ZzkVSLjm79p006H2LM+cwU0F5vVqFGgCGWZBXhC2BF
         2NJht2vZdqFFfm8GOv9nWNdZwFL9GxII5Bns20CkgCRgbX4R47RAM5h2z+nbeWFTD2Fq
         W6HruQ8WDiVdTa3jqDlkbFXo1e8TTF3pEZkek2aYreEQa8Rno289LMuZ5dFPyscUqIta
         Ry3Q==
X-Forwarded-Encrypted: i=1; AKwUvBysW7tvcp29d7YragH839BCw1x0D8H/8BLuLrPeqJRxFRe8BhkAXzwCEVs+Zxg1GcZckLtyPP6ltpe/3V0d@vger.kernel.org
X-Gm-Message-State: AFq9FYKR/7wq6A1mb97oHWNeewssnLqC7d+GKW/Yr+BjNi+dXnbTEIH8
	7Ddl2CvdrM2aTck0OECuST2H5oHZ49cZoKYn/ccGnD8BzrwUcxKD72R2z4h7r7q0rcP7FGZu52S
	Ku0bkTxtjpy85JuNOs3dRe7K/oI3zNAqUBOfIUMa8mP2taiWIHisDvWdhmPF1cNhaelpq
X-Gm-Gg: AYBFou0PKjExSs+ca/fZ6hRz2UCy1WatpfqoD63UY8KtKhQ+108lx8M8c7bax1KZB9/
	CXcqzlZB0rBb/9aVtaYrn+zV6t2jMBHYFoM8uK5ekqMqy1eNMPhqX2/Wa/aPeGvSK9QQZx/M4L+
	ov/UekBraN/Oet0+8voo4sH2R122DHyGr6SEtnsuxFVDhEHF0Q051io7gdP3FJedPUnZDeOp5rF
	ijXCnyGOvn4U2z/j7E++xoc3Szpd/Wx26/2gLKRVJF+Mbgg93NYX+sRM+kWWkt/1HFwDoc3ijM0
	Cpkm50y1Lv3uHfwu/zqZvhekPMI33BPWyo0bZPpLsimsO/cjl4YFyGh/F49xzalt0ixgBX5mY8R
	d43sY3klcV5HCfM0W558JLQ==
X-Received: by 2002:a05:6808:4f46:b0:4bd:73d9:85c7 with SMTP id 5614622812f47-55bffd42ee3mr10422867b6e.0.1793102538863;
        Tue, 27 Oct 2026 05:02:18 -0700 (PDT)
X-Received: by 2002:a05:6808:4f46:b0:4bd:73d9:85c7 with SMTP id 5614622812f47-55bffd42ee3mr10422778b6e.0.1793102538203;
        Tue, 27 Oct 2026 05:02:18 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445971383sm4756451a12.21.2026.10.27.05.02.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:02:17 -0700 (PDT)
Message-ID: <83abd085-b052-4cbd-87ab-8e882ac781b8@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 13:02:12 +0100
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
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: nord: Add display subsystem
 nodes
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260920091930.2215803-1-shengchao.guo@oss.qualcomm.com>
 <20260920091930.2215803-2-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260920091930.2215803-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HJ1WhYtv c=1 sm=1 tr=0 ts=6ae092cb cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=mY-c6RtcwyEVXP3PGRQA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-ORIG-GUID: OCP8843xblK_FbHwuc66Af_5U-OV8SIR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX10t1//bXIe0A
 dpFeZ/fd/bXrwTbmozg5rmbxSOqz8RV/yTalh5kVldZg5HmGpdljKy5c2Z4sy0jP2b5eD46V7RI
 h8f59oFFT6d33M4lIBo4MwAEtY+LMKw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX8hTM/AI1nkiQ
 iBByVK5B0uqGSkptdEHdfGAaAtBQd1Z59wVI28gR++6C4i8Qgj9Q993s+OtjO7CNBnUCqQhESUV
 /+kG78Y1n6wzGD1SxT94XmkJsFhxhpl6bcI+DsAJFFDnqLjO83askHWz0LC0WkGAfRGxnbOjiaA
 NZaDQI7sIlG2OOkYTBpQe6eMgSkXPquVcL/xhwhyH3aOd5oMJ/ZY6T3dyd3fzCBNu+CFWhrMCtv
 ypgy7W9qDrwc35OLbxyzcdvvC6qpbdwDTjaJvOfMEZ6420anPH964wjW04Ebb0rriuykp4o+1yw
 xINvLemq7i2O+4bcxXSq6yQghy5B/+GveYTMBTExvl4Sgdjngpp5r9WbcZL1lu1l+H8TuPm8WMv
 BdFs0BCqXFaOvi7nRJha6D2kPbg59MZTcI9J/Ivdzi23DCviH3rjs0bM2ixEclg8Caa9DiAZLO3
 CuqyCA2AeiA3Js0m+iw==
X-Proofpoint-GUID: OCP8843xblK_FbHwuc66Af_5U-OV8SIR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270047

On 9/20/26 11:19 AM, Shawn Guo wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Add the MDSS, DPU, DP controller and eDP PHY nodes for the Qualcomm Nord
> SoC. Nord has two independent display subsystems, MDSS0 at 0xae00000 and
> MDSS1 at 0x8c00000, each with two DP controllers and two eDP PHYs. Nord
> is DP-only, so no DSI nodes are added. Wire the DP PHY outputs into the
> dispcc0 and dispcc1 clock inputs, which were previously stubbed with
> zeroes, and add the eDP0-3 hot-plug-detect pinctrl states.

[...]

> +	dp0_phy: phy@fc3a00 {

Let's keep these labels mdss_-prefixed so that all the display
nodes are close by in device DTs

Konrad
