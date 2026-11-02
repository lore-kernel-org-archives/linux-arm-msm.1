Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620678;
	b=oDdbmtgLiMH8+4MpR4NiloxA9tIlN0yPZCB47zxiyduIHQp1chdajIauOxMC71OD1fFW
	 0Xl/cuJluH4EBvLaZOiwN56SAB/4PmnlFkDVZ2H6RKI6gnmRTJu3Y0knO+WZjB7YsIm/B
	 vwKwsSWV7KROZI4/Sg3mWwELsjndpz/pltLSTXBfEC+Na2vvz3WaZ41aAUK6DMy/F096f
	 54mjUvq0iU6UwfD0SxvIjZ8xaUgJTLzPB0xbanEfS6IfC1bmCWxj89ZviY1r+/jloaGEW
	 hJQG5q8CM3BH5rQVFCemgOUVLtAu5d3t2Q16cyo7HLqaBNxCuhpgdo71+MAxZv0bKMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620678;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XNKwtLEPoAerLUKfTmxvN50PoLCkeJCmqkuTSnSA9VA=;
	b=ucDqdiRc0mELNlg56bgqmrvpKCfFTZHtK17rkHzwUA+MywkWW2s39SWaNE46cd9gDWSs
	 /rjcC35Wtf2l9EFFtuFgu+ot31JiIRI2uQSpa3yOU9aCKxeHpMSc0kGXvfSBxQTG8fALj
	 yNQbcOCVr5V9QrB2mf5ZK2paJJnINSNjLDZsvzZPfkIDHtlsznEJwuvAiECnxTdeQoZDy
	 /geUcTvor25vxHRE7fQ1nHRbRAcaRX3Z02iC9VGGuMkO5hOwDQLMpeHV1lX6vzL88Rhkx
	 PcIKXo/zlhT3xeq1hhSLAH2x0ouOI6IBiCvcQFLduw9MCWMQqaVZD9miInXxLVGpKPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PxZGtLJP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WgcyOFPO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E297F606A327
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 11:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E297F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PxZGtLJP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WgcyOFPO
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29ALcI2880833
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 11:57:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XNKwtLEPoAerLUKfTmxvN50PoLCkeJCmqkuTSnSA9VA=; b=PxZGtLJPRS29HD5g
	tHiiDT7NNNUhHpl19C8IpEfL04YWROryX+LiXAbzSklVMNmiKA7WmeBxF0mwaiz3
	yLmeds68Ki/2bl7MXu7CB0ufsF+BCAhHYFXwzGpauL9QpjFhwWwKs3CalDaBPGP9
	HRfVOIEjyIelDGcGkTKHNKa0RQr5PnRjIVFpAsV7VdmMJcihhlC9gL/xLNm7Ax/D
	pynLKrb0zNUyGET23tDaXogLz99WpdjJVOpuMEHy738NO4BUmsEbeUaoGkqReCKh
	ToCWHO9Dmrk2q5/2TFNh2p0e8EZ7SVmjyomWstG2PZ5LeZ+6dN6U/esbHycSVA7V
	AefRAA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrgp8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 11:57:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1f1f2ecfso49144885a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 03:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793620676; x=1794225476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XNKwtLEPoAerLUKfTmxvN50PoLCkeJCmqkuTSnSA9VA=;
        b=WgcyOFPOzp9ejCC8snroS6beael6hMxQwTOUWv18WPqeHBaQAQXbQdyQmCcP9YlRIu
         +oueAGSbDn8fTM7BtiN6uoLlRymWvrxLsl6vrJL+lXpCJHO36nssn8w68XE5dljmyZ1s
         J3MNLrax2kkrT89FJZO78h3GALIz9jyk+9Ir9aCuxRpGpPZV9nPLVfPszNyhzp4N9JAm
         ccOjcJw2Cgl/RNblH6N5IhpsJhCyr5E5DKheShHbQMKZSSn6Uf7t99P7qe0uAFCpmN6S
         A/MLHUdhtiUlucZPid1wKCQz2YdDJECttlPR0dkMyAB2XHGL+xfC/vjvneb4AAxQrTGp
         F85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620676; x=1794225476;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XNKwtLEPoAerLUKfTmxvN50PoLCkeJCmqkuTSnSA9VA=;
        b=2ggG+crBfFxTe+9UCXEv4g4CMMALDA0mB11VWl4DjOTZudaEqaEkp7Ki5XPH2S/thO
         phyqTWEmWfMDp0bJ/b2pVMj1/isIQKf1jpLDAZNE/VqCCVY+joM2TL16W6ARP3nCUik8
         cZDuHfqjKaHDgluhAKZb4dqYsmjEqQneO0850VeLLsqCYWijLO3CpwuLUWQve2berQYK
         Bt3DZD8jKhK6VwZHN26aBh0BmhA5C+8EZR1rY0OKcat8s4YlHaohotLoY6x3M15t8l+N
         yuh4VEUDNz6ZAjqybsycOzakg+RqHBKoeaJIoVkRJ8masNtqc9l6LPgEmUiZRRzN5CHH
         qlww==
