Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098757;
	b=dViMES3JMdjt5ofKmIbaGngidUtI/VTs/d+jtU/CkLvfkxNyWe5fklLojfHQ6dr6gmYU
	 lVj+PtHHPIKhlzb2r9c/HC/Picrlz2AvVQv0IWhU+8LDR4uGlnwHVVGC8DvFGu+FfHpNv
	 hm8oh9cqYc6yqJWpImpMiTF1VB/hlL1f2whRAYnvfsVCkyZq8LLWM3ZYH1KFPOwcezQBw
	 NWtHcUJUFJm9vs22+BeJqERbZbkR6QxeHZN92nG88ZNcQd6I7qvma0gMCQBf3p9CpKkhX
	 RjMI/MamKpuVVN//8Zkh0kY2euPHRG2CO8IfT8GR/ElaOQ85gibATHk7Gwm8/ux6wUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098757;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=k9sribCAPn1TvRcyAr4unCppr0dTL3yEaXFx3Qc1128=;
	b=u2odDYQl9/D9F2P8ENUWvFPLQw1Zd5atUtM3IgDmhLYcTaHgiyE9x2eoz29U+al7A4z5
	 s/DsMhJuhNs+sSoMW6n+T6qkmZSm0i4FGGiz0j9iam73qfewRfieaAQQnOEURkpVbFPAg
	 oAp5Ok13HF+Iz2fIhRlNjikVUXMNI98MQxJcTmOq55r0A15lrpSq1dulYCzZGZgUVrGzy
	 JyFHx/7BS9QMA9sPEc+9fr5bsHR2WPiK02itH7r/qVebaawnY+6IWsRaPGNIh0mxsCCMG
	 ZVRbxYWpFLq7A55pMgkWm+E6uYy6l3ohT5Ypz3WEXCVAXjy/aUhNeGLWd7dTq9KHPnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g2NsaQRe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RWOcz0YC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21920606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 10:59:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21920606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g2NsaQRe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RWOcz0YC
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeBPj3012001
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 10:59:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k9sribCAPn1TvRcyAr4unCppr0dTL3yEaXFx3Qc1128=; b=g2NsaQReJ36rM/Hw
	ANtKXnFgPvPjpLlr1QmogjS42TTmdSuN5EMeyL4OMzU1NqjBitT0xlH1SYJUO8gs
	rY/P+vC15kNgOHSXXkigaUL+sWgqFwFtNLoG+KzKeal1HYp9Ar7kR+xksi9atzNN
	2krbgZUxVuLT8z9RZ4kv/FzEb1kL9QoTvu8DciIqEvVZB6Is8zLJkODgwn7lxNj9
	ei50p2n9LxI+s3TE3IstWDSg3lTBBuh3K/G/yaHUDJxw0FCganS8N+c/HWno3nE3
	amgBCr5HTRqhEiDmjMAIzIytndhN5fF50tWADHyiC6Og5O5yaPSPosAIaOAfvoEG
	qOhSOg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hje3dans3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 10:59:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-943fffbc5dbso2866185a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 03:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793098755; x=1793703555; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k9sribCAPn1TvRcyAr4unCppr0dTL3yEaXFx3Qc1128=;
        b=RWOcz0YCAQ5klaOesGNOW8t3k/YC98NFY4jWZ1cQ8PA9um8fx3MhAVSv6T6Q9WjEV4
         r4QX59QSBJs0jcGEe/8iCJQPDyAFNDN8s3P4c2w+Wg0UHCSGtqUfRdcaSFMa9wfxNEZ5
         AOHFZ2lMd9uOwvGfg2+cyvdSufnogMYAk/LW2lkV7JmImW4cn6yj3cSIA4jAm/8sjI7O
         lwM5T0rqrENnjZl18E4RgEEmf4U9T/IRwk6YSruS0Qjx5BbI2A0MuZXpcH/9d3GJyIoH
         0XOTDxJE600/sW8WX7D39pBu7eqRsiqZb4Pd0N+LSRpinH7S5HHHS274uuNZb/6E1pEA
         Prjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098755; x=1793703555;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k9sribCAPn1TvRcyAr4unCppr0dTL3yEaXFx3Qc1128=;
        b=nYiaoBsWzdBnNOhIRTOT70IvnE5sgto8icUEAEjtySeYP6/AU7NuygWITHWRFRnL/2
         TYuSLGsgh7HHX599ESqYQcXPp5h6LQXWjo8JaH6TMITv2/FHqt5Bc9v2MwlzSA0f6qc2
         JDQtc+Int0ie6Nopkz5tZK8U2J9zffq0hGYKhif9fERRQGYY3aQaBGcEmbTMK3ZYCUxt
         sFb+CyK9IVkGkR0zwpocBkLOnyYmWSyhlCBoQuZOX09D7MiitJ52JR9vMjePvZMOwysa
         vo6EJqM8OF22RcW4kPAjh4bSTsJg8vBfAjLg6dLJmpknAwUTwdRpcw35KhPMr/Rb0kwi
         mtJw==
