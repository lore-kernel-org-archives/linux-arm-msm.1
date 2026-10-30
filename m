Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793372554;
	b=mafz4h3bzTVgt4i3HxuOFc1DKgIEa9IVv4a1Z17nj9EK29291ywMcw32Nu6Fl4Iu3I3W
	 Khi1ifc9OlNpYA1P2Fdx1bnxmTIZdcCdRTJFmCgZ0OgGGQc7QUCDeyKWpFNsjOlTaKD+R
	 WNuRr9GhP9pzP4oZfDKAUFU7pU8DqQNAvGtpsAvwxYcJn36mqlTG0PebULorj8a8cOz8n
	 +mvaZXKQ8BVCk99+/Mzawabf/ycIB8h8xjiwpEBpMbtyuGnxzOxBL3y1mRlModYmMVpw1
	 cGKp7DwTjBkg7lqmLgt1QavUmix8WoxQC6fforOi0rR78V2TymxczHRB0wV0XKzAscg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793372554;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xAOoyxUkYkr+YZ33GmWcIuFlnPb7kgM8/ZT9gYdBOrw=;
	b=yXttxoDY/elFceqXiDskRon0Yyay9wwcL2CWBPM2YV0XyTnjFJbLLtP9NNGDRk2cSMbr
	 XBfGorl4MXs0CdWLi339vP75vd62ya4GKM/mb57qOKW6pdNqbH2iTdADpqBLMmEezZfVx
	 bzRTyFc1Uat5bKUgsqObQJjwQ9nnDqksULEeENGV0X4VOiPn+4ZLo7N45+hciDhQTgQI6
	 HD7NFkFlRxxWgStDGFecEMdmwstFsh8KT8D2WbaWjYJyDiC8Bi2kqAbHGDWFqt4pep8MJ
	 vDsbuTe/S+oCvco0J+Eh5EiFaofUfoSPN/oyZc4xPVWQ3feNWCRlXiR1N3Fqe/Lap9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mkfPaT17;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kf7gBLov;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308BA606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 15:02:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 308BA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mkfPaT17;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kf7gBLov
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERmWF1953681
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 15:02:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xAOoyxUkYkr+YZ33GmWcIuFlnPb7kgM8/ZT9gYdBOrw=; b=mkfPaT174hQ/k9SE
	HWJlGqvv15Q6tbsQCohC5witKbWUmcpo39kIZHt2bZXyqlq//udZvkU4wXyH/Osz
	yTescl+hZNux0EN3xS4AKsekUC/xo4OyxVt1eAHYoy2I36HOt/Xod0WwTqmgUrWg
	JHetMwzIJa84RMjyb6AgWR+EJKTCcvYZaXGbVSIDG8YtpJT+fT2U/Av+XwxGENwj
	kkgDAFlKXXWRTueIhs6oQwrBBJHxk3Er85d77lJ0/3WRWr6/e6WMtnkvjhQ/kNYi
	c7u3cB6xSUqsjGpT3qw/YZLg10VdousGAgzGn3CeTkkmM4r+HPVaWLQcSZ3bI4Q9
	GamHEg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pkn45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 15:02:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2bdebfc5so21355485a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 08:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793372551; x=1793977351; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xAOoyxUkYkr+YZ33GmWcIuFlnPb7kgM8/ZT9gYdBOrw=;
        b=Kf7gBLovzlcl8QxpOfakuYuHpL9J8ZwKpD7bXxw4X+9jFpAcRaSoFKdFWeJQ7lgkml
         CowS+nM1tqnu4gHeHNa9V+8QH22Lf4WE8IWlyYvKD2kv9DSbMxg6qsaf5yGOW5EgEcPM
         LHx6jHjgaCxkSmHUGBrYmrALfqrPLc4IeopbI/ddA5pLeEQhXazmbBVGQi4mk1zroWBy
         Fh1TT2enxDLstmr+3lnqOqCyPC9b/1HFo1tfV91Z+5CG7NSFt3YMDX8QPdsw9X5tD82F
         NU64YtsRzAIrwr1/ABX8WzkDR3YV/Ws/j7dI3wBZ2jRjEP2vyq+/rhZLaz2F4RCtzLBd
         xokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793372551; x=1793977351;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xAOoyxUkYkr+YZ33GmWcIuFlnPb7kgM8/ZT9gYdBOrw=;
        b=D5VgNjwegCE8yav41djW4sQ6/pO1fCgU4BCw5yKAz/NgOuytolICXimji//fLrQCbg
         pi3FsEu/jpruO0PrhW3m5EqyyagNUzi401h9fLofIsLzOIwfdKVRBRqRn/dc3/CNTu3T
         YgUwR5jOOwanUSBZadda36CZbQWZkMKFLiz3EqBMYSNYNE4hlRdx3qrPEwn5f8E2cTYy
         VtHlZSTlDwfAoRpjS4uhhR+FngWSOms0/IBscerrgOWvL6+EWs+W64B4Ya4MO9RsjIwO
         IG1R8xvlbnZ28p1IvKJYSAYl2BKHKWeER7FfYBllWMgyLy/a31ylX/iuU8DaQYNlvmAV
         8RtA==
