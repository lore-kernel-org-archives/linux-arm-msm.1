Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792751087;
	b=VDT5kOH6xpM41+BBb2+XXU8084ssEdUybmc6BqoP44n0ngGhkSVbNBVNesox8tAMJnhB
	 W/KmADPsmMsY4+N1zewPIA1zWb/jZP/9kNtflezqX15gGTO/vqZ+bPmYmQOHM1TOZhs1w
	 F9TFpMuRLcUDphk78RD/1MwxRq06HYS1z2QJtco23m18xpZQYpTKudDurkMPX8Gy9f/Jn
	 XmlkVAsb72hsFOvg5PpF185OWVwf/ABgCI/0E28NJng+a7tORqFePjzhd7thMuxRgr93P
	 EtL3vfsGolsoxtJwdZ0KEe6s6F1QQJthMzPNz6y5hS/1URZLgYezDv+GHxhq2HBwuEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792751087;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xaaScOGIozAWpXbcitdyI9ltdmgfQyDQm9ySsdDqK+0=;
	b=UakJjUvBqQd0QCkgdwpqsOCFp6cD2d55FM4F4Fb9J3rbTwKPRxDJ6UWl4mO021VqDjL4
	 RiScrHE1L/Xqy+TFvXWoUY3EjYvqXqF8lbszrJgKc4LLtzI7XOWxonOYeWK6QF/rzBBAD
	 8IQUvhTIdmmJUUGLlTYo1MlZo0LjD5BMnjsBGpbb3CGjl1ts3TFvGmVSaB/SNrBKh70pr
	 3Vm6rvc5JmJSdGpm/+DL29czh0vc5I+4yPVHUCd7HG+ngMlqmrP8C5W+JgZ3oQQvTunvY
	 tg/AkQRPmbHpe3szK8pMlnWCWPFgttVZA9D2mFzLd0jubUE+fDbiyFF22doKKl5UfAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lyzXtAuw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UDeeynRt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CA5606A320
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:24:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52CA5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lyzXtAuw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UDeeynRt
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAYwF1948477
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xaaScOGIozAWpXbcitdyI9ltdmgfQyDQm9ySsdDqK+0=; b=lyzXtAuw69wpYjha
	pMHrUT0p2kEBkfcfdpMFEmya0cZYYFkuD8waEtPZn8eSr/tFf/UHh7wMg9W0Np4o
	3d9iggS27yhaJeSrOQ6pGSZlwTq9eOiVgulI/UDTpDWy8EM29oaaZGV1uOlASvA8
	kwb2HFQImTUSH6x1r6SMVcF3H4w454jZ+R1l1+v4Vk9PxELDM6SRh3VwYn26SuE/
	SvhBafkK+wOhQTeFBat/qk4Ssn1uqLpzhtei70N1fvnIa+CN1j7iD7Z4Y69tjTl/
	BX7+LiWbWT6S6pg9H0EZp8Hj3FEK8nSdUGBFhUECe+RQn8XylW8Ksy7ugFrVwRKR
	FjBZEQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmtu7fj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:24:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934a8cd3a8bso11813685a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 03:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792751085; x=1793355885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xaaScOGIozAWpXbcitdyI9ltdmgfQyDQm9ySsdDqK+0=;
        b=UDeeynRt5uiutwW4Iob2SlYsnE3oY0X766m7QF5OlhCVKnXa121jYGW2ALZqo93U6i
         5goA0cbNQ6KIrqXens1xkv9vCaH2rtxvfzgBbIrF8mW08+ucWGWD6DhYHWV8NUHChj9G
         lkXtw9SpxVcFbUZFG7ZXF3sLgUEqkv668k2O/HX4WqMH+GSdOpP1x+rwFtO8nyjsrRm1
         8Ejg3z8BqMS5VAYk9rZ1zBhaFdxdlUW8u59B/6PZ2jDdpk6bNVPbLOciycOGyd86nlhU
         fU31j4ySk+KM0bnwYwzhrZ399CI3kDV5pTK78dX7KCrnozaf1+Me5KmQ0bLSvtmcfAWv
         QGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792751085; x=1793355885;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xaaScOGIozAWpXbcitdyI9ltdmgfQyDQm9ySsdDqK+0=;
        b=sbFHfuT+VPKeiGEEmh+KzPi8+jtr+OlqQoYpGHJ2MgKkIZPklfX6Rj5Kile0PLH5v0
         LoRtqsMjZ/301BpomkeY5r0js7s2TQTBmqUKrX6m2Q7LWcELvTAwJUHZloLaKBeCxovz
         dzwXBofxx8PSSsYQjycbauH4iU0gAIB/FXKU8rd6EZCRqU+MsxsPGKYPl/3EHvr5b+cM
         2lM7gjBq68Pt0GPxGCDUUJ+2SEJAOk9S6sYHj7+9hN05IWKGoL6MyuleOW8YnqMErX8V
         EfVyDhh4Z1l+qZMrNwSuRhXMMlovT1T24s1MoeG19HjQ8Vobm7UPzRCFsNZoPJ52KyTP
         I6RA==
