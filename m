Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61854BE43C
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061344; cv=none; b=FHmqAD7Mcm9Rgb13qS93hKy6+4oHQYGYzRcS7Nl0JO5K1iyfYZgwwxnLTYCJF958zGQSKcHKkI0aBglgxJgSNEw4kvICRxrkXmFO54ni87mJp9raMFh59Tw+u2pHdQDJeziIlGTvlLH4tSLj1JA08CgmWJIZMBNNBiLf0np6fgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061344; c=relaxed/simple;
	bh=HI0B6U20PGlmDr9utd8wlA1Fuqt21mxCePzjPM+qxE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bs3aycJ/EWrPy9wy5bLf/Tczlr5efUDT57j8peaezGFavcl4OZcNqXiXqN9dvYFvFJpgfHfeycSA+4aizQtQrFFMPLAb0HkYdbUlGTmpqqk3qAUR5PdK8g+KqMwfdRNLiiugmF6FMJA++vbS3nw+DCFFh3D7qs7Y7dHQYmt85EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Keg1rjob; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g0bjcki4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Keg1rjob";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g0bjcki4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jTko2809304
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:48:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PK37F6HA0tUM1rNto9KrqFXRqlvSgZ37BjeRB21jxXI=; b=Keg1rjobQuhKYnqF
	TI0Ep3xQZFA80mzN8TaR5/WuqnFpDmlwTugGSZEbuWufoxwtciA/MVUqgEfGt0iS
	v+lj8prd0Jt9UI4VuQ6TDptQnOOm7wrIlT5ymBEl0x3cWhiuGFWwDqKp+WuSTBHU
	hgoVycVqYlhXmCQKEJUCoTd0EIYgFW9hvkYYa8s9q6c/SP45fd03jtjOetttzWLk
	CQFt5IucgT92jMvfqrlboqZ5wjvhMHDgkWJoPJgq/Mcj5/iJcsVZqyC2d5G/04o1
	U4Z/cWj78KZBCljwa02fCANU5+DHSYJ6Qu7wtHkwZA4cPT9gMoxNMizpV1cxbXk+
	XD8www==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54t5kt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:48:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5338d5d0509so11199011cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 03:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792061338; x=1792666138; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PK37F6HA0tUM1rNto9KrqFXRqlvSgZ37BjeRB21jxXI=;
        b=g0bjcki4QwlHohbhK2KcQ5DUn/SpSzfutzwyPL4UvMG6UtXI0EDWAmckNeHSp0I+LJ
         VQwEezur3dLr8Dknab4c6llxevr569sYil3XMlXBciXzShcKzKdV0Lyo0k14s/S2DKXd
         nM7y9pFZD85mrjrWdYa+Owm9X+758RlJ7eikLXHIz6B/9C2BZ5jaNEpZZUFqWHMSnyAq
         69DVlHnJ1bn1w95yQ3m/UGMzu6mt/pp7TxpAXPzYlCFJjCU2Wm1cDe3A5ON6vxt697B/
         X6oCnbcMBDAYPMLVut4BlD4TPescc13k/9EWKyIreH9SNjEgo68lodHbFIUdDgQJURlX
         tbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061338; x=1792666138;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PK37F6HA0tUM1rNto9KrqFXRqlvSgZ37BjeRB21jxXI=;
        b=uWtt4B3+0YvhzFAHaItneVfoxlhBPR6TJAac6zZDh0+DS8pMUQNVNET6q6sZPWN2MN
         Bb25a7/1zKZjiwTahGzel8oxM1bjfHzSsuLB1LJqYCn5D3QBN5UDDdYNniVmzmdnHaiQ
         tHGqqY7mR5XIa++55BGQIbgaEvOGO++KbGW/30cVItRIyKoHk7VUmfpEOkVpVJOzkrem
         VbtqV1VVpNa+U8osmgFxTVU3x5TyKKrGU94oigVdqo27wQcUy1pm4BcLgta2Mn9nD/6j
         E7WPMCfnfJFsUwlCuxINueXO8VunFIqE8OG0sSp8fY2IKAHmG0PuOa1f2EHokrTs1Fzf
         wsBA==
X-Forwarded-Encrypted: i=1; AKwUvBxCkiKWTmsJH8W4VE/Gfnt2C6OksqEZcSWKBSXjAtOjT+H2hk+0vM8OIscthYvK0TpTkdpoV5zbYFGIZiL8@vger.kernel.org
X-Gm-Message-State: AFq9FYIfoEEXbcR9RvxkhMu7GZQw8QsXz5rBGGdfWp0v9l1mEaeHbNUR
	rCDvxQ7QoSRX+bWXoH5e5/lGLeVSCMou+/g6DREJbecynBQmh09yPnXzHqqC9veVylB78kITkIG
	kv1dWATceZ9LJRuwPsKnDm8mRr2PL0q8/b+vb3ebulf0lCG7BwToTQrpkcEPoxxtDeuun