X-Forwarded-Encrypted: i=1; AKwUvBzhZZ9nC/V98upIRps2ERL3SgE25v/U7c37Q/5ynBiJa295NRW8jqLYfTv/0ceeNfgP4HaGfk0jzP24e1l8@vger.kernel.org
X-Gm-Message-State: AFq9FYLiJzY/QZIoAnEoB/wkzr/EWRaRS3j7600ue4tSX/AENm4rSofR
	DNLdzRQYM0AaqAO4tym8eOVquwftYKEo87S69mrUGKc2P+BY3d4A6PdcC3oY0H06owJTDy2wH99
	IJRCKxVus+2CjR+Alj8H15fcQ0+2OfzWsIlYhfOeqZXYvpI2uQ1V0KK0QHgn13Z358Ymw
X-Gm-Gg: AYBFou0J2BqGj/CII+XjsxDWmeqzQDigCAQbK0M7upJe0uUQPR1tXyM5+qWKOPxHAfm
	md4rbKa8CePUCR2om3VmEAvy9iTwQoQ7WFbOd8VJr+TGJhnRkP13PRwSgFNk9gN8I2Q4Pu/QYXq
	a71Kg9Gb3hbA2Wznhjma+L+zbCqdY3hNgz3/KeQ3axtNuXFExfm4IUSBReuBFRpg9K5STd7TYos
	EsgeOjEJ1jxEZAr7DHMdtG2Ar4U0N4RZFqkVh+p6JKgtqkt3lzzoO7QJhjRnPX9O+uMFKK0TsSe
	d7Lo975iisOayYQhpsgyi0HUu9+RbcnU4IGQ9RoBcrChxU+G0CxDL/gn7vC39o38E/khkqyZE0o
	cCIBqyjAdgQziNctA6zcE9//+9gDgjowavmLfjT0wBxDXAD1VvY65Stu8ZG/s74Vs62cKDaQA
X-Received: by 2002:a05:620a:72cf:10b0:93e:e111:2771 with SMTP id af79cd13be357-94421619197mr420075485a.2.1793372551152;
        Fri, 30 Oct 2026 08:02:31 -0700 (PDT)
X-Received: by 2002:a05:620a:72cf:10b0:93e:e111:2771 with SMTP id af79cd13be357-94421619197mr420071085a.2.1793372550552;
        Fri, 30 Oct 2026 08:02:30 -0700 (PDT)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca214fdsm37486a12.36.2026.10.30.08.02.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 08:02:28 -0700 (PDT)
Message-ID: <d265dd66-d8fb-4fd2-b6cb-d50462e4b6e2@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 16:02:26 +0100
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
Subject: Re: [PATCH v2 1/3] dt-bindings: display: msm: mdss-common: describe
 additional block resets
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261029123238.29877-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261029123238.29877-2-xiaqinghuan@mail.ustc.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029123238.29877-2-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1OSBTYWx0ZWRfX8NgJwOdej1Hl
 QpAje7No12+WKVk4boP8LrrW1m5QjJ1t9x/82/8p+dqrA0dDb1uVr9iS/VrBa5GANldn785sIFJ
 YpuCpdw2flMNc8qMiPRc379IGVkFqmnV2VOl9SabRvXISIGYbj/T3lvBeA4mYI20GGdH8No9Be3
 bPdPSI7JqMsEYQwQvT6k/nrQSkNPC2K9cTzSAEDfK37ULXcMjFajZyLLJqplopRADnN03nQW+KO
 v+hbyb/q9eimtd/79+QS+mFftaIhjH23pumAmxyikg9K9J52zIeuaFQR81GxqDI/S4flERAsftx
 xuabdqq62huDIlJ9bhHWKSs0OekXwzARE218Dq20aCC57pkBy9xTslN4dZkJy1YRZSe2qSjpglI
 F1UnAhNxuaZxXSQtWDkiehFO7fvOUWCtDfw30exmr8I2O0knc2PMJmKh9T8fMM/y1o1k19cFKZX
 PW00mBP3qWsGc1iOHig==
X-Proofpoint-ORIG-GUID: 77FTI8KnfQ_rlSO-luse-jbRjVE-wBq5
X-Proofpoint-GUID: 77FTI8KnfQ_rlSO-luse-jbRjVE-wBq5
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae4b188 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=dBPrbYW5IX62wmfSqDEA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1OSBTYWx0ZWRfX/E+v6NoJ6KWP
 ScxvZoVwmdQPaoTcv07YGWBL252iFzUkfNAONQOSqLpd9alST/0x+90r20jXhXib7VwYNRqZ/lK
 /FVFOGhMxEG7y3tInOlZk9qDWqR6Cf8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300059

On 10/29/26 1:32 PM, Qianhui Xu wrote:
> Some platforms provide more than one reset for the MDSS hardware block:
> beside the MDSS core reset, the SM8750 display clock controller also
> exposes block resets for the MDSS core INT2 interrupt controller and
> for the MDSS RSC (resource state controller).
> 
> Allow the resets property to list up to three resets, keeping the MDSS
> core reset as the first entry so that existing device trees describing
> a single reset remain valid.
> 
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---
>  .../devicetree/bindings/display/msm/mdss-common.yaml         | 5 ++++-
>  .../devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml    | 4 +++-
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> index c6305a6e03..7c0ac90511 100644
> --- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> @@ -84,8 +84,11 @@ properties:
>            - const: cpu-cfg
>  
>    resets:
> +    minItems: 1
>      items:
> -      - description: MDSS_CORE reset
> +      - description: MDSS core reset
> +      - description: MDSS core INT2 interrupt controller reset
> +      - description: MDSS RSC (resource state controller) reset

MDSS RSC is not part of MDSS itself

Konrad
