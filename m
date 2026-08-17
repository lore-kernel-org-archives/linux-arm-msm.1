Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B613C2BB4
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 08:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786957021; cv=none; b=fFTg7C9G6K2Z/ZuL57BdObkMIhm4SsctCaesbMqdscOtudUerc9MbzA2ASk/2XyKgbvzcoCO1LRcE4EtiCCi972IjrWgSvvyyJ5WjMPQynWzbYzYmiqmBG8lHyqtZ17zW7QlQIdtkhlhCDJGzlAFl0ZQuOr1eYz7T7MZEHw+Cbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786957021; c=relaxed/simple;
	bh=chVjGrHi8hL8HNAXLsxf5LC2Xz/3cL5h8M1X7lFBoOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U1U5J7lBUKF/jpAg0blXHqwEO/4p11m13c3s5qa43d0YsVZF4KMGy1m9GuscCRuUB0kbB3Wk2wNH5QJYtvIE5XDJ80GMV0QvuQTZzLBU0Z4LOkJjHy0gr0rmBF8vfVmeMFUcDBGKiz3S4zw0jk6B7njtLtSdXJtcNnPCiPPd7BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ewkuABWT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fXq5S7zJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ewkuABWT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fXq5S7zJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H8Ziht1323712
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 08:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aDIikrNXALA9ripEZXovggm49pwZypGzDJlATaT0TMg=; b=ewkuABWTflNhPX87
	6fMRiZKezTyGNsZObxtxnmEZeoHT5ErVFZRjYO3RLfo3oU9ZJIBcrdBjmV1qatt6
	FvUGFX41945jfTUdqZ6aaVvBTw9VR+iGGjRCOh7GiPv/d8Qv0DeLPqLyBCDecWud
	a3OpFr1MXYkIVXUyl7ma47FJgU2cY4p4CUsrAy3h5uyj7htIB/QSFqcVhqxBBC26
	MFrzMTwhGGQ00cZKHctZ9RqzFB00YJq9WL4PW2VuatxM7ridAJoftDbhwhNJ8CO0
	VnKUhcKsZN1/WNKejR+136rHhaPnRdbib+mhFz0gVyYUXT2UNE2KPqw7T8dRdefd
	KTE03Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xx7g2k1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 08:56:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1e777a15so8855641cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 01:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786957018; x=1787561818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aDIikrNXALA9ripEZXovggm49pwZypGzDJlATaT0TMg=;
        b=fXq5S7zJwaB+1s0gNEHmjocZ+amlmJV7B5b1OO2Z0YGTjE2JMEjspjrB5qewpa0GgO
         4PRwPAXFCseO9G8/WhP/dJMhaMgrjmA0hU7rnZgK4lSY7/+BTgLC4K42bmnSMOWCFIvQ
         QMKbQ/t35uQcjlojEA53qaiXXy01l34PUOLvGkp9hUdPX/kQ95MxJlR8U+opRGtft3eF
         j/Cn30bPofkiZgmDDj7eO51twpyxtCpvA/L8Mm/AYrl2PU9SUlLE14wjBzid5D1WHs/s
         rvI1TcLLUxFZCTlryc4q//BmOuk/6XRtEYEGjCV21mwmKWuH6ETlOIU0qosAil/vktoA
         tRwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786957018; x=1787561818;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aDIikrNXALA9ripEZXovggm49pwZypGzDJlATaT0TMg=;
        b=U3YfDiSTTqizh3FNGHTEP6yqZJvDhUyv//FyY9MqZ5cc7R1rVFAmplgcRHG0/ngKhY
         Y1VFnaE0SCARhuS6qkq7CVRMpptTDKy0MCrKVZKga4B9HJkR0lXiBz/y+PGJgiBvwIS+
         I4yQ4V05zwixTU3jXImOBu0cCl7x5HGYYsLvtqlfa5UmXxTjprk8VPu1/V5cD6vQA2dS
         R7qHLVtUtisjs2GpmBNtSCvcLXk7JvBqz0NkzVN1oTtVOtA3FX7FnEuOCNw4ccTcXYnH
         6U5Bqj8EeUSnTn+u9wElYsnhYljLcYCK3IOGZ469P0piIQURfXZ3Sv53CSdwYAkwDr5W
         5zJg==
X-Gm-Message-State: AOJu0YzVNjCaiWY3FB0gICGH/KsBttqE5JucdnojjAy/DjgNHw7Wmhli
	vfO07THf7hpYrwe5E9soTmmY6UULbB7w58AqH1aCk3Rc3h6oM/GcV39rjVspNleTeoJRF9whJSl
	TwbCeIQ17BREx/HPmEtkD6z1nkC71ELyAVbAWe9Jvfiiebu4/bvwBbVR70IWU1WKTkKYr