X-Gm-Gg: AYBFou1Rdq9i8uvsTfjlF5CslamGftnVy08oMfaXksQj7Wq1GeDJkUl8+D79IyYEG6l
	IXNs6DTsY6ieItfjzEO2svRBUqWvF8zTVvihJL+Tk7ex7cPYNSaLIIRCp5/lS0LDhQ2WeVrIgH+
	lVEQ9lZdqxyAiomQm8a9N5ud6a0PnbJUxdqdBKmS8sGtSVv44mTZYDW4irBhQ00e86fY0bzvdjz
	gJivocJifT4sdJ+sDhwZh3Qo3z7u9Zx5B9gbLtjax9PGNZxuCKRqOYyPwSwlObenstv5WDg7Yyo
	RyuBrTRNxnVw2jDncjhmWxaiL6tllPk0XuSGlh8O4f0hCi+HcN0NfscBnNz7wmlWGE1CzAD6+4d
	OLsxpEHrvZca6c1GkdAn6VQ==
X-Received: by 2002:a05:622a:4c7:b0:531:2133:cc7b with SMTP id d75a77b69052e-5359f05276amr357213261cf.0.1792061337743;
        Thu, 15 Oct 2026 03:48:57 -0700 (PDT)
X-Received: by 2002:a05:622a:4c7:b0:531:2133:cc7b with SMTP id d75a77b69052e-5359f05276amr357212871cf.0.1792061337282;
        Thu, 15 Oct 2026 03:48:57 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda61fb26sm108538566b.69.2026.10.15.03.48.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:48:55 -0700 (PDT)
Message-ID: <0236914f-1d27-4618-8f94-3bfe6d931860@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:48:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] arm64: dts: qcom: sm6350-lena: Enable IPA
To: erebion <erebion@erebion.eu>, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260926-pdx213-upstream-3-v2-0-b4612e3eb536@erebion.eu>
 <20260926-pdx213-upstream-3-v2-4-b4612e3eb536@erebion.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-pdx213-upstream-3-v2-4-b4612e3eb536@erebion.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad0af9a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=JgZe5hknAAAA:8 a=EUspDBNiAAAA:8 a=KD0jGWNZPHkgkXdHO94A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=ODtDA1adfiiB3BH7YLNA:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MiBTYWx0ZWRfXy1FKdeY5H1mT
 aNJyZ7Pmh3x6Uv371+i0HXx+KquLvn5HQusRPrkGCI85xR4YWALxrNrPh0MIScU0FGNR83KPsZA
 X2C+DIDXqun0x7keUuIZhtvECK9NmzzzTCE4zdTnbNT8K3Ua9UGgZkqoQUs1hYqBtudpsz4+ZM+
 kUJxQMBK8Go1C65Tj9Lwxc8ButnjVDJ9AASFQSuH1z0NvBbasN4ImrVT5ItBy60w4Iakfa6gw16
 A8yDx7F1SsudIkDLbFRpe0cJ+eYz/HTNmJH3wrc+paQbnmKbnEAJcPuQ6PxPoxnZtfAKnQd1Xan
 jK4KJ4j55zvZAm8wVTpttLsMpZnnt3G0AK8foyMIiqCPiQtWgtiV8XbWH3suNYayTv6HrPZhlWD
 ztDu4MeTgBc41aiwg4nqDND/lE1+BqRMW7IQtKX3kD11VlDjQheP5OiW1nPOgIrb1oUMFvFiW2P
 ccWJqAtewMLGkF5mR5w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MiBTYWx0ZWRfX87yOcrA4qsFD
 YzULeOG4PYBun6oXoqqtcWA6uIeBzFOxYD0eBpH25C82+5WxgK4ApNqpurDFihsQTIZDrILG2Qo
 CkJS3WMX8G5Cp3jYAv1sPRAkfdFNJyQ=
X-Proofpoint-GUID: sLcDUHO10EvI5HwpEVqLxkxeE0MyxKMs
X-Proofpoint-ORIG-GUID: sLcDUHO10EvI5HwpEVqLxkxeE0MyxKMs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150042

On 9/26/26 4:00 PM, erebion wrote:
> Enable the IPA node for the Xperia 10 III which makes mobile data work.
> 
> Signed-off-by: erebion <erebion@erebion.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