X-Forwarded-Encrypted: i=1; AKwUvBzWI5YtFilFckWa5ORFF+O306j6rmufJwdgNv7d8GF+/qFqIV2l7w56Lrul0TKJCM/eJLHd1tsCFfo3ieXm@vger.kernel.org
X-Gm-Message-State: AFq9FYLFMT8vqeag1oQPN6R0FdUNDw8iIqmogJEbkcm7uEKrNHX5Tk6F
	0LKKKECDe8bIbV/gB5YwBaL16BPoF0D5xHR8W6GZ4FCvmQJjaiFkqvDCwCflfGduBcJBFktufyo
	8D1jdmrmeH/m3M/2aBX0jboec+f3rnReTu3/TZ1GSGjVckBBZ+WQyFaZsdS5KGvcVfOWy
X-Gm-Gg: AYBFou149g3QBgdgOP1ucUcV+Hpt4f/8a8Kk7OmXOCnIkGIE45N4LRNJiibC1LjM/hT
	4rqj6PEB0T758RtMzyITXdRw6TFsp2EfvJ3Fija+LFn/iJXmR8yNMr8H5wh1ONpPkkL3rlWo+LT
	edETVZYLkTD1xzOgoY4G1TTKvEqwqrLMEdOEFs01S8jwAaxtusR3iEt9dOKHiR4W9ZS28XH2Dgk
	gxf+HG0q8tHdL8FzkLPdwGW15sQr0BwzOqADDf23UjLSXAzzZlJmAF5hRto3XcGgAjo2nipIwPu
	q4Rb43kB4Ku+B3PVl9mEd7Zmlm9/48xChTfmatV41QXxsjOIG9WwtzBztjMDHJQ87kaZzZ1ELVm
	v45Gp/6rU6RM5xvmnZn6q0kLx/jAA9OvrxUdVLXiq/ARaUJ43n5SqXq29fLIIZ8gKW0sj5/s=
X-Received: by 2002:a05:620a:124c:b0:93e:571e:94f0 with SMTP id af79cd13be357-94421734130mr1761511385a.3.1793620676109;
        Mon, 02 Nov 2026 03:57:56 -0800 (PST)
X-Received: by 2002:a05:620a:124c:b0:93e:571e:94f0 with SMTP id af79cd13be357-94421734130mr1761506985a.3.1793620675652;
        Mon, 02 Nov 2026 03:57:55 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc18e78sm387008666b.9.2026.11.02.03.57.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:57:54 -0800 (PST)
Message-ID: <2392949c-85f4-4cf7-aece-df3b9dc86cb4@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:57:53 +0100
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
Subject: Re: [PATCH v3 02/12] arm64: dts: qcom: sm6350-lena: rename
 touch-en-regulator
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
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-2-cdc3be96d257@erebion.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102-pdx213-upstream-3-v3-2-cdc3be96d257@erebion.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae87ac5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=6H0WHjuAAAAA:8 a=JgZe5hknAAAA:8 a=EUspDBNiAAAA:8 a=RC7kgf61jvLRIQ5xqpwA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
 a=ODtDA1adfiiB3BH7YLNA:22
X-Proofpoint-GUID: JiTArxjfDzdq7a1VtSx3HadDh9xIN4ni
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfX9sHlA/by1srN
 /+ckG61tjZbznvUbhqBsKx7IhkTw+89dqpX0W8sAlACIWBgyBnbMw9LwlLPvXt/8RY/5AHe6LBD
 CfxV+V5Z/ZMVu8/NUZfUO6xT+oEXzac=
X-Proofpoint-ORIG-GUID: JiTArxjfDzdq7a1VtSx3HadDh9xIN4ni
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfX0HJDkno8wxhY
 ewsKxVfpfvYeY4mQSp1Jv4w2eO3HNqEGc7emH3criKsv5dxRdffihasW+S0355x0uycKdAlOPYb
 5IwsZdG/OJ1tyEDoMtUJglDjCnUb7Ju4V6tyUQHgk36bWPSNd1vXTVC9HjpIFQmX9ac0LgpwxW3
 ICB1MBFFc0h4OURpjPSv+MMU5M0JtLkYLfCOE3fvuHb2bYJ0VcRlxmOpNPVUEqSuU59VrbdRzhm
 U0L+98tp22eW9v1s3svSCz7QsCSrxKfWsCbSftgLrUuPbsHekePHwcs+2yfc2jXZiV+OXZG/vJT
 WmxTv/mW3Qtb6F2gG0jzgrda4noAJRUcShxGWSf7wiuyt8Aeu8VCxhe9WU+Wk/zTEBo7gZdHERX
 MymmeG7hgloXAPsNAValVZbc7yplEziQkw0ssow6RVFTpUr7uhQGwYV4JkA8EQGHUXG7bp3pI1B
 OUxnznqTqeIhVIFFIjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020047

On 11/2/26 12:32 AM, erebion wrote:
> rename touch-en-regulator -> regulator-touch-en, to
> keep any future fixed-regulator sorted together
> 
> Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: erebion <erebion@erebion.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