X-Gm-Message-State: AFq9FYIBaiOAJQefZXWwYUolcRAKd0BnAxp2bG4MLb6zP+leKvUivltw
	20MgEkKAITazSkW0phdWucKb1Ti/7CL5DD8JW9TvTtB0yOnu0S5vo7nYD8mOrgP70pVEp3dtSVs
	hqdQ8GxIV7Z7fhYLqhUZamtSPt9j9fkvZGQfHUIREGMoxmS+ssCw0LC1QzG3X4itQbNMf
X-Gm-Gg: AYBFou1OeRXdLGOJNbSnOzUXllbIlE6/LBKBhWhvNCHlL7rB1j90FAimeRJk5G/rP95
	H8cvAeEZMdqgsBCIvNc+j6LKB6BaPm2kE+bAT3P3myYmtxRlt8xF531P+F52ny/3+DIaM+MclMl
	2615kUM1Ttytx5I0Pzl14X8Bhl/r61TB/y5vVOhCNRPH9YOaBeztRNq21F1xo53YBPbweK7Fc7x
	ojbE9crNDtU+B8P4di8slagHSfS4b9JaaBQ5+I3+fPw70oGzRst6u4SQl3HSydct5ZlGnPA/UMM
	PglQbE97D4Ro8s2/BJZV8qE1eihgimz2H2uX/xregttIt51k0j1EbHOtA4dH7EkBFxhjaXsalms
	AMdWgEb1VJAa50V88ufZRsQ==
X-Received: by 2002:a05:620a:72c9:10b0:939:c7d1:7471 with SMTP id af79cd13be357-93f6f926212mr320692885a.4.1792751084535;
        Fri, 23 Oct 2026 03:24:44 -0700 (PDT)
X-Received: by 2002:a05:620a:72c9:10b0:939:c7d1:7471 with SMTP id af79cd13be357-93f6f926212mr320688485a.4.1792751083725;
        Fri, 23 Oct 2026 03:24:43 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5cfc82csm85128166b.81.2026.10.23.03.24.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 03:24:42 -0700 (PDT)
Message-ID: <050e53da-4e95-4c45-9b8e-ce3c816fbe90@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:24:36 +0200
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
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: kaanapali-mtp: Enable
 DisplayPort over USB
To: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
 <20261022-kaanapali_dp-v3-5-b5ae8e6083c3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022-kaanapali_dp-v3-5-b5ae8e6083c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb35ed cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=9izfxpSnjEJMC5M6MUYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: zeLhxVC__iqSg9zv1DQ2or5UynnlWXpc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0MCBTYWx0ZWRfXwkL5B/eEOMfT
 wKVWspOHdkCtqjDwkzvqyi/LNBvox2ymGCg4StSwFZpq/zsLSBbBtq66JfEJHqqzhFY6UaNZrri
 hxCu2ZeZzuTL8g0tJqVSIOPMB3yIOruoYEEreoKAupiXaoQD+mnJx6hkOUuZFho8xSYvG/N79G7
 2QeDez+VfF9XKN8ad4KXvACeTap+nLBQ/yrL8HN1n2jUT4OjXzjANb5FvuCKdIcsA1HZfODqI8J
 HZFGc6xCeSebSzSZ0WLf37MOQPfAy6MUtFOh3ZQZs6QRGIbCoIrNuQCFDGEFji/YFi7BHa4DLJR
 QVKqQd5834GQVUabhSVyzTo+UfGG+zdI4U5p/BeKqoTPui1DjFZLkql+rtKYPzEyiVEUG6XyG78
 EdepJ6uRCvWxvHlQhr+tzhG66cAlRaEWoNXGRrabkb4GNls2U3yufDlRXHrnOfoC/rJ/3F8bUvV
 iKtpOuY96FRs6b6Yqwg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0MCBTYWx0ZWRfXyH9OELicL0iD
 pdXCmD42phn8XM2bTTd18u28qPqzSF9auShOC+9pZFSLGvnURCW5TqdU4WIIG0ci0TvbiVZvhW6
 3NqyslsI2q4ura5wqiImecaGAc0BJSU=
X-Proofpoint-ORIG-GUID: zeLhxVC__iqSg9zv1DQ2or5UynnlWXpc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230040

On 10/22/26 11:49 AM, Balaji Kalkonda wrote:
> Hook up DisplayPort parts over Type-C USB on MTP.
> 
> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