X-Forwarded-Encrypted: i=1; AKwUvByv4pHyyDxvWNJoZQJOD+GnGHnh/kuZJfY8Ui2ohxVdvfh3YqpgZxpbivpSdmhXGukyleU5HhzKcCGp5Ugg@vger.kernel.org
X-Gm-Message-State: AFq9FYLzb8M1l2YqBbX6jWNs/kYLOhffq0fdt6IofrqmuxoCVvvCRFRb
	FycDX3Ls5Z2vD8p04dpihyiMaLIafOVObsYAJ4UaGOSz/xD8bTJ7osOkTeW49CmcJ3WmQzWwEqI
	+7IpaZMFZ3g4g885tBxvRuo0tuXeesCNutu/HXuK7RLWb+QGNmXZG0IDj/OoMwEdV4HDb4chx0d
	9P
X-Gm-Gg: AYBFou0VqC8zGjIt71KKwwO5K5kg9mptXFedanIj/FzzkEZMxeUe7by817o5LibDL3W
	gWua0aiQKKaEcxeNHY28EOKgZsyTPHAxlWs3VkTalbsNZTHzmqA81YOTzQc0toAp76ggP7ng4SE
	dBxpzmRnQVr90NeZ8CqHibtEWaVuO/qJdswfTlWWH3LOHzn/6LT7CO8HsG8R5FLlTpqY4N4qa00
	uk2jtXUUcFD5OjRKHGodZpvnCEYDEeHLJbc7DXAzpP6LcxujUVILWRxszE2ouzTTox5SlUXW0vQ
	+r4TQ9NPBSG6V31Cn5FcGeRZZMKBQw9kSXIfUfe5Lhbl1L3peWQPj5AZ3aaOAoyWGR7m35hpYMH
	qqV0HBX125AwfV/PssjDrig==
X-Received: by 2002:a05:620a:57d1:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-940ef915dc2mr1731204885a.4.1793098755292;
        Tue, 27 Oct 2026 03:59:15 -0700 (PDT)
X-Received: by 2002:a05:620a:57d1:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-940ef915dc2mr1731203185a.4.1793098754937;
        Tue, 27 Oct 2026 03:59:14 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7bbdc6sm431186966b.87.2026.10.27.03.59.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 03:59:14 -0700 (PDT)
Message-ID: <3351a7c6-6dee-403d-a8be-57714397144c@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:59:11 +0100
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
Subject: Re: [PATCH v2 3/4] clk: qcom: gcc-ipq8074: Align CMN PLL inputs with
 binding
To: Robert Marko <robimarko@gmail.com>, andersson@kernel.org,
        abelvesa@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, ansuelsmth@gmail.com, john@phrozen.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261026120920.1667982-1-robimarko@gmail.com>
 <20261026120920.1667982-3-robimarko@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261026120920.1667982-3-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX3PPyzCSqyev3
 cC4Mg3cBiGtJUCSnlR9TylQquyfhvCGTaQjawOkNFg3612CvaU1QqKZS8vgqrpWCwnjhIgyIlfw
 ZV5fZ9q4aajskryGn7AZzGt4pDp9f4s=
X-Proofpoint-GUID: BpD1murNjsvgEGneIhAuPv9DkonBvHcP
X-Proofpoint-ORIG-GUID: BpD1murNjsvgEGneIhAuPv9DkonBvHcP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX09kXtgP1HNho
 1ZznKdOjApS3+OgP1dMFkfX7QcssOspdpE+gjbczL2iRlRTYrT2yyjqnrYVuOkHUgjAQRx1KMCH
 zw05IcWJdoXuB2lQ3Nx+IpSa8aLIpDcjGO4MNJyoIQ8uth/NjppHEqlqxson19xnahwJWhq7j/W
 oOpV9HRBBXX1/m3kKkJ4OUNCSzNR7hyurfdU2no8J/+YJ1S9qzRiCMuD+hoCeHwCwgrm4P8zm8v
 /XGvPiBOVlYkYWtaU2q5UGRYgWBj32MSZX/5FYnr6WQZjTCnhtakyNvt+KgfSu7yWdiC0vsTPgu
 pGtlIOqb5RjTDLznbE1YfSaheTpdFJ9Jdh2sCmmOqiYcfOxMekV4UfFF+7qYTNPf4XIMmY5p7YN
 iCr6ETbYmVHI/bjuv1QPhDiwK3lPpMa7fEIKPv3VcxbbR5bvPJCyfJqJq8d92KRYjS+V1qzrndd
 iEPJrffkrbmnUmGm/Jg==
X-Authority-Analysis: v=2.4 cv=SN/Xx+vH c=1 sm=1 tr=0 ts=6ae08404 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=oPNFLItuUPTHsqlAT3AA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270043

On 10/26/26 1:08 PM, Robert Marko wrote:
> The GCC binding names the CMN PLL inputs bias_pll_cc and
> bias_pll_nss_noc. Use those names as fw_name so GCC resolves the
> clocks through DT references.
> 
> Keep the existing .name values as fallbacks for older device trees
> without these optional inputs.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