X-Gm-Gg: AR+sD11UsVvVVwaIndInJ4yDJPi5L5eHGtI8kCTFcHYq4T19n9o0gNC/ln5fRjjwTuC
	9WT4zNZpFW19b0OCQz86iv9e5R4e1hMsn5IIrFnMpXf/3ZbT9Le2UHvFLh6kyn7irO5rphPsXZz
	nQ2fOzLb1pIc9sRJtODUDNTS2sBbJdkM9nkr7hwi1Ta8IbsEmj3RxeVPy+qzjr7QBa5Wq5XQFBd
	IkfmJdVv3aqLhaV41BX2mpkhm0HLG47STNq07/AWO0Ts+AeeT5TKV9JrmYUylv+UPsz7ArbMAcF
	pSi5N+MIk7AKySzXQhgxS3WUL0j+UXUxJ9Z0gHg/OkRTnE1xRhSfq82VYKssjKv/dRNZV8MszAY
	98uC0YBKK1V5p+1rnsZs3QLmH
X-Received: by 2002:a05:622a:118f:b0:528:1ea6:eaee with SMTP id d75a77b69052e-52d852b4f2bmr159908851cf.1.1786957018206;
        Mon, 17 Aug 2026 01:56:58 -0700 (PDT)
X-Received: by 2002:a05:622a:118f:b0:528:1ea6:eaee with SMTP id d75a77b69052e-52d852b4f2bmr159908721cf.1.1786957017840;
        Mon, 17 Aug 2026 01:56:57 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fe7c8dfsm25074266b.8.2026.08.17.01.56.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 01:56:57 -0700 (PDT)
Message-ID: <c6f35c66-a489-4404-bfd5-506174b49b53@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 10:56:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: QCOM interfaces should depend on ARCH_QCOM
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <888efe8e63b6a18fae4acd5a90a1e0e69dcdf2ca.1786012495.git.geert+renesas@glider.be>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <888efe8e63b6a18fae4acd5a90a1e0e69dcdf2ca.1786012495.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA2NiBTYWx0ZWRfXyzeSn026xD/B
 /fmgo3Ndl+QOMArDuUHLpfpB1dBz7ux9uX3gddCaudF+vcL8Nz1KfpF+1zVdGCfiDV0QIZNSMbp
 o0tOF1HOaHGXxOG9yqHwrWmwt3tLkiA=
X-Authority-Analysis: v=2.4 cv=TK91jVla c=1 sm=1 tr=0 ts=6a82ccdb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=3ImISe4MDvEodWLrb7UA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: paR-y0G2PUGXAABZVSzlZ8tpQdlLlofg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA2NiBTYWx0ZWRfX5mzaqvd9Hkdw
 Hcw0oZE4iFj5agVhh7aNCy6e2DAeBDUYfRbDDQ/6XeSm8HAjCzevHcC//aBdqM9mCI6dgeic4/p
 3PX1UpdW1vB9miZCvCy7w0Dc53UKlI7s6hL+gtjM/8IbT47DhqPB3ONEiZ6JFFN7vTamS/lyfhj
 dtWaEI8Dv6Wb/ewvowJao2XkpHwuvVat6IPU/Y+brUIsurMi/DLTNtYkWjsonkqAgzhrboa9axN
 iXXUwZay0vQM3SdCtVLM5itjw8BxGSYYbomDMHE0X4CQVZ81U4+DQu5mZxZE2Th3/HjOQjUn7kr
 ZFjCiCLhfQKF4+YMmMmEI2RtbjcYWaL5swgcvRKEHLV1nGa+6TAPGab8v7qnLABn4u7ec2H9hqV
 1Abg9FpAe67yX4xWlPXV7A+A0/oYy+7hCcWa9kJapgP0sR1+pQ9is2J2/9hXRpHveBucqV/bA6x
 q93Kg03I1M6fPGrPfYQ==
X-Proofpoint-ORIG-GUID: paR-y0G2PUGXAABZVSzlZ8tpQdlLlofg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170066

On 8/6/26 12:35 PM, Geert Uytterhoeven wrote:
> The various Qualcomm firmware interfaces are only present on Qualcomm
> systems.  Hence add dependencies on ARCH_QCOM, to prevent asking the
> user about them when configuring a kernel without Qualcomm SoC support.
> Make QCOM_PAS invisible instead, as it is already selected by its users
> when needed.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> I wondered whether QCOM_SCM should be made invisible, too, as it seems
> to be selected by its users? But apparently commit 5c1a2975d23c51c0
> ("firmware: qcom_scm: Migrate to generic PAS service") in net-next/main
> and soc/for-next made it visible on purpose?

For some context, that commit was part of a series that introduced a
second back-end to the functions that previously only the QCOM_SCM
driver provided ("qcom proprietary TZ interface" vs "what TF-A is
going to provide"), and the author's intention was to make the
former possible to disable

Konrad
