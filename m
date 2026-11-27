Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795768279;
	b=GsjWL2jJJc6LB2jZzJA/q3bqpKlwxG4NL4SQkeGyxHvSFeuW+ZRB3HccQAVkQezHdxtB
	 Ko9GgpUY/Bi3BhN1nYU9lwVmyHTKD2dJmnmqu//i9I5bRXSoVKMuifaa/Du+hpxQynZJQ
	 yI1tZYOlRtz1CQddYfTTXeD3dezEpFFi9i8C49QEODWpRvwRZTEdDurDfYG9onw6JrpOp
	 DHaO34EN4Gx7WN23gIMHug0GeHgNaFXNbCLKljiwW2XoKo1ZZzeTOmS0aoQGiWGcDNaq0
	 tq6b8NpEnNNThin+uufJqKOniNJEr3K++HaLvVfU2wWzi11V6l8GNgldplKVquDMdmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795768279;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1Eevaf7n6N6k8xB2plTgEkQDmf0Hy0f8uudkH9gmaLw=;
	b=uMX/RjPrs7D6y7S7+EgFowCEEPBp8riUAzGW2++ypo48EQWmGCbUkwB63pTULvX4sfxS
	 2n53IIbO+oLpGEtcvtuSgj0Eki6F4mF+sTemZcvsDTQjjrU4dT/Hf1Yqy5+V6MYpDtc9J
	 6GKQK6w9Kxtq8atlZEWXLej+z/okVf8K0ehJ7Q3JpzHuzkzhQZcx3E3GrbGcmO3sGomSn
	 yEKNqh8gsdPWYWf3TmgltPIDy+tNyBKDuj3PaTi5ZPxPfE7KnMKtqeYotDTgw3VLfKpcc
	 xP+e73Jgnyr3wcy3zmS/ZecVcvWeLDB2Z5452OeLfQutDlx4/xCubrF9AtSH0nosBiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="EL/6lRr7";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H+Z7kZz4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944D3606A332
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:31:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 944D3606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EL/6lRr7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H+Z7kZz4
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GsTa560551
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:31:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Eevaf7n6N6k8xB2plTgEkQDmf0Hy0f8uudkH9gmaLw=; b=EL/6lRr7BG4YS8+U
	bSliQzZbFY+qb8YC02tlw1DEaQiYcqMX+lgVH7cwk2lFe1tP0+zZnguMED4BJVl4
	BxAh/0+xye/+TB8GprjYVETz5pJuDClV3a/nO2s0K4XaOs4Qh04w2Kpqvg2n8zRW
	pu6a6zY1RiVtZJhQUR3g1+LAo5Ui8YrHRw1H7H/ZuClflVyKMTMDrSrJmDgPwbs4
	uBHDYlbxlwQBCmD1C8MeTwC9TnxXg5zutAvZ9l9VSQjXQJla2beE1rOjisPQFOL+
	BSHZv/BVaVCcVEU5M9DbOHcZYX1Fs6gapdPcyQ0DbgQ1gvzd28ZkqJr3UOtWeIR/
	6uNVwQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqk0u0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:31:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92eebb130dcso86223385a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 00:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795768277; x=1796373077; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Eevaf7n6N6k8xB2plTgEkQDmf0Hy0f8uudkH9gmaLw=;
        b=H+Z7kZz4gxGStlfDXhL9Tu6VfX9ZGTVNrhBhNg/AxJKCTMaIKMUj2FQ68kBftHfSev
         SUp2uJNt956FWAhV2xyPhU+6g7OcELaekzpH9GUlI1xZwpC+R+WKUVxWvdUWf3vTh3+i
         XAGJMz84YOhvEJhPjIWCY5+fk7pEQy3WB2yPKZoY/QHPR4hoNsedzX4OlwcjPIs+vdev
         RyEvT9djX0b2OOTWAbQ6W9pCPB0gFrQ+JupqPTqJngjrWduQZFDXxkNqPQuozplSrZc1
         R4ycuWA2aknHJv3luKcoUXi8ikjWBsyCn3WO6sVuscg0sspvcamy9Pc42NiL2q4h7cHc
         BfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795768277; x=1796373077;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Eevaf7n6N6k8xB2plTgEkQDmf0Hy0f8uudkH9gmaLw=;
        b=rvz5lYoddASLDAyBlZqNYRgY9gv4aoeyE50VYNn2H9Fwfzms/W92YAO0mcfuYKP2xq
         HdxgcQclboPnC+woukLwgNlPwjBhVuxaqia/h46pduMd4PHS1ty74xjYw3/fqgtgaasD
         eRVloztMNTzsWOhsMaViKmEzaty20H/jcgzbY+Pxb+Qj6nY8PBKuyLwzvuCIa2PPd20E
         mhGRLviGxu7tYVhkgC/eUHX4Ca9whUSg1ovMTM/n241O2/6bgfUSwlUyGOYMaBB26qFD
         0jn2UJAcAMfmtKwE9j+0pUwjvLlbwu6uCVbiIdAPZejLRsFVrxO8ka7HGVBey+9T5k5m
         6azw==
X-Gm-Message-State: APuU4Z/LpfYpVVcBC7zVy6nVelCRVBwGzls6wxaJN+6dtL1hOroxzGUI
	jy7BylYUQ/wvr06dORhyEPaXjtthpia56kddREBj07WPzL+h1xvTY8W8pwEfSiUcDVrhTh/d+Jw
	66xjzLD5sMmav7mdUU53+HrinReK4MndwmlPXyZ99HtO5mVKfMkNpIqY9YvB1FumxKCJD
X-Gm-Gg: AZFdTZdUxqHZwnDGxN2h3DoF6RFx8sn+b0mWN9wewrlGX9cx5an3rw93YAVkUANHkcV
	feOLVqKrAQc7T9QTt26EKVgrF6TXfHvnEFenRcf2/mviGXh1u0lSk0XqduKXYTww8xseGO7nKdl
	+BuAY6wY8guQ3czBqBLGamyjzJVL+BmIPJpFdyUMOpo5f9dm0WLONjkLkx1j70yNZ8cjsgrqOL/
	h3NbmEE+DKA8yMLxRvyjwTBVAUVguzBP0ccPVsKbyS2pzlEceMRJMvT4XVD8k2Xw7VPdLY8MvKk
	gJNUDL6iTvEemuzJaEfFF0mJkJ5lAPRnZNisW1yhaCnghZp+oUP/6yrQ/BPCOHKG/OpDIcM70Fu
	QmHpBcYhLt5TjUNOHhqKFxsAU7bFEf2ZhC3ZrJKp4uXSCP6WqqBacyXXfL8eWi3TW5RpYYvw=
X-Received: by 2002:a05:620a:870d:10b0:949:b7fe:6e47 with SMTP id af79cd13be357-949ba81fda1mr3989678485a.1.1795768276789;
        Fri, 27 Nov 2026 00:31:16 -0800 (PST)
X-Received: by 2002:a05:620a:870d:10b0:949:b7fe:6e47 with SMTP id af79cd13be357-949ba81fda1mr3989674685a.1.1795768276324;
        Fri, 27 Nov 2026 00:31:16 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba371072f6sm10890394a12.28.2026.11.27.00.31.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 00:31:14 -0800 (PST)
Message-ID: <e6821ce4-054d-488d-99cd-86853dffaba7@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 09:31:11 +0100
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
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: eliza-evk: Enable DisplayPort
 over USB Type-C
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
References: <20261127-eliza_evk_display-v2-0-e4223634aa2c@oss.qualcomm.com>
 <20261127-eliza_evk_display-v2-1-e4223634aa2c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261127-eliza_evk_display-v2-1-e4223634aa2c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uC9Y3Ec16Xwqf4BAIsao2UpH0-yoLf4b
X-Proofpoint-ORIG-GUID: uC9Y3Ec16Xwqf4BAIsao2UpH0-yoLf4b
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b093fd5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=TshjLMacr8HRhQhMfUAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzMyBTYWx0ZWRfXzpdQj9WyXOPf
 qw0fI0JYG7AvPIociON+KqNXbK0ch8v1dEUnI+aEPhLYu6DYG971+jGSU4xDRFVIQST/Bu+R5JF
 ZIaO/pa06nNmYSGI7h91YMGoLCxCmp0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzMyBTYWx0ZWRfX1ix5jCwspig6
 b6hQ+feAH6vWN5gEbD2jmpGhJGH9llz5f5lrQj3oCdzgAEPsTn3rp08R/5oFD4sCRORqQ7WJoJj
 ih2XOf7zTzr/cav3TEXTHhnAaFbMF9yrzYpeQjNYQf5xB8hTq7tOOw4JnMqQLmIBct3gW78i+DV
 qQ4FOGwM7gATtwxwOyjrvqJMbtTUA99HwA/0ibScwaDG59B+s/7xb6HYsKfssu5rhr44EId+voX
 JMi0EsbFPLJMtuxr2y8s/KKN/Yl3NQOwlrNVi4Wd18A1uM1IlDa3NaZ51n+Ly1cwJ8YDE1lclQk
 WF/KUrW0WlJ6rhppCRKHYeQAT0q/M/dM+PvIsYsbMcynoeOW25IqdowEJcZWf4i00odRVaT/Ekt
 NZfmGrXpS2bmOpbxkTm1bbocXVsUIZQz4LBH2C7Lrh2nPXI94LTPPX72YtodxAEVjf5E49ADI37
 B3zXWNKfJppB25rbEHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270033

On 11/27/26 6:23 AM, Vishnu Saini wrote:
> The EVK routes DP0 to a USB Type-C connector driven by pmic_glink.
> Enable MDSS and DP0, and describe the SBU path needed for DP alt mode.
> 
> An onsemi FSUSB43L10X on the EVK board routes the DP AUX pair to the
> connector. Model it as a gpio-sbu-mux, with enable on TLMM 177, select
> on TLMM 178, and L17B as its supply.

[...]

> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dp0 {
> +	status = "okay";
>  };
> 

Please keep the label references sorted 


Konrad
